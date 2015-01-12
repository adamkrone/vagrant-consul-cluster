# Vagrant Consul Cluster

This project provides an example consul cluster that is useful for testing
clusters locally.

## Usage

To start the cluster, use vagrant from project's root directory:

	vagrant up

When it finishes, it should be accessible at any of the hostnames/ip addresses:

	By default:

	http://consul01:8500/ui/
	http://consul02:8500/ui/
	http://consul03:8500/ui/
	http://172.20.20.10:8500/ui/
	http://172.20.20.11:8500/ui/
	http://172.20.20.12:8500/ui/

The number of servers and starting ip address is configurable in the
Vagrantfile:

	NUMBER_NODES = 3
	STARTING_IP_ADDRESS = "172.20.20.10"

## ACL

To get as close to production use as possible, we use the following ACL master
token:

	3a6efcc8-b0e5-93e8-9188-b7cda829b929

You can either use this token for anything that needs to access the consul
servers (convenient, but doesn't match production, or you can use the token to
access the web ui and create additional tokens for your application (preferred,
as it matches production).
