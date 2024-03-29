# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "ubuntu"
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.memory = 6144
    vb.cpus = 3
  end
  
  config.vm.synced_folder ".", "/vagrant_iot"
  
  config.vm.provision "file", source: "./p1", destination: "/home/vagrant/"
  config.vm.provision "file", source: "./p2", destination: "/home/vagrant/"
  config.vm.provision "file", source: "./p3", destination: "/home/vagrant/"
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update && apt-get install ca-certificates curl gnupg lsb-release
    wget "https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb" -O vb.deb && apt install -y ./vb.deb
    rm vb.deb
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update && apt upgrade
    apt-get install -y vagrant
    apt-get install -y docker-ce docker-ce-cli containerd.io
    apt-get install -y lubuntu-desktop    

    usermod -aG docker vagrant 
    echo "192.168.42.110  app1.com" >> /etc/hosts
    echo "192.168.42.110  app2.com" >> /etc/hosts 
    echo "192.168.42.110  app3.com" >> /etc/hosts
  SHELL
  config.vm.provision "shell", path: "./p3/scripts/init_k8s.sh"
  config.vm.provision "shell", path: "./p3/scripts/init_bash.sh"
end
