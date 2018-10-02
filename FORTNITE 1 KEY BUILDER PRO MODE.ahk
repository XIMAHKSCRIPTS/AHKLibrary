#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
#InstallMouseHook
#UseHook

/*
===================================================================
===============     MRog40's Builder Pro OKB      =================
===============    Contributions by rjprevost     =================
===============               v1.6                =================
===============	             4/19/18              =================
===================================================================

===================================================================
=============== Keybind Example:                 ==================
===============     Walls_Key = f                ==================
===============     Triangle_yButton_Key = t     ==================
===============     Left_Dpad = Left             ==================
===================================================================
=============== Special buttons:                 ==================
===============      https://goo.gl/4FhUi7       ==================
===================================================================

===================================================================
================= Do Not Edit Code Above ==========================
===================================================================
*/
;=================== Script Keybinds ==============================
Walls_Key = XButton1
Floors_Key = LCtrl
Stairs_Key = LAlt
Pyramid_Key = x
Reset_Key = g

;=================== Xim Keybinds =================================
Triangle_yButton_Key = 1
Circle_bButton_Key = c
R2_Key = LButton
L2_Key = RButton
Secondary_L2_Key = p
Secondary_R2_Key = o
R1_rBumper_Key = Numpad1
L1_lBumper_Key = q
Left_Dpad = Left

;=================== Global Variables =============================
keyHold := 40 			; time key is held

/*
===================================================================
================= Do Not Edit Code Below ==========================
===================================================================
*/

buildMode := false
L_Button = Secondary_R2_Key
editMode := false

;HotKeys
Hotkey, ~*%Walls_Key% , Walls_Macro
Hotkey, ~*%Floors_Key%, Floors_Macro
Hotkey, ~*%Stairs_Key% , Stairs_Macro
Hotkey, ~*%Pyramid_Key%, Pyramid_Macro
Hotkey, ~*%Reset_Key%, double_Triangle_Macro
HotKey, ~*%Triangle_yButton_Key%, Triangle_yButton_Macro
HotKey, ~*%Circle_bButton_Key%, Circle_bButton_Macro
#If buildMode && !editMode
HotKey, If, buildMode && !editMode
HotKey, *$%L2_Key%, L2_Key_Macro
HotKey, *$%R1_rBumper_Key%, double_Triangle_Macro
HotKey, *$%L1_lBumper_Key%, double_Triangle_Macro
Hotkey, If
#If
Return

;Events
Walls_Macro:
buildPiece(Secondary_R2_Key)
Return

Floors_Macro:
buildPiece(R1_rBumper_Key)
Return

Stairs_Macro:
buildPiece(Secondary_L2_Key)
Return

Pyramid_Macro:
buildPiece(L1_lBumper_Key)
Return

Triangle_yButton_Macro:
buildMode := false
L_Button := Secondary_R2_Key
Return

Circle_bButton_Macro:
circleButton()
Return

#If buildMode && !editMode
$*LButton::
SendInput {%L_Button% DownR}
Return

$*LButton Up::
SendInput {%L_Button% Up}
Return
#If

L2_Key_Macro:
SendInput {%Left_Dpad% DownR}
Sleep keyHold
SendInput {%Left_Dpad% Up}
Return

double_Triangle_Macro:
buildMode := false
L_Button = Secondary_R2_Key
editMode := false
changeStuff(Triangle_yButton_Key, Secondary_R2_Key)
Sleep 20
changeStuff(Triangle_yButton_Key, Secondary_R2_Key)
Return

;Functions
buildPiece(piece)
{
	global
	SendInput {%L_Button% Up}
	SendInput {LButton Up}
	if(buildMode && L_Button = piece)
	{
		changeStuff(Circle_bButton_Key, piece)
	}
	else if(buildMode)
		changeStuff(piece, piece)
	else{
		changeStuff(Circle_bButton_Key, piece)
		if(piece != Secondary_R2_Key)
			changeStuff(piece, piece)
	}
	Sleep 80
	if(buildMode && GetKeyState("LButton", "P"))
		SendInput {%L_Button% DownR}
	else if(!buildMode && GetKeyState("LButton", "P"))
		SendInput {LButton DownR}
}

changeStuff(key, var)
{
	global
	if(key = Circle_bButton_Key)
	{
		buildMode := !buildMode
		SendInput {%L_Button% Up}
		Sleep 10
	}
	L_Button = %var%
	SendInput {%key% DownR}
	Sleep keyHold
	SendInput {%key% Up}
	Sleep 40
}

circleButton() {
	global
	KeyWait, %Circle_bButton_Key%, T0.3
	if(ErrorLevel && buildmode) {
		KeyWait, %Circle_bButton_Key%
		editMode := true
	} else if(buildMode && editMode) {
		editMode := false
	} else {
		buildMode := false
	}
}