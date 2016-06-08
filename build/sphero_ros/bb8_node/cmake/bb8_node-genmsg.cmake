# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bb8_node: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ibb8_node:/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bb8_node_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" NAME_WE)
add_custom_target(_bb8_node_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bb8_node" "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bb8_node
  "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bb8_node
)

### Generating Services

### Generating Module File
_generate_module_cpp(bb8_node
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bb8_node
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bb8_node_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bb8_node_generate_messages bb8_node_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" NAME_WE)
add_dependencies(bb8_node_generate_messages_cpp _bb8_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bb8_node_gencpp)
add_dependencies(bb8_node_gencpp bb8_node_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bb8_node_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(bb8_node
  "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bb8_node
)

### Generating Services

### Generating Module File
_generate_module_eus(bb8_node
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bb8_node
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bb8_node_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bb8_node_generate_messages bb8_node_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" NAME_WE)
add_dependencies(bb8_node_generate_messages_eus _bb8_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bb8_node_geneus)
add_dependencies(bb8_node_geneus bb8_node_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bb8_node_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bb8_node
  "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bb8_node
)

### Generating Services

### Generating Module File
_generate_module_lisp(bb8_node
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bb8_node
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bb8_node_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bb8_node_generate_messages bb8_node_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" NAME_WE)
add_dependencies(bb8_node_generate_messages_lisp _bb8_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bb8_node_genlisp)
add_dependencies(bb8_node_genlisp bb8_node_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bb8_node_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bb8_node
  "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bb8_node
)

### Generating Services

### Generating Module File
_generate_module_py(bb8_node
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bb8_node
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bb8_node_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bb8_node_generate_messages bb8_node_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zeta/catkin_ws/src/sphero_ros/bb8_node/msg/SpheroCollision.msg" NAME_WE)
add_dependencies(bb8_node_generate_messages_py _bb8_node_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bb8_node_genpy)
add_dependencies(bb8_node_genpy bb8_node_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bb8_node_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bb8_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bb8_node
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(bb8_node_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bb8_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bb8_node
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(bb8_node_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bb8_node)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bb8_node
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(bb8_node_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bb8_node)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bb8_node\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bb8_node
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(bb8_node_generate_messages_py std_msgs_generate_messages_py)
