#!/bin/bash
echo 'PLEASE WAIT A FEW MINUTES'
python3 --version
pip3 --version
pip3 install --upgrade pip
apt-get update
pip3 install ansible
ansible --version