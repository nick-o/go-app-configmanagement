# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define 'web' do |config|
    config.vm.box = 'bento/ubuntu-14.04'
    config.vm.hostname = 'web'
    if Vagrant.has_plugin?("vagrant-omnibus")
      config.omnibus.chef_version = 'latest'
    end
    config.vm.network :private_network, ip: '172.28.128.10'
    config.berkshelf.enabled = true
    config.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagment::default]',
        'recipe[go-app-configmanagment::nginx]'
      ]
    end
  end

  config.vm.define 'app-01' do |config|
    config.vm.box = 'bento/ubuntu-14.04'
    config.vm.hostname = 'app-01'
    if Vagrant.has_plugin?("vagrant-omnibus")
      config.omnibus.chef_version = 'latest'
    end
    config.vm.network :private_network, ip: '172.28.128.11'
    config.berkshelf.enabled = true
    config.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagment::default]',
        'recipe[go-app-configmanagment::go-app]'
      ]
    end
  end

  config.vm.define 'app-02' do |config|
    config.vm.box = 'bento/ubuntu-14.04'
    config.vm.hostname = 'app-02'
    if Vagrant.has_plugin?("vagrant-omnibus")
      config.omnibus.chef_version = 'latest'
    end
    config.vm.network :private_network, ip: '172.28.128.12'
    config.berkshelf.enabled = true
    config.vm.provision :chef_solo do |chef|
      chef.json = {
        mysql: {
          server_root_password: 'rootpass',
          server_debian_password: 'debpass',
          server_repl_password: 'replpass'
        }
      }
      chef.run_list = [
        'recipe[go-app-configmanagment::default]',
        'recipe[go-app-configmanagment::go-app]'
      ]
    end
  end


end
