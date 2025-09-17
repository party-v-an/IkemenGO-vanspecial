; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "2QCF_a"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "2QCF_b"   ;Same name as above
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "2QCF_c"   ;Same name as above
command = ~D, DF, F, D, DF, F, c
time = 30

[Command]
name = "2QCB_a"
command = ~D, DB, B, D, DB, B, a;~F, D, DF, F, D, DF, x
time = 30

[Command]
name = "2QCB_b"
command = ~D, DB, B, D, DB, B, b;~F, D, DF, F, D, DF, x
time = 30

[Command]
name = "2QCB_c"
command = ~D, DB, B, D, DB, B, c;~F, D, DF, F, D, DF, x
time = 30

[Command]
name = "2QCB_ab"   ;Same name as above
command = ~D, DB, B, D, DB, B, a+b;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "2QCF_ab"   ;Same name as above
command = ~D, DF, F, D, DF, F, a+b;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "2QCB_ac"   ;Same name as above
command = ~D, DB, B, D, DB, B, a+c;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "2QCF_ac"   ;Same name as above
command = ~D, DF, F, D, DF, F, a+c;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "2QCB_bc"   ;Same name as above
command = ~D, DB, B, D, DB, B, b+c;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "2QCF_bc"   ;Same name as above
command = ~D, DF, F, D, DF, F, b+c;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "QCBF_ab"   ;Same name as above
command = ~B, DB, D, DF, F, a+b;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "QCFFB_ab"   ;Same name as above
command = ~D, DF, F, DF, D, DB, B, a+b;~F, D, DF, F, D, DF, y
time = 30

[Command]
name = "QCFFB_ab"   ;Same name as above
command = ~D, F, D, B, a+b;~F, D, DF, F, D, DF, y
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

[Command]
name = "upper_x"
command = ~F, D, DF, x
time = 30

[Command]
name = "upper_y"
command = ~F, D, DF, y
time = 30

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
time = 30

[Command]
name = "QCF_x"
command = ~D, DF, F, x
time = 30

[Command]
name = "QCF_y"
command = ~D, DF, F, y
time = 30

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y
time = 30

[Command]
name = "QCB_x"
command = ~D, DB, B, x
time = 30

[Command]
name = "QCB_y"
command = ~D, DB, B, y
time = 30

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y
time = 30

[Command]
name = "QCF_a"
command = ~D, DF, F, a
time = 30

[Command]
name = "QCB_a"
command = ~D, DB, B, a
time = 30

[Command]
name = "QCF_b"
command = ~D, DF, F, b
time = 30

[Command]
name = "QCB_b"
command = ~D, DB, B, b
time = 30

[Command]
name = "QCF_c"
command = ~D, DF, F, c
time = 30

[Command]
name = "QCB_c"
command = ~D, DB, B, c
time = 30

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
time = 30

