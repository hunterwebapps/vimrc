#!/bin/bash

if [ ! -d ~/vimrc/.git ]; then
  echo "~/vimrc not found."
  exit 1
fi

if [ ! -f ~/.vimrc ] || [ ! -f ~/.tmux.conf ] || [ ! -f ~/.bashrc ] || [ ! -d ~/.vim ]; then
  echo "ViM Not Configured Properly. Cannot eject."
  exit 1
fi

echo "Ejecting..."

[ ! -d ~/vimrc ] && mkdir ~/vimrc

\cp ~/.vimrc ~/vimrc/.vimrc

\cp ~/.tmux.conf ~/vimrc/.tmux.conf

\cp ~/.bashrc ~/vimrc/.bashrc

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
rm ~/.tmux

if [ ! -f ~/.vimrc.bak ] && [ ! -f ~/.tmux.conf.bak ] && [ ! -f ~/.bashrc.bak ] && [ ! -d ~/.vim.bak ] && [ ! -d ~/.tmux.bak ]; then
  echo "Done."
  exit 0
fi

read -p "Backups found. Restore? (y/n) " RESTORE

if [ $RESTORE != "y" ]; then
  echo "Done."
  exit 0
fi

[ -f ~/.vimrc.bak ] && mv ~/.vimrc.bak ~/.vimrc
[ -f ~/.tmux.conf.bak ] && mv ~/.tmux.conf.bak ~/.tmux.conf
[ -f ~/.bashrc.bak ] && mv ~/.bashrc.bak ~/.bashrc
[ -d ~/.vim.bak ] && mv ~/.vim.bak ~/.vim
[ -d ~/.tmux.bak ] && mv ~/.tmux.bak ~/.tmux

echo "Done."

