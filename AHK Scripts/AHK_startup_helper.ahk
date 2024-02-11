#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
#NoTrayIcon


; Assumes that the other exes are in the same directory

^#x::
Run, AHK_main_script.exe		;Ctrl+Win+X
Run, CapsLockCtrlEscape.exe			;Ctrl+Win+C
return
^#z::
Run, AHK_CapsLock_arrows.exe		;Ctrl+Win+Z
return
; ^#c::
; Run, CapsLockCtrlEscape.exe			;Ctrl+Win+C
; return



; When Ctrl-Alt-H is pressed, show the Keypress history
^!h::KeyHistory
