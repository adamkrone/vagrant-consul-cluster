#
# Cookbook Name:: vagrant-consul-cluster
# Recipe:: default
#
# Copyright 2014 Adam Krone <adam.krone@thirdwavellc.com>
# Copyright 2014 Thirdwave, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt::default'

consul_cluster_server 'vagrant' do
  servers ['172.20.20.10', '172.20.20.11', '172.20.20.12']
  acl_datacenter 'vagrant'
  acl_default_policy 'allow'
  acl_master_token '3a6efcc8-b0e5-93e8-9188-b7cda829b929'
end
