# getting-started
This is a basic repository for getting started with ROS on debian 18.04 based GNU/Linux distribution.

*Note: This is for a UTAH VEXU VAIC specific installation, but can be adapted for other purposes.*

# Installation
1. Open the terminal application.
2. copy the following and in the terminal paste it by `ctrl + shift + v`

*Warning: The following script has root privelges. This could do signifigant harm to your computer. Do this at your own risk. This organization is not responsible for any liability. Check the script at your leisure.*

```bash
sudo apt -y install git  #git is needed to install this repo
cd ~/  #make current directory the home directory
git clone https://github.com/UTAH-VEXU-Robotics/getting-started
cd getting-started  #clone this git repo
sudo source install_ros.sh  #run the ros install script
```
