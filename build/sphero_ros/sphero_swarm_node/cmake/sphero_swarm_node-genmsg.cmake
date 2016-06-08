# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sphero_swarm_node: 10 messages, 1 services")

set(MSG_I_FLAGS "-Isphero_swarm_node:/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/jade/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sphero_swarm_node_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" "geometry_msgs/Twist:geometry_msgs/Point:geometry_msgs/Vector3:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose:geometry_msgs/TwistWithCovariance:geometry_msgs/PoseWithCovariance"
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" "geometry_msgs/Quaternion:geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" NAME_WE)
add_custom_target(_sphero_swarm_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sphero_swarm_node" "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)

### Generating Services
_generate_srv_cpp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
)

### Generating Module File
_generate_module_cpp(sphero_swarm_node
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sphero_swarm_node_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sphero_swarm_node_generate_messages sphero_swarm_node_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_cpp _sphero_swarm_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_swarm_node_gencpp)
add_dependencies(sphero_swarm_node_gencpp sphero_swarm_node_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_swarm_node_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)

### Generating Services
_generate_srv_eus(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
)

### Generating Module File
_generate_module_eus(sphero_swarm_node
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sphero_swarm_node_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sphero_swarm_node_generate_messages sphero_swarm_node_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_eus _sphero_swarm_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_swarm_node_geneus)
add_dependencies(sphero_swarm_node_geneus sphero_swarm_node_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_swarm_node_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)

### Generating Services
_generate_srv_lisp(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
)

### Generating Module File
_generate_module_lisp(sphero_swarm_node
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sphero_swarm_node_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sphero_swarm_node_generate_messages sphero_swarm_node_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_lisp _sphero_swarm_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_swarm_node_genlisp)
add_dependencies(sphero_swarm_node_genlisp sphero_swarm_node_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_swarm_node_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)
_generate_msg_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)

### Generating Services
_generate_srv_py(sphero_swarm_node
  "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
)

### Generating Module File
_generate_module_py(sphero_swarm_node
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sphero_swarm_node_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sphero_swarm_node_generate_messages sphero_swarm_node_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroSwarmCollision.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTurn.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroAngularVelocity.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/srv/SpheroInfo.srv" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroOdometry.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroColor.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroImu.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroBackLed.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroTwist.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroHeading.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/sphero_ros/sphero_swarm_node/msg/SpheroDisableStabilization.msg" NAME_WE)
add_dependencies(sphero_swarm_node_generate_messages_py _sphero_swarm_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sphero_swarm_node_genpy)
add_dependencies(sphero_swarm_node_genpy sphero_swarm_node_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sphero_swarm_node_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sphero_swarm_node
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(sphero_swarm_node_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(sphero_swarm_node_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sphero_swarm_node
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(sphero_swarm_node_generate_messages_eus std_msgs_generate_messages_eus)
add_dependencies(sphero_swarm_node_generate_messages_eus geometry_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sphero_swarm_node
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(sphero_swarm_node_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(sphero_swarm_node_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sphero_swarm_node
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(sphero_swarm_node_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(sphero_swarm_node_generate_messages_py geometry_msgs_generate_messages_py)
