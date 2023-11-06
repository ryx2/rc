cd
sudo apt update
sudo apt install zsh python3-dev python3-setuptools python3-pip htop neofetch vim-gtk3 npm fonts-powerline cmake gh

git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/ryx2/rc.git
rm .vimrc
ln -s rc/vimrc .vimrc
ln -s rc/zshrc .zshrc
ln -s rc/p10k.zsh .p10k.zsh

vim +PlugInstall +qall
python3 .vim/plugged/youcompleteme/install.py

git clone https://github.com/ohmyzsh/ohmyzsh.git
mv ohmyzsh .oh-my-zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo npm i -g gitmoji-cli

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
