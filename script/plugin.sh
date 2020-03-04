#/bin/bash
# install ack & ag for ctrlsf ctrlp
sudo apt-get install ack-grep
sudo apt-get install silversearcher-ag
# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# install jedi for python completion
# git clone --recursive https://github.com/davidhalter/jedi-vim ~/.vim/plugged/jedi-vim
