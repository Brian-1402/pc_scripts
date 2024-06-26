param (
    [string]$filePath
)

# Option 1: Original path
$originalPath = $filePath

# Option 2: Replacing backslashes with double backslashes
$escapedFilePath = $filePath -replace '\\', '\\'

# Option 3: Quoted original path
$quotedFilePath = "`"$filePath`""

# Option 4: Replacing backslashes with double backslashes and quoting
$escapedQuotedFilePath = "`"$escapedFilePath`""

# Convert paths to WSL paths
$wslPath1 = wsl.exe wslpath -a -u $originalPath
$wslPath2 = wsl.exe wslpath -a -u $escapedFilePath
$wslPath3 = wsl.exe wslpath -a -u $quotedFilePath
$wslPath4 = wsl.exe wslpath -a -u $escapedQuotedFilePath

# Print results
Write-Output "Original Path: $originalPath"
Write-Output "Escaped File Path: $escapedFilePath"
Write-Output "Quoted File Path: $quotedFilePath"
Write-Output "Escaped Quoted File Path: $escapedQuotedFilePath"
Write-Output "WSL Path 1: $wslPath1"
Write-Output "WSL Path 2: $wslPath2"
Write-Output "WSL Path 3: $wslPath3"
Write-Output "WSL Path 4: $wslPath4"
