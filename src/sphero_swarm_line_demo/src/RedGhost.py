from agents import GhostAgent


class RedGhost(GhostAgent):
    def __init__(self):
        GhostAgent.__init__(self)
        self.name = "RedGhost"

    def getGoal(self, gameState):
        if GhostAgent.chaseMode:
            return gameState.gameBoard.getNode((0, 18))
        return gameState.gameBoard.getNode(gameState.getPacman().location)
