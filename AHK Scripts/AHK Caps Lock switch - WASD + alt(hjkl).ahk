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
Send {up}
Sleep, 20
return

a::
Send {left}
Sleep, 20
return

s::
Send {down}
Sleep, 20
return

d::
Send {right}
Sleep, 20
return



f6::
Send {Volume_Mute}
return
f7::
Send {Volume_Down}
return
f8::
Send {Volume_Up}
return
f9::
Send {Media_Prev}
return
f10::
Send {Media_Play_Pause}
return
f11::
Send {Media_Next}
return
f12::
Send {Media_Next}
return




#If ; turn off context sensitivity for everything after this line


;hjkl arrow keys when pressing Alt
!k::
Send {up}
Sleep, 20
return

!h::
Send {left}
Sleep, 20
return

!j::
Send {down}
Sleep, 20
return

!l::
Send {right}
Sleep, 20
return



#!z::
ExitApp
Return