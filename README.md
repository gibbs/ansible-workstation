# Ansible Workstation

![Ansible Lint](https://github.com/gibbs/ansible-workstation/actions/workflows/test.yml/badge.svg)

Ansible provisioning and management of my very boring, but highly functional,
i3 and GNOME setup.

![Desktop](screenshot-2021-12-16_21-08-26.png?raw=true)

## Prerequisites

Install [Arch Linux](https://archlinux.org/) or
[Ubuntu Focal LTS](https://ubuntu.com/download/server) with networking
configured.

## Install Ansible

Install Ansible:

```bash
# In Ubuntu provide a python path
apt install python-is-python3

# Install pip and ansible
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip install ansible
```

Clone this repository, download the collection dependencies
and run:

```bash
cd ~/
git clone https://github.com/gibbs/ansible-desktop.git && cd ansible-desktop
ansible-galaxy install -r requirements.yml
```

Run Ansible playbook:

```bash
ansible-playbook -c local -i 127.0.0.1, -l 127.0.0.1 playbooks/all.yml --ask-become-pass
```
