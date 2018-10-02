#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SetDefaultMouseSpeed, 0
SetMouseDelay, -1
SetKeyDelay, -1
SetWinDelay, -1
SetBatchLines, -1
SetControlDelay -1
#MaxThreads 30
#MaxThreadsBuffer on
#KeyHistory 0
SendMode Input
#UseHook

_auto := true

~RButton::autofire()
NumPad2::_auto := ! _auto

autofire()
{
global _auto
if _auto
{
Loop
{
if GetKeyState("RButton", "P")
{
SendInput {RButton DownTemp}
Sleep 30 // high = slow , Low = fast
SendInput {RButton Up}
Sleep 20 // high = slow , Low = fast
}
else
break
} ;; loop
} ;; if
} ;; autofire()


o::Suspend
