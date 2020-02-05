#!/bin/bash

license_length=`grep license /var/www/splynx/config/config.php | grep -v ^# | tail -n 1 | cut -d= -f2 | tr -d "\n\r\" " | wc -m`
if [ "$license_length" -ne "32" ]; then
    dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
    /var/www/splynx/system/script/passwd admin --login=admin --password=docker >>/var/www/splynx/docker/log.log 2>&1  
fi

dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
