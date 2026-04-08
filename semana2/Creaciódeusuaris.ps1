# setmana 2 - creació massiva d'usuaris - Mohamed
$rutaScript = $PSScriptRoot

# busquem qualsevol fitxer que comenci per 'usuaris' (.txt o .csv)
$archivo = Get-ChildItem -Path $rutaScript -Filter "usuaris*" | Select-Object -First 1

if ($archivo) {
    Write-Host "[OK] Llegit fitxer: $($archivo.FullName)" -ForegroundColor Cyan
    $llistaUsuaris = Get-Content $archivo.FullName

    foreach ($nombre in $llistaUsuaris) {
        if (-not (Get-LocalUser -Name $nombre -ErrorAction SilentlyContinue)) {
            New-LocalUser -Name $nombre -NoPassword
            Write-Host "[OK] Usuari '$nombre' creat." -ForegroundColor Green
        }
        else {
            Write-Host "[!] L'usuari '$nombre' ja existeix." -ForegroundColor Yellow
        }
    }
}
else {
    Write-Host "[ERROR] No hi ha cap fitxer que comenci per 'usuaris' a: $rutaScript" -ForegroundColor Red
}

Read-Host "Prem Enter per finalitzar"
