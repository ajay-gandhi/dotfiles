#!/bin/bash
# Creates symlinks for dotfiles in this directory

dir=~/.dotfiles
files="vimrc gitconfig bash_profile tmux.conf"

cd $dir
for file in $files; do
  ln -s $dir/$file ~/.$file
done
if pushd ~/.vim/colors; then
  ln -s $dir/chroma.vim ~/.vim/colors/chroma.vim
else
  echo "Couldn't install vim color scheme, ~/.vim/colors directory missing\n"
fi

