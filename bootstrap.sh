#!/usr/bin/env bash

# get node
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs
sudo rm /usr/bin/node
sudo ln -s /usr/bin/nodejs /usr/bin/node

# setup frontend build tools
sudo npm install -g grunt-cli bower
cd /vagrant/webapp
npm install
bower install

# we need this for foreman to run correctly
sudo apt-get install -y rubygems1.9.1
