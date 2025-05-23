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

# zsh plugins
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Macos Homebrew
if [ -f /opt/homebrew/bin/brew ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH=$(brew --prefix)/share/man:$MANPATH
  export INFOPATH=$(brew --prefix)/share/info:$INFOPATH
fi

# Homebrew
if command -v brew &> /dev/null; then
  eval "$(brew shellenv)"
  # Place Homebrew's site-functions after zsh's default functions in $fpath
  # to prioritize zsh's built-in completion over Homebrew's completions.
  # Note. Remove this line if you find a git completion that supports substring matching for branch names.
  fpath=("${fpath[@]:1}" "${fpath[1]}")
fi

# oh-my-zsh. it calls `compinit` internally
source $ZSH/oh-my-zsh.sh

# zsh autoupdate
zstyle ':omz:update' mode reminder

# zsh theme. To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# built-in command aliases
alias ll='ls -alh'

# Set locale.
# If error 'locale: Cannot set LC_ALL to default locale: No such file or directory' occurs, run `sudo locale-gen en_US.UTF-8`
export LC_ALL=en_US.UTF-8

# FZF
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='--bind shift-up:preview-half-page-up,shift-down:preview-half-page-down'
fi

# git
alias g="git"

# docker
alias doco="docker-compose"

# tmux
if command -v tmux &> /dev/null; then
  function _tmux_run() {
    if [[ -n "$@" ]]; then
      command tmux "$@"
    else
      tmux attach
    fi
  }
  compdef _tmux _tmux_run
  alias tmux=_tmux_run
  alias tmuxn="tmuxinator"
fi

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
  export EDITOR='nvim'
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

# Jira CLI
if command -v jira &> /dev/null; then
  # Show jira issue summary
  function jiras() {
    local branch=${1:-$(git branch --show-current)}
    local issuenum=$(echo $branch | grep -o '\b\w\+-\d\+\b')
    if [[ -n $issuenum ]]; then
      jira issue view --raw "$issuenum" | jq -r '.fields.summary'
    else
      echo "No JIRA issue found in the current branch" >&2
      return 1
    fi
  }

  # Open jira issue in the browser
  function jira-open() {
    local branch=${1:-$(git branch --show-current)}
    local issuenum=$(echo $branch | grep -o '\b\w\+-\d\+\b')
    local jirahost=$(cat ~/.config/.jira/.config.yml | grep '^server:' | awk -F' ' '{print $2}')
    if [[ -n $jirahost && -n $issuenum ]]; then
      open "$jirahost/browse/$issuenum"
    else
      echo "No JIRA issue or JIRA host found in the current branch" >&2
      return 1
    fi
  }
fi

