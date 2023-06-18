#!/bin/bash
# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Credits: RaphaelRochet/arch-update
# https://github.com/RaphaelRochet/arch-update
# Icon by @edskeye


update=$(/bin/sh -c "/usr/bin/checkupdates && /usr/bin/trizen -Qqu -a")
update_count=$(echo "${update}" | wc -l)

if [[ ! -z "${update}" ]]; then
  echo " ${update_count}"
  echo -ne "Updates:\n${update}" | column -t | tr '\n' '\r'
  notify-send "Pending updates" "<i>${update}</i>" --icon="distributor-logo-archlinux"
fi

#i=$(checkupdates) ;
#echo \"$i\" | wc -l ;
#echo \"$i\" | column -t |tr '\n' '\r'
