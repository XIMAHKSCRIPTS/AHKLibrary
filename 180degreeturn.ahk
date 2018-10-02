#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
SendMode Input 
SetWorkingDir %A_ScriptDir% 
#NoEnv
#InstallKeybdHook
#InstallMouseHook
#MaxThreads 30
#MaxThreadsBuffer on
SendMode Input
#UseHook

/*
===================================================================
===============            Key Does 180          =================
===============              by MRog40              =================
===================================================================
*/

;=================== Global Variables =============================
 time := 100

;=================== The Actual Script =============================

d::
    XIMInputData("RightStickDirectional", 0, 100)
    Sleep time
    XIMInputData("RightStickDirectional", 0, 0)
Return