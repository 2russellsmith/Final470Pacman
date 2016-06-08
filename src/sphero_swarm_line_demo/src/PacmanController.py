from game import *
from PinkGhost import PinkGhost
from RedGhost import RedGhost
from zetapacman import ZetaPacman
from nuPacman import NuPacman
import rospy
from sphero_swarm_node.msg import SpheroTwist, SpheroColor

FOLLOW_SPEED = 75


class PacmanController:
    PACMAN_ID = 10
    PACMAN_NAME = "OBR"
    RED_GHOST_ID = 0
    RED_GHOST_NAME = "RRG"
    PINK_GHOST_ID = 20
    PINK_GHOST_NAME = "YWY"

    def __init__(self, pacmanAgentType):
        self.stop = True
        self.pacman = ZetaPacman(PacmanController.PACMAN_ID) if pacmanAgentType == "Zeta Pacman" else NuPacman(PacmanController.PACMAN_ID)
        self.redGhost = RedGhost(PacmanController.RED_GHOST_ID)
        self.pinkGhost = PinkGhost(PacmanController.PINK_GHOST_ID)
        self.agents = [self.pacman, self.redGhost, self.pinkGhost]
        self.gameState = GameState(self.agents)

        self.sphero_dict = rospy.get_param('/sphero_swarm/connected')
        self.tagIdToSpheroName = {
            PacmanController.PACMAN_ID: PacmanController.PACMAN_NAME,
            PacmanController.RED_GHOST_ID: PacmanController.RED_GHOST_NAME,
            PacmanController.PINK_GHOST_ID: PacmanController.PINK_GHOST_NAME
        }

        rospy.init_node('PacmanController', anonymous=True)

        # self.cmdVelPub is who we tell about to move sphero
        self.cmdVelPub = rospy.Publisher('cmd_vel', SpheroTwist, queue_size=1)

    def startExecution(self):
        pass

    def stopExecution(self):
        pass

    def getGUIData(self):  # todo this needs to be implemented with real values
        return {
            "score": self.gameState.score,
            "pellet_locations": self.gameState.getFoodLocations()
        }

    def updateAgents(self, tagLocations):
        for tagId, location in tagLocations.items():
            agent = self.getAgent(tagId)
            if agent is not None:
                agent.setLocation(location)

        for tagId, location in tagLocations.items():
            agent = self.getAgent(tagId)
            if agent is not None:
                # how to tell sphero to move. all fields in twist must be explicitly set.
                if tagId in self.tagIdToSpheroName:
                    twist = self.getTwistFromDirection(agent.getMove(self.gameState))
                    twist.name = self.tagIdToSpheroName[tagId]
                    self.cmdVelPub.publish(twist)

    def getAgent(self, key):
        agent = None
        if key == PacmanController.PACMAN_ID:
            agent = self.pacman
        elif key == PacmanController.RED_GHOST_ID:
            agent = self.redGhost
        elif key == PacmanController.PINK_GHOST_ID:
            agent == self.pinkGhost
        return agent

    def getTwistFromDirection(self, direction):
        twist = SpheroTwist()
        twist.linear.x = 0
        twist.linear.y = 0
        twist.linear.z = 0
        twist.angular.x = 0
        twist.angular.y = 0
        twist.angular.z = 0
        if direction == Directions.NORTH:
            twist.linear.y = FOLLOW_SPEED
        elif direction == Directions.EAST:
            twist.linear.x = FOLLOW_SPEED
        elif direction == Directions.SOUTH:
            twist.linear.y = -FOLLOW_SPEED
        elif direction == Directions.WEST:
            twist.linear.x = -FOLLOW_SPEED
        return twist
