#!/bin/bash
cd ~
ln -s git/zshrc zshrc
ln -s git/zshrc/zshrc.zsh .zshrc
mkdir .antigen
cd .antigen
mkdir antigen
cd antigen
curl -L git.io/antigen > antigen.zsh
cd ~
zsh
echo "Now make zsh your default shell"

