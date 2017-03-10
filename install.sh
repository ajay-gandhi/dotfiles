#!/bin/bash
# Creates symlinks for dotfiles in this directory

dir=~/.dotfiles
files="vim vimrc zshrc oh-my-zsh gitconfig"

cd $dir
for file in $files; do
  ln -s $dir/$file ~/.$file
done

