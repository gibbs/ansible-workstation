#!/usr/bin/env bash

# @fixme A better approach to this
move_files=( ~/.bashrc ~/.gitconfig ~/.vimrc ~/.config/fontconfig/fonts.conf ~/.tmux.conf ~/.config/nitrogen/ )
mkdir -p ~/tmp/dotfiles/
touch ~/tmp/.stow-setup

for filepath in "${move_files[@]}"; do
  if [[ -f "$filepath" ]]; then
    mv $filepath ~/tmp/dotfiles/
  fi
done

for directory in ~/.dotfiles/*; do
  basename=$(basename $directory)
  stow -d ~/.dotfiles/ --adopt $basename
done
