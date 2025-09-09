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
;   name = "ATATATATATATATATATATATATATATATATATATA"
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
;Either one will be detected by a "command = Sharknado" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "Katamari"
command = ~D, DB, B, a+b
time = 20

[Command]
name = "Katamari"
command = ~D, DB, B, b+c
time = 20

[Command]
name = "Katamari"
command = ~D, DB, B, a+c
time = 20

[Command]
name = "360NoScope"
command = B, D, F, a+b
time = 36

[Command]
name = "360NoScope"
command = B, D, F, b+c
time = 36

[Command]
name = "360NoScope"
command = B, D, F, a+c
time = 36

[Command]
name = "NightonFire"
command = F, B, F, B, x+y
time = 36

[Command]
name = "NightonFire"
command = F, B, F, B, y+z
time = 36

[Command]
name = "NightonFire"
command = F, B, F, B, x+z
time = 36

[Command]
name = "Sharknado"
command = ~D, DF, F, x+y
time = 20

[Command]
name = "Sharknado"   ;Same name as above
command = ~D, DF, F, y+z
time = 20

[Command]
name = "Sharknado"   ;Same name as above
command = ~D, DF, F, x+z
time = 20

[Command]
name = "DudleysFistsAreStrongerThanLightning"
command = ~D, DB, B, x+y
time = 20

[Command]
name = "DudleysFistsAreStrongerThanLightning" 
command = ~D, DB, B, y+z
time = 20

[Command]
name = "DudleysFistsAreStrongerThanLightning"
command = ~D, DB, B, x+z
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "Arwing"
command = a+x
time = 9

[Command]
name = "Arwing" ;Same name as above (buttons in opposite order)
command = x+a
time = 9

[Command]
name = "LAether"
command = ~F, D, DF, x

[Command]
name = "MAether"
command = ~F, D, DF, y

[Command]
name = "HAether"
command = ~F, D, DF, z

[Command]
name = "LSBK"
command = ~D, DB, B, a

[Command]
name = "MSBK"
command = ~D, DB, B, b

[Command]
name = "PUNS"
command = ~D, DB, B, c

[Command]
name = "POPPY_X"
command = ~D, DF, F, x

[Command]
name = "POPPY_Y"
command = ~D, DF, F, y

[Command]
name = "POPPY_Z"
command = ~D, DF, F, z


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
name = "SpinningScamThrow"
command = b+y
time = 1

[Command]
name = "Spook"
command = c+z
time = 1

;-| Dir + Button |---------------------------------------------------------

[Command]
name = "LOSER"
command = /$B, a

[Command]
name = "URALOSER"
command = /$B, b

[Command]
name = "LLOOSSEERR"
command = /$B, c

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "FairyTornado"
command = /F,b
time = 1

[Command]
name = "12Drill"
command = /D,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "Hold a"
command = /a
time = 1

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

[Command]
name = "U"
command = U
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

[State -1, AI ON] ; Turn the AI on when
Type = VarSet
TriggerAll = Var(59) < 1 ; it is not on yet and
TriggerAll = RoundState = 2 ; the fight has started and is not over yet and
Trigger1 = AILevel > 0 ; the computer is playing the character
v = 59
value = 1 ; value of 1 will mean the AI is on
Ignorehitpause=1

[State -1, AI OFF] ; Turn the AI off when
Type = VarSet
Trigger1 = var(59) > 0 ; it is on and
Trigger1 = RoundState != 2 ; the round is not started yet or is already over
Trigger2 = !IsHelper ; OR if we are a player, but
Trigger2 = AILevel = 0 ; the computer is not in control
v = 59
value = 0 ; value of 0 will mean the AI is off. values other than 0 and 1 are not used in this example, we have only one AI mode, the normal one.
Ignorehitpause = 1

[State -1]
Type = VarSet
Trigger1 = 1
var(58) = (AILevel=1)*3+(AILevel=2)*7+(AILevel=3)*16+(AILevel=4)*30+(AILevel=5)*58+(AILevel=6)*90+ (AILevel=7)*150+(AILevel=8)*300

;===========================================================================
;---------------------------------------------------------------------------
;Justice
[State -1, Jusitce]
type = ChangeState
value = 525
triggerall = command = "start"
Triggerall = var(59) = 0
triggerall = Roundstate = 2
triggerall = numexplod(525) = 0
trigger1 = fvar(21) > 0 ;Roundsexisted > 0
trigger1 = p2name = "Godmars"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = fvar(21) > 0 ;Roundsexisted > 0
trigger2 = p4name = "Godmars"
trigger2 = statetype != A
trigger2 = ctrl
trigger3 = enemy, authorname = "gokurakusyugisya"
trigger3 = statetype != A
trigger3 = ctrl

