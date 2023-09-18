#!/bin/bash
set -e

CLRSKIP='\033[1;30m'
CLRSUCC='\033[1;32m'
NC='\033[0m'

step () {
  printf "\nSetting up for $1...\n"
}

# $1: source of link
# $2: destination of link
link () {
  if [ -e $2 ]; then
    echo -e "$CLRSKIP$2 - skipping, already linked$NC"
    return 0
  fi

  echo -e "$CLRSUCC$2 - linking$NC"
  ln -s "$(pwd)/$1" $2
}

# $1: source of link
# $2: destination of link
copy () {
  if [ -e $2 ]; then
    echo -e "$CLRSKIP$2 - skipping, already copied$NC"
    return 0
  fi

  echo -e "$CLRSUCC$2 - copying$NC"
  cp -r $1 $2
}

check_osx () {
  if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${CLRSKIP}Not on OSX, skipping$NC"
    return 1
  fi
}

step "hammerspoon"
check_osx && link hammerspoon/.hammerspoon ~/.hammerspoon

step "zsh"
link shell/.zshrc ~/.zshrc
link shell/.p10k.zsh ~/.p10k.zsh

step "vim"
link vim/.vimrc ~/.vimrc
link vim/init.lua ~/.config/nvim/init.lua
link vim/vim-include ~/.config/nvim/vim-include
link vim/lua/ ~/.config/nvim/lua

step "tmux"
link tmux/.tmux.conf ~/.tmux.conf
link tmux/.tmux.conf.local ~/.tmux.conf.local

step "python"
link .pdbrc ~/.pdbrc

step "git"
copy shell/.gitconfig ~/.gitconfig
