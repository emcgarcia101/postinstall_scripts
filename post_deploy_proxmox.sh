#!/bin/bash

#Install sudo package

apt install sudo -y

#####################################################################

#Install QEMU Guest Agent package

sudo apt install qemu-guest-agent -y

#####################################################################

#Remove Cloud-Init from Ubuntu Server

echo 'datasource_list: [ None ]' | sudo -s tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg

sudo apt-get purge cloud-init -y

sudo rm -rf /etc/cloud && sudo rm -rf /var/lib/cloud/

#####################################################################

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

#Allow root login via SSH
sudo rm -rf /etc/ssh/sshd_config.d/*

sudo cat <<EOF >> /etc/ssh/sshd_config.d/allow_root.conf
#!/bin/bash

#Allow root login via SSH
PermitRootLogin yes

EOF

#####################################################################

# Disable IPv6 Rules in UFW
sudo sed -i '7s+yes+no+1' /etc/default/ufw

#####################################################################

# Disable IPv6 Rules in GRUB
sudo sed -i 's+GRUB_CMDLINE_LINUX_DEFAULT=""+GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"+g' /etc/default/grub
sudo sed -i 's+GRUB_CMDLINE_LINUX=""+GRUB_CMDLINE_LINUX="ipv6.disable=1"+g' /etc/default/grub
sudo update-grub

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

#Fix Machine ID
rm -rf /etc/machine-id
rm -rf /var/lib/dbus/machine-id
systemd-machine-id-setup

#####################################################################

#Generate new SSH Keys
rm -rf /etc/ssh/ssh_host_*
dpkg-reconfigure -f readline openssh-server

#####################################################################

#Reboot the Server
echo "Rebooting in 10 Seconds"
sleep 10
reboot
