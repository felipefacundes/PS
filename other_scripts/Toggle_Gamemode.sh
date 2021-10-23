#!/bin/bash
Toggle_GAMEMODE="$WINEPREFIX"/.Toggle_GAMEMODE.txt
if [ ! -e "$Toggle_GAMEMODE" ]; then
    sed -i "/libgamemodeauto.so.0/s/^#//" "$Script_Run"
    notify-send "You need Feral GAMEMODE installed"
    notify-send "GAMEMODE" "Enabled"
else
    sed -i "/libgamemodeauto.so.0/s/^/#/" "$Script_Run"
    notify-send "GAMEMODE" "Disabled"
fi
