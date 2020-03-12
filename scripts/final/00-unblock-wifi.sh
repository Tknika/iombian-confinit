#!/usr/bin/env bash

{{ if .Data.system.country }}
if hash rfkill 2> /dev/null; then
    echo "* Unblocking wifi..."
    rfkill unblock wifi
fi
{{ else }}
exit 0
{{ end }}
