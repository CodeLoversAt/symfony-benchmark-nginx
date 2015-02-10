#!/bin/bash

set -e

sleep 1

# Make sure nginx forwards to hhvm on tcp port, not unix socket
sed -i "s@  fastcgi_pass 127.0.0.1:9000;@  fastcgi_pass ${HHVM_PORT_9000_TCP_ADDR}:${HHVM_PORT_9000_TCP_PORT};@" /etc/nginx/hhvm.conf

echo "fastcgi_read_timeout $FASTCGI_READ_TIMEOUT;" > /etc/nginx/conf.d/fastcgi_read_timeout.conf

exec /usr/sbin/nginx
