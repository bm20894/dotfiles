#!/bin/bash
# This script creates sym links in home directory for dotfiles

dir=~/.dotfiles
old_dir=~/.dotfiles_old
files=".zshrc .tmux.conf .vimrc .bashrc"

echo "Creating $old_dir backup for existing dotfiles in ~"
mkdir -p $old_dir
echo "...Complete"

cd $dir

echo "Moving $file from ~ to $old_dir"
for file in $files; do
	mv ~/$file $old_dir
	echo "Creating symlink to $file in ~"
	ln -s $dir/$file ~/$file
	echo "...Complete"
done
