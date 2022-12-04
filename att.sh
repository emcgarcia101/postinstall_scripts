#Creata a AutoUpdate Script (Use by own risk)

echo "#!/bin/bash" >> /etc/att
echo "sudo apt update --allow-releaseinfo-change" >> /etc/att
echo "sudo apt upgrade -y" >> /etc/att
echo "sudo apt dist-upgrade -y" >> /etc/att
sudo chmod +x /etc/att
sudo ln -s /etc/att /usr/bin/att
