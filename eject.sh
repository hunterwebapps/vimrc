#!/bin/bash

if [ ! -d ~/vimrc/.git ]; then
  echo "~/vimrc not found."
  exit 1
fi

if [ ! -f ~/.vimrc ] || [ ! -f ~/.tmux.conf ] || [ ! -d ~/.vim ]; then
  echo "ViM Not Configured Properly. Cannot eject."
  exit 1
fi

echo "Ejecting..."

[ ! -d ~/vimrc ] && mkdir ~/vimrc

\cp ~/.vimrc ~/vimrc/.vimrc

\cp ~/.tmux.conf ~/vimrc/.tmux.conf

\cp ~/.vim/coc-settings.json ~/vimrc/.vim/coc-settings.json

\cp -r ~/.vim/colors ~/vimrc/.vim

\cp -r ~/.vim/autoload ~/vimrc/.vim

read -p "Clean local machine? (y/n) " CLEAN

if [ $CLEAN != "y" ]; then
  echo "Done."
  exit 0
fi

echo "Cleaning..."

rm ~/.vimrc
rm ~/.tmux.conf
rm -rf ~/.vim
rm ~/.viminfo

echo "Done."

