#!/bin/sh
. "$(dirname "$0")/daemon.sh" "$@"
printf "Hit enter to kill off the connection..."
read _
kill "$(cat "$(dirname "$0")/sshuttle.pid")"
sleep 5
print_host final
