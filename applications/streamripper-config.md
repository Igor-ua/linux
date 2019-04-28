/etc/init/streamripper.conf
```
#!upstart
description "Bassdrive Ripper"

# streamripper.conf
start on filesystem
exec streamripper http://shouthost.com.19.streams.bassdrive.com:8200 -d /home/igor/Mount/NTFS-1TB/Winamp\ Rip/ -t

# Restart the process if it dies with a signal
# or exit code not given by the 'normal exit' stanza.
respawn

# Give up if restart occurs 100 times in 60s*60m*24h seconds.
respawn limit 100 86400
```