#!/bin/bash

dir=~/dotfiles
files=".vimrc"
# Install git
if ! which git > /dev/null; then
   echo "Installing git..."
   sudo apt-get install git
else
  echo "Git already found in the system..."
fi
echo "Setting git global commit template..."
git config --global commit.template $dir/git_commit_template.txt
# Install vim
if ! which vim > /dev/null; then
   echo "Installing vim..."
   sudo apt-get install vim
else
  echo "Vim already found in the system..."
fi
if [ -d "~/.vim" ] ; then
  echo "Vim folder already present!"

else
  echo "Creating vim folder"
  sudo mkdir $HOME/.vim
fi

if [ -d "~/.vim/bundle" ] ; then
  echo "Vim bundle folder already present!"

else
  echo "Creating vim bundle folder..."
  sudo mkdir $HOME/.vim/bundle
fi
# Change to dotfiles directory
cd $dir
for file in $files; do
  echo "Creating symlink to $file in home directory..."
  ln -s $dir/$file $HOME/$file
done
echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing molokai theme locally..."
git clone https://github.com/fatih/molokai.git
ln -s molokai/colors ~/.vim/colors
echo "Installing Vundle plugins..."
vim +PluginInstall +qall
echo "Compiling youCompleteMe package"
cd ~/.vim/bundle/youcompleteme
sudo ./install.py --all
echo "Finished installing dependencies!"
echo "Installing customized fonts for Vim..."
if [ -d "~/.fonts" ] ; then
  echo "Fonts folder already present!"

else
  echo "Creating fonts folder"
  sudo mkdir $HOME/.fonts
fi
echo "Copying fonts file to fonts folder..."
sudo cp PowerlineSymbols.otf $HOME/.fonts/
sudo fc-cache -vf $HOME/.fonts/
if [ -d "~/.config/fontconfig" ] ; then
  echo "Fonts config folder already present!"

else
  echo "Creating fontsconfig folder"
  sudo mkdir $HOME/.config/fontconfig
  sudo mkdir $HOME/.config/fontconfig/conf.d
fi
sudo cp 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
echo "Setting Vim as default visual editor for all applications...."
export VISUAL=vim
export EDITOR="$VISUAL"
