#!/bin/bash
echo "=========== Update and Upgrade =========="
sudo apt-get update
sudo apt-get upgrade -y
echo "=========== [+] sucessfully Update and Upgrade =========="

echo " === install essentials === "
sudo apt-get install git curl build-essential tree python3 python3-pip htop toilet figlet cmatrix cowsay lolcat fortune-mod

cp .bashrc ~/.bashrc
cp .bash_aliases ~/.bash_aliases
cp .gitconfig ~/.gitconfig
