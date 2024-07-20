#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
#NoTrayIcon
EnvGet, vUserHome, USERPROFILE



:co:@sbr::www.reddit.com/r/
return
:co:@sre::site:www.reddit.com
return
:co:@bsk::Brian Sajeev Kattikat
return
:co:@bsm::briansajeev@gmail.com
return
:co:@kerm::cs5210509@iitd.ac.in
return
:co:@kerb::cs5210509
return
:co:@kerp::126a87ea
return


#If (A_ComputerName == "BRIAN-HP")

^+#z::									;Ctrl+Shift+Win+Z
Run, %vUserHome%\AppData\Roaming\Portable Chrome
return
^+!z::									;Ctrl+Shift+Alt+Z
^+/::									;Ctrl+Shift+/
Run, %vUserHome%\AppData\Roaming\Portable Chrome\shortcuts\Chrome - Olevin.lnk
return
^+#x::									;Ctrl+Shift+Win+X
Run, %vUserHome%\AppData\Roaming\Portable Chrome\shortcuts\Chrome - Aaron.lnk
return
^+#s::									;Ctrl+Shift+Win+S
Run, obsidian://open?vault=Cache&file=Cache
return
#j::									;Win+J
Run, %vUserHome%\AppData\Roaming\Portable Chrome\shortcuts\Joplin.lnk
return
#o::									;Win+O
Run, obsidian://open?vault=09ca6e481f10d6c7
return
;#n::									;Win+N
;Run, %vUserHome%\AppData\Roaming\Portable Chrome\shortcuts\Notion.lnk
;return
^+#w::									;Ctrl+Shift+Win+W
Run, %vUserHome%\AppData\Roaming\Portable Chrome\shortcuts\Working Memory.url
return

;#!l::									;Win+Alt+L
;Run, %vUserHome%\AppData\Roaming\Portable Chrome\other\logfile.txt
;return
;#!f::									;Win+Alt+F
;Run, %vUserHome%\AppData\Roaming\Portable Chrome\other\f_logs.txt
;return


#w::									;Win + W
Run, %vUserHome%\Automations\WhatsApp.lnk
return
#!n::									;Win+Alt+N
Run, %vUserHome%\Automations\Incognito (Brian) - Chrome.lnk
return
#!t::									;Win+Alt+T
Run, %vUserHome%\My Files\Study\To do.txt
return
#t::									;Win+T
Run, %vUserHome%\My Files\Study\Time Table.txt
return
; #+t::									;Win+Shift+T
; Run, %vUserHome%\My Files\Study\General_Time_Table_FY_II_Sem_2021-22.pdf
; return

#e::									;Win+E
	Run, %vUserHome%\Shortcuts
return

#If

;	The below hotkeys will work on any PC, i.e. they're all general hotkeys


#`::									;Win+`
Run, C:\Windows\System32\Taskmgr.exe
return

; Open chatgpt.com website
#+c::
Run, https://chatgpt.com/
return


; I want the below to not be active during neovim sessions, they have different behaviour there
#If !(WinActive("ahk_exe neovide.exe") || WinActive("ahk_exe WindowsTerminal.exe") || WinActive("ahk_exe nvim-qt.exe") || WinActive("ahk_exe Nvy.exe"))

!w::									;Alt+W
SendInput ^{F4}									;>Ctrl+F4
return

+!w::									;Shift+Alt+W
SendInput +^w								;>Shift+Ctrl+W
return

!r::									;Alt+R
SendInput ^r									;>Ctrl+R
return

!t::									;Alt+T
SendInput ^t									;>Ctrl+T
return

!q::									;Alt+Q
SendInput ^{Tab}								;>Tab
return

+!q::									;Shift+Alt+Q
SendInput +^{Tab}								;>Shift+Tab
return

#If  ; End of conditional hotkeys



!c::									;Alt+C
<^>!c::									;LCtrl+RAlt+C
SendInput !{F4}								;>Alt+F4
return

!v::									;Alt+V
<^>!v::									;LCtrl+RAlt+V
WinMinimize, A
return

#x::									;Win+X
; ~RAlt & .::								;RAlt+.
;~, & .::								;,+.
~/ & ,::								;/+,
;~NumpadDot & Numpad1::							
;~NumpadDel & NumpadEnd::
;~Numpad0 & Numpad2::
~NumpadIns & NumpadDown::
SendInput #^{left}								;>Win+Ctrl+Left
return

#c::									;Win+C
; ~RAlt & /::								;Ralt+/
;~, & /::								;,+/
~/ & .::								;/+.
;~NumpadDot & Numpad2::
;~NumpadDel & NumpadDown::
;~Numpad0 & Numpad3::
~NumpadIns & NumpadPgDn::
SendInput #^{right}								;>Win+Ctrl+Right
return

~RAlt & .::								;RAlt+.
SendInput !+{Esc}								;>Alt+Shift+Esc
return

~RAlt & /::								;Ralt+/
SendInput !{Esc}								;>Alt+Esc
return

; LWin & Space::							;Win+Space
; SendInput {Media_Play_Pause}
; return


#!x::
ExitApp
