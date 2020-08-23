cmake_minimum_required(VERSION 2.8.3)
project(icra_nav)
set(CMAKE_CXX_STANDARD 11)
set(OpenCV_DIR /opt/ros/kinetic/share/OpenCV-3.3.1-dev/)

find_package(catkin REQUIRED)

find_package(catkin REQUIRED COMPONENTS
  OpenCV
  message_generation
  roscpp
  tf
  sensor_msgs
  cv_bridge
  std_msgs image_transport
)
add_service_files(FILES
  add_ob_srv.srv
  c_path_srv.srv
  c_start_end_srv.srv
  start_end_srv.srv
  path_srv.srv
)

add_message_files(FILES
  punish.msg
)

generate_messages(DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime
#  INCLUDE_DIRS include
#  LIBRARIES icra_nav
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS}
# include
# ${catkin_INCLUDE_DIRS}
)


add_executable(nav_node
  src/nav_node.cpp src/navigation/navigation.cpp
)
add_dependencies(nav_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(nav_node
  ${catkin_LIBRARIES} ${OpenCV_LIBS}
)


add_executable(path_planning
  src/path_planning.cpp src/findpath/find_path.cpp src/findpath/build_map.cpp src/findpath/global_planning.cpp
)
add_dependencies(path_planning ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(path_planning
  ${catkin_LIBRARIES}
)



add_executable(dynamic_obstacle
  src/dynamic_obstacle.cpp
)
add_dependencies(dynamic_obstacle ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(dynamic_obstacle
  ${catkin_LIBRARIES}
)

add_executable(trans_odom
  src/trans_odom.cpp
)
add_dependencies(trans_odom ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(trans_odom
  ${catkin_LIBRARIES}
)
add_executable(trans_odom1
  src/trans_odom1.cpp
)
add_dependencies(trans_odom1 ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(trans_odom1
  ${catkin_LIBRARIES}
)

