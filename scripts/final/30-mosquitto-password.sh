#!/usr/bin/env bash

{{ if .Data.mosquitto.auth }}
echo "* Setting mosquitto authentication ..."
mosquitto_passwd -U /etc/mosquitto/passwd
/usr/bin/systemctl restart mosquitto
{{ else }}
exit 0
{{ end }}
