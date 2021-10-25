# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos8"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8082, host: 8082
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "centos"
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    vb.memory = 3072
    vb.cpus = 2
  end
  
  config.vm.synced_folder ".", "/vagrant"
  
  config.vm.provision "file", source: "p1", destination: "/home/vagrant/p1"
  config.vm.provision "file", source: "p2", destination: "/home/vagrant/p2"
  config.vm.provision "file", source: "p3", destination: "/home/vagrant/p3"
  config.vm.provision "shell", inline: <<-SHELL
    yum install -y https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1-6.1.26_145957_el8-1.x86_64.rpm
    yum install -y yum-utils
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum -y install vagrant
    yum -y install docker-ce docker-ce-cli containerd.io
    systemctl enable docker
    systemctl start docker
    usermod -aG docker vagrant  
  SHELL
end
