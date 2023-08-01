# Introduction

my dotfiles for macOS and WSL2(ubuntu).
it mostly works on both macOS and WSL2.

# Files

* [Hammerspoon](./hammerspoon/README.md)
* [VIM](./vim/README.md)

# Automatic Setup (WIP)

```bash
./setup.sh
```

above command will create symblic links unless the file already exists.

# Zsh

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc  # zsh
cp ~/dotfiles/.gitconfig ~        # git. gitconfig contains personal informations. so i don't make symbolic link
```

## plugins and themes

install oh-my-zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

and install oh-my-zsh plugins:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
