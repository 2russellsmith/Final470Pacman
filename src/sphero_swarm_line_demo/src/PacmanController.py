from game import *
from PinkGhost import PinkGhost
from RedGhost import RedGhost
from zetapacman import ZetaPacman
from NuPacman import NuPacman
import rospy
from sphero_swarm_node.msg import SpheroTwist, SpheroColor

FOLLOW_SPEED = 30


class PacmanController:
    PACMAN_ID = 20
    PACMAN_NAME = "Sphero-YRW"
    RED_GHOST_ID = 1
    RED_GHOST_NAME = "Sphero-GRO"

    # PINK_GHOST_ID = 20
    # PINK_GHOST_NAME = "Sphero-YWY"

    def __init__(self, pacmanAgentType):
        self.stop = True
        self.paused = False
        # Create the specific implementation of pacman needed
        self.pacman = ZetaPacman() if pacmanAgentType == "Zeta Pacman" else NuPacman()
        self.redGhost = RedGhost()
        # self.pinkGhost = PinkGhost()
        # self.agents = [self.pacman, self.redGhost, self.pinkGhost]
        self.agents = [self.pacman, self.redGhost]
        self.gameState = GameState(self.agents)

        self.sphero_dict = rospy.get_param('/sphero_swarm/connected')
        self.tagIdToSpheroName = {
            PacmanController.PACMAN_ID: PacmanController.PACMAN_NAME,
            PacmanController.RED_GHOST_ID: PacmanController.RED_GHOST_NAME,
            # PacmanController.PINK_GHOST_ID: PacmanController.PINK_GHOST_NAME
        }

        # rospy.init_node('PacmanController', anonymous=True)

        # self.cmdVelPub is who we tell about to move sphero
        self.cmdVelPub = rospy.Publisher('cmd_vel', SpheroTwist, queue_size=1)

    def startExecution(self):
        self.stop = False

    def stopExecution(self):
        self.stop = True

    def setPaused(self, paused):
        self.paused = paused

    def calculateBoardSpace(self, cornerTags):
        GameBoard.calculateBoardSpace(cornerTags)

    def getGUIData(self):
        """Returns the information from the game state that the GUI needs to draw"""
        return {
            "score": self.gameState.score,
            "pellet_locations": self.gameState.getFoodLocations(),
        }

    def updateAgents(self, tagLocations):
        """Updates the locations of each agent, and then calculates the moves that they will take. Locations for all agents must be set before getting any agent's next move.

        :param tagLocations: the april tag information
        """

        # set new agent locations
        for tagId, location in tagLocations.items():
            agent = self.getAgent(tagId)
            if agent is not None and location is not None:
                print("PACMAN: %s CURRENT LOCATION: %s NEXT LOCATION: %s" % (agent.isPacman, agent.location, agent.nextLocation))
                agent.setLocation(location)

        # game status logic
        gameStatus = self.gameState.processPacmanLocation()

        # make next moves
        if not self.stop and not self.paused and gameStatus == GameConditions.PLAYING:
            for tagId, location in tagLocations.items():
                agent = self.getAgent(tagId)

                if agent is not None:
                    if tagId in self.tagIdToSpheroName:
                        nextMove = agent.calculateNextMoveDirection(self.gameState)
                        twist = self.getTwistFromDirection(nextMove)
                        twist.name = self.tagIdToSpheroName[tagId]
                        self.cmdVelPub.publish(twist)

        return gameStatus

    def getAgent(self, key):
        """Gets the agent from the given key. If the key doesn't correspond to a sphero (i.e. a corner tag), then None is returned

        :param key: the april tag ID of the agent
        :return: the agent corresponding to the key. None if they key is not associated with a sphero.
        """
        agent = None
        if key == PacmanController.PACMAN_ID:
            agent = self.pacman
        elif key == PacmanController.RED_GHOST_ID:
            agent = self.redGhost
        # elif key == PacmanController.PINK_GHOST_ID:
        #     agent == self.pinkGhost
        return agent

    @staticmethod
    def getTwistFromDirection(direction):
        """"Creates a twist that is set up to go in the specified direction

        :param direction: the direction to go
        :return: A fully initialized SpheroTwist (minus the name) that can be passed to a sphero to go in the direction specified.
        """
        twist = SpheroTwist()
        twist.linear.x = 0
        twist.linear.y = 0
        twist.linear.z = 0
        twist.angular.x = 0
        twist.angular.y = 0
        twist.angular.z = 0
        if direction == Directions.NORTH:
            twist.linear.y = -FOLLOW_SPEED
        elif direction == Directions.EAST:
            twist.linear.x = FOLLOW_SPEED
        elif direction == Directions.SOUTH:
            twist.linear.y = FOLLOW_SPEED
        elif direction == Directions.WEST:
            twist.linear.x = -FOLLOW_SPEED
        return twist
