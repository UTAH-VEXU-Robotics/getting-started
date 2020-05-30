!#/bin/bash

#installing other things
sudo apt -y install ros-melodic-ros-tutorials
sudo apt -y install ros-melodic-realsense2-camera
sudo apt -y install ros-melodic-realsense2-description ros-melodic-joy ros-melodic-gazebo-ros
sudo apt -y install snap snapd
sudo apt -y install blender

#realsense
# I forgot to remember the scrips. Ask me

#cv
sudo apt -y install python-pip
pip install numpy
pip install opencv-python

#setup for configuring other things
cd ~/catkin/src
git config --global credential.helper store

#gazebo simulation
git clone https://github.com/UTAH-VEXU-Robotics/gazeboSimulation
echo "export GAZEBO_MODEL_PATH=~/catkin/src/gazeboSimulation/models:$GAZEBO_MODEL_PATH" >> ~/.bashrc
echo "export GAZEBO_RESOURCE_PATH=~/catkin/src/gazeboSimulation:$GAZEBO_MODEL_PATH" >> ~/.bashrc
source ~/.bashrc

#cv
git clone https://github.com/UTAH-VEXU-Robotics/cv

#catkin_make
cd ~/catkin
catkin_make
source devel/setup.bash
roscore &
roslaunch cv camera.launch &
roslaunch gazeboSimulation vexworld.launch &
