# GPG
export GPG_TTY=$(tty)

# BEFORE INSTANT PROMPT
# ref. https://github.com/romkatv/powerlevel10k/?tab=readme-ov-file#instant-prompt

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# avoid permission issue
# ref. https://github.com/robbyrussell/oh-my-zsh/issues/6835
export ZSH_DISABLE_COMPFIX=true

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh plugins
plugins=(
  brew
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux
  tmuxinator
  docker
  docker-compose
)

# zsh autoupdate
zstyle ':omz:update' mode reminder

source $ZSH/oh-my-zsh.sh

# zsh completions
autoload -U compinit && compinit

# zsh theme. To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR='nvim'

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

# Set locale.
# If error 'locale: Cannot set LC_ALL to default locale: No such file or directory' occurs, run `sudo locale-gen en_US.UTF-8`
export LC_ALL=en_US.UTF-8

# FZF
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='--bind shift-up:preview-half-page-up,shift-down:preview-half-page-down'
fi

# Linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH=$(brew --prefix)/share/man:$MANPATH
  export INFOPATH=$(brew --prefix)/share/info:$INFOPATH
fi

# Macos Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# docker
alias doco="docker-compose"

# tmux
alias tmuxn="tmuxinator"

# npm global packages
export PATH="$HOME/.node_modules/bin:$PATH"
export NPM_CONFIG_PREFIX=~/.node_modules

# python pyenv-virtualenv
if command -v pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  alias ac="source activate"
fi

# Android
if [ -d $HOME/.android-sdk ]; then
  export PATH="$HOME/.android-sdk/bin:$PATH"
  export ANDROID_HOME="$HOME/.android"
  export ANDROID_SDK_ROOT=$ANDROID_HOME
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

# Ruby
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"
fi

# User home bin
export PATH="$HOME/bin:$PATH"

# Neovim
if command -v nvim &> /dev/null; then
  alias vi="nvim"
fi

# Settings for WSL
if grep -qi microsoft /proc/version &> /dev/null; then
  alias open=explorer.exe
  alias gw=git.exe
fi

# zoxide(z jump, alternative to fasd)
if command -v zoxide  &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# GitHub copilot cli
if command -v github-copilot-cli &> /dev/null; then
  eval "$(github-copilot-cli alias -- "$0")"
fi

# GitHub
if command -v gh &> /dev/null; then
  alias exp="gh copilot explain"
fi

# Goolge Cloud SDK
if [ command -v gcloud &> /dev/null -a -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# atlassian api token (~1/31/2025)
if command -v jira &> /dev/null; then
  # e.g. feature/ABC-123 -> ABC-123
  alias jira-issue="git branch --show-current | grep -o '\b[[:upper:]]\+-\d\+\b'"

  # Show jira issue summary by issue number in the current branch
  function jiras() {
    local issuenum=${1:-$(jira-issue)}
    if [[ -n $issuenum ]]; then
      jira issue view --raw "$issuenum" | jq '.fields.summary'
    else
      echo "No JIRA issue found in the current branch" >&2
      return 1
    fi
  }

  # Open jira issue in the browser
  function jira-open() {
    local issuenum=${1:-$(jira-issue)}
    local jirahost=$(cat ~/.config/.jira/.config.yml | grep '^server:' | awk -F' ' '{print $2}')
    if [[ -n $jirahost && -n $issuenum ]]; then
      open "$jirahost/browse/$issuenum"
    else
      echo "No JIRA issue or JIRA host found in the current branch" >&2
      return 1
    fi
  }
fi
