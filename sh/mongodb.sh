#!/bin/bash

# Update apt-get to get 10gen stable packages
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get update

# Install latest stable version (inclues all component packages)
apt-get install -y mongodb-org

# Pin to the exact version above, so it's not auto upgraded by apt-get
echo "mongodb-org hold" | dpkg --set-selections

# Create destination folder for databases with permissions
mkdir /data
mkdir /data/db
chown -R `whoami` /data