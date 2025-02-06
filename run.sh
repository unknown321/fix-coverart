#!/bin/sh
log()
{
        oldIFS=$IFS
        IFS="
"
        for line in $(echo "${1}"); do
                echo "$(date) ${line}" >> $LOG_FILE
        done
        IFS=$oldIFS
}

install() {
  log "enabling progressive jpeg and interlaced png"
  busybox sed -i '/QT_JPEG_DISABLE_DECODE_PROGRESSIVE/d' ${INITRD_UNPACKED}/init.hagoromo.rc
  busybox sed -i '/QT_PNG_DISABLE_DECODE_INTERLACE/d' ${INITRD_UNPACKED}/init.hagoromo.rc
}

mount -t ext4 -o rw /emmc@android /system

install

sync
umount /system
