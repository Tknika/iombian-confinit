#!/usr/bin/env bash

{{ if .Data.wetty.enabled }}
  if ! (/usr/bin/systemctl -q is-active wetty.service) then
    /usr/bin/systemctl enable wetty.service
    /usr/bin/systemctl start wetty.service
    echo "* Starting WeTTY service..."
    exit 0
  fi
{{ else }}
  if (/usr/bin/systemctl -q is-active wetty.service) then
    /usr/bin/systemctl stop wetty.service
    /usr/bin/systemctl disable wetty.service
    echo "* Stopping WeTTY service..."
    exit 0
  fi
{{ end }}
