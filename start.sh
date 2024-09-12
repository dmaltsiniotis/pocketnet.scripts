#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

echo "Using configuration file: $POCKETCONF"

SCRIPT_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
ROTATE_PATH="$SCRIPT_PATH/rotate_debuglog.sh"

source $ROTATE_PATH

#pocketcoind -conf="${POCKETCONF}" -daemon
