#!/bin/bash
clear -T "$TERM"
dialog --msgbox "A instalação poderá demorar dependendo do JOGO. Acima de tudo tenha: PACIÊNCIA. AGUARDE! Você será notificado, quando a instalação concluir." 10 30
clear -T "$TERM"
# PlayOnGit - Inicie seus Jogos direto do menu iniciar, sem precisar de PlayOnLinux, Proton ou Lutris, e com um desempenho muito melhor e superior.
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# 既 Grupo 調 Gamer do 切 Telegram 切: https://t.me/winehq_linux
########### Este script irá usar uma estrutura padrão.
GN=WarThunder
SN="War Thunder"
CME="Simulador de combates aéreos, navais e blindados"

# Criar as pastas de estrutura
mkdir -p ~/.local/share/applications/
mkdir -p ~/.jogos/icons/
mkdir -p ~/.jogos/scripts/run/
mkdir -p ~/.jogos/setups/
mkdir -p ~/.jogos/nativos/

cd ~/.jogos/nativos/
rm -rf "$GN"

cd ~/.jogos/scripts/run/
rm -rf "$GN"-run.sh
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/runs/"$GN"-run.sh > /dev/null 2>&1
chmod +x "$GN"-run.sh
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/"$GN".png > /dev/null 2>&1
cd ~/.jogos/scripts/


# Criando o atalho .desktop
cd ~/.local/share/applications/
touch "$GN".desktop
echo "#!/usr/bin/env xdg-open" > "$GN".desktop
echo "[Desktop Entry]" >> "$GN".desktop
echo "Name=$SN" >> "$GN".desktop
echo "Comment=$CME" >> "$GN".desktop
echo "Categories=Game;" >> "$GN".desktop
echo "Exec=/home/$USER/.jogos/scripts/run/$GN-run.sh" >> "$GN".desktop
echo "Type=Application" >> "$GN".desktop
echo "StartupNotify=true" >> "$GN".desktop
echo "Icon=/home/$USER/.jogos/icons/$GN.png" >> "$GN".desktop
echo "Terminal=false" >> "$GN".desktop

# Desinstalar
cd ~/.jogos/scripts/run/
touch remover-"$GN".sh
echo "rm -rf /home/$USER/.local/share/applications/$GN.desktop" > remover-"$GN".sh
echo "rm -rf /home/$USER/.jogos/nativos/$GN/" >> remover-"$GN".sh
echo "rm -rf /home/$USER/.jogos/scripts/run/$GN-run.sh" >> remover-"$GN".sh
echo "rm -rf /home/$USER/.local/share/applications/remover-$GN.desktop" >> remover-"$GN".sh
echo "rm -rf /home/$USER/.jogos/scripts/run/remover-$GN.sh" >> remover-"$GN".sh
chmod +x remover-"$GN".sh
cd ~/.local/share/applications/
touch remover-"$GN".desktop
echo "#!/usr/bin/env xdg-open" > remover-"$GN".desktop
echo "[Desktop Entry]" >> remover-"$GN".desktop
echo "Name=Remover $SN" >> remover-"$GN".desktop
echo "Comment=Remover $SN" >> remover-"$GN".desktop
echo "Categories=Game;" >> remover-"$GN".desktop
echo "Exec=/home/$USER/.jogos/scripts/run/remover-$GN.sh" >> remover-"$GN".desktop
echo "Type=Application" >> remover-"$GN".desktop
echo "StartupNotify=true" >> remover-"$GN".desktop
echo "Icon=/home/$USER/.jogos/icons/remover.png" >> remover-"$GN".desktop
echo "Terminal=false" >> remover-"$GN".desktop
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/remover.png > /dev/null 2>&1

export TERM=xterm
# Para ver o FPS na tela e o uso da CPU, inclua cpu,fps
#export GALLIUM_HUD="simple,fps"

export ESYNC=0
# Esta é uma opção que às vezes é necessária para alguns jogos   MESA_GL_VERSION_OVERRIDE=version
#export MESA_GLSL_VERSION_OVERRIDE=450
#export MESA_GL_VERSION_OVERRIDE=4.5COMPAT
# Para placas gráficas híbridas use o DRI_PRIME=1
#export DRI_PRIME=1

#LD_PRELOAD=”libpthread.so.0 libGL.so.1″
#export PULSE_LATENCY_MSEC=60
export KWIN_TRIPLE_BUFFER=1
export TRIPLE_BUFFER=1
export XVideoTextureSyncToVBlank=0
export MESA_NO_ERROR=1
#export AMDVLK_ENABLE_DEVELOPING_EXT="all"
export GPU_FORCE_64BIT_PTR=1
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="/tmp"
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_YIELD="NOTHING"
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0
export STEAM_RUNTIME_HEAVY=1
export __NV_PRIME_RENDER_OFFLOAD=1
#export __GLX_VENDOR_LIBRARY_NAME=nvidia
#export __VK_LAYER_NV_optimus=NVIDIA_only
#export RADV_PERFTEST=aco
export RADV_PERFTEST=llvm
export __GL_THREADED_OPTIMIZATIONS=1
export mesa_glthread=true
export PBA_DISABLE=0
glxinfo -B
glxgears -stereo > /dev/null 2>&1

# Para GAMEMODE: gamemoderun
#export LD_PRELOAD="$LD_PRELOAD:/usr/\$LIB/libgamemodeauto.so.0"

cd ~/.jogos/nativos/
wget -nc https://www.opencode.net/felipefacundes/free-games/raw/master/wt_launcher_linux_0.9.4.15.tar.gz
tar -xf wt_launcher_linux_0.9.4.15.tar.gz
cd "/home/$USER/.jogos/nativos/$GN/"
chmod +x launcher

sleep 1
cd ~/.jogos/nativos/
rm wt_launcher_linux_0.9.4.15.tar.gz

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

cd "/home/$USER/.jogos/nativos/$GN/"
#./launcher

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































cd ~/.jogos/scripts/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/songs/leia.ogg > /dev/null 2>&1
export beep=~/.jogos/scripts/leia.ogg
pactl upload-sample ~/.jogos/scripts/leia.ogg
paplay "$beep" --volume=76767
notify-send "Instalação concluída com sucesso. Basta acessar os seus jogos, no menu iniciar > jogos"

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
