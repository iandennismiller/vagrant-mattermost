# Vagrant Mattermost
# (c) 2016 Ian Dennis Miller
# http://github.com/iandennismiller/vagrant-mattermost

vagrant:
	cd vagrant && vagrant up

requirements:
	vagrant plugin install vagrant-vbguest docker vagrant-scp
	vagrant box add ubuntu/trusty64
