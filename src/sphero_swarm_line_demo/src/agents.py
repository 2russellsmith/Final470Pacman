from game import *


class Agent:
    """An agent is any sphero that has a april tag and is being tracked via the multi april tag detector"""

    def __init__(self, index, isPacman=False):  # TODO is index the april tag ID?
        """"Creates an Agent with the given index, initializing its location to an invalid location until it begins moving.

        :param index: the index of the agent (april tag ID)
        :param isPacman: True if the agent is pacman, false otherwise.
        """
        """Creates an Agent with the given index, initializing its location to an invalid location until it begins moving."""
        self.index = index
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
        """Gets the direction that the given location would be from the agent's current location."""
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
        if self.hasReachedDestination(location):
            self.prevLocation = self.location
        self.location = location

    def hasReachedDestination(self, location):
        """Determines if the goal location matches the given location

        :param location: the new location
        :return: True if the goal location has been reached, False otherwise
        """
        return location == self.nextLocation

    @staticmethod
    def manhattan(location1, location2):
        return abs(location1[0] - location2[0]) + abs(location1[1] - location2[1])


class PacmanAgent(Agent):
    def __init__(self, index):
        Agent.__init__(self, index, True)

    def getMove(self, gameState):
        pass


class GhostAgent(Agent):
    chaseMode = False

    def __init__(self, index):
        Agent.__init__(self, index)

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
        for row in xrange(0, len(gameState.gameBoard.getBoardHeight())):
            for column in xrange(0, len(gameState.gameBoard.getBoardWidth())):
                assistantMatrix[(row, column)] = (10000, False, None)

        assistantMatrix[self.location] = 0, False, None
        assistantMatrix[self.prevLocation] = 10000, True, None

        openSet = [startNode]

        while openSet:
            current = openSet[0]
            for n in openSet:
                if assistantMatrix[n.location][0] + self.manhattan(n.location, destination.location) < \
                                assistantMatrix[current.location][0] + self.manhattan(current.location,
                                                                                      destination.location):
                    current = n

            if current.location == destination.location:
                return self.getNextMove(current.location, assistantMatrix)

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
                        assistantMatrix[current.location][2] = current.location
        return []

    def getNextMove(self, nodeLocation, assistantMatrix): #TODO I have no idea what this does
        """Gets the next move that the agent will take given the node location and assistant matrix

        :param nodeLocation:
        :param assistantMatrix:
        :return:
        """
        """Gets the next move that the agent will take given the node location and assistant matrix"""
        prevLocation = None
        while assistantMatrix[nodeLocation][2]:
            prevLocation = nodeLocation
            nodeLocation = assistantMatrix[nodeLocation][2]
        return prevLocation

#TODO is this used?
class AgentState:
    def __init__(self, location):
        self.location = location
        self.color = (255, 255, 255)
