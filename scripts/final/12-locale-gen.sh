#!/usr/bin/env bash

{{ if .Data.system.lang }}
if locale 2>&1 | grep -q "Cannot"; then
    echo -n "* Defining locale for the first time"
    /usr/sbin/locale-gen
    echo "done"
elif ! locale | grep LANG={{ .Data.system.lang }}; then
    echo -n "* Changing locale (System language is different than the configured one)"
    /usr/sbin/locale-gen
    echo "done"
fi
{{ end }}
exit 0
