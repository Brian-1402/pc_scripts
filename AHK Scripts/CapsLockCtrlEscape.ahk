#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
#NoTrayIcon


; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock
; Map CapsLock+Space to Shift+F10 (context menu key)

; Modification of https://github.com/fenwar/ahk-caps-ctrl-esc/blob/master/AutoHotkey.ahk
; Original thread where this was found: https://gist.github.com/sedm0784/4443120


CapsDown := false

*Space::
	if (CapsDown) {
		; If Capslock is down, then send Shift+F10
		Send, +{F10}
	} else {
		Send, {Space}
	}
return

; When Capslock is pressed down, act like LControl.
*Capslock::
	CapsDown := true
    Send {Blind}{LControl down}
return

; When Capslock is released, if nothing else was pressed then act like Esc.
*Capslock up::
	CapsDown := false
    Send {Blind}{LControl up}
    ;Popup("CAPS UP AFTER " . A_PRIORKEY)
    if A_PRIORKEY = CapsLock
    {
        Send {Esc}
    }
    return

; Function to trigger the original Capslock behaviour.
; This is needed because by default, AHK turns CapsLock off before doing Send
ToggleCaps(){
    SetStoreCapsLockMode, Off
    Send {CapsLock}
    SetStoreCapsLockMode, On
    return
}

; When both shift keys are pressed, act like Capslock
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()

#!c::
ExitApp


; ----------------------------------------------------------------------------
; General-purpose debugging functions & bindings, safe to define regardless of
; RDP state:
; #If
;
; Popup(Msg, Timeout:=1000){
;     Tooltip, % Msg
;     SetTimer, RemoveTooltip, % Timeout
; }
;
; RemoveTooltip(){
;     SetTimer, RemoveTooltip, Off
;     Tooltip
;     return
; }

; When Ctrl-Alt-R is pressed, reload this script.
; This needs to be done every time we switch between a physical login on the
; computer, and a remote desktop session on the computer.
; ^!r::Reload

; When Ctrl-Alt-H is pressed, show the Keypress history
^!h::KeyHistory

;Browser_Home::Media_Play_Pause
;^!NumpadAdd::Volume_Up
;^!NumpadSub::Volume_Down
