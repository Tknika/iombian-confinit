#!/usr/bin/env bash

{{ if .Data.samba.enabled }}
echo "* Setting SAMBA password..."
(echo {{.Data.user.password}}; sleep 1; echo {{.Data.user.password}} ) | smbpasswd -s -a {{.Data.user.name}}
/usr/bin/systemctl restart smbd.service
echo "* Restarting SAMBA..."
exit 0
{{ else }}
echo "* Disabling SAMBA..."
/usr/bin/systemctl disable smbd.service
/usr/bin/systemctl stop smbd.service
exit 0
{{ end }}