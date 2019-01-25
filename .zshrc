export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
DEFAULT_USER=$USER

source $ZSH/oh-my-zsh.sh

source ~/.zsh_env
source ~/.zsh_alias
######## Setup script setup by fantastic-kit ########
source $HOME/.fantastic-kit/bin/fk.sh
export FANTASTIC_ROOT=/users/z577zhan/.fantastic-kit
export PATH=/users/z577zhan/.fantastic-kit/bin:$PATH
fpath=($HOME/.fantastic-kit/autocompletion $fpath)
autoload -Uz compinit
compinit
######### End of the auto generated scripts #########
