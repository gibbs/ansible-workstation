#!/usr/bin/env bash
#
# Install Ansible and the collection/role dependencies.
set -euo pipefail

cd "$(dirname "$0")/.."

# shellcheck source=/dev/null
source /etc/os-release

case " ${ID} ${ID_LIKE:-} " in
  *" arch "* | *" archarm "*)
    sudo pacman -Syu --needed --noconfirm ansible git python-pip
    ;;
  *" ubuntu "* | *" debian "*)
    sudo apt-get update
    sudo apt-get install -y curl git python-is-python3
    curl -sSfO https://bootstrap.pypa.io/get-pip.py
    python get-pip.py --user
    rm -f get-pip.py
    export PATH="$HOME/.local/bin:$PATH"
    # shellcheck disable=SC2016
    grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc ||
      echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    python -m pip install --user ansible
    ;;
  *)
    echo "Unsupported distribution: ${ID}" >&2
    exit 1
    ;;
esac

ansible-galaxy install -r requirements.yml
