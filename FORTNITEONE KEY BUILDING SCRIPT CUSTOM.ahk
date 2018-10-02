#Include %A_AppData%\XIM Link\ScriptAdditionals\AHK_ADDITIONALS.ahk

SendMode Input 
SetWorkingDir %A_ScriptDir%
f12::suspend


$*5::
loop 1 
   {
      GetKeyState, state, 5, P
      if state=U             
      break                    
      Sendinput {Q down}{f6 down}{LCTRL down}  
      Sleep 5 ;                
      Sendinput {Q up}{f6 up}{LCTRL up}
      Sleep 0                 
   }
#UseHook On,Off
Return


$*4::
loop 1 
   {
      GetKeyState, state, 4, P
      if state=U             
      break                    
      Sendinput {Q down}{f4 down}{LCTRL down}  
      Sleep 5 ;                
      Sendinput {Q up}{f4 up}{LCTRL up}
      Sleep 0                 
   }
#UseHook On,Off
Return


$*3::
loop 1 
   {
      GetKeyState, state, 3, P
      if state=U             
      break                    
      Sendinput {Q down}{f5 down}{LCTRL down}  
      Sleep 5 ;                
      Sendinput {Q up}{f5 up}{LCTRL up}
      Sleep 0                 
   }
#UseHook On,Off
Return


$*2::
loop 1 
   {
      GetKeyState, state, 2, P
      if state=U             
      break                    
      Sendinput {Q down}{f7 down}{LCTRL down}  
      Sleep 5 ;                
      Sendinput {Q up}{f7 up}{LCTRL up}
      Sleep 0                 
   }
#UseHook On,Off
Return