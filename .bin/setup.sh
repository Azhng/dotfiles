#!/usr/bin/env bash

# update apt list
sudo apt-get update

echo "Setting up source code directory at: "
mkdir -p $HOME/src/github.com/

echo 'Setting up vim:'
git clone https://github.com/neovim/neovim/ $HOME/src/github.com/neovim
sudo apt-get install -y libncurses-dev libtermkey-dev libvterm-dev gperf libunibilium-dev libtool libtool-bin ninja-build
cd $HOME/src/github.com/neovim
git checkout v0.4.3
make MAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/bin"
ln -s $HOME/src/github.com/neovim/build/bin/nvim $HOME/.local/bin
ln -s $HOME/src/github.com/neovim/runtime $HOME/.local/share/nvim/runtime
pip3 install --user neovim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
nvim -c PluginInstall -c quitall
cd $HOME/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --java-completer --go-completer --rust-completer

echo 'Setting up gvm:'
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

echo "Setting up bat:"
mkdir -p $HOME/.local/tmp
cd $HOME/.local/tmp
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz
tar xzf bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz
cp bat-v0.12.1-x86_64-unknown-linux-musl/bat $HOME/.local/bin

echo 'Setting up zsh:'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git checkout master -- .zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time

echo 'Settup up bev:'
mkdir -p $HOME/.oh-my-zsh/completions/
ln -s $HOME/.local/share/zsh_completion.d/_bcd $HOME/.oh-my-zsh/completions/_bcd

echo 'Setting up git:'
cp $HOME/.local/templates/gitconfig $HOME/.gitconfig

rm -rf $HOME/.local/tmp

echo 'Done'
