#!/usr/bin/env bash

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
~/.local/bin/pip install ansible
~/.local/bin/ansible-galaxy install -r requirements.yml
exit 0
