#!/bin/bash
STAGING_WRITECOPY="$WINEPREFIX"/.STAGING_WRITECOPY.txt
if [ ! -e "$STAGING_WRITECOPY" ]; then
    sed -i "/export STAGING_WRITECOPY=1/s/^#//" "$Script_Run"
    notify-send "STAGING_WRITECOPY" "Enabled"
else
    sed -i "/export STAGING_WRITECOPY=1/s/^/#/" "$Script_Run"
    notify-send "STAGING_WRITECOPY" "Disabled"
fi
