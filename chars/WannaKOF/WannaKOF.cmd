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
;   a fast attack, such as WannaKOF's light punch.
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
;Either one will be detected by a "command = BodegaAmazing" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "BodegaAmazing"
command = ~D, DF, F, x+y
time = 20

[Command]
name = "BodegaAmazing"   ;Same name as above
command = ~D, DF, F, y+z
time = 20

[Command]
name = "BodegaAmazing"   ;Same name as above
command = ~D, DF, F, x+z
time = 20

[Command]
name = "BodegaDeezNuts"
command = ~D, DF, F, a+b
time = 20

[Command]
name = "BodegaDeezNuts"   ;Same name as above
command = ~D, DF, F, b+c
time = 20

[Command]
name = "BodegaDeezNuts"   ;Same name as above
command = ~D, DF, F, a+c
time = 20

[Command]
name = "SuperOrochiBrothers"
command = ~D, DF, F, x+a
time = 20

[Command]
name = "SuperOrochiBrothers"   ;Same name as above
command = ~D, DF, F, y+b
time = 20

[Command]
name = "SuperOrochiBrothers"   ;Same name as above
command = ~D, DF, F, z+c
time = 20

[Command]
name = "ProtagonistPairUp"
command = ~D, DB, B, x+a
time = 20

[Command]
name = "ProtagonistPairUp"   ;Same name as above
command = ~D, DB, B, y+b
time = 20

[Command]
name = "ProtagonistPairUp"   ;Same name as above
command = ~D, DB, B, z+c
time = 20

[Command]
name = "TheEndofKOF"
command = ~D, DB, B, x+y
time = 20

[Command]
name = "TheEndofKOF"   ;Same name as above
command = ~D, DB, B, y+z
time = 20

[Command]
name = "TheEndofKOF"   ;Same name as above
command = ~D, DB, B, x+z
time = 20

[Command]
name = "KusanaginoKobushi"
command = ~B, D, DB, a+b
time = 20

[Command]
name = "KusanaginoKobushi"   ;Same name as above
command = ~B, D, DB, b+c
time = 20

[Command]
name = "KusanaginoKobushi"   ;Same name as above
command = ~B, D, DB, a+c
time = 20

[Command]
name = "KusanaginoKobushi"   ;Same name as above
command = ~DB, DB, a+b
time = 20

[Command]
name = "KusanaginoKobushi"   ;Same name as above
command = ~DB, DB, b+c
time = 20

[Command]
name = "KusanaginoKobushi"   ;Same name as above
command = ~DB, DB, a+c
time = 20

[Command]
name = "YouCantEscape"
command = ~F, DF, D, DB, B, a+b
time = 20

[Command]
name = "YouCantEscape"   ;Same name as above
command = ~F, DF, D, DB, B, b+c
time = 20

[Command]
name = "YouCantEscape"   ;Same name as above
command = ~F, DF, D, DB, B, a+c
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "Teriaki_x"
command = ~F, D, DF, x

[Command]
name = "Teriaki_x"
command = ~DF, DF, x

[Command]
name = "Teriaki_y"
command = ~F, D, DF, y

[Command]
name = "Teriaki_y"
command = ~DF, DF, y

[Command]
name = "Teriaki_z"
command = ~F, D, DF, z

[Command]
name = "Teriaki_z"
command = ~DF, DF, z

[Command]
name = "127"
command = ~F, DF, D, DB, B, x

[Command]
name = "127"
command = ~F, DF, D, DB, B, y

[Command]
name = "127_z"
command = ~F, DF, D, DB, B, z

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_z"
command = ~D, DF, F, z

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_c"
command = ~D, DF, F, c

[Command]
name = "HitByABitch"
command = ~D, DB, B, x

[Command]
name = "ShikisNewToMe"
command = ~D, DB, B, y

[Command]
name = "ManintheMirror"
command = ~D, DB, B, z

[Command]
name = "GrabbySam_a"
command = ~F, DF, D, DB, B, a

[Command]
name = "GrabbySam_b"
command = ~F, DF, D, DB, B, b

[Command]
name = "GrabbySam_c"
command = ~F, DF, D, DB, B, c

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "RED_a"
command = ~B, D, DB, a

[Command]
name = "RED_b"
command = ~B, D, DB, b

[Command]
name = "RED_a"
command = ~DB, DB, a

[Command]
name = "RED_b"
command = ~DB, DB, b

[Command]
name = "RED_c"
command = ~B, D, DB, c

[Command]
name = "RED_c"
command = ~DB, DB, c


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
command = x+y
time = 1

[Command]
name = "recovery";Required (do not remove)
command = y+b
time = 1

[Command]
name = "Throw"
command = x+a
time = 1

[Command]
name = "Roll"
command = y+b
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
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

[State -1, VarSet]
type = VarSet
triggerall = var(59) < 1
triggerall = roundstate = 2
trigger1 = AILevel > 0
v = 59
value = 1
ignorehitpause = 1

[State -1, VarSet]
type = VarSet
trigger1 = var(59) > 0
trigger1 = roundstate != 2
trigger2 = !ishelper 
trigger2 = AILevel = 0
v = 59
value = 0
ignorehitpause = 1

;===========================================================================
;---------------------------------------------------------------------------
;The End of King of Fighters (uses one super bar)
[State -1, The End of King of Fighters]
type = ChangeState
value = 3300
triggerall = var(59) = 0
triggerall = command = "TheEndofKOF"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;Protagonist Pair-Up (uses two super bars)
[State -1, Protagonist Pair-Up]
type = ChangeState
value = 3500
triggerall = var(59) = 0
triggerall = command = "ProtagonistPairUp"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = partner, name = "The Pin-Headed Son" 
triggerall = numpartner
triggerall = partner, alive
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3500)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Super Orochi Brothers (uses one super bar)
[State -1, Super Orochi Brothers]
type = ChangeState
value = 3400
triggerall = var(59) = 0
triggerall = !numhelper(3401)
triggerall = command = "SuperOrochiBrothers"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;You Cant Escape! (uses one super bar)
[State -1, You Cant Escape!]
type = ChangeState
value = 3200
triggerall = var(59) = 0
triggerall = command = "YouCantEscape"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;Kusanagi no Kobushi (uses one super bar)
[State -1, Kusanagi no Kobushi]
type = ChangeState
value = 3100
triggerall = var(59) = 0
triggerall = command = "KusanaginoKobushi"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;Bodega Deez Nuts (uses one super bar)
[State -1, Bodega Deez Nuts]
type = ChangeState
value = 3050
triggerall = var(59) = 0
triggerall = command = "BodegaDeezNuts"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;"Bodega, Amazing!" (uses one super bar)
[State -1, Bodega Amazing!]
type = ChangeState
value = 3000
triggerall = var(59) = 0
triggerall = command = "BodegaAmazing"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3500)
trigger2 = movecontact
trigger3 = stateno = 1101
trigger4 = stateno = 1301
trigger5 = stateno = 1441
trigger6 = stateno = 1505

