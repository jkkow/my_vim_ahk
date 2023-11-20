; Auto-execute section
VimScriptPath := A_LineFile
VimAppList := "Allow List"
VimGroup := "ahk_exe notepad.exe,ahk_exe explorer.exe,Write:,ahk_exe POWERPNT.exe,ahk_exe WINWORD.exe,ahk_exe onenote.exe,OneNote,ahk_exe upnote.exe"
Vim := new VimAhk()
Return

#Include %A_LineFile%\..\lib\vim_ahk.ahk
