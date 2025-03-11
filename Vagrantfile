# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_EXPERIMENTAL'] = 'disks'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  # config.vm.box_url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64-vagrant.box"
  config.ssh.extra_args = ["-o", "PubkeyAcceptedKeyTypes=+ssh-rsa", "-o", "HostKeyAlgorithms=+ssh-rsa"]
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.provider "virtualbox" do |vb|
        vb.name = "observability" 
        vb.memory = 6144
        vb.cpus = 2
    end
    ubuntu.vm.hostname = "observability.local"
    ubuntu.vm.network "private_network", ip: "172.10.10.100" #deixei o ip fixado para não ter problemas

    ubuntu.vm.disk :disk, size: "60GB", primary: true
    ubuntu.vm.provision "shell", inline: "hostnamectl set-hostname observability.local" 
  end
end

