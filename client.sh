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
apt install -y exfat-fuse gparted qbittorrent bleachbit ubuntu-restricted-extras vlc rar unrar p7zip-full p7zip-rar inetutils-traceroute htop aptitude build-essential most printer-driver-cups-pdf poppler-utils nmap tcpdump tshark wireshark zenmap network-manager-openvpn-gnome ncdu gnome-tweaks xsensors lm-sensors neofetch nload iperf iperf3 openssh-server deepin-terminal

# Register deepin terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/deepin-terminal 50

###VIRTUALBOX###
apt install virtualbox virtualbox-qt -y
apt install virtualbox-ext-pack virtualbox-guest-additions-iso -y

###SPOTIFY###
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
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
apt install speedtest-cli -y

###UPDATE ALL AND FIX THINGS###
apt install -f -y
apt update --allow-releaseinfo-change
apt upgrade -y
apt dist-upgrade -y


