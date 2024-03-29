#!/bin/bash
# Manteiner: Felipe Facundes
# License: GPLv3
# 🖂 playongit@gmail.com
# 﨧 Telegram: @FeFacundes
# 﨧 Telegram Group: t.me/winehq_linux
######### No root #########
if [[ "$EUID" -ne 0 ]]; then
###########################
Wkill() {
    ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1; pkill -9 .exe
}
Wkill
rm -rf ~/.local/share/applications/*wine*
clear -T "$TERM"

export WV=wine-tkg-staging-6.19.r8-x86_64
export GN="Base_Name"
export SN="Base Game Name"
export CME="Base Comment"

## Base Variables
export TERM=xterm
export W=~/.PlayOnGit/wines/"$WV"
export WINE64="$W"/bin/wine64
export WINE="$W"/bin/wine
export WINEVERPATH="$W"
export WINEPATH="$W/bin:$WINEPATH"
export WINESERVER="$W"/bin/wineserver
export WINELOADER64="$W"/bin/wine64
export WINELOADER="$W"/bin/wine
export WINEDLLPATH32="$W"/lib32/wine/fakedlls
export WINEDLLPATH64="$W"/lib/wine/fakedlls
export WINEDLLPATH="$W"/lib/wine/fakedlls
export LD_LIBRARY32_PATH="$W/lib32:$LD_LIBRARY32_PATH"
export LD_LIBRARY64_PATH="$W/lib:$LD_LIBRARY64_PATH"
export LD_LIBRARY_PATH="$W/lib:$LD_LIBRARY_PATH"
export WINEDEBUG=-all,fps
export WINEPREFIX=~/.PlayOnGit/wineprefixes/"$GN"
export WINEARCH=win64
export WINEESYNC=1
export Wtricks=~/.PlayOnGit/scripts/winetricks

## Game dir and executable
EXE0="GalaxyClient.exe"
DIR0="$WINEPREFIX/drive_c/Program Files (x86)/GOG Galaxy"
EXE1="Free any_file.exe"
DIR1="Free Directory"
## Executable Parameters
Pr1="-SkipBuildPatchPrereq"
Pr2="-opengl"
Pr3="-gl"
Pr4="-dx9"
Pr5="-dx10"
Pr6="-dx11"
Pr7="-force-d3d11"
Pr8="-d3d11legacy"
Pr9="-d311"
Pr10="-d3d12"
Pr11="-vulkan"

## All Performance Variables

#export MESA_GLSL_VERSION_OVERRIDE=440
#export MESA_GL_VERSION_OVERRIDE=4.4COMPAT
export DXVK_SPIRV_OPT=ON
export DXVK_SHADER_OPTIMIZE=1
export DXVK_DEBUG_LAYERS=0
export DXVK_SHADER_DUMP_PATH="/tmp"
export DXVK_STATE_CACHE_PATH="$WINEPREFIX"
export DXVK_SHADER_READ_PATH="$WINEPREFIX"
export DXVK_CONFIG_FILE="$WINEPREFIX"/dxvk.conf
export DXVK_LOG_LEVEL=none
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
export WINE_LARGE_ADDRESS_AWARE=1
export STAGING_SHARED_MEMORY=1
#export STAGING_WRITECOPY=1
export DXVK_HUD=fps
export DXVK_ASYNC=1
glxinfo -B 2> /dev/null
glxgears -stereo > /dev/null 2>&1

# GAMEMODE: gamemoderun
#export LD_PRELOAD="$LD_PRELOAD:/usr/\$LIB/libgamemodeauto.so.0"

######## Zenity (Pseudo GUI) ########
export Script_Run=~/.PlayOnGit/scripts/run/"$GN"-run.sh
Get() {
    wget --no-check-certificate --server-response -nc "$@"
}
Get_Parse() {
    perl -p -e '$| = 1; s/^.* +([0-9]+%) +([0-9,.]+[GMKB]) +([0-9hms,.]+).*$/\1\n# Wait! Downloading the wine... \2 (\3)/'
}
Zenity_Progress() {
    zenity \
    --title="PlayOnGit Wine Download" \
    --text="<b>Wait!</b> Downloading the wine..." \
    --progress \
    --auto-close \
    --auto-kill
}
FPS_Xosd() {
    tee /dev/stderr | sed -u -n -e \
    '/trace/ s/.*approx //p' | osd_cat --lines=1 \
    --color=yellow --outline=1 --pos=top --align=left
}
Test_Mirror() {
    Mirrors=(master.dl.sourceforge.net razaoinfo.dl.sourceforge.net ufpr.dl.sourceforge.net)
    Test_Mirror0=`LANG=C ping -c 2 "${Mirrors[0]}" | awk '{ print $8 }' | grep -v 'loss,' | grep -v -e '^[[:space:]]*$' | cut -c 6-8 | cut -d'.' -f 1 | tail -n 1`
    Test_Mirror1=`LANG=C ping -c 2 "${Mirrors[1]}" | awk '{ print $8 }' | grep -v 'loss,' | grep -v -e '^[[:space:]]*$' | cut -c 6-8 | cut -d'.' -f 1 | tail -n 1`
        if [ "$Test_Mirror0" -lt "$Test_Mirror1" ]; then
            export Mirror="https://${Mirrors[0]}"
        else
            export Mirror="https://${Mirrors[1]}"
        fi
    echo "$Test_Mirror0=${Mirrors[0]} x $Test_Mirror1=${Mirrors[1]}"
    echo "Winner: $Mirror"
}
Choose_Wine() {
    bash <(curl -s https://raw.githubusercontent.com/felipefacundes/PS/master/other_scripts/wine_list.sh)
        NWV=`cat ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt`
        if ls ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt > /dev/null 2>&1 ; then
            cd ~/.PlayOnGit/wines/
            Get https://raw.githubusercontent.com/felipefacundes/PS/master/Wines_md5sum/"$NWV".tar.zst.md5sum
            wine_integrity_check=`md5sum "$NWV".tar.zst | awk '{ print $1 }'`
            wine_integrity_file=`cat "$NWV".tar.zst.md5sum`
                if [ "$wine_integrity_check" = "$wine_integrity_file" ]; then
                    echo 'Wine checked!'
                    notify-send 'Wine' 'Checked!'
                else
                    rm -rf "$NWV"
                    rm -f "$NWV".tar.zst
                    Test_Mirror
                    Get "$Mirror"/project/wine-bins/"$NWV".tar.zst 2>&1 | Get_Parse | Zenity_Progress
                    tar -xf "$NWV".tar.zst 2>&1 | zenity \
                    --progress --pulsate --auto-close --title='Extracting Wine!' --text='Extracting Wine!'
                fi
            sed -i "17s/$WV/$NWV/" "$Script_Run"
            rm -f ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
            AWV=`cat "$Script_Run" | head -n 17 | grep -i WV= | cut -c 11-99`
            zenity --info --ellipsize --title='Success!' --text "<b>Now the new version of Wine is:</b>\n\n$AWV\n\nfor $SN"
        fi
}
Change_EXE0_DIR0(){
    Read_EXE0=`cat "$Script_Run" | head -n 45 | grep 'EXE0=' | cut -c 6-599`
    Read_DIR0=`cat "$Script_Run" | head -n 46 | grep 'DIR0=' | cut -c 6-599`
        zenity --info --ellipsize --title='Default DIR' --text "<b>Default directory where the executable is located:</b>\n\n$AWV\n\nfor $SN"
        Change_DIR0=`zenity --file-selection --directory --filename="$WINEPREFIX/drive_c/" \
            --text "Default directory where the executable is located" --title "Default directory where the executable is located"`
            sed -i "46s|${Read_DIR0}|\'${Change_DIR0}\'|" "${Script_Run}"
        zenity --info --ellipsize --title='Default executable!' --text "<b>Change the default executable:</b>\n\n$AWV\n\nfor $SN"
        Change_EXE0=`zenity --file-selection --filename="$WINEPREFIX/drive_c/" \
            --text "Change the default executable" --title "Change the default executable"`
            sed -i "45s/${Read_EXE0}/\'${Change_EXE0##*/}\'/" "${Script_Run}"
}
Rerun_Info() {
    zenity --ellipsize --info --text "<b>Rerun the script</b> (close and open again)."
}
Game_Actions=`zenity \
    --width=800 \
    --height=690 \
    --title='PlayOnGit Game Launcher and Settings' \
    --list --text "(PlayOnGit) ${SN} Menu. What do you want to do?" \
    --radiolist --column 'Choice' \
    --column 'Action' \
    TRUE "Run ${SN}" \
    FALSE 'WineConfig' \
    FALSE 'Winetricks' \
    FALSE 'Open an executable (.exe or .msi)' \
    FALSE 'WineFile (Wine File Manager)' \
    FALSE 'Explorer++ (File Manager)' \
    FALSE 'Wine Uninstaller' \
    FALSE 'Wine Regedit' \
    FALSE 'Wineconsole (Wine CMD)' \
    FALSE 'Choose another version of Wine!' \
    FALSE 'Toggle DXVK (Disable/Enable)' \
    FALSE 'Kill all wine processes!' \
    FALSE 'Edit Script!' \
    FALSE 'Edit dxvk.conf!' \
    FALSE 'Open Game Directory!' \
    FALSE 'Toggle Nvidia Hybrid Graphics! | Use Nvidia for performance!' \
    FALSE 'Set your favorite terminal!' \
    FALSE 'Start your terminal!' \
    FALSE 'Change the default execution path of executable (.exe or .lnk)!' \
    FALSE 'Create your customized script, to run your game or other app!' \
    FALSE "Remove All Wineprefix ${SN}" \
    FALSE 'Credits:'`

if [ "$Game_Actions" = "Run ${SN}" ]; then
    cd "$DIR0"
    "$W"/bin/wine "$EXE0" \
    2>&1 | FPS_Xosd
fi
if [ "$Game_Actions" = 'WineConfig' ]; then
    "$W"/bin/winecfg
    exec "$0"
fi
if [ "$Game_Actions" = 'Winetricks' ]; then
    "$Wtricks"
    exec "$0"
fi
if [ "$Game_Actions" = 'Open an executable (.exe or .msi)' ]; then
    Open_EXE=`zenity --file-selection --filename="$WINEPREFIX/drive_c/" \
    --text "Custom Wine executable (.exe)" --title "Open executable (.exe)"`
    "$W"/bin/wine "\"${Open_EXE}\""
    exec "$0"
fi
if [ "$Game_Actions" = 'WineFile (Wine File Manager)' ]; then
    cd "$WINEPREFIX/drive_c/"
    "$W"/bin/winefile
    exec "$0"
fi
if [ "$Game_Actions" = 'Explorer++ (File Manager)' ]; then
    "$W"/bin/wine Explorerpp
    exec "$0"
fi
if [ "$Game_Actions" = 'Wine Uninstaller' ]; then
    "$W"/bin/wine uninstaller
    exec "$0"
