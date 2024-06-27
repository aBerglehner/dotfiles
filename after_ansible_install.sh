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
