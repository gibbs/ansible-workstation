#!/usr/bin/env bash
#
# Stow the given dotfiles packages (directories in ~/.dotfiles).
# Usage: stow-setup bash git i3 host-linux ...
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $(basename "$0") PACKAGE..." >&2
  exit 1
fi

# @fixme A better approach to this
# Move files that would otherwise be adopted into the dotfiles repo
move_files=( ~/.bashrc ~/.gitconfig ~/.vimrc ~/.config/fontconfig/fonts.conf ~/.tmux.conf )
mkdir -p ~/tmp/dotfiles/

for filepath in "${move_files[@]}"; do
  if [[ -f "$filepath" && ! -L "$filepath" ]]; then
    mv "$filepath" ~/tmp/dotfiles/
  fi
done

for package in "$@"; do
  if [[ -d ~/.dotfiles/"$package" ]]; then
    stow -d ~/.dotfiles/ -t ~ --adopt "$package"
  else
    echo "Skipping missing dotfiles package: $package" >&2
  fi
done

touch ~/tmp/.stow-setup
