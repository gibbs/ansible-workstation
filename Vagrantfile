# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "arch" do |arch|
    arch.vm.box = "archlinux/archlinux"
  end

  config.vm.synced_folder "./", "/home/vagrant/ansible-workstation",
    mount_options: ["dmode=755,fmode=644"]

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "4096"
  end
end
