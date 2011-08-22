#!/bin/sh
remote="$1"

[ -z "$remote" ] && echo "ERROR: provide remote ssh details" && exit 1
set -eu
shift

$(dirname "$0")/sshuttle -x 10.0.0.0/8 -x 192.168.0.0/16 -r "$remote" -D "$@" 0/0
