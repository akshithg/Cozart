#!/bin/bash
itr=10
reqcnt=100000

source benchmark-scripts/general-helper.sh
mark_start;
mount_procfs;
enable_network;
randomd
rm -rf /var/run/apache2
/sbin/ifconfig lo 127.0.0.1 netmask 255.0.0.0 up
apache2ctl start
sleep 3;
for i in `seq $itr`; do
    ab -n $reqcnt -c 100 127.0.0.1:80/index.html;
done
apache2ctl stop;
write_modules
mark_end;
