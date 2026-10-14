param([string]$Device = '192.168.1.4:5555')
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ziel = 'C:\Users\bumse\Downloads\GTIPTV'
$zeit = Get-Date -Format 'yyyyMMdd_HHmmss_fff'
$zip = Join-Path $ziel 'GTIPTV-Android-TVTEST-0.1.3.zip'
$projekt = Join-Path $ziel 'GTIPTV-Android'
$temp = Join-Path $ziel "Entpacken_$zeit"
$url = 'https://raw.githubusercontent.com/keggy6893/GTIPTV-Android/main/GTIPTV-Android-TVTEST-0.1.3.zip'
$erwartet = '3bd303baf17587ab98bc293a17bf4179f988e7d22392f14b022c6e2b16986058'
New-Item -ItemType Directory -Force -Path $ziel | Out-Null
Write-Host 'Version 0.1.3 wird von GitHub geladen ...' -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing -TimeoutSec 90
if ((Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash -ne $erwartet) {
    throw 'Pruefsumme stimmt nicht. Abbruch.'
}
Expand-Archive -LiteralPath $zip -DestinationPath $temp
$neu = Join-Path $temp 'GTIPTV-Android'
if (-not (Test-Path "$neu\Install-TV.ps1")) { throw 'Installationsskript fehlt.' }
if (Test-Path $projekt) {
    $backup = Join-Path $ziel "GTIPTV-Android_Backup_$zeit"
    Move-Item -LiteralPath $projekt -Destination $backup
    Write-Host "Bisheriger Projektordner gesichert: $backup" -ForegroundColor Green
}
Move-Item -LiteralPath $neu -Destination $projekt
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$projekt\Install-TV.ps1" -Device $Device
if ($LASTEXITCODE -ne 0) { throw 'Installation nicht abgeschlossen. Bitte Ausgabe im Chat zeigen.' }
Write-Host 'Version 0.1.3 installiert. Bitte Filme am TCL oeffnen und die Filmansicht pruefen.' -ForegroundColor Green
