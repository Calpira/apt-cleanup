#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, ejecuta este script como root." 
    exit 1
fi


echo "-------------------------------"
echo "Ejecutando limpieza del sistema"
echo "-------------------------------"

echo "Limpiando caché de paquetes..."
apt clean
apt autoclean

echo "Eliminando paquetes huerfanos..."
apt autoremove --purge -y

echo "Reparando paquetes pendientes..."
dpkg --configure -a
apt --fix-broken install -y

echo "Limpiando logs antiguos..."
journalctl --vacuum-time=30d


echo "Examinando caché de usuarios..."

for HOME_DIR in /home/*; do
    USER_NAME=$(basename "$HOME_DIR")

    if id "$USER_NAME" >/dev/null 2>&1; then
        echo "  -> Limpiando caché de $USER_NAME"

        rm -rf "$HOME_DIR/.cache/"* \
               "$HOME_DIR/.cache/".[!.]* \
               "$HOME_DIR/.cache/"..?*

        mkdir -p "$HOME_DIR/.cache"
        chown "$USER_NAME:$USER_NAME" "$HOME_DIR/.cache"
    fi
done

echo "Limpiando miniaturas antiguas..."

for HOME_DIR in /home/*; do
    if [ -d "$HOME_DIR/.cache/thumbnails" ]; then
        rm -rf "$HOME_DIR/.cache/thumbnails/"*
    fi
done
echo "-------------------------------"
echo "Limpieza terminada"
echo "-------------------------------"


echo "Estado final del disco:"
echo

df -h /


echo "-------------------------------"

