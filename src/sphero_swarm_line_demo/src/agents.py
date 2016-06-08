from game import *


class Agent:
    """An agent is any sphero that has a april tag and is being tracked via the multi april tag detector"""

    def __init__(self, isPacman=False):
        """"Creates an Agent, initializing its location to an invalid location until it begins moving.

        :param isPacman: True if the agent is pacman, false otherwise.
        """
        self.isPacman = isPacman
        self.location = (-1, -1)
        self.prevLocation = (-1, -1)
        self.nextLocation = (-1, -1)

    def getMove(self, gameState):
        """Gets the next location that the agent will move to based on the information in the gameState

        :param gameState: the information about the game
        :type gameState: GameState
        :return: the location that the agent will move to, given the game information.
        """
        pass

    def getDirectionOfMove(self, location):
        """Gets the direction that the given location would be from the agent's current location. If this is not exactly one square away, the behaviour will be unexpected. E.g. If the move is to
        the top right, it will move right. This method will prefer moving in the x direction if given bad information. If the location is the current location Direction.STOP is returned instead.

        :param location: the location that the agent will move to. This should be exactly one square away.
        :returns Direction: The direction to move in.
        """
        if location[0] > self.location[0]:
            return Directions.EAST
        elif location[0] < self.location[0]:
            return Directions.WEST
        elif location[1] > self.location[1]:
            return Directions.NORTH
        elif location[1] < self.location[1]:
            return Directions.SOUTH
        else:
            return Directions.STOP

    def setLocation(self, location):
        """Sets the current location for this agent. In addition, if the agent has reached it's destination, the previous location is updated.
        This ensures that extra calculations do not happen when the agent hasn't moved a full grid space yet.

        :param location: the new location
        """
        oldLocation = self.location
        self.location = location
        if self.hasReachedDestination():
            self.prevLocation = oldLocation

    def hasReachedDestination(self):
        """Determines if the goal location matches the current location

        :return: True if the goal location has been reached, False otherwise
        """
        return self.location == self.nextLocation

    def calculateNextMoveDirection(self, gameState):
        """Given game state calculate next move if we have arrived at the current goal

        :return: direction of next move
        """
        if self.hasReachedDestination() or self.nextLocation == (-1, -1):
            print ("CALCULATING NEW MOVE")
            self.nextLocation = self.getMove(gameState)

        print("PACMAN: %s NEXT LOCATION: %s" % (self.isPacman, self.nextLocation))
        return self.getDirectionOfMove(self.nextLocation)

    @staticmethod
    def manhattan(location1, location2):
        return abs(location1[0] - location2[0]) + abs(location1[1] - location2[1])


class PacmanAgent(Agent):
    def __init__(self):
        Agent.__init__(self, True)


class GhostAgent(Agent):
    chaseMode = False

    def __init__(self):
        Agent.__init__(self)

    def getGoal(self, gameState):
        """Returns the target node for the Ghost

        :param gameState: information about the game
        :type gameState: GameState
        :return: the target node for the ghost
        """
        pass

    def getMove(self, gameState):
        destination = self.getGoal(gameState)
        startNode = gameState.gameBoard.getNode(self.location)

        # setup cost matrix
        assistantMatrix = {}
        for row in range(gameState.gameBoard.getBoardHeight()):
            for column in range(gameState.gameBoard.getBoardWidth()):
                assistantMatrix[(row, column)] = [10000, False, None]

        # cost, visited, parent
        assistantMatrix[startNode.location] = [0, False, None]
        assistantMatrix[self.prevLocation] = [10000, True, None]

        openSet = [startNode]

        while openSet:
            current = openSet[0]
            for n in openSet:
                if assistantMatrix[n.location][0] + self.manhattan(n.location, destination.location) < \
                                assistantMatrix[current.location][0] + self.manhattan(current.location,
                                                                                      destination.location):

                    current = n

            if current.location == destination.location:
                return self.extractMoveFromPath(current.location, assistantMatrix)

            openSet.remove(current)
            assistantMatrix[current.location][1] = True

            for child in current.children:
                if not assistantMatrix[child.location][1]:
                    if child not in openSet:
                        openSet.append(child)

                    childCost = assistantMatrix[child.location][0]
                    currentCost = assistantMatrix[current.location][0]
                    if childCost > currentCost + 1:
                        assistantMatrix[child.location][0] = currentCost + 1
                        assistantMatrix[child.location][2] = current.location

        return []

    def extractMoveFromPath(self, nodeLocation, assistantMatrix):
        """Gets the next move that the agent will take given the node location and assistant matrix

        :param nodeLocation:
        :param assistantMatrix:
        :return:
        """
        prevLocation = None
        print("FINDING PATH FROM: %s" % str(nodeLocation))
        print(assistantMatrix[nodeLocation])
        while assistantMatrix[nodeLocation][2]:
            print("FOLLOWING: %s" % str(nodeLocation))
            prevLocation = nodeLocation
            nodeLocation = assistantMatrix[nodeLocation][2]
        return prevLocation