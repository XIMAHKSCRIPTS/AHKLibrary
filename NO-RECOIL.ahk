#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

   
_auto := true

~LButton::autofire()
Numlock::_auto := ! _auto
NumPad3::ExitApp

autofire()
{
global _auto
if _auto
{
Loop
{
if GetKeyState("LButton", "P")
{
SendInput {LButton DownTemp}
Sleep 25
mouseXY(0, 1)
SendInput {LButton Up}
Sleep 25
}
else
break
} ;; loop
} ;; if
} ;; autofire()

mouseXY(x,y)
{
DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}