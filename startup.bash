#!/bin/bash
cd ~
ln -s git/zshrc zshrc
ln -s git/zshrc/zshrc.zsh .zshrc
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
cd ~
zsh
echo "Now make zsh your default shell"
