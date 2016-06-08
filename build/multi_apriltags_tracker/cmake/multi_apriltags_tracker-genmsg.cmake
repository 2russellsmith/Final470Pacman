# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "multi_apriltags_tracker: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imulti_apriltags_tracker:/home/nu/catkin_ws/src/multi_apriltags_tracker/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/jade/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(multi_apriltags_tracker_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" NAME_WE)
add_custom_target(_multi_apriltags_tracker_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "multi_apriltags_tracker" "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" "geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(multi_apriltags_tracker
  "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_apriltags_tracker
)

### Generating Services

### Generating Module File
_generate_module_cpp(multi_apriltags_tracker
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_apriltags_tracker
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(multi_apriltags_tracker_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(multi_apriltags_tracker_generate_messages multi_apriltags_tracker_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" NAME_WE)
add_dependencies(multi_apriltags_tracker_generate_messages_cpp _multi_apriltags_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_apriltags_tracker_gencpp)
add_dependencies(multi_apriltags_tracker_gencpp multi_apriltags_tracker_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_apriltags_tracker_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(multi_apriltags_tracker
  "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_apriltags_tracker
)

### Generating Services

### Generating Module File
_generate_module_eus(multi_apriltags_tracker
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_apriltags_tracker
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(multi_apriltags_tracker_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(multi_apriltags_tracker_generate_messages multi_apriltags_tracker_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" NAME_WE)
add_dependencies(multi_apriltags_tracker_generate_messages_eus _multi_apriltags_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_apriltags_tracker_geneus)
add_dependencies(multi_apriltags_tracker_geneus multi_apriltags_tracker_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_apriltags_tracker_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(multi_apriltags_tracker
  "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_apriltags_tracker
)

### Generating Services

### Generating Module File
_generate_module_lisp(multi_apriltags_tracker
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_apriltags_tracker
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(multi_apriltags_tracker_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(multi_apriltags_tracker_generate_messages multi_apriltags_tracker_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" NAME_WE)
add_dependencies(multi_apriltags_tracker_generate_messages_lisp _multi_apriltags_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_apriltags_tracker_genlisp)
add_dependencies(multi_apriltags_tracker_genlisp multi_apriltags_tracker_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_apriltags_tracker_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(multi_apriltags_tracker
  "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_apriltags_tracker
)

### Generating Services

### Generating Module File
_generate_module_py(multi_apriltags_tracker
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_apriltags_tracker
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(multi_apriltags_tracker_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(multi_apriltags_tracker_generate_messages multi_apriltags_tracker_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/multi_apriltags_tracker/msg/april_tag_pos.msg" NAME_WE)
add_dependencies(multi_apriltags_tracker_generate_messages_py _multi_apriltags_tracker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(multi_apriltags_tracker_genpy)
add_dependencies(multi_apriltags_tracker_genpy multi_apriltags_tracker_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS multi_apriltags_tracker_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_apriltags_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/multi_apriltags_tracker
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(multi_apriltags_tracker_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(multi_apriltags_tracker_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_apriltags_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/multi_apriltags_tracker
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(multi_apriltags_tracker_generate_messages_eus std_msgs_generate_messages_eus)
add_dependencies(multi_apriltags_tracker_generate_messages_eus geometry_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_apriltags_tracker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/multi_apriltags_tracker
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(multi_apriltags_tracker_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(multi_apriltags_tracker_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_apriltags_tracker)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_apriltags_tracker\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/multi_apriltags_tracker
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(multi_apriltags_tracker_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(multi_apriltags_tracker_generate_messages_py geometry_msgs_generate_messages_py)
