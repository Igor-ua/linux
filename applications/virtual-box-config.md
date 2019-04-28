**VirtualBox configuration**

Running VBoxLinuxAdditions:
```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install dkms
sudo sh ./VBoxLinuxAdditions.run
```

Add user to a vboxsf group to be able to open /media/sf_folder_name
```
sudo usermod -G vboxsf -a myusername
sudo reboot
```

Changing resolution in the terminal in VirtualBox:
```
sudo nano /etc/default/grub

GRUB_GFXMODE=1024x768
GRUB_GFXPAYLOAD_LINUX=keep

sudo update-grub
sudo reboot
```