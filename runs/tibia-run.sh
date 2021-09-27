#!/bin/bash
# Manteiner: Felipe Facundes
# License: GPLv3
# Email: playongit@gmail.com
#  Telegram: @FeFacundes
#  Telegram Group: t.me/winehq_linux
rm -rf ~/.local/share/applications/*wine*
ps ax|egrep '*.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1 ; pkill -9 .exe
clear -T "$TERM"

WV=wine-tkg-staging-6.17.r13-x86_64
GN=minecraft
SN="Minecraft"
CME="Minecraft is a survival sandbox game."

#export MESA_GLSL_VERSION_OVERRIDE=440
#export MESA_GL_VERSION_OVERRIDE=4.4COMPAT

export KWIN_TRIPLE_BUFFER=1
export TRIPLE_BUFFER=1
export XVideoTextureSyncToVBlank=0
export MESA_NO_ERROR=1
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
#export __GL_DXVK_OPTIMIZATIONS=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$WINEPREFIX"
export MESA_GLSL_CACHE_DIR="$WINEPREFIX"
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_YIELD="NOTHING"
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0
export STEAM_RUNTIME_HEAVY=1

# Nvidia Hybrid Card
#export __NV_PRIME_RENDER_OFFLOAD=1
#export __GLX_VENDOR_LIBRARY_NAME=nvidia
#export __VK_LAYER_NV_optimus=NVIDIA_only

# AMD Radeon Graphics Card
#export RADV_PERFTEST=aco

export __GL_THREADED_OPTIMIZATIONS=1
export mesa_glthread=true
export PBA_DISABLE=0
glxinfo -B 2> /dev/null
glxgears -stereo > /dev/null 2>&1

# GAMEMODE: gamemoderun
#export LD_PRELOAD="$LD_PRELOAD:/usr/\$LIB/libgamemodeauto.so.0"

## Game dir and executable
EXE="./Tibia"
DIR="/home/$USER/.PlayOnGit/nativos/Tibia/"
cd "$DIR"
######## Zenity (Pseudo GUI) ########
Game_Actions=`zenity \
    --width=800 \
    --height=550 \
    --title='PlayOnGit Game Launcher and Settings' \
    --list --text 'What do you want to do?' \
    --radiolist --column 'Choice' \
    --column 'Action' \
    TRUE "Run ${SN}" \
    FALSE 'Kill all .jar processes' \
    FALSE 'Edit Script' \
    FALSE 'Open Game Directory' \
    FALSE 'Toggle Nvidia Hybrid Graphics | Use Nvidia for performance' \
    FALSE 'Set your favorite terminal' \
    FALSE 'Start your terminal' \
    FALSE "Remove ${SN}" \
    FALSE Credits`

if [ "$Game_Actions" = "Run ${SN}" ] ; then
    "$EXE"
fi
if [ "$Game_Actions" = "Kill all .jar processes" ] ; then
    ps ax|egrep '*.jar'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1 ; pkill -9 .jar
fi
if [ "$Game_Actions" = "Edit Script" ] ; then
    xdg-open ~/.PlayOnGit/scripts/run/"$GN"-run.sh
fi
if [ "$Game_Actions" = "Open Game Directory" ] ; then
    xdg-open "$DIR"
fi
if [ "$Game_Actions" = "Toggle Nvidia Hybrid Graphics | Use Nvidia for performance" ] ; then
    cd ~/.PlayOnGit/scripts/functions
    ./"$GN"-Toggle_Nvidia.sh
fi
if [ "$Game_Actions" = "Set your favorite terminal" ] ; then
    Set_Terminal=`zenity --entry --text \
    "Set your favorite terminal. Example: kitty, xterm, etc..." \
    --title "Set your favorite terminal"`
    touch ~/.PlayOnGit/scripts/run/TERM.conf
    echo "$Set_Terminal" > ~/.PlayOnGit/scripts/run/TERM.conf
    chmod +x  ~/.PlayOnGit/scripts/run/TERM.conf
fi
if [ "$Game_Actions" = "Start your terminal" ] ; then
    cd "$DIR"
    ~/.PlayOnGit/scripts/run/TERM.conf
fi
if [ "$Game_Actions" = "Remove ${SN}" ] ; then
    Del_Prefix=`zenity --width=750 --height=200 \
    --title="Remove ${SN}?" --list \
    --text "Remove ${SN}?" --radiolist \
    --column 'Choice' --column 'Action' TRUE No FALSE Yes`
   if [ "$Del_Prefix" = "Yes" ] ; then
    rm -f /home/"$USER"/.local/share/applications/"$GN".desktop
    rm -rf /home/"$USER"/.PlayOnGit/nativos/"$GN"/
    rm -f /home/"$USER"/.PlayOnGit/scripts/run/"$GN"-run.sh
    rm -f /home/"$USER"/.PlayOnGit/scripts/functions/"$GN"-Toggle_Nvidia.sh
   fi
fi
if [ "$Game_Actions" = "Credits" ] ; then
    zenity --width=240 --height=200 --info \
    --title="Credits" --text="Manteiner: Felipe Facundes Email: playongit@gmail.com License: GPLv3"
fi
exit 0
