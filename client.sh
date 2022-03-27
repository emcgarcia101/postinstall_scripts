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
apt install gparted -y
apt install qbittorrent -y
apt install bleachbit -y
apt install ubuntu-restricted-extras -y
apt install vlc -y
apt install rar unrar p7zip-full p7zip-rar -y
apt install inetutils-traceroute -y
apt install htop -y
apt install aptitude build-essential most cups-pdf poppler-utils -y
apt install nmap -y
apt install tcpdump -y
apt install tshark -y
apt install wireshark -y
apt install zenmap -y
apt install network-manager-openvpn-gnome -y
apt install ncdu -y
apt install gnome-tweak-tool -y
apt install xsensors -y
apt install lm-sensors -y
apt install neofetch -y
apt install nload -y
apt install iperf -y
apt install iperf3 -y
apt install openssh-server -y

###VIRTUALBOX###
apt install virtualbox virtualbox-qt -y
apt install virtualbox-ext-pack virtualbox-guest-additions-iso -y

###SPOTIFY###
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt update && apt install spotify-client -y

###VS CODE###
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

###GOOGLE CHROME###
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install google-chrome-stable -y

###DBEAVER###
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list
apt update && apt install dbeaver-ce -y

###REMMINA###
apt install remmina remmina-common remmina-plugin-rdp remmina-plugin-secret remmina-plugin-vnc -y

###SPEEDTEST###
apt install curl -y
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
apt install speedtest -y

###UPDATE ALL AND FIX THINGS###
apt install -f -y
apt update --allow-releaseinfo-change
apt upgrade -y
apt dist-upgrade -y


