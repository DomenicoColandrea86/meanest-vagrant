# MEANEST-vagrant

> A very mean Vagrant stack

## Tech Stack
* Ubuntu 64-bit AMD 14.04
* NodeJS & NPM
* GIT
* MongoDB
* MySQL
* Ruby & SASS
* PhantomJS
* NGINX
* Nodemon, Yo, Bower, Grunt-Cli, Mocha, Karma

## Prerequisites
Make sure you have installed all of the following prerequisites on your development machine:

* **VirtualBox** - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) is a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use.

* **Vagrant** - [Vagrant](https://www.vagrantup.com/downloads.html) is a tool for building and distributing development environments

* **Puppet** - [Puppet](https://puppetlabs.com/misc/download-options) is a server automation framework and application

* **VirtualBox Guest Additions Plugin** - A Vagrant plugin to keep your VirtualBox Guest Additions up to date
  
   ````$ vagrant plugin install vagrant-vbguest````

* **Librarian-puppet** - Librarian-puppet is a bundler for your puppet infrastructure, used to manage the puppet modules your infrastructure depends on
  
  ````$ gem install librarian-puppet````


## Dev Workflow

Navigate to the project root directory ````/meanest-vagrant````

### Initialize and fetch puppet modules

````$ librarian-puppet install````

### Up and running

It is time to boot your Vagrant environment. Run the following:

````$ vagrant up````

You now have a fully running virtual machine in VirtualBox running Ubuntu 64-bit AMD 14.04

### Connect to the virtual machine via ssh:

Now you want to connect to your virtual machine. This command will drop you into a full-fledged SSH session.

````$ vagrant ssh````

### Run MySQL migration script

Now that your connected to your virtual machine ````cd```` into the ````$ ~code/meanest/server/data```` directory

Then run ````$ node migrate.js````

### Last but not least let's launch the application by navigating to the project root directory and kickoff Grunt

````$ cd code/meanest````

````$ grunt````

For more details on this projects recommended development workflow goto [THIS](https://github.com/DomenicoColandrea86/meanest) repo

## Post-Installation Configuration

### update your machine's host file

````127.0.0.1 dev.meanest.com````

We use Nginx as a reverse proxy, serving HTTPS to the client

[https://dev.meanest.com:3000](https://dev.meanest.com:3000)

### Log into Sequel Pro via SSH

````
* Name: Meanest
* MySQL Host: 192.168.22.10
* Username: root
* Password: root
* SSH Host: 192.168.22.10
* SSH User: vagrant
* SSH Password: vagrant
* SSH Port: vagrant
````


## Other Helpful Vagrant commands:

**vagrant suspend** will save the current running state of the machine and stop it. When you're ready to begin working again, just run vagrant up, and it will be resumed from where you left off.

````$ vagrant suspend````

**vagrant halt** will gracefully shut down the guest operating system and power down the guest machine. You can use vagrant up when you're ready to boot it again.

````$ vagrant halt````

**vagrant destroy** will remove all traces of the guest machine from your system. It'll stop the guest machine, power it down, and remove all of the guest hard disks.

````$ vagrant destroy````
    
## Environment Details

`````
* Application URL = https://dev.meanest.com
* Application port = 3000
* Application Server IP = 192.168.22.10
`````
