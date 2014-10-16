# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"

  config.omnibus.chef_version = :latest

  NUMBER_NODES = 3
  NODE_IP_ADDRESSES = []

  1.upto(NUMBER_NODES) do |num|
    NODE_IP_ADDRESSES << "172.20.20.1#{num-1}"
    config.vm.define "consul0#{num}" do |node|
      node.vm.hostname = "consul0#{num}"
      node.vm.network "private_network", ip: NODE_IP_ADDRESSES[num-1]

      node.vm.provision :chef_solo do |chef|
        chef.add_recipe "apt::default"
        chef.add_recipe "consul::default"
        chef.json = {
          consul: {
            bind_interface: 'eth1'
          }
        }
        configure_ui(chef) if num == 1
      end

      join_cluster(node) unless num == 1
    end
  end
end

def configure_ui(chef)
  chef.add_recipe "consul::ui"
  chef.json.merge!({
    consul: {
      serve_ui: true
    }
  })
end

def join_cluster(node)
  node.vm.provision :shell, inline: "consul join #{NODE_IP_ADDRESSES.first}"
end
