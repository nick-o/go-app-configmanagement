#
# Cookbook Name:: go-app-configmanagement
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node.default['chef-client']['log_file'] = '/var/log/chef/client.log'

recipes = %w(apt chef-sugar)

unless Chef::Config[:solo]
  recipes << 'chef-client::delete_validation'
  recipes << 'chef-client::config'
  recipes << 'chef-client'
end

recipes.each do |r|
  include_recipe r
end
