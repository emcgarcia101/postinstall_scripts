#!/bin/bash

###BASIC SOFTWARE FOR THIS SCRIPT###
apt update --allow-releaseinfo-change
apt install apt-transport-https -y
apt install curl -y
apt install git -y
apt install build-essential dkms -y

###ADD REPOSITORIES TO UBUNTU BASE DISTROS###
add-apt-repository universe -y
add-apt-repository multiverse -y
add-apt-repository restricted -y

###REPOSITORIES UPDATE AND UPGRADE THE SYSTEM###
apt update
apt dist-upgrade -y

###INSTALL PACKAGES###
apt install exfat-fuse exfat-utils -y
apt install rar unrar p7zip-full p7zip-rar -y
apt install inetutils-traceroute -y
apt install htop -y
apt install nmap -y
apt install tcpdump -y
apt install tshark -y
apt install ncdu -y
apt install lm-sensors -y
apt install neofetch -y
apt install nload -y
apt install iperf -y
apt install iperf3 -y
apt install openssh-server -y

###SPEEDTEST###
apt install curl -y
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
apt install speedtest -y

###UPDATE ALL AND FIX THINGS###
apt install -f -y
apt update --allow-releaseinfo-change
apt upgrade -y
apt dist-upgrade -y
