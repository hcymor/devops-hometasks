Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.provider :virtualbox do |v|
    v.gui = true
    v.memory = 2048
  end
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.provision :shell, inline: "sudo apt update -y"
  config.vm.provision :shell, inline: "sudo apt upgrade -y"
  config.vm.provision :shell, inline: "sudo apt install mc apache2 php libapache2-mod-php git -y"
  config.vm.provision :shell, inline: "sudo mkdir -p /var/www/8080"
  config.vm.provision :shell, inline: "sudo mkdir -p /var/www/8081"
  config.vm.provision :shell, inline: "sudo git clone https://github.com/Fenikks/itacademy-devops-files /tmp/itacademy"
  config.vm.provision :shell, inline: "sudo cp /tmp/itacademy/01-demosite-static/index.html /var/www/8080/index.html"
  config.vm.provision :shell, inline: "sudo cp /tmp/itacademy/01-demosite-php/index.php /var/www/8081/index.php"
  config.vm.provision :shell, inline: "sudo rm -rf /tmp/itacademy"
  config.vm.provision :shell, inline: "sudo rm -rf /tmp/itacademy"
  config.vm.provision :shell, inline: "sudo cat << EOF >> /etc/apache2/apache2.conf

  Listen 8081
NameVirtualHost 0.0.0.0:8081
<VirtualHost 0.0.0.0:8081>
  ServerName vhost1
  ServerAlias vhost1
  DocumentRoot '/var/www/8081/'
</VirtualHost>

Listen 8080
NameVirtualHost 0.0.0.0:8080
<VirtualHost 0.0.0.0:8080>
  ServerName vhost2
  ServerAlias vhost2
  DocumentRoot '/var/www/8080/' 
</VirtualHost>
"
  config.vm.provision :shell, inline: "sudo service apache2 restart"

end