;---------------------------------------------------------------------------
;Twitch-Posting Katamari (uses three super bars)
[State -1, Twitch-Posting Katamari]
type = ChangeState
value = 3645
triggerall = command = "Katamari"
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = power >= 3000
trigger1 = ctrl
trigger2 = power >= 3000
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != 3645
trigger2 = movecontact
trigger3 = power >= 3000
trigger3 = stateno = 1310 || stateno = 1330 ;From roll
trigger4 = power = const(data.power)
trigger4 = const(data.power) < 3000
trigger4 = ctrl
trigger5 = power = const(data.power)
trigger5 = const(data.power) < 3000
trigger5 = hitdefattr = SC, NA, SA, HA
trigger5 = stateno != 3645
trigger5 = movecontact
trigger6 = power = const(data.power)
trigger6 = const(data.power) < 3000
trigger6 = stateno = 1310 || stateno = 1330 ;From roll

;---------------------------------------------------------------------------
;360 No Scope (actually, it's more like a 540 No Scope. Oh, and it uses two super bars)
[State -1, 360NoScope]
type = ChangeState
value = 3600
triggerall = command = "360NoScope"
triggerall = power >= 2000
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != 3600
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From roll
trigger4 = numhelper(1405) > 0
trigger5 = (stateno = 200) && time > 5
trigger6 = (stateno = 210) && time > 5
trigger7 = (stateno = 220) && time > 5

;---------------------------------------------------------------------------
;Night on Fire (uses two super bars)
[State -1, NightonFire]
type = ChangeState
value = 4385
triggerall = command = "NightonFire"
triggerall = power >= 2000
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != 4385
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From roll
trigger4 = numhelper(1405) > 0
trigger5 = (stateno = 200) && time > 5
trigger6 = (stateno = 210) && time > 5
trigger7 = (stateno = 220) && time > 5
trigger8 = stateno = 431
trigger9 = stateno = 1400 || stateno = 1410 || stateno = 1420

;---------------------------------------------------------------------------
;Dudley's Fists Are Stronger Than Lightning. (uses one super bar)
[State -1, Dudley's Fists Are Stronger Than Lightning]
type = ChangeState
value = 3050
triggerall = command = "DudleysFistsAreStrongerThanLightning"
triggerall = power >= 1000
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From roll

;---------------------------------------------------------------------------
;Sharknado (uses one super bar)
[State -1, Sharknado]
type = ChangeState
value = 3000
triggerall = command = "Sharknado"
triggerall = power >= 1000
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From roll
trigger4 = stateno = 1400 || stateno = 1410 || stateno = 1420

;---------------------------------------------------------------------------
;Close Aether
[State -1, Light Aether]
type = ChangeState
value = 1200
triggerall = command = "LAether"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = numhelper(1405) > 0

;---------------------------------------------------------------------------
;Medium Aether
[State -1, Medium Aether]
type = ChangeState
value = 1210
triggerall = command = "MAether"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = numhelper(1405) > 0

;---------------------------------------------------------------------------
;Far Aether
[State -1, Heavy Aether]
type = ChangeState
value = 1220
triggerall = command = "HAether"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = numhelper(1405) > 0

;---------------------------------------------------------------------------
;Puns
[State -1, Puns]
type = ChangeState
value = 1020
triggerall = command = "PUNS"
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact
trigger3 = (stateno = 242) && animtime > 49
trigger4 = stateno = 432 && movecontact && time > 1
trigger5 = stateno = 431 && movecontact && time > 1
trigger6 = stateno = 620
trigger7 = stateno = 1420 && movecontact && time > 1

;---------------------------------------------------------------------------
;Puns (Air)
[State -1, Puns]
type = ChangeState
value = 1021
triggerall = command = "PUNS"
triggerall = statetype = A
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact
trigger3 = (stateno = 242) && animtime > 49
trigger4 = stateno = 432 && movecontact && time > 1
trigger5 = stateno = 431 && movecontact && time > 1
trigger6 = stateno = 620
trigger7 = stateno = 1000 && movecontact
trigger8 = stateno = 1010 && movecontact


;---------------------------------------------------------------------------
;Light Spinning Bird Kick
[State -1, Light Spinning Bird Kick]
type = ChangeState
value = 1000
triggerall = command = "LSBK"
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = stateno = 220 && movecontact
trigger3 = (stateno = 242) && animtime > 49
trigger4 = stateno = 432 && movecontact && time > 1
trigger5 = stateno = 431 && movecontact && time > 1
trigger6 = stateno = 220 && movecontact
trigger7 = stateno = 630

;---------------------------------------------------------------------------
;Medium Spinning Bird Kick
[State -1, Medium Spinning Bird Kick]
type = ChangeState
value = 1010
triggerall = command = "MSBK"
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = (stateno = 242) && animtime > 49
trigger3 = stateno = 432 && movecontact && time > 1
trigger4 = stateno = 431 && movecontact && time > 1
trigger5 = stateno = 1000 && movecontact
trigger6 = stateno = 220 && movecontact
trigger7 = stateno = 630


;---------------------------------------------------------------------------
;Dodge Roll
[State -1, Dodge Roll]
type = ChangeState
value = 1300
triggerall = command = "Arwing"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = ctrl
trigger1 = statetype != A

;---------------------------------------------------------------------------
;I'LLSETTLETHISISSUE
[State -1, I'LLSETTLETHISISSUE]
type = ChangeState
value = 1420
triggerall = command = "POPPY_Z"
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;Light Poppy
[State -1, Light Poppy]
type = ChangeState
value = 1400
triggerall = command = "POPPY_X"
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;Strong Poppy
[State -1, Strong Poppy]
type = ChangeState
value = 1410
triggerall = command = "POPPY_Y"
triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;Spinning Scam Throw
[State -1, Spinning Scam Throw]
type = ChangeState
value = 800
triggerall = command = "SpinningScamThrow"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Spook
[State -1, Spook]
type = ChangeState
value = 6666
triggerall = command = "Spook"
;triggerall = statetype != A
Triggerall = var(59) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;LOSER
[State -1, LOSER]
type = ChangeState
value = 6000
triggerall = command = "LOSER"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = numhelper(6001) = 0
trigger1 = numhelper(6100) = 0

;---------------------------------------------------------------------------
;YOU'RE A LOSER
[State -1, YOU'RE A LOSER]
type = ChangeState
value = 6002
triggerall = command = "URALOSER"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = numhelper(6003) = 0
trigger1 = numhelper(6300) = 0

;---------------------------------------------------------------------------
;LLOOSSEERR!!
[State -1, YOU'RE A LOSER]
type = ChangeState
value = 6004
triggerall = command = "LLOOSSEERR"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = numhelper(6005) = 0
trigger1 = numhelper(6500) = 0

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command = "FF"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 431 && movecontact && time > 1
trigger3 = stateno = 432 && movecontact && time > 1

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 6
trigger3 = stateno = 432 && movecontact && time > 1
trigger4 = stateno = 431 && movecontact && time > 1

;---------------------------------------------------------------------------
;Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 3
trigger3 = (stateno = 230) && time > 10
trigger4 = stateno = 432 && movecontact && time > 1
trigger5 = stateno = 431 && movecontact && time > 1


;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) && time > 5
trigger3 = stateno = 241
trigger4 = stateno = 251
trigger5 = (stateno = 242) && time > 30
trigger5 = statetype != A
trigger6 = stateno = 432 && movecontact && time > 1
trigger7 = stateno = 431 && movecontact && time > 1
trigger8 = stateno = 420 && movecontact && time > 23

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 7
trigger3 = stateno = 432 && movecontact && time > 1
trigger4 = stateno = 431 && movecontact && time > 1

;---------------------------------------------------------------------------
;Fairy Tornado
[State -1, Fairy Tornado]
type = ChangeState
value = 242
triggerall = command = "FairyTornado"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 4
trigger3 = (stateno = 230) && time > 5
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 432 && movecontact && time > 1
trigger7 = stateno = 431 && movecontact && time > 1
trigger8 = stateno = 420 && movecontact && time > 23

;---------------------------------------------------------------------------
;Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 4
trigger3 = (stateno = 230) && time > 5
trigger4 = stateno = 432 && movecontact && time > 1
trigger5 = stateno = 431 && movecontact && time > 1

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 240) && time > 6
trigger4 = stateno = 242 && time > 30
trigger4 = Pos Y > -10
trigger5 = stateno = 432 && movecontact && time > 1
trigger6 = stateno = 431 && movecontact && time > 1
trigger7 = stateno = 420 && movecontact && time > 23

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
Triggerall = var(59) = 0
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 432 && movecontact && time > 1
trigger3 = stateno = 431 && movecontact && time > 1
trigger4 = stateno = 400 && movecontact && time > 3

;---------------------------------------------------------------------------
;Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 431) || (stateno = 432)
trigger2 = (time > 9) || (movecontact && time > 5)
trigger3 = (stateno = 230) && time > 5

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 431) || (stateno = 432)
trigger2 = (time > 9) || (movecontact && time > 5)
trigger3 = (stateno = 230) && time > 5
trigger4 = stateno = 410 && movecontact && time > 2

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = stateno != 431
triggerall = stateno != 432
Triggerall = var(59) = 0 
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 431)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time > 9) || (movecontact && time > 5)
trigger3 = stateno = 432 && movecontact && time > 1
trigger4 = stateno = 431 && movecontact && time > 1
trigger5 = (stateno = 230) && time > 5

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
Triggerall = var(59) = 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time > 9) || (movecontact && time > 5)
trigger3 = stateno = 432 && movecontact && time > 1
trigger4 = stateno = 431 && movecontact && time > 1
trigger5 = stateno = 420 && movecontact && time > 23
trigger6 = (stateno = 230) && time > 5

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno != 600
trigger2 = (stateno = 230) && time > 5

