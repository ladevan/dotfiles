#!/bin/zsh

# setup vim related stuff
echo "create backup, swap and undo folder"
mkdir -p .vim/.backup
mkdir -p .vim/.swp
mkdir -p .vim/.undo
echo "downloading .vimrc"
curl -O https://raw.githubusercontent.com/ladevan/dotfiles/master/.vimrc
echo "downloading vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "get dircolor visualization script"
curl -O https://raw.githubusercontent.com/ladevan/dotfiles/master/colours.sh
echo "get dircolor scheme"
curl -O https://raw.githubusercontent.com/ladevan/dotfiles/master/.dir_colors
echo "get .zshrc"
curl -O https://raw.githubusercontent.com/ladevan/dotfiles/master/.zshrc
# get prezto
if [ -f .zpreztorc ]
then
  echo "prezto installed"
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi



