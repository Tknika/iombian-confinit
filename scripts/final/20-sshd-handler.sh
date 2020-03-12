#!/usr/bin/env bash

{{ if .Data.sshd }}
  if ! (/usr/bin/systemctl -q is-active ssh.service) then
    /usr/bin/systemctl enable ssh
    /usr/bin/systemctl start ssh
    echo "* Starting SSH Server..."
    exit 0
  fi
{{ else }}
  if (/usr/bin/systemctl -q is-active ssh.service) then
    /usr/bin/systemctl stop ssh
    /usr/bin/systemctl disable ssh
    echo "* Stopping SSH Server..."
    exit 0
  fi
{{ end }}
