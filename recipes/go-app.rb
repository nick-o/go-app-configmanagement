#
# Cookbook Name:: go-app-configmanagment
# Recipe:: go-app
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group node['myface']['group']

user node['myface']['user'] do
  supports manage_home: true
  group node['myface']['group']
  home "/opt/#{node['myface']['user']}"
  system true
  shell '/bin/bash'
  action :create
end