;---------------------------------------------------------------------------
;Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 620 || stateno = 630
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 || stateno = 610 || stateno = 640 || stateno = 650
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Reverse Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 641
triggerall = command = "URALOSER"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 620

;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 620

;---------------------------------------------------------------------------
;12 Drill
[State -1, 12 Drill]
type = ChangeState
value = 660
triggerall = command = "12Drill"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 || stateno = 640
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "c"
Triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 || stateno = 640
trigger2 = movecontact

;----------------------------------------------------------------------------
;AI NO TAMENI TATAKAIMASU

;--------|Character Specific Codes|--------

;Taunt - Self Anti Code because I said so.
[State -1, AI]
type = ChangeState
value = 195
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
trigger1 = p2name = "Spin To Win"
trigger1 = roundstate = 2
trigger1 = stateno != 195
trigger2 = p2name = "Spin To Win"
trigger2 = roundstate = 2
trigger2 = stateno != 195

;Demacian Justice
[State -1, Jusitce]
type = ChangeState
value = 525
Triggerall = var(59) > 0
triggerall = p2life > 0
triggerall = numexplod(525) = 0
trigger1 = fvar(21) > 0 ;Roundsexisted > 0
trigger1 = p2name = "Godmars"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = fvar(21) > 0 ;Roundsexisted > 0
trigger2 = p4name = "Godmars"
trigger2 = statetype != A
trigger2 = ctrl
trigger3 = enemy, authorname = "gokurakusyugisya"
trigger3 = enemy, movetype = A
trigger3 = ctrl
trigger4 = enemy, authorname = "gokurakusyugisya"
trigger4 = enemy, movetype = H


