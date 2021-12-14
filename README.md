# Ansible Workstation

Ansible and bash scripts for bootstrapping/provisioning my personal desktop
environment.

## Prerequisites

Install [Arch Linux](https://archlinux.org/) with networking configured.

## Install Ansible

Install Ansible:

```bash
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
