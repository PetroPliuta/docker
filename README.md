Splynx Framework – WISP billing and network management  
https://splynx.com

---

### Create Splynx container  
`docker create --name splynx-container --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 -p 1812:1812/udp -p 1813:1813/udp -v splynx:/var/www/splynx -v mysql-data:/var/lib/mysql -v etc:/etc --mount type=tmpfs,destination=/tmp --mount type=tmpfs,destination=/var/tmp pliuta/splynx 0011223344556677889900 Europe/Prague`

where:  
* **11223344556677889900** - license key
* **Europe/Prague** - timezone. You can figure out your timezone here - https://www.zeitverschiebung.net/en/

replace **pliuta/splynx** to:
* **pliuta/splynx:1.3** to create container with Splynx 1.3  
* **pliuta/splynx:2.0** to create container with Splynx 2.0  
* **pliuta/splynx:2.1** to create container with Splynx 2.1  
* **pliuta/splynx:2.2** to create container with Splynx 2.2  
* **pliuta/splynx:2.3** to create container with Splynx 2.3  

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
Splynx web interface will be available on the 80/tcp port of the host. You can change port by changing `docker create` command. Change **-p 80:80** to **\-p host_port:container_port** . For instance if you write **-p 8080:80**, Splynx will be available on the 8080 port of the host.  
Default web inteface credentials = admin/docker.

Links:  
* Systemd - https://hub.docker.com/r/jrei/systemd-ubuntu/
* Volumes - https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile
