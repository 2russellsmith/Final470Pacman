from game import *


class Agent:
    def __init__(self, index, isPacman=False):
        self.index = index
        self.isPacman = isPacman
        self.location = Location(0, 0)

    def takeAction(self, gameState):
        return


class PacmanAgent(Agent):
    def __init__(self, index):
        Agent.__init__(self, index)

    def takeAction(self, gameState):
        return Directions.NORTH


class GhostAgent(Agent):
    def __init__(self, index):
        Agent.__init__(self, index)
        self.chaseMode = False

    def takeAction(self, gameState):
        return Directions.SOUTH


class AgentState:
    def __init__(self, location):
        self.location = location
        self.color = (255, 255, 255)
