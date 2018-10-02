#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
#InstallMouseHook
#UseHook

/*
===================================================================
===============          Tfue Peak Script         =================
===============            by MRog40              =================
===============      Delays by Alan McGregor      =================
===============               v1.0                =================
===============	             7/27/18              =================
===================================================================
*/

;=================== Script Keybinds ==============================
TfuePeak_Toggle = T

;=================== Xim Keybinds =================================
Jump_Key = Space
Crouch_Key = c

;=================== Global Variables =============================
TfuePeak_Enabled := False

/*
===================================================================
================= Do Not Edit Code Below ==========================
===================================================================
*/

;HotKeys
#If TfuePeak_Enabled
Hotkey, If, TfuePeak_Enabled
Hotkey, *%TfuePeak_Key%, TfuePeak
Hotkey, If
#If
Hotkey, ~*%TfuePeak_Toggle%, TfuePeak_Toggle_Down
Hotkey, ~*%TfuePeak_Toggle% Up, TfuePeak_Toggle_Up
Return
Return

TfuePeak_Toggle_Down:
TfuePeak_Enabled := True
TfuePeak()
Return

TfuePeak_Toggle_Up:
TfuePeak_Enabled := False
Return

TfuePeak:
TfuePeak()
Return

TfuePeak()
{
    global
    While (GetKeyState("LButton", "P"))
    {
        Send {%Jump_Key% DownR}
        Sleep 40
        Send {%Jump_Key% Up}
		If (GetKeyState("LButton", "P")) {
			Sleep 10
			Send {LButton DownR}
            Sleep 40
            Send {LButton Up}
		}
		else
			Break
		If (GetKeyState("LButton", "P")) {
			Sleep 5
			Send {%Crouch_Key% DownR}
            Sleep 40
            Send {%Crouch_Key% Up}
		}
		else
			Break
		If (GetKeyState("LButton", "P"))
            Sleep 45
		else
			Break
		If (GetKeyState("LButton", "P"))
			Sleep 45
		else
			Break
    }
}