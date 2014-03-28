# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$shell = <<SCRIPT
    echo ---------- Executing shell provisioner ----------
    echo "" ;
    echo ---------- Updating package info, lists, dependencies of repos and PPAs ----------
    sudo apt-get -y update ; echo ""
    echo ---------- Installing python-software-properties ----------
    sudo apt-get -y install python-software-properties build-essential ;sudo apt-get -y update ;echo ""
    echo ---------- Installing software-properties-common ----------
    sudo apt-get -y install software-properties-common ;sudo apt-get -y update ;echo ""
    echo ---------- Adding repo ppa:ondrej/php5-oldstable ----------
    sudo add-apt-repository ppa:ondrej/php5-oldstable ;sudo apt-get -y update ;echo ""
    echo ---------- Installing PHP5 and requirements -----------
    sudo apt-get -y install curl php5-cli php5-curl php5-mcrypt php5-gd php5; sudo apt-get -y update; echo ""
    echo ---------- Installing git ----------
    sudo apt-get -y install git ;sudo apt-get -y update ;echo ""
    echo ---------- Downloading Composer Executable ----------
    cd /bin
    curl -sS https://getcomposer.org/installer | php ;echo "";
    echo ---------- Creating Laravel Project ----------
    cd /home/vagrant ;sudo mkdir projects; cd projects ; sudo composer.phar create-project laravel/laravel; cd laravel; alias artisan="php artisan"; echo "";
    echo ---------- Adding repo ppa:rquillo/ansible ----------
    sudo apt-add-repository ppa:rquillo/ansible ;sudo apt-get -y update ;echo ""
    echo ---------- Installing Ansible ----------
    sudo apt-get -y install ansible
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.name = "cb_boy"
        # virtualbox.customize ["modifyvm", :id, "--memory", "1024", "--name", "ansible-plaything", "--cpuexecutioncap", "50"]
        # virtualbox.gui = true
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.network :public_network
  config.vm.network "forwarded_port", host: 8000, guest: 8000
  # config.vm.network :private_network, ip: "192.168.100.2"
  # config.vm.network :private_network, ip: "127.0.0.2"

  config.vm.provision "shell", :path => "ansible/bootstrap.sh"
  config.vm.boot_timeout = 20
end