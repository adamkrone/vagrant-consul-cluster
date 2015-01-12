#
# Cookbook Name:: vagrant-consul-cluster
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

consul_cluster_server 'vagrant' do
  servers ['172.20.20.10', '172.20.20.11', '172.20.20.12']
  acl_datacenter 'vagrant'
  acl_default_policy 'deny'
  acl_master_token '3a6efcc8-b0e5-93e8-9188-b7cda829b929'
end
