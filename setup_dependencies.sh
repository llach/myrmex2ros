#!/bin/bash

if [ -z $ROS_DISTRO ]; then
    echo "ROS_DISTRO is not set. Please source a ROS setup file."
    exit 1
fi

mkdir -p dependencies_ws/src
cd dependencies_ws
catkin init
vcs import . < ../myrmex2ros.rosinstall
catkin b

echo "run 'source dependencies_ws/devel/setup.bash' to use the dependencies workspace."
