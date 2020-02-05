#!/bin/bash

cp -fv /var/www/splynx/docker/splynx-start.service /etc/systemd/system/multi-user.target.wants/splynx-start.service >>/var/www/splynx/docker/log.log 2>&1

#start system
exec /lib/systemd/systemd
