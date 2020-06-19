#!/bin/bash

echo "would you like to install optional programs (not suggested)? (y | n)"
read isDepend
if [ $isDepend = y ]
then

  echo install snap
  sudo apt -y install snap snapd

  echo install blender
  sudo snap install blender --classic

  echo install git kraken
  sudo snap install gitkraken --classic

  echo "would you like to install programs that don't necessairly relate to utah robotics? (y | n)"
  read isOther
  if [ $isOther = y ]
  then
    echo install discord
    sudo snap install discord --classic

    echo install spotify
    sudo snap install spotify --classic

    echo install OBS
    sudo apt -y install ffmpeg
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt -y install obs-studio

    echo install VLC
    sudo apt -y install vlc
  fi

  echo "are you michael (y | n)"
  read isMichael
  if [ $isMichael = y ]
  then
    echo you better be michael hahahahah \n\n

    echo installing java
    sudo apt install -y openjdk-8-jdk

    echo installing gimp https://tipsonubuntu.com/2016/08/02/install-gimp-2-9-5-ubuntu-16-04/
    sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge
    sudo apt update && sudo apt install -y gimp gimp-gmic
    sudo apt install -y ppa-purge && sudo ppa-purge ppa:otto-kesselgulasch/gimp-edge

    echo installing gimp
    sudo add-apt-repository ppa:inkscape.dev/stable-daily
    sudo apt update
    sudo apt install -y inkscape

    echo setting up environment
    cd ~
    mkdir catkin
    cd catkin
    mkdir src
    cd src
    git clone --recursive https://github.com/UTAH-VEXU-Robotics/gazeboSimulation
    git clone --recursive https://github.com/UTAH-VEXU-Robotics/cv

    cd ~
    mkdir java
    cd java
    git clone https://github.com/acetousk/moqui-selenium
    git clone https://github.com/moqui/moqui-framework/ moqui
    cd moqui

    echo INSTALL GRADLE! https://gradle.org/install/
    echo finish installing moqui https://www.moqui.org/docs/framework/Run+and+Deploy
    cd ~
    echo finish installing intellij https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux
    echo finish installing clion https://www.jetbrains.com/clion/download/download-thanks.html?platform=linux
  fi
  if [ $isMichael = n ]
  then
    echo "it sucks to suck doesn't it :)"
  fi
fi

if [ $isDepend = n ]
then
  echo not installing dependancies
fi
