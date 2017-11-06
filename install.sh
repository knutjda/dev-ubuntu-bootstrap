#!/usr/bin/env bash

sudo apt-get install git python-pip
sudo pip install ansible

mkdir $HOME/programming
cd $HOME/programming
git clone https://gitlab.acando.no/mattilsynet/ubuntu-dev-bootstrap.git

