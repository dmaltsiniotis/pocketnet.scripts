#!/bin/bash

POCKETVERSION=$1
POCKETPROCESS="pocketcoind"
POCKETPID=$(pgrep $POCKETPROCESS)

if [ -z $POCKETVERSION ]
then
    echo "No argument supplied. Must provide the exact version of pocketnet to download such as: \"0.19.16\""
else
    echo "Upgrading ${POCKETPROCESS} to version ${POCKETVERSION}"

    # Upgrade pocketnetd
    cd "$HOME"

    POCKETNETD_FILENAME="pocketnetcore_${POCKETVERSION}_linux_x64_setup.deb"
    if [ -f "$HOME/${POCKETNETD_FILENAME}" ]
    then
        echo "${POCKETPROCESS} version ${POCKETVERSION} is already downloaded."
    else
        echo "Downloading new version of ${POCKETPROCESS}: ${POCKETNETD_FILENAME}"
        wget "https://github.com/pocketnetteam/pocketnet.core/releases/download/v${POCKETVERSION}/${POCKETNETD_FILENAME}"
    fi

    if [ -f "$HOME/${POCKETNETD_FILENAME}" ]
    then
        echo "Installing/upgrading new version: ${POCKETNETD_FILENAME}"
        sudo dpkg -i ${POCKETNETD_FILENAME}
        echo "Done installing/upgrading ${POCKETPROCESS}. Restarting the process is recommend."
    fi
fi
