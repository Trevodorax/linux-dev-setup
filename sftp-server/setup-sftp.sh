#!/bin/sh

# Install OpenSSH Server
if ! command -v sshd >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y openssh-server
fi

# Config SSH for SFTP
sudo sed -i 's/^Subsystem sftp.*/Subsystem sftp internal-sftp/' /etc/ssh/sshd_config

if ! grep -q 'Match group sftp' /etc/ssh/sshd_config; then
    echo "Match group sftp" | sudo tee -a /etc/ssh/sshd_config
    echo "    ChrootDirectory /home/%u" | sudo tee -a /etc/ssh/sshd_config
    echo "    X11Forwarding no" | sudo tee -a /etc/ssh/sshd_config
    echo "    AllowTcpForwarding no" | sudo tee -a /etc/ssh/sshd_config
    echo "    ForceCommand internal-sftp" | sudo tee -a /etc/ssh/sshd_config
    echo "    PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
fi

# Restart ssh
sudo systemctl restart ssh

# Create group sftp
if ! getent group sftp >/dev/null; then
    sudo addgroup sftp
fi
# Add user sftpuser to group sftp
if ! id "sftpuser" >/dev/null 2>&1; then
    sudo useradd -m sftpuser -g sftp
    echo "sftpuser:password" | sudo chpasswd
fi

# Config perm and make repo for sftp
sudo chmod 755 /home/sftpuser
sudo chown root:root /home/sftpuser
sudo mkdir -p /home/sftpuser/sftp
sudo chmod 755 /home/sftpuser/sftp
sudo mkdir -p /home/sftpuser/sftp/files
sudo chown sftpuser:sftp /home/sftpuser/sftp/files

echo "Config done"
