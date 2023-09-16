#!/bin/bash
set -e

step () {
  printf "\nSetting up for $1...\n"
}

# $1: source of link
# $2: destination of link
link () {
  if [ -e $2 ]; then
    echo "$2 - skipping, already linked"
    return 0
  fi

  echo "$2 - linking"
  ln -sr $1 $2
}

# $1: source of link
# $2: destination of link
copy () {
  if [ -e $2 ]; then
    echo "$2 - skipping, already copied"
    return 0
  fi

  echo "$2 - copying"
  cp -r $1 $2
}

check_osx () {
  if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Not on OSX, skipping"
    return 1
  fi
}

step "hammerspoon"
check_osx && link ./hammerspoon/.hammerspoon ~/.hammerspoon

step "zsh"
link ./shell/.zshrc ~/.zshrc
link ./shell/.p10k.zsh ~/.p10k.zsh

step "vim"
link ./vim/.vimrc ~/.vimrc
link ./vim/init.lua ~/.config/nvim/init.lua
link ./vim/vim-include ~/.config/nvim/vim-include
link ./vim/lua/ ~/.config/nvim/lua

step "tmux"
link ./tmux/.tmux.conf ~/.tmux.conf
link ./tmux/.tmux.conf.local ~/.tmux.conf.local

step "python"
link ./pdbrc ~/.pdbrc

step "git"
copy ./.gitconfig ~/.gitconfig
