#!/usr/bin/env bash

{{ if .Data.system.country }}
if rfkill list | grep "Soft blocked: yes"; then
    echo "* Unblocking WiFi..."
    rfkill unblock wifi
else
    echo "* WiFi already unblocked..."
fi
{{ else }}
exit 0
{{ end }}
