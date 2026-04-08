#!/bin/bash
# Setmana 4 - Monitoratge i control de processos - Mohamed

INFORME="/home/mohamed/Backups/infor_sistema.txt"
FECHA=$(date +"%Y-%m-%d %H:%M:%S")

echo "INFORME DE ESTAT - $FECHA" > $INFORME
echo "" >> $INFORME

echo "[MEMÒRIA] Top 5 processos per ús de memòria" >> $INFORME
ps aux --sort=-%mem | head -n 6 >> $INFORME

SERVEI="sshd"
if pgrep -x "$SERVEI" > /dev/null
then
    echo "[ESTAT] El servei $SERVEI funciona correctament." >> $INFORME
else
    echo "[ALERTA] !!! El servei $SERVEI NO està en execució !!!" >> $INFORME
fi

echo "" >> $INFORME
echo "Informe generat correctament."
