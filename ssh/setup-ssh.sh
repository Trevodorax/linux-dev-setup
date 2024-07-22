#!/bin/sh

cd ssh

KEY_DIR="./keys"

mkdir -p "$KEY_DIR"

ssh-keygen -t rsa -b 4096 -f "$KEY_DIR/id_rsa" -N ""

cat "$KEY_DIR/id_rsa.pub" >> ~/.ssh/authorized_keys

sudo chmod 600 ~/.ssh/authorized_keys

zip -r ~/ssh-keys.zip "$KEY_DIR"

rm -rf "$KEY_DIR/*"

cd -