fi
if [ "$Game_Actions" = 'Wine Regedit' ]; then
    "$W"/bin/wine regedit
    exec "$0"
fi
if [ "$Game_Actions" = 'Wineconsole (Wine CMD)' ]; then
    cd "$WINEPREFIX"/drive_c/
    "$W"/bin/wineconsole
    exec "$0"
fi
if [ "$Game_Actions" = 'Choose another version of Wine!' ]; then
    rm -f ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    Choose_Wine
    Rerun_Info
    exec "$0"
fi
if [ "$Game_Actions" = 'Toggle DXVK (Disable/Enable)' ]; then
    toggle_dxvk_check="$WINEPREFIX"/.toggle-dxvk-check.txt
        if [ ! -e "$toggle_dxvk_check" ]; then
            touch "$toggle_dxvk_check"
            echo "DXVK Disable" > "$toggle_dxvk_check"
            "$Wtricks" d3d9=default d3d10=default d3d10_1=default d3d10core=default d3d11=default dxgi=default 2>&1 | zenity \
            --progress --pulsate --auto-close --title='Disabling DXVK. Wait! Processing...' --text="<b>Disabling DXVK.</b>\n\n Wait! Processing..."
            zenity --info --ellipsize --title="Toggle DXVK" --text "DXVK <b>Disabled</b>"
        else
            rm "$toggle_dxvk_check"
            "$Wtricks" d3d9=native d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native 2>&1 | zenity \
            --progress --pulsate --auto-close --title='Enabling DXVK. Wait! Processing...' --text="<b>Enabling DXVK.</b>\n\n Wait! Processing..."
            zenity --info --ellipsize --title="Toggle DXVK" --text "DXVK <b>Enabled</b>"
        fi
    Rerun_Info
    source "$Script_Run"
