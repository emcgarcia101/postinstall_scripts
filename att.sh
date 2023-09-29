sudo mkdir /etc/custom_scripts/

cat <<EOF >> /etc/custom_scripts/att.sh
#!/bin/bash

#Create a AutoUpdate Script (Use by own risk)

sudo apt update --allow-releaseinfo-change
sudo apt full-upgrade -y

EOF

chmod +x /etc/custom_scripts/att.sh
ln -s /etc/custom_scripts/att.sh /usr/bin/att
