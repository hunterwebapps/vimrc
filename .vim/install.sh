#!/bin/bash

if [ -f "~/.vimrc.bak" ]; then
  echo "Already loaded. Aborting."
  exit 1
fi

if [ -f "~/.vimrc" ]; then
  mv ~/.vimrc ~/.vimrc.bak
fi

cp .vimrc ~/.vimrc

if [ -f "~/.tmux.conf" ]; then
  mv ~/.tmux.conf ~/.tmux.conf.bak
fi

cp .tmux.conf ~/.tmux.conf

if [ -d "~/.vim" ]; then
  mv ~/.vim ~/.vim.bak
fi

cp -r .vim ~/.vim

if ! [ -x "$(command -v tmux)"  ]; then
  apt-get -y install tmux
fi

if ! [ -x "$(command -v vim)" ]; then
  apt-get -y install vim
fi

if ! [ -x "$(command -v git)" ]; then
  apt-get -y install git
fi

if ! [ -x "$(command -v ack)" ]; then
  apt-get -y install ack
fi

VIM_START=~/.vim/pack/hunter/start

mkdir -p $VIM_START

[ -d "$VIM_START/ctrlp.vim" ] && git clone https://github.com/ctrlpvim/ctrlp.vim.git $VIM_START/ctrlp.vim

[ -d "$VIM_START/vim-vue" ] && git clone https://github.com/posva/vim-vue.git $VIM_START/vim-vue

[ -d "$VIM_START/nerdtree" ] && git clone https://github.com/preservim/nerdtree.git $VIM_START/nerdtree

[ -d "$VIM_START/coc.nvim" ] && git clone https://github.com/neoclide/coc.nvim.git $VIM_START/coc.nvim

[ -d "$VIM_START/ack.vim" ] && git clone https://github.com/mileszs/ack.vim.git $VIM_START/ack.vim

[ -d "$VIM_START/omnisharp-vim" ] && git clone https://github.com/OmniSharp/omnisharp-vim.git $VIM_START/omnisharp-vim

[ -d "$VIM_START/vim-javascript" ] && git clone https://github.com/pangloss/vim-javascript.git $VIM_START/vim-javascript

[ -d "$VIM_START/vim-fugitive" ] && git clone https://github.com/tpope/vim-fugitive.git $VIM_START/vim-fugitive

[ -d "$VIM_START/vim-airline" ] && git clone https://github.com/vim-airline/vim-airline.git $VIM_START/vim-airline

[ -d "$VIM_START/vim-surround" ] && git clone https://github.com/tpope/vim-surround.git $VIM_START/vim-surround

[ -d "$VIM_START/auto-pairs" ] && git clone https://github.com/jiangmiao/auto-pairs.git $VIM_START/auto-pairs

[ -d "$VIM_START/nerdtree-git-plugin" ] && git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git $VIM_START/nerdtree-git-plugin

[ -d "$VIM_START/nerdcommenter" ] && git clone https://github.com/preservim/nerdcommenter.git $VIM_START/nerdcommenter

[ -d "$VIM_START/vim-multiple-cursors" ] && git clone https://github.com/terryma/vim-multiple-cursors.git $VIM_START/vim-multiple-cursors

[ -d "$VIM_START/vim-rooter" ] && git clone https://github.com/airblade/vim-rooter.git $VIM_START/vim-rooter

vim -c 'call coc#util#install()'
vim -c 'CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-yaml coc-emmet coc-snippets coc-git coc-xml coc-markdownlint coc-explorer'

