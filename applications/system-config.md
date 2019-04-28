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

Creating a service that takes a parameter:
```
If Type=simple in your unit file, you can only specify one ExecStart, but you can add as many ExecStartPre,ExecStartPost`,
but none of this is suited for long running commands, because they are executed serially and everything one start is killed before starting the next one.

If Type=oneshot you can specify multiple ExecStart, they run serially not in parallel.

If what you want is to run multiple units in parallel, there a few things you can do:

If they differ on 1 param
You can use template units, so you create a /etc/systemd/system/foo@.service. NOTE: (the @ is important).

[Unit]
Description=script description %I

[Service]
Type=simple
ExecStart=/script.py %i
Restart=on-failure

[Install]
WantedBy=multi-user.target

And then you exec:
systemctl start foo@parameter1.service foo@parameter2.service
```

Cleaning old kernels:
```
1. Find out current kernel version by uname-a

2. Delete any old kernels:
dpkg --list | grep linux-image

rc  linux-image-4.10.0-42-generic         4.10.0-42.46   amd64   Linux kernel image for version 4.10.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-37-generic         4.13.0-37.42   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-38-generic         4.13.0-38.43   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-39-generic         4.13.0-39.44   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-41-generic         4.13.0-41.46   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-42-generic         4.13.0-42.47   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-43-generic         4.13.0-43.48   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-45-generic         4.13.0-45.50   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.13.0-46-generic         4.13.0-46.51   amd64   Linux kernel image for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-4.15.0-39-generic         4.15.0-39.42   amd64   Signed kernel image generic
rc  linux-image-4.15.0-42-generic         4.15.0-42.45   amd64   Signed kernel image generic
rc  linux-image-4.15.0-43-generic         4.15.0-43.46   amd64   Signed kernel image generic
rc  linux-image-4.15.0-44-generic         4.15.0-44.47   amd64   Signed kernel image generic
rc  linux-image-4.15.0-45-generic         4.15.0-45.48   amd64   Signed kernel image generic
ii  linux-image-4.15.0-46-generic         4.15.0-46.49   amd64   Signed kernel image generic
ii  linux-image-4.15.0-47-generic         4.15.0-47.50   amd64   Signed kernel image generic
rc  linux-image-extra-4.13.0-38-generic   4.13.0-38.43   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-39-generic   4.13.0-39.44   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-41-generic   4.13.0-41.46   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-42-generic   4.13.0-42.47   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-43-generic   4.13.0-43.48   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-45-generic   4.13.0-45.50   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
rc  linux-image-extra-4.13.0-46-generic   4.13.0-46.51   amd64   Linux kernel extra modules for version 4.13.0 on 64 bit x86 SMP
ii  linux-image-generic                   4.15.0.47.49   amd64   Generic Linux kernel image

3. Example:
sudo apt-get purge linux-image-4.4.0-112-generic
sudo rm -rf /boot/*-4.4.0-{112,116,119,121,124,127,128,93}-*
```