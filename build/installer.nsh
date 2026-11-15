; Closes the running app before the installer (or uninstaller) touches its files.
; The default check only looks for processes inside the install folder and can end in
; "Telara cannot be closed" (for example when the app asks to confirm closing during a video, or
; when the pre-rename app, "IPTV Player.exe", is still open). A video player has no unsaved work
; (progress is saved every few seconds), so both names are closed right away.
!macro customCheckAppRunning
  DetailPrint "Fechando o Telara..."
  nsExec::Exec `"$SYSDIR\cmd.exe" /C taskkill /F /T /IM "${APP_EXECUTABLE_FILENAME}"`
  Pop $0
  nsExec::Exec `"$SYSDIR\cmd.exe" /C taskkill /F /T /IM "IPTV Player.exe"`
  Pop $0
  ; Give Windows a moment to release the files.
  Sleep 1500
!macroend
