#!/bin/bash
[[ -z "${POCKETDIR}" ]] && POCKETDIR="$HOME/.pocketcoin" || POCKETDIR="${POCKETDIR}"
CHECKPOINT_FILE="pocketnet.checkpoint.$(date "+%Y-%m-%d_%H_%M_%S").tar.xz"

if [ -f "$POCKETDIR/$CHECKPOINT_FILE" ]
then
    read -p "Checkpoint file $POCKETDIR/$CHECKPOINT_FILE already exists, overwrite it? (y/n) " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit
    fi
    rm $POCKETDIR/$CHECKPOINT_FILE
fi

echo "Creating checkpoint from existing blockchain data directories..."

tar -cvf $POCKETDIR/$CHECKPOINT_FILE --use-compress-program='xz -6T0' -C $POCKETDIR blocks chainstate indexes pocketdb checkpoints

echo "Checkpoint backup created."
