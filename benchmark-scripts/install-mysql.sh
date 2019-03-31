#!/bin/bash
source benchmark-scripts/general-helper.sh
mount_fs;
enable_network;
apt remove -y mysql-server
rm -rf /var/lib/mysql*
rm -rf /var/run/mysql*
apt autoremove -y
apt install -y sysbench mysql-server
service mysql start
mysql_secure_installation
mysql -uroot -proot -e "create database sbtest"
service mysql stop