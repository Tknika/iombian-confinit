#!/usr/bin/env bash

{{ if .Data.user }}
echo -n "Changing password for {{ .Data.user.name }} ... "
echo "{{ .Data.user.name }}:{{ .Data.user.password }}" | chpasswd
echo "done"
{{ end }}
exit 0
