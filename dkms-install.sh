#!/bin/bash

DRV_DIR=$PWD
DRV_NAME=mt7601u-fix
DRV_VERSION=1.0.0

rm -rf /usr/src/${DRV_NAME}-${DRV_VERSION}
cp -r ${DRV_DIR} /usr/src/${DRV_NAME}-${DRV_VERSION}

dkms add -m ${DRV_NAME} -v ${DRV_VERSION}
dkms build -m ${DRV_NAME} -v ${DRV_VERSION}
dkms install -m ${DRV_NAME} -v ${DRV_VERSION}

