#!/usr/bin/env bash

xdg_dirs=()

if [[ -f '/tmp/.xdg-provision' ]]; then
  exit 0
fi

touch /tmp/.xdg-provision
mkdir -p ~/.config/

function get_xdg_dirs() {
  source ~/.config/user-dirs.dirs
  xdg_dirs=( $XDG_DESKTOP_DIR $XDG_DOWNLOAD_DIR $XDG_TEMPLATES_DIR $XDG_PUBLICSHARE_DIR $XDG_DOCUMENTS_DIR $XDG_MUSIC_DIR $XDG_PICTURES_DIR $XDG_VIDEOS_DIR )
}

if [[ -f ~/.config/user-dirs.dirs ]]; then
  get_xdg_dirs
  mkdir -p /tmp/xdg/

  for dir in "${xdg_dirs[@]}"; do
    mv -f $dir /tmp/xdg/
  done
fi

cp /tmp/user-dirs.dirs ~/.config/user-dirs.dirs
get_xdg_dirs

for dir in "${xdg_dirs[@]}"; do
  mkdir -p $dir
done
