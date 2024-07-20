#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#Persistent
#SingleInstance, force
#NoTrayIcon


global CapsKey := "CapsLock"
global CapsIsDown := 0
Loop {
    CapsIsDown := GetKeyState(CapsKey, "T")
    ; you could use a "T" instead of "P" here if you wanted to detect if caps lock is on / off
    Sleep, 100
}


;global NumKey := "NumLock"
;global NumIsDown := 0
;Loop {
;    NumIsDown := GetKeyState(NumKey, "T")
;    Sleep, 100
;}



#If (CapsIsDown ="1") ;&& (NumIsDown = "1")

w::
SendInput {up}
Sleep, 20
return

a::
SendInput {left}
Sleep, 20
return

s::
SendInput {down}
Sleep, 20
return

d::
SendInput {right}
Sleep, 20
return



f6::
SendInput {Volume_Mute}
return
f7::
SendInput {Volume_Down}
return
f8::
SendInput {Volume_Up}
return
f9::
SendInput {Media_Prev}
return
f10::
SendInput {Media_Play_Pause}
return
f11::
SendInput {Media_Next}
return
f12::
SendInput {Media_Next}
return




#If ; turn off context sensitivity for everything after this line


;hjkl arrow keys when pressing Alt
!k::
SendInput {up}
Sleep, 20
return

!h::
SendInput {left}
Sleep, 20
return

!j::
SendInput {down}
Sleep, 20
return

!l::
SendInput {right}
Sleep, 20
return



#!z::
ExitApp
Return
