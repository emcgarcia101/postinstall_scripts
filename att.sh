#Creata a AutoUpdate Script (Use by own risk)

echo "#!/bin/bash" >> /etc/att.sh
echo "sudo apt update --allow-releaseinfo-change" >> /etc/att.sh
echo "sudo apt upgrade -y" >> /etc/att.sh
echo "sudo apt dist-upgrade -y" >> /etc/att.sh
sudo chmod +x /etc/att.sh
sudo ln -s /etc/att.sh /usr/bin/att
