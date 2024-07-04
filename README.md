# Linux Dev VM

## Installation

### Creation of the machine

Start a new Ubuntu Server 22.04+ with the following resources:
- at least 2Go RAM
- at least 20Go Disk Space

For the config, set it up with these
- System Language: English
- User: modo / Moderator
- Password: Modo@1234
- Server Name: linux-dev-final-vm

Copy this complete folder to the machine (you can get it at https://github.com/Trevodorax/linux-dev-setup.git)

```sh
git clone https://github.com/Trevodorax/linux-dev-setup.git
cd linux-dev-setup
```

From the root of the folder, and with the created user, run the following commands **in order**.

### Setup

Make the basic user and project modifications and intallations
```sh
init/initial-setup.sh
```

Give the user a nice shell
```sh
zsh/setup-zsh.sh
```

Make sure the right users can access the machine remotely
```sh
ssh/setup-ssh.sh
```

Provide the tools for android development to the user (the second command should display "OK")
```sh
android-env/setup-android-env.sh
android-env/test-android-env.sh
```

Start all the services we need on the machine

```sh
cd services
docker compose up -d
cd -
```

Secure the machine with a firewall

```sh
firewall/setup-firewall.sh
```
