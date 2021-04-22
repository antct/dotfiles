#/bin/bash

OS=
PROXY=
PROXY_URL=https://ghproxy.com

if [[ $1 = 'centos' ]]
then
    OS=CENTOS
    echo "OS VERSION: $OS"
    sudo yum install -y zsh
    sudo yum install -y ack
    sudo yum install -y the_silver_searcher
else
	OS=UBUNTU
    echo "OS VERSION: $OS"
    sudo apt-get install -y -qq zsh
    sudo apt-get install -y -qq ack-grep
    sudo apt-get install -y -qq silversearcher-ag
fi

if [[ $2 = 'proxy' ]]
then
    PROXY=Y
    echo "PROXY: $PROXY"
    echo "PROXY URL: $PROXY_URL"
    sh -c "$(wget -O- $PROXY_URL/https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet $PROXY_URL/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs $PROXY_URL/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    git clone --quiet $PROXY_URL/https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive $PROXY_URL/https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
else
    PROXY=N
    echo "PROXY: $PROXY"
    sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # git clone --quiet --recursive https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
fi

touch ~/.hushlogin
