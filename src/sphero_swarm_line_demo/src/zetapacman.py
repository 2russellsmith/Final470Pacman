from agents import PacmanAgent


class RewardsMap(object):
    def __init__(self, gameState=None, rewardsMap=None):
        if gameState is not None:
            self.rewardsMap = self.buildMap(gameState)
        elif rewardsMap is not None:
            self.rewardsMap = self._clone(rewardsMap)
        else:
            self.rewardsMap = []

    def _clone(self, rewardsMap2):

        rewardsMap = []
        for x in range(len(rewardsMap2)):
            row = []
            for y in range(len(rewardsMap2[x])):
                row.append(rewardsMap2[x][y])
            rewardsMap.append(row)

        return rewardsMap

    def buildMap(self, gameState):
        pass

    # this will not validate input reward map size
    def __add__(self, rewardsMap2):
        newRewardsMap = RewardsMap()
        newRewardsMap.clone(rewardsMap2)

        for x in range(len(rewardsMap2)):
            for y in range(len(rewardsMap2[x])):
                newRewardsMap.rewardsMap[x][y] += self.rewardsMap[x][y]

        return newRewardsMap


class PelletMap(RewardsMap):
    pelletReward = 10000000000

    def __init__(self, gameState):
        RewardsMap.__init__(gameState)

    def buildMap(self, gameState):
        rewardsMap = []

        for rowIndex in range(len(gameState.gameBoard._board)):
            row = []
            for columnIndex in range(len(gameState.gameBoard._board[rowIndex])):
                if gameState.gameBoard.hasFood(rowIndex, columnIndex):
                    row.append(PelletMap.pelletReward)
                else:
                    row.append(0)
            self.rewardsMap.append(row)

        return rewardsMap


class GhostMap(RewardsMap):
    ghostReward = -11111

    def __init__(self, gameState):
        RewardsMap.__init__(gameState)

    def buildMap(self, gameState):

        # build basic map
        rewardsMap = []
        for rowIndex in range(len(gameState.gameBoard._board)):
            row = []
            for columnIndex in range(len(gameState.gameBoard._board[rowIndex])):
                row.append(0)
            rewardsMap.append(row)

        ghostLocations = gameState.getGhostLocations()
        pass

    def manhattan(self, location1, location2):
        return abs(location1[0] - location2[0]) + abs(location1[1] - location2[1])

class ZetaPacman(PacmanAgent):

    def getMove(self, gameState):
        pass
