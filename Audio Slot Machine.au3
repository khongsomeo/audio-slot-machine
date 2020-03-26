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
;
;> UDF used.......: _W7Sound.au3
;> Author.........: Tristan Bemert (TriBe aka BitByteBit)
;> ORIGINAL SOURCE: https://www.autoitscript.com/forum/topic/126654-working-windows-7-sound-udf/
;
; COPYRIGHT FOR KEKS REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
;-----------------------------------------------------------------------------------------------

#include "Array.au3"
#include "ButtonConstants.au3"
#include "GUIConstantsEx.au3"
#include "StaticConstants.au3"
#include "WindowsConstants.au3"
#include "_W7Sound.au3"


Global $array[3], $display[3]

Opt('GuiOnEventMode', 1)

Global $MixerMainForm = GUICreate('Audio Slot Machine', 210, 146)
GUISetFont(14, 400, 0, 'Arial')
GUISetOnEvent($GUI_EVENT_CLOSE, 'MainFormClose')
$display[0] = GUICtrlCreateLabel('0', 40, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
$display[1] = GUICtrlCreateLabel('0', 88, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
$display[2] = GUICtrlCreateLabel('0', 136, 8, 33, 64)
GUICtrlSetFont(-1, 40, 400, 0, 'Arial')
Global $displayMsg = GUICtrlCreateLabel('', 64, 72, 104, 20)
GUICtrlSetFont(-1, 10, 400, 0, 'Arial')
Global $ThrowdaDice = GUICtrlCreateButton('Spin', 64, 96, 83, 25)
GUICtrlSetOnEvent(-1, 'ThrowdaDice')
GUICtrlSetFont(-1, 10, 400, 0, 'Arial')
GUICtrlSetCursor (-1, 0)
Global $Audio_Progress = GUICtrlCreateProgress(0, 128, 206, 16)
GUISetState(@SW_SHOW)

While 1
	Sleep(100)
WEnd

Func ThrowdaDice()
	GUICtrlSetState($ThrowdaDice, $GUI_DISABLE)
	GUICtrlSetData($displayMsg, '')

	For $i = 0 To UBound($array) - 1 Step 1
		Local $j = 0

		Do
			$array[$i] = Random(0,9,1)
		Until $array[$i] <> GUICtrlRead($display[$i])

		GUICtrlSetColor($display[$i], 0x000000)

    ; Spinning effect
		While $j < $array[$i]
			GUICtrlSetData($display[$i], $j)
			$j += 1
			Sleep(50)
		WEnd

		GUICtrlSetData($display[$i], $array[$i])
	Next

	Local $sum = 0, $bool = 0

	For $i = 0 To UBound($array) - 1 Step 1
		$sum += $array[$i]

		If $i <= UBound($array) - 2 And $array[$i] == $array[$i+1] Then
			$bool = 1
			GUICtrlSetColor($display[$i], 0xFF0000) ; 0xff0000 = đỏ
			GUICtrlSetColor($display[$i+1], 0xFF0000)
		EndIf
	Next

	If $bool Then
		$sum = 27
		GUICtrlSetData($displayMsg, 'Jackpot babe!')
		GUICtrlSetColor($displayMsg, 0xFF0000)
	Else
		GUICtrlSetData($displayMsg, 'Audio: ' & ToRealVolume($sum))
		GUICtrlSetColor($displayMsg, 0x000000)
	EndIf

;~ 	SoundSetWaveVolume(100)
	_SetMasterVolume(ToRealVolume($sum))
	GUICtrlSetData($Audio_Progress, ToRealVolume($sum))
	GUICtrlSetState($ThrowdaDice, $GUI_ENABLE)
EndFunc

Func ToRealVolume($percent)
	Local $max = 27 ; 9 * 3 = 27
	Return Round(($percent*100)/$max)
EndFunc

Func MainFormClose()
	Exit
EndFunc
