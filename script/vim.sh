#/bin/bash
git clone https://github.com/vim/vim.git ~/vim
mkdir ~/vim82
mkdir ~/vim82/etc
mkdir ~/vim82/usr
cd ~/vim/src
./configure --prefix=$HOME/vim82/usr
make VIMRCLOC=$HOME/vim82/etc VIMRUNTIMEDIR=$HOME/vim82/usr/share/vim/vim82 MAKE="make -e"
make install
