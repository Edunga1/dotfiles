# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# built-in command aliases
alias ll='ls -alh'

# util function for include a file
include () {
    [[ -f "$1" ]] && source "$1"
}

# fzf(brew). Respecting git working tree if git project.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='
  (git ls-files --exclude-standard -c -o ||
   git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export LC_ALL=ko_KR.UTF-8

# completion
fpath=(/usr/local/share/zsh-completions $fpath)

# gcloud completion
include '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
include '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# docker
alias doco="docker-compose"
alias dexec="docker exec -t -i"

# kubectl completion & alias
source <(kubectl completion zsh)
alias k="kubectl"
alias ku="kubectl"
alias kub="kubectl"

# tmux
export EDITOR='vim'
alias tmuxn="tmuxinator"

# python pyenv-virtualenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
