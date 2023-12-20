#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#Persistent
#SingleInstance, force
#NoTrayIcon


global TheKey := "CapsLock"
global KeyIsDown := 0
Loop {
    KeyIsDown := GetKeyState(TheKey, "T")
    ; you could use a "T" instead of "P" here if you wanted to detect if caps lock is on / off
    Sleep, 100
}

#If KeyIsDown

!w::
Send {up}
Sleep, 20
return

!a::
Send {left}
Sleep, 20
return

!s::
Send {down}
Sleep, 20
return

!d::
Send {right}
Sleep, 20
return

#If ; turn off context sensitivity for everything after this line