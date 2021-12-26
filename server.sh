#!/bin/bash

###BASIC SOFTWARE FOR THIS SCRIPT###
apt-get update --allow-releaseinfo-change
apt-get install apt-transport-https -y
apt-get install curl -y
apt-get install git -y

###ADD REPOSITORIES TO UBUNTU BASE DISTROS###
add-apt-repository universe -y
add-apt-repository multiverse -y
add-apt-repository restricted -y

###REPOSITORIES UPDATE AND UPGRADE THE SYSTEM###
apt-get update
apt-get dist-upgrade -y

###INSTALL PACKAGES###
apt-get install exfat-fuse exfat-utils -y
apt-get install vlc -y
apt-get install rar unrar p7zip-full p7zip-rar -y
apt-get install inetutils-traceroute -y
apt-get install htop -y
apt-get install nmap -y
apt-get install tcpdump -y
apt-get install tshark -y
apt-get install ncdu -y
apt-get install lm-sensors -y
apt-get install speedtest-cli -y
apt-get install neofetch -y
apt-get install nload -y
apt-get install iperf -y
apt-get install iperf3 -y
apt-get install openssh-server -y

###UPDATE ALL AND FIX THINGS###
apt-get install -f -y
apt-get update --allow-releaseinfo-change
apt-get upgrade -y
apt-get dist-upgrade -y
