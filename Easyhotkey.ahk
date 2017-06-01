#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode RegEx

;//////////////////////  5. Write signature  /////////////////////////////////
;// Windows + e
#e::
send Kindly regards,`nPerry`n
;//Clipboard = Kindly regards,`r`nPerry Xu`r`nDe-Escalation Architect`r`nMCC Production Support`r`nDigital Business Service`r`nSAP China`r`n
;//Send, {CtrlDown}v{CtrlUp}
return

;// Windows + w
#w::
ClipSaved := ClipboardAll
clipboard = Kindly regards,`r`nPerry Xu`r`nDe-Escalation Architect`r`nMCC Production Support`r`nDigital Business Service`r`nSAP China`r`n
Send, {CtrlDown}v{CtrlUp}
sleep, 10
clipboard := ClipSaved
ClipSaved = 
return


;//////////////////////  7. Open software  /////////////////////////////////
;// alt + 1 -- open new notepad and copy the text in it
!1::
winset, AlwaysOnTop
ClipSaved := ClipboardAll
Send, {CtrlDown}c{CtrlUp}
Sleep, 100
target := clipboard

Run cmd /c start ""  Notepad 
Sleep, 300
Send, {CtrlDown}v{CtrlUp}

sleep, 100
Clipboard := ClipSaved
ClipSaved = 
return

;// alt + 2 -- open google translater
!2::
run, chrome.exe http://translate.google.cn/
return 

;// alt + 3 -- open snipping tool
!3::
run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Snipping Tool
sleep, 200
send {CtrlDown}PrtScn{CtrlUp}
return 


;//////////////////////  8. open Baidu+google  /////////////////////////////////
;// Windows + b - baidu search
#b::
winset, AlwaysOnTop
ClipSaved := ClipboardAll
Send, {CtrlDown}c{CtrlUp}
Sleep, 100
target := clipboard

StringReplace,target,target,`r`n, ,A
StringReplace,target,target,`r,,A
StringReplace,target,target,`n,,A
StringReplace,target,target,%A_SPACE%,`%20,A

url_baidu = https://www.baidu.com/s?wd=%target%
run, chrome.exe %url_baidu%
sleep, 500
Send, {CtrlDown}v{CtrlUp}
Send, `n

sleep, 100
;// Clipboard := ClipSaved
ClipSaved = 
return

;// Windows + g - google search
#g::
winset, AlwaysOnTop
ClipSaved := ClipboardAll
Send, {CtrlDown}c{CtrlUp}
Sleep, 100
target := clipboard

StringReplace,target,target,`r`n, ,A
StringReplace,target,target,`r,,A
StringReplace,target,target,`n,,A
StringReplace,target,target,%A_SPACE%,`%20,A

url_google = https://www.google.co.in/?gfe_rd=cr&ei=1t9RWLfnBMeDvATc8aOQCA#q=%target%
run, chrome.exe %url_google%
sleep, 500
Send, {CtrlDown}v{CtrlUp}
Send, `n

sleep, 100
;// Clipboard := ClipSaved
ClipSaved = 
return

;//////////////////////  hotstrings  /////////////////////////////////
;not need to end with endchars:
;:*:btw::By the way, 
;need to end with endchars:
;::px::Kind regards,`nPerry Xu

#h::
run, chrome.exe https://autohotkey.com/docs/Tutorial.htm#s2
return 
