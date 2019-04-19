#!/bin/bash

dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
/var/www/splynx/system/script/passwd admin --login=admin --password=docker >>/var/www/splynx/docker/log.log 2>&1
