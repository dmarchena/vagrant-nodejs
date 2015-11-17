#!/bin/bash
#
# based on David R. Myers' source. Taken from:
# https://github.com/renobit/vagrant-node-env/blob/master/provisioner.sh

printf "Running Vagrant Provisioning..."

# Update app-get
apt-get update
sudo apt-get install --yes curl

printf "Installing Git..."
sudo apt-get install --yes git

printf "Installing nvm..."
NVM_DIR=/home/vagrant/.nvm
sudo rm -r $NVM_DIR
git clone https://github.com/creationix/nvm.git $NVM_DIR && cd $NVM_DIR && git checkout `git describe --abbrev=0 --tags`
#source ~/.nvm/nvm.sh
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
echo "source $NVM_DIR/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile

printf "Installing Node..."
# install some node versions and use latest as default
nvm install 0.10
nvm install 0.12
nvm install 4
nvm install node
nvm use node
nvm alias default node

# NodeJS manual installation  
#curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
#sudo apt-get install --yes nodejs

# To compile and install native addons from npm you may also need to install build tools:
apt-get install --yes build-essential

printf "Updating NPM..."
sudo npm install npm -g


printf "Installing PhantomJS..."
# Install this PhantomJS dependency
sudo apt-get install --yes libfontconfig

# Install PhantomJS
export PHANTOM_JS=phantomjs-1.9.8-linux-x86_64
cd /usr/local/share
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
sudo tar xvf $PHANTOM_JS.tar.bz2
sudo ln -sf /usr/local/share/$PHANTOM_JS /usr/local/share/phantomjs
sudo ln -sf /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs


printf "Making sure ownership rights are correct in vagrant user directory..."
# make sure everything in the vagrant directory is owned by vagrant
chown -R vagrant:vagrant /home/vagrant --quiet