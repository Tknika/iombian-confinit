#!/usr/bin/env bash

{{ if .Data.mail }}
echo "* Starting Postif configuration..."
chmod 0400 /etc/postfix/sasl_passwd
/usr/sbin/postmap /etc/postfix/sasl_passwd
/usr/bin/systemctl restart postfix
echo "* Restarting Postfix..."
exit 0
{{ else }}
echo "* Mail configuration not set..."
exit 0
{{ end }}
