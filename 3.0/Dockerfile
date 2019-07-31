FROM ubuntu:16.04

ENV container=docker LC_ALL=C

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y dialog \
    && apt-get install -y systemd \
#clean
    && unset DEBIAN_FRONTEND \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    \
    \
#systemd fixes
    && cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 \
    \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

#Splynx
RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get -y install wget \
    && wget -qO- https://deb.splynx.com/setup_3_0 | bash - \
    && apt-get -y install splynx; \
#clean
    unset DEBIAN_FRONTEND \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start.sh start-systemd.sh splynx-start.service /var/www/splynx/docker/
RUN chmod +x /var/www/splynx/docker/start*

VOLUME [ "/sys/fs/cgroup", "/var/www/splynx", "/var/lib/mysql", "/etc", "/var/log", "/tmp", "/var/tmp" ]

EXPOSE 80 443 1812/udp 1813/udp

ENTRYPOINT ["/var/www/splynx/docker/start.sh"]
