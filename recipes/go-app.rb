#
# Cookbook Name:: go-app-configmanagement
# Recipe:: go-app
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group node['go-app-configmanagement']['group']

user node['go-app-configmanagement']['user'] do
  supports manage_home: true
  group node['go-app-configmanagement']['group']
  home "/opt/#{node['go-app-configmanagement']['user']}"
  system true
  shell '/bin/bash'
  action :create
end

remote_file "/opt/#{node['go-app-configmanagement']['user']}/go-app" do
  source 'https://s3-eu-west-1.amazonaws.com/go-app-artifacts/go-app'
  owner node['go-app-configmanagement']['user']
  group node['go-app-configmanagement']['group']
  mode '0755'
end

include_recipe 'supervisor'
supervisor_service 'go-app' do
  command "/opt/#{node['go-app-configmanagement']['user']}/go-app"
  action :enable
  user node['go-app-configmanagement']['user']
end
