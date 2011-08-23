#!/bin/sh
remote="$1"

[ -z "$remote" ] && echo "ERROR: provide remote ssh details" && exit 1
set -eu
shift

print_host()
{
        title="$1"
        printf "Hostname $title: %s\n" $(curl -q -s --noproxy '*' http://ifconfig.me/host)
}

print_host before
$(dirname "$0")/sshuttle -x 10.0.0.0/8 -x 192.168.0.0/16 -r "$remote" -D "$@" 0/0
sleep 5
print_host after
