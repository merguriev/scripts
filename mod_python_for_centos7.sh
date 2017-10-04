#!/bin/bash
yum install -y wget
cd /tmp
wget http://repo.iotti.biz/CentOS/7/x86_64/mod_python-3.5.0-16.el7.lux.1.x86_64.rpm
rpm -i mod_python-3.5.0-16.el7.lux.1.x86_64.rpm