;---------------------------------------------------------------------------
;Magatamakeri
[State -1, Magatamakeri]
type = ChangeState
value = 1520
triggerall = var(59) = 0
triggerall = !numhelper(1521)
triggerall = command = "QCF_c"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;75 Shiki Esakai (Air)
[State -1, 75 Shiki Esakai (Air)]
type = ChangeState
value = 1503
triggerall = var(59) = 0
triggerall = command = "QCF_a" || command = "QCF_b" || command = "QCF_c"
trigger1 = ctrl
trigger1 = statetype = A
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact

;---------------------------------------------------------------------------
;Goodbye Esakai Beyond the Limit
[State -1, Goodbye Esakai Beyond the Limit]
type = ChangeState
value = 1502
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1501
trigger1 = movecontact | time >= 16

;---------------------------------------------------------------------------
;Esakai Continues
[State -1, Esakai Continues]
type = ChangeState
value = 1501
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1500
trigger1 = movecontact | time >= 16

;---------------------------------------------------------------------------
;75 Shiki Esakai
[State -1, 75 Shiki Esakai]
type = ChangeState
value = 1500
triggerall = var(59) = 0
triggerall = command = "QCF_a" || command = "QCF_b"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Surprise Bodega Grab
[State -1, Surprise Bodega Grab]
type = ChangeState
value = 1405
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1403
trigger1 = movecontact || time >= 8
trigger1 = time <= 24
trigger2 = stateno = 1404
trigger2 = movecontact || time >= 10
trigger2 = time <= 18

;---------------------------------------------------------------------------
;Chokeslam!
[State -1, Chokeslam!]
type = ChangeState
value = 1430
triggerall = var(59) = 0
triggerall = command = "QCF_z"
trigger1 = stateno = 1402
trigger1 = movecontact || time >= 12
trigger1 = time <= 25
trigger2 = stateno = 1403
trigger2 = movecontact || time >= 8
trigger2 = time <= 24
trigger3 = stateno = 1404
trigger3 = movecontact || time >= 10
trigger3 = time <= 18

;---------------------------------------------------------------------------
;Surprise Bodega 2
[State -1, Surprise Bodega 2]
type = ChangeState
value = 1404
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 1403
trigger1 = movecontact || time >= 8
trigger1 = time <= 24

;---------------------------------------------------------------------------
;Surprise Bodega
[State -1, Surprise Bodega]
type = ChangeState
value = 1403
triggerall = var(59) = 0
triggerall = command = "QCF_x" || command = "QCF_y"
trigger1 = stateno = 1402
trigger1 = movecontact || time >= 12
trigger1 = time <= 25

