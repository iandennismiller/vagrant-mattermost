#!/usr/bin/env bash

# Vagrant Mattermost
# (c) 2016 Ian Dennis Miller
# http://github.com/iandennismiller/vagrant-mattermost

# create user: mattermost-github-integration
useradd --system --user-group --create-home mattermost-github-integration

# install: mattermost-github-integration
exec sudo -i -u mattermost-github-integration /bin/bash - << eof
    source /usr/local/bin/virtualenvwrapper.sh
    git clone https://github.com/softdevteam/mattermost-github-integration.git
    cd mattermost-github-integration
    mkvirtualenv -a ~/mattermost-github-integration mattermost-github-integration
    workon mattermost-github-integration
    pip install Flask requests
eof

# copy: configuration
cp /vagrant/files/mattermost-github-integration/config.py /home/mattermost-github-integration/mattermost-github-integration/config.py
chown mattermost-github-integration:mattermost-github-integration /home/mattermost-github-integration/mattermost-github-integration/config.py

# copy: upstart control
cp /vagrant/files/upstart.conf /etc/init/mattermost-github-integration.conf

# daemon: launch
start mattermost-github-integration
