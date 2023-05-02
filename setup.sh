#!/bin/bash
set -e

step () {
  printf "\n$1...\n"
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

step "Setting up symlink for hammerspoon"
check_osx && link ./hammerspoon/.hammerspoon ~/.hammerspoon

step "Setting up symlink for zsh"
link ./.zshrc ~/.zshrc
link ./p10k.zsh ~/.p10k.zsh

step "Setting up symlink for vim"
link ./vim/.vimrc ~/.vimrc
link ./vim/init.lua ~/.config/nvim/init.lua
link ./vim/vim-include ~/.config/nvim/vim-include
link ./vim/lua/ ~/.config/nvim/lua
link ./vim/UltiSnips ~/.config/nvim/UltiSnips

step "Setting up symlink for tmux"
link ./tmux/.tmux.conf ~/.tmux.conf
link ./tmux/.tmux.conf.local ~/.tmux.conf.local

step "Setting up symlink for python"
link ./pdbrc ~/.pdbrc

step "Setting up copy for git"
copy ./.gitconfig ~/.gitconfig
