#!/bin/bash

# shell
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# workflow setup
git clone git@github.com:tuannm99/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
mkdir -p ~/.config/kitty
mkdir -p ~/.config/i3
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/i3/config ~/.config/i3/config
ln -sf ~/.dotfiles/kitty/diff.conf ~/.config/kitty/diff.conf
ln -sf ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/.dotfiles/kitty/dracula.conf ~/.config/kitty/dracula.conf
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/nvim ~/.config/nvim

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  tmux vim neovim \
  xclip zip unzip \
  fzf ripgrep jq curl \
  zsh git htop neofetch \
  discord \
  ibus ibus-unikey \
  ttf-cascadia-code-nerd \
  ttf-ubuntu-font-family \
  ttf-dejavu \
  ttf-cascadia-mono-nerd \
  ttf-dejavu ttf-liberation \
  noto-fonts-cjk noto-fonts-emoji \
  python-pip autopep8 \
  shutter mpv zenity \
  okular shotwell \
  docker docker-compose \
  xorg-xinput \
  xorg-xbacklight \
  brightnessctl \
  xf86-video-amdgpu \
  firewalld 

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# after
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# programing
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && nvm i 20
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -LO https://go.dev/dl/go1.23.4.linux-amd64.tar.gz && sha256sum go1.23.4.linux-amd64.tar.gz 
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz 
export GOPROXY=direct
export GONOSUMDB="*"
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.62.2

source ~/.zshrc
echo "Dotfiles setup complete!"
