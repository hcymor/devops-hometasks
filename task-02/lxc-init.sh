#!/bin/bash
lxc-create -t download -n lxc_static -- -d centos -r 7 -a amd64
lxc-start -n lxc_static
lxc-attach -n lxc_static -- yum install httpd -y
lxc-attach -n lxc_static -- systemctl start httpd.service
lxc-attach -n lxc_static -- systemctl enable httpd.service
lxc-attach -n lxc_static -- yum install git -y
lxc-attach -n lxc_static -- mkdir /tmp/itacademy
lxc-attach -n lxc_static -- git clone https://github.com/Fenikks/itacademy-devops-files /tmp/itacademy
lxc-attach -n lxc_static -- cp /tmp/itacademy/01-demosite-static/index.html /var/www/html/index.html
lxc-attach -n lxc_static -- rm -rf /tmp/itacademy

lxc-create -t download -n lxc_dynamic -- -d centos -r 7 -a amd64
lxc-start -n lxc_dynamic
lxc-attach -n lxc_dynamic -- yum install httpd -y
lxc-attach -n lxc_dynamic -- yum install php -y
lxc-attach -n lxc_dynamic -- systemctl start httpd.service
lxc-attach -n lxc_dynamic -- systemctl enable httpd.service
lxc-attach -n lxc_dynamic -- yum install git -y
lxc-attach -n lxc_dynamic -- mkdir /tmp/itacademy
lxc-attach -n lxc_dynamic -- git clone https://github.com/Fenikks/itacademy-devops-files /tmp/itacademy
lxc-attach -n lxc_dynamic -- cp /tmp/itacademy/01-demosite-php/index.php /var/www/html/index.php
lxc-attach -n lxc_dynamic -- rm -rf /tmp/itacademy
