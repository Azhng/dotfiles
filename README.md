# Dotfile 🔥🔥🔥

This dotfile should be directly clone at `$HOME` directory. It uses git branches to control linking and unlinking of files.

By default it install `neovim`, `bat`, `zsh` (and oh-my-zsh) and `bev` (built-in productivity utility)

## Installation

``` bash
cd ~
git init
git remote add origin git@github.com:Azhng/dotfiles.git
git pull origin master
./.bin/setup.sh
```

## Bev

`bev` provides few useful commands that increase my productivity. `bev` assumes all git source directory locate at `$HOME/src/github.com/`. All `bev` commands prefixes with `b-<cmd>`.


### bcd

`cd` into a project locate in `$HOME/src/github.com`, also supports zsh-autosuggest prompt. 

### bclone

`git clone` a repository from github into `$HOME/src/github.com/` and `cd` into the project directory. It reads from `.gitconfig` for username for github. 

Cloning your own repository

``` bash
bclone <my-own-repo>
```

Cloning public repo of other users:

``` bash
bclone <git-username>/<repo-name>
```

### bopenpr

Open github PRs if opened inside a git directory if the current branch is not master branch.

``` bash
bopenpr
```

### brun

At the root of the project create `bev.yml` file, currently only `run` command is supported.

Example `bev.yml`: it compiles latex to pdf based on name of the subdirectory: 

``` yaml
commands:
  run:
    run:  latexmk -pdf -pvc $(pwd | xargs basename).tex
    desc: compiling latex file to pdf on change
```

Then you can just run `brun` anywhere inside the root directory where `bev.yml` is located.




