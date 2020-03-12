#!/usr/bin/env bash

{{ if .Data.system.lang }}
if ! locale | grep LANG={{ .Data.system.lang }}; then
    echo -n "* Changing locale (System language is different than the configured one)"
    /usr/sbin/locale-gen
    echo "done"
fi
{{ end }}
exit 0
