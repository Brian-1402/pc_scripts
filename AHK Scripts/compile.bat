@echo off
setlocal

:: Define the path to the Ahk2Exe.exe file
set AHK_COMPILER="C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"

:: Create the bin directory if it doesn't exist
if not exist "bin\" mkdir "bin\"

:: Loop over all .ahk files in the current directory
for %%f in (*.ahk) do (
    :: Compile the .ahk file into an .exe file in the bin directory
    %AHK_COMPILER% /in "%%f" /out "bin\%%~nf.exe"
)

endlocal
