# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "apriltags_intrude_detector: 0 messages, 2 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/jade/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(apriltags_intrude_detector_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" NAME_WE)
add_custom_target(_apriltags_intrude_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apriltags_intrude_detector" "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" ""
)

get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" NAME_WE)
add_custom_target(_apriltags_intrude_detector_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "apriltags_intrude_detector" "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" "geometry_msgs/Polygon:geometry_msgs/Point32"
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags_intrude_detector
)
_generate_srv_cpp(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags_intrude_detector
)

### Generating Module File
_generate_module_cpp(apriltags_intrude_detector
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags_intrude_detector
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(apriltags_intrude_detector_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(apriltags_intrude_detector_generate_messages apriltags_intrude_detector_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_cpp _apriltags_intrude_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_cpp _apriltags_intrude_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags_intrude_detector_gencpp)
add_dependencies(apriltags_intrude_detector_gencpp apriltags_intrude_detector_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags_intrude_detector_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags_intrude_detector
)
_generate_srv_eus(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags_intrude_detector
)

### Generating Module File
_generate_module_eus(apriltags_intrude_detector
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags_intrude_detector
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(apriltags_intrude_detector_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(apriltags_intrude_detector_generate_messages apriltags_intrude_detector_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_eus _apriltags_intrude_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_eus _apriltags_intrude_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags_intrude_detector_geneus)
add_dependencies(apriltags_intrude_detector_geneus apriltags_intrude_detector_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags_intrude_detector_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags_intrude_detector
)
_generate_srv_lisp(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags_intrude_detector
)

### Generating Module File
_generate_module_lisp(apriltags_intrude_detector
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags_intrude_detector
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(apriltags_intrude_detector_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(apriltags_intrude_detector_generate_messages apriltags_intrude_detector_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_lisp _apriltags_intrude_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_lisp _apriltags_intrude_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags_intrude_detector_genlisp)
add_dependencies(apriltags_intrude_detector_genlisp apriltags_intrude_detector_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags_intrude_detector_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/jade/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/jade/share/geometry_msgs/cmake/../msg/Point32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector
)
_generate_srv_py(apriltags_intrude_detector
  "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector
)

### Generating Module File
_generate_module_py(apriltags_intrude_detector
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(apriltags_intrude_detector_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(apriltags_intrude_detector_generate_messages apriltags_intrude_detector_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_intrude.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_py _apriltags_intrude_detector_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nu/catkin_ws/src/apriltags_intrude_detector/srv/apriltags_info.srv" NAME_WE)
add_dependencies(apriltags_intrude_detector_generate_messages_py _apriltags_intrude_detector_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(apriltags_intrude_detector_genpy)
add_dependencies(apriltags_intrude_detector_genpy apriltags_intrude_detector_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS apriltags_intrude_detector_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags_intrude_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/apriltags_intrude_detector
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(apriltags_intrude_detector_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags_intrude_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/apriltags_intrude_detector
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(apriltags_intrude_detector_generate_messages_eus geometry_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags_intrude_detector)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/apriltags_intrude_detector
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(apriltags_intrude_detector_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/apriltags_intrude_detector
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(apriltags_intrude_detector_generate_messages_py geometry_msgs_generate_messages_py)
