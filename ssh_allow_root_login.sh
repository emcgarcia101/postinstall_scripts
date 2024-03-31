#Allow root login via SSH
sudo rm -rf /etc/ssh/sshd_config.d/*

sudo cat <<EOF >> /etc/ssh/sshd_config.d/allow_root.conf
#!/bin/bash

#Allow root login via SSH
PermitRootLogin yes

EOF
