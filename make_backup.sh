#!/bin/bash

LOCSHA1=`./magiskboot sha1 boot.img`
mkdir magisk_backup_${LOCSHA1}
cp boot.img magisk_backup_${LOCSHA1}/boot.img
gzip -9f magisk_backup_${LOCSHA1}/boot.img
zip backup.zip magisk_backup_${LOCSHA1}/*