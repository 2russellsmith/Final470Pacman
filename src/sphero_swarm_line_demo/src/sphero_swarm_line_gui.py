#!/usr/bin/python

import sys, rospy, math, cv2
from PyQt4 import QtGui, QtCore
from sphero_swarm_node.msg import SpheroTwist, SpheroColor
from multi_apriltags_tracker.msg import april_tag_pos
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from game import GameState
from agents import *
from PinkGhost import PinkGhost
from RedGhost import RedGhost

STEP_LENGTH = 100
PACMAN_ID = 10
RED_GHOST_ID = 0
PINK_GHOST_ID = 20
FOLLOW_SPEED = 75


class SpheroSwarmLineForm(QtGui.QWidget):
    RADIUS = 150
    BOARD_WIDTH = 0
    BOARD_HEIGHT = 0
    BOX_X_COUNT = 19
    BOX_Y_COUNT = 9
    BOX_WIDTH = 0
    BOX_HEIGHT = 0
    minX = 1000
    minY = 1000
    maxX = 0
    maxY = 0
    pacman = PacmanAgent(PACMAN_ID)
    redGhost = RedGhost(RED_GHOST_ID)
    pinkGhost = PinkGhost(PINK_GHOST_ID)
    agents = [pacman, redGhost, pinkGhost]
    gameState = GameState(agents)

    def __init__(self):
        super(QtGui.QWidget, self).__init__()
        self.resize(600, 480)
        self.sphero_dict = {}
        self.initUI()
        self.initialized = False
        '''The Sphero blue-tooth controller maps string names to addresses, The camera maps num to locations numToSphero
        and spheroToNum are dictionaries that will map back and forth'''
        self.numToSphero = {}
        self.spheroToNum = {}
        self.order = []  # used to keep a follow the leader order
        self.location = {}  # dictionary that maps sphero id nums to last known location

        rospy.init_node('sphero_swarm_line_gui', anonymous=True)

        self.cmdVelPub = rospy.Publisher('cmd_vel', SpheroTwist,
                                         queue_size=1)  # self.cmdVelPub is who we tell about to move sphero
        self.cmdVelSub = rospy.Subscriber("cmd_vel", SpheroTwist, self.cmdVelCallback)

        # How to get camera feed, draw on it and publish it to a feed that the camera program can display
        self.bridge = CvBridge()
        self.subscriber = rospy.Subscriber("/camera/image_raw", Image, self.cameraImageCallback, queue_size=1)
        self.publisher = rospy.Publisher("/output/image_raw", Image, queue_size=1)

        self.colorPub = rospy.Publisher('set_color', SpheroColor,
                                        queue_size=1)  # who we tell if we want to update the color
        self.aprtSub = rospy.Subscriber('april_tag_pos', april_tag_pos, self.aprtCallback)
        # aprtSub tells us when april tags are updated. When this happens the callback function is called.

    def cameraImageCallback(self, ros_data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(ros_data, "bgr8")

            self.drawGrid(cv_image)

            self.publisher.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    def drawGrid(self, image):
        # draw the grid
        # for each row
        for row in range(0, self.BOX_Y_COUNT):
            # for each column
            for column in range(0, self.BOX_X_COUNT):
                pt1 = (self.BOX_WIDTH * column+self.minX, self.BOX_HEIGHT * row+self.minY)
                pt2 = (self.BOX_WIDTH * (column + 1)+self.minX, self.BOX_HEIGHT * (row + 1)+self.minY)
                color = (0, 255, 255)
                thickness = 1
                lineType = 8
                shift = 0
                # cv2.rectangle(image, pt1, pt2, color, thickness, lineType, shift)
                if self.gameState.hasFood(row, column):
                    x = pt1[0] + self.BOX_WIDTH/2
                    y = pt1[1] + self.BOX_HEIGHT/2
                    radius = 10
                    cv2.circle(image, (x, y), radius, (0, 255, 255), 1, lineType, shift)
                    ''' cv2.rectangle(image, (self.BOX_WIDTH * row, self.BOX_HEIGHT * column), (self.BOX_WIDTH * (row + 1), self.BOX_HEIGHT * (column + 1)),
                    (0, 0, 255), 1, 8, 0)'''
                    # http://docs.opencv.org/2.4/modules/core/doc/drawing_functions.html
        # if self.redGhost is not None:
            # cv2.rectangle(image, pt1, pt2, color, thickness, lineType, shift)

    def initUI(self):

        key_instruct_label = """
    Control Your Sphero!
    ---------------------------
    Moving around:
       u    i    o
       j    k    l
       m    ,    .
    """
        self.keyInstructLabel = QtGui.QLabel(key_instruct_label)
        self.cmdVelLabel = QtGui.QLabel("cmd_vel")
        self.cmdVelTextbox = QtGui.QTextEdit()
        self.cmdVelTextbox.setReadOnly(True)
        self.connect(self, QtCore.SIGNAL("sendCmdVelText(PyQt_PyObject)"), self.updateCmdVelTextbox)

        self.spheroLabel = QtGui.QLabel("Spheros:")
        self.spheroListWidget = QtGui.QListWidget()
        self.refreshBtn = QtGui.QPushButton("Refresh")
        self.refreshBtn.clicked.connect(self.refreshDevices)
        btnGridLayout = QtGui.QGridLayout()
        btnGridLayout.addWidget(self.refreshBtn, 0, 4)

        layout = QtGui.QVBoxLayout()
        layout.addWidget(self.keyInstructLabel)
        layout.addWidget(self.cmdVelLabel)
        layout.addWidget(self.cmdVelTextbox)
        layout.addWidget(self.spheroLabel)
        layout.addWidget(self.spheroListWidget)
        layout.addLayout(btnGridLayout)
        self.setLayout(layout)

        self.setWindowTitle("Sphero Swarm Teleop")
        self.show()

    def keyPressEvent(self, e):
        print "key pressed"
        selected_items = self.spheroListWidget.selectedItems()
        if len(selected_items) == 0:
            return

        print "selected"
        twist = SpheroTwist()
        twist.angular.x = 0
        twist.angular.y = 0
        twist.angular.z = 0
        twist.linear.x = 0
        twist.linear.y = 0
        twist.linear.z = 0
        if e.key() == QtCore.Qt.Key_U:
            twist.linear.x = -STEP_LENGTH
            twist.linear.y = STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_I:
            twist.linear.y = STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_O:
            twist.linear.x = STEP_LENGTH
            twist.linear.y = STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_J:
            twist.linear.x = -STEP_LENGTH
        # elif e.key() == QtCore.Qt.Key_K:
        elif e.key() == QtCore.Qt.Key_L:
            twist.linear.x = STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_M:
            twist.linear.x = -STEP_LENGTH
            twist.linear.y = -STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_Comma:
            twist.linear.y = -STEP_LENGTH
        elif e.key() == QtCore.Qt.Key_Period:
            twist.linear.x = STEP_LENGTH
            twist.linear.y = -STEP_LENGTH

        if twist.linear.x != 0 or twist.linear.y != 0:
            twist.name = str(selected_items[0].text())
            self.cmdVelPub.publish(twist)

    def cmdVelCallback(self, msg):
        cmd_vel_text = "(" + str(msg.name) + "),x=" + str(msg.linear.x) + " y=" + str(msg.linear.y)
        self.emit(QtCore.SIGNAL("sendCmdVelText(PyQt_PyObject)"), cmd_vel_text)

    def updateCmdVelTextbox(self, value):
        self.cmdVelTextbox.moveCursor(QtGui.QTextCursor.End)
        self.cmdVelTextbox.ensureCursorVisible()
        self.cmdVelTextbox.append(str(value))
        self.cmdVelTextbox.update()

    ### called when refreshDevices is clicked.
    def refreshDevices(self):
        self.initialized = False
        self.spheroListWidget.clear()
        self.sphero_dict = rospy.get_param('/sphero_swarm/connected')
        self.numToSphero = {}
        self.spheroToNum = {}
        self.order = list()
        self.location = {}
        print(self.sphero_dict)

        for name in self.sphero_dict:
            num, ok = QtGui.QInputDialog.getInt(self, "Sphero num input", "Enter April Tag number for %s:" % name)
            self.numToSphero[num] = name
            self.spheroToNum[name] = name
            self.order[len(self.order):] = [num]
            self.location[num] = (-1, -1)
            self.spheroListWidget.addItem(name)
        self.spheroListWidget.setCurrentRow(0)
        self.initialized = True
        self.update()

    # main body of algorithm should go here. MSG contains an id, x,y and orientation data members
    def aprtCallback(self, msg):
        # print('april tag call back' + str(msg))
        # print self.initialized
        if not self.initialized:  # still initializing
            return

        for location in self.location:
            self.location[location] = (-1, -1)

        # iterate through array of april-tag ids
        for i in range(0, len(msg.id)):
            self.location[msg.id[i]] = (msg.pose[i].x, msg.pose[i].y)

        boardSet = False
        for spheroId in msg.id:
            agent = self.getAgent(spheroId)
            if agent is not None and boardSet is True:
                agent.setLocation(self.toDiscretized(self.location[spheroId]))

                toHere = self.location[spheroId]
                if toHere[0] == -1:
                    continue
                nextIndex = self.order.index(spheroId) + 1
                if nextIndex >= len(self.order):
                    continue
                nextSphero = self.order[nextIndex]
                fromHere = self.location[nextSphero]
                if fromHere[0] == -1:
                    continue
                move = agent.getMove(self.gameState)
                print "%s's Move: %s" % (agent.name, move)
                twist = self.getTwistFromDirection(agent.getDirectionOfMove(move))

                twist.name = self.numToSphero[nextSphero]
                self.cmdVelPub.publish(twist)  # how to tell sphero to move. all fields in twist must be explicitly set.
            else:
                location = self.location[spheroId]
                if location[0] < self.minX:
                    self.minX = int(math.ceil(location[0]))
                if location[1] < self.minY:
                    self.minY = int(math.ceil(location[1]))
                if location[0] > self.maxX:
                    self.maxX = int(math.ceil(location[0]))
                if location[1] > self.maxY:
                    self.maxY = int(math.ceil(location[1]))
        boardSet = True
        # calculate the height and width of the board according to tag corner positions
        # print "Board Width: %s\nBoard Height: %s" % (self.BOARD_WIDTH, self.BOARD_HEIGHT)
        self.BOARD_WIDTH = int(math.ceil(self.maxX - self.minX))
        self.BOARD_HEIGHT = int(math.ceil(self.maxY - self.minY))
        # calculate the height and width of the boxes to be drawn
        self.BOX_WIDTH = int(math.ceil(self.BOARD_WIDTH / self.BOX_X_COUNT))
        self.BOX_HEIGHT = int(math.ceil(self.BOARD_HEIGHT / self.BOX_Y_COUNT))
        # print "min: %s\nmax: %s\n" % ((self.minX, self.minY), (self.maxX, self.maxY))
        # print "Board Width: %s\nBoard Height: %s\nBox Width: %s\nBox Height: %s" % (self.BOARD_WIDTH, self.BOARD_HEIGHT, self.BOX_WIDTH, self.BOX_HEIGHT)

    def getAgent(self, key):
        agent = None
        if key == PACMAN_ID:
            agent = self.pacman
        elif key == RED_GHOST_ID:
            agent = self.redGhost
        elif key == PINK_GHOST_ID:
            agent == self.pinkGhost
        return agent

    def toDiscretized(self, location):
        x = math.ceil(location[0] / self.BOX_WIDTH)
        y = math.ceil(location[1] / self.BOX_HEIGHT)
        discretizedLocation = (x, y)
        return discretizedLocation

    def fromDiscretized(self, location):
        x = location[0] * self.BOX_WIDTH + (self.BOX_WIDTH / 2)
        y = location[1] * self.BOX_HEIGHT + (self.BOX_HEIGHT / 2)
        normalizedLocation = (x, y)
        return normalizedLocation

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


if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    w = SpheroSwarmLineForm()
    w.show()
    sys.exit(app.exec_())
