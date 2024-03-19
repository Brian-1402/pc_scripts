#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#NoTrayIcon
#InstallMouseHook
#InstallKeybdHook

; Map Capslock to Control
; Map press & release of Capslock alone, to Esc
; Press both shift keys together or hold CapsLock for longer time, to toggle Capslock
; Map CapsLock+Space to Shift+F10 (context menu key)

; Modification of https://github.com/fenwar/ahk-caps-ctrl-esc/blob/master/AutoHotkey.ahk
; Original thread where this was found: https://gist.github.com/sedm0784/4443120



; To make Caps+Space custom keymap, and bring back original space functionality when Alt is pressed.
*Space::
	if (GetKeyState("CapsLock", "P")) {
		; If Capslock is down, then send Shift+F10
		Send, +{F10}
	} else if (GetKeyState("LAlt", "P")) {
		; If Alt key is down, then send Alt+Space, bringing back overrided space functionality
        Send, {Blind}{LAlt}{Space}
    } else if (GetKeyState("Ctrl", "P")) {
        ; If Ctrl key is down, then send Ctrl+Space
        Send, {Blind}^{Space}
    } else if (GetKeyState("LWin", "P")) {
        ; If Win key is down, then send Media_Play_Pause
        Send, {Media_Play_Pause}
    } else {
		Send, {Blind}{Space}
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

g_LastCtrlKeyDownTime := 0
g_ControlRepeatDetected := false
g_CapsDown := false
g_MouseClickDetected := false


; To detect mouse clicks while caps is pressed also.
*~LButton::
*~RButton::
	if (g_CapsDown)
	{
		g_MouseClickDetected := true
		; MsgBox, % "Mouse click detected: " g_MouseClickDetected
	}
	Return

; When Capslock is pressed down, act like LControl.
*Capslock::
	; Remember, this block can be executed multiple times while caps is being pressed down. 
	; Set the variables such that they won't overwrite on other variables not expecting repeating capsdown execution in a single caps down.

	g_CapsDown := true
	if (g_ControlRepeatDetected)
    {
        return
		; To avoid the repeating execution of this section when caps is held down.
		; variables set below are safe and run once only.
    }
    g_LastCtrlKeyDownTime := A_TickCount
    g_ControlRepeatDetected := true
    Send {Blind}{LControl down}
    return

; When Capslock is released, if nothing else was pressed then act like Esc.
*Capslock up::
    Send {Blind}{LControl up}
    g_ControlRepeatDetected := false
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
	; prior_key := A_PRIORKEY
	; MSGBOX, % "Prior key: " prior_key ", Mouse clicked: " g_MouseClickDetected ", Prior is caps: " (A_PRIORKEY == "CapsLock")

	if (A_PRIORKEY == "CapsLock") and (!g_MouseClickDetected)
    {
		if (time_elapsed <= 250) {
			Send {Esc}
		} else {
			ToggleCaps()
			; MsgBox ("CAPS UP AFTER 250ms")
		}
	}
    
	time_elapsed := 0
	g_LastCtrlKeyDownTime := 0
	g_CapsDown := false
	g_MouseClickDetected := false
    return


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
