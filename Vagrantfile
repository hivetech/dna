# -*- mode: ruby -*-
# vi: set ft=ruby :

#FIXME No route to host
BOX_NAME = ENV["BOX_NAME"] || "quantal64"
BOX_URI = ENV["BOX_URI"] || "http://dl.dropbox.com/u/13510779/lxc-quantal-amd64-2013-07-12.box"
#BOX_NAME = ENV["BOX_NAME"] || "precise64"
#BOX_URI = ENV["BOX_URI"] || "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"

Vagrant.configure("2") do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.network :private_network, ip: "192.168.100.10"

  #config.vm.provider :lxc do |lxc|
    #lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
  #end

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "provision/ansible/hosts"
    ansible.playbook = "provision/ansible/site.yml"
    ansible.extra_vars = { 
        data: "data.yml",
        hosts: "vagrant",
        home: "/home/vagrant",
        dna_root: ENV['PWD'],
    }
    ansible.verbose = true
  end
end