;---------------------------------------------------------------------------
;Mr. Grabby Sam's Doubletap
[State -1, Mr. Grabby Sam's Doubletap]
type = ChangeState
value = 1440
triggerall = var(59) = 0
triggerall = command = "Teriaki_x" || command = "Teriaki_y" || command = "Teriaki_z"
triggerall = statetype != A
trigger1 = var(10)
trigger1 = stateno = 1406
trigger1 = time >= 25

;---------------------------------------------------------------------------
;Mr. Grabby Sam
[State -1, Mr. Grabby Sam]
type = ChangeState
value = 1420
triggerall = var(59) = 0
triggerall = command = "GrabbySam_c"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Mr. Grabby Sam
[State -1, Mr. Grabby Sam]
type = ChangeState
value = 1410
triggerall = var(59) = 0
triggerall = command = "GrabbySam_b"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Mr. Grabby Sam
[State -1, Mr. Grabby Sam]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = command = "GrabbySam_a"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;It's called Rainbow Energy Dynamite? If you say so.
[State -1, It's called Rainbow Energy Dynamite? If you say so.]
type = ChangeState
value = 1320
triggerall = var(59) = 0
triggerall = command = "RED_c"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17
trigger25 = stateno = 1101
trigger26 = stateno = 1210
trigger26 = movecontact || time >= 16
trigger26 = time <= 35


;---------------------------------------------------------------------------
;Why is it called RED kick if nothing about it is red?
[State -1, Why is it called RED kick if nothing about it is red?]
type = ChangeState
value = 1310
triggerall = var(59) = 0
triggerall = command = "RED_b"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17
trigger25 = stateno = 1101
trigger26 = stateno = 1210
trigger26 = movecontact || time >= 16
trigger26 = time <= 35

;---------------------------------------------------------------------------
;Why is it called RED kick if nothing about it is red?
[State -1, Why is it called RED kick if nothing about it is red?]
type = ChangeState
value = 1300
triggerall = var(59) = 0
triggerall = command = "RED_a"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17
trigger25 = stateno = 1101
trigger26 = stateno = 1210
trigger26 = movecontact || time >= 16
trigger26 = time <= 35


;---------------------------------------------------------------------------
;Like a Record
[State -1, Like a Record]
type = ChangeState
value = 1120
triggerall = var(59) = 0
triggerall = command = "Teriaki_z"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Shiki's Only Teriaki
[State -1, Shiki's Only Teriaki]
type = ChangeState
value = 1100
triggerall = var(59) = 0
triggerall = command = "Teriaki_x"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Shiki's Only Teriaki
[State -1, Shiki's Only Teriaki]
type = ChangeState
value = 1110
triggerall = var(59) = 0
triggerall = command = "Teriaki_y"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Reverse Grip is the Best Way to Wield a Wine Bottle
[State -1, Reverse Grip is the Best Way to Wield a Wine Bottle]
type = ChangeState
value = 1032
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1031
trigger1 = movecontact || time >= 16
trigger1 = time <= 28

;---------------------------------------------------------------------------
;Seriously: Look it Up]
[State -1, Seriously: Look it Up]
type = ChangeState
value = 1031
triggerall = var(59) = 0
triggerall = command = "QCF_z"
trigger1 = stateno = 1030
trigger1 = movecontact || time >= 14
trigger1 = time <= 29

;---------------------------------------------------------------------------
;Bodega is Spanish for Wine Cellar
[State -1, Bodega is Spanish for Wine Cellar]
type = ChangeState
value = 1030
triggerall = var(59) = 0
triggerall = command = "QCF_z"
trigger1 = stateno = 1000
trigger1 = movecontact || time >= 16
trigger1 = time <= 32
trigger2 = stateno = 810
trigger2 = time >= 30
trigger2 = time < 56
trigger3 = stateno = 1010
trigger3 = movecontact || time >= 23

;---------------------------------------------------------------------------
;Kyo's Old Fireball
[State -1, Kyo's Old Fireball]
type = ChangeState
value = 1020
triggerall = var(59) = 0
triggerall = !numhelper(1021)
triggerall = command = "QCF_z"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact

;---------------------------------------------------------------------------
;402 The Sheikh Bats You and Me!
[State -1, 402 The Sheikh Bats You and Me!]
type = ChangeState
value = 1012
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
triggerall = command = "holdfwd"
trigger1 = stateno = 1011
trigger1 = movecontact || time >= 16
trigger1 = time <= 28

;---------------------------------------------------------------------------
;401 Macdonald-Cartier Freeway
[State -1, 401 Macdonald-Cartier Freeway]
type = ChangeState
value = 1011
triggerall = var(59) = 0
triggerall = command = "127"
trigger1 = stateno = 1010
trigger1 = movecontact || time >= 13
trigger1 = time <= 34

;---------------------------------------------------------------------------
;Galaga ze!
[State -1, Galaga ze!]
type = ChangeState
value = 1006
triggerall = var(59) = 0
triggerall = command = "127_z"
trigger1 = stateno = 1000
trigger1 = movecontact || time >= 16
trigger1 = time <= 32
trigger2 = stateno = 220
trigger2 = movecontact || time >= 15
trigger2 = time <= 24
trigger3 = stateno = 1010
trigger3 = movecontact || time >= 13
trigger3 = time <= 34
trigger4 = stateno = 810
trigger4 = time >= 30
trigger4 = time < 56

;---------------------------------------------------------------------------
;127 Shiki... You know Sabrina
[State -1, 127 Shiki... You know Sabrina]
type = ChangeState
value = 1004
triggerall = var(59) = 0
triggerall = command = "127"
trigger1 = stateno = 1000
trigger1 = movecontact || time >= 16
trigger1 = time <= 32
trigger2 = stateno = 220
trigger2 = movecontact || time >= 15
trigger2 = time <= 24
trigger3 = stateno = 810
trigger3 = time >= 30
trigger3 = time < 56

;---------------------------------------------------------------------------
;Hit by a BITCH
[State -1, Hit by a BITCH]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = command = "HitByABitch"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Forever Ravenous Eternal Night Zen Yari
[State -1, Forever Ravenous Eternal Night Zen Yari]
type = ChangeState
value = 1244
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1242
trigger1 = movecontact || time >= 13
trigger1 = time <= 24

;---------------------------------------------------------------------------
;Frentic Extreme Velocity Eagle Raid
[State -1, Frentic Extreme Velocity Eagle Raid]
type = ChangeState
value = 1243
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 1242
trigger1 = movecontact || time >= 13
trigger1 = time <= 24

;---------------------------------------------------------------------------
; Killer Instinct Crane Kick
[State -1, Killer Instinct Crane Kick]
type = ChangeState
value = 1242
triggerall = var(59) = 0
triggerall = command = "QCF_a" || command = "QCF_b" || command = "QCF_c"
trigger1 = stateno = 1241
trigger1 = movecontact || time >= 24

;---------------------------------------------------------------------------
;Aggressive Spin Strike
[State -1, Aggressive Spin Strike]
type = ChangeState
value = 1241
triggerall = var(59) = 0
triggerall = command = "QCF_a" || command = "QCF_b" || command = "QCF_c"
trigger1 = stateno = 1210
trigger1 = movecontact || time >= 16
trigger1 = time <= 35

;---------------------------------------------------------------------------
;Shiki's New To Me
[State -1, Shiki's New To Me]
type = ChangeState
value = 1210
triggerall = var(59) = 0
triggerall = command = "ShikisNewToMe"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Man in the Mirror
[State -1, Man in the Mirror]
type = ChangeState
value = 1220
triggerall = var(59) = 0
triggerall = command = "ManintheMirror"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact
trigger17 = stateno = 1000
trigger17 = movecontact || time >= 20
trigger18 = stateno = 1001
trigger18 = movecontact || time >= 14
trigger19 = stateno = 1002
trigger19 = movecontact || time >= 27
trigger20 = stateno = 1003
trigger20 = movecontact || time >= 31
trigger21 = stateno = 1004
trigger21 = movecontact || time >= 23
trigger22 = stateno = 1005
trigger22 = movecontact || time >= 22
trigger23 = stateno = 1010
trigger23 = movecontact || time >= 24
trigger24 = stateno = 1011
trigger24 = movecontact || time >= 17

;---------------------------------------------------------------------------
;Gah! She keyed my Mariachi!
[State -1, Gah! She keyed my Mariachi!]
type = ChangeState
value = 1005
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 1004
trigger1 = movecontact || time >= 24
trigger1 = time <= 34

;---------------------------------------------------------------------------
;125 She Keen - Nana Said So
[State -1, 125 She Keen - Nana Said So]
type = ChangeState
value = 1003
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 1001
trigger1 = movecontact || time >= 13
trigger1 = time <= 29
trigger2 = stateno = 1004
trigger2 = movecontact || time >= 24
trigger2 = time <= 34

;---------------------------------------------------------------------------
;Geh! She keyed my Mariachi!
[State -1, Geh! She keyed my Mariachi!]
type = ChangeState
value = 1002
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 1001
trigger1 = movecontact || time >= 13
trigger1 = time <= 29

;---------------------------------------------------------------------------
;128 She's Cold, Kiss!
[State -1, 128 She's Cold Kiss!]
type = ChangeState
value = 1001
triggerall = var(59) = 0
triggerall = command = "QCF_x" || command = "QCF_y"
trigger1 = stateno = 1000
trigger1 = movecontact || time >= 16
trigger1 = time <= 32
trigger2 = stateno = 810
trigger2 = time >= 30
trigger2 = time < 56

;---------------------------------------------------------------------------
;Kool Offensive Flurry
[State -1, Kool Offensive Flurry]
type = ChangeState
value = 1000
triggerall = var(59) = 0
triggerall = command = "QCF_x"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact

;---------------------------------------------------------------------------
;Kyo's Other Flurry
[State -1, Kyo's Other Flurry]
type = ChangeState
value = 1010
triggerall = var(59) = 0
triggerall = command = "QCF_y"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact || stateno = 211 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 221 && movecontact
trigger6 = stateno = 222 && movecontact
trigger7 = stateno = 223 && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 240 && movecontact
trigger10 = stateno = 250 && movecontact
trigger11 = stateno = 400 && movecontact
trigger12 = stateno = 410 && movecontact
trigger13 = stateno = 420 && movecontact
trigger14 = stateno = 430 && movecontact
trigger15 = stateno = 440 && movecontact
trigger16 = stateno = 450 && movecontact

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
value = 105
triggerall = var(59) = 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;The People's Judo Throw
[State -1, The People's Judo Throw]
type = ChangeState
value = 801
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Bodegrab
[State -1, Bodegrab]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Roll
[State -1, Roll]
type = ChangeState
value = 701
triggerall = var(59) = 0
triggerall = command = "Roll"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Roll
[State -1, Roll]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "Roll"
triggerall = statetype != A
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time >= 7
trigger2 = !movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 211
triggerall = var(59) = 0
triggerall = p2bodydist x <= 30
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = prevstateno = 0 || prevstateno = 12 || prevstateno = 20 || prevstateno = 100
trigger4 = (stateno = 211) && movecontact

;---------------------------------------------------------------------------
;Normal Bodega
[State -1, Normal Bodega]
type = ChangeState
value = 223
triggerall = var(59) = 0
triggerall = command = "a" || command = "b" || command = "c"
triggerall = command != "holddown"
triggerall = time <= 23
trigger1 = (stateno = 221) && movecontact
trigger2 = stateno = 221 && time >= 12

;---------------------------------------------------------------------------
;Normal Bodega
[State -1, Normal Bodega]
type = ChangeState
value = 222
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
triggerall = command != "holddown"
triggerall = time <= 23
trigger1 = (stateno = 221) && movecontact
trigger2 = stateno = 221 && time >= 12

;---------------------------------------------------------------------------
;Normal Bodega
[State -1, Normal Bodega]
type = ChangeState
value = 221
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
triggerall = command != "holddown"
triggerall = time <= 24
trigger1 = stateno = 220 && movecontact
trigger2 = stateno = 220 && time >= 15

;---------------------------------------------------------------------------
;Normal Bodega
[State -1, Normal Bodega]
type = ChangeState
value = 220
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) && movecontact
trigger3 = (stateno = 211) && movecontact
trigger4 = (stateno = 240) && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = prevstateno = 0 || prevstateno = 12 || prevstateno = 20 || prevstateno = 100
trigger4 = (stateno = 211) && movecontact
trigger5 = prevstateno = 211
trigger5 = (stateno = 210) && movecontact

;---------------------------------------------------------------------------
;Standing Roundhouse Kick
[State -1, Standing Roundhouse Kick]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) && movecontact
trigger3 = (stateno = 211) && movecontact
trigger4 = (stateno = 240) && movecontact

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Fierce Punch
[State -1, Crouching Fierce Punch]
type = ChangeState
value = 420
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 410
trigger2 = movecontact
trigger3 = stateno = 410
trigger3 = time >= 14
trigger4 = stateno = 440
trigger4 = movecontact

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = movecontact
trigger3 = stateno = 430
trigger3 = movecontact

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Sweep
[State -1, Crouching Sweep]
type = ChangeState
value = 450
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 410) || (stateno = 440)
trigger2 = movecontact


;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Fierce Punch
[State -1, Jump Fierce Punch]
type = ChangeState
value = 620
triggerall = var(59) = 0
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 || stateno = 640
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = var(59) = 0
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Fierce Kick
[State -1, Jump Fierce Kick]
type = ChangeState
value = 650
triggerall = var(59) = 0
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 || stateno = 640
trigger2 = movecontact


;---------------------------------------------------------------------------
;Bodega, AI ze!

;------SUPERS------

;Protagonist Pair-Up!
[State -1, AI]
type = ChangeState
value = 3500
triggerall = fvar(30) <= 4
triggerall = var(35) <= 0
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 2000
triggerall = numpartner
triggerall = partner, alive
triggerall = partner, name = "The Pin-Headed Son" 
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3500)
trigger2 = movecontact

;The End of KOF
[State -1, AI]
type = ChangeState
value = 3300
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 3000
trigger1 = p2bodydist y >= -95
trigger1 = stateno = 1000
trigger1 = movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger2 = p2bodydist y >= -95
trigger2 = stateno = 1001 || stateno = 1010  || stateno = 1404
trigger2 = movehit
trigger2 = random <= (AILevel * 90)
trigger2 = random <= (AILevel * 70)
trigger3 = p2bodydist y >= -75
trigger3 = stateno = 1210
trigger3 = movehit
trigger3 = random <= (AILevel * 90)
trigger3 = random <= (AILevel * 70)
trigger4 = p2bodydist x <= 130
trigger4 = p2bodydist y >= -95
trigger4 = ctrl || stateno = 101
trigger4 = enemynear, movetype = A
trigger4 = random <= (AILevel * 90)
trigger4 = random <= (AILevel * 70)

;"Bodega, Amazing!"
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
triggerall = fvar(30) < 3
trigger1 = stateno = 1002 || stateno = 1404
trigger1 = movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger2 = stateno = 1032
trigger2 = time >= 17
trigger2 = movehit
trigger2 = random <= (AILevel * 90)
trigger2 = random <= (AILevel * 70)
trigger3 = var(31) <= 0
trigger3 = fvar(30) < 3
trigger3 = power >= 3000
trigger3 = stateno = 1002 || stateno = 1404
trigger3 = movehit
trigger4 = p2bodydist y >= -65
trigger4 = fvar(30) < 3
trigger4 = power >= 3000
trigger4 = stateno = 1010 || stateno = 1210
trigger4 = movehit

;Bodega These Nuts
[State -1, AI]
type = ChangeState
value = 3050
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
trigger1 = fvar(30) >= 3
trigger1 = stateno = 1002 || stateno = 1404
trigger1 = movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger2 = fvar(30) >= 3
trigger2 = stateno = 1032
trigger2 = time >= 17
trigger2 = movehit
trigger2 = random <= (AILevel * 90)
trigger2 = random <= (AILevel * 70)
trigger3 = fvar(30) >= 3
trigger3 = power >= 3000
trigger3 = stateno = 1010 || stateno = 1210
trigger3 = movehit
trigger4 = var(31) <= 0
trigger4 = fvar(30) >= 3
trigger4 = power >= 3000
trigger4 = stateno = 1000
trigger4 = movehit
trigger5 = fvar(30) >= 3
trigger5 = power >= 3000
trigger5 = p2bodydist y >= -50
trigger5 = var(31) <= 0
trigger5 = stateno = 1000
trigger5 = movehit
trigger5 = random <= (AILevel * 90)
trigger5 = random <= (AILevel * 70)
trigger6 = fvar(30) >= 3
trigger6 = power >= 3000
trigger6 = p2bodydist y >= -50
trigger6 = stateno = 1001 || stateno = 1002 || stateno = 1010 || stateno = 1404
trigger6 = movehit
trigger6 = random <= (AILevel * 90)
trigger6 = random <= (AILevel * 70)

;Super Orochi Bros.
[State -1, AI]
type = ChangeState
value = 3400
triggerall = fvar(30) <= 1
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 2000
trigger1 = fvar(31) <= 0
trigger1 = var(1) <= 2
trigger1 = ctrl || stateno = 101
trigger1 = enemynear, movetype = A
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Bodega These Nuts or YOU CAN'T ESCAPE
[State -1, AI]
type = ChangeState
value = 3050+((random%2)*150)
triggerall = fvar(30) > 0 || enemynear, teammode = simul
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
trigger1 = p2bodydist x > 130
trigger1 = p2bodydist x <= 260
trigger1 = p2bodydist y >= -50
trigger1 = ctrl || stateno = 101
trigger1 = enemynear, movetype = A

;Bodega These Nuts or Kusanagi no Kobushi or YOU CAN'T ESCAPE
[State -1, AI]
type = ChangeState
value = 3050+((random%2)*(50+((random%2)*100)))
triggerall = fvar(30) <= 0
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
trigger1 = p2bodydist x > 130
trigger1 = p2bodydist x <= 260
trigger1 = p2bodydist y >= -50
trigger1 = ctrl || stateno = 101
trigger1 = enemynear, movetype = A

;YOU CAN'T ESCAPE
[State -1, AI]
type = ChangeState
value = 3200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
trigger1 = stateno = 1003
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)


;------NEUTRAL------

;Arxos Blocking AI
[State -1, AI]
type = changestate
triggerall = (var(59))&&(alive)&&(roundstate=2)
triggerall = !(enemynear,hitdefattr = SCA,AT,ST,HT,NT)
triggerall = ctrl
triggerall = enemynear, movetype != H && enemynear, facing != facing
triggerall = numhelper(12345)
trigger1 = enemynear, movetype = A
trigger1 = inguarddist
trigger1 = (random+helper(12345),var(56)) < 950
trigger2 = enemy,numproj = [2,4]
trigger2 = (random+helper(12345),var(56)) < 975
trigger3 = enemy,numproj >= 5
trigger3 = (random+helper(12345),var(56)) < 1000
trigger4 = (enemy,numhelper) = 1
trigger4 = helper(12345),var(55) = 0
trigger4 = (random+helper(12345),var(56)) < 950
trigger5 = ((enemy,numhelper) - helper(12345),var(55)) = [2,4]
trigger5 = (random+helper(12345),var(56)) < 975
trigger6 = ((enemy,numhelper) - helper(12345),var(55)) >= 5
trigger6 = (random+helper(12345),var(56)) < 1000
value = 120

;Bodega Punishment
[State -1, AI]
type = ChangeState
value = 1000+((random%2)*10)
triggerall = enemynear, movetype = A
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = facing != enemynear, facing
trigger1 = prevstateno = [120,160]
trigger1 = p2bodydist x <= 230
trigger1 = p2bodydist x > 60
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Roll (hopefully past projectiles) or try to Bodega through them
[State -1, AI]
type = ChangeState
value = 700+((random%2)*310)
triggerall = enemynear, movetype = A
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = facing != enemynear, facing
trigger1 = prevstateno != [120,160]
trigger1 = p2bodydist x <= 230
trigger1 = p2bodydist x > 60
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Roll or HIT BY A BITCH
[State -1, AI]
type = ChangeState
value = 700+((random%2)*500)
triggerall = enemynear, movetype = A
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = facing != enemynear, facing
trigger1 = p2bodydist x <= 60
trigger1 = p2bodydist x > 0
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Like a Record or HIT BY A BITCH (Attempt to escape or counter if the opponent dodges the Bodega moves)
[State -1, AI]
type = ChangeState
value = 1120+((random%2)*80)
triggerall = enemynear, movetype = A
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = stateno = 1000
trigger1 = time >= 20
trigger1 = !movecontact
trigger1 = random <= (AILevel * 81)
trigger1 = random <= (AILevel * 54)
trigger2 = stateno = 1001
trigger2 = time >= 15
trigger2 = !movecontact
trigger2 = random <= (AILevel * 81)
trigger2 = random <= (AILevel * 54)
trigger3 = stateno = 1002
trigger3 = time >= 27
trigger3 = !movecontact
trigger3 = random <= (AILevel * 81)
trigger3 = random <= (AILevel * 54)
trigger4 = stateno = 1010
trigger4 = time >= 24
trigger4 = !movecontact
trigger4 = random <= (AILevel * 81)
trigger4 = random <= (AILevel * 54)
trigger5 = stateno = 1011
trigger5 = time >= 17
trigger5 = !movecontact
trigger5 = random <= (AILevel * 81)
trigger5 = random <= (AILevel * 54)

;HIT BY A BITCH
[State -1, AI]
type = ChangeState
value = 1200
triggerall = enemynear, movetype = A
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 72) && random <= (AILevel * 58)
trigger1 = facing != enemynear, facing
trigger1 = p2bodydist x >= 60
trigger1 = p2bodydist x <= 95
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 81)
trigger1 = random <= (AILevel * 54)
trigger2 = facing = enemynear, facing
trigger2 = p2bodydist x >= -80
trigger2 = p2bodydist x <= 0
trigger2 = ctrl || stateno = 101
trigger2 = random <= (AILevel * 81)
trigger2 = random <= (AILevel * 54)

;Taunt
[State -1, AI]
type = ChangeState
value = 195
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = power < (powermax - 500)
trigger1 = p2bodydist x >= 195
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Throw
[State -1, AI]
type = ChangeState
value = 800
triggerall = fvar(30) <= 4
triggerall = fvar(31) <= 0
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = enemynear, movetype != H
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = var(1) >= fvar(30)
trigger1 = power < 1000
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -115
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 82)
trigger1 = random <= (AILevel * 64)

;Throw
[State -1, AI]
type = ChangeState
value = 800+random%2
triggerall = fvar(30) <= 4
triggerall = fvar(31) <= 0
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = enemynear, movetype != H
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = var(1) >= fvar(30)
trigger1 = power >= 1000
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -115
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 86)
trigger1 = random <= (AILevel * 67)

;Close Medium Punch or Crouch Light Kick
[State -1, AI]
type = ChangeState
value = 211+((random%2)*219)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -115
trigger1 = p2bodydist y <= -45
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Shiki's New To Me
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 95
trigger1 = p2bodydist y >= -150
trigger1 = p2bodydist y < -55
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Close Medium Punch
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -45
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Light Stand Punch or Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*230)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > 30
trigger1 = p2bodydist x <= 40
trigger1 = p2bodydist y >= -79
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kool Offensive Flurry
[State -1, AI]
type = ChangeState
value = 1000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = life >= 200
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 110
trigger1 = p2bodydist y >= -68
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Run Forward, Kyo's Other Flurry or Mr. Grabby Sam M
[State -1, AI]
type = ChangeState
value = 101+((random%2)*(909+((random%2)*400)))
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 175
trigger1 = p2bodydist y >= -68
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Run Forward or Kyo's Other Flurry
[State -1, AI]
type = ChangeState
value = 101+((random%2)*909)
triggerall = fvar(30) > 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 175
trigger1 = p2bodydist y >= -68
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kyo's Other Flurry or Mr. Grabby Sam M
[State -1, AI]
type = ChangeState
value = 1010+((random%2)*400)
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = enemynear, movetype = A
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 175
trigger1 = p2bodydist y >= -68
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kyo's Other Flurry
[State -1, AI]
type = ChangeState
value = 1010
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = enemynear, movetype != A
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 175
trigger1 = p2bodydist y >= -68
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kyo's Other Flurry
[State -1, AI]
type = ChangeState
value = 1010
triggerall = fvar(30) > 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5210
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist x <= 175
trigger1 = p2bodydist y >= -68
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Run Forward
[State -1, AI]
type = ChangeState
value = 101
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = var(1) <= 3
trigger1 = p2bodydist x >= 175
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kyo's Old Fireball, Rainbow Dynamite Energy, or Mr. Grabby Sam M
[State -1, AI]
type = ChangeState
value = 1020+((random%2)*(300+((random%2)*90)))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x > 175
trigger1 = p2bodydist x <= 200
trigger1 = p2bodydist y >= -98
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Kyo's Old Fireball, Rainbow Dynamite Energy, or Magatamakeri
[State -1, AI]
type = ChangeState
value = 1020+((random%2)*(300+((random%2)*200)))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x > 200
trigger1 = p2bodydist y >= -98
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Air Light Punch or Kick
[State -1, AI]
type = ChangeState
value = 600+((random%2)*30)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = p2bodydist x > -10
trigger1 = p2bodydist x <= 40
trigger1 = p2bodydist y >= -49
trigger1 = p2bodydist y <= 35
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Backdash
[State -1, AI]
type = ChangeState
value = 105
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = p2bodydist x <= 40
trigger1 = BackEdgeBodyDist > 35
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Escape the Corner
[State -1, AI]
type = ChangeState
value = 700
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = p2bodydist x <= 40
trigger1 = BackEdgeBodyDist <= 35
trigger1 = ctrl || stateno = 101
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;------Normals Blocked------

