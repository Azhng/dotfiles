# Dotfile 🔥🔥🔥

This dotfile should be directly clone at `$HOME` directory. It uses git branches to control linking and unlinking of files.

By default it install `neovim`, `bat`, `zsh` (and oh-my-zsh).

No `sudo` privilege required. All dependencies will be manually managed and compiled from home directory.

## Installation

``` bash
cd ~
git init
git remote add origin git@github.com:Azhng/dotfiles.git
git pull origin master
./.bin/setup.sh
```
