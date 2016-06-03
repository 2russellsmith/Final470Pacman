import sys, rospy, math, random
from PyQt4 import QtGui, QtCore
from geometry_msgs.msg import Twist, Pose2D
from std_msgs.msg import ColorRGBA, Float32, Bool
from apriltags_intrude_detector.srv import apriltags_intrude
from apriltags_intrude_detector.srv import apriltags_info

from Lab1.tags import *

# You implement this class
class defaultController:
    stop = True # This is set to true when the stop button is pressed
    tagList = []

    def __init__(self):
        self.cmdVelPub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        self.trackposSub = rospy.Subscriber("tracked_pos", Pose2D, self.trackposCallback)

    # This function is continuously called
    def trackposCallback(self, msg):

        if not self.stop:
            twist = Twist()

            twist.angular.x = 0
            twist.angular.y = 0
            twist.angular.z = 0
            
            # Pass in robot's current location to calcDelta
            current = (msg.x, msg.y)

	    for tag in self.tagList:
		if tag.goal(current):
	 	    if self.currentID == self.highestID:
	                self.startExecution()
		    else:
	    	        self.setNextAttractive()

	    # Iterate over tagList and sum (X, Y) results of calcDelta on each
	    delta_list = [tag.calcDelta(current) for tag in self.tagList]
	    final_delta = [sum(x) for x in zip(*delta_list)]

	    if self.currentID == 2 and msg.x == -1 and msg.y == -1:
		twist.linear.x = 100
		twist.linear.y = 0
	    elif msg.x == -1 and msg.y == -1:
		twist.linear.x = -60
		twist.linear.y = 0
	    else:
	   	# **Scaling Speed so it doesn't run off the other end of the tag** 
		twist.linear.x = final_delta[0] / 1.5
		twist.linear.y = final_delta[1] / 1.5
		        
            # Robot can't fly... yet.
	    twist.linear.z = 0

	    # Update twist values
	    self.cmdVelPub.publish(twist)

    def startExecution(self):
        
        # Reset tag list so that moved tags don't keep getting appended to the list
        self.tagList = []
	self.highestID = 0
	self.currentID = 0
        rospy.wait_for_service("apriltags_info")

        try:
            info_query = rospy.ServiceProxy("apriltags_info", apriltags_info)
            resp = info_query()

            numberOfTags = len(resp.polygons)

            # Iterate over detected AprilTags
            for i in range(numberOfTags):
                
                # A polygon (access points using poly.points)
                poly = resp.polygons[i]
            
                # The polygon's id (just an integer, 0 is goal (attractive field), all else is bad (repulsive field))
                t_id = resp.ids[i]

                center_x = sum([p.x for p in poly.points]) / len(poly.points)
                center_y = sum([p.y for p in poly.points]) / len(poly.points)

                center = (center_x, center_y)
                
                if t_id == 0:
                    self.tagList.append(Attractive(center, t_id))
                else:
                    self.tagList.append(Repulsive(center, t_id))
		if self.highestID < t_id:
                    self.highestID = t_id
                
	    self.rand = RandomField()
                    
        except Exception, e:
            print "Exception: " + str(e)
        finally:
            self.stop = False

    def stopExecution(self):
        self.stop = True

    def setNextAttractive(self):
	for i in range(len(self.tagList)):

	    if self.tagList[i].t_id == self.currentID:
                self.tagList[i].complete = True

        self.currentID = self.currentID + 1

	for i in range(len(self.tagList)):
	    if self.tagList[i].t_id == self.currentID:
                self.tagList[i] = Attractive(self.tagList[i].poly, self.tagList[i].t_id)
