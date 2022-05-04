#!/usr/bin/env bash

# shellcheck source=/dev/null
source /etc/os-release

if [[ $ID == "ubuntu" ]]; then
  sudo apt-get install curl python-is-python3 -y
fi

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc
source ~/.bashrc
~/.local/bin/pip install ansible
~/.local/bin/ansible-galaxy install -r requirements.yml
exit 0
