# Dev Environment Setup for Windows PowerShell
Write-Host "========== Dev Environment Setup =========="

# ------------------- 1. Install dependencies -------------------
Write-Host "Installing curl, git, vim..."
winget install --id Git.Git -e --source winget
winget install --id Vim.Vim -e --source winget
winget install --id Curl.Curl -e --source winget

# ------------------- 2. Install Oh My Posh -------------------
Write-Host "Installing Oh My Posh..."
Invoke-Expression (Invoke-WebRequest -UseBasicParsing https://ohmyposh.dev/install.ps1).Content

# ------------------- 3. Specify PATH -------------------
$ohMyPoshBin = "$HOME\.local\bin"
if (-not ($env:PATH -split ";" | Where-Object { $_ -eq $ohMyPoshBin })) {
    $env:PATH += ";$ohMyPoshBin"
    Add-Content -Path $PROFILE -Value "`$env:PATH += ';$ohMyPoshBin'"
}

# ------------------- 4. Create Theme Document -------------------
$themeDir = "$HOME\.poshthemes"
if (-not (Test-Path $themeDir)) {
    New-Item -ItemType Directory -Path $themeDir | Out-Null
}

$themeFile = "$themeDir\atomic.omp.json"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json" `
    -OutFile $themeFile

# ------------------- 5. Configure PowerShell profile -------------------
$profileLine = "oh-my-posh init pwsh --config $themeFile | Invoke-Expression"
if (-not (Get-Content $PROFILE | Select-String -Pattern [regex]::Escape($profileLine))) {
    Add-Content -Path $PROFILE -Value $profileLine
}

# Reload profile
. $PROFILE

# Verify installation
oh-my-posh --version

Write-Host "Download completed. If there are display issues, please use the FiraCode Nerd Font Mono font."
Write-Host "Thank you for using this setup script!"