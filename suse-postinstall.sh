#!/bin/bash

#Install sudo package

zypper --non-interactive install sudo

#####################################################################

#Install QEMU Guest Agent package

sudo zypper --non-interactive install qemu-guest-agent

#####################################################################

#Create auto update script

sudo mkdir /etc/custom_scripts/

sudo cat <<EOF >> /etc/custom_scripts/att.sh
#!/bin/bash

#Create a AutoUpdate Script (Use by own risk)

sudo zypper --non-interactive refresh
sudo zypper --non-interactive update

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

# Disable IPv6 Rules in GRUB
sudo sed -i 's+GRUB_CMDLINE_LINUX_DEFAULT=""+GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"+g' /etc/default/grub
sudo sed -i 's+GRUB_CMDLINE_LINUX=""+GRUB_CMDLINE_LINUX="ipv6.disable=1"+g' /etc/default/grub
sudo update-grub

#####################################################################

#Enable Firewall and Allow SSH
sudo firewall-cmd --set-default-zone drop
sudo firewall-cmd --zone=drop --change-interface=eth0 --permanent
sudo firewall-cmd --reload

#####################################################################

#Install basic tools
sudo zypper --non-interactive install neofetch nmap iperf nload speedtest-cli ncdu sysstat mtr

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
sudo ssh-keygen -A

#####################################################################

#Reboot the Server
echo "Rebooting in 10 Seconds"
sleep 10
reboot