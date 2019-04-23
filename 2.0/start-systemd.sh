#!/bin/bash

splynx_init()
{
    dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
    /var/www/splynx/system/script/passwd admin --login=admin --password=docker >>/var/www/splynx/docker/log.log 2>&1
}

redis_setup()
{
    rm -fv /var/www/splynx/config/redis.php >>/var/www/splynx/docker/log.log 2>&1
    dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
}

license_length=`grep license /var/www/splynx/config/config.php | grep -v ^# | tail -n 1 | cut -d= -f2 | tr -d "\n\r\" " | wc -m`
if [ "$license_length" -ne "32" ]; then
    splynx_init
fi

redis_pass=`grep -i requirepass /etc/redis/redis.conf | grep -v ^# | tail -n 1 | cut -d\  -f2 | tr -d "\n\r\" "`
splynx_redis_pass=`grep -i password /var/www/splynx/config/redis.php | grep -v ^# | tail -n 1 | cut -d= -f2 | tr -d "\n\r\" "`
if [ "$redis_pass" != "$splynx_redis_pass" -a -e "/var/www/splynx/config/redis.php" ]; then
    redis_setup
fi

#If Splynx version was updated
dpkg-reconfigure -fnoninteractive splynx >>/var/www/splynx/docker/log.log 2>&1
