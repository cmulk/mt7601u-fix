#!/bin/sh

NEWNAME=mt7601u-fix.ko

echo "Building module..."
make -C /lib/modules/$(uname -r)/build/ M=$PWD modules

echo "Renaming module to $NEWNAME"
mv mt7601u.ko $NEWNAME