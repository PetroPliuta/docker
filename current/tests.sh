#!/bin/bash

splynx_package_apt_status=`apt-cache show splynx | awk '/Status/ {print $NF}'`

if [ $splynx_package_apt_status -eq "installed"]; then
    return 0
else
    return 1
fi
