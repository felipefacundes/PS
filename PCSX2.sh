#!/bin/bash
dialog --msgbox "A instalação poderá demorar dependendo do JOGO. Acima de tudo tenha: PACIÊNCIA. AGUARDE! Você será notificado, quando a instalação concluir." 10 30
clear -T "$TERM"
#!/bin/bash
# PlayOnGit - Inicie seus Jogos direto do menu iniciar, sem precisar de PlayOnLinux, Proton ou Lutris, e com um desempenho muito melhor e superior.
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# 既 Grupo 調 Gamer do 切 Telegram 切: https://t.me/winehq_linux
########### Este script irá usar o wine personalizado. Mas, você poderá usar um wine na versão e local de sua escolha
WV=wine-staging-4.8-1-x86_64
GN=PCSX2
SN="PCSX2 1.4.0"
CME="Rode jogos do PlayStation 2"

# Criar as pastas de estrutura para o binário isolado do wine - técnica para manipular diversos tipos de wine
mkdir -p ~/.local/share/applications/
mkdir -p ~/.jogos/wines/
mkdir -p ~/.jogos/icons/
mkdir -p ~/.jogos/libraries/dxvk/
mkdir -p ~/.jogos/scripts/run/
mkdir -p ~/.jogos/setups/
mkdir -p ~/.jogos/wineprefixes/
cd ~/.jogos/wineprefixes/
rm -rf "$GN"
#mkdir -p ~/.jogos/wineprefixes/"$GN"

cd ~/.jogos/scripts/run/
rm -rf "$GN"-run.sh
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/runs/"$GN"-run.sh > /dev/null 2>&1
chmod +x "$GN"-run.sh
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/"$GN".png > /dev/null 2>&1
cd ~/.jogos/scripts/
wget -nc https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks > /dev/null 2>&1
chmod +x winetricks
cd ~/.jogos/wines/
rm -rf "$WV"
wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/"$WV".tar.xz
tar -xf "$WV".tar.xz

# Criando o atalho .desktop
cd ~/.local/share/applications/
echo "#!/usr/bin/env xdg-open" > "$GN".desktop
echo "[Desktop Entry]" >> "$GN".desktop
echo "Name=$SN" >> "$GN".desktop
echo "Comment=$CME" >> "$GN".desktop
echo "Categories=Game;" >> "$GN".desktop
echo "Exec=/home/$USER/.jogos/scripts/run/"$GN"-run.sh" >> "$GN".desktop
echo "Type=Application" >> "$GN".desktop
echo "StartupNotify=true" >> "$GN".desktop
echo "Icon=/home/$USER/.jogos/icons/"$GN".png" >> "$GN".desktop
echo "Terminal=false" >> "$GN".desktop

#1# Essa é a versão escolhida do Wine
export TERM=xterm
# Para ver o FPS na tela, para CPU, inclua cpu,fps
#export GALLIUM_HUD="fps"
W=~/.jogos/wines/"$WV"
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
#"$W"/bin/wineconsole "cmd"

export WINEDEBUG=-all
# Prefix do wine, destino do prefix individual para cada jogo é melhor e evita futuras falhas
export WINEPREFIX=~/.jogos/wineprefixes/"$GN"
# Para tornar a prefix do wine preparada para 32bits ou 64bits. Opção necessária para alguns jogos:
export WINEARCH=win64
export WINEESYNC=0
export vblank_mode=0
# Esta é uma opção que às vezes é necessária para alguns jogos   MESA_GL_VERSION_OVERRIDE=version
export MESA_GLSL_VERSION_OVERRIDE=450
export MESA_GL_VERSION_OVERRIDE=4.5COMPAT
# Para placas gráficas híbridas use o DRI_PRIME=1
#export DRI_PRIME=1
# Para GAMEMODE: gamemoderun
#export LD_PRELOAD="$LD_PRELOAD:/usr/\$LIB/libgamemodeauto.so.0"
#export WINEDLLOVERRIDES=d3d10,d3d11,dxgi=n
export DXVK_SPIRV_OPT=ON
export DXVK_SHADER_OPTIMIZE=1
export DXVK_DEBUG_LAYERS=0
export DXVK_SHADER_DUMP_PATH="/tmp"
export DXVK_SHADER_READ_PATH="/tmp"
export DXVK_LOG_LEVEL=none
#export DXVK_HUD=fps,version,compiler
#LD_PRELOAD=”libpthread.so.0 libGL.so.1″
export PULSE_LATENCY_MSEC=60
export KWIN_TRIPLE_BUFFER=1
export TRIPLE_BUFFER=1
export MESA_NO_ERROR=1
export XVideoTextureSyncToVBlank=0
export __GL_YIELD="NOTHING"
export __GL_SYNC_TO_VBLANK=0
export __GL_THREADED_OPTIMIZATIONS=1
export mesa_glthread=true
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="/tmp"
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export PBA_DISABLE=0
export DXVK_HUD=compiler,fps
glxinfo -B
glxgears -stereo > /dev/null 2>&1

