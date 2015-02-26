#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

#olddir=~/dotfiles_old             # old dotfiles backup directory
files=".vimrc .zshrc .ideavimrc .latexmkrc .muttrc .tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
#echo "Creating $olddir for backup of any existing dotfiles in ~"
#mkdir -p $olddir
#echo "...done"

# change to the dotfiles directory
#echo "Changing to the $dir directory"
#cd $dir
#echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    #echo "Moving any existing dotfiles from ~ to $olddir"
    #mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $file ~/$file
done
echo "Installing oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo "Installing Neobundle"
cd ~
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
