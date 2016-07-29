# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'web' do |conf|
    conf.vm.box = 'bento/ubuntu-14.04'
    conf.vm.hostname = 'web'
    if Vagrant.has_plugin?('vagrant-omnibus')
      config.omnibus.chef_version = 'latest'
    end
    conf.vm.network :private_network, ip: '172.28.128.10'
    conf.berkshelf.enabled = true
    conf.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagement::default]',
        'recipe[go-app-configmanagement::nginx]'
      ]
    end
  end

  config.vm.define 'app-01' do |conf|
    conf.vm.box = 'bento/ubuntu-14.04'
    conf.vm.hostname = 'app-01'
    if Vagrant.has_plugin?('vagrant-omnibus')
      config.omnibus.chef_version = 'latest'
    end
    conf.vm.network :private_network, ip: '172.28.128.11'
    conf.berkshelf.enabled = true
    conf.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagement::default]',
        'recipe[go-app-configmanagement::go_app]'
      ]
    end
  end

  config.vm.define 'app-02' do |conf|
    conf.vm.box = 'bento/ubuntu-14.04'
    conf.vm.hostname = 'app-02'
    if Vagrant.has_plugin?('vagrant-omnibus')
      conf.omnibus.chef_version = 'latest'
    end
    conf.vm.network :private_network, ip: '172.28.128.12'
    conf.berkshelf.enabled = true
    conf.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagement::default]',
        'recipe[go-app-configmanagement::go_app]'
      ]
    end
  end
end
