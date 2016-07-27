#
# Cookbook Name:: go-app-configmanagement
# Recipe:: nginx
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

ips = %w(172.28.128.11 172.28.128.12)

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
