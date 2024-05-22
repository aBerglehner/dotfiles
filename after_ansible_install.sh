#!/usr/bin/bash

# install atuin
cargo install atuin

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
