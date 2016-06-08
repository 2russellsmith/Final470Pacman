#!/usr/bin/python

import sys, rospy, math, cv2
from PyQt4 import QtGui, QtCore
from sphero_swarm_node.msg import SpheroTwist, SpheroColor
from multi_apriltags_tracker.msg import april_tag_pos
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from PacmanController import PacmanController

key_instruct_label = """
    Control Your Sphero!
    ---------------------------
    Moving around:
       u    i    o
       j    k    l
       m    ,    .
    """


def toDiscretized(location):
    x = int(location[0] / PacmanGui.cellWidth)
    y = int(location[1] / PacmanGui.cellHeight)
    return x, y


def fromDiscretized(location):
    x = (location[0] + .5) * PacmanGui.cellWidth
    y = (location[1] + .5) * PacmanGui.cellHeight
    return int(x), int(y)


STEP_LENGTH = 100


class PacmanGui(QtGui.QWidget):
    boardWidth = 0
    boardHeight = 0
    cellCountX = 19
    cellCountY = 9
    cellWidth = 0
    cellHeight = 0
    minX = 1000
    minY = 1000
    maxX = 0
    maxY = 0
    cornerTagIds = [1, 2, 3, 4]  # TODO this is, like, hard-core dope-like broke.

    def __init__(self):
        super(QtGui.QWidget, self).__init__()
        self.resize(600, 480)

        self.stopFlag = True
        self.controller = None

        #############
        # LISTENERS #
        #############

        rospy.init_node('pacmanGui', anonymous=True)

        # How to get camera feed, draw on it and publish it to a feed that the camera program can display
        self.bridge = CvBridge()
        self.subscriber = rospy.Subscriber("/camera/image_raw", Image, self.cameraImageCallback, queue_size=1)
        self.publisher = rospy.Publisher("/output/image_raw", Image, queue_size=1)
        self.publisherDrawn = rospy.Publisher("/output/image", Image, queue_size=1)

        # who we tell if we want to update the color
        self.colorPub = rospy.Publisher('set_color', SpheroColor, queue_size=1)

        # aprtSub tells us when april tags are updated. When this happens the callback function is called.
        self.aprtSub = rospy.Subscriber('april_tag_pos', april_tag_pos, self.aprtCallback)

        ################
        # GUI ELEMENTS #
        ################

        self.keyInstructLabel = QtGui.QLabel(key_instruct_label)

        self.controllerDropDown = QtGui.QComboBox()

        # Add your methods here
        self.controllerDropDown.addItem("Zeta Pacman")
        self.controllerDropDown.addItem("Nu Pacman")

        self.controllerStartBtn = QtGui.QPushButton("Start")
        self.controllerStartBtn.clicked.connect(self.start)

        self.controllerStopBtn = QtGui.QPushButton("Stop")
        self.controllerStopBtn.clicked.connect(self.stop)

        self.layout = QtGui.QVBoxLayout()
        hlayout = QtGui.QHBoxLayout()
        hlayout.addWidget(self.controllerDropDown)
        hlayout.addWidget(self.controllerStartBtn)
        hlayout.addWidget(self.controllerStopBtn)

        self.layout.addLayout(hlayout)
        self.setLayout(self.layout)
        self.setWindowTitle("AI Pacman")
        self.show()

    def start(self):
        currentMethod = self.aprilTagDropDown.currentText()

        if self.controller:
            self.stop()

        # Add an if statement for each item in the drop down to create your controller for that method
        self.controller = PacmanController(currentMethod)

        if self.controller:
            self.controller.startExecution()

    def stop(self):
        if self.controller:
            self.controller.stopExecution()

    def cameraImageCallback(self, ros_data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(ros_data, "bgr8")
            self.publisher.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))

            self.drawOverlay(cv_image)

            self.publisherDrawn.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    # see http://docs.opencv.org/2.4/modules/core/doc/drawing_functions.html for cv2 methods
    def drawOverlay(self, image):

        color = (0, 255, 255)
        thickness = 1
        lineType = 8
        shift = 0
        radius = 5
        for row in range(0, 600):
            for column in range(0, 800):
                cv2.circle(image, (column*800/19, row*600/9), radius, color, thickness, lineType, shift)
        return
        # still loading
        if not self.stopFlag or self.controller is None:
            return
        # get the GUI data
        controllerData = self.controller.getGUIData()

        # constants for variable drawing
        color = (0, 255, 255)
        thickness = 1
        lineType = 8
        shift = 0
        radius = 5
        for row in range(0, PacmanGui.boardHeight):
            for column in range(0, PacmanGui.boardWidth):
                # draw pellets
                if (column, row) in controllerData['pellet_locations']:
                    cv2.circle(image, fromDiscretized((column, row)), radius, color, thickness, lineType, shift)

                    # draw boxes
                    # topLeftCorner = (PacmanGui.cellWidth * column + PacmanGui.minX, PacmanGui.cellHeight * row + PacmanGui.minY)
                    # bottomRightCorner = (PacmanGui.cellWidth * (column + 1) + PacmanGui.minX, PacmanGui.cellHeight * (row + 1) + PacmanGui.minY)
                    # cv2.rectangle(image, topLeftCorner, bottomRightCorner, color, thickness, lineType, shift)

    # main body of algorithm should go here. MSG contains an id, x,y and orientation data members
    def aprtCallback(self, msg):
        # print('april tag call back' + str(msg))


        # update the controller with the new tag locations
        discretizedLocations = [toDiscretized(x) for x in msg.pose]
        tagLocations = {x[0]: x[1] for x in list(zip(msg.ids, discretizedLocations))}
        PacmanGui.calculateBoardSpace(tagLocations)
        # still loading
        if not self.stopFlag or self.controller is None:
            return
        self.controller.updateAgents(tagLocations)
        # calculate the height and width of the board according to tag corner positions
        PacmanGui.boardWidth = int(math.ceil(PacmanGui.maxX - PacmanGui.minX))
        PacmanGui.boardHeight = int(math.ceil(PacmanGui.maxY - PacmanGui.minY))

        # calculate the height and width of the boxes to be drawn
        PacmanGui.cellWidth = int(math.ceil(PacmanGui.boardWidth / PacmanGui.cellCountX))
        PacmanGui.cellHeight = int(math.ceil(PacmanGui.boardHeight / PacmanGui.cellCountY))

    @staticmethod
    def calculateBoardSpace(tagLocations):
        for cornerId in PacmanGui.cornerTagIds:
            if cornerId in tagLocations:
                location = tagLocations[cornerId]
                if location[0] < PacmanGui.minX:
                    PacmanGui.minX = int(math.ceil(location[0]))
                if location[1] < PacmanGui.minY:
                    PacmanGui.minY = int(math.ceil(location[1]))
                if location[0] > PacmanGui.maxX:
                    PacmanGui.maxX = int(math.ceil(location[0]))
                if location[1] > PacmanGui.maxY:
                    PacmanGui.maxY = int(math.ceil(location[1]))

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


if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    p = PacmanGui()
    p.show()
    sys.exit(app.exec_())
