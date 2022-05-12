#!/bin/bash

STEAMAPPS_PATH="$HOME/.steam/steam/steamapps"




FALLGUYS_PATH=$STEAMAPPS_PATH/common/Fall\ Guys

echo "$STEAMAPPS_PATH"

if [ ! -d "$FALLGUYS_PATH" ]; then
    echo "No se ha econtrado FallGuys en la ubicación seleccionada."
    exit
fi

cd "$FALLGUYS_PATH/EasyAntiCheat/"
rm easyanticheat_x64.so
cd $HOME

#Create symlink
ln -s "$FALLGUYS_PATH/EasyAntiCheat/easyanticheat_x64.so" "$FALLGUYS_PATH/FallGuys_client_game_Data/Plugins/x86_64/easyanticheat_x64.so"

#Edit ini file
sed -i.bak 's/TargetApplicationPath=.*/TargetApplicationPath=FallGuys_client_game.exe/' "$FALLGUYS_PATH/FallGuys_client.ini"

#Try to install Proton EAC Runtime
if which xdg-open > /dev/null
then
  xdg-open steam://install/1826330 & > /dev/null
elif which gnome-open > /dev/null
then
  gnome-open steam://install/1826330 & > /dev/null
fi

exit
