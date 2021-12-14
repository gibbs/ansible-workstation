#!/usr/bin/env bash

ansible-playbook -c local -i 127.0.0.1, -l 127.0.0.1 playbooks/${1:-all}.yml --ask-become-pass