;Man in the Mirror or Mr. Grabby Sam
[State -1, AI]
type = ChangeState
value = 1220+((random%2)*190)
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = var(1) < 1
trigger1 = stateno = 200 || stateno = 211 || stateno = 230
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 109)
trigger2 = var(1) < 2
trigger2 = stateno = 210 || stateno = 240 || stateno = 250
trigger2 = moveguarded
trigger2 = random <= (AILevel * 94)
trigger2 = random <= (AILevel * 109)
trigger3 = var(1) < 4
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = moveguarded
trigger3 = random <= (AILevel * 94)
trigger3 = random <= (AILevel * 109)
trigger4 = var(1) < 3
trigger4 = stateno = 220 || stateno = 221 || stateno = 222 || stateno = 223
trigger4 = moveguarded
trigger4 = random <= (AILevel * 94)
trigger4 = random <= (AILevel * 109)

;Kyo's Old Fireball or Rainbow Energy Dynamite
[State -1, AI]
type = ChangeState
value = 1020+((random%2)*300)
triggerall = fvar(30) > 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = var(1) < 1
trigger1 = stateno = 200 || stateno = 211 || stateno = 230
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 109)
trigger2 = var(1) < 5
trigger2 = stateno = 210 || stateno = 240 || stateno = 250
trigger2 = moveguarded
trigger2 = random <= (AILevel * 94)
trigger2 = random <= (AILevel * 109)
trigger3 = var(1) < 4
trigger3 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440 || stateno = 450
trigger3 = moveguarded
trigger3 = random <= (AILevel * 94)
trigger3 = random <= (AILevel * 109)
trigger4 = var(1) < 3
trigger4 = stateno = 220 || stateno = 221 || stateno = 222 || stateno = 223
trigger4 = moveguarded
trigger4 = random <= (AILevel * 94)
trigger4 = random <= (AILevel * 109)

