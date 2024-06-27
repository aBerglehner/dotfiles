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
