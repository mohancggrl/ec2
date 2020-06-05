#!/bin/bash
#to change hostname
servername=Apache
echo "you are going to set hostname is $servername"
echo "$servername" >/etc/hostname
privateip=$(hostname -I)
echo "$privateip $servername" >>/etc/hosts
hostname -F /etc/hostname
# Install Apache service
yum install httpd wget unzip vim -y
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://github.com/BlackrockDigital/startbootstrap-freelancer/archive/gh-pages.zip
unzip gh-pages.zip
cp -R startbootstrap-freelancer-gh-pages/* /var/www/html/