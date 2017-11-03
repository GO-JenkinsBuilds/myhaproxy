#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'haproxy::manual'

node.default['haproxy']['members'] = [
{
'hostname' => 'localhost',
'ipaddress' => '127.0.0.1',
'port' => 4000,
'ssl_port' => 4000
},{
'hostname' => 'ec2-34-229-245-96.compute-1.amazonaws.com',
'ipaddress' => '34.229.245.96',
'port' => 80,
'ssl_port' => 80
}]
include_recipe 'haproxy::manual'