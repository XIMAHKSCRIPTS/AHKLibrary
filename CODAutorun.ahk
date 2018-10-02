#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#Persistent
#KeyHistory, 0
#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%
                                                                                                                                                                                                                                                                                                                                                                                                      
F6::suspend

~W::
While GetKeyState("W", "P")
Send, {shift down}
KeyWait, W
    Send, {Shift up}
return
#UseHook On,Off
Modify message