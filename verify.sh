#!/bin/sh
if [ -z $1 ]; then
	echo "Usage: ${0} core-geth-alltools-linux-vx.u.z.zip"
	exit 1
fi
sha256sum -c $1.sha256 2> /dev/null | grep $1
