# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  config.vm.hostname = "devmachine"
  config.vm.network "private_network", ip: "192.168.0.44", netmask: "255.255.0.0"

  # Only execute once the Ansible provisioner,
  # when all the machines are up and ready.
  config.vm.provision :ansible do |ansible|
      # Disable default limit to connect to all the machines
      ansible.limit = "all"
      ansible.playbook = "setup.yml"
  end
end
