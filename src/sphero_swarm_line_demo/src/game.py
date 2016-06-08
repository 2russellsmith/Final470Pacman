import os


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


class GameNode:
    def __init__(self, isWall=False, hasFood=False):
        """Initializes a Pacman grid cell with information about what it contains (food or a wall)

        :param isWall: True if this node is a wall
        :param hasFood: True if this node has food
        """
        self.children = []
        self.isWall = isWall
        self.hasFood = hasFood
        self.location = (-1, -1)

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
    def __init__(self):
        self._board = None
        self.initializeBoard()

    def initializeBoard(self):
        """Initializes the board from the layout.txt file"""
        with open(os.path.join(os.path.dirname(__file__), 'layout.txt'), 'r') as f:
            lines = f.read().split('\n')

        # setup the board
        self._board = []
        for line in lines:
            row = []
            for character in line:
                if character == '.':
                    row.append(GameNode(hasFood=True))
                elif character == ' ':
                    row.append(GameNode())
                elif character == '%':
                    row.append(GameNode(isWall=True))
            self._board.append(row)

        # initialize node children
        for rowIndex, line in enumerate(self._board):
            for colIndex, node in enumerate(line):
                neighborLocations = self.getNeighborCoordinates(rowIndex, colIndex)

                children = []
                for row, col in neighborLocations:
                    children.append(self._board[row][col])
                node.children = children

    def getNode(self, location):
        """Gets the node at a given location

        :param location: the location to get
        :return: the node at a given location
        """
        """Gets the node at the given location"""
        return self._board[location[0]][location[1]]

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
        return [(row, column) for row in range(self.getBoardHeight()) for column in range(self.getBoardWidth()) if self.hasFood(row, column)]

    def _isInBoard(self, row, col):
        """Determines if the given location is inside the board

        :param row: the row of the location
        :param col: the column of the location
        :return: True if the given location is inside the board
        """
        return 0 < row < self.getBoardHeight() and 0 < col < self.getBoardWidth()

    def getNeighborCoordinates(self, row, col):
        """Gets the locations that neighbor the given location that are traversable

        :param row: the row of the given location
        :param col: the column of the given location
        :return: the neighboring locations
        """
        possibleMoves = [(row - 1, col), (row + 1, col), (row, col - 1), (row, col + 1)]
        return [(row, col) for (row, col) in possibleMoves if self._isInBoard((row, col)) and self.isTraversable(row, col)]

    # TODO are these two methods used? They look incorrect (setting a node, not a string)
    def getValueAt(self, row, col):
        return self._board[row][col]

    def updateAt(self, row, col, newValue):

        self._board[row][col] = newValue

    def isTraversable(self, row, col):
        """ Determines if the board is traversable at a location

        :param row: the row to check
        :param col: the column to check
        :return: True if the board is traversable at the given location
        """
        return not self._board[row][col].isWall

    def hasFood(self, row, col):
        """:return: true if the board has food at the given row and column"""
        return self._board[row][col].hasFood

    # TODO this doesn't work, since the board holds nodes, not strings
    def processPacmanMove(self, row, col):
        if self.hasFood(row, col):
            self._board[row][col] = " "


class GameState:
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

    def hasFood(self, row, column):
        """Determines if the board has food at the given location

        :param row: the row to check
        :param column: the column to check
        :return: True if the board has food at the location, false otherwise
        """
        return self.gameBoard.hasFood(row, column)

    def getFoodLocations(self):
        """Gets the locations of food on the board

        :return: the locations of food on the board
        """
        return self.gameBoard.getFoodLocations()
