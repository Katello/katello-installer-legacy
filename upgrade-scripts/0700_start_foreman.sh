#!/bin/bash

#name: Start foreman service
#apply: katello
#run: always
#description:
#Start the service
if [ -x /etc/init.d/foreman -o -x /lib/systemd/system/foreman.service ]; then
  /usr/sbin/service-wait foreman start
fi