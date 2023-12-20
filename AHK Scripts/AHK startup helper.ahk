#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
#NoTrayIcon



^#x::
Run, C:\Users\brian\Automations\AHK main script.exe		;Ctrl+Win+X
return
^#z::
Run, C:\Users\brian\Automations\AHK Caps Lock switch.exe		;Ctrl+Win+Z
return
