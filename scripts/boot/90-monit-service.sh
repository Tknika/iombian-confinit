#!/usr/bin/env bash
# File autogenerated by confinit
# These services are automatically enabled in systemd if their monit configuration
# exists in /etc/monit/conf-enabled. Systemd has a condition ConditionPathExists
# checking if monit has the configuration there.

# Avahi
{{ if .Data.avahi }}
echo -n "* Enable Avahi daemon ... "
pushd /etc/monit/conf-enabled >/dev/null
    ln -sf ../conf-available/avahi-daemon
popd
echo "done"
{{ else }}
echo -n "* Disable Avahi daemon ... "
rm -f /etc/monit/conf-enabled/avahi-daemon
echo "done"
{{ end }}

# SSH
{{ if .Data.sshd.enabled }}
echo -n "* Enable SSH daemon ... "
pushd /etc/monit/conf-enabled >/dev/null
    ln -sf ../conf-available/openssh-server
popd
echo "done"
{{ else }}
echo -n "* Disable SSH daemon ... "
rm -f /etc/monit/conf-enabled/openssh-server
echo "done"
{{ end }}

# Postfix
{{ if .Data.mail }}
echo -n "* Enable Postfix daemon ... "
pushd /etc/monit/conf-enabled >/dev/null
    ln -sf ../conf-available/postfix
popd
echo "done"
{{ else }}
echo -n "* Disable Postfix daemon ... "
rm -f /etc/monit/conf-enabled/postfix
echo "done"
{{ end }}

# Mosquitto
{{ if .Data.mosquitto }}
echo -n "* Enable Mosquitto daemon ... "
pushd /etc/monit/conf-enabled >/dev/null
    ln -sf ../conf-available/mosquitto
popd
echo "done"
{{ else }}
echo -n "* Disable Mosquitto daemon ... "
rm -f /etc/monit/conf-enabled/mosquitto
echo "done"
{{ end }}

# Node-RED
{{ if .Data.nodered }}
echo -n "* Enable Node-RED daemon ... "
pushd /etc/monit/conf-enabled >/dev/null
    ln -sf ../conf-available/nodered
popd
echo "done"
{{ else }}
echo -n "* Disable Node-RED daemon ... "
rm -f /etc/monit/conf-enabled/nodered
echo "done"
{{ end }}

exit 0
