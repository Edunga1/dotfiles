# Introduction

my dotfiles for macOS and WSL2(ubuntu).
it mostly works on both macOS and WSL2.

## Dot files

* [Hammerspoon](./hammerspoon/README.md)
* [VIM](./vim/README.md)

## Setup automatically (WIP)

```bash
./setup.sh
```

above command will create symblic links unless the file already exists.

## Zsh

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc  # zsh
cp ~/dotfiles/.gitconfig ~        # git. gitconfig contains personal informations. so i don't make symbolic link
```

### plugins and themes

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

## Preview

### Git

`git lsb` to show branches with diff.

```bash
❯ g lsb
                                             ╭───────────────────────────────────────────╮
                                             │ commit 31d6f2427ef354fdee7754c0c204f11/34││
                                             │ Author: committer <email@example.com>    ││
                                             │ Date:   Wed Aug 16 10:39:20 2023 +0900    │
                                             │                                           │
                                             │     Revise python.md                      │
                                             │                                           │
    wip                                      │ diff --git a/docs/wiki/python.md b/docs/  │
> * main                                     │ index b48de15f..ea792d76 100644           │
  2/2 ────────────────────────────────────── │ --- a/docs/wiki/python.md                 │
>                                            ╰───────────────────────────────────────────╯
```

`git ls` to show commits with diff.

```bash
>                                            ╭───────────────────────────────────────────╮
  876/876 (0) ────────────────────────────── │ commit 5adc99575f8d8c0c31d14b396a9cc1/109││
> * 5adc9957 - (5 hours ago) deploy: 31d6f..││ Author: name <name@users.noreply.gi       │
  | * 31d6f242 - (5 hours ago) Revise vimw.. │ Date:   Wed Aug 16 01:41:32 2023 +0000    │
  * | cc7c0420 - (2 days ago) deploy: 6674.. │                                           │
  | * 667459c7 - (2 days ago) Revise docke.. │     deploy: 31d6f2427ef354fdee7754c0c204f │
  * | 07d0e4d7 - (2 days ago) deploy: 53e3.. │                                           │
  | * 53e30089 - (2 days ago) Improve dock.. │ diff --git a/b8b1b6637baea3c0fab852d33cc6 │
  | * 266d25aa - (2 days ago) Update sites.. │ similarity index 88%                      │
  * | 733f22d3 - (2 days ago) deploy: 68d8.. │ rename from b8b1b6637baea3c0fab852d33cc61 │
  | * 68d81564 - (2 days ago) Update sites.. │ rename to 599c4d1f7a6aa26230e3b5b7806e7b5 │
  * | a5d68df3 - (3 days ago) deploy: ea2f.. │ index b48de15f..ea792d76 100644           │
  | * ea2f441a - (3 days ago) Update sites.. ╰───────────────────────────────────────────╯
```
