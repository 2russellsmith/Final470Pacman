from Maze import Maze


class TestMaze(Maze):

    def __init__(self, polygons, width, height, granularity, start, end):
        Maze.__init__(self, polygons, width, height, granularity, start, end)


    def generate_path(self):
        pass
