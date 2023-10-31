#!/bin/bash

source /etc/conf.d/dmcrypt-premount

is_mounted() {
    mountpoint -q $1
}


do_mount() {
    if is_mounted "$1"; then
        echo "$1 already mounted"
    else
        mount $1 || exit 1
    fi
}

for f in $TARGETS; do do_mount $f; done

