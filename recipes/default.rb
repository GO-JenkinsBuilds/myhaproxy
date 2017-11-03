#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# node.default['haproxy']['members'] = [
# {
# 'hostname' => 'ec2-184-72-137-102.compute-1.amazonaws.com',
# 'ipaddress' => '184.72.137.102',
# 'port' => 80,
# 'ssl_port' => 80
# },{
# 'hostname' => 'ec2-34-229-245-96.compute-1.amazonaws.com',
# 'ipaddress' => '34.229.245.96',
# 'port' => 80,
# 'ssl_port' => 80
# }]



all_web_nodes = search('node','role:web_server')
members = []
all_web_nodes.each do |web_node|
member = {
'hostname' => web_node['cloud']['public_hostname'],
'ipaddress' => web_node['cloud']['public_ipv4'],
'port' => 80,
'ssl_port' => 80
}
members.push(member)
end
node.default['haproxy']['members'] = members

include_recipe 'haproxy::manual'