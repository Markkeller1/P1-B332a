cmake_minimum_required(VERSION 3.0.2)
project(bot_control)


## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  turtlesim
  geometry_msgs
  move_base_msgs
  actionlib
  kobuki_msgs
  std_msgs
  sensor_msgs
  cv_bridge
  image_transport
 
  )


###################################
## catkin specific configuration ##
###################################
catkin_package(
)

###########
## Build ##
###########
include_directories(
  ${catkin_INCLUDE_DIRS}
)

#busroute
add_executable(${PROJECT_NAME}_busroute src/busroute.cpp)
set_target_properties(${PROJECT_NAME}_busroute PROPERTIES OUTPUT_NAME busroute PREFIX "")
target_link_libraries(${PROJECT_NAME}_busroute
  ${catkin_LIBRARIES}
)

# roundround Executable
add_executable(${PROJECT_NAME}_roundround src/roundround.cpp)
set_target_properties(${PROJECT_NAME}_roundround PROPERTIES OUTPUT_NAME roundround PREFIX "")
target_link_libraries(${PROJECT_NAME}_roundround
  ${catkin_LIBRARIES}
)

# Make Box Executable
add_executable(${PROJECT_NAME}_move_bot src/move_bot.cpp)
set_target_properties(${PROJECT_NAME}_move_bot PROPERTIES OUTPUT_NAME move_bot PREFIX "")
target_link_libraries(${PROJECT_NAME}_move_bot
  ${catkin_LIBRARIES}
)

# bumper Executable
add_executable(${PROJECT_NAME}_bumper src/bumper.cpp)
set_target_properties(${PROJECT_NAME}_bumper PROPERTIES OUTPUT_NAME bumper PREFIX "")
target_link_libraries(${PROJECT_NAME}_bumper
  ${catkin_LIBRARIES}
)


#############
## Install ##
#############

# Mark executables for installation
install(TARGETS
  ${PROJECT_NAME}_move_bot
  ${PROJECT_NAME}_roundround
  ${PROJECT_NAME}_busroute
  ${PROJECT_NAME}_bumper
  
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )
