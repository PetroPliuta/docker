Splynx Framework – WISP billing and network management  
https://splynx.com

---

***WARNING! This document is under heavy development. Not compatible changes can be made.***


### Create Splynx container  
`docker create --name splynx-container --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -p 1812:1812/udp -p 1813:1813/udp -v splynx:/var/www/splynx -v mysql-data:/var/lib/mysql -v etc:/etc pliuta/splynx 11223344556677889900 Europe/Prague`

where:  
* **11223344556677889900** - license key
* **Europe/Prague** - timezone. You can figure out your timezone here - https://www.zeitverschiebung.net/en/

### Start container  
`docker start splynx-container`

### Enter into container  
`docker exec -it splynx-container bash`

### Exit from container  
`exit`

### Turn off container (from container)  
`poweroff`

### Turn off container (from host)
`docker stop splynx-container`

---
Splynx web interface will be available on the 80/tcp port of the host. You can change this by changing docker create command. Change **-p 80:80** to **\-p host_port:container_port** . For instance if you write **-p 8080:80**, Splynx will be available on the 8080 port of the host.  
Default web inteface login/password = admin/docker.

Links:  
* Systemd - https://hub.docker.com/r/jrei/systemd-ubuntu/
* Volumes - https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile
