execute_process(COMMAND "/home/nu/catkin_ws/build/sphero_ros/bb8_driver/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/nu/catkin_ws/build/sphero_ros/bb8_driver/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
