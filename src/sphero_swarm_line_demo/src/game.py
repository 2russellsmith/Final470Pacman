import os, math
from PacmanGUI import PacmanGui


class Directions:
    """
    The different directions possible in Pacman, along with helper utilities
    """
    NORTH = 'North'
    SOUTH = 'South'
    EAST = 'East'
    WEST = 'West'
    STOP = 'Stop'

    LEFT = {NORTH: WEST,
            SOUTH: EAST,
            EAST: NORTH,
            WEST: SOUTH,
            STOP: STOP}

    RIGHT = dict([(y, x) for x, y in LEFT.items()])

    REVERSE = {NORTH: SOUTH,
               SOUTH: NORTH,
               EAST: WEST,
               WEST: EAST,
               STOP: STOP}


class GameConditions:
    WIN = 'Win'
    LOSE = 'Lose'
    PLAYING = 'Playing'


class Location:
    def __init__(self, x=-1, y=-1, row=-1, col=-1):
        if x != -1 and y != -1:
            self._x = x
            self._y = y

        elif row != -1 and col != -1:
            self._x = col
            self._y = row

        else:
            raise Exception("You freaking suck at life")

    def __eq__(self, other):
        return self.getX() == other.getX() and self.getY() == other.getY()

    def __ne__(self, other):
        return not self.__eq__(other)

    def __str__(self):
        return "(x=%s, y=%s)" % (self.getX(), self.getY())

    def __hash__(self):
        return self.getX().__hash__() * self.getY().__hash__()

    def getX(self):
        return self._x

    def setX(self, x):
        self._x = x

    def getY(self):
        return self._y

    def setY(self, y):
        self._y = y

    def getRow(self):
        return self.getY()

    def setRow(self, row):
        self.setX(row)

    def getCol(self):
        return self.getX()

    def setCol(self, col):
        self.setY(col)

    def createDiscretized(self):
        x = int((self._x - GameBoard.minX) / GameBoard.cellWidth)
        y = int((self._y - GameBoard.minY) / GameBoard.cellHeight)
        return Location(x=x, y=y)

    def createNonDiscretized(self):
        x = (self._x + .5) * GameBoard.cellWidth + GameBoard.minX
        y = (self._y + .5) * GameBoard.cellHeight + GameBoard.minY
        return Location(x=x, y=y)


class GameNode:
    def __init__(self, isWall=False, hasFood=False, location=None):
        """Initializes a Pacman grid cell with information about what it contains (food or a wall)

        :param isWall: True if this node is a wall
        :param hasFood: True if this node has food
        """
        self.children = []
        self.isWall = isWall
        self.hasFood = hasFood
        self.location = location

    def __str__(self):
        """Returns the textual representation of this node, as used in the layout.txt file.

        :return: the textual representation of this node
        """
        if self.hasFood:
            return "."
        elif self.isWall:
            return "%"
        return " "