fi
if [ "$Game_Actions" = 'Kill all wine processes!' ]; then
    Wkill
    exec "$0"
fi
if [ "$Game_Actions" = 'Edit Script!' ]; then
    xdg-open "$Script_Run"
    Rerun_Info
    exec "$0"
fi
if [ "$Game_Actions" = 'Edit dxvk.conf!' ]; then
    xdg-open "$WINEPREFIX"/dxvk.conf
    Rerun_Info
    exec "$0"
fi
if [ "$Game_Actions" = 'Open Game Directory!' ]; then
    xdg-open "$WINEPREFIX"/drive_c
    exec "$0"
fi
if [ "$Game_Actions" = 'Toggle Nvidia Hybrid Graphics! | Use Nvidia for performance!' ]; then
    ~/.PlayOnGit/scripts/functions/"$GN"-Toggle_Nvidia.sh
    Rerun_Info
    source "$Script_Run"
fi
if [ "$Game_Actions" = 'Set your favorite terminal!' ]; then
    Set_Terminal=`zenity --entry --text \
    "Set your favorite terminal. Example: kitty, xterm, etc..." \
    --title "Set your favorite terminal"`
    touch ~/.PlayOnGit/scripts/run/TERM.conf
    echo "$Set_Terminal" > ~/.PlayOnGit/scripts/run/TERM.conf
    chmod +x  ~/.PlayOnGit/scripts/run/TERM.conf
    exec "$0"
fi
if [ "$Game_Actions" = 'Start your terminal!' ]; then
    cd "$WINEPREFIX"/drive_c/
    shopt -s expand_aliases
    alias winetricks=~/.PlayOnGit/scripts/winetricks
    ~/.PlayOnGit/scripts/run/TERM.conf
    exec "$0"
fi
if [ "$Game_Actions" = 'Change the default execution path of executable (.exe or .lnk)!' ]; then
    Change_EXE0_DIR0
    exec "$0"
fi
if [ "$Game_Actions" = 'Create your customized script, to run your game or other app!' ]; then
    ~/.PlayOnGit/scripts/functions/create_your_installation_script.sh
    exec "$0"
fi
if [ "$Game_Actions" = "Remove All Wineprefix ${SN}" ]; then
    Del_Prefix=`zenity --width=750 --height=200 \
    --title="Remove All Wineprefix ${SN}?" --list \
    --text "Remove All Wineprefix ${SN}?" --radiolist \
    --column 'Choice' --column 'Action' TRUE No FALSE Yes`
        if [ "$Del_Prefix" = "Yes" ]; then
            rm -f /home/"$USER"/.local/share/applications/"$GN".desktop
            rm -rf /home/"$USER"/.PlayOnGit/wineprefixes/"$GN"/
            rm -f /home/"$USER"/.PlayOnGit/scripts/run/"$GN"-run.sh
            rm -f /home/"$USER"/.PlayOnGit/scripts/functions/"$GN"-Toggle_Nvidia.sh
        fi
    exec "$0"
fi
if [ "$Game_Actions" = 'Credits:' ]; then
    zenity --info --ellipsize --title="Credits" \
    --text="Manteiner: Felipe Facundes\nEmail: playongit@gmail.com\nLicense: GPLv3"
    exec "$0"
fi
exit 0
###################################################################
# Finish
else
    tput bold
    tput setaf 3
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━ English: ━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Oh no! You are running me as root! Do not do this!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    tput bold
    tput setaf 1
    echo "This script cannot be run as root. Please rerun as normal user!"
    tput bold
    tput setaf 3
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo
    tput bold
    tput setaf 3
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ Portuguese: ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Oh não! Você executou este script como root! Não faça isso!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    tput bold
    tput setaf 1
    echo "Este script não pode ser executado como root. Por favor! O execute como um simples usuário normal! Ok?"
    tput bold
    tput setaf 3
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
