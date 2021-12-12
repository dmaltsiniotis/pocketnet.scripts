#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

pocketcoind -conf="${POCKETCONF}" -daemon
