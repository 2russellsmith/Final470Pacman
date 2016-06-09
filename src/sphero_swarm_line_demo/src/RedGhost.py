from agents import GhostAgent
from game import Location

class RedGhost(GhostAgent):
    def __init__(self):
        GhostAgent.__init__(self)
        self.name = "RedGhost"

    def getGoal(self, gameState):
        if GhostAgent.chaseMode:
            return gameState.gameBoard.getNode(Location(row=0, col=18))
        return gameState.gameBoard.getNode(gameState.getPacman().location)
