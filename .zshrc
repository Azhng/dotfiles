export ZSH="/home/az/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
DEFAULT_USER="az"

source $ZSH/oh-my-zsh.sh

source ~/.zsh_env
source ~/.zsh_alias
source /home/az/.gvm/scripts/gvm
