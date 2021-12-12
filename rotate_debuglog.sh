#!/bin/bash

[[ -z "${POCKETDIR}" ]] && POCKETDIR="$HOME/.pocketcoin" || POCKETDIR="${POCKETDIR}"

if [ -f "$POCKETDIR/debug.log" ]
then
    mv "$POCKETDIR/debug.log" "$POCKETDIR/debug-$(date "+%Y-%m-%d_%H_%M_%S").log"
else
    echo "Debug log file not found: \"$POCKETDIR/debug.log\"."
fi
