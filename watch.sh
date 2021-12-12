#!/bin/bash

[[ -z "${POCKETDIR}" ]] && POCKETDIR="$HOME/.pocketcoin" || POCKETDIR="${POCKETDIR}"

WATCH_CMD="tail -n 30 \"${POCKETDIR}/debug.log\""
watch -n1 $WATCH_CMD