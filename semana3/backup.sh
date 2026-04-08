#!/bin/bash
# Setmana 3 - Copia de seguretat automatica - Mohamed

ORIGEN="/home/mohamed/Documentos"
DESTINO="/home/mohamed/Backups"
FECHA=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$DESTINO/copia_$FECHA"

cp -r "$ORIGEN/"* "$DESTINO/copia_$FECHA/"

if [ $? -eq 0 ]; then
    echo "[$FECHA] Còpia feta correctament a $DESTINO/copia_$FECHA"
else
    echo "[$FECHA] ERROR en fer la còpia"
fi

read -p "Prem Enter per finalitzar..."