# Primeiro configurar o wine
#"$W"/bin/winecfg

# Opção para winetricks:   vd=1360x768 nvapi=disabled nvapi64=disabled dwrite=disabled galliumnine vulkansdk vb6run vcrun6 mfc40 mfc42
# ⛁ Observação: vcrun2015 CONFLITA com vcrun2017
# Aqui prepara o Wine para o jogo poder rodar:      # Não use -> l3codecx     # Opção para winetricks: dlls list   settings list
echo "━━━━━━━━━"
echo "PlayOnGit"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "AGUARDE enquanto o WINETRICKS, realiza os procedimentos necessários. Isso poderá levar alguns MINUTOS."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "TUDO dependerá do seu PROCESSADOR. Abaixo de 3GHz demorará BEM mais."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
~/.jogos/scripts/winetricks -q corefonts d3dx9 xact d3dcompiler_43 d3dcompiler_47 d3dx10 d3dx10_43 d3dx11_42 d3dx11_43 gdiplus > /dev/null 2>&1
echo "VAMOS LÁ. VOCÊ CONSEGUE. Aguarde só MAIS UM POUCO."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
#~/.jogos/scripts/winetricks -q vcrun2005 > /dev/null 2>&1
echo "Em progresso ."
#~/.jogos/scripts/winetricks -q vcrun2008 > /dev/null 2>&1
echo "Em progresso .."
#~/.jogos/scripts/winetricks -q vcrun2010 > /dev/null 2>&1
echo "Em progresso ..."
#~/.jogos/scripts/winetricks -q vcrun2012 > /dev/null 2>&1
echo "Em progresso ...."
~/.jogos/scripts/winetricks -q vcrun2015 > /dev/null 2>&1
echo "Em progresso ....."
~/.jogos/scripts/winetricks autostart_winedbg=disable nvapi=disabled nvapi64=disabled csmt=off hosts > /dev/null 2>&1
#~/.jogos/scripts/winetricks xaudio2_0=native xaudio2_1=native xaudio2_2=native xaudio2_3=native xaudio2_4=native xaudio2_5=native xaudio2_6=native xaudio2_7=native xaudio2_8=native xaudio2_9=native > /dev/null 2>&1
################################# Vulkan SDK
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Tenha PACIÊNCIA, essa é a vez do VULKAN.."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cd ~/.jogos/setups/
#wget -nc https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-sdk.exe
#"$W"/bin/wine vulkan-sdk.exe /S

################################# CODECs
#wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/codecs-and-players/K-Lite_Codec_Pack_1494_Mega.exe
# "$W"/bin/wine K-Lite_Codec_Pack_1494_Mega.exe /S

################################# firefox
#wget -nc https://download-installer.cdn.mozilla.net/pub/firefox/releases/67.0/win64/pt-BR/Firefox%20Setup%2067.0.exe
# "$W"/bin/wine Firefox*67.0.exe /S

################################# Microsoft Edge
#wget -nc https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?ProductreleaseID=Edge&platform=Default&version=Edge&Channel=Dev&language=en-us&Consent=0&IID=8ca34c01-3483-5135-933f-027f341bd5d1 -O MicrosoftEdgeSetupDev.exe
# "$W"/bin/wine MicrosoftEdgeSetupDev.exe /S

