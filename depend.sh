#!/bin/bash

#ros dependancies
echo "would you like to install dependancies? (y | n)"
read isDepend
if [ $isDepend = y ]
then
  echo installing dependancies

  sudo apt -y install ros-melodic-ros-tutorials
  sudo apt -y install ros-melodic-realsense2-camera
  sudo apt -y install ros-melodic-realsense2-description ros-melodic-joy ros-melodic-gazebo-ros
  sudo apt -y install ros-melodic-rqt-common-plugins ros-melodic-rqt-robot-plugins
  sudo apt -y install ros-melodic-controller-manager ros-melodic-teleop-twist-joy ros-melodic-robot-state-publisher ros-melodic-message-to-tf ros-melodic-joint-state-controller ros-melodic-urdf-tutorial
  sudo apt -y install  ros-melodic-ros-control  ros-melodic-ros-controllers ros-melodic-gazebo-ros-control

  echo realsense
  echo I forgot to remember the scrips. Ask me

  echo cv depends
  sudo apt -y install ros-melodic-image-transport ros-melodic-depth-image-proc ros-melodic-image-pipeline ros-melodic-openni-launch
  sudo apt -y install python-pip
  pip install numpy
  pip install opencv-python

fi
if [ $isDepend = n ]
then
  echo not installing dependancies
fi

