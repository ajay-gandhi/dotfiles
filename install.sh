#!/bin/bash
# Creates symlinks for dotfiles in this directory

dir=~/.dotfiles
files="vimrc gitconfig bash_profile zshrc tmux.conf"

cd $dir
for file in $files; do
  ln -s $dir/$file ~/.$file
done
mkdir -p ~/.vim/colors
ln -s $dir/chroma.vim ~/.vim/colors/chroma.vim
