# Script Mohamed
# Extreu informació del sistema, discs i usuaris locals
Write-Host "================ INFO DE SISTEMA ================" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Yellow

Write-Host "[*] INFORMACIÓ DE L'EQUIP:" -ForegroundColor Cyan
Get-CimInstance Win32_OperatingSystem | Select-Object CSName, Caption, Version | Format-Table

Write-Host "[*] ESPAI EN DISC:" -ForegroundColor Cyan
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
    Select-Object DeviceID,
        @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace/1GB,2)}},
        @{Name="SizeGB";Expression={[math]::Round($_.Size/1GB,2)}} |
    Format-Table

Write-Host "[*] USUARIS LOCALS:" -ForegroundColor Cyan
Get-LocalUser | Select-Object Name, Enabled, Description | Format-Table

Read-Host "Prem qualsevol tecla per tancar aquesta finestra i després prem Enter "
