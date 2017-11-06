#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install git python-pip -y
sudo pip install ansible

mkdir $HOME/programming
cd $HOME/programming
git clone https://github.com/knutjda/dev-ubuntu-bootstrap.git
cd $HOME/programming/ubuntu-dev-bootstrap

ansible-playbook setup.yml