class GameBoard:
    boardWidth = 0
    boardHeight = 0
    cellCountX = 19
    cellCountY = 9
    cellWidth = 0
    cellHeight = 0
    minX = 1000
    minY = 1000
    maxX = 0
    maxY = 0

    def __init__(self):
        self._board = None
        self.initializeBoard()

    def initializeBoard(self):
        """Initializes the board from the layout.txt file"""
        with open(os.path.join(os.path.dirname(__file__), 'layout.txt'), 'r') as f:
            lines = f.read().split('\n')

        # setup the board
        self._board = []
        for rowIndex, line in enumerate(lines):
            row = []
            for colIndex, character in enumerate(line):
                if character == '.':
                    row.append(GameNode(hasFood=True, location=Location(col=colIndex, row=rowIndex)))
                elif character == ' ':
                    row.append(GameNode(location=Location(col=colIndex, row=rowIndex)))
                elif character == '%':
                    row.append(GameNode(isWall=True, location=Location(col=colIndex, row=rowIndex)))
            self._board.append(row)

        # initialize node children
        for rowIndex, line in enumerate(self._board):
            for colIndex, node in enumerate(line):
                neighborLocations = self.getNeighborCoordinates(Location(row=rowIndex, col=colIndex))

                children = []
                for location in neighborLocations:
                    children.append(self.getNode(location))
                node.children = children

    def getNode(self, location):
        """Gets the node at a given location

        :param location: the location to get
        :return: the node at a given location
        """
        """Gets the node at the given location"""
        return self._board[location.getRow()][location.getCol()]

    def getBoardHeight(self):
        """Gets the height of the board

        :return: the height of the board
        """
        return len(self._board)

    def getBoardWidth(self):
        """Gets the width of the board"""
        return len(self._board[0])

    def getFoodLocations(self):
        """Gets the locations of food in the board

        :return: the locations of food in the board
        """
        return [Location(row=row, col=column) for row in range(self.getBoardHeight()) for column in range(self.getBoardWidth()) if self.hasFood(Location(row=row, col=column))]

    def _isInBoard(self, location):
        """Determines if the given location is inside the board

        :param row: the row of the location
        :param col: the column of the location
        :return: True if the given location is inside the board
        """
        return 0 < location.getRow() < self.getBoardHeight() and 0 < location.getCol() < self.getBoardWidth()

    def getNeighborCoordinates(self, location):
        """Gets the locations that neighbor the given location that are traversable

        :param location: the base location
        :return: the neighboring locations
        """
        row = location.getRow()
        col = location.getCol()
        possibleMoves = [Location(row=row - 1, col=col),
                         Location(row=row + 1, col=col),
                         Location(row=row, col=col - 1),
                         Location(row=row, col=col + 1)]

        return [Location(row=row, col=col) for location in possibleMoves if self._isInBoard(location) and self.isTraversable(location)]

    def isTraversable(self, location):
        """ Determines if the board is traversable at a location

        :param location: because I care
        :return: True if the board is traversable at the given location
        """
        return not self._board[location.getRow()][location.getCol()].isWall

    def hasFood(self, location):
        """:return: true if the board has food at the given row and column"""

        row = location.getRow()
        col = location.getCol()
        return self._board[row][col].hasFood

    def eatFood(self, location):
        row = location.getRow()
        col = location.getCol()

        if self.hasFood(location):
            self._board[row][col].hasFood = False
            return True
        return False

    def processPacmanMove(self, location):
        row = location.getRow()
        col = location.getCol()

        if self.hasFood(location):
            self._board[row][col].hasFood = False

    @staticmethod
    def calculateBoardSpace(tagLocations):
        """Calculates the minimum and maximum dimensions in x and y for the board, based on the four corner april tags. This will work as long as at least two opposite-corner april tags are recognized
        properly. This also depends on PacmanGui.cornerTagIds. This dict has to be correctly set to reflect which tags are in the corners.
    
        :param tagLocations: all of april tag locations
        """
        for location in tagLocations:
            if location.getX() < GameBoard.minX:
                GameBoard.minX = int(math.ceil(location.getX()))
            if location.getY() < GameBoard.minY:
                GameBoard.minY = int(math.ceil(location.getY()))
            if location.getX() > GameBoard.maxX:
                GameBoard.maxX = int(math.ceil(location.getX()))
            if location.getY() > GameBoard.maxY:
                GameBoard.maxY = int(math.ceil(location.getY()))

        # calculate the height and width of the board according to tag corner positions
        GameBoard.boardWidth = abs(int(math.ceil(GameBoard.maxX - GameBoard.minX)))
        GameBoard.boardHeight = abs(int(math.ceil(GameBoard.maxY - GameBoard.minY)))

        # calculate the height and width of the boxes to be drawn
        GameBoard.cellWidth = int(math.ceil(GameBoard.boardWidth / GameBoard.cellCountX))
        GameBoard.cellHeight = int(math.ceil(GameBoard.boardHeight / GameBoard.cellCountY))


class GameState:
    POINTS_FOR_PELLET = 10

    def __init__(self, agents):
        self.agents = agents
        self.gameBoard = GameBoard()
        self.score = 0

    def containsPacman(self, location):
        """ Determines if pacman is at the given location

        :return: True if pacman is at the given location
        :param location: the location to check
        """
        return self.getPacman().location == location

    def containsGhost(self, location):
        """ Determines if a ghost is at the given location

        :return: True if a ghost is at the given location
        :param location: the location to check
        """
        return sum([1 for x in self.agents if x.location == location and not x.isPacman]) > 0

    def getPacman(self):
        """Gets Pacman

        :return: Pacman
        """
        for agent in self.agents:
            if agent.isPacman:
                return agent

    def getGhosts(self):
        """Gets a list of the ghosts

        :return: a list of the ghosts
        """
        return [x for x in self.agents if not x.isPacman]

    # deprecated
    def hasFood(self, location):
        """Determines if the board has food at the given location

        :param row: the row to check
        :param column: the column to check
        :return: True if the board has food at the location, false otherwise
        """
        return self.gameBoard.hasFood(location)

    def getFoodLocations(self):
        """Gets the locations of food on the board

        :return: the locations of food on the board
        """
        return self.gameBoard.getFoodLocations()

    def processPacmanLocation(self):
        # test for death
        ghostLocations = [ghost.location for ghost in self.getGhosts() if ghost.location is not None] \
                         + [ghost.nextLocation for ghost in self.getGhosts() if ghost.nextLocation is not None]
        if self.getPacman().location in ghostLocations or self.getPacman().nextLocation in ghostLocations:
            return GameConditions.LOSE

        # eat food
        if self.gameBoard.eatFood(self.getPacman().location):
            self.score += GameState.POINTS_FOR_PELLET

        # test for victory
        if len(self.getFoodLocations()) == 0:
            return GameConditions.WIN

        return GameConditions.PLAYING
