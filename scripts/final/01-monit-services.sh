#!/usr/bin/env bash

cd /etc/monit/conf-enabled

echo "* Checking eth0 ..."
if ip link show eth0 2>/dev/null
then
  echo "* Enabling eth0 in monit"
  ln -sf ../conf-available/eth0 eth0
else
  echo "* Disabling eth0 in monit"
  rm -f eth0
fi

echo "* Checking wlan0 ..."
if ip link show wlan0 2>/dev/null
then
  echo "* Enabling wlan0 in monit"
  ln -sf ../conf-available/wlan0 wlan0
else
  echo "* Disabling wlan0 in monit"
  rm -f wlan0
fi

exit 0
