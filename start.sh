#!/bin/bash

sudo ./init/initial-setup.sh

sudo ./zsh/setup-zsh.sh

sudo ./ssh/setup-ssh.sh

sudo ./sftp-server/setup-firewall.sh

sudo ./sftp-server/setup-sftp.sh

sudo ./services/php-web-app/cockpit.sh

sudo ./services/docker.sh

sudo ./android-env/setup-android-env.sh

sudo docker-compose up --build -d



