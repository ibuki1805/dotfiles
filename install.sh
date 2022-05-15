#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# echo "setting vim"
# git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
# vim_version=`vim --version | grep -o '[0-9]*'`
# vim_version=${vim_version:0:1}
#
# if [ $((${vim_version})) -lt 8 ]; then
#     echo "installed vim version < 8"
#     cd ~/.vim/dein/repos/github.com/Shougo/dein.vim
#     git checkout 1.5
#     cd $SCRIPT_DIR
# else
#     echo "installed vim version >= 8"
# fi
#
# mkdir ~/.vim/undo
#
# echo "source $SCRIPT_DIR/vimrc" > ~/.vimrc


# echo "open vim and run ':call dein#install()'"
# echo "setting vim end"

echo "setting neo-vim"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
cd ~/.config/nvim/dein/repos/github.com/Shougo/dein.vim/
git checkout 1.5
cd $SCRIPT_DIR

mkdir ~/.config/nvim/undo/

echo "source $SCRIPT_DIR/init.vim" > ~/.config/nvim/init.vim

echo "installing powerline font"
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline_fonts \
&& cd /tmp/powerline_fonts \
&& ./install.sh

echo "==="
echo "please set your terminal font as 'Ubuntu Mono derivative Powerline Regular'"
echo "==="

pip3 install pynvim
pip3 install --update msgpack

echo "installing nodejs 14.x"
cd ${HOME}
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs

echo "==="
echo "please set your terminal font as 'Ubuntu Mono derivative Powerline Regular'"
echo "==="

echo "open nvim and run ':call dein#install()' and ':UpdateRemotePlugins'"
echo "setting vim end"

# echo "setting deno"
# curl -fsSL https://deno.land/x/install/install.sh | sh
# echo "export DENO_INSTALL=\"/home/\$USER/.deno\"" >> ~/.bashrc
# echo "export PATH=\"\$PATH:\$DENO_INSTALL/bin\"" >> ~/.bashrc
#
# echo "setting deno end"

echo "setting screen"
echo "setting screen end"

echo "setting tmux"
echo "source $SCRIPT_DIR/tmux.conf" >> ~/.tmux.conf
echo "setting tmux end"

echo "setting inputrc"
cat $SCRIPT_DIR/inputrc >> ~/.inputrc
echo "setting inputrc end"

echo "setting bash_aliases"
echo "source $SCRIPT_DIR/bash_aliases" >> ~/.bash_aliases
echo "setting bash_aliases end"

echo "please remap capslock to control"
echo "open /etc/default/keyboard"
echo "change 'XKBOPTIONS' to 'XKBOPTIONS=\"ctrl:nocaps\"'"

source ~/.bashrc
