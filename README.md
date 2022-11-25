# Initial Setting

Clone this repository to home directory.


# Neovim

## Prerequisite

### python3 provider

```bash
pyenv virtualenv PYTHON_VERSION py3nvim
```

`py3nvim` virtualenv is used from [init.lua](./vim/init.lua).

### (optional) ag _silver searcher_, rg _ripgrep_ for fzf.vim

```bash
brew install rg
brew install ag
```

## Setup

install tools step by step: neovim -> vim-plug -> vim plugins `PlugInstall`

symlink commands:

```bash
ln -s ~/dotfiles/vim/init.lua ~/.config/nvim     # init.lua
ln -s ~/dotfiles/vim/vim-include ~/.config/nvim  # my custom scripts
ln -s ~/dotfiles/vim/lua/ ~/.config/nvim         # my custom lua scripts
ln -s ~/dotfiles/vim/UltiSnips ~/.config/nvim    # UltiSnips snippets
```