;Magikarp Anti-code because I said so. (Sick dodge, m8!)
[State -1, AI]
type = ChangeState
value = 1300
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
trigger1 = p2name = "Magikarp"
trigger1 = roundstate = 2
trigger1 = p2stateno = 3000
trigger2 = p4name = "Magikarp"
trigger2 = roundstate = 2
trigger2 = p2stateno = 3000

;Onslaught - You're floating in the air? Cute (Not as effective as I make it out to be D:).
[State -1, AI]
type = ChangeState
value = 620
triggerall = ctrl
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = p2name = "Onslaught"
trigger1 = random = [0,160]
trigger2 = p4name = "Onslaught"
trigger2 = random = [0,160]

;No, thanks.
[State -1, NotHitBy]
type = NotHitBy
trigger1 = p2name = "Yugi"
trigger1 = enemy, authorname = "shin"
trigger2 = p4name = "Yugi"
trigger2 = enemy, authorname = "shin"
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = -1

;No, really. I insist. (Maybe you can win if you show a bit of restraint)
[State -1, AI]
type = NotHitBy
triggerall = life < 501
trigger1 = p2name = "Element delirus"
trigger2 = enemy, authorname = "Zelgadis"
trigger3 = p4name = "Element delirus"
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = -1

[State -1, AI]
type = NotHitBy
triggerall = p2stateno = 3504
trigger1 = p2name = "Element delirus"
trigger2 = enemy, authorname = "Zelgadis"
trigger3 = p4name = "Element delirus"
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = -1

;BM
[State -1, AI]
type = ChangeState
value = 195
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = p2stateno = 3505
triggerall = stateno != 195
trigger1 = p2name = "Element delirus"
trigger2 = enemy, authorname = "Zelgadis"
trigger3 = p4name = "Element delirus"

