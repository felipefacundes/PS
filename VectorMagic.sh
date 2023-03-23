#!/bin/bash
# PlayOnGit - Launch your Games directly from the start menu.
# License: GPLv3
# Manteiner: Felipe Facundes
# 🖂 playongit@gmail.com
# 﨧 Telegram: @FeFacundes
# 﨧 Telegram Group: https://t.me/winehq_linux
########### This script will use custom wine. But, you can use a wine in the version and location of your choice.
########### Este script irá usar o wine personalizado. Mas, você poderá usar um wine na versão e local de sua escolha
######### Not root #########
if [[ "$EUID" -ne 0 ]]; then
############################
Wkill() {
      ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1; pkill -9 .exe
}
Wkill
clear -T "$TERM"
rm -rf ~/.local/share/applications/*wine*
whiptail --msgbox "Installation may take some time depending on the GAME. Above all, please: PATIENCE. WAIT! You will be notified when installation is complete." 10 30
whiptail --msgbox "A instalação poderá demorar dependendo do JOGO. Acima de tudo tenha: PACIÊNCIA. AGUARDE! Você será notificado, quando a instalação concluir." 10 30

export WV=wine-staging-8.0-1-x86_64
export GN="VectorMagic"
export SN="Vector Magic"
export CME="Convert images for vectors"

mkdir -p ~/.local/share/applications/
mkdir -p ~/.PlayOnGit/wines/
mkdir -p ~/.PlayOnGit/icons/
mkdir -p ~/.PlayOnGit/libraries/dxvk/
mkdir -p ~/.PlayOnGit/scripts/run/
mkdir -p ~/.PlayOnGit/scripts/functions/
mkdir -p ~/.PlayOnGit/setups/
mkdir -p ~/.PlayOnGit/wineprefixes/
cd ~/.PlayOnGit/wineprefixes/
rm -rf "$GN"

Get() {
    wget --no-check-certificate --server-response -nc "$@"
}
Test_Mirror_Sourceforge() {
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
Check_Wine_and_Get() {
    cd ~/.PlayOnGit/wines/
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/Wines_md5sum/"$WV".tar.zst.md5sum
    wine_integrity_check=`md5sum "$WV".tar.zst | awk '{ print $1 }'`
    wine_integrity_file=`cat "$WV".tar.zst.md5sum`
        if [ "$wine_integrity_check" = "$wine_integrity_file" ]; then
            notify-send 'Wine' 'Checked!'
            echo 'Wine checked!'
        else
            rm -f "$WV".tar.zst
            Test_Mirror_Sourceforge
            Get "$Mirror"/project/wine-bins/"$WV".tar.zst
        fi
}

cd ~/.PlayOnGit/scripts/run/
rm -f "$GN"-run.sh
Get https://raw.githubusercontent.com/felipefacundes/PS/master/runs/"$GN"-run.sh > /dev/null 2>&1
chmod +x "$GN"-run.sh
cd ~/.PlayOnGit/icons/
Get https://raw.githubusercontent.com/felipefacundes/PS/master/icons/"$GN".png > /dev/null 2>&1
cd ~/.PlayOnGit/scripts/
rm -f winetricks
Get https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks > /dev/null 2>&1
chmod +x winetricks
cd ~/.PlayOnGit/scripts/functions/
rm -f create_your_installation_script.sh
Get https://raw.githubusercontent.com/felipefacundes/PS/master/other_scripts/create_your_installation_script.sh > /dev/null 2>&1
chmod +x create_your_installation_script.sh

Check_Wine_and_Get
cd ~/.PlayOnGit/wines/
rm -rf "$WV"
# Server 01
# Get https://www.opencode.net/felipefacundes/wine-bins/raw/master/"$WV".tar.zst
# Server 02
tar -xf "$WV".tar.zst

# Create .desktop
cd ~/.local/share/applications/
touch "$GN".desktop
echo "#!/usr/bin/env xdg-open" > "$GN".desktop
echo "[Desktop Entry]" >> "$GN".desktop
echo "Name=$SN" >> "$GN".desktop
echo "Comment=$CME" >> "$GN".desktop
echo "Categories=Game;" >> "$GN".desktop
echo "Exec=/home/$USER/.PlayOnGit/scripts/run/$GN-run.sh" >> "$GN".desktop
echo "Type=Application" >> "$GN".desktop
echo "StartupNotify=true" >> "$GN".desktop
echo "Icon=/home/$USER/.PlayOnGit/icons/$GN.png" >> "$GN".desktop
echo "Terminal=false" >> "$GN".desktop

# Toggle Nvidia
cd ~/.PlayOnGit/scripts/functions/
rm -f "$GN"-Toggle_Nvidia.sh
touch "$GN"-Toggle_Nvidia.sh
echo "#!/bin/bash" > "$GN"-Toggle_Nvidia.sh
echo 'Toggle_Nvidia(){' >> "$GN"-Toggle_Nvidia.sh
echo 'Check_Nvidia="$WINEPREFIX/.Check-Toggle_Nvidia.txt"' >> "$GN"-Toggle_Nvidia.sh
echo 'Script="/home/$USER/.PlayOnGit/scripts/run/$GN-run.sh"' >> "$GN"-Toggle_Nvidia.sh
echo 'if [ ! -e "$Check_Nvidia" ]; then' >> "$GN"-Toggle_Nvidia.sh
echo '    touch "$Check_Nvidia"' >> "$GN"-Toggle_Nvidia.sh
echo '    notify-send "Variables enabled:" "__NV_PRIME_RENDER_OFFLOAD=1\n__VK_LAYER_NV_optimus=NVIDIA_only\n__GLX_VENDOR_LIBRARY_NAME=nvidia"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __NV_PRIME_RENDER_OFFLOAD=1/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __VK_LAYER_NV_optimus=NVIDIA_only/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __GLX_VENDOR_LIBRARY_NAME=nvidia/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo 'else' >> "$GN"-Toggle_Nvidia.sh
echo '    rm "$Check_Nvidia"' >> "$GN"-Toggle_Nvidia.sh
echo '    notify-send "Nvidia Variables" "Disabled"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __NV_PRIME_RENDER_OFFLOAD=1/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __VK_LAYER_NV_optimus=NVIDIA_only/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __GLX_VENDOR_LIBRARY_NAME=nvidia/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo 'fi' >> "$GN"-Toggle_Nvidia.sh
echo '}' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia(){' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia=`LANG=C lspci | grep "VGA compatible controller:" | grep -i Nvidia | cut -c 36-41`' >> "$GN"-Toggle_Nvidia.sh
echo 'if [ "$Nvidia" = "NVIDIA" ] ; then' >> "$GN"-Toggle_Nvidia.sh
echo '    Toggle_Nvidia' >> "$GN"-Toggle_Nvidia.sh
echo 'fi' >> "$GN"-Toggle_Nvidia.sh
echo '}' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia' >> "$GN"-Toggle_Nvidia.sh
chmod +x ~/.PlayOnGit/scripts/functions/"$GN"-Toggle_Nvidia.sh
clear -T "$TERM"

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
export WINEDEBUG=-all
export WINEPREFIX=~/.PlayOnGit/wineprefixes/"$GN"
export WINEARCH=win64
export WINEESYNC=0
export Wtricks=~/.PlayOnGit/scripts/winetricks

tput bold
tput setaf 3
echo "━━━━━━━━━"
echo "PlayOnGit"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ English: ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "WAIT while WINETRICKS performs the necessary procedures. This could take 8 MINUTES."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "EVERYTHING will depend on your PROCESSOR. Below 3GHz it will take MUCH longer."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ Portuguese Message: ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "AGUARDE enquanto o WINETRICKS, realiza os procedimentos necessários. Isso poderá levar 8 MINUTOS."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TUDO dependerá do seu PROCESSADOR. Abaixo de 3GHz demorará BEM mais."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

"${WINE}" wineboot.exe
#"$Wtricks" -q corefonts d3dx9 xact d3dcompiler_43 d3dcompiler_47 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 gdiplus > /dev/null 2>&1

echo
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "COME ON. YOU CAN DO IT. Wait just a little while longer."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "VAMOS LÁ. VOCÊ CONSEGUE. Aguarde só MAIS UM POUCO."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# "$Wtricks" -q vcrun2005 vcrun6sp6 > /dev/null 2>&1
# "$Wtricks" -q vb6run > /dev/null 2>&1
# "$Wtricks" -q vcrun2008 > /dev/null 2>&1
# "$Wtricks" -q mfc40 mfc42 > /dev/null 2>&1
echo "Progress ."
# "$Wtricks" -q vcrun2010 > /dev/null 2>&1
echo "Progress .."
# "$Wtricks" -q vcrun2012 > /dev/null 2>&1
# "$Wtricks" -q vcrun2013 > /dev/null 2>&1
echo "Progress ..."
# "$Wtricks" -q mfc140 > /dev/null 2>&1
# "$Wtricks" -q vcrun2015 > /dev/null 2>&1
#"$Wtricks" -q --force vcrun2017 > /dev/null 2>&1
echo "Progress ...."
#nvapi=disabled nvapi64=disabled csmt=off grabfullscreen=y hosts
"$Wtricks" autostart_winedbg=disabled nocrashdialog > /dev/null 2>&1
tput sgr0

#cd ~/.PlayOnGit/setups/
# rm -f VC_redist.x64.exe
# rm -r VC_redist.x86.exe
# Get "https://download.visualstudio.microsoft.com/download/pr/3b070396-b7fb-4eee-aa8b-102a23c3e4f4/40EA2955391C9EAE3E35619C4C24B5AAF3D17AEAA6D09424EE9672AA9372AEED/VC_redist.x64.exe"
# Get "https://download.visualstudio.microsoft.com/download/pr/9307e627-aaac-42cb-a32a-a39e166ee8cb/E59AE3E886BD4571A811FE31A47959AE5C40D87C583F786816C60440252CD7EC/VC_redist.x86.exe"
# "$W"/bin/wine VC_redist.x64.exe /q
# "$W"/bin/wine VC_redist.x86.exe /q

# cd ~/.PlayOnGit/libraries/
# Get https://www.opencode.net/felipefacundes/wine-bins/raw/master/libraries/mfinstall.tar.xz
# tar -xf mfinstall.tar.xz
# cd mfinstall
# bash install-mf.sh > /dev/null 2>&1

# DXVK - VULKAN
# cd ~/.PlayOnGit/libraries/dxvk/
# Get https://github.com/doitsujin/dxvk/releases/download/v1.9.2/dxvk-1.9.2.tar.gz
# tar -xf dxvk-1.9.2.tar.gz

# cp -rf ~/.PlayOnGit/libraries/dxvk/dxvk-1.9.2/x64/* ~/.PlayOnGit/wineprefixes/"$GN"/drive_c/windows/system32/
# cp -rf ~/.PlayOnGit/libraries/dxvk/dxvk-1.9.2/x32/* ~/.PlayOnGit/wineprefixes/"$GN"/drive_c/windows/syswow64/

# "$Wtricks" d3d9=native d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native > /dev/null 2>&1
tput bold
tput setaf 3
echo "Progress ....."
tput sgr0

# Windows Version
# csmt=off grabfullscreen=y
"$Wtricks" -q win7 > /dev/null 2>&1

cd "$WINEPREFIX"
Get https://raw.githubusercontent.com/felipefacundes/PS/master/Configs/EpicGamesStore/dxvk.conf

# Explorer++ File Manager
cd "$WINEPREFIX/drive_c/windows/"
Get "https://github.com/felipefacundes/desktop/blob/master/explorerpp_1.3.5_x64/Explorerpp.exe?raw=true" -O Explorerpp.exe > /dev/null 2>&1
#######################################################################################################################################################################

######################### Setup executable/game here ##########################
cd ~/.PlayOnGit/setups/
rm -f VectorMagicSetup_pc_1_15.exe
Get 'https://clv-vm2.s3.amazonaws.com/vmde/VectorMagicSetup_pc_1_15.exe?AWSAccessKeyId=ASIAYYEVTQWNHGY32I4I&Expires=1679616000&Signature=hJY0FTbvDnCP1%2Bm4i%2FoPkNybzFs%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIBDdKxNzm4JQZmoSuEB9XfPrXvUl9%2B4WI%2FkxHOSPsa55AiAKoQp%2BuGHeNvPBYmQ60wSVtHuAGpj6DIbnX8ztuk3%2FhCq6BQjI%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYwMTYwOTE3NjQ3NCIM2U3vpwOTrGs%2BnXLlKo4Fw%2FtCDk%2BElqrb%2FPx5ARot%2BklybjconFTtpfrbDvP5TulbXnLk0QXi%2BMUG264ZW1ngjX5RSjXKB4he%2FcLNFbu9CqSq3V8Jh6ZPDsy43ytATs3WWhUZ4w6AQBkZrytmW5vbTptXP%2FnRS3mMvmwFF4NXqZlPFtRyFrX4A0oDbciu0NkdAipJePy4IuasM45pMiPR1iHXTPPCeVa2e%2B7T1gQc0hvrM5fo23Z3RRN5sdOphekm1C6rVwxcQtvd51JTzSVx296M2E%2F1h4pcAl42glGbJkgwXT6SgBYWjTBIhS%2BduUPKrumiEj4lrV864n498Izoc0nca%2B%2FqKhfqj7wi%2FFcy86FiY5Po5O2HCQMNR%2Fsa7K2Lb%2BbDYM7MjN8XsYigXf%2FniCwnRUpWvz3vAFykpW3U1ILpyffxlPEVeZJB7vw7dvGZzfPVsPcjVO%2FRJIZB%2FLt5JSCBRTcGhSHFjMywMpOIZ5Y8h%2FGkJGi8cavS6MUfA7dgdfHceMoNe1UPtcAbNNFCxkBfDdam%2BBVpwYGy07oWDCqPKldSV23wNfgjCt4h6ZvnUR8zdXyaErbagcpP%2FqlfmGrK3W0ddKTMUEl%2B%2FSx70E%2FVAeI6b9Ff%2Bntq7YP2fZ8lKD8oolXlsUbB%2BmRKxTD1FHXCbfghFEQyDCa9nYjOALx%2FuU4x8w%2FqvfMxfvfXemiHHA%2BxJYPTuIp7ECq7Zl7umPrKKzzG15PzI%2FCPDvZYcXWQPXVUDRCPWNEEm5pqlGmoQiapX0XcTv2eIamW%2BiakbdJ%2FLFQhG7JaCVGbweqsqSBjtEERh4A%2BdaengoYNTbWjQ0jiM%2FmZMGP3JC6KLnsTrJzEIJcN2O3oxrRtGup8NPjCl78%2BCmIEr4P7HgMOML6j86AGOrIB7ELDgjo0mmm%2B9Kf%2FB8IDKIHjghqKG6UXZPI5dHfncHdzY6aDA04OFJuLG9%2FtYKeQMJuPjcdCuMXHW9VqpPo8%2FItPETWO%2FCxQH2oREMAIyYN5vtdBE9ppmB4XeNx1ONyvqO1vWkFaANVj1rf80wr3hJ9HOpvoo7nFPax7keHqYcK3osG7ZI5NNS6ePVimWkPLgaScB9Fu%2FgAJom6%2FTTkrOG9Dwzoz%2BgkTz6TP12VjcUd8YA%3D%3D' -O VectorMagicSetup_pc_1_15.exe
"${WINE}" VectorMagicSetup_pc_1_15.exe > /dev/null 2>&1

Wkill
rm -rf ~/.local/share/applications/*wine*
######################### ########################## ##########################

cd ~/.PlayOnGit/scripts/
#Get https://raw.githubusercontent.com/felipefacundes/PS/master/songs/leia.ogg > /dev/null 2>&1
#export beep=~/.PlayOnGit/scripts/leia.ogg
#pactl upload-sample ~/.PlayOnGit/scripts/leia.ogg
#paplay "$beep" --volume=76767
whiptail --msgbox "Installation completed successfully. Just go to your games, go to start menu > games" 10 30
whiptail --msgbox "Instalação concluída com sucesso. Basta acessar os seus jogos, no menu iniciar > jogos" 10 30

clear -T "$TERM"
tput bold
tput setaf 3
echo "━━━━━━━━━━━━━━━━━━━━━━ English: ━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Installation SUCCESSFULLY COMPLETED"
echo "Access your program at: \"Start menu > Games"\"
tput bold
tput setaf 1
echo "To run the startup script, you must have zenity installed"
tput bold
tput setaf 3
echo "Creation by Felipe Facundes"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo
echo "━━━━━━━━━━━━━━━━━━━━ Portuguese: ━━━━━━━━━━━━━━━━━━━━━━━━"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Instalação FINALIZADA com SUCESSO"
echo "Acesse o seu programa no: \"Menu iniciar > Jogos"\"
tput bold
tput setaf 1
echo "Para executar o script de inicialização, é necessário ter zenity instalado"
tput bold
tput setaf 3
echo "Criação de Felipe Facundes"
echo "Acesse nosso grupo do Telegram:"
echo "https://t.me/winehq_linux"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
notify-send "Installation SUCCESSFUL." "━━━━━━━━━━━━━━━━━━━━━\nAccess your program \
from:\nStart menu > Games\n━━━━━━━━━━━━━━━━━━\nTo run the startup script.\nYou must have zenity installed"
sleep 2
notify-send "Instalação FINALIZADA com SUCESSO." "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\nAcesse o seu programa \
no:\nMenu iniciar > Jogos\n━━━━━━━━━━━━━━━━━━━━━━━━━━━\nPara executar o script de inicialização.\nÉ necessário ter zenity instalado"
tput sgr0
rm -rf ~/.local/share/applications/*wine*
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
