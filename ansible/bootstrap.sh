#!/usr/bin/env bash
#
# Bootstrap the vagrant VM by installing Ansible and
# letting ansible do the provisioning in local connection mode
#
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:rquillo/ansible
sudo apt-get update
sudo apt-get install -y ansible
mkdir /home/vagrant/ansible
# ln -s /vagrant/ansible/hosts /home/vagrant/ansible/hosts
# ln -s /vagrant/ansible/playbook.yml /home/vagrant/ansible/playbook.yml
cp /vagrant/ansible/hosts /home/vagrant/ansible
cp /vagrant/ansible/playbook.yml /home/vagrant/ansible
chmod 666 /home/vagrant/ansible/hosts
cd /home/vagrant/ansible
sudo ansible-playbook playbook.yml -i hosts