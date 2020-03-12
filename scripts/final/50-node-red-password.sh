#!/usr/bin/env bash

{{ if .Data.nodered.auth }}
echo "* Setting Node-RED password..."
cd /home/{{.Data.user.name}}/.node-red
pass=$(node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" {{.Data.user.password}})
sed -i "s@replace_password@$pass@g" settings.js
/usr/bin/systemctl restart nodered.service
echo "* Restarting Node-RED..."
exit 0
{{ else }}
exit 0
{{ end }}
