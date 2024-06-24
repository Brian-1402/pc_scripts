param (
    [string]$filePath
)

# Ensure the file path uses backslashes correctly
$filePath = $filePath -replace '\\', '\\'

# Convert the Windows path to a WSL path using WSL
$wslPath = wsl.exe -e wslpath -a -u "$filePath"

# Launch Neovide with the WSL path
Start-Process -NoNewWindow -FilePath "C:\Users\brian\scoop\apps\neovide\current\neovide.exe" -ArgumentList "--wsl `"$wslPath`""