;------|Defensive Measures|------

;Why didn't you DODGE?!
[State -1, AI]
type = ChangeState
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = P2movetype = A
triggerall = (StateType != A)
trigger1 = abs(p2bodydist x) < 45
trigger1 = ctrl
trigger2 = stateno = 430
value = 1300

;Crouch Guard
[State -1]
Type=Changestate
Triggerall= inguarddist
Triggerall=var(59) > 0 
Triggerall=ctrl 
triggerall = (StateType != A)
triggerall = (P2statetype != A)
triggerall = (p2statetype = S)
triggerall = (p2statetype = C)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
Trigger1 = random < (var(50)*2+(AiLevel>=3)*30)
value = 131

[State -1] ; The engine will still guard by through pressing the back button, we need to disable that.
Type=Assertspecial
Triggerall= StateNo != [120,160]
Trigger1=var(59) > 0
flag = noairguard
flag2 = nocrouchguard
flag3 = nostandguard

;Guard Standing Attacks
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType != A)
triggerall = (P2statetype != A)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = ctrl
value = 131

;Stand-to-Crouch Guard
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType != A)
triggerall = (P2statetype = C)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = stateno = 150
trigger2 = stateno = 130
value = 152

;Guard Crouch Attacks
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType != A)
triggerall = (P2statetype = C)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = ctrl
value = 131

;Crouch-to-Stand Guard
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType != A)
triggerall = (P2statetype != S)
triggerall = (P2statetype != C)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = stateno = 152
value = 150

;Guard Aerial Attacks
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType != A)
triggerall = (P2statetype != S)
triggerall = (P2statetype != C)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = ctrl = 1
value = 130

;Air Guard
[State -1, AI]
type = ChangeState
triggerall = var(59) > 0
triggerall = (StateType = A)
triggerall = (P2Movetype = A) ;|| (enemy, NumProj > 0)
trigger1 = ctrl = 1
value = 132

;------|Movement|------

;Jumping, for comboes or avoiding projectiles
[State -1, AI]
Type=changestate
value= 40
triggerall = roundstate = 2
triggerall = stateno != 3000
triggerall = stateno != 431
triggerall = stateno != 432
triggerall = statetype != A
Triggerall = var(59) > 0
trigger1 = ctrl
trigger1 = random = [0,50]
trigger1 = p2Movetype = A
trigger2 = ctrl
trigger2 = abs(p2bodydist y) < -45
trigger3 = ctrl
trigger3 = prevstateno = 430
trigger3 = P2statetype = A
trigger4 = stateno = 450 && movehit && hitcount = 4

;Air Jumping, for comboes or avoiding projectiles
;[State -1, AI]
;Type = changestate
;Triggerall = statetype = A
;Trigger1 = var(59) > 0
;Trigger1 =actually never mind
;value=45

;Hop back - For when Dudley's about to RIP them a new grave hole.
[State -1, AI]
Type=changestate
value= 105
triggerall = roundstate = 2
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = ctrl
trigger1 = numhelper(3051) > 0
trigger1 = numhelper(1915) = 0
trigger1 = p2life <= 135
trigger1 = p2bodydist x < 70
trigger2 = numhelper(3051) > 0
trigger2 = numhelper(1915) = 1
trigger2 = p2life <= 183
trigger2 = p2bodydist x < 70

;------|Offense|------

;------HYPERS------

;Twitch-Posting Katamari - Use if you have low HP and full meter.
[State -1, AI] 
type = ChangeState
value = 3645
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = AIlevel >= 1
triggerall = stateno != 3645
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = p2life > 300
trigger1 = power >= 3000
trigger2 = power >= 3000
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact
trigger3 = power = const(data.power)
trigger3 = const(data.power) < 3000

;360 No Scope - Hit confirmed with LOSER! or Poppy L
[State -1, AI] 
type = ChangeState
value = 3600
triggerall = p2name != "Onslaught" ;THE DREAM IS DEAD (Completely useless vs Onslaught)
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = power >= 2000
triggerall = p2bodydist x > 5
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = numhelper(6001) = 1 && p2movetype = H
trigger2 = numhelper(6005) = 1 && p2movetype = H
trigger3 = numhelper(1401) > 0
trigger3 = helper(1401), movehit
trigger3 = random <= 250
trigger3 = random <= 420

;Night of Fire - Hit confirmed with Judgement.
[State -1, AI] 
type = ChangeState
value = 4385
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = power >= 2000
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = stateno = 220 && movehit && hitcount > 2
trigger1 = p2movetype = H

