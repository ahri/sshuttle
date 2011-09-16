#!/bin/bash
pidfile="$(dirname "$0")/sshuttle.pid"
. "$(dirname "$0")/daemon.sh" "$@"
printf "Hit enter to kill off the connection..."
while [[ -f $pidfile ]]; do
    read -t 1 && kill "$(cat "$pidfile")" && break
done
echo
sleep 5
print_host final
