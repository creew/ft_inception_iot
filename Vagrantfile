# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos8"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "centos"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    vb.memory = 2048
    vb.cpus = 4
  end

  config.vm.provision "file", source: "p1", destination: "/home/vagrant/p1"
  config.vm.provision "shell", inline: <<-SHELL
    yum install -y https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1-6.1.26_145957_el8-1.x86_64.rpm
    yum install -y yum-utils
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum -y install vagrant
    yum -y install docker-ce docker-ce-cli containerd.io
  SHELL
end
