# Ralink mt7601u wifi fix

This repo includes a patched kernel module to fix ralink mt7601u wifi dongles that don't initialize when plugged in.

The credit for the fix goes to the post [here](https://github.com/kuba-moo/mt7601u/issues/64#issuecomment-352250127).

And the credit for the idea to set up dkms for install goes to https://github.com/brektrou/rtl8821CU

The original driver comes from the Linux 5.10 and the patch applied for the fix can be viewed at commit [fef9d](https://github.com/cmulk/mt7601u-fix/commit/fef9d2d3253aea351fdbb1f8faff9a01d5ebdea9)

## Install

Requires `dkms`

Disable the built-in kernel module
```
echo "blacklist mt7601u" > /etc/modprobe.d/mt7601u.conf
```
Reboot

Install with dkms
```
sudo ./dkms-install.sh
modprobe mt7601u-fix
```

Enable the new module to start on boot
```
echo "mt7601u-fix" >> /etc/modules-load.d/modules.conf
```


## Go back to normal
```
rm /etc/modprobe.d/mt7601u.conf

sudo ./dkms-remove.sh
```
And remove the `mt7601u-fix` line from `/etc/modules-load.d/modules.conf`
