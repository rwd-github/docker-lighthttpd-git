#!/bin/sh

logs()
{
	sleep 3
	tail -f /var/log/lighttpd/access.log &
	tail -f /var/log/lighttpd/error.log > /dev/stderr &
}

logs &

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
