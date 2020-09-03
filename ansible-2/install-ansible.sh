#!/bin/bash
echo 'PLEASE WAIT A FEW MINUTES'
echo 'WE ARE GOING TO INSTALL THE LATEST ANSIBLE VERSION'
python3 --version
pip3 --version
pip3 install --upgrade pip
apt-get update
pip3 install ansible
ansible --verion
