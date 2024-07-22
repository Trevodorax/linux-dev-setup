#!/bin/sh
cd firewall
sudo ufw default deny incoming

sudo ufw default allow outgoing
sudo ufw allow OpenSSH

sudo ufw enable

sudo ufw allow 9090
sudo ufw allow 5432
sudo ufw allow 5050