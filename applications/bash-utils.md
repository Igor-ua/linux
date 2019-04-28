**Ubuntu command-line utils**

Set chmod for all folder (without files) - folders need flag 7 to let user enter it

`chmod -R u+rwX,go+rX,go-w ./*`

Set chmore recursively for all bins:

`chmod -R 660 ./*.bin`

Chmod settings:
```
chmod 400 file - Read by owner
chmod 040 file - Read by group
chmod 004 file - Read by world

chmod 200 file - Write by owner
chmod 020 file - Write by group
chmod 002 file - Write by world

chmod 100 file - execute by owner
chmod 010 file - execute by group
chmod 001 file - execute by world
```

Recursively FIND all files in the current folder and it's subfolders that contain a text:

`grep -Ril "text_to_find" .*`

Grep: print filename and the string that was found:

`grep -Er "text_to_find"`

Get dir/disc size:
```
sudo apt-get install ncdu
ncdu
du -shx * | sort -rh | head -10
```

Compress a folder into tar.gz:

`tar -zcvf archive.tar.gz /home/name/folder/`

Print with prettified output:

`whereis python | tr " " "\n"`

