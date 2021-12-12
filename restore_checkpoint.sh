#!/bin/bash

[[ -z "${POCKETDIR}" ]] && POCKETDIR="$HOME/.pocketcoin" || POCKETDIR="${POCKETDIR}"
CHECKPOINT_FILE="latest.tgz"

if [ -f "$POCKETDIR/$CHECKPOINT_FILE" ]
then
    read -p "Checkpoint file $POCKETDIR/$CHECKPOINT_FILE already exists, overwrite it? (y/n) " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Re-downloading checkpoint file..."
        rm "$POCKETDIR/$CHECKPOINT_FILE"
        wget --directory-prefix="$POCKETDIR" "https://3.pocketnet.app/checkpoint/$CHECKPOINT_FILE"
    else
        exit
    fi
else
    echo "Downloading checkpoint file..."
    wget --directory-prefix="$POCKETDIR" "https://3.pocketnet.app/checkpoint/$CHECKPOINT_FILE"
fi

if [ -f "$POCKETDIR/$CHECKPOINT_FILE" ]
then
    echo "Deleting existing blockchain data directories..."
    rm -r $POCKETDIR/blocks
    rm -r $POCKETDIR/chainstate
    rm -r $POCKETDIR/indexes
    rm -r $POCKETDIR/pocketdb
    rm -r $POCKETDIR/checkpoints

    echo "Restoring blockchain data from checkpoint..."
    tar -xzvf $POCKETDIR/$CHECKPOINT_FILE -C $POCKETDIR

    echo "Blockchain data restored from checkpoint. Start pocketnetd (probably in sync mode)."
else
    echo "Something went wrong, could not find the checkpoint file after trying to download it."
fi
