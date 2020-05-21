!#/bin/bash

#set log
echo "starting install ros log" > ~/install_ros_log.txt

#install ros
echo "adding keys" > ~/install_ros_log.txt

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

echo "updating deps and installing" > ~/install_ros_log.txt

sudo apt update
sudo apt upgrade
sudo apt install ros-melodic-desktop-full

#configure ros
echo "configuring ros" > ~/install_ros_log.txt

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/melodic/setup.bash

#ros dependancies
echo "installing dependancies" > ~/install_ros_log.txt

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update

chmod +x install_other_things.sh
source install_other_things.sh


