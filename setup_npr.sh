#!/bin/bash

set -ux

cd "${0%/*}"

dir=$(date +%Y-%m-%d-%H-%M-%S)
mkdir $dir
touch $dir/$dir
cp -a nginx.conf $dir
sudo nginx -s stop
sudo nginx -p $dir -c nginx.conf

sudo cp -a mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo rm /var/log/mysql/mysql-error.log /var/log/mysql/mysql-slow.log
sudo systemctl restart mysql

echo $dir
