#!/bin/bash
# PlayOnGit - Launch your Games directly from the start menu.
# License: GPLv3
# Manteiner: Felipe Facundes
# Email: playongit@gmail.com
# 切 Telegram: https://t.me/winehq_linux
########### This script will use custom wine. But, you can use a wine in the version and location of your choice. 
########### Este script irá usar o wine personalizado. Mas, você poderá usar um wine na versão e local de sua escolha
######### Not root #########
if [[ "$EUID" -ne 0 ]]; then
############################
ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1 ; pkill -9 .exe
clear -T "$TERM"
rm -rf ~/.local/share/applications/*wine* 
whiptail --msgbox "Installation may take some time depending on the GAME. Above all, please: PATIENCE. WAIT! You will be notified when installation is complete." 10 30 
whiptail --msgbox "A instalação poderá demorar dependendo do JOGO. Acima de tudo tenha: PACIÊNCIA. AGUARDE! Você será notificado, quando a instalação concluir." 10 30

WV=wine-tkg-staging-6.17.r13-x86_64
GN=CSGlobalOffensive
SN="Counter-Strike: Global Offensive - OpenGL"
CME="Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay."

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

cd ~/.PlayOnGit/scripts/run/
rm -rf "$GN"-run.sh
wget --no-check-certificate -nc https://raw.githubusercontent.com/felipefacundes/PS/master/runs/"$GN"-run.sh > /dev/null 2>&1
chmod +x "$GN"-run.sh
cd ~/.PlayOnGit/icons/
wget --no-check-certificate -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/"$GN".png > /dev/null 2>&1
cd ~/.PlayOnGit/scripts/
rm -rf winetricks
wget --no-check-certificate -nc https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks > /dev/null 2>&1
chmod +x winetricks
cd ~/.PlayOnGit/wines/
rm -rf "$WV"
# Server 01
# wget --no-check-certificate -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/"$WV".tar.zst
# Server 02
wget --no-check-certificate -nc https://master.dl.sourceforge.net/project/wine-bins/"$WV".tar.zst
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
echo "GN=$GN" >> "$GN"-Toggle_Nvidia.sh
echo 'Toggle_Nvidia(){' >> "$GN"-Toggle_Nvidia.sh
echo 'Intel=`glxinfo -B  2> /dev/null | grep "Vendor: Intel" | cut -c 13-17`' >> "$GN"-Toggle_Nvidia.sh
echo 'Script="/home/$USER/.PlayOnGit/scripts/run/$GN-run.sh"' >> "$GN"-Toggle_Nvidia.sh
echo 'if [ "$Intel" = "Intel" ] ; then' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __NV_PRIME_RENDER_OFFLOAD=1/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __VK_LAYER_NV_optimus=NVIDIA_only/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __GLX_VENDOR_LIBRARY_NAME=nvidia/s/^#//g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo 'else' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __NV_PRIME_RENDER_OFFLOAD=1/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __VK_LAYER_NV_optimus=NVIDIA_only/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo '    sed -i "/export __GLX_VENDOR_LIBRARY_NAME=nvidia/s/^/#/g" "$Script"' >> "$GN"-Toggle_Nvidia.sh
echo 'fi' >> "$GN"-Toggle_Nvidia.sh
echo '}' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia(){' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia=`lspci | grep "VGA compatible controller:" | grep -i Nvidia | cut -c 36-41`' >> "$GN"-Toggle_Nvidia.sh
echo 'if [ "$Nvidia" = "NVIDIA" ] ; then' >> "$GN"-Toggle_Nvidia.sh
echo '    Toggle_Nvidia' >> "$GN"-Toggle_Nvidia.sh
echo 'fi' >> "$GN"-Toggle_Nvidia.sh
echo '}' >> "$GN"-Toggle_Nvidia.sh
echo 'Nvidia' >> "$GN"-Toggle_Nvidia.sh
chmod +x ~/.PlayOnGit/scripts/functions/"$GN"-Toggle_Nvidia.sh
clear -T "$TERM"

export TERM=xterm
W=~/.PlayOnGit/wines/"$WV"
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
Wtricks=~/.PlayOnGit/scripts/winetricks

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

"$Wtricks" -q corefonts d3dx9 xact d3dcompiler_43 d3dcompiler_47 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 gdiplus > /dev/null 2>&1

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

"$Wtricks" -q vcrun2005 vcrun6sp6 > /dev/null 2>&1
"$Wtricks" -q vb6run > /dev/null 2>&1
"$Wtricks" -q vcrun2008 > /dev/null 2>&1
"$Wtricks" -q mfc40 mfc42 > /dev/null 2>&1
echo "Progress ."
"$Wtricks" -q vcrun2010 > /dev/null 2>&1
echo "Progress .."
"$Wtricks" -q vcrun2012 > /dev/null 2>&1
"$Wtricks" -q vcrun2013 > /dev/null 2>&1
echo "Progress ..."
"$Wtricks" -q vcrun2015 > /dev/null 2>&1
#"$Wtricks" -q --force vcrun2017 > /dev/null 2>&1
echo "Progress ...."
"$Wtricks" autostart_winedbg=disabled nvapi=disabled nvapi64=disabled csmt=off grabfullscreen=y hosts nocrashdialog > /dev/null 2>&1
tput sgr0

cd ~/.PlayOnGit/setups/
rm -f VC_redist.x64.exe 
rm -r VC_redist.x86.exe
wget --no-check-certificate -nc "https://download.visualstudio.microsoft.com/download/pr/3b070396-b7fb-4eee-aa8b-102a23c3e4f4/40EA2955391C9EAE3E35619C4C24B5AAF3D17AEAA6D09424EE9672AA9372AEED/VC_redist.x64.exe"
wget --no-check-certificate -nc "https://download.visualstudio.microsoft.com/download/pr/9307e627-aaac-42cb-a32a-a39e166ee8cb/E59AE3E886BD4571A811FE31A47959AE5C40D87C583F786816C60440252CD7EC/VC_redist.x86.exe"
"$W"/bin/wine VC_redist.x64.exe /q
"$W"/bin/wine VC_redist.x86.exe /q

cd ~/.PlayOnGit/libraries/
wget --no-check-certificate -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/libraries/mfinstall.tar.xz
tar -xf mfinstall.tar.xz
cd mfinstall
bash install-mf.sh > /dev/null 2>&1

# DXVK - VULKAN
cd ~/.PlayOnGit/libraries/dxvk/
wget --no-check-certificate -nc https://github.com/doitsujin/dxvk/releases/download/v1.9.2/dxvk-1.9.2.tar.gz
tar -xf dxvk-1.9.2.tar.gz

cp -rf ~/.PlayOnGit/libraries/dxvk/dxvk-1.9.2/x64/* ~/.PlayOnGit/wineprefixes/"$GN"/drive_c/windows/system32/
cp -rf ~/.PlayOnGit/libraries/dxvk/dxvk-1.9.2/x32/* ~/.PlayOnGit/wineprefixes/"$GN"/drive_c/windows/syswow64/

# "$Wtricks" d3d9=native d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native > /dev/null 2>&1
tput bold
tput setaf 3
echo "Progress ....."
tput sgr0

# Windows Version
"$Wtricks" -q win10 csmt=off grabfullscreen=y > /dev/null 2>&1

cd "$WINEPREFIX"
wget --no-check-certificate -nc https://raw.githubusercontent.com/felipefacundes/PS/master/Configs/EpicGamesStore/dxvk.conf

# Explorer++ File Manager 
cd "$WINEPREFIX/drive_c/windows/"
wget --no-check-certificate -nc "https://github.com/felipefacundes/desktop/blob/master/explorerpp_1.3.5_x64/Explorerpp.exe?raw=true" -O Explorerpp.exe > /dev/null 2>&1
#######################################################################################################################################################################

######################### Setup executable/game here ########################## 
cd ~/.PlayOnGit/setups/
rm -f SteamSetup.exe
wget --no-check-certificate -nc https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe
"$W"/bin/wine SteamSetup.exe

ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1 ; pkill -9 .exe
rm -rf ~/.local/share/applications/*wine*
######################### ########################## ##########################

cd ~/.PlayOnGit/scripts/
#wget --no-check-certificate -nc https://raw.githubusercontent.com/felipefacundes/PS/master/songs/leia.ogg > /dev/null 2>&1
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
