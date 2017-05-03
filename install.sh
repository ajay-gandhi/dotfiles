#!/bin/bash
# Creates symlinks for dotfiles in this directory

dir=~/.dotfiles
files="vim vimrc gitconfig bash_profile tmux.conf"

cd $dir
for file in $files; do
  ln -s $dir/$file ~/.$file
done