# Faça uma instalação manual do dxsdk_jun2010    # https://www.microsoft.com/en-us/download/details.aspx?id=6812
# vamos instalar o DXSDK
mkdir -p ~/.jogos/setups/DXSDK_Jun10/
cd ~/.jogos/setups/DXSDK_Jun10/
#wget -nc https://download.microsoft.com/download/A/E/7/AE743F1F-632B-4809-87A9-AA1BB3458E31/DXSDK_Jun10.exe -O DXSDK_Jun10.exe
# "$W"/bin/wine DXSDK_Jun10.exe

# Para DXVK - SOMENTE IRÁ FUNCIONAR SE O VULKAN DA SUA PLACA ESTIVER HABILITADO
cd ~/.jogos/libraries/dxvk/
#wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/dxvk/dxvk-1.2.1.tar.gz
#wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/dxvk/d9vk/d9vk-0.12.tar.gz
#tar -xf dxvk-1.2.1.tar.gz
#tar -xf d9vk-0.12.tar.gz

#bash ~/.jogos/libraries/dxvk/d9vk-0.12/setup_dxvk.sh install > /dev/null 2>&1
#bash ~/.jogos/libraries/dxvk/dxvk-1.2.1/setup_dxvk.sh install > /dev/null 2>&1
#cp -rf ~/.jogos/libraries/dxvk/d9vk-0.12/x64/* ~/.jogos/wineprefixes/"$GN"/drive_c/windows/system32/
#cp -rf ~/.jogos/libraries/dxvk/d9vk-0.12/x32/* ~/.jogos/wineprefixes/"$GN"/drive_c/windows/syswow64/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x64/* ~/.jogos/wineprefixes/"$GN"/drive_c/windows/system32/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x32/* ~/.jogos/wineprefixes/"$GN"/drive_c/windows/syswow64/
echo "Em progresso ......"
#~/.jogos/scripts/winetricks d3d9=native d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native > /dev/null 2>&1

# Versão do Windows
~/.jogos/scripts/winetricks -q win7 > /dev/null 2>&1

# Primeiro configurar o wine
#"$W"/bin/winecfg
# Executar o instalador e depois o jogo
cd "/home/$USER/.jogos/wineprefixes/$GN/drive_c/"
wget -nc "https://github.com/felipefacundes/desktop/blob/master/PCSX2/PCSX2%201.4.0.tar.xz?raw=true" -O PCSX2.1.4.0.tar.xz
tar -xf  PCSX2.1.4.0.tar.xz

#⛔⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⛔
#  _          _                     _ _       _                       _           _
# | |        (_)                   | (_)     | |                     | |         (_)              ▏▏
# | |     ___ _  __ _    __ _ ___  | |_ _ __ | |__   __ _ ___    __ _| |__   __ _ ___  _____      ▏▏
# | |    / _ \ |/ _` |  / _` / __| | | | '_ \| '_ \ / _` / __|  / _` | '_ \ / _` | \ \/ / _ \     ▏▏
# | |___|  __/ | (_| | | (_| \__ \ | | | | | | | | | (_| \__ \ | (_| | |_) | (_| | |>  < (_) |    ▏▏
# \_____/\___|_|\__,_|  \__,_|___/ |_|_|_| |_|_| |_|\__,_|___/  \__,_|_.__/ \__,_|_/_/\_\___/     ⧩
#⛔⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⧩⛔
# Logo abaixo é o CAMINHO do instalador do jogo e pode ser alterado por você, de acordo com às suas necessidades:
# Coloque o endereço da PASTA entre às "ASPAS" e mude o nome do executável do instalador.
# Respeitando as Letras MAÍUSCULAS e minúsculas. Exemplo: Setup.exe
#⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬⏬

cd "/home/$USER/.jogos/wineprefixes/$GN/drive_c/Program Files (x86)/"
#"$W"/bin/wine

#⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫⏫
### Só altere essas DUAS linhas ACIMA, como já explicado.
#⛔◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭◭⛔
#   _        _                _
#  | |   ___(_)__ _   __ _ __(_)_ __  __ _    ◭
#  | |__/ -_) / _` | / _` / _| | '  \/ _` |   ▏▏
#  |____\___|_\__,_| \__,_\__|_|_|_|_\__,_|   ▏▏
#       ____
#  _  _ ____ ____    _  _ ____ _  _ ____    _  _ ____ ____    ___  ____ _  _ ____ _ ____    _    _ _  _ _  _ ____ ____
#  |\ | |__| |  |    |\/| |___  \/  |__|    |\ | |__| [__     |  \ |___ |\/| |__| | [__     |    | |\ | |__| |__| [__
#  | \| |  | |__|    |  | |___ _/\_ |  |    | \| |  | ___]    |__/ |___ |  | |  | | ___]    |___ | | \| |  | |  | ___]
#⛔ Não mexa nas demais linhas, deixa do jeito que está.                                                              ⛔

# Irá abrir a localização e o script de inicialização do jogo:
#xdg-open ~/.jogos/wineprefixes/"$GN"/drive_c/
#xdg-open ~/.jogos/scripts/run/"$GN"-run.sh





























################################# 喇 MPV Player 懶 喇
#pkill -9 .exe
#cd ~/.jogos/setups/
#wget -nc https://www.opencode.net/felipefacundes/wine-bins/raw/master/codecs-and-players/mpv.tar.xz
#tar -xf mpv.tar.xz
#cd ~/.jogos/setups/mpv
# "$W"/bin/wineconsole mpv-install.bat

################################# Finalização
#~/.jogos/scripts/winetricks vd=1360x768

pkill -9 .exe

cd ~/.jogos/scripts/
wget -nc https://raw.githubusercontent.com/felipefacundes/desktop/master/wine-jogos/songs/leia.ogg > /dev/null 2>&1
export beep=~/.jogos/scripts/leia.ogg
pactl upload-sample ~/.jogos/scripts/leia.ogg
paplay "$beep" --volume=76767
notify-send "Na Guia Gráficos habilite o desktop virtual, se preferir"
dialog --msgbox "Na Guia Gráficos habilite o desktop virtual, se preferir" 10 25
"$W"/bin/winecfg
dialog --msgbox "Instalação concluída com sucesso. Basta acessar os seus jogos, no menu iniciar > jogos" 10 30

dialog --msgbox "Se PREFERIR. Você poderá instalar uma versão do JOGO já disponível no seu HD, basta alterar o script. LEIA! No site do PlaOnGit que ensina como proceder." 15 30

notify-send "Instalação FINALIZADA com SUCESSO."
sleep 1
notify-send "Acesse o seu programa no: Menu iniciar > Jogos"
notify-send "Se quiser, pode fechar o terminal."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Instalação FINALIZADA com SUCESSO"
echo "Acesse o seu programa no: \"Menu iniciar > Jogos"\"
echo "Criação de Felipe Facundes"
echo "Acesse nosso grupo do Telegram:"
echo "https://t.me/winehq_linux"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

################################# Opções extras:
# Opções da steam: https://developer.valvesoftware.com/wiki/Command_Line_Options
#-insecure
#-forcenovsync
#-nojoy
#-fullscreen ou -full
#-applaunch 230410
# Acima são opções da steam
#
# programa.exe -opengl
# progrma.exe -dx9
#
# Nosso grupo do Telegram para ajudar o pessoal a rodar jogos do Windows no Linux. E para fazer pedidos de tutorial:
# https://t.me/winehq_linux
# Canal do telegram. Para os arquivos: mfc42.dll e l3codecx.ax só efetuar a busca com o hashtag: #ageofempires
# https://t.me/archLinux_pacotes
# Tutorial do wine, todavia fiz alterações para funcionar corretamente:
# https://appdb.winehq.org/objectManager.php?sClass=version&iId=29761&iTestingId=82749
# Dlls links:
# https://www.pconlife.com/download/winosfile/208/49/c4cce0cfb49fbcc0ad0596523839ccfc/
# https://www.dlldump.com/download-dll-files_new.php/dllfiles/M/mfc42.dll/6.0.400/download.html
# Codecs:  Baixe a versão Mega:  K-Lite_Codec_Pack_1494_Mega.exe  # Depois tem que configurar: às preferencias de codec e habilitar tudo.
# https://www.codecguide.com/download_kl.htm

