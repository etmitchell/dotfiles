#!/bin/bash

# Update 
echo "Updating Linux..."
sudo apt-get update
sudo apt-get upgrade 

# Get dev tools
echo "Installing necessary apps..."
sudo add-apt-repository ppa:gnome-terminator
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update
sudo apt-get install emacs tmux irssi python htop curl git libssl-dev chromium-browser firefox vlc smplayer mousepad terminator spotify-client 

# Install all the fonts...
echo "Installing literally every font..."
sudo apt-get install fonts-cantarell lmodern ttf-aenigma ttf-georgewilliams ttf-bitstream-vera ttf-sjfonts ttf-tuffy tv-fonts ubuntustudio-font-meta

# Setup Python env...
echo "Installing Python env..."
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install virtualenv virtualenvwrapper

# Oh My ZSH install script for later...
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Fetch dotfiles
echo "Fetching dotfiles..."
mkdir ~/.emacs.d/config && mkdir ~/.emacs.d/vendor
cd ~/.emacs.d/config 
wget https://raw.githubusercontent.com/emacs-jp/replace-colorthemes/master/clarity-theme.el .
cd ../vendor
git clone git://github.com/jonathanchu/emacs-powerline.git
cd ~
wget https://raw.githubusercontent.com/etmitchell/dotfiles/master/.bashrc .
wget https://raw.githubusercontent.com/etmitchell/dotfiles/master/.profile .
wget https://raw.githubusercontent.com/etmitchell/dotfiles/master/.emacs .
wget https://raw.githubusercontent.com/etmitchell/dotfiles/master/.tmux.conf .
source ~/.bashrc
