#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode RegEx

;//////////////////////  1. Write signature  /////////////////////////////////
;// Windows + e
#e::
send Kindly regards,`nPerry`n
return

;//////////////////////  2. Copy in notepad  /////////////////////////////////
;// alt + 1 -- open new notepad and copy the full text in new notepad (can be used to remove the format)
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

;//////////////////////  3. Open Google translator  /////////////////////////////////
;// alt + 2 -- open google translater
!2::
winset, AlwaysOnTop
ClipSaved := ClipboardAll
Send, {CtrlDown}c{CtrlUp}
Sleep, 100
target := clipboard

StringReplace,target,target,`r`n, ,A
StringReplace,target,target,`r,,A
StringReplace,target,target,`n,,A
StringReplace,target,target,%A_SPACE%,`%20,A

url_translate = http://translate.google.cn/#en/zh-CN/%target%
run, chrome.exe %url_translate%
return 

;//////////////////////  4. Open snipping tool to get screenshot  /////////////////////////////////
;// alt + 3 -- open snipping tool
!3::
run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Snipping Tool
sleep, 500
send {CtrlDown}PrtScn{CtrlUp}
return 

;//////////////////////  5. Open CMD  /////////////////////////////////
;// alt + 4 -- open CMD with desktop
!4::
run, cmd
sleep, 100
return 

;//////////////////////  6. open Baidu to search the selected String  /////////////////////////////////
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

;//////////////////////  7. open Baidu to search the selected String  /////////////////////////////////
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


;//////////////////////  PS: hotstrings  /////////////////////////////////
;not need to end with endchars:
;:*:btw::By the way, 
;need to end with endchars:
;::px::Kind regards,`nPerry Xu

;//////////////////////  PS: Open the Script Help page for AutoHotKey  /////////////////////////////////
#h::
run, chrome.exe https://autohotkey.com/docs/Tutorial.htm#s2
return 
