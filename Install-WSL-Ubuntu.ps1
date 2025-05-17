# Aktifkan fitur WSL dan Virtual Machine Platform
Write-Host "Enabling required Windows features..."
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all

# Set default WSL version to 2
Write-Host "Setting WSL default version to 2..."
wsl --set-default-version 2

# Install Ubuntu 20.04
Write-Host "Installing Ubuntu 20.04..."
wsl --install -d Ubuntu-20.04

# Download WSL 2 kernel update (versi 2.3.24)
Write-Host "Downloading WSL 2.3.24.0 kernel update installer..."
Invoke-WebRequest -Uri "https://github.com/microsoft/WSL/releases/download/2.3.24/wsl.2.3.24.0.x64.msi" -OutFile "$env:TEMP\wsl.2.3.24.0.x64.msi"

# Jalankan installer kernel update
Write-Host "Installing WSL 2.3.24.0 kernel update..."
Start-Process -FilePath "$env:TEMP\wsl.2.3.24.0.x64.msi" -Wait

# Download WSL update dari Microsoft
Write-Host "Downloading latest official WSL update from Microsoft..."
Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile "$env:TEMP\wsl_update_x64.msi"

# Jalankan installer update WSL
Write-Host "Installing WSL update..."
Start-Process -FilePath "$env:TEMP\wsl_update_x64.msi" -Wait

# Pastikan Ubuntu-20.04 menggunakan WSL2
Write-Host "Setting Ubuntu-20.04 to use WSL version 2..."
wsl --set-version Ubuntu-20.04 2

Write-Host "`n[✔] WSL 2 dengan Ubuntu 20.04 telah berhasil diatur!"