;Dudley's Fists are Stronger Than Lighting - Hit confirmed with many moves.
[State -1, AI] 
type = ChangeState
value = 3050
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = power >= 1000
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall  = numhelper(3051) = 0 ;Do not use Dudley when one is in play - It diminishes it's effectiveness and looks cheesy (As if this AI isn't cheesy).
trigger1 = stateno = 1020 && movehit && hitcount > 2
trigger2 = stateno = 1020 && movehit && animelem = 5
trigger3 = stateno = 220 && movehit && hitcount > 2
trigger4 = stateno = 220 && movehit && animelem = 33
trigger5 = stateno = 430 && movehit
trigger6 = stateno = 431 && movehit
;trigger7 = stateno = 


;Sharknado - Confirmed hit from Lucky Driver or Vortex Saber.
[State -1, AI] 
type = ChangeState
value = 3000
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = stateno != 3000
triggerall = stateno != 3050
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = power >= 1000
trigger1 = stateno = 450 && movehit && hitcount = 4
trigger2 = stateno = 420 && movehit && hitcount = 2

;------SPECIALS------

;No, really. I have no idea where I'm going with this.
[State -1, AI] 
type = ChangeState
value = 6666
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = numhelper(3051) = 0
trigger1 = ctrl
trigger1 = random = [0,2]

;Literal Spinning Bird Kick - Hit confirmed with Judgement
[State -1, AI] 
type = ChangeState
value = 1020
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = power < 2000
trigger1 = abs(p2bodydist x) > 0
trigger1 = stateno = 220 && movehit && hitcount = 3
trigger2 = stateno = 220 && movehit && animelem = 25
trigger3 = stateno = 1420 && movehit && hitcount = 3

;LLOOSSEERR!
[State -1, AI]
type = ChangeState
value = 6004
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = AIlevel >= 1
triggerall = numhelper(6005) = 0
triggerall = numhelper(6500) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = power >= 2000
trigger1 = abs(p2bodydist x) > 115 
trigger1 = p2statetype != L
trigger1 = random = [0,360]
trigger2 = ctrl
trigger2 = random = [0,160]

;YOU'RE A LOSER!
[State -1, AI]
type = ChangeState
value = 6002
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = AIlevel >= 1
triggerall = numhelper(6003) = 0
triggerall = numhelper(6300) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = random = [0,360]
trigger1 = abs(p2bodydist x) < 0 
trigger1 = p2statetype != L
trigger2 = numhelper(6001) = 1
trigger2 = power < 2000
trigger3 = ctrl
trigger3 = random = [0,160]

;LOSER!
[State -1, AI]
type = ChangeState
value = 6000
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = AIlevel >= 1
triggerall = numhelper(6001) = 0
triggerall = numhelper(6100) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = numhelper(6003) = 1
trigger2 = abs(p2bodydist x) > 115 
trigger2 = p2statetype != L
trigger2 = random = [0,360]
trigger3 = ctrl
trigger3 = random = [0,160]

;GO, POPPY!
[State -1, AI]
type = ChangeState
value = 1420
triggerall = ctrl
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = AIlevel >= 1
triggerall = numhelper(1405) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = enemy, NumProj > 0
;trigger1 = abs(p2bodydist x) > 60 
trigger2 = enemy, NumHelper > 0
;trigger2 = abs(p2bodydist x) > 60 
trigger3 = random = [0,90]
trigger3 = abs(p2bodydist x) > 105 
trigger3 = p2statetype != L

;GO, POPPY!
[State -1, AI] 
type = ChangeState
value = 1420
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = numhelper(1405) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = ctrl
trigger1 = numhelper(1404) = 1

;GO, POPPY!
[State -1, AI] 
type = ChangeState
value = 1410
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = numhelper(1404) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = ctrl
trigger1 = numhelper(1401) = 1

;GO, POPPY!
[State -1, AI] 
type = ChangeState
value = 1400
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = numhelper(1401) = 0
triggerall = numhelper(1404) = 0
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = ctrl
trigger1 = random = [0,160]
trigger1 = P2bodydist X > 160 