[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b
time = 30

[Command]
name = "QCF_ac"
command = ~D, DF, F, a+c
time = 30

[Command]
name = "QCB_ac"
command = ~D, DB, B, a+c
time = 30

[Command]
name = "QCF_bc"
command = ~D, DF, F, b+c
time = 30

[Command]
name = "QCB_bc"
command = ~D, DB, B, b+c
time = 30

[Command]
name = "FF_ab"
command = F, F, a+b
time = 30

[Command]
name = "FF_a"
command = F, F, a
time = 30

[Command]
name = "FF_b"
command = F, F, b
time = 30

[Command]
name = "FF_c"
command = F, F, c
time = 30

[Command]
name = "DD_ab"
command = D, D, a+b
time = 30

[Command]
name = "DD_a"
command = D, D, a
time = 30

[Command]
name = "DD_b"
command = D, D, b
time = 30

[Command]
name = "DD_c"
command = D, D, c
time = 30

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a
time = 1

[Command]
name = "recovery";Required (do not remove)
command = b
time = 1

[Command]
name = "recovery";Required (do not remove)
command = c
time = 1

[Command]
name = "dodge";Required (do not remove)
command = a+b
time = 1
;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1
;-| Super Jump |-----------------------------------------------------------
[Command]
name = "superjump"     ;Required (do not remove)
command = ~$D, $U
time = 8
buffer.Time=8

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;====================<HOLD BUTTON>====================

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_x"
command = /a
time = 1

[Command]
name = "hold_y"
command = /b
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 3100
triggerall = command = "QCFFB_ab"
triggerall = statetype != A
triggerall = var(51) = 1
TriggerAll = Power>= 3000
TriggerAll = var(50)>= 2000
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact ;stateno = 204 && animelemtime(7) >= 0
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
;[State -1, Light Kung Fu Zankou]
;type = ChangeState
;value = 1111
;triggerall = command = "2QCB_ab" ;|| command = "2QCB_ac" || command = "2QCB_bc"
;triggerall = statetype != A
;TriggerAll = Power>2000
;trigger1 = ctrl
;trigger2 = stateno = 200 && Movecontact
;trigger3 = stateno = 201 && Movecontact
;trigger4 = stateno = 202 && Movecontact
;trigger5 = stateno = 203 && Movecontact
;trigger6 = stateno = 203 && Movecontact ;stateno = 204 && animelemtime(7) >= 0
;trigger7 = stateno = 205 && Movecontact
;trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
;trigger9 = Numhelper(2040) && movecontact
;trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
;trigger11 = stateno = 206 && Movecontact
;trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
;trigger13 = stateno = 701 && Movecontact
;trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
;trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1110
triggerall = command = "2QCF_ab"
triggerall = statetype != A
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0 || stateno = 1050 && animelemtime(14) >= 0 || stateno = 1051 && animelemtime(15) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1111
triggerall = command = "2QCB_ab"
triggerall = statetype != A
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0 || stateno = 1050 && animelemtime(14) >= 0 || stateno = 1051 && animelemtime(15) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1201
triggerall = command = "DD_ab"
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
;triggerall= NumHelper(1260) = 0 && helper,stateno != 21555  || NumHelper(1261) = 0 && helper,stateno != 21555 || NumHelper(1262) = 0 && helper,stateno != 21555
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0 || stateno = 1050 && animelemtime(14) >= 0 || stateno = 1051 && animelemtime(15) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 2100
triggerall = command = "QCF_c"
TriggerAll = Power>1000
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
trigger8 = stateno = 1002 && animelemtime(12) >= 0 || stateno = 1003 && animelemtime(13) >= 0
trigger9 = stateno = 1052 && animelemtime(12) >= 0 || stateno = 1053 && animelemtime(13) >= 0
trigger10 = Numhelper(2042) && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 2000
triggerall = command = "QCF_c"
triggerall = statetype != A
TriggerAll = Power>1000
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0 || stateno = 1050 && animelemtime(14) >= 0 || stateno = 1051 && animelemtime(15) >= 0 || stateno = 1110 && animelemtime(6) >= 0 || stateno = 1111 && animelemtime(6) >= 0
trigger9 = stateno = 206 && Movecontact
trigger10 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger11 = stateno = 701 && Movecontact
trigger12 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger13 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger14 = Numhelper(2040) && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 3000
triggerall = command = "QCB_c"
triggerall = statetype != A
TriggerAll = Power>2000
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0 || stateno = 1050 && animelemtime(14) >= 0 || stateno = 1051 && animelemtime(15) >= 0 || stateno = 1110 && animelemtime(6) >= 0 || stateno = 1111 && animelemtime(6) >= 0

trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1053
triggerall = command = "QCB_ab"
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
trigger8 = stateno = 1002 && animelemtime(12) >= 0 || stateno = 1003 && animelemtime(13) >= 0
trigger9 = Numhelper(2043) && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1052
triggerall = command = "QCF_ab"
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
trigger8 = stateno = 1002 && animelemtime(12) >= 0 || stateno = 1003 && animelemtime(13) >= 0
trigger9 = Numhelper(2042) && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1051
triggerall = command = "QCB_ab"
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && Movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1050
triggerall = command = "QCF_ab"
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && Movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1002
triggerall = command = "QCF_a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 715
triggerall = command = "2QCB_ab"
triggerall = statetype = A
TriggerAll =  var(51) = 1 || var(50) >= 500 ;Power>500
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
trigger8 = stateno = 207 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 707
triggerall = command = "2QCB_a"
triggerall = statetype = A
trigger1 = ctrl ;Use combo condition (above)
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && movecontact
trigger8 = stateno = 845 && animelemtime(8) >= 0
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1101
triggerall = command = "2QCB_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0

trigger10 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 701 && Movecontact
trigger13 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger14 = stateno = 722 && Movecontact
trigger15 = Numhelper(2040) && movecontact
trigger16 = stateno = 1100 && animelemtime(6) >= 0
trigger17 = stateno = 810 && animelemtime(6) >= 0
;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1003
triggerall = command = "QCB_a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact
trigger8 = stateno = 207 && Movecontact

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 708
triggerall = command = "DD_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 722 && Movecontact
;;
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1001
triggerall = command = "QCB_a"
triggerall = statetype != A
trigger1 = ctrl ;Use combo condition (above)
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 204 && animelemtime(8) >= 0
trigger9 = stateno = 206 && Movecontact
trigger10 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger11 = stateno = 701 && Movecontact || stateno = 705 && Movecontact || stateno = 706 && Movecontact
trigger12 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger13 = Numhelper(2040) && movecontact
trigger14 = Numhelper(2041) && movecontact
;
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 700
triggerall = command = "QCB_b"
triggerall = statetype = A
trigger1 = ctrl ;Use combo condition (above)
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 300 && Movecontact
trigger7 = stateno = 700 && Movecontact || stateno = 701 && Movecontact || stateno = 715 && Movecontact && animelemtime(8) >= 0
trigger8 = stateno = 704 && Movecontact
trigger9 = stateno = 207 && Movecontact
;---------------------------------------------------------------------------
[State -1, Roman Cancel]
type = ChangeState
value = 6501
triggerall = !ishelper
triggerall = !AIlevel
triggerall =  movetype != H
triggerall = statetype = A
triggerall = command = "x" && var(50)>= 500;power >= 1000
triggerall = !ctrl
triggerall = stateno != 8000
trigger1 = movecontact
trigger2 = numhelper > 0
trigger2 = helper,movecontact
trigger3 = helper(2042),movecontact || helper(2043),movecontact
;---------------------------------------------------------------------------
[State -1, Roman Cancel]
type = ChangeState
value = 6500
triggerall = !ishelper
triggerall = !AIlevel
triggerall =  movetype != H
triggerall = statetype != A
triggerall = command = "x" && var(50)>= 500;power >= 1000
triggerall = !ctrl
triggerall = stateno != 8000
trigger1 = movecontact
trigger2 = numhelper > 0
trigger2 = helper,movecontact
trigger3 = helper(2040),movecontact || helper(2041),movecontact
;--------------------------------------------------------------------------------
;[State -1, power charge] (This state is a W.I.P)
;type = ChangeState
;value = 900
;triggerall = AIlevel<=0
;triggerall = StateType != A
;triggerall = power < const(data.power) && power < PowerMax
;triggerall = stateno != 900
;trigger1 = command = "hold_c" && command = "hold_z"
;trigger1 = Ctrl

[State -1];dodge
type = ChangeState
value = 107
triggerall = !ishelper
triggerall = command = "dodge"
triggerall = statetype = A
trigger1 = ctrl

[State -1];dodge
type = ChangeState
value = 106
triggerall = !ishelper
triggerall = command = "dodge"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = (ctrl || (StateNo = [100,101]))

[State -1];dodge
type = ChangeState
value = 104
triggerall = !ishelper
triggerall = command = "dodge"
;triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 5120 && time >= 3
;trigger3 = Statetype = L && time > 3

[State -1];dodge(back)
type = ChangeState
value = 105 ;105
triggerall = !ishelper
triggerall = command = "dodge"
triggerall = command = "holdback"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 5120 && time >= 3
;trigger3 = Statetype = L && time > 3

[State -1, Burst]
type = ChangeState
value = 950
triggerall = command = "y"
triggerall = var(50) > 2999
triggerall = var(51) = 0
triggerall = alive && Roundstate = 2
trigger1 = ctrl

;[State -1, Burst]
;type = ChangeState
;value = 950
;triggerall = var(50) = 1
;triggerall = command = "dodge"
;triggerall = alive && Roundstate = 2
;triggerall = movetype = H
;triggerall = enemy,hitdefattr != SCA,HA,HP,AT
;triggerall = stateno != [120,155]
;triggerall = stateno != [800,899]
;triggerall = stateno != [3000,4999]
;trigger1 = !ctrl
;trigger2 = numenemy
;trigger2 = enemy,movehit && p2stateno != [3000,4999]
;trigger3 = enemy,numhelper
;trigger3 = movetype = H && p2stateno != [3000,4999]
;trigger4 = numenemy
;trigger4 = enemy,movehit && p2stateno != [800,899]

[State -1, Super Jump]
type = ChangeState
value = 2017
triggerall = Command = "holdup"
trigger1 = stateno = 705 && movehit || stateno = 706 && movehit
trigger2 =  stateno = 810 && animelemtime(8) >= 0

[State -1, Super Jump]
type = ChangeState
value = 2016
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "superjump"
;---------------------------------------------------------------------------
[State -1, Counter]
type = ChangeState
value = 800
triggerall = !var(59)
triggerall = statetype != A
triggerall = stateno != 801
triggerall = time <= 6 && stateno = [150,155]
trigger1 = command = "z"
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 716
triggerall = command = "QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0 
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1200
triggerall = command = "DD_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 714
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 =  stateno = 1100 && animelemtime(6) >= 0 || stateno = 1110 && animelemtime(6) >= 0 ||  stateno = 104 && animelemtime(6) >= 0 || stateno = 1101 && animelemtime(9) >= 0
trigger11 = stateno = 206 && Movecontact
trigger12 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 706 && Movecontact || stateno = 705 && Movecontact
trigger15 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 702
triggerall = command = "DD_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
trigger9 = Numhelper(2040) && movecontact
trigger10 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger13 = stateno = 701 && Movecontact
trigger14 = stateno = 705 && Movecontact || stateno = 706 && movecontact
trigger15 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 704
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 300 && Movecontact
trigger7 = stateno = 845 && animelemtime(4) >= 0
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 705
triggerall = command = "c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact || stateno = 201 && Movecontact || stateno = 202 && Movecontact || (stateno = [400,402]) && Movecontact
trigger3 = stateno = 203 && Movecontact || stateno = 204 && Movecontact
trigger4 = stateno = 205 && Movecontact
trigger5 = stateno = 1000 && animelemtime(12) >= 0
trigger6 = Numhelper(2040) && movecontact
trigger7 = stateno = 206 && Movecontact
trigger8 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger9 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger10 = stateno = 701 && Movecontact || stateno = 706 && Movecontact
trigger11 = stateno = 403 && Movecontact
trigger12 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Upper
;[State -1, Light Kung Fu Upper]
;type = ChangeState
;value = 1100
;triggerall = command = "upper_x"
;trigger1 = var(1) ;Use combo condition (above)
;
;---------------------------------------------------------------------------
;Strong Kung Fu Upper
;[State -1, Strong Kung Fu Upper]
;type = ChangeState
;value = 1110
;triggerall = command = "upper_y"
;trigger1 = var(1) ;Use combo condition (above)
;
;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
;[State -1, Fast Kung Fu Blow]
;type = ChangeState
;value = 1220
;triggerall = command = "QCB_xy"
;triggerall = power >= 330
;trigger1 = var(1) ;Use combo condition (above)
;
;---------------------------------------------------------------------------
;Light Kung Fu Blow
;[State -1, Light Kung Fu Blow]
;type = ChangeState
;value = 1110
;triggerall = command = "QCB_x"
;trigger1 = var(1) ;Use combo condition (above)
;
;---------------------------------------------------------------------------
;Strong Kung Fu Blow
;[State -1, Strong Kung Fu Blow]
;type = ChangeState
;value = 1210
;triggerall = command = "QCB_y"
;trigger1 = var(1) ;Use combo condition (above)
;
;---------------------------------------------------------------------------
;High Kung Fu Blocking (High)
;[State -1, High Kung Fu Blocking High]
;type = ChangeState
;value = 1300
;triggerall = command = "blocking"
;triggerall = command != "holddown"
;trigger1 = ctrl
;trigger1 = statetype != A
;trigger2 = stateno = 1310 || stateno = 1330
;trigger2 = time > 0
;
;---------------------------------------------------------------------------
;High Kung Fu Blocking (Low)
;[State -1, High Kung Fu Blocking Low]
;type = ChangeState
;value = 1320
;triggerall = command = "blocking"
;triggerall = command = "holddown"
;trigger1 = ctrl
;trigger1 = statetype != A
;trigger2 = stateno = 1310 || stateno = 1330
;trigger2 = time > 0
;
;---------------------------------------------------------------------------
;High Kung Fu Blocking (Air)
;[State -1, High Kung Fu Blocking Low]
;type = ChangeState
;value = 1340
;triggerall = command = "blocking"
;triggerall = command != "holdup"
;triggerall = command != "holddown"
;trigger1 = ctrl
;trigger1 = statetype = A
;trigger2 = stateno = 1350
;trigger2 = time > 0
;
;---------------------------------------------------------------------------
;Far Kung Fu Zankou
;[State -1, Far Kung Fu Zankou]
;type = ChangeState
;value = 1420
;triggerall = command = "QCF_ab"
;triggerall = power >= 330
;trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1100
triggerall = command = "2QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0

trigger10 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 701 && Movecontact || stateno = 706 && Movecontact
trigger13 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger14 = stateno = 722 && Movecontact
trigger15 = Numhelper(2040) && movecontact
trigger16 = stateno = 1100 && animelemtime(6) >= 0
trigger17 = stateno = 810 && animelemtime(6) >= 0
;-------------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 206 && Movecontact
trigger9 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger10 = stateno = 701 && Movecontact || stateno = 706 && Movecontact
trigger11 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger12 = stateno = 722 && Movecontact
trigger13 = Numhelper(2040) && movecontact
;-------------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 713
triggerall = command = "2QCF_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact
trigger5 = stateno = 203 && Movecontact
trigger6 = stateno = 204 && Movecontact
trigger7 = stateno = 205 && Movecontact
trigger8 = stateno = 206 && Movecontact
trigger11 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger12 = stateno = 701 && Movecontact || stateno = 706 && Movecontact
trigger13 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger14 = stateno = 722 && Movecontact
trigger15 = Numhelper(2040) && movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
;[State -1, Strong Kung Fu Zankou]
;type = ChangeState
;value = 1410
;triggerall = command = "QCF_b"
;trigger1 = var(1) ;Use combo condition (above)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 102
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;--------------------------------------------------------------------------------
[State -1, Air Jump]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = statetype = A
triggerall = var(45) = 1
trigger1 = ctrl && vel y > 0
trigger2 = (stateno = [600,603]) && movecontact || (stateno = [611,622]) && movecontact
trigger3 = (stateno = [207,208]) && movecontact || stateno = 714 && Movecontact || stateno = 219 && Movecontact
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 110
TriggerAll = Alive!=0
TriggerAll = command="FF"
TriggerAll = StateType=A
TriggerAll = anim!=110
trigger1 = ctrl
trigger2 = stateno = 111 && time >= 5
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 111
TriggerAll = Alive!=0
TriggerAll = command="BB"
TriggerAll = StateType=A
TriggerAll = anim!=111
trigger1 = ctrl
trigger2 = stateno = 110 && time >= 5
;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Grab]
type = ChangeState
value = 800
triggerall = !ishelper
triggerall = command = "z"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100
;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Grab]
type = ChangeState
value = 840
triggerall = !ishelper
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && Movecontact
trigger3 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger4 = stateno = 602 && Movecontact
trigger5 = stateno = 622 && Movecontact  || stateno = 603 && Movecontact
trigger6 = stateno = 704 && movecontact || stateno = 708 && movecontact ||  stateno = 845 && animelemtime(4) >= 0 ||  stateno = 713
trigger7 = stateno = 300 && Movecontact || stateno = 708 && Movecontact || stateno = 716 && Movecontact
;---------------------------------------------------------------------------
[State -1, 5A]
type = ChangeState
value = 200
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = 400) && Movecontact

