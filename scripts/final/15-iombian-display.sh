#!/usr/bin/env bash

{{ if .Data.display.enabled }}
  if ! (/usr/bin/systemctl -q is-active iombian-display-handler.service) then
    /usr/bin/systemctl enable iombian-display-handler.service
    /usr/bin/systemctl start iombian-display-handler.service
    echo "* Starting IoMBian Display..."
    exit 0
  fi
{{ else }}
  if (/usr/bin/systemctl -q is-active iombian-display-handler.service) then
    /usr/bin/systemctl stop iombian-display-handler.service
    /usr/bin/systemctl disable iombian-display-handler.service
    echo "* Stopping IoMBian Display..."
    exit 0
  fi
{{ end }}
