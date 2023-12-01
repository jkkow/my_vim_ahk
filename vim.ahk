; Auto-execute section
VimScriptPath := A_LineFile
VimAppList := "Allow List"
VimGroup := "ahk_exe notepad.exe,Write:,ahk_exe POWERPNT.exe,ahk_exe onenote.exe,OneNote,ahk_exe upnote.exe"
Vim := new VimAhk()
Return

;Commands with <alt>
!h:: Send {Left} 
!j:: Send {Down}
!k:: Send {Up}
!l:: Send {Right}
!y:: Send {Home}
!o:: Send {End}
!9:: Send {Delete}
!0:: Send {BackSpace}

;pasting current date with
^!\:: ;<ctrl>-<alt>-\
FormatTime, time, A_now, yyMMdd
Send %time%
return

;pasting current datetime with
^+!\:: ;<ctrl>-<shift>-<alt>-\
FormatTime, time, A_now, yyMMdd_HHmmss 
Send %time%
return

$Esc::
  if(IME_CHECK("A"))
      Send, {VK15}   ;if keyboard input is Korean, change it to English. 
  Send, {Escape}
  return

/*
  IME check("A")
  returns 0 when keyboard input is Korean,
  returns 1 when keyboard input is English.
*/
IME_CHECK(WinTitle) {
  WinGet,hWnd,ID,%WinTitle%
  Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam) {
  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows,ON
   SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
  if (DetectSave <> A_DetectHiddenWindows)
      DetectHiddenWindows,%DetectSave%
  return ErrorLevel
}
ImmGetDefaultIMEWnd(hWnd) {
  return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}

#Include %A_LineFile%\..\lib\vim_ahk.ahk
