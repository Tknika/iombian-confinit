# IoMBian confinit

Repository that contains the [`confinit`](https://github.com/jriguera/confinit) configuration used in the IoMBian project. The setup handles the following packages:

- 'iompi' user's password (the username cannot be changed)
- Hostname
- Locale
- Timezone
- Network (wireless settings and configuration for each interface)
- Display
- Node-RED
- Mosquitto
- Hivemq mqtt web client (browser MQTT client)
- Monit
- Postfix


## Parameters.yml

If your distro is using this project (such as [IoMBian](https://github.com/Tknika/iombian)), your device can be easily configured editing the `parameters.yml` file in `/boot/config`. This file can be accessed from any of the main operating systems (Windows, Linux, MacOS) and can be edited with a simple text editor.

The file is divided in different sections:


### System

```yaml
system:
  forceipv4: true
  domain: 'local'
  hostname: iombian
  country: ES
  timezone: 'Europe/Madrid'
  lang: 'es_ES.UTF-8'
```

You should change the `hostname` parameter, to avoid having more than one device with the same name in your local network, and adjust the `country`, `timezone` and `lang` parameters according to your needs.


### User

```yaml
user:
  name: iompi
  password: iompi
  #email: your@email.com
```

You can, at any time, change the `iompi` user's password, but not the username itself. The `email` parameter is used as the mail account that will receive the notifications generated by [Monit](https://mmonit.com/monit/).


### Networking

```yaml
networking:
  eth0:
    profile: 'static'
    ip: '192.168.0.10/24'
    #gw: '192.168.0.1'
    #dns: 
      #- '8.8.8.8'
      #- '8.8.4.4'
  #eth1:
    #profile: 'dhcp'
  wlan0:
    profile: 'dhcp'
    wlan:
      ssid: ''
      psk: ''
    #wlan2:
      #ssid: ''
      #psk: ''
```

In this section you can define the network configuration of your device. For each interface (wlan0, eth0, eth1,...) you can define if you want to obtain the IP address using DHCP (`profile: 'dhcp'`) or you want to assign a fixed IP to the device (`profile: 'static'`). The 'static' profile forces you to set the IP address and the netmask (`ip: '192.168.0.10/24'`) and, optionally, the default gateway (`gw: '192.168.0.1'`) and the DNS servers (`dns`).

Finally, the `wlan` section of your wireless interface (wlan0) allows you to set the name (`ssid`) and password (`psk`) of the network you want your device to connect to. A second WiFi network can also be added using the `wlan2` configuration parameter.

> Warning: if you want to connect to an open WiFi network, you have to replace the `psk` parameter with: ```key_mgmt: NONE```

#### Display

```yaml
display: 
  enabled: false
```

Set the `enabled` parameter to `true` if your device has a TFT display.

#### SSH

```yaml
sshd: 
  enabled: false
```

Set the `enabled` parameter to `true` if you want to enable the SSH server.


#### Node-RED

```yaml
nodered:
  port: 1880
  auth: true
```

You can change Node-RED's port number through the `port` parameter. At the same time, setting the `auth` parameter to true will enable the basic username and password authentication system. The username and the password will be the same as the ones defined in the [user](#user) section.


#### Mosquitto

```yaml
mosquitto:
  port: 1883
  websockets: true
  auth: true
```

The `port` parameter defines the port on which mosquitto (the MQTT broker) will be listening to new connections. The `websockets` parameter activates the websocket server (port 8000) and `auth`, as in [Node-RED](#node-red), enables the authentication system of the broker.


#### MQTT client

```yaml
mqttclient:
  port: 1888
```

1888 is the port in which the MQTT web client is available, but this can be controlled changing the `port` parameter.


#### Samba

```yaml
samba:
  enabled: true
```

By default, the `/data` folder of the device is shared using the [Samba](https://en.wikipedia.org/wiki/Samba_(software)) protocol. The connection is protected using the same credentials defined in the [user](#user) section. This service can be disabled setting the `enabled` parameter to `false`.


#### Mail

```yaml
mail:
  service: 'smtp.gmail.com'
  port: 587
  auth:
    account: 'gmailuser@gmail.com'
    password: 'blablabla'
```

The mail section allows changing the configuration of [Postfix](http://www.postfix.org/), the application that handles from which account should the emails be sent, and its primary purpose is to help [Monit](#monit) send email notifications. If you want to use a Gmail account as the email sender, you should simply replace your email address and password in the `account` and `password` parameters and, additionally, read the following links:

- https://support.google.com/a/answer/6260879?hl=en
- https://support.google.com/accounts/answer/185833 (If your account has 2-Step-Verification enabled)


#### Monit

```yaml
monit:
  refresh: 10
  port: 2812
  alerts:
    fs: '90% for 5 times within 15 cycles'
    system:
      load1: 6
      load5: 4
      mem: '98% for 10 cycles'
      cpu: '95% for 10 cycles'
      swap: '1%'
    services:
      sshd: true
      mosquitto: true
      nodered: true
      mail: true
      avahi: true
```

This section defines the configuration of [Monit](https://mmonit.com/monit/), the system monitoring tool preinstalled on IoMBian. The default values are valid for most systems, but the `alerts` parameters allow you to customize your configuration. The `refresh` parameters specifies how often the program checks the system 'health' and the `port` parameter defines on which port the program's web administration panel is. Monit always requires you to provide a username and password to access its web panel, and those are the ones used in the [User](#user) section. 


#### Avahi

```yaml
avahi:
  ifaces: wlan0
  publish: true
  browsedomains: []
  publishdns:
    - 8.8.8.8
```

The last section sets the configuration of the Avahi program, that allows discovering IoMBian devices in your local network with a tool called [IoMBian Discover](https://github.com/Tknika/iombian-discover). The most important configuration parameter is the so-called `ifaces`, which defines the network interface (eth0, eth1, wlan0,...) used to connect to the IT network.


## Credits

- @jriguera, for his work on [confinit](https://github.com/jriguera/confinit) and the example provided at [raspbian-cloud](https://github.com/jriguera/raspbian-cloud/tree/master/stage8/99-confinit/config).


## Author

(c) 2020 [Tknika](https://tknika.eus/) ([Aitor Iturrioz](https://github.com/bodiroga))

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.