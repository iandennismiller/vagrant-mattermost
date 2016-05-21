# Vagrant Mattermost

This repository contains a Vagrant environment that will install and run [Mattermost](http://www.mattermost.org).  Optionally, this can also run a [Github integration](https://github.com/softdevteam/mattermost-github-integration) bot.

## Not for production

This is a pretty good start for anybody who wants to use Vagrant to manage their Mattermost server, but there are some rough edges.  Do not use this to manage your production servers.

## Installation

It is assumed that you have already installed [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).

To install **vagrant-mattermost**, do the following:

    git clone https://github.com/iandennismiller/vagrant-mattermost.git
    cd vagrant-mattermost
    vi vagrant/files/mattermost/nginx.conf
    vi vagrant/files/mattermost-github-integration/config.py
    make requirements vagrant

For information about how to edit nginx.conf and config.py, see *Customization Instructions* below.

Once the machine has booted, you must create SSL certificates using [letsencrypt](https://letsencrypt.org/):

    su mattermost
    cd /home/mattermost/letsencrypt
    ./letsencrypt-auto certonly --standalone

## Customization Instructions

Alter the following files within the repository:

- `vagrant/files/mattermost/nginx.conf`
- `vagrant/files/mattermost-github-integration/config.py`

### vagrant/files/nginx.conf

- *hostname*: set this to your hostname

### vagrant/files/mattermost-github-integration/config.py

- *hostname*: set this to your hostname
- *mattermost_default_hook_url*: provided by mattermost
- *mattermost_secret*: provided by mattermost

## Reference Implementation

This Vagrant environment is based on the Ubuntu 14.04 LTS installation procedure described in the official [Mattermost documentation](http://docs.mattermost.com/install/prod-ubuntu.html).  For posterity, the [documentation source](http://docs.mattermost.com/_sources/install/prod-ubuntu.txt) was snapshotted on 2016-05-21 and stored within this repository as [docs/prod-ubuntu.rst](https://github.com/iandennismiller/vagrant-mattermost/blob/master/docs/prod-ubuntu.rst).

## Github Integration

**Note**: In my estimation, the [github integration bot](https://github.com/softdevteam/mattermost-github-integration) is not secure enough to run on a production machine.  However, it's the [official bot for now](http://www.mattermost.org/community-applications/) and it's definitely sufficient for many purposes.

## License

The MIT License (MIT)

**vagrant-mattermost**

Copyright (c) 2016 Ian Dennis Miller

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
