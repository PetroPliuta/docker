#run container
docker run --rm --name splynx-container -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p80:80 -p443:443 -p1812:1812/udp -p1813:1813/udp -v splynx:/var/www/splynx -v mysql-data:/var/lib/mysql -v etc:/etc  splynx

#enter into container
docker exec -it splynx-container bash

#exit from container
exit

#turn off container !from container!
poweroff

#turn off container from host
docker stop splynx-container


Links:
Systemd - https://hub.docker.com/r/jrei/systemd-ubuntu/
Volumes - https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile
