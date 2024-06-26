param (
    [string]$filePath
)

# Convert the Windows path to a WSL path using WSL
$wslPath = wsl.exe wslpath -a -u "`"$filePath`""

# Trim any surrounding quotes that might have been added
$wslPath = $wslPath.Trim('`"')

# Escape spaces in the WSL path
$escapedWslPath = $wslPath -replace ' ', '\\ '

# Launch Neovide with the WSL path, ensuring it is quoted
Start-Process -NoNewWindow -FilePath "C:\Users\brian\scoop\apps\neovide\current\neovide.exe" -ArgumentList "--wsl `"$escapedWslPath`""
