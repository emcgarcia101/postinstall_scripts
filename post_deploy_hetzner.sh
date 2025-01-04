#!/bin/bash

#Basic Software for this script
apt update --allow-releaseinfo-change
apt install apt-transport-https -y
apt install curl -y
apt install git -y

#Add repositories to Ubuntu Base Distros
add-apt-repository universe -y
add-apt-repository multiverse -y
add-apt-repository restricted -y

#Create auto update script

sudo mkdir /etc/custom_scripts/

sudo cat <<EOF >> /etc/custom_scripts/att.sh
#!/bin/bash

#Create a AutoUpdate Script (Use by own risk)

sudo apt update --allow-releaseinfo-change
sudo apt full-upgrade -y

EOF

sudo chmod +x /etc/custom_scripts/att.sh
sudo ln -s /etc/custom_scripts/att.sh /usr/bin/att

#####################################################################

#Enable Firewall and Allow SSH
sudo ufw allow ssh
yes | sudo ufw enable

#####################################################################

#Install basic tools
sudo apt-get install neofetch nmap iperf iperf3 nload speedtest-cli ncdu sysstat mtr -y

#####################################################################

# Enable SysStat
sudo sed -i '9s+false+true+1' /etc/default/sysstat
sudo systemctl start sysstat
sudo systemctl enable sysstat

#####################################################################

#Set timezone to Brazil
sudo timedatectl set-timezone America/Sao_Paulo

#####################################################################

#Reboot the Server
echo "Rebooting in 10 Seconds"
sleep 10
reboot
