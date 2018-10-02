#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
#InstallMouseHook
#UseHook

/*
===================================================================
===============    MRog40's H1 Auto Run Script    =================
===============	             5/23/11              =================
===================================================================

===================================================================
================= Do Not Edit Code Above ==========================
===================================================================
*/
;===================== Script Keybinds ============================
Auto_Run_Key = Tab
Stop_Key_1 = RButton 
Stop_Key_2 = LButton
Stop_Key_3 = s

;===================== Xim Keybinds ===============================
Sprint_Key = LShift
Run_Ahead_Key = w

;===================== Script Settings ============================
Toggle_Sprint := False  ;By default, this is true in game

;===================== Global Variables ===========================
keyHold := 40
Auto_Running := False

/*
===================================================================
================= Do Not Edit Code Below ==========================
===================================================================
*/

;HotKeys
Hotkey, ~*%Auto_Run_Key%, Auto_Run_Macro
#If Auto_Running
#If
Hotkey, If, Auto_Running
Hotkey, ~*%Stop_Key_1%, Stop_Macro
Hotkey, ~*%Stop_Key_2%, Stop_Macro
Hotkey, ~*%Stop_Key_3%, Stop_Macro
Hotkey, If


;Events
Blank_Macro:
Return

Stop_Macro:
stopRun()
Return

Auto_Run_Macro:
autoRun()
Return

autoRun()
{
    global
    If !Auto_Running
    {
        Auto_Running := True
        SendInput {%Run_Ahead_Key% DownR}
        SendInput {%Sprint_Key% DownR}
        If Toggle_Sprint
        {
            Sleep keyHold
            SendInput {%Sprint_Key% Up}
        }
    }
    Else
    {
        stopRun()
    } 
}

stopRun()
{
    global
    Auto_Running := False
    SendInput {%Run_Ahead_Key% Up}
    SendInput {%Sprint_Key% Up}
}