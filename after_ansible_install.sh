#!/usr/bin/bash

# install fzf
# yes no yes is the sequence when asked
echo 'install fzf -> yes no yes'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Install atuin
echo 'Installing atuin...'
cargo install atuin

# Install zoxide
echo 'Installing zoxide...'
cargo install zoxide --locked

# Install docker desktop
echo 'Installing docker desktop 4.30.0  ...'
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.30.0-amd64.deb
sudo apt install ./docker-desktop-*-amd64.deb

# Install alacritty dependencies
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
# Install alacritty
cargo install alacritty
# Set alacritty as default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator
