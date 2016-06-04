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


class Location:
    """Discretized point"""

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __ne__(self, other):
        return not self.__eq__(other)

    def __str__(self):
        return "(%s,%s)" % (self.x, self.y)


class GameBoard:
    def __init__(self):
        self._board = self.initializeBoard()

    def initializeBoard(self):
        board = []
        with open('layout.txt', 'r') as f:
            lines = f.read().split('\n')
            for line in lines:
                board.append(list(line))
        return board

    def getValueAt(self, x, y):
        return self._board[x][y]

    def updateAt(self, x, y, newValue):
        self._board[x][y] = newValue

    def isTraversable(self, x, y):
        return self.hasFood(x, y) or self._board[x][y] == ' '

    def hasFood(self, x, y):
        return self._board[x][y] == '.'


class GameState:
    def __init__(self, agents):
        self.agents = agents
        self.gameBoard = GameBoard()

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
