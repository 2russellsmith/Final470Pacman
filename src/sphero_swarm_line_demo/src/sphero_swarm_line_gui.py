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
FOLLOW_SPEED = 75
RADIUS = 150
BOARD_WIDTH = 800
BOARD_HEIGHT = 600
BOX_X_COUNT = 19
BOX_Y_COUNT = 9


class SpheroSwarmLineForm(QtGui.QWidget):
    PACMAN_ID = 0
    RED_GHOST_ID = 1
    PINK_GHOST_ID = 2
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
        '''The Sphero bluetooth controller maps string names to addresses, The camera maps num to locations numToSphero
        and spheroToNum are dictoinaries that will map back and forth'''
        self.numToSphero = {}
        self.spheroToNum = {}
        self.order = []  # used to keep a follow the leader order
        self.location = {}  # dictionary that maps sphero id nums to last known locatio

        rospy.init_node('sphero_swarm_line_gui', anonymous=True)

        self.cmdVelPub = rospy.Publisher('cmd_vel', SpheroTwist,
                                         queue_size=1)  # self.cmdVelPub is who we tell about to move sphero
        self.cmdVelSub = rospy.Subscriber("cmd_vel", SpheroTwist, self.cmdVelCallback)

        # How to get camera feed, draw on it and publish it to a feed that the camera program can display
        self.bridge = CvBridge()
        self.subscriber = rospy.Subscriber("/camera/image_raw", Image, self.cameraImageCallback, queue_size=1)
        self.publisher = rospy.Publisher("/output/image_raw", Image, queue_size=1)

        # Other camera related variables # initialize all food to 1
        self.food = [[1 for i in range(BOX_X_COUNT)] for j in range(BOX_Y_COUNT)]

        self.colorPub = rospy.Publisher('set_color', SpheroColor,
                                        queue_size=1)  # who we tell if we want to update the color
        self.aprtSub = rospy.Subscriber('april_tag_pos', april_tag_pos, self.aprtCallback)
        # aprtSub tells us when april tags are updated. When this happens the callback function is called.

    def cameraImageCallback(self, ros_data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(ros_data, "bgr8")

            self.drawGrid(cv_image)

            self.publisher.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
            print 'drawn'
        except CvBridgeError as e:
            print(e)

    def drawGrid(self, image, topLeftPoint, bottomRightPoint):
        # calculate the height and width of the board according to tag corner positions
        if topLeftPoint is not None and bottomRightPoint is not None:
            boardWidth = bottomRightPoint.x - topLeftPoint.x
            boardHeight = bottomRightPoint.y - topLeftPoint.y
        else:
            boardWidth = BOARD_WIDTH
            boardHeight = BOARD_HEIGHT

        # calculate the height and width of the boxes to be drawn
        boxWidth = boardWidth / BOX_X_COUNT
        boxHeight = boardHeight / BOX_Y_COUNT

        # draw the grid
        for i in range(0, BOX_X_COUNT):
            for j in range(0, BOX_Y_COUNT):
                pt1 = cv2.Point2f(boxWidth * i, boxHeight * j)
                pt2 = cv2.Point2f(boxWidth * (i + 1), boxHeight * (j + 1))
                color = cv2.Scalar(0, 0, 255)
                thickness = 1
                lineType = 8
                shift = 0
                cv2.rectangle(image, pt1, pt2, color, thickness, lineType, shift)
                if self.food[i][j] == 1:
                    x = pt2.x - pt1.x
                    y = pt2.y - pt2.y
                    radius = 5
                    cv2.circle(image, (x, y), radius, color, thickness, lineType, shift)
                    ''' cv2.rectangle(image, (boxWidth * i, boxHeight * j), (boxWidth * (i + 1), boxHeight * (j + 1)),
                    (0, 0, 255), 1, 8, 0)'''
                    # http://docs.opencv.org/2.4/modules/core/doc/drawing_functions.html

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
        twist = None

        print "key pressed"
        selected_items = self.spheroListWidget.selectedItems()
        if len(selected_items) == 0:
            return

        print "selected"

        if e.key() == QtCore.Qt.Key_U:
            twist = SpheroTwist()
            twist.linear.x = -STEP_LENGTH
            twist.linear.y = STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_I:
            twist = SpheroTwist()
            twist.linear.x = 0
            twist.linear.y = STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_O:
            twist = SpheroTwist()
            twist.linear.x = STEP_LENGTH
            twist.linear.y = STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_J:
            twist = SpheroTwist()
            twist.linear.x = -STEP_LENGTH
            twist.linear.y = 0
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_K:
            twist = SpheroTwist()
            twist.linear.x = 0
            twist.linear.y = 0
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_L:
            twist = SpheroTwist()
            twist.linear.x = STEP_LENGTH
            twist.linear.y = 0
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_M:
            twist = SpheroTwist()
            twist.linear.x = -STEP_LENGTH
            twist.linear.y = -STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_Comma:
            twist = SpheroTwist()
            twist.linear.x = 0
            twist.linear.y = -STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
        elif e.key() == QtCore.Qt.Key_Period:
            twist = SpheroTwist()
            twist.linear.x = STEP_LENGTH
            twist.linear.y = -STEP_LENGTH
            twist.linear.z = 0
            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0

        if twist != None:
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
        print('april tag call back' + str(msg))
        if not self.initialized:  # still initializing
            return

        for key in self.location:
            self.location[key] = (-1, -1)

        # iterate through array of april-tag ids
        for i in range(0, len(msg.id)):
            self.location[msg.id[i]] = (msg.pose[i].x, msg.pose[i].y)

        for key in msg.id:
            if key == self.PACMAN_ID:
                self.pacman
            twist = SpheroTwist()
            """
            toHere = self.location[key]
            if toHere[0] == -1:
                continue
            nextIndex = self.order.index(key) + 1
            if nextIndex >= len(self.order):
                continue
            nextSphero = self.order[nextIndex]
            fromHere = self.location[nextSphero]
            if fromHere[0] == -1:
                continue
            diffX = toHere[0] - fromHere[0]
            diffY = toHere[1] - fromHere[1]
            distance = math.sqrt((diffX * diffX) + (diffY * diffY))
            twist = SpheroTwist()
            twist.name = self.numToSphero[nextSphero]
            print distance
            if distance < RADIUS:
                twist.linear.x = 0
                twist.linear.y = 0
                twist.linear.z = 0
                twist.angular.x = 0
                twist.angular.y = 0
                twist.angular.z = 0
            else:
                omega = math.atan2(diffY, diffX)
                deltaX = FOLLOW_SPEED * math.cos(omega)
                deltaY = -FOLLOW_SPEED * math.sin(omega)
                twist.linear.x = deltaX
                twist.linear.y = deltaY
                twist.linear.z = 0
                twist.angular.x = 0
                twist.angular.y = 0
                twist.angular.z = 0
            """
            self.cmdVelPub.publish(twist)  # how to tell sphero to move. all fields in twist must be explicitly set.


if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    w = SpheroSwarmLineForm()
    w.show()
    sys.exit(app.exec_())
