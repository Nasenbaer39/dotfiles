#!/bin/bash

# Check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

# source variables
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh

# Check for updates
aur=`yay -Qua | wc -l`
ofc=`checkupdates | wc -l`

# Calculate total available updates
upd=$(( ofc + aur ))

# Show tooltip
if [ $upd -eq 0 ] ; then
    echo "{\"text\":\"$upd\", \"tooltip\":\" Packages are up to date\"}"
else
    echo "{\"text\":\"$upd\", \"tooltip\":\"󱓽 Official $ofc\n󱓾 AUR $aur\"}"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    kitty --title systemupdate sh -c "yay -Syu"
fi
