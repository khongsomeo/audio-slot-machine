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

; Include GUI libraries
#include "Array.au3"
#include "ButtonConstants.au3"
#include "GUIConstantsEx.au3"
#include "StaticConstants.au3"

;~ Debug Mode Constants
Global Const $DEBUG = False
Global Const $DEBUG_WIN_VALUE = 4

;~ Constants
Global Const $COLOUR_RED   = 0xFF0000
Global Const $COLOUR_BLACK = 0x000000
Global Const $MIN_EDGE     = 1
Global Const $MAX_EDGE     = 9

Global Const $ROLL_TIMES   = 2

; Global don't know when to use variables
; Add more here

; Global GUI variables
Global $ASMMainForm
Global $display[3]
Global $displayMsg
Global $ThrowdaDice
Global $Audio_Progress