;Spinning Scam Throw
[State -1, Spinning Scam Throw]
type = ChangeState
value = 800
triggerall = p2name != "dc_Irene" ; She has super armor, so don't even bother.
triggerall = p2name != "Onslaught" ; He does too.
;triggerall = p2superarmor != 1 (I wish)
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = stateno != 100
triggerall = power < 3000 ;Don't use it only to waste the Katamari.
triggerall = numhelper(3650) = 0 ; Don't rescue them from the Katamari.
trigger1 = ctrl
trigger1 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger1 = p2bodydist X < 25
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger1 = random = [0,160]
trigger1 = ctrl
trigger2 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H
trigger2 = random = [0,160]
trigger2 = ctrl
trigger3 = fvar(7) < 2 ;;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger3 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 1080
trigger3 = stateno != 440
trigger3 = moveguarded
trigger3 = ctrl
trigger3 = p2bodydist X < 3
trigger3 = (p2statetype = S) || (p2statetype = C)
trigger3 = random = [0,160]
trigger4 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger4 = stateno = 230
trigger4 = moveguarded
trigger5 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger5 = stateno = 400
trigger5 = moveguarded
trigger6 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger6 = stateno = 431
trigger6 = moveguarded
trigger7 = fvar(7) < 2 ;Stop trying if failed twice in a row, in case of super armor, or a really evasive opponent.
trigger7 = stateno = 432
trigger7 = moveguarded


;Salt the wound from Spinning Scam Throw (also because no other action really helps)
[State -1, AI]
type = ChangeState
value = 195
;triggerall = ctrl lol who needs it?
triggerall = statetype != A
triggerall = var(59) > 0
triggerall = stateno != 195
trigger1 = p2stateno = 821

;------NORMALS------

;Judgement - Classic Spin to Win. Or at least I think this is classic spin to win.
[State -1, AI]
type = ChangeState
value = 220
triggerall = var(59) > 0
triggerall = roundstate = 2
triggerall = statetype = S
triggerall = ctrl
triggerall = movetype != H
triggerall = random = [201,300]
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = numhelper(3051) = 0
trigger1 = p2bodydist x <= 150

;Wade's Spin Kick - Only sometimes when "I did it!" connects.
[State -1, AI]
type = ChangeState
value = 650
triggerall = ctrl
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = statetype = A
trigger1 = stateno = 640
trigger1 = movehit
trigger1 = random = [0,20]

;"I did it!" - Close range air-on-air anti-air (In the air while wearing air jordans).
[State -1, AI]
type = ChangeState
value = 640
triggerall = ctrl
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = statetype = A
trigger1 = p2bodydist x < 35
trigger1 = P2statetype = A

;Judgement - Hit confirmed with several different moves.
[State -1, AI]
type = ChangeState
value = 220
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = p2bodydist x > 25
triggerall = p2bodydist x < 45
trigger1 = stateno = 100 && movehit && time > 9
trigger2 = stateno = 210 && movehit && hitcount = 3
trigger3 = stateno = 420 && movehit && hitcount = 2
trigger4 = random = [0, 90]
trigger4 = stateno = 230 && movehit && hitcount = 3

;Homing Nakoruru - "Balanced" anti-air.
[State -1, AI]
type = ChangeState
value = 620
triggerall = ctrl
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = p2bodydist x > 35
trigger1 = random = [0,160]
trigger1 = P2statetype = A
trigger2 = stateno = 640
trigger2 = movehit
trigger2 = random = [21,80]


;Screw Attack - Finish Homing Nakoruru when near ground or when Link's Spin Attack connects.
[State -1, AI]
type = ChangeState
value = 610
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
trigger1 = stateno = 620 && movehit && hitcount > 3
trigger1 = Pos Y >= -45
trigger2 = stateno = 600 && movehit && hitcount = 2

;Spin Dash - Cancel
[State -1, AI]
type = ChangeState
value = 40
triggerall = stateno = 430
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
trigger1 = random = [0,160]
trigger1 = p2statetype = A
trigger1 = p2movetype != H

;Spin Dash - Charge
[State -1, AI]
type = ChangeState
value = 430
triggerall = ctrl
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = stateno != 100
triggerall = stateno != 40
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = p2stateno != 820
triggerall = p2stateno != 821
triggerall = numhelper(3051) = 0
trigger1 = ctrl
trigger1 = random = [201,500]
trigger1 = abs(p2bodydist x) > 35
trigger1 = abs(p2bodydist x) < 130 
trigger1 = p2statetype != L

;Spin Dash - Release Early
[State -1, AI]
type = ChangeState
value = 431
triggerall = stateno = 430
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
trigger1 = abs(p2bodydist x) < 35
trigger1 = p2statetype != L

;Spin Dash - Dash
[State -1, AI]
type = ChangeState
value = 432
triggerall = stateno = 430
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
trigger1 = time > 38
trigger1 = p2statetype != L

;Top Spin - Hit them if they are close.
[State -1, AI]
type = ChangeState
value = 230
triggerall = ctrl
triggerall = statetype != A
Triggerall = var(59) > 0
;Triggerall = random < var(58)*1.0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = random = [0,160]
trigger1 = abs(p2bodydist x) < 25
trigger1 = p2statetype != L

;Haggar Double Lariat - Hit them if they are close.
[State -1, AI]
type = ChangeState
value = 200
triggerall = ctrl
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = random = [0,90]
trigger1 = abs(p2bodydist x) < 25
trigger1 = p2statetype != L

;Top Spin - Connected with Spin Dash
[State -1, AI] 
type = ChangeState
value = 230
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 45
triggerall = p2statetype != L
trigger1 = stateno = 432 && movecontact
trigger2 = stateno = 431 && movecontact

;Bat Blue - Hit confirmed with Top Spin
[State -1, AI]
type = ChangeState
value = 240
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 45
triggerall = p2statetype != L
trigger1 = random = [0,190]
trigger1 = stateno = 230 && movehit && hitcount = 3
trigger2 = stateno = 200 && movehit && hitcount = 2

;Zangief Double Lariat - Hit confirmed with Haggar Double Lariat
[State -1, AI]
type = ChangeState
value = 210
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 45
triggerall = p2statetype != L
trigger1 = random = [0,160]
trigger1 = stateno = 200 && movehit && hitcount = 2

;Link's Spin Attack - Hit confirmed with Top Spin
[State -1, AI]
type = ChangeState
value = 600
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = p2bodydist x < 45
triggerall = p2statetype != L
trigger1 = random = [0,70]
trigger1 = stateno = 230 && movehit && hitcount = 3

;Fairy Tornado - Hit confirmed with Bat Blue
[State -1, AI]
type = ChangeState
value = 242
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = p2bodydist x < 55
triggerall = p2bodydist x > -10
triggerall = p2statetype != L
trigger1 = stateno = 240 && movehit && hitcount = 2

;Tatsumaki Senpukyaku- Hit confirmed with Fairy Tornado
[State -1, AI]
type = ChangeState
value = 250
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = p2bodydist x < 45
triggerall = p2bodydist x > -10
triggerall = p2statetype != L
trigger1 = stateno = 242 && movehit && animelem = 41

;Turn around - Hit confirmed with Tatsumaki Senpukyaku.
[State -1, AI]
type = Turn
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
trigger1 = p2bodydist x < 0
trigger1 = stateno = 251

;Run Forward - Finished Turning around.
[State -1, AI]
type = ChangeState
value = 100
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = stateno != 100
triggerall = statetype != A
;trigger1 = ctrl
trigger1 = stateno = 251
trigger1 = time > 2

;Lucky Driver - Hit confirmed with Run Forward, Vortex Saber, or Judgement.
[State -1, AI]
type = ChangeState
value = 450
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = p2bodydist x < 25
trigger1 = random = [0,130]
trigger1 = stateno = 100 && movehit && time > 10
trigger2 = stateno = 220 && movehit && hitcount = 3
trigger2 = power < 1000
trigger3 = random = [0,110]
trigger3 = stateno = 230 && movehit && hitcount = 3

;Cyclone - Hit them if they are close or if Spin Dash connects.
[State -1, AI]
type = ChangeState
value = 400
triggerall = ctrl
triggerall = statetype != A
Triggerall = var(59) > 0
triggerall = AIlevel >= 1
triggerall = roundstate = 2
triggerall = stateno != 400
triggerall = numhelper(3051) = 0
triggerall = p2stateno != 820
triggerall = p2stateno != 821
trigger1 = random = [0,100]
trigger1 = abs(p2bodydist x) < 25
trigger1 = p2statetype != C
trigger1 = p2statetype != L
trigger2 = stateno = 431 && movecontact
trigger2 = stateno = 432 && movecontact

;Donatello - Hit confirmed with Cyclone
[State -1, AI]
type = ChangeState
value = 410
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 45
triggerall = p2statetype != L
trigger1 = random = [0,120]
trigger1 = stateno = 400 && movehit && hitcount = 1


;Vortex Saber - Hit confirmed with Donatello.
[State -1, AI]
type = ChangeState
value = 420
triggerall = roundstate = 2
triggerall = var(59) > 0
triggerall = statetype != A
triggerall = p2bodydist x < 55
trigger1 = random = [0,100]
trigger1 = stateno = 410 && movehit && hitcount = 2
trigger2 = random = [0,100]
trigger2 = stateno = 230 && movehit && hitcount = 3

