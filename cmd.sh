#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

pocketcoin-cli -conf="${POCKETCONF}" $1

