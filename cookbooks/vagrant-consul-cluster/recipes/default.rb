#
# Cookbook Name:: vagrant-consul-cluster
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

consul_cluster_server 'vagrant' do
  servers ['172.20.20.10', '172.20.20.11', '172.20.20.12']
end
