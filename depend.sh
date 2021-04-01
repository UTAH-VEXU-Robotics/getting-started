#!/bin/bash

#ros dependancies
echo "would you like to install dependancies? (y | n)"
read isDepend
if [ $isDepend = y ]
then
  echo installing dependancies
  apt list --installed > installed.txt

  echo ros
  rosdep () {
      sudo apt-get -y -q install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential ros-noetic-catkin python-catkin-tools ros-noetic-roslib
      echo installed ros stuff
  }
  if ! (grep -q ros-noetic-catkin installed.txt); then
    rosdep
  else
    echo "would you like to install ros dependancies? (y | n)"
    read isros
    if [ $isros = y ]; then
      rosdep
    fi
  fi

  echo realsense
  realsensedep () {
    sudo apt-get -y -q install ros-noetic-realsense2-camera ros-noetic-realsense2-description
    sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key  F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
    sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
    sudo apt update
    sudo apt-get -y -q install  librealsense2-dkms librealsense2-utils librealsense2-dev
    rm installed.txt
    apt list --installed > installed.txt
    echo installed realsense stuff
  }
  if (! grep -q librealsense2-dkms installed.txt); then
      realsensedep
  else
    echo "would you like to install realsense dependancies? (y | n)"
    read isrealsense
    if [ $isrealsense = y ]; then
      realsensedep
    fi
  fi

  echo rqt and rviz
  echo ""
  rqtdep () {
    sudo apt-get -y -q install ros-noetic-rqt ros-noetic-rqt-common-plugins ros-noetic-rqt-robot-plugins ros-noetic-urdf-tutorial
    echo installed rqt and rviz stuff
  }
  if (! grep -q ros-noetic-rqt-robot-plugins installed.txt ); then
    rqtdep
  else
    echo "would you like to install rqt and rviz dependancies? (y | n)"
    read isrqt
    if [ $isrqt = y ]; then
      rqtdep
    fi
  fi

  echo controlandmessages
  echo ""
  controlandmessagesdep (){
    sudo apt-get -y -q install ros-noetic-controller-manager ros-noetic-teleop-twist-joy ros-noetic-robot-state-publisher ros-noetic-message-to-tf ros-noetic-joint-state-controller ros-noetic-joy
    sudo apt-get -y -q install  ros-noetic-ros-control  ros-noetic-ros-controllers
    echo installed controlandmessages stuff
  }
  if (! grep -q ros-noetic-joy installed.txt ); then
      controlandmessagesdep
  else
    echo "would you like to install controlandmessages dependancies? (y | n)"
    read iscontrolandmessages
    if [ $iscontrolandmessages = y ]; then
      controlandmessagesdep
    fi
  fi

  echo navigation
  navigationdep () {
    sudo apt-get -y -q install ros-noetic-map-server ros-noetic-navigation-tutorials ros-noetic-navigation ros-noetic-amcl ros-noetic-teb-local-planner
    echo installed navigation stuff
  }
  echo ""
  if (! grep -q ros-noetic-navigation-tutorials installed.txt ); then
      navigationdep
  else
    echo "would you like to install navigation dependancies? (y | n)"
    read isgazebo
    if [ $isgazebo = y ]; then
      navigationdep
    fi
  fi

  echo gazebo
  gazebodep () {
    sudo apt-get -y -q install ros-noetic-gazebo-ros ros-noetic-gazebo-ros-control ros-noetic-gazebo-ros-pkgs ros-noetic-joint-state-publisher-gui python-pygame
    echo installed gazebo stuff
  }
  echo ""
  if (! grep -q ros-noetic-gazebo-ros-pkgs installed.txt ); then
      gazebodep
  else
    echo "would you like to install gazebo dependancies? (y | n)"
    read isgazebo
    if [ $isgazebo = y ]; then
      gazebodep
    fi
  fi

  echo ""
  echo "would you like to setup gazebo configuration (y | n)"
  echo ""
  echo "  note: this will assume that this directory is in the catkin_ws/src/getting-started directory!"
  read isGazebo
  if [ $isGazebo = y ]
  then
    if [ ! -d "../gazeboSimulation" ]
    then
      cd ..
      echo need to clone the gazeboSimulation repo, it doesn\'t exist
      git clone --recursive https://github.com/UTAH-VEXU-Robotics/gazeboSimulation      
      cd getting-started/
    fi
    echo adding to bashrc
    echo "export GAZEBO_MODEL_PATH=`pwd`/gazeboSimulation/models:$GAZEBO_MODEL_PATH" >> ~/.bashrc
    echo "export GAZEBO_RESOURCE_PATH=`pwd`/gazeboSimulation:$GAZEBO_RESOURCE_PATH" >> ~/.bashrc
  fi

  echo cv depends
  cvdep(){
    sudo apt-get -y -q install ros-noetic-image-transport ros-noetic-depth-image-proc ros-noetic-image-pipeline ros-noetic-openni-launch
    sudo apt-get -y -q install python-pip
    sudo pip install numpy
    sudo pip install opencv-python
    echo installed cv stuff
  }
  if (! grep -q ros-noetic-image-pipeline installed.txt); then
    cvdep
  else
    echo "would you like to install cv dependancies? (y | n)"
    read iscv
    if [ $iscv = y ]; then
      cvdep
    fi
  fi

  rm installed.txt

fi
if [ $isDepend = n ]
then
  echo not installing dependancies
fi
