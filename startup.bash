#!/bin/bash
cd ~
ln -sfn ~/git/zshrc ~/zshrc
ln -sfn ~/git/zshrc/zshrc.zsh ~/.zshrc
rm -rf ~/.zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
cd ~
zsh

