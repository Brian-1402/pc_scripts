#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
#NoTrayIcon





^+#z::									;Ctrl+Shift+Win+Z
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome
return
^+!z::									;Ctrl+Shift+Alt+Z
^+/::									;Ctrl+Shift+/
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Chrome - Olevin.lnk
return
^+#x::									;Ctrl+Shift+Win+X
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Chrome - Aaron.lnk
return
^+#s::									;Ctrl+Shift+Win+S
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Simplenote.lnk
return
#j::									;Win+J
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Joplin.lnk
return
#o::									;Win+O
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Obsidian.lnk
return
;#n::									;Win+N
;Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Notion.lnk
;return
^+#w::									;Ctrl+Shift+Win+W
Run, C:\Users\Brian\AppData\Roaming\Portable Chrome\shortcuts\Working Memory.url
return



;#!l::									;Win+Alt+L
;Run, C:\Users\brian\AppData\Roaming\Portable Chrome\other\logfile.txt
;return
;#!f::									;Win+Alt+F
;Run, C:\Users\brian\AppData\Roaming\Portable Chrome\other\f_logs.txt
;return
;#!i::									;Win+Alt+i
;Run, C:\Users\brian\AppData\Roaming\Portable Chrome\other\Things to move\interesting stuff to check on.docx
;return






#w::									;Win + W
Run, C:\Users\Brian\Automations\WhatsApp.lnk
return
#!n::									;Win+Alt+N
Run, C:\Users\Brian\Automations\Incognito (Brian) - Chrome.lnk
return
#!t::									;Win+Alt+T
Run, C:\Users\brian\My Files\Study\To do.txt
return
#t::									;Win+T
Run, C:\Users\brian\My Files\Study\Time Table.txt
return
#+t::									;Win+Shift+T
Run, C:\Users\brian\My Files\Study\General_Time_Table_FY_II_Sem_2021-22.pdf
return
#e::									;Win+E
Run, C:\Users\brian\Shortcuts
return





;	The below hotkeys will work on any PC, i.e. they're all general hotkeys






#`::									;Win+`
Run, C:\Windows\System32\Taskmgr.exe
return


:co:sbr/::www.reddit.com/r/
return
:co:sre::site:www.reddit.com
return
;:co:sss/::app.simplenote.com
;return



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

!c::									;Alt+C
<^>!c::									;LCtrl+RAlt+C
SendInput !{F4}								;>Alt+F4
return

!v::									;Alt+V
<^>!v::									;LCtrl+RAlt+V
WinMinimize, A
return

#x::									;Win+X
~RAlt & .::								;RAlt+.
;~, & .::								;,+.
~/ & ,::								;/+,
;~NumpadDot & Numpad1::							
;~NumpadDel & NumpadEnd::
;~Numpad0 & Numpad2::
~NumpadIns & NumpadDown::
SendInput #^{left}								;>Win+Ctrl+Left
return

#c::									;Win+C
~RAlt & /::								;Ralt+/
;~, & /::								;,+/
~/ & .::								;/+.
;~NumpadDot & Numpad2::
;~NumpadDel & NumpadDown::
;~Numpad0 & Numpad3::
~NumpadIns & NumpadPgDn::
SendInput #^{right}								;>Win+Ctrl+Right
return


LWin & Space::							;Win+Space
SendInput {Media_Play_Pause}
return

;
; ; Make Caps Lock act as Ctrl when pressed with another key
; CapsLock::Ctrl
;
; ; Restore Caps Lock functionality when pressed alone
; CapsLock Up::Send {CapsLock}

;
; CapsLock & Space::					;CapsLock+Bksp
; SendInput +{F10}
; return
;
; CapsLock & BackSpace::					;CapsLock+Bksp
; ; CapsLock & p::							;CapsLock+p
; SendInput ^{BackSpace}					;Send Ctrl+Bksp
; return

; +CapsLock::								;Shift+CapsLock
; CapsLock & i::							;CapsLock+i
; SendInput {Esc}								;Remaps the above to send Esc key
; return 

#!x::
ExitApp

