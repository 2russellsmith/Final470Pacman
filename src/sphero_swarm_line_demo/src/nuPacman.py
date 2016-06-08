from agents import PacmanAgent


class nuPacman(PacmanAgent):
    safeDistance = 4

    def __init__(self, index):
        PacmanAgent.__init__(self, index)

    def getMove(self, gameState):
        board = gameState.gameBoard
        redMove = gameState.agents[1].getMove()
        pinkMove = gameState.agents[2].getMove()
        move = self.location
        for location in board.getNeighborCoordinates(self.location[0], self.location[1]):
            if board.hasFood(location[1], location[0]) and self.manhattan(redMove, (
                    location[1], location[0])) > self.safeDistance and self.manhattan(pinkMove, (
                    location[1], location[0])) > self.safeDistance:
                move = location
                break
        return move
