#!/bin/bash
# Install vim and all its dependencies
#echo "Installing vim and its dependencies..."
#sudo sh ./vimconfig.sh
# Install nodejs from maintained repository to ubuntu
if ! which  nvm > /dev/null; then
  echo "Installing Node.js through nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
  source ~/.nvm/nvm.sh
  # Install stable version of node.js through NVM and use it as default in every shell
  nvm install stable
  nvm use stable
fi
echo "nvm use stable" >> ~/.bashrc
if ! which byobu > /dev/null; then
  echo "Installing Byobu..."
  sudo apt-get install byobu
  echo "Enabling Byobu to run as default ssh client..."
  sudo byobu-enable
fi
