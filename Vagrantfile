# -*- mode: ruby -*-
# vi: set ft=ruby :

# Node definition
nodes = [
  {
    :hostname => 'consul-01',
    :groups   => '/Docker/Consul',
    :cpus     => 1,
    :memory   => 256,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.11',
        :auto_config => true,
      },
    ],
  },
  {
    :hostname => 'consul-02',
    :groups   => '/Docker/Consul',
    :cpus     => 1,
    :memory   => 256,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.12',
        :auto_config => true,
      },
    ],
  },
  {
    :hostname => 'consul-03',
    :groups   => '/Docker/Consul',
    :cpus     => 1,
    :memory   => 256,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.13',
        :auto_config => true,
      },
    ],
  },
  {
    :hostname => 'frontend-01',
    :groups   => '/Docker/Frontend',
    :cpus     => 1,
    :memory   => 384,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.14',
        :auto_config => true,
      },
    ],
  },
  {
    :hostname => 'frontend-02',
    :groups   => '/Docker/Frontend',
    :cpus     => 1,
    :memory   => 384,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.15',
        :auto_config => true,
      },
    ],
  },
  {
    :hostname => 'backend-01',
    :groups   => '/Docker/Backend',
    :cpus     => 1,
    :memory   => 384,
    :box      => 'trusty-server-cloudimg-amd64',
    :box_url  => 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box',
    :forwarded_ports => [],
    :synced_folders => [
      {
        :host => '/Users',
        :guest => '/Users',
      },
    ],
    :networks => [
      {
        :ip => '172.16.10.16',
        :auto_config => true,
      },
    ],
  },
]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.hostname = node[:hostname]
      node_config.vm.box = node[:box]
      node_config.vm.box_url = node[:box_url]

      node[:forwarded_ports].each do |forwarded_port|
        node_config.vm.network "forwarded_port", guest: forwarded_port[:guest], host: forwarded_port[:host]
      end

      node[:synced_folders].each do |synced_folder|
        node_config.vm.synced_folder synced_folder[:host], synced_folder[:guest]
      end

      node[:networks].each do |network|
        if network[:ip]
          node_config.vm.network "private_network", ip: network[:ip], auto_config: network[:auto_config]
        end

        if network[:type]
          node_config.vm.network "private_network", type: network[:type], auto_config: network[:auto_config]
        end
      end

      node_config.vm.provider "virtualbox" do |v|
        v.name = node[:hostname]
        v.cpus = node[:cpus]
        v.memory = node[:memory]
        v.customize ["modifyvm", :id, "--groups", node[:groups]]
      end

      node_config.vm.provision "file", source: node[:hostname], destination: "/home/vagrant"
      node_config.vm.provision "shell", :path => "bootstrap.sh"
    end
  end
end
