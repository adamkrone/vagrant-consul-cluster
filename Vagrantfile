# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"

  config.omnibus.chef_version = :latest

  NUMBER_NODES = 3
  STARTING_IP_ADDRESS = "172.20.20.10"
  NODE_IP_ADDRESSES = ip_addresses

  1.upto(NUMBER_NODES) do |num|
    config.vm.define "consul0#{num}" do |node|
      node.vm.hostname = "consul0#{num}"
      node.vm.network "private_network", ip: NODE_IP_ADDRESSES[num-1]

      node.vm.provision :chef_solo do |chef|
        chef.add_recipe 'vagrant-consul-cluster::default'
      end
    end
  end
end

def ip_addresses
  addresses = []
  1.upto(NUMBER_NODES) do |num|
    addresses << add_ip(num)
  end
  addresses
end

def add_ip(num)
  ip = STARTING_IP_ADDRESS.split('.')
  last_octet = (ip.last.to_i + (num-1)).to_s
  address = ip[0..-2].push last_octet
  return address.join('.')
end
