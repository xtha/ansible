#!/bin/bash
cd /tmp
service salt-minion stop

rpm -e salt-minion
rpm -e salt
rpm -e python26-zmq
rpm -e zeromq
rpm -e libzmq3
rm -rf /etc/salt

rpm -ivh /tmp/libzmq3-3.2.2-13.1.i386.rpm
rpm -ivh /tmp/zeromq-3.2.2-13.1.i386.rpm
rpm -ivh /tmp/python26-zmq-2.2.0.1-1.el5.centos.i386.rpm
rpm -ivh /tmp/salt-2014.1.0-1.el5.noarch.rpm
rpm -ivh /tmp/salt-minion-2014.1.0-1.el5.noarch.rpm
yum install python-jinja2 -y
echo "master: salt.hdtr.com" >> /etc/salt/minion
service salt-minion start
chkconfig salt-minion on

salt-call --versions-report
tail -n 1 /etc/salt/minion
ping salt.hdtr.com -c 1
