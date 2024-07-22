#!/bin/bash

chmod +x ./init/initial-setup.sh
chmod +x ./zsh/setup-zsh.sh
chmod +x ./ssh/setup-ssh.sh
chmod +x ./sftp-server/setup-firewall.sh
chmod +x ./sftp-server/setup-sftp.sh
chmod +x ./services/php-web-app/cockpit.sh
chmod +x ./services/docker.sh
chmod +x ./android-env/setup-android-env.sh

./init/initial-setup.sh

./zsh/setup-zsh.sh

./ssh/setup-ssh.sh

sudo ./sftp-server/setup-firewall.sh

sudo ./sftp-server/setup-sftp.sh

sudo ./services/php-web-app/cockpit.sh

sudo ./services/docker.sh

./android-env/setup-android-env.sh

sudo docker-compose up --build -d



