#/bin/bash
#set -x

OS=ubuntu
ROOT=Y
PROXY=Y
PROXY_URL=https://gh-proxy.com

# root
if [[ $ROOT = 'Y' ]]
then
    sudo echo -e "\c"
    if [[ $? = 1 ]]
    then
        echo "[00] plz use root privilege to install zsh!"
        exit 1
    fi
    if [[ $OS = 'centos' ]]
    then
        echo "[01] yum install [zsh|ack|the_silver_searcher]"
        sudo yum install -y zsh
        sudo yum install -y ack
        sudo yum install -y the_silver_searcher
    else
        echo "[01] apt-get install [zsh|ack-grep|silversearcher-ag]"
        sudo apt-get install -y -qq zsh
        sudo apt-get install -y -qq ack-grep
        sudo apt-get install -y -qq silversearcher-ag
    fi
else
    echo "[01] no root pribilege, skip some packages!"
fi

if [[ $PROXY = 'Y' ]]
then
    echo "[02] proxy switch on: $PROXY_URL"
    echo "[03] plugin install [ohmyzsh|zsh-autosuggestions|zsh-syntax-highlighting]"
    sh -c "$(curl -fsSL $PROXY_URL/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "[04] plugin install [plug.vim]"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs $PROXY_URL/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[05] plugin install [tpm]"
    git clone --quiet $PROXY_URL/https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive $PROXY_URL/https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
else
    echo "[02] proxy switch off"
    echo "[03] plugin install [ohmyzsh|zsh-autosuggestions|zsh-syntax-highlighting]"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "[04] plugin install [plug.vim]"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[05] plugin install [tpm]"
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
fi

echo "[06] add .hushlogin"
touch ~/.hushlogin

echo "[07] cp bin .ctags"
cp -r -n ~/dotfiles/bin/.ctags ~
echo "[08] cp conf [.vimrc|.tmux.conf|.zshrc|.zshrc.conf]"
cp -n ~/dotfiles/conf/.vimrc ~
cp -n ~/dotfiles/conf/.tmux.conf ~
cp -n ~/dotfiles/conf/.zshrc ~
cp -n ~/dotfiles/conf/.zshrc.conf ~
echo "[09] cp theme ysplus.zsh-theme"
cp -n ~/dotfiles/custom/.oh-my-zsh/themes/ysplus.zsh-theme ~/.oh-my-zsh/custom/themes/
echo "[10] done"
