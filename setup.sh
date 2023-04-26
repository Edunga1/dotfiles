#!/bin/bash
set -e

step () {
  echo $1...
}

# $1: source of link
# $2: destination of link
link () {
  if [ -h $2 ]; then
    echo "$2 - skipping, already linked"
    return 0
  fi

  echo "$2 - linking"
  ln -sr $1 $2
}

step "Setting up symlink for tmux"
link ./tmux/.tmux.conf ~/.tmux.conf
link ./tmux/.tmux.conf.local ~/.tmux.conf.local
