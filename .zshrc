export ZSH="$HOME/.oh-my-zsh"
unsetopt beep

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
DEFAULT_USER=$USER

source $ZSH/oh-my-zsh.sh

source ~/.zsh_env
source ~/.zsh_alias
