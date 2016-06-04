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
        self._board = {}

    def initializeBoard(self):
        return




class GameState:
    def __init__(self, agents, gameBoard):
        self.agents = agents
        self.gameBoard = gameBoard

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

    def getPacmanLocations(self):
        for agent in self.agents:
            if agent.isPacman:
                return agent.location

    def getGhostLocations(self):
        locations = {}
        for agent in self.agents:
            if not agent.isPacman:
                locations[agent] = agent.location
