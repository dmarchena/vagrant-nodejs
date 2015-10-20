#!/bin/bash
#
# based on David R. Myers' source. Taken from:
# https://github.com/renobit/vagrant-node-env/blob/master/provisioner.sh

printf "Running Vagrant Provisioning..."

# Update app-get
apt-get update

printf "Installing Node..."
# Setup nodejs
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -

# Install nodejs
sudo apt-get install --yes nodejs

# To compile and install native addons from npm you may also need to install build tools:
apt-get install --yes build-essential

printf "Updating NPM..."
sudo npm install npm -g

#printf "Installing nvm..."
#
#git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm
#git checkout `git describe --abbrev=0 --tags`

# install node with nvm, and set it to the default version
#nvm install stable
#nvm alias default stable

printf "Installing Git..."
sudo apt-get install --yes git

printf "Installing PhantomJS..."

##First of all, install a few the development packages
#sudo apt-get install --yes build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev libjpeg-dev python libx11-dev libxext-dev
#
##Then, launch the build
#git clone git://github.com/ariya/phantomjs.git
#cd phantomjs
#git checkout 2.0
#./build.sh --jobs 1

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