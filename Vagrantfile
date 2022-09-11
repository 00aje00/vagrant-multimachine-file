# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

   config.vm.box = "ubuntu/xenial64" # Specify your prefered distrobution (vagrantbox)
   config.vm.provider "virtualbox" do |vb|
    vb.memory = 2024
    vb.cpus = 2
  end
# Note: 1 extra node(machine/VM) is already reserved to be master...
   # Specify the number of worker nodes you want to pull
   worker_nodes = 2
   # Set your prefered master_ip and worker_ip(without the 4th octet)
   manager_ip = "192.168.56.2"
   worker_ip = "192.168.56."

   # Set your prefered script to run in every node(machine/VM) of your cluster
   # You can pick from the list, or write your own(*just makes sure to save it in /scripts/)
   dependencies = "docker.sh" # OR "kubernetes.sh" OR ..."your_script"




  (1..worker_nodes).each do |i|
    config.vm.define vm_name="worker#{i}" do |node|
      node.vm.network "private_network", ip: "#{worker_ip}#{i+2}" 
      config.vm.provision "shell", path: "./scripts/#{dependencies}"
      node.vm.hostname = vm_name
    end
  end
  config.vm.define vm_name="master" do |node|
    node.vm.network "private_network", ip: "#{manager_ip}"
    config.vm.provision "shell", path: "./scripts/#{dependencies}"
    node.vm.hostname = vm_name
  end
end

