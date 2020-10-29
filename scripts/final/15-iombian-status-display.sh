#!/usr/bin/env bash

{{ if .Data.display.enabled }}
  if ! (/usr/bin/systemctl -q is-active iombian-status-display.service) then
    /usr/bin/systemctl enable iombian-status-display.service
    /usr/bin/systemctl start iombian-status-display.service
    echo "* Starting IoMBian Status Display..."
    exit 0
  fi
{{ else }}
  if (/usr/bin/systemctl -q is-active iombian-status-display.service) then
    /usr/bin/systemctl stop iombian-status-display.service
    /usr/bin/systemctl disable iombian-status-display.service
    echo "* Stopping IoMBian Status Display..."
    exit 0
  fi
{{ end }}
