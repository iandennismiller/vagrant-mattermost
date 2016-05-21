# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Mattermost
# (c) 2016 Ian Dennis Miller
# http://github.com/iandennismiller/vagrant-mattermost

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # use basic ubuntu/trusty64 as base box
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "mattermost"

  # configure network for private mattermost instance
  # to be accessed from the host machine by hitting http://192.168.33.33
  config.vm.network "private_network", ip: "192.168.33.33"

  # set up virtualbox configurations for this vm
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.name = "mattermost-dev"
    vb.memory = "2048"
  end

  config.vm.provision :shell, path: "bin/bootstrap.sh"
  config.vm.provision :shell, path: "files/mattermost/install.sh"
  # config.vm.provision :shell, path: "files/mattermost-github-integration/install.sh"

end
