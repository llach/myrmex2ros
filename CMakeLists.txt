cmake_minimum_required (VERSION 2.8.12)
project (tiago_myrmex)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

find_package(catkin)

catkin_package(CATKIN_DEPENDS
    agni_serial_protocol
)
 
install(DIRECTORY launch/ DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})