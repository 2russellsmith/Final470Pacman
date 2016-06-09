from game import *


class Agent:
    """An agent is any sphero that has a april tag and is being tracked via the multi april tag detector"""

    def __init__(self, isPacman=False):
        """"Creates an Agent, initializing its location to an invalid location until it begins moving.

        :param isPacman: True if the agent is pacman, false otherwise.
        """
        self.isPacman = isPacman
        self.location = None
        self.prevLocation = None
        self.nextLocation = None

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
        print("GET DIRECTION: %s -> %s" % (self.location, location))
        if location.getX() > self.location.getX():
            return Directions.EAST
        elif location.getX() < self.location.getX():
            return Directions.WEST
        elif location.getY() > self.location.getY():
            return Directions.NORTH
        elif location.getY() < self.location.getY():
            return Directions.SOUTH
        else:
            print("NO DIRECTION")
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
        print ("%s == %s: %s" % (self.location,
                                 self.nextLocation,
                                 (self.location == self.nextLocation)))

        return self.location == self.nextLocation

    def calculateNextMoveDirection(self, gameState):
        """Given game state calculate next move if we have arrived at the current goal

        :return: direction of next move
        """
        if self.hasReachedDestination() or self.nextLocation is None:
            self.nextLocation = self.getMove(gameState)

        print("PACMAN: %s NEXT LOCATION: %s" % (self.isPacman, self.nextLocation))
        return self.getDirectionOfMove(self.nextLocation)

    @staticmethod
    def manhattan(location1, location2):
        return abs(location1.getX() - location2.getX()) + abs(location1.getY() - location2.getY())


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

        # print("START: %s" % str(startNode.location))
        # print("DESTINATION: %s" % str(destination.location))

        # setup cost matrix
        assistantMatrix = {}
        for row in range(gameState.gameBoard.getBoardHeight()):
            for column in range(gameState.gameBoard.getBoardWidth()):
                assistantMatrix[Location(row=row, col=column).toTuple()] = [10000, False, None]

        # cost, visited, parent
        # if startNode.location.toTuple() in assistantMatrix:
        #     print("START KEY EXISTS")

        assistantMatrix[startNode.location.toTuple()] = [0, False, None]

        if self.prevLocation and self.prevLocation != self.location:
            assistantMatrix[self.prevLocation.toTuple()] = [10000, True, None]

        openSet = [startNode]

        while openSet:
            current = openSet[0]
            #print "current location: %s" % (str(current.location))
            for n in openSet:
                if assistantMatrix[n.location.toTuple()][0] + self.manhattan(n.location, destination.location) < \
                                assistantMatrix[current.location.toTuple()][0] + self.manhattan(current.location,
                                                                                      destination.location):
                    current = n

            if current.location == destination.location:
                return self.extractMoveFromPath(current.location, assistantMatrix)

            openSet.remove(current)
            assistantMatrix[current.location.toTuple()][1] = True

            print("PARENT %s" % str(current.location))
            print("CHILDREN - %s" % (" ".join([str(x.location) for x in current.children])))
            for child in current.children:
                #print("CHECKING CHILD")
                if not assistantMatrix[child.location.toTuple()][1]:
                    #print("CHILD NOT VISITED")
                    if child not in openSet:
                        #print("CHILD NOT ALREADY IN SET")
                        openSet.append(child)

                    childCost = assistantMatrix[child.location.toTuple()][0]
                    currentCost = assistantMatrix[current.location.toTuple()][0]
                    if childCost > currentCost + 1:
                        assistantMatrix[child.location.toTuple()][0] = currentCost + 1
                        assistantMatrix[child.location.toTuple()][2] = current.location
            #print(len(openSet))

        #print(assistantMatrix)

        raise Exception("NO GHOST PATH FOUND")

    def extractMoveFromPath(self, nodeLocation, assistantMatrix):
        """Gets the next move that the agent will take given the node location and assistant matrix

        :param nodeLocation:
        :param assistantMatrix:
        :return:
        """
        prevLocation = None
        while assistantMatrix[nodeLocation.toTuple()][2]:
            prevLocation = nodeLocation
            nodeLocation = assistantMatrix[nodeLocation.toTuple()][2]
        return prevLocation


if __name__ == '__main__':
    from RedGhost import RedGhost
    from zetapacman import ZetaPacman

    ghost1 = RedGhost()
    ghost1.prevLocation = (5, 1)
    ghost1.location = (5, 0)

    z = ZetaPacman()
    z.location = (16, 4)
    g = GameState([ghost1, z])
    print "resulting move" + str(ghost1.getMove(g))

    print("hi")
