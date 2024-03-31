#Allow old RSA Algorithm via SSH

sudo cat <<EOF >> /etc/ssh/sshd_config.d/allow_root.conf
#!/bin/bash

#Allow old RSA Algorithm via SSH
Host *
    HostKeyAlgorithms ssh-rsa
    PubkeyAcceptedKeyTypes ssh-rsa

EOF
