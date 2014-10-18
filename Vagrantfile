# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"

  config.omnibus.chef_version = :latest

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  NUMBER_NODES = 3
  STARTING_IP_ADDRESS = "172.20.20.10"
  NODE_IP_ADDRESSES = ip_addresses

  1.upto(NUMBER_NODES) do |num|
    config.vm.define "consul0#{num}" do |node|
      ip_address = NODE_IP_ADDRESSES[num-1]
      node.vm.hostname = "consul0#{num}"
      node.vm.network "private_network", ip: ip_address

      node.vm.provision :chef_solo do |chef|
        chef.add_recipe "apt::default"
        chef.add_recipe "consul::default"
        chef.add_recipe "consul::ui"

        chef.json = {
          consul: {
            service_mode: 'cluster',
            bootstrap_expect: NUMBER_NODES.to_s,
            servers: NODE_IP_ADDRESSES,
            bind_interface: 'eth1',
            bind_addr: ip_address,
            datacenter: 'vagrant',
            serve_ui: true
          }
        }
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
