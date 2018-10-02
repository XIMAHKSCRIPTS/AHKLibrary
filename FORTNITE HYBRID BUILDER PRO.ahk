#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
#InstallMouseHook
#UseHook

/*
===================================================================
===============     Hybrid Builder Pro Script     =================
===============            by MRog40              =================
===============               v1.0                =================
===============	             5/1/18               =================
===================================================================
*/

;=================== Script Keybinds ==============================
Walls_Key = o
Floors_Key = l
Stairs_Key = u
Pyramid_Key = h
Reset_Key = 3

;=================== Xim Keybinds =================================
Triangle_yButton_Key = 2
Circle_bButton_Key = c
R2_Key = LButton
L2_Key = RButton
Secondary_L2_Key = j
Secondary_R2_Key = k
R1_rBumper_Key = e
L1_lBumper_Key = q
Left_Dpad = g

;=================== Global Variables =============================
keyHold := 40

/*
===================================================================
================= Do Not Edit Code Below ==========================
===================================================================
*/

buildMode := false
currentPiece = Secondary_R2_Key

;HotKeys
#If !buildMode
#If
Hotkey, If, !buildMode
Hotkey, *%Walls_Key% , Walls_Macro_Mode
Hotkey, *%Floors_Key%, Floors_Macro_Mode
Hotkey, *%Stairs_Key% , Stairs_Macro_Mode
Hotkey, *%Pyramid_Key%, Pyramid_Macro_Mode
Hotkey, If
Hotkey, ~*%Reset_Key%, double_Triangle_Macro
HotKey, ~*%Triangle_yButton_Key%, Triangle_yButton_Macro
HotKey, If, buildMode
Hotkey, *%Walls_Key% , Walls_Macro
Hotkey, *%Floors_Key%, Floors_Macro
Hotkey, *%Stairs_Key% , Stairs_Macro
Hotkey, *%Pyramid_Key%, Pyramid_Macro
HotKey, *$%L2_Key%, L2_Key_Macro
HotKey, *$%R1_rBumper_Key%, exit_build_mode_macro
HotKey, *$%L1_lBumper_Key%, exit_build_mode_macro
Hotkey, If
Return

;Events
Walls_Macro:
buildPiece(Walls_Key, Secondary_R2_Key)
Return

Floors_Macro:
buildPiece(Floors_Key, R1_rBumper_Key)
Return

Stairs_Macro:
buildPiece(Stairs_Key, Secondary_L2_Key)
Return

Pyramid_Macro:
buildPiece(Pyramid_Key, L1_lBumper_Key)
Return

Walls_Macro_Mode:
buildModePiece(Walls_Key, Secondary_R2_Key)
Return

Floors_Macro_Mode:
buildModePiece(Floors_Key, R1_rBumper_Key)
Return

Stairs_Macro_Mode:
buildModePiece(Stairs_Key, Secondary_L2_Key)
Return

Pyramid_Macro_Mode:
buildModePiece(Pyramid_Key, L1_lBumper_Key)
Return

Triangle_yButton_Macro:
buildMode := false
currentPiece := Secondary_R2_Key
Return

exit_build_mode_macro:
exit_build_mode()
Return

#If buildMode
L2_Key_Macro:
SendInput {%Left_Dpad% DownR}
Sleep keyHold
SendInput {%Left_Dpad% Up}
Return
#If

double_Triangle_Macro:
buildMode := false
currentPiece = Secondary_R2_Key
changeStuff(Triangle_yButton_Key, Secondary_R2_Key)
Sleep 40
changeStuff(Triangle_yButton_Key, Secondary_R2_Key)
Return

;Functions
buildModePiece(key, piece)
{
	global
	changeStuff(Circle_bButton_Key, piece)
	Sleep 40
	if(piece != Secondary_R2_Key)
		changeStuff(piece, piece)
	placePiece(key, piece)
}

buildPiece(key, piece)
{
	global
	currentPiece = %piece%
	if(currentPiece != piece)
		placeTempPiece(key, piece)
	placePiece(key, piece)
}

changeStuff(key, var)
{
	global
	if(key = Circle_bButton_Key)
	{
		buildMode := !buildMode
		SendInput {%currentPiece% Up}
		Sleep 10
	}
	currentPiece = %var%
	SendInput {%key% DownR}
	Sleep keyHold
	SendInput {%key% Up}
}

placePiece(key, button) 
{
	global
	SendInput {%button% DownR}
	KeyWait, %key%
	SendInput {%button% Up}
}

placeTempPiece(key, button) 
{
	global
	SendInput {%button% DownR}
	Sleep keyHold
	SendInput {%button% Up}
}

exit_build_mode()
{
	global
	buildMode := false
	SendInput {%currentPiece% Up}
	SendInput {%Circle_bButton_Key% DownR}
	Sleep keyHold
	SendInput {%Circle_bButton_Key% Up}
	currentPiece = Secondary_R2_Key
}