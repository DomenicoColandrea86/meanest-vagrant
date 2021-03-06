# -*- mode: ruby -*-
# vi: set ft=ruby :

# Path to the meanest source
MeanestSourcePath = "../meanest"

Vagrant.configure("2") do |config|

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "trusty-amd64"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.hostname = "dev.meanest.com"
    config.ssh.forward_agent = true

    # Add port-forward for application
    config.vm.network :forwarded_port, guest: 3000, host: 3000
    # Add port-forward for nginx ssl
    config.vm.network :forwarded_port, guest: 443, host: 3000
    # Add port-forward for MongoDB
    config.vm.network :forwarded_port, guest: 27017, host: 27017
    # Add port-forward for Livereload
    config.vm.network :forwarded_port, guest: 35729, host: 35729

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network :private_network, ip: "192.168.22.10"

    # Use NFS for the shared folder
    config.vm.synced_folder MeanestSourcePath, "/home/vagrant/code/meanest",
        :nfs => true,
        :mount_options => ['nolock,vers=3,udp,noatime,actimeo=1']

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # VirtualBox:
    config.vm.provider "virtualbox" do |vb|
        # name of virtual box
        vb.name = "meanest_vagrant"
        # Boot with headless mode
        vb.gui = false
        # Use VBoxManage to customize the VM.
        vb.customize ["modifyvm", :id, "--memory", "2048"]
        vb.customize ["modifyvm", :id, "--cpus", "4"]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]

        # Via http://blog.liip.ch/archive/2012/07/25/vagrant-and-node-js-quick-tip.html
        vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

        # Set the timesync threshold to 10 seconds, instead of the default 20 minutes.
        # If the clock gets more than 15 minutes out of sync (due to your laptop going
        # to sleep for instance, then some 3rd party services will reject requests.
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]

        # Prevent VMs running on Ubuntu to lose internet connection
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    # Enable provisioning with Puppet stand alone. Puppet manifests
    # are contained in a directory path relative to this Vagrantfile.
    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "base.pp"
      puppet.module_path = "modules"
      puppet.options = "--verbose --debug"
    end
  end
