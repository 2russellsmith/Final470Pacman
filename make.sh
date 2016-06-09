rm -rf build
rm -rf install
rm -rf devel
catkin_make clean
catkin_make clean -j 1
catkin_make
catkin_make -j 8
catkin_make install
catkin_make -j 1
catkin_make install
