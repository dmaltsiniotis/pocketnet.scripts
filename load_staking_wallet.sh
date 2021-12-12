#!/bin/bash
WALLET=$1
[[ -z "${POCKETCONF}" ]] && POCKETCONF="$HOME/.pocketcoin/pocketcoin.conf" || POCKETCONF="${POCKETCONF}"

if [ -z $WALLET ]
then
    echo "No argument supplied. Must provide the exact name of wallet to load."
else
    pocketcoin-cli -conf="${POCKETCONF}" listwallets
    pocketcoin-cli -conf="${POCKETCONF}" loadwallet "$1"
    pocketcoin-cli -conf="${POCKETCONF}" unloadwallet ""
    pocketcoin-cli -conf="${POCKETCONF}" listwallets
    pocketcoin-cli -conf="${POCKETCONF}" getwalletinfo
fi