#
#                    ,cldxOxoc:;,
#               ,;:okKNXKK0kO0Okxddol:;,
#        ,;codxkkOKXKko:'......,;clx0KXXOxol:,
#   :lodxxdololc:,'..................,cdk00kxkOkxoc,
#  ;XOxdl:,..  .......................... ..,;lx0XNx
#  lX0c      ..;dddddooooollll,............     .0XO'
#  oKK;    ....0NNXXKKK00OOOkx'.............     x0x,
#  lXX;   ....,WWNNNKdddoooooc.'..............   okk,
#  cXW:  .....xWWWWWl''''''''''''''............  dd0,
#  :OWo ......NMMMMWOkkkkxxxc''''''''.......... .kxK'
#  ,dKk .....lWWWWMMMWWWNNNX:,''''''''...........KOx'
#  ,lk0......ONNNWWddddddddo,,,,,''''''.........lNOc'
#  'cdk;....;KXXXNO''',,,,,,,ddddoooolllccc:....0WO,'
#  ',ddd....o0KKKXl'',,,,,,,lWWNNNXXKKK00OOc...,0Xx'
#   'llo;...kO00K0,'',,,,,,,0MWWWN0OOOkkkxx'...oxK;'
#   ',xcl..,lloool''',,,,,,:WWMMMX''''''......cxko'
#    ':x:c......''''''',,,,xNWWWM0dddddool...:00O,'
#     'ld::.......'''''',,,KNNNWWWMMMWWWWx..;XXK;'
#      'dd::.......'''''''lKXXNN0kkOOOkkk;.;0KK;'
#       'ox::........'''''x0KKKX;'''......lK0k;'
#        'cx:c,........'.,OO00KO........'kN0o,'
#         ',dllc'........lkkOO0c.......:KNk:'
#           ':lldc.......oodddd'.....,d0Oc,'
#            ',:ldxl'..............'lxxo;,'
#              ',;lx0x;..........,cldo:'
#               '',cxXXd,....,cdxkd:'
#                   ',視嗢荒華者喝啕喙調﬏磌,'
#                     ',;lxdl:,'
#
# Tutorial by:
#  ___    _             ___                     _
# | __|__| (_)_ __  ___| __|_ _ __ _  _ _ _  __| |___ ___
# | _/ -_) | | '_ \/ -_) _/ _` / _| || | ' \/ _` / -_|_-<
# |_|\___|_|_| .__/\___|_|\__,_\__|\_,_|_||_\__,_\___/__/
#            |_|
#
# ┏┓
# ┃┃╱╲ nesta
# ┃╱╱╲╲ casa
# ╱╱╭╮╲╲ todos
# ▔▏┗┛▕▔ usam
# ╱▔▔▔▔▔▔▔▔▔▔╲
# LINUX
# ╱╱┏┳┓╭╮┏┳┓ ╲╲
# ▔▏┗┻┛┃┃┗┻┛▕▔
# -------------------------





################################# Oções descartadas:

#cd ~/.local/share/applications
#rm -rf wine*

#cd ~/.jogos/wineprefixes/"$GN"/drive_c/windows/system32/
#rm ntdll.dll
#wget -nc https://www.dlldump.com/dllfiles/N/ntdll.dll
# "$W"/bin/wine regsvr32 /i /S ntdll.dll

# INSTALE O DXVK - Manualmente

#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x64/* ~/.jogos/wineprefixes/Origin/drive_c/windows/system32/
#cp -rf ~/.jogos/libraries/dxvk/dxvk-1.2.1/x32/* ~/.jogos/wineprefixes/Origin/drive_c/windows/syswow64/

#"$W"/bin/wine regsvr32 /i /S l3codecx.ax
#~/.jogos/scripts/winetricks d3d10=native d3d10_1=native d3d10core=native d3d11=native dxgi=native