;------Attempt Easy 30 Hit Combo------

;Like a Record
[State -1, AI]
type = ChangeState
value = 1120
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = var(7) >= 8
trigger1 = var(31) > 0
trigger1 = stateno = 1000
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Not enough hits to attempt the 30 Hit Combo
[State -1, AI]
type = ChangeState
value = 1001+var(16)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = var(7) < 8
trigger1 = var(31) > 0
trigger1 = stateno = 1000
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Basic Combo / Bodega------

;Light Standing Kick
[State -1, AI]
type = ChangeState
value = 230
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 200
trigger1 = movecontact
trigger1 = p2bodydist y >= -70
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Close Medium Punch
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -110
trigger1 = stateno = 230
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Stand Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 210+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x > 30
trigger1 = p2bodydist x <= 85
trigger1 = p2bodydist y >= -82
trigger1 = stateno = 230
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Normal Bodega
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x > -25
trigger1 = p2bodydist x <= 30
trigger1 = p2bodydist y >= -44
trigger1 = prevstateno != 0
trigger1 = prevstateno != 1
trigger1 = prevstateno != 20
trigger1 = prevstateno != 100
trigger1 = stateno = 211
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)
trigger2 = p2bodydist y >= -54
trigger2 = stateno = 240
trigger2 = movecontact
trigger2 = random <= (AILevel * 94)
trigger2 = random <= (AILevel * 130)
trigger3 = p2bodydist y >= -42
trigger3 = prevstateno != 211
trigger3 = stateno = 210
trigger3 = movecontact
trigger3 = random <= (AILevel * 94)
trigger3 = random <= (AILevel * 130)

