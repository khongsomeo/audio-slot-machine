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

Func generateNumber($displayArray)
  Local $arrayGenerated[3]
  For $i = 0 To UBound($arrayGenerated) - 1 Step 1
    Local $j = 0

    Do
      $arrayGenerated[$i] = Random(0, 9, 1)
    Until $arrayGenerated[$i] <> $displayArray[$i]
  Next
  Return $arrayGenerated
EndFunc

; So the rule is, if 3 numbers are the same then volume = sum of 3 numbers / 27 (999 case)
Func isTheSame($arrayNumber)
  For $i = 0 To UBound($arrayNumber) - 2 Step 1
    if $arrayNumber[$i] <> $arrayNumber[$i + 1] Then Return False
  Next
  Return True
EndFunc

Func ThrowdaDice()
  GUICtrlSetState($ThrowdaDice, $GUI_DISABLE)
  GUICtrlSetData($displayMsg, '')

  Local $generatedArray = generateNumber($display)

  ; Calculate sum of numbers
  Local $sumSound = 0
  For $i = 0 To UBound($generatedArray) - 1 Step 1
    $sumSound += $generatedArray[$i]
  Next


  For $i = 0 To UBound($display) - 1 Step 1
    Local $j = 0

    ; Spinning effect
    while $j < $generatedArray[$i]
      GUICtrlSetData($display[$i], $j)
      $j += 1
      Sleep(50)
    WEnd

    GUICtrlSetData($display[$i], $generatedArray[$i])
  Next

  If isTheSame($generatedArray) Then
    MsgBox(0, 0, "Jackbox!")
  EndIf

  GUICtrlSetState($ThrowdaDice, $GUI_ENABLE)
EndFunc
