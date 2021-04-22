#/bin/bash

OS=
PROXY=
PROXY_URL=https://ghproxy.com

# check root
sudo echo -e "\c"
if [[ $? = 1 ]]
then
    echo "plz use root privilege to install zsh!"
    exit 1
fi

# check parameters
if [ ! -n "$1" ] ;then
    echo "[01] plz input your os version [ubuntu|centos]?"
    exit 1
else
    OS=$1
    echo "[01] os version $OS"
fi

if [ ! -n "$2" ] ;then
    echo "[02] plz choose proxy or not [proxy|none]?"
    exit 1
else
    PROXY=$2
    echo "[02] proxy switch $PROXY"
fi

if [[ $OS = 'centos' ]]
then
    echo "[03] yum install [zsh|ack|the_silver_searcher]"
    sudo yum install -y zsh
    sudo yum install -y ack
    sudo yum install -y the_silver_searcher
else
    echo "[03] apt-get install [zsh|ack-grep|silversearcher-ag]"
    sudo apt-get install -y -qq zsh
    sudo apt-get install -y -qq ack-grep
    sudo apt-get install -y -qq silversearcher-ag
fi

if [[ $PROXY = 'proxy' ]]
then
    echo "[04] proxy switch on: $PROXY_URL"
    echo "[05] plugin install [ohmyzsh|zsh-autosuggestions|zsh-syntax-highlighting]"
    sh -c "$(curl -fsSL $PROXY_URL/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "[06] plugin install [plug.vim]"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs $PROXY_URL/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[07] plugin install [tpm]"
    git clone --quiet $PROXY_URL/https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive $PROXY_URL/https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
else
    echo "[04] proxy switch off"
    echo "[05] plugin install [ohmyzsh|zsh-autosuggestions|zsh-syntax-highlighting]"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "[06] plugin install [plug.vim]"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[07] plugin install [tpm]"
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
fi

echo "[08] add .hushlogin"
touch ~/.hushlogin

echo "[09] cp bin .ctags"
cp -r -n ~/dotfiles/bin/.ctags ~
echo "[10] cp conf [.vimrc|.tmux.conf|.zshrc|.zshrc.conf]"
cp -n ~/dotfiles/conf/.vimrc ~
cp -n ~/dotfiles/conf/.tmux.conf ~
cp -n ~/dotfiles/conf/.zshrc ~
cp -n ~/dotfiles/conf/.zshrc.conf ~
echo "[11] cp theme ysplus.zsh-theme"
cp -n ~/dotfiles/custom/.oh-my-zsh/themes/ysplus.zsh-theme ~/.oh-my-zsh/custom/themes/
echo "[12] done"