#!/bin/bash

if [ -f ~/.vimrc ]; then
  read -p "ViM Already Configured. Overwrite? (y/n)" OVERWRITE

  if [ $OVERWRITE != "y" ]; then
    echo "Cancelled."
    exit 1
  fi

  echo "Removing existing configuration..."

  [ -f ~/.vimrc ] && rm ~/.vimrc
  [ -f ~/.tmux.conf ] && rm ~/.tmux.conf
  [ -d ~/.vim ] && rm -rf ~/.vim
fi

echo "Installing jancarius' configuration..."

SRC=$(dirname $BASH_SOURCE)
VIM_START=~/.vim/pack/hunter/start
GIT_URL=https://github.com

[ ! -d $VIM_START ] && mkdir -p $VIM_START

\cp "$SRC/.vimrc" ~/.vimrc

\cp "$SRC/.tmux.conf" ~/.tmux.conf

\cp "$SRC/.vim/coc-settings.json" ~/.vim/coc-settings.json
\cp -r "$SRC/.vim/colors" ~/.vim/colors

if ! [ -x "$(command -v tmux)"  ]; then
  apt-get -y install tmux
fi

if ! [ -x "$(command -v vim)" ]; then
  apt-get -y install vim
fi

if ! [ -x "$(command -v yarn)" ]; then
  apt-get -y install yarn
fi

if ! [ -x "$(command -v ack)" ]; then
  apt-get -y install ack
fi

git clone $GIT_URL/ctrlpvim/ctrlp.vim.git $VIM_START/ctrlp.vim

git clone $GIT_URL/posva/vim-vue.git $VIM_START/vim-vue

git clone $GIT_URL/preservim/nerdtree.git $VIM_START/nerdtree

git clone $GIT_URL/mileszs/ack.vim.git $VIM_START/ack.vim

git clone $GIT_URL/OmniSharp/omnisharp-vim.git $VIM_START/omnisharp-vim

git clone $GIT_URL/pangloss/vim-javascript.git $VIM_START/vim-javascript

git clone $GIT_URL/tpope/vim-fugitive.git $VIM_START/vim-fugitive

git clone $GIT_URL/vim-airline/vim-airline.git $VIM_START/vim-airline

git clone $GIT_URL/tpope/vim-surround.git $VIM_START/vim-surround

git clone $GIT_URL/jiangmiao/auto-pairs.git $VIM_START/auto-pairs

git clone $GIT_URL/Xuyuanp/nerdtree-git-plugin.git $VIM_START/nerdtree-git-plugin

git clone $GIT_URL/preservim/nerdcommenter.git $VIM_START/nerdcommenter

git clone $GIT_URL/terryma/vim-multiple-cursors.git $VIM_START/vim-multiple-cursors

git clone $GIT_URL/airblade/vim-rooter.git $VIM_START/vim-rooter

git clone $GIT_URL/neoclide/coc.nvim.git $VIM_START/coc.nvim
cd $VIM_START/coc.nvim
yarn install

echo "Done."

