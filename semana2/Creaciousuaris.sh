# setmana 2 - creació d'usuaris - Mohamed

fitxer="usuaris.txt"

if [[ -f "$fitxer" ]]; then
    echo "[OK] Llegint fitxer: $fitxer"
    while IFS= read -r user; do
        if id "$user" &>/dev/null; then
            echo "[!] L'usuari '$user' ja existeix."
        else
            sudo useradd -m -s /bin/bash "$user"
            echo "[OK] Usuari '$user' creat."
        fi
    done < "$fitxer"
else
    echo "[ERROR] No existeix cap fitxer 'usuaris.txt' al directori actual."
fi

read -p "Prem Enter per finalitzar..."
