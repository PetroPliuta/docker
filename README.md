Splynx Framework – WISP billing and network management  
https://splynx.com

---

### Create Splynx container  
`docker run --rm --name splynx-container -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p80:80 -p443:443 -p1812:1812/udp -p1813:1813/udp -v splynx:/var/www/splynx -v mysql-data:/var/lib/mysql -v etc:/etc pliuta/splynx 11223344556677889900 Europe/Prague`

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

Links:  
* Systemd - https://hub.docker.com/r/jrei/systemd-ubuntu/
* Volumes - https://stackoverflow.com/questions/41935435/understanding-volume-instruction-in-dockerfile
