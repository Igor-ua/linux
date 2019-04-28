**Basic samba service configuration for creating exchange folder inside your network**

Installing the service:
```
sudo apt install samba
```

Editing configuration file:
```
sudo nano /etc/samba/smb.conf

workgroup = WORKGROUP
server string = Samba Server
netbios name = srv1
security = user
map to guest = bad user
name resolve order = bcast host
dns proxy = no

Creating the folder with name "myshare":
[myshare]
path = /home/igor/samba
writeable = yes
browseable = yes
public = yes
create mask = 0644
directory mask = 0755
force user = igor
```

Restarting the service to apply the changes:
```
sudo service smbd restart
```