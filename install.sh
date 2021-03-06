#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get --auto-remove --yes remove python-openssl
sudo apt-get install git python-pip -y
export LC_ALL=C
sudo pip install pyOpenSSL
sudo pip install ansible

mkdir -p $HOME/programming
cd $HOME/programming
git -c http.sslVerify=false clone https://github.com/knutjda/dev-ubuntu-bootstrap.git
cd $HOME/programming/dev-ubuntu-bootstrap

ansible-playbook setup.yml
