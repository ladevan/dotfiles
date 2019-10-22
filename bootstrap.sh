#!/bin/bash

echo "downloading .vimrc"
curl -O https://raw.githubusercontent.com/ladevan/dotfiles/master/.vimrc

# get prezto
if [ -s ~/.zprezto ];then
  echo "prezto installed"
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi
