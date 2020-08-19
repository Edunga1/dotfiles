# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# avoid permission issue
# ref. https://github.com/robbyrussell/oh-my-zsh/issues/6835
export ZSH_DISABLE_COMPFIX=true

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh theme pure-prompt
fpath=($HOME/.zsh/pure $fpath)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fasd
  tmux
  tmuxinator
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export EDITOR='vim'

# built-in command aliases
alias ll='ls -alh'

# util function for include a file
include () {
    [[ -f "$1" ]] && source "$1"
}

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# fzf. respecting git working tree if git project.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='
  (git ls-files --exclude-standard -c -o ||
   git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export LC_ALL=en_US.UTF-8

# gcloud completion for osx homebrew
include '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
include '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# docker
alias doco="docker-compose"

# kubectl completion & alias
if which kubectl > /dev/null; then eval "$(source <(kubectl completion zsh))"; fi
alias k="kubectl"

# tmux
alias tmuxn="tmuxinator"

# npm global packages
if [ -d $HOME/.npm-global ]; then
  export PATH="$HOME/.npm-global/bin:$PATH"
fi

# python pyenv-virtualenv
if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# JDK
if [[ -e /usr/lib/jvm/java-8-openjdk-amd64 ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# Android
if [ -d $HOME/.android-sdk ]; then
  export PATH="$HOME/.android-sdk/bin:$PATH"
  export ANDROID_HOME="$HOME/.android"
  export ANDROID_SDK_ROOT=$ANDROID_HOME
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

# User home bin
export PATH="$HOME/bin:$PATH"

