#!/usr/bin/python

import sys, rospy, cv2
from PyQt4 import QtGui, QtCore
from sphero_swarm_node.msg import SpheroTwist, SpheroColor
from multi_apriltags_tracker.msg import april_tag_pos
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from PacmanController import PacmanController
from game import GameConditions, Location, GameBoard

key_instruct_label = """
    Control Your Sphero!
    ---------------------------
    Moving around:
       u    i    o
       j    k    l
       m    ,    .
    """


# STEP_LENGTH = 100


class PacmanGui(QtGui.QWidget):
    #cornerTagIds = [90, 92, 93, 98]
    cornerTagIds = [26, 5, 82, 98]

    def __init__(self):
        """Initializes the GUI for pacman. This adds drop-down elements to select which pacman implementation to use."""
        super(QtGui.QWidget, self).__init__()
        self.resize(300, 240)

        self.running = False
        self.controller = None
        self.paused = False
        self.guiInitialized = False

        self.gameStatus = None

        #############
        # LISTENERS #
        #############

        rospy.init_node('pacmanGui', anonymous=True)

        # How to get camera feed, draw on it and publish it to a feed that the camera program can display
        self.bridge = CvBridge()
        self.subscriber = rospy.Subscriber("/camera/image_raw", Image, self.cameraImageCallback, queue_size=1)
        # raw image
        self.publisher = rospy.Publisher("/output/image_raw", Image, queue_size=1)
        # drawn image
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

        # pause button
        self.controllerPauseBtn = QtGui.QPushButton("Pause")
        self.controllerPauseBtn.clicked.connect(self.pause)

        self.controllerStopBtn = QtGui.QPushButton("Stop")
        self.controllerStopBtn.clicked.connect(self.stop)

        self.layout = QtGui.QVBoxLayout()
        hlayout = QtGui.QHBoxLayout()
        hlayout.addWidget(self.controllerDropDown)
        hlayout.addWidget(self.controllerStartBtn)
        hlayout.addWidget(self.controllerStopBtn)
        hlayout.addWidget(self.controllerPauseBtn)

        self.layout.addLayout(hlayout)
        self.setLayout(self.layout)
        self.setWindowTitle("AI Pacman")
        self.show()

    def start(self):

        if self.running:
            return

        # clear old game state
        self.stop()

        # setup a new controller
        self.controller = PacmanController(self.controllerDropDown.currentText())
        self.controller.startExecution()

        # setup running/pause state
        self.running = True
        self.paused = False

    def pause(self, ):
        self.paused = not self.paused
        labelText = "Pause" if not self.paused else "Unpause"
        self.controllerPauseBtn.setText(labelText)

        self.controller.setPaused(self.paused)

    def stop(self):
        if self.controller:
            self.controller.stopExecution()

        self.running = False
        self.paused = False

    def cameraImageCallback(self, ros_data):
        """Called to update the camera

        :param ros_data: the data from ROS
        """
        try:
            cv_image = self.bridge.imgmsg_to_cv2(ros_data, "bgr8")
            self.publisher.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))

            self.drawOverlay(cv_image)

            self.publisherDrawn.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
        except CvBridgeError as e:
            print(e)

    def drawOverlay(self, image):
        """Draws information to the camera screen. This draws a grid to the screen to help gauging correct setup. This also draws the food pellets that pacman eats.

        :param image: the image to draw to. this uses cv2 extensively. See http://docs.opencv.org/2.4/modules/core/doc/drawing_functions.html for cv2 methods
        """
        # still loading
        if not self.running or not self.guiInitialized:
            return

        # get the GUI data
        controllerData = self.controller.getGUIData()

        # constants for variable drawing
        color = (0, 255, 255)
        thickness = 1
        lineType = 8
        shift = 0
        radius = 5
        for pelletLocation in controllerData['pellet_locations']:
            cameraLocation = pelletLocation.createNonDiscretized()
            cv2.circle(image, (cameraLocation.getCol(), cameraLocation.getRow()), radius, color, thickness, lineType, shift)

        cv2.putText(image, "Score: %s" % controllerData["score"], (100, 25), cv2.FONT_HERSHEY_COMPLEX, .5, (255, 255, 255))

        if self.gameStatus == GameConditions.WIN:
            cv2.putText(image, "Pacman Wins!", (100, 300), cv2.FONT_HERSHEY_COMPLEX, 1.5, (255, 255, 255))
        elif self.gameStatus == GameConditions.LOSE:
            cv2.putText(image, "Pacman Loses!", (100, 300), cv2.FONT_HERSHEY_COMPLEX, 1.5, (255, 255, 255))

    def aprtCallback(self, msg):
        """
        This is called continually with information about all of the april tags.

        :param msg: MSG contains an id, x,y and orientation data members
        """
        if not self.running:
            return

        cornerTags = [Location(x=location.x, y=location.y) for index, location in enumerate(msg.pose) if msg.id[index] in PacmanGui.cornerTagIds]
        self.controller.calculateBoardSpace(cornerTags)
        self.guiInitialized = True
        # self.calculateBoardSpace(cornerTags)

        # update the controller with the new tag locations
        discretizedLocations = [Location(x=location.x, y=location.y).createDiscretized() for location in msg.pose]
        tagLocations = {x[0]: x[1] for x in list(zip(msg.id, discretizedLocations))}

        if not self.paused:
            self.gameStatus = self.controller.updateAgents(tagLocations)
            if self.gameStatus != GameConditions.PLAYING:
                self.paused = True

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
