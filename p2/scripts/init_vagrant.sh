#!/bin/sh

wget https://cloud.centos.org/centos/8/vagrant/x86_64/images/CentOS-8-Vagrant-8.3.2011-20201204.2.x86_64.vagrant-virtualbox.box
vagrant box add centos/8 CentOS-8-Vagrant-8.3.2011-20201204.2.x86_64.vagrant-virtualbox.box
rm CentOS-8-Vagrant-8.3.2011-20201204.2.x86_64.vagrant-virtualbox.box