;---------------------------------------------------------------------------
[State -1, 5AA]
type = ChangeState
value = 201
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 200 || stateno = 722
trigger1 = Movecontact

;---------------------------------------------------------------------------
[State -1, 5AAA]
type = ChangeState
value = 202
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 201 || stateno = 722
trigger1 = Movecontact

;---------------------------------------------------------------------------
[State -1, 5B]
type = ChangeState
value = 203
triggerall = !ishelper
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = 400) && Movecontact
trigger3 = stateno = 401 && Movecontact
trigger4 = stateno = 200 && Movecontact
trigger5 = stateno = 201 && Movecontact
trigger6 = stateno = 202 && Movecontact
trigger7 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
[State -1, 5BB]
type = ChangeState
value = 204
triggerall = !ishelper
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = stateno = 203
trigger1 = movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
;[State -1, Light Kung Fu Palm]
;type = ChangeState
;value = 403
;triggerall = command = "holdfwd" && command = "c"
;triggerall = command = "holddown"
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 && Movecontact
;trigger3 = stateno = 201 && Movecontact
;trigger4 = stateno = 202 && Movecontact
;trigger5 = stateno = 203 && Movecontact
;trigger6 = stateno = 204 && Movecontact
;trigger7 = stateno = 205 && Movecontact
;trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
;trigger9 = Numhelper(2040) && movecontact
;trigger10 = stateno = 206 && Movecontact
;trigger11 = stateno = 400 && Movecontact
;trigger12 = stateno = 401 && Movecontact
;trigger13 = stateno = 701 && Movecontact
;trigger14 = stateno = 403 && Movecontact
;trigger15 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 706
triggerall = command = "c"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 402 && Movecontact || stateno = 403 && Movecontact
trigger3 = stateno = 200 && Movecontact || stateno = 201 && Movecontact
trigger4 = stateno = 202 && Movecontact || stateno = 203 && Movecontact 
trigger5 = stateno = 205 && Movecontact
trigger6 = stateno = 206 && Movecontact
trigger7 = stateno = 722 && Movecontact
trigger8 = stateno = 1000 && animelemtime(12) >= 0 || stateno = 1001 && animelemtime(13) >= 0
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 205
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6
trigger4 = stateno = 200 && Movecontact || stateno = 201 && Movecontact || stateno = 202 && Movecontact || (stateno = [400,402]) && Movecontact
trigger5 = stateno = 203 && Movecontact || stateno = 204 && Movecontact
trigger6 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 206
triggerall = !ishelper
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = stateno = 205
trigger1 = movecontact
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = 400) && Movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 401
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact
trigger3 = stateno = 200 && Movecontact
trigger4 = stateno = 201 && Movecontact
trigger5 = stateno = 202 && Movecontact
trigger6 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 402
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact || stateno = 401 && Movecontact
trigger3 = stateno = 403 && Movecontact
trigger4 = stateno = 200 && Movecontact
trigger5 = stateno = 201 && Movecontact
trigger6 = stateno = 202 && Movecontact
trigger7 = stateno = 203 && Movecontact
trigger8 = stateno = 203 && Movecontact ;stateno = 204 && animelemtime(7) >= 0
trigger9 = stateno = 722 && Movecontact
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 700 && Movecontact || stateno = 701 && Movecontact || stateno = 715 && Movecontact && animelemtime(8) >= 0
trigger4 = stateno = 207 && Movecontact
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 601
triggerall = !ishelper
triggerall = command = "a"
trigger1 = stateno = 600
trigger1 = AnimElemTime (5) >= 0 && AnimElemTime (7) <= 0
trigger2 = stateno = 600
trigger2 = movecontact ;Air blocking
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 611
triggerall = !ishelper
triggerall = command = "a"
trigger1 = stateno = 601
trigger1 = AnimElemTime (3) >= 0 && AnimElemTime (7) <= 0
trigger2 = stateno = 601
trigger2 = movecontact ;Air blocking
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 602
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 && Movecontact
trigger4 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger5 = stateno = 700 && Movecontact || stateno = 701 && Movecontact || stateno = 715 && Movecontact && animelemtime(8) >= 0
trigger6 = stateno = 207 && Movecontact
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 603
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 && Movecontact
trigger4 = stateno = 611 && Movecontact || stateno = 601 && Movecontact
trigger5 = stateno = 602 && Movecontact
trigger6 = stateno = 622 && Movecontact 
trigger7 = stateno = 700 && Movecontact || stateno = 701 && Movecontact || stateno = 715 && Movecontact && animelemtime(8) >= 0
trigger8 = stateno = 207 && Movecontact
;--------------------------------------------------------------------------------