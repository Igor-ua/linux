**General Ubuntu configuration**

Running x32 apps on x64 Ubuntu:
```
sudo dpkg --add-architecture i386
# ? echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
```

Changing time zone in Ubuntu:
```
sudo dpkg-reconfigure tzdata
```

Updating Ubuntu to Ubuntu-Mate:
```
# trusty-mate = 14
# wily-mate = 15
# xenial-mate = 16

sudo apt-add-repository ppa:ubuntu-mate-dev/ppa
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate
sudo apt-add-repository ppa:ubuntu-mate-dev/xenial-mate
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop

https_proxy=https://username:password@192.168.1.1:3128/ apt-add-repository ppa:ubuntu-mate-dev/ppa
sudo add-apt-repository ppa:eugenesan/ppa
https_proxy=https://username:password@192.168.1.1:3128/ sudo add-apt-repository ppa:eugenesan/ppa
https_proxy=https://username:password@192.168.1.1:3128/ add-apt-repository ppa:eugenesan/ppa
```

Creating new service for Ubuntu:
```
1. Create the service file:
sudo nano /etc/system/d/system/winamp.service

2. Add service configuration inside winamp.service:
[Unit]
Description=Winamp player
[Service]
Type=simple
User=igor
ExecStart=/usr/bin/audacious -H -p
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target

3. Enable the service:
sudo systemctl daemon-reload
sudo systemctl enable winamp.service
sudo systemctl start winamp.serive

4. Check it's status:
sudo service winamp status
```

Fix unmet dependencies for Ubuntu:
```
sudo apt -f install
sudo dpkg --configure -a
sudo apt -f install
```