#!/bin/bash

echo "Are you sure you would like to install ros? (y | n)"
read varname
if [ $varname = y ]
then
	echo starting to install ros

	#install ros
	echo adding keys

	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
	curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

	echo updating deps and installing

	sudo apt update
	sudo apt -y upgrade
	sudo apt -y install ros-melodic-desktop-full
	sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-roslaunch

  source ~/.bashrc
  source /opt/ros/melodic/setup.bash

fi
if [ $varname = n ]
then
	echo not installing ros
fi

echo "Would you like to add to your bashrc? (y | n) default: y"
read isBashrc
if [ $isBashrc = y ]
then
	echo /opt/ros/melodic/setup.bash >> ~/.bashrc
	source /opt/ros/melodic/setup.bash >> ~/.bashrc
fi
if [ $isBashrc = n ]
then
  echo not doing the bashrc thing
fi

echo "would you like to init and update rosdep? (y | n)"
read isRosdep
if [ $isRosdep = y ]
then
	sudo rosdep init
	rosdep update
fi
if [ $isRosdep = n ]
then
  echo not rosdep-ing
fi

#ros dependancies
echo installing dependancies
chmod +x ./install_other_things.sh
sudo sh ./install_other_things.sh

echo finished
