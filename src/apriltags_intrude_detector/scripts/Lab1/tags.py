import math



def calcDistance(pointA, pointB):
    return math.sqrt(((pointA[0] - pointB[0])**2) + ((pointA[1] - pointB[1])**2))


def negativeSign(value):

    if value < 0:
        return 1
    else:
        return -1


class Tag:
    def  __init__(self, center, t_id):
        
        self.t_id = t_id
        self.center = center
        self.radius = 15       

        # This variable represents the distance from the radius of the tag where the field strength changes (s in the formulas)
        self.spread = 20

        # Alpha and Beta for attractive/repulsive field formulas respectively
        self.strength = 1

    def calcDelta(self, curLocation):
        pass

    def goal(self, curLocation):
	pass

    def calcAngle(self, curLocation):

        # X difference
        x_diff = self.center[0] - curLocation[0]

        # Y difference
        y_diff = self.center[1] - curLocation[1]

        # Angle between robot and center of tag
        # Documentation lists y as first parameter
        # Returns atan(y / x)
        theta = math.atan2(y_diff, x_diff)

        return theta * -1


class Repulsive(Tag):
    def __init__(self, center, t_id):
        Tag.__init__(self, center, t_id)
        self.type = "r"
    
    def goal(self, curLocation):
        return False

    def calcDelta(self, curLocation):
        d = calcDistance(self.center, curLocation)

        theta = self.calcAngle(curLocation)

        delta_x = 0
        delta_y = 0

        # Inside the obstacle
        # Deltas are infinite
        if d < self.radius:
            delta_x = negativeSign(math.cos(theta)) * sys.maxint
            delta_y = negativeSign(math.sin(theta)) * sys.maxint

        elif self.radius <= d and d <= self.spread + self.radius:
            delta_x = -1 * self.strength * (self.spread + self.radius - d) * math.cos(theta)
            delta_y = -1 * self.strength * (self.spread + self.radius - d) * math.sin(theta)

        elif d > self.spread + self.radius:
            delta_x = 0
            delta_y = 0

        return (delta_x, delta_y)


class RandomField(Tag):
    def __init__(self):
	Tag.__init__(self, None, -1)

    def calcDelta(self, curLocation):
	force = 1
	xDelta = random.randint(-1*force, force)
	yDelta = random.randint(-1*force, force)
	return(xDelta, yDelta)


class Attractive(Tag):
    def __init__(self, center, t_id):
        Tag.__init__(self, center, t_id)
        self.strength = 2
	self.type = "a"
        self.complete = False

    def goal(self, curLocation):
        d = calcDistance(self.center, curLocation)
        return d < self.radius and not self.complete
	    
    def calcDelta(self, curLocation):
	if self.complete:
            return (0,0)
        
        d = calcDistance(self.center, curLocation)
        theta = self.calcAngle(curLocation)

        delta_x = 0
        delta_y = 0

        # Inside the goal, stop the robot
        if d < self.radius:
            delta_x = 0
            delta_y = 0

        elif self.radius <= d and d <= self.spread + self.radius:
            delta_x = self.strength * (d - self.radius) * math.cos(theta)
            delta_y = self.strength * (d - self.radius) * math.sin(theta)

        elif d > self.spread + self.radius:
            delta_x = self.strength * self.spread * math.cos(theta)
            delta_y = self.strength * self.spread * math.sin(theta)

        return (delta_x, delta_y)
