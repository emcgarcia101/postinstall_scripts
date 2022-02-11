#!/bin/bash
###BASIC SOFTWARE FOR THIS SCRIPT###
apt-get update --allow-releaseinfo-change
apt-get install apt-transport-https -y
apt-get install curl -y
apt-get install git -y
apt-get install build-essential dkms -y

###ADD REPOSITORIES TO UBUNTU BASE DISTROS###
add-apt-repository universe -y
add-apt-repository multiverse -y
add-apt-repository restricted -y

###REPOSITORIES UPDATE AND UPGRADE THE SYSTEM###
apt-get update
apt-get dist-upgrade -y

###INSTALL PACKAGES###
apt-get install exfat-fuse exfat-utils -y
apt-get install gparted -y
apt-get install qbittorrent -y
apt-get install bleachbit -y
apt-get install ubuntu-restricted-extras -y
apt-get install vlc -y
apt-get install rar unrar p7zip-full p7zip-rar -y
apt-get install inetutils-traceroute -y
apt-get install htop -y
apt-get install aptitude build-essential most cups-pdf poppler-utils -y
apt-get install nmap -y
apt-get install tcpdump -y
apt-get install tshark -y
apt-get install wireshark -y
apt-get install zenmap -y
apt-get install network-manager-openvpn-gnome -y
apt-get install ncdu -y
apt-get install gnome-tweak-tool -y
apt-get install xsensors -y
apt-get install lm-sensors -y
apt-get install speedtest-cli -y
apt-get install neofetch -y
apt-get install nload -y
apt-get install iperf -y
apt-get install iperf3 -y
apt-get install openssh-server -y

###VIRTUALBOX###
apt-get install virtualbox virtualbox-qt -y
apt-get install virtualbox-ext-pack virtualbox-guest-additions-iso -y

###SPOTIFY###
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update && apt-get install spotify-client -y

###VS CODE###
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

###GOOGLE CHROME###
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt install google-chrome-stable -y

###DBEAVER###
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list
apt-get update && apt-get install dbeaver-ce -y

###REMMINA###
apt-get install remmina -y

###ETCHER###
echo "deb https://deb.etcher.io stable etcher" | tee /etc/apt/sources.list.d/balena-etcher.list
apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
apt-get update
apt-get install balena-etcher-electron -y

###UPDATE ALL AND FIX THINGS###
apt-get install -f -y
apt-get update --allow-releaseinfo-change
apt-get upgrade -y
apt-get dist-upgrade -y


