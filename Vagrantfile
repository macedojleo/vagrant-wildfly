Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "wildfly-Jboss"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9990, host: 9990
  config.vm.provision "shell", path: "install.sh", args: "/vagrant"
end