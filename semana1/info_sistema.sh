#!/bin/bash
# Script Mohamed
#Informació del sistema discs i usuaris

echo "============== INFO DEL SISTEMA =============="

echo "[*] INFORMACIÓ DEL SISTEMA:"
uptime

echo -e "\n[*] ESPAI EN DISC:"
df -h | grep "/dev/"

echo -e "\n[*] USUARIS AL SISTEMA:"
cut -d: -f1 /etc/passwd | head -n 10

echo
read -p "Prem Enter per tancar..." _
