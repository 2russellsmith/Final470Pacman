from Lab2.AController import Node

class Directions:
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
        self.children = []
        self.isWall = isWall
        self.hasFood = hasFood
        self.location = (-1,-1)


class GameBoard:
    def __init__(self):
        self._board = self.initializeBoard()

    def initializeBoard(self):
        lines = []
        with open('layout.txt', 'r') as f:
            lines = f.read().split('\n')

        # setup the board
        board = []
        for line in lines:
            row = []
            for character in line:
                if character == '.':
                    row.append(GameNode(hasFood=True))
                elif character == ' ':
                    row.append(GameNode())
                elif character == '%':
                    row.append(GameNode(isWall=True))
            board.append(row)

        # initialize node children
        for rowIndex, line in enumerate(board):
            for colIndex, node in enumerate(line):
                neighborLocations = self.getNeighborCoordinates(rowIndex, colIndex)

                children = []
                for row, col in neighborLocations:
                    children.append(self._board[row][col])
                node.children = children

        return board

    def getNode(self, location):
        return self._board[location[0]][location[1]]

    def getBoardHeight(self):
        return len(self._board)

    def getBoardWidth(self):
        return len(self._board[0])

    def getNeighborCoordinates(self, row, col):
        result = []

        if row > 0:
            result.append((row - 1, col))

        if row < self.getBoardWidth() - 1:
            result.append((row + 1, col))

        if col > 0:
            result.append((row, col - 1))

        if col < self.getBoardHeight() - 1:
            result.append((row, col + 1))

        return result

    def getValueAt(self, row, col):
        return self._board[row][col]

    def updateAt(self, row, col, newValue):
        self._board[row][col] = newValue

    def isTraversable(self, row, col):
        return self.hasFood(row, col) or self._board[row][col] == ' '

    def hasFood(self, row, col):
        return self._board[row][col] == '.'

    def processPacmanMove(self, row, col):
        if self.hasFood(row, col):
            self._board[row][col] = " "


class GameState:
    def __init__(self, agents):
        self.agents = agents
        self.gameBoard = GameBoard()
        self.score = 0

    def containsPacman(self, location):
        for agent in self.agents:
            if agent.isPacman:
                if agent.location == location:
                    return True
        return False

    def containsGhost(self, location):
        for agent in self.agents:
            if not agent.isPacman:
                if agent.location == location:
                    return True
        return False

    def getPacmanLocation(self):
        for agent in self.agents:
            if agent.isPacman:
                return agent.location

    def getGhostLocations(self):
        locations = {}
        for agent in self.agents:
            if not agent.isPacman:
                locations[agent] = agent.location
