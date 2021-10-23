#!/bin/bash
Toggle_GAMEMODE="$WINEPREFIX"/.Toggle_GAMEMODE.txt
if [ ! -e "$Toggle_GAMEMODE" ]; then
    touch "$Toggle_GAMEMODE"
    sed -i "/libgamemodeauto.so.0/s/^#//" "$Script_Run"
    notify-send "You need Feral GAMEMODE installed"
    notify-send "GAMEMODE" "Enabled"
else
    rm -f "$Toggle_GAMEMODE"
    sed -i "/libgamemodeauto.so.0/s/^/#/" "$Script_Run"
    notify-send "GAMEMODE" "Disabled"
fi
