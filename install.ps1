Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install microsoft-teams -y
choco install googlechrome -y --ignore-checksums
choco install notepadplusplus -y
choco install openvpn -y

$vpnExeUrl = "https://preinstall.blob.core.windows.net/script/Azure%20VPN%20Client%20Installer.exe?sp=r&st=2025-04-30T10:42:04Z&se=2025-04-30T18:42:04Z&spr=https&sv=2024-11-04&sr=b&sig=kVCP4UddJPLJ6veHcusTODNlr5jPtDnWIV62cZpr7ls%3D"

$localExePath = "$env:TEMP\AzureVpnClientInstaller.exe"

Invoke-WebRequest -Uri $vpnExeUrl -OutFile $localExePath


Start-Process -FilePath $localExePath -ArgumentList "/quiet", "/norestart" -Wait
