#!/bin/bash

[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

echo "getstakereport"
pocketcoin-cli -conf="${POCKETCONF}" getstakereport

echo "getstakinginfo"
pocketcoin-cli -conf="${POCKETCONF}" getstakinginfo
