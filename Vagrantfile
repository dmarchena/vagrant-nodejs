Vagrant.require_version ">= 1.1"

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :appserver do |appserver|
    appserver.vm.box = "ubuntu_trusty64"
    appserver.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box"
    appserver.vm.network "private_network", ip: "192.168.56.12"
    appserver.vm.network "forwarded_port", guest: 3000, host: 3000

    appserver.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
    end
    
    appserver.vm.synced_folder "../workspace", "/workspace", create: true

    appserver.vm.provision :shell, path: "appserver/provision.sh"
    appserver.vm.provision :shell, path: "appserver/node-modules.sh", privileged: false

    config.vm.post_up_message = "appserver listening on 192.168.56.12"
  end
  
end