;Stand Medium Punch
[State -1, AI]
type = ChangeState
value = 210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -52
trigger1 = stateno = 211
trigger1 = prevstateno = 0 || prevstateno = 12 || prevstateno = 20 || prevstateno = 100
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Stand Medium Kick
[State -1, AI]
type = ChangeState
value = 240
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -42
trigger1 = stateno = 210
trigger1 = prevstateno = 211
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Stand Bodega 2
[State -1, AI]
type = ChangeState
value = 221
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -65
trigger1 = stateno = 220
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Normal Bodega K
[State -1, AI]
type = ChangeState
value = 223
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -68
trigger1 = stateno = 221
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Kyo's Old Fireball
[State -1, AI]
type = ChangeState
value = 1020
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= 0
trigger1 = stateno = 223
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Kyo's Old Fireball (Go for the 30 Hit Combo)
[State -1, AI]
type = ChangeState
value = 1020
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -48
trigger1 = var(30) <= 2
trigger1 = stateno = 223
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Kool Offensive Flurry or Kyo's Old Fireball
[State -1, AI]
type = ChangeState
value = 1000+((random%2)*20)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -48
trigger1 = var(30) > 2
trigger1 = stateno = 223
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Variable 16
[State -1, AI]
type = ChangeState
value = 1001+var(16)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -82
trigger1 = var(31) <= 0
trigger1 = stateno = 1000
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;128 She's Cold, Kiss!
[State -1, AI]
type = ChangeState
value = 1001
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 810
trigger1 = time >= 38
trigger1 = time < 56
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Continue as noramal to reach Bodega Variable 13 or go for 127 Shiki... You know Sabrina 
[State -1, AI]
type = ChangeState
value = 1001+((random%2)*3)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1000
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;75 Shiki Esakai - Go for it more often if you find that it hit a lot of times in one usage
[State -1, AI]
type = ChangeState
value = 1500
trigger1 = fvar(1) <= 3
triggerall = fvar(18) >= 23
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1001
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Like a Record - Go for it more often if you find that it hit a lot of times in one usage
[State -1, AI]
type = ChangeState
value = 1120
trigger1 = fvar(1) <= 3
triggerall = fvar(16) >= 20
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1001
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;75 Shiki Esakai
[State -1, AI]
type = ChangeState
value = 1500
triggerall = fvar(30) >= 1
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -75
trigger1 = stateno = 1004
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Gah! She keyed my Mariachi!
[State -1, AI]
type = ChangeState
value = 1005
triggerall = fvar(30) <= 1
triggerall = fvar(32) <= 0
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -75
trigger1 = stateno = 1004
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;75 Shiki Esakai
[State -1, AI]
type = ChangeState
value = 1500
triggerall = fvar(32) > 0
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -75
trigger1 = stateno = 1004
trigger1 = movecontact
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Mr. Grabby Sam
[State -1, AI]
type = ChangeState
value = 1420
triggerall = fvar(32) <= 0
triggerall = fvar(30) <= 2
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1005
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Shiki's New To Me (Too high for a variety of moves)
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y <= -98
trigger1 = stateno = 1001
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)
trigger2 = p2bodydist y <= -52
trigger2 = stateno = 211
trigger2 = prevstateno = 0 || prevstateno = 12 || prevstateno = 20 || prevstateno = 100
trigger2 = movehit
trigger2 = random <= (AILevel * 94)
trigger2 = random <= (AILevel * 130)
trigger3 = p2bodydist y <= -52
trigger3 = stateno = 211
trigger3 = prevstateno != 0 
trigger3 = prevstateno != 12 
trigger3 = prevstateno != 20 
trigger3 = prevstateno != 100
trigger3 = movehit
trigger3 = random <= (AILevel * 94)
trigger3 = random <= (AILevel * 130)
trigger4 = p2bodydist y <= -82
trigger4 = stateno = 230
trigger4 = movehit
trigger4 = random <= (AILevel * 94)
trigger4 = random <= (AILevel * 130)
trigger5 = p2bodydist y <= -82
trigger5 = var(31) <= 0
trigger5 = stateno = 1000
trigger5 = movehit
trigger5 = random <= (AILevel * 94)
trigger5 = random <= (AILevel * 130)
trigger6 = p2bodydist y <= -75
trigger6 = stateno = 1004
trigger6 = movehit
trigger6 = random <= (AILevel * 94)
trigger6 = random <= (AILevel * 130)
trigger7 = p2bodydist y <= -54
trigger7 = stateno = 240
trigger7 = movehit
trigger7 = random <= (AILevel * 94)
trigger7 = random <= (AILevel * 130)
trigger8 = p2bodydist y <= -52
trigger8 = stateno = 210
trigger8 = movehit
trigger8 = random <= (AILevel * 94)
trigger8 = random <= (AILevel * 130)
trigger9 = p2bodydist y <= -70
trigger9 = stateno = 200
trigger9 = movehit
trigger9 = random <= (AILevel * 94)
trigger9 = random <= (AILevel * 130)
trigger10 = p2bodydist y <= -68
trigger10 = stateno = 221 || stateno = 220
trigger10 = movehit
trigger10 = random <= (AILevel * 94)
trigger10 = random <= (AILevel * 130)
trigger11 = p2bodydist y <= -48
trigger11 = var(30) > 0
trigger11 = stateno = 223 
trigger11 = movehit
trigger11 = random <= (AILevel * 94)
trigger11 = random <= (AILevel * 130)

