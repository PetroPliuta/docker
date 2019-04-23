#!/bin/bash

splynx_package_apt_status=`apt-cache show splynx | awk '/Status/ {print $NF}'`

if [ "$splynx_package_apt_status" != "installed" ]; then
    exit 12
fi

#exit 0
