# VIM

Based on neovim.

## Prerequisite

### (optional) ag _silver searcher_ and rg _ripgrep_ for searching files

I use the silver searcher and ripgrep to search files in vim. You can install them using Homebrew.

```bash
brew install rg  # ripgrep
brew install ag  # silver searcher
```

Now you can use `:Ag` and `:Rg`(or `:FZF`) in vim.

### Vim Configuration

To load `.vimrc` and some scripts, you need to create symlink to the vim configuration files.

```bash
ln -s ~/dotfiles/vim/.vimrc ~                    # .vimrc
ln -s ~/dotfiles/vim/init.lua ~/.config/nvim     # init.lua
ln -s ~/dotfiles/vim/ftplugin ~/.config/nvim     # filetype based settings
ln -s ~/dotfiles/vim/vim-include ~/.config/nvim  # my custom scripts
ln -s ~/dotfiles/vim/lua/ ~/.config/nvim         # my custom lua scripts
```

# Preview

Vim layout:

![codes](./docs/snapshot.png)
