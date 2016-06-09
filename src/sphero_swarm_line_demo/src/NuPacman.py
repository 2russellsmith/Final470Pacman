from agents import PacmanAgent


class NuPacman(PacmanAgent):
    def __init__(self):
        PacmanAgent.__init__(self)
        self.safeDistance = 4

    def getMove(self, gameState):
        board = gameState.gameBoard
        redMove = gameState.agents[1].getMove(gameState)
        pinkMove = gameState.agents[2].getMove(gameState)
        move = self.location
        for location in board.getNeighborCoordinates(self.location):
            if board.hasFood(location) and \
                            self.manhattan(redMove, location) > self.safeDistance and \
                            self.manhattan(pinkMove, location) > self.safeDistance:
                move = location
                break
        return move
