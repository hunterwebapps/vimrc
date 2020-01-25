#!/bin/bash

GIT_PATH=~/vimrc

mkdir -p $GIT_PATH

rm $GIT_PATH/.vimrc
cp ~/.vimrc $GIT_PATH/.vimrc
if [ -f "~/.vimrc.bak" ]; then
  rm ~/.vimrc
  mv ~/.vimrc.bak ~/.vimrc
fi

rm $GIT_PATH/.tmux.conf
cp ~/.tmux.conf $GIT_PATH/.tmux.conf
if [ -f "~/.tmux.conf.bak" ]; then
  rm ~/.tmux.conf
  mv ~/.tmux.conf.bak ~/.tmux.conf
fi

rm -rf $GIT_PATH/.vim
cp -rf ~/.vim $GIT_PATH/.vim
if [ -d "~/.vim.bak" ]; then
  rm -rf ~/.vim
  mv ~/.vim.bak ~/.vim
fi

