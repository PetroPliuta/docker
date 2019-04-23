#!/bin/bash

splynx_package_apt_status=`apt-cache show splynx | awk '/Status/ {print $NF}'`

if [ "$splynx_package_apt_status" = "installed" ]; then
    exit 0
else
    exit 1
fi