;Bodega Variable 12
[State -1, AI]
type = ChangeState
value = 1002+var(12)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -98
trigger1 = stateno = 1001
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Too High for Bodega Variable 12
[State -1, AI]
type = ChangeState
value = 1100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y <= -98
trigger1 = stateno = 1001
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Magatamakeri
[State -1, AI]
type = ChangeState
value = 1520
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1003
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Variable 13
[State -1, AI]
type = ChangeState
value = 1220+var(13)
triggerall = fvar(30) < 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1001 || stateno = 1005 || stateno = 1010
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Like a Record or Rainbow Dynamite Energy
[State -1, AI]
type = ChangeState
value = 1120+((random%2)*200)
triggerall = fvar(30) >= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1001 || stateno = 1005 || stateno = 1010
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)


;------Combo from 1210------

;RED Kick
[State -1, AI]
type = ChangeState
value = 1300
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = enemynear, life <= ceil(100*fvar(19))
trigger1 = p2bodydist x <= 40
trigger1 = p2bodydist y >= -50
trigger1 = stateno = 1210
trigger1 = movehit
trigger1 = time <= 24
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;RED Kick
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = enemynear, life <= ceil(100*fvar(19))
trigger1 = p2bodydist x > 40
trigger1 = p2bodydist y >= -50
trigger1 = stateno = 1210
trigger1 = movehit
trigger1 = time <= 24
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Aggressive Spin Strike
[State -1, AI]
type = ChangeState
value = 1241
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist y >= -50
trigger1 = stateno = 1210
trigger1 = movehit
trigger1 = time <= 24
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Killer Instinct Crane Kick
[State -1, AI]
type = ChangeState
value = 1242
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1241
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;F.E.V.E.R or F.R.E.N.Z.Y
[State -1, AI]
type = ChangeState
value = 1243+random%2
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1242
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 430------

;Crouch Light Punch
[State -1, AI]
type = ChangeState
value = 400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = p2bodydist x < 20
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Crouch Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 400
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)
trigger1 = p2bodydist x >= 20

;Crouch Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 410+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 430
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Variable 14
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 410
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Variable 15
[State -1, AI]
type = ChangeState
value = 450+var(15)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 440
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Kyo's Old Fireball
[State -1, AI]
type = ChangeState
value = 1020
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 450
trigger1 = movehit
trigger1 = hitcount >= 2
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 410------

;Crouch Strong Punch
[State -1, AI]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 410
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Variable 17
[State -1, AI]
type = ChangeState
value = 1010+var(17)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 420
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 600------

;Jump Strong Punch or Kick
[State -1, AI]
type = ChangeState
value = 610+((random%2)*30)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 600 || stateno = 630
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;If Esaka Air Kicks don't hit as often as they should, consider doing the H air attacks instead
[State -1, AI]
type = ChangeState
value = 620+((random%2)*(30+((random%2)*853)))
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = fvar(9) >= 1
trigger1 = fvar(9) < 12
trigger1 = stateno = 610 || stateno = 640
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Esaka Air Kicks
[State -1, AI]
type = ChangeState
value = 1503
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 610 || stateno = 640
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 1010------

;401 Macdonald-Cartier Freeway
[State -1, AI]
type = ChangeState
value = 1011
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1010
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;402 The Sheikh Bats You and Me! or Shiki's New To Me
[State -1, AI]
type = ChangeState
value = 1012+((random%2)*198)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1011
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 1030------

;Seriously: Look it up.
[State -1, AI]
type = ChangeState
value = 1031
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1030
trigger1 = movehit
trigger1 = time >= 14
trigger1 = time <= 29
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Seriously: Look it up.
[State -1, AI]
type = ChangeState
value = 1032
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1031
trigger1 = movehit
trigger1 = time >= 14
trigger1 = time <= 29
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 1402------

;Surprise Bodega
[State -1, AI]
type = ChangeState
value = 1403
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1402
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Surprise Bodega
[State -1, AI]
type = ChangeState
value = 1404
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1403
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Bodega Deez Nuts
[State -1, AI]
type = ChangeState
value = 3050
triggerall = fvar(30) > 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = power >= 1000
trigger1 = stateno = 1404
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Chokeslam
[State -1, AI]
type = ChangeState
value = 1430
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1404
trigger1 = movehit
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Surprise Bodega
[State -1, AI]
type = ChangeState
value = 1405
triggerall = fvar(30) <= 4
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1402 || stateno = 1403 || stateno = 1404
trigger1 = moveguarded
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;------Combo from 1500------

;Esakai Continues
[State -1, AI]
type = ChangeState
value = 1501
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1500
trigger1 = movehit | time >= 16
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)

;Esakai Continues
[State -1, AI]
type = ChangeState
value = 1502
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = stateno = 1501
trigger1 = movehit | time >= 16
trigger1 = random <= (AILevel * 94)
trigger1 = random <= (AILevel * 130)
