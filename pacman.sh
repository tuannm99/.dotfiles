#!/bin/bash

git clone git@github.com:tuannm99/.dotfiles.git ~/dotfiles

cd ~/dotfiles

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  xclip \
  zip unzip \
  discord zoom \
  ibus ibus-unikey \
  neofetch \
  ttf-monospace \
  ttf-cascadia-code-nerd \
  ttf-ubuntu-font-family \
  ttf-dejavu \
  ttf-noto \
  ttf-noto-mono \
  xfontsel \
  fzf ripgrep jq \
  python-pip python-pipx \
  autopep8 \
  nerd-fonts-complete \
  ttf-dejavu ttf-liberation \
  stylelua \
  shutter \
  simplescreenrecorder \
  mpv \
  docker docker-compose \
  zenity \
  xorg-xinput \
  noto-fonts-cjk noto-fonts-emoji \
  ttf-cascadia-mono-nerd \
  xorg-xbacklight \
  brightnessctl \
  xf86-video-amdgpu \
  firewalld

echo "Dotfiles setup complete!"
