#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

# The 'd' is specifically omited here because the process name changes when the shutdown command is issued from pocketcoind to pocketcoin-shut
# This script will definetely fail if the user name it's running as also happens to be 'pocketcoin', or there's another command running wtih 'pocketcoin' in the process name.
PROCESSNAME="pocketcoin"
WAITTRIES=1

echo "Issuing 'stop' command via pocketcoin-cli...";
STOP_RESULT=$(pocketcoin-cli -conf="${POCKETCONF}" stop 2>&1)

if [[ "$STOP_RESULT" == *"error"* ]]; then
    echo "There was an error issuing the STOP command via pocketcoin-cli:"
    echo $STOP_RESULT
    exit 1
else
    PID=$(pgrep $PROCESSNAME)
    while ! [ -z $PID ] && [ $PID -gt 0 ]
    do
        echo "Waiting for PID ${PID} to exit..."
        WAITTRIES=$(( $WAITTRIES + 1 ))

        if [ $WAITTRIES -gt 60 ]
        then
            echo "Aborting. It should not have taken this long (2 minutes) for the process exit, please investigate."
            exit 1
        fi
        sleep 2
        PID=$(pgrep $PROCESSNAME)
    done
    echo "Done, process should be exited now."
fi
