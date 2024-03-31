#Allow old RSA Algorithm via SSH

sudo cat <<EOF >> /etc/ssh/ssh_config.d/allow_client_rsa.conf
#!/bin/bash

#Allow old RSA Algorithm via SSH
Host *
    HostKeyAlgorithms ssh-rsa
    PubkeyAcceptedKeyTypes ssh-rsa

EOF
