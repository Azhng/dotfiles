#!/usr/bin/env bash

echo "Setting up source code directory at: "
mkdir -p $HOME/src/github.com/

echo 'Setting up git:'
cp $HOME/.local/templates/gitconfig $HOME/.gitconfig

echo 'Setting up libtool'
wget http://gnu.freemirror.org/gnu/libtool/libtool-2.4.6.tar.xz
tar xf libtool-2.4.6.tar.xz
cd libtool-2.4.6
./configure --prefix=$HOME/.local
make
make install

echo 'Setting up GTAGS'
cd $HOME/.local/tmp
wget http://tamacom.com/global/global-6.6.3.tar.gz
tar xzf global-6.6.3.tar.gz
cd global-6.6.3
./configure --prefix=$HOME/.local
make
make install

echo 'Installing ncurses'
cd $HOME/.local/tmp
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz
tar xzf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --prefix=$HOME/.local
make
make install

echo 'Installing libtermkey'
cd $HOME/.local/tmp
wget http://www.leonerd.org.uk/code/libtermkey/libtermkey-0.22.tar.gz
tar xzf libtermkey-0.22.tar.gz
cd libtermkey-0.22.tar.gz
make
make install PREFIX=$HOME/.local
libtool --finish $HOME/.local/lib

echo 'Installing libvterm'
cd $HOME/.local/tmp
wget http://www.leonerd.org.uk/code/libvterm/libvterm-0.1.2.tar.gz
tar xzf libvterm-0.1.2.tar.gz
cd libvterm-0.1.2
make
make install PREFIX=$HOME/.local
libtool --finish $HOME/.local/lib

echo 'Installing gperf'
cd $HOME/.local/tmp
wget http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
tar xzf gperf-3.1.tar.gz
cd gperf-3.1
./configure --prefix=$HOME/.local
make
make install
libtool --finish $HOME/.local/lib

echo 'Install libunibilium'
cd $HOME/.local/tmp
wget https://github.com/mauke/unibilium/archive/v2.0.0.tar.gz
tar xzf v2.0.0.tar.gz
cd unibilium-2.0.0
make
make install PREFIX=$HOME/.local

echo 'Installing ninja'
cd $HOME/.local/tmp
wget https://github.com/ninja-build/ninja/releases/download/v1.9.0/ninja-linux.zip
unzip ninja-linux.zip
cp ninja $HOME/.local/bin/

echo 'Setting up vim:'
git clone https://github.com/neovim/neovim/ $HOME/src/github.com/neovim
cd $HOME/src/github.com/neovim
git checkout v0.4.3
make MAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/bin"
make install # TO BE VERIFIED
#ln -s $HOME/src/github.com/neovim/build/bin/nvim $HOME/.local/bin
#ln -s $HOME/src/github.com/neovim/runtime $HOME/.local/share/nvim/runtime
pip3 install --user neovim # TODO: migrate to per-user python
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim # TODO: migrate to vim-plug
nvim -c PluginInstall -c quitall # TODO: handle coc
cd $HOME/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --go-completer

echo 'Setting up gvm:'
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.13.4
gvm use go1.13.4 --default

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

rm -rf $HOME/.local/tmp

echo 'Done'
