#Requires AutoHotkey v1.1.33
ih			:= InputHook(), ih.KeyOpt("{All}", "E")
; modifier := "Control|Shift|Alt|Win"
modifier := "Win"


#If !prefix
; Alt::
; Ctrl::
; Shift::
LWin Up::
If (A_PriorKey ~= modifier) {
	prefix := "{" A_PriorKey " down}"
	suffix := "{" A_PriorKey " up}"
	Loop {
		ih.Start(), ih.Wait()
		If match := ih.EndKey ~= modifier {
			prefix .= "{" ih.EndKey " down}"
			suffix .= "{" ih.EndKey " up}"
		}
	} Until !match
	Send % prefix "{" ih.EndKey "}" suffix
	prefix := ""
}
Return
#If
