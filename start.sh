#!/bin/bash

sudo chmod a+x ./init/initial-setup.sh
sudo chmod a+x ./zsh/setup-zsh.sh
sudo chmod a+x ./ssh/setup-ssh.sh
sudo chmod a+x ./firewall/setup-firewall.sh
sudo chmod a+x ./sftp-server/setup-sftp.sh
sudo chmod a+x ./services/php-web-app/cockpit.sh
sudo chmod a+x ./services/docker.sh
sudo chmod a+x ./android-env/setup-android-env.sh

./init/initial-setup.sh

./zsh/setup-zsh.sh

./ssh/setup-ssh.sh

sudo ./firewall/setup-firewall.sh

sudo ./sftp-server/setup-sftp.sh

sudo ./services/php-web-app/cockpit.sh

sudo ./services/docker.sh

./android-env/setup-android-env.sh

sudo docker-compose up --build -d



