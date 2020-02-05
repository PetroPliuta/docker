#!/bin/bash

redis_pass=`grep -i requirepass /etc/redis/redis.conf | grep -v ^# | tail -n 1 | cut -d\  -f2 | tr -d "\n\r\" "`
splynx_redis_pass=`grep -i password /var/www/splynx/config/redis.php | grep -v ^# | tail -n 1 | cut -d= -f2 | tr -d "\n\r\" "`
if [ "$redis_pass" != "$splynx_redis_pass" -a -e "/var/www/splynx/config/redis.php" ]; then
    rm -fv /var/www/splynx/config/redis.php >>/var/www/splynx/docker/log.log 2>&1
    dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
fi

dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
