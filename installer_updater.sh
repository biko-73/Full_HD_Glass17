#!/bin/sh

LOCAL_VER="9.50"
REMOTE_VER=$(wget -qO- https://raw.githubusercontent.com/biko-73/Full_HD_Glass17/main/version.txt)

if [ "$REMOTE_VER" != "$LOCAL_VER" ]; then
    echo "New version found: $REMOTE_VER"
    
    wget -O /tmp/skin.ipk https://github.com/biko-73/Full_HD_Glass17/raw/main/enigma2-skin-fullhdglass17_${REMOTE_VER}_all.ipk
    
    opkg install /tmp/skin.ipk
    
    killall -9 enigma2
else
    echo "Already latest version"
fi