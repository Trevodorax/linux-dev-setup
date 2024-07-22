#!/bin/bash

echo "init download cockpit."
. /etc/os-release
sudo apt install -y -t "${VERSION_CODENAME}"-backports cockpit cockpit-pcp realmd && apt clean

printf '[keyfile]\nunmanaged-devices=none' | sudo tee -a /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
nmcli con add type dummy con-name fake ifname fake0 ip4 1.2.3.4/24 gw4 1.2.3.1

sudo systemctl start cockpit

echo "cockpit download done."