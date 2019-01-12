#!/usr/bin/env bash

echo 'Setting up vim:'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
vim -c PluginInstall -c quitall

echo 'Setting up zsh:'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'Settup up bev:'
mkdir -p ~/.oh-my-zsh/completions/
ln -s $HOME/.local/share/zsh_completion.d/_bcd $HOME/.oh-my-zsh/completions/_bcd

echo 'Done'
