;-----------------------------------------------------------------------------------------------
;
;   ____ _             __  __               ____ _           _  __  __
;  / ___| |__  _   _  |  \/  | ___  ___    / ___| |__  _   _(_) \ \/ /___   ___  _ __   __ _
; | |   | '_ \| | | | | |\/| |/ _ \/ _ \  | |   | '_ \| | | | |  \  // _ \ / _ \| '_ \ / _` |
; | |___| | | | |_| | | |  | |  __/ (_) | | |___| | | | |_| | |  /  \ (_) | (_) | | | | (_| |
;  \____|_| |_|\__,_| |_|  |_|\___|\___/   \____|_| |_|\__,_|_| /_/\_\___/ \___/|_| |_|\__, |
;                                                                                      |___/
;
;
;> Author.........: trhgquan (https://github.com/trhgquan)
;> ...............: meadoge (https://github.com/meadoge)
;
; PRAISE KEK REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
;-----------------------------------------------------------------------------------------------

#include-once

Opt('GuiOnEventMode', 1)

$ASMMainForm = GUICreate('ASM', 210, 146)
GUISetFont(14, 400, 0, 'Arial')
GUISetOnEvent($GUI_EVENT_CLOSE, 'MainFormClose')
$display[0] = GUICtrlCreateLabel('0', 40, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
$display[1] = GUICtrlCreateLabel('0', 88, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
$display[2] = GUICtrlCreateLabel('0', 136, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
$displayMsg = GUICtrlCreateLabel('', 64, 72, 104, 20)
GUICtrlSetFont(-1, 10, 400, 0, 'Arial')
$ThrowdaDice = GUICtrlCreateButton('Spin', 64, 96, 83, 25)
GUICtrlSetOnEvent(-1, 'ThrowdaDice')
GUICtrlSetFont(-1, 10, 400, 0, 'Arial')
GUICtrlSetCursor (-1, 0)
$Audio_Progress = GUICtrlCreateProgress(0, 128, 210, 18)
GUISetState(@SW_SHOW)

; Keep the form showing
While 1
  Sleep(100)
WEnd

; Close the form
Func MainFormClose()
  Exit
EndFunc