#!/usr/bin/bash

# install atuin
cargo install atuin

# install zoxide
cargo install zoxide --locked

# install fzf
apt remove fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
