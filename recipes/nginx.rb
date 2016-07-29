#
# Cookbook Name:: go-app-configmanagement
# Recipe:: nginx
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

# ips = %w(172.28.128.11 172.28.128.12)

ips = []
unless Chef::Config[:solo]
  app_nodes = search(:node, 'tags:app')
  app_nodes.each do |node|
    ips.push(best_ip_for(node))
  end
end

ips.push('127.0.0.1') if ips.empty?

template 'nginx_lb' do
  cookbook 'go-app-configmanagement'
  source 'nginx_lb.erb'
  path "#{node['nginx']['dir']}/sites-available/lb"
  owner 'root'
  group 'root'
  mode '0644'
  variables(servers: ips)
  notifies :reload, 'service[nginx]'
end

nginx_site 'lb' do
  enable true
  notifies :reload, 'service[nginx]'
end
