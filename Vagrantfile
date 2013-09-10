# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = ENV["BOX_NAME"] || "quantal64"
BOX_URI = ENV["BOX_URI"] || "http://dl.dropbox.com/u/13510779/lxc-quantal-amd64-2013-07-12.box"

Vagrant.configure("2") do |config|
  config.vm.box = "precise"
  config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"
  config.vm.network :private_network, ip: "192.168.100.10"

  #config.vm.provider :lxc do |lxc|
    #lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
  #end

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "provision/ansible/hosts"
    ansible.playbook = "provision/ansible/shell.yml"
    ansible.extra_vars = { data: "vagrant-data.yml" }
    ansible.verbose = true
  end
end