!#/bin/bash

#installing other things
sudo apt -y install ros-melodic-ros-tutorials
sudo apt -y install ros-melodic-realsense2-camera
sudo apt -y install ros-melodic-realsense2-description

#setup for configuring other things
cd ~/catkin/src

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



