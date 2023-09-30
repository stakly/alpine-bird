#!/bin/sh

echo "Starting BIRD"
/usr/sbin/bird -f -c ${CFG_DIR}/bird.conf
