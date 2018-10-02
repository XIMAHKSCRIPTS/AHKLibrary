#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk

5::Suspend
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
#InstallKeybdHook
#UseHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
#NoEnv 
#InstallMouseHook
SendMode Input 
SetWorkingDir %A_ScriptDir%

$rbutton::                   
Send, {RButton Down}   
Sleep 379               
Send, {LButton Down}    
Sleep 60        
Send, {LButton Up}      
Send, {RButton Up}    

return

#UseHook On,Off
