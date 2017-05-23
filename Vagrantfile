# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vbguest.auto_update = false
  config.vm.network "forwarded_port", guest: 22, host: 2223
  config.vm.box = "ubuntu/xenial64"
  # config.vm.network :private_network, ip: "192.168.50.50"
  # config.vm.provider :virtualbox do |vb|
    # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  # end
  config.vm.synced_folder ".", "/vagrant", owner:"www-data", group:"www-data", mount_options:["dmode=775", "fmode=775"]

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y python software-properties-common ansible
  SHELL

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "ansible/playbook.yml"
    ansible.inventory_path = "ansible/inventory-vg.ini"
    ansible.host_key_checking = "false"
    ansible.limit = "all"
  end
end
