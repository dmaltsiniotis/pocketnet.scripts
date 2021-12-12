#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

pocketcoind -conf="${POCKETCONF}" -daemon -listen=0 -blocksonly=1 -disablewallet=1
