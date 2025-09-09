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
;   sensitive (BurnKnuckle_a is NOT the same as BurnKnuckle_a or BurnKnuckle_A).
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
;   a fast attack, such as Terrance's light punch.
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
; name = "PowerWave_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2PowerWave_y"
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


;The commands here aren't being used thanks to the implementation of JMorphman's buffering system, but are kept here for the people who check the CMD file to find movelists.

;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = PowerGeyser" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "PowerGeyser"   ;Unlike my other works, I won't be including x+y or x+z, as these conflict with Roll canceling and make it too easy to accidentally super.
command = ~D, DB, B, DB, D, DF, F, y+z
time = 20

[Command]
name = "BusterWolf"   ;Unlike my other works, I won't be including a+b or a+c, as these conflict with Roll canceling and make it too easy to accidentally super.
command = ~D, DF, F, b+c
time = 20

[Command]
name = "CrackheadArmWrestling"   ;Unlike my other works, I won't be including a+b or a+c, as these conflict with Roll canceling and make it too easy to accidentally super.
command = ~D, DB, B, b+c
time = 20

[Command]
name = "BusterVacation"   ;Unlike my other works, I won't be including a+b or a+c, as these conflict with Roll canceling and make it too easy to accidentally super.
command = ~D, DB, B, y+z
time = 20

[Command]
name = "HungryHunterBusterWolf"   ;Unlike my other works, I won't be including a+b or a+c, as these conflict with Roll canceling and make it too easy to accidentally super.
command = ~F, D, DF, y+z
time = 20

[Command]
name = "HungryHunterBusterWolf"   ;Same name as above
command = ~DF, DF, y+z
time = 20

[Command]
name = "AreYouOkay"
command = ~x, x, F, a, z
time = 20

[Command]
name = "HatofHelpers"
command = ~D, D, D, b+c
time = 20

[Command]
name = "ProtagonistPairUp"
command = ~D, DB, B, y+b
time = 20

[Command]
name = "ProtagonistPairUp"   ;Same name as above
command = ~D, DB, B, z+c
time = 20

;-| Special Motions |------------------------------------------------------

[Command]
name = "PowerWave_x"
command = ~D, DF, F, x

[Command]
name = "PowerWave_x"
command = ~D, DF, F, ~x

[Command]
name = "PowerWave_y"
command = ~D, DF, F, y

[Command]
name = "PowerWave_z"
command = ~D, DF, F, z

[Command]
name = "BurnKnuckle_x"
command = ~D, DB, B, x

[Command]
name = "BurnKnuckle_y"
command = ~D, DB, B, y

[Command]
name = "BurnKnuckle_z"
command = ~D, DB, B, z

[Command]
name = "AlphaKnuckle_x"
command = ~B, DB, D, x

[Command]
name = "AlphaKnuckle_y"
command = ~B, DB, D, y

[Command]
name = "AlphaKnuckle_z"
command = ~B, DB, D, z

[Command]
name = "CrackShoot_a"
command = ~D, DB, B, a

[Command]
name = "CrackShoot_a"
command = ~D, DB, B, ~a

[Command]
name = "CrackShoot_b"
command = ~D, DB, B, b

[Command]
name = "CrackShoot_c"
command = ~D, DB, B, c

[Command]
name = "Rising_x"
command = ~24$D, $U, x
time = 24

[Command]
name = "Rising_x"
command = ~24$D, U, x
time = 24

[Command]
name = "Rising_y"
command = ~24$D, $U, y
time = 24

[Command]
name = "Rising_y"
command = ~24$D, U, y
time = 24

[Command]
name = "Rising_z"
command = ~24$D, $U, z
time = 24

[Command]
name = "Rising_z"
command = ~24$D, U, z
time = 24

[Command]
name = "PowerCharge_a"
command = ~B, DB, D, DF, F, a

[Command]
name = "PowerCharge_b"
command = ~B, DB, D, DF, F, b

[Command]
name = "PowerCharge_c"
command = ~B, DB, D, DF, F, c

[Command]
name = "PowerDunk_a"
command = ~F, D, DF, a

[Command]
name = "PowerDunk_a"
command = ~DF, DF, a

[Command]
name = "PowerDunk_b"
command = ~F, D, DF, b

[Command]
name = "PowerDunk_b"
command = ~DF, DF, b

[Command]
name = "PowerDunk_c"
command = ~F, D, DF, c

[Command]
name = "PowerDunk_c"
command = ~DF, DF, c

[Command]
name = "Buckshot_x"
command = ~D, DB, B, DB, D, DF, F, x
time = 30

[Command]
name = "Buckshot_x"
command = ~D, DB, B, D, DF, F, x
time = 30

[Command]
name = "Buckshot_y"
command = ~D, DB, B, DB, D, DF, F, y
time = 30

[Command]
name = "Buckshot_y"
command = ~D, DB, B, D, DF, F, y
time = 30

[Command]
name = "Buckshot_z"
command = ~D, DB, B, DB, D, DF, F, z
time = 30

[Command]
name = "Buckshot_z"
command = ~D, DB, B, D, DF, F, z
time = 30

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
name = "FF_c"
command = F, F, c

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

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
name = "Roll"
command = x+a
time = 1

[Command]
name = "Throw"
command = y+b
time = 1

[Command]
name = "LaneSwap"
command = z+c
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

[Command]
name = "fwd"
command = F
time = 1
 
[Command]
name = "back"
command = B
time = 1
 
[Command]
name = "up"
command = U
time = 1
 
[Command]
name = "down"
command = D
time = 1
 
[Command]
name = "dfwd"
command = DF
time = 1
 
[Command]
name = "dback"
command = DB
time = 1
 
[Command]
name = "ufwd"
command = UF
time = 1
 
[Command]
name = "uback"
command = UB
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

[Command]
name = "holda"
command = /a
time = 1
 
[Command]
name = "holdb"
command = /b
time = 1
 
[Command]
name = "holdc"
command = /c
time = 1
 
[Command]
name = "holdx"
command = /x
time = 1
 
[Command]
name = "holdy"
command = /y
time = 1
 
[Command]
name = "holdz"
command = /z
time = 1
 
[Command]
name = "holdstart"
command = /s
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

;==============================================================================================
;==============================================================================================
;================================<EXPLODsive Buffering System>=================================
;====================================<by JustMorphPointman>====================================
;==============================================================================================
;==============================================================================================

;This is an explod-based buffering system, designed to overcome several different errors and bugs
;related to MUGEN's default method of processing commands, as well as offering creators more control
;over how the commands of their character should work. It is designed to be easy to use, understand,
;and install. For more information, including instructions on how to add this to a character, as
;well as how to customize it and add new commands, please visit http://mugenguild.com/forum/msg.2366951

;==============================================================================================
;===================================<DIRECTIONAL COMMANDS>=====================================
;==============================================================================================

;==============================================================================================
;These are required for the system to function; they are active whenever the specified direction
;is currently being input, and disappear as soon as they are released (via a series of RemoveExplods
;at the bottom of the Buffering system code block). They are used by the system to detect directional
;releases, but can also be used outside of the Buffering system code block to detect when a specific
;direction is being input or held down.
;==============================================================================================

[State -1, Release Down Detector]
type = Explod
;make sure explod doesn't already exist
triggerAll = !NumExplod(90000002)
;check to make sure Helper exists, and that the entity running this code isn't the helper, and that
;the AI isn't active. Only a human player should be making explods!
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
;If either of these explods exist, then down/up inputs have been reversed (this is usually caused
;by an attack of some sort, such as Thanos's Mind Gem super). We can easily flip left/right commands,
;but for down/up inputs, we must have two sets of triggers. This is the first set, which only activate
;if the explods don't exist, so we can just check the inputs normally.
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
;explod will be created if down is input
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
;no other directions may be input, otherwise it wouldn't be a down input!
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
;These sets of triggers, however, only are used if one of the direction input reversal explods exist.
;We treat "down" inputs as "up", and vice-versa; "down-right" is treated as "up-right", and so on.
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000002
;these explods are only removed via a RemoveExplod, so their RemoveTime is set to -1 (aka infinite)
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Down-Right Detector]
type = Explod
triggerAll = !NumExplod(90000003)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger1 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000003
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Right Detector]
type = Explod
triggerAll = !NumExplod(90000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000006
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Up-Right Detector]
type = Explod
triggerAll = !NumExplod(90000009)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger1 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000009
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Up Detector]
type = Explod
triggerAll = !NumExplod(90000008)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000008
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Up-Left Detector]
type = Explod
triggerAll = !NumExplod(90000007)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger1 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000007
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Left Detector]
type = Explod
triggerAll = !NumExplod(90000004)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown" && Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000004
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release Down-Left Detector]
type = Explod
triggerAll = !NumExplod(90000001)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger1 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000001
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1



;==============================================================================================
;==========================================<BUTTONS>===========================================
;==============================================================================================

[State -1, Press x]
type = Explod
;if there already exists a "press x" explod, and the player is in HitPauseTime, then we don't need another!
trigger1 = !HitPauseTime || !NumExplod(90000200)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "x"
anim = 9999
ID = 90000200
;the removeTime, pauseMoveTime, and superMoveTime all must be the same value. This represents the
;amount of time (in ticks) that this individual input is "active"; in other words, it's the window
;of time the player has to input the next input in sequence (or if it's the final input of a command,
;the amount of time that command will last, if the character cannot currently perform the move in
;question). We use "10" as the default value for most directional inputs, because it's generally the
;standard amount of time for most games
;We use "3" for button inputs, which is what many modern games use, but there's a lot of variance
;there.

;We also include " + ifElse(HitPauseTime, HitPauseTime - 1, 0)" to the RemoveTime/PauseMoveTime/SuperMoveTime
;in order to keep the command alive during hit pause. This goes on all button press commands, as well as
;the final directional input of any system, special, or super command.
;For more information on what the removeTime (and pauseMoveTime, et. al.) represents, see the comments for
;the "Right, Right" command
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press y]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000210)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "y"
anim = 9999
ID = 90000210
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press z]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000220)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "z"
anim = 9999
ID = 90000220
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press a]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000230)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "a"
anim = 9999
ID = 90000230
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press b]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000240)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "b"
anim = 9999
ID = 90000240
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press c]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000250)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "c"
anim = 9999
ID = 90000250
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, Press start]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000195)
trigger1 = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "start"
anim = 9999
ID = 90000195
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;These explods are used to detect button releases, much in the same way that the directional
;detectors work. These are required for the system, but it's easier to use MUGEN's standard
;"holda" / "holdx" / etc. for situations where you need to detect a held button input, rather than
;making use of these like you would the release direction detectors.
;==============================================================================================
[State -1, Release x Detector]
type = Explod
triggerAll = !NumExplod(90000201)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "x" || Helper(90000005), command = "holdx"
anim = 9999
ID = 90000201
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release y Detector]
type = Explod
triggerAll = !NumExplod(90000211)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "y" || Helper(90000005), command = "holdy"
anim = 9999
ID = 90000211
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release z Detector]
type = Explod
triggerAll = !NumExplod(90000221)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "z" || Helper(90000005), command = "holdz"
anim = 9999
ID = 90000221
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release a Detector]
type = Explod
triggerAll = !NumExplod(90000231)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "a" || Helper(90000005), command = "holda"
anim = 9999
ID = 90000231
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release b Detector]
type = Explod
triggerAll = !NumExplod(90000241)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "b" || Helper(90000005), command = "holdb"
anim = 9999
ID = 90000241
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release c Detector]
type = Explod
triggerAll = !NumExplod(90000251)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "c" || Helper(90000005), command = "holdc"
anim = 9999
ID = 90000251
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1

[State -1, Release start Detector]
type = Explod
triggerAll = !NumExplod(90000194)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "start"
anim = 9999
ID = 90000194
removeTime = -1
pauseMoveTime = -1
superMoveTime = -1
ignoreHitPause = 1



;==============================================================================================
;Take note of the RemoveTimes on these: release button inputs don't persist through hitpause!
;==============================================================================================

[State -1, Release x]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000205)
triggerAll = NumExplod(90000201)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "x" && Helper(90000005), command != "holdx"
anim = 9999
ID = 90000205
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release y]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000215)
triggerAll = NumExplod(90000211)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "y" && Helper(90000005), command != "holdy"
anim = 9999
ID = 90000215
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release z]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000225)
triggerAll = NumExplod(90000221)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "z" && Helper(90000005), command != "holdz"
anim = 9999
ID = 90000225
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release a]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000235)
triggerAll = NumExplod(90000231)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "a" && Helper(90000005), command != "holda"
anim = 9999
ID = 90000235
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release b]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000245)
triggerAll = NumExplod(90000241)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "b" && Helper(90000005), command != "holdb"
anim = 9999
ID = 90000245
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release c]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000255)
triggerAll = NumExplod(90000251)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "c" && Helper(90000005), command != "holdc"
anim = 9999
ID = 90000255
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1

[State -1, Release start]
type = Explod
trigger1 = !HitPauseTime || !NumExplod(90000196)
triggerAll = NumExplod(90000194)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "start" && Helper(90000005), command != "holdstart"
anim = 9999
ID = 90000196
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;==============================================================================================
;=============================<DIRECTIONAL INPUTS (3 TICK BUFFER)>=============================
;==============================================================================================

;==============================================================================================
;These activate whenever the direction in question is input, and persist for three ticks. Useful
;if you need to use only a single directional input, but also want it to last longer than one tick.
;==============================================================================================

;======================================<DOWN (3 TICKS)>========================================
[State -1, Down (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90000012
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;===================================<DOWN-RIGHT (3 TICKS)>=====================================
[State -1, Down-Right (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90000013
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;======================================<RIGHT (3 TICKS)>=======================================
[State -1, Right (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90000016
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;=====================================<UP-RIGHT (3 TICKS)>=====================================
[State -1, Up-Right (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
anim = 9999
ID = 90000019
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;========================================<UP (3 TICKS)>========================================
[State -1, Up (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down" && Helper(90000005), command != "back"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "back"
anim = 9999
ID = 90000018
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;=====================================<UP-LEFT (3 TICKS)>======================================
[State -1, Up-Left (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
anim = 9999
ID = 90000017
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;=======================================<LEFT 3 TICKS>=========================================
[State -1, Left (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90000014
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;====================================<DOWN-LEFT 3 TICKS>=======================================
[State -1, Down-Left (3 ticks)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90000011
removeTime = 3
pauseMoveTime = 3
superMoveTime = 3
ignoreHitPause = 1



;==============================================================================================
;=====================<DIRECTIONAL INPUTS (3 TICK BUFFER + HITPAUSE TIME)>=====================
;==============================================================================================

;==============================================================================================
;These are almost identical to the explods directly above this, except these will persist through
;a HitPause, and will only activate if the direction in question is being either held or input on
;the same tick that any button is input. These can be used to replicate the command behavior of Capcom
;games for crouching and command normal moves. For more information, please see [INSERT LINK].
;==============================================================================================

;==============================<DOWN (3 TICKS + HITPAUSE TIME)>================================
[State -1, Down (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "down" || Helper(90000005), command = "holddown") && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holdup" && Helper(90000005), command != "holdfwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "up" || Helper(90000005), command = "holdup") && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holddown" && Helper(90000005), command != "holdfwd"
anim = 9999
ID = 90000022
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1




;===========================<DOWN-RIGHT (3 TICKS + HITPAUSE TIME)>=============================
[State -1, Down-Right (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "dfwd" || (Helper(90000005), command = "holddown" && Helper(90000005), command = "holdfwd")) && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "ufwd" || (Helper(90000005), command = "holdup" && Helper(90000005), command = "holdfwd")) && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000023
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================<RIGHT (3 TICKS + HITPAUSE TIME)>===============================
[State -1, Right (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = (Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd") && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holdup" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000026
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=============================<UP-RIGHT (3 TICKS + HITPAUSE TIME)>=============================
[State -1, Up-Right (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "ufwd" || (Helper(90000005), command = "holdup" && Helper(90000005), command = "holdfwd")) && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "dfwd" || (Helper(90000005), command = "holddown" && Helper(90000005), command = "holdfwd")) && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "holdback" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000029
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;================================<UP (3 TICKS + HITPAUSE TIME)>================================
[State -1, Up (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "up" || Helper(90000005), command = "holdup") && Helper(90000005), command != "fwd" && Helper(90000005), command != "down" && Helper(90000005), command != "back" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holddown" && Helper(90000005), command != "holdback"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "down" || Helper(90000005), command = "holddown") && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "back" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holdup" && Helper(90000005), command != "holdback"
anim = 9999
ID = 90000028
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=============================<UP-LEFT (3 TICKS + HITPAUSE TIME)>==============================
[State -1, Up-Left (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "uback" || (Helper(90000005), command = "holdup" && Helper(90000005), command = "holdback")) && Helper(90000005), command != "fwd" && Helper(90000005), command != "down" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "dback" || (Helper(90000005), command = "holddown" && Helper(90000005), command = "holdback")) && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000027
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;===============================<LEFT 3 TICKS + HITPAUSE TIME>=================================
[State -1, Left (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = (Helper(90000005), command = "back" || Helper(90000005), command = "holdback") && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holdup" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000024
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;============================<DOWN-LEFT 3 TICKS + HITPAUSE TIME>===============================
[State -1, Down-Left (3 ticks + HitPauseTime)]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
triggerAll = Helper(90000005), command = "x" || Helper(90000005), command = "y" || Helper(90000005), command = "z" || Helper(90000005), command = "a"  || Helper(90000005), command = "b" || Helper(90000005), command = "c" || Helper(90000005), command = "start"
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command = "dback" || (Helper(90000005), command = "holddown" && Helper(90000005), command = "holdback")) && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = (Helper(90000005), command = "uback" || (Helper(90000005), command = "holdup" && Helper(90000005), command = "holdback")) && Helper(90000005), command != "fwd" && Helper(90000005), command != "down" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "holddown"
anim = 9999
ID = 90000021
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;Reminder: because this system is based on absolute directions (left/right) instead of relative
;directions (forward/backward), all commands must have a mirrored command as well (unless they are
;performed solely with up and/or down!) In other words, two different versions of each individual
;command must be defined in this system: one assuming the character is facing the right, and one
;for the left.
;==============================================================================================

;==============================================================================================
;================================<FORWARD, FORWARD/BACK, BACK>=================================
;==============================================================================================

;==============================================================================================
;Dash/run commands in SNK typically have release directions as their first inputs. In other words,
;in most SNK games, you can dash/run by holding forward or back for however long you like, and then
;quickly releasing the stick and returning to neutral, then quickly inputting forward/back again.
;In most Capcom games, this will not work. We have the dash/run commands in this system set up to
;follow Capcom's example.

;Different games have different input windows for dash commands. KOF gives you a 7 tick window between
;each the first and second forward/back commands, and the final input has a buffer time of 3 ticks.
;CPS2 Capcom games (under the normal speed setting) have an input window of 7 ticks for the consecutive
;forward/back commands, and the final input has a buffer time of 2 ticks. In SFIII, both the input
;window and the buffer time is 7 ticks. The default values in this system are 10 for the input window
;and 3 for the buffer time, to match up with the other commands (but feel free to change those values
;to suit your personal preference!)
;==============================================================================================

;=======================================<RIGHT, RIGHT>=========================================
[State -1, R, R: 1st Right]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001006
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, R: Neutral]
type = Explod
triggerAll = NumExplod(90000006) && NumExplod(90001006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
;make sure no directional input is being performed
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd"
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90001005
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

;We remove the neutral explod if any non-right input is detected, or if the 1st right explod does not exist
;in most Capcom games, a dash command will be cancelled mid-input if any direction other than forward/back
;and neutral are input. But SNK games give you more leeway: as long as you have inputting forward/back, and
;have returned the stick to neutral, you can input any other directional command and still get a dash as long
;as you input another forward/back command. If you want to replicate this behavior, simply delete the first trigger
;of this RemoveExplod sctrl (you will still need the second trigger, though).
[State -1, Remove R, R: Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = NumExplod(90000002) || NumExplod(90000003) || NumExplod(90000009) || NumExplod(90000008) || NumExplod(90000007) || NumExplod(90000004) || NumExplod(90000001)
trigger2 = !NumExplod(90001006)
ID = 90001005
ignoreHitPause = 1

[State -1, R, R: 2nd Right]
type = Explod
;we check to see if the user has input right recently, and has returned the stick to neutral
triggerAll = NumExplod(90001005) && NumExplod(90001006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001016
;see the button explods above for an explanation of this ifElse statement. This statement only goes on the final
;input of any command, and should not go anywhere else in the command!
;We also are using a non-standard removeTime for this input, as dash commands in most games are only active
;for a short period of time (around 1-3 ticks).
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, R, R: 2nd Right (10 ticks)]
type = Explod
;this one is used for Kung Fu Knee
triggerAll = NumExplod(90001005) && NumExplod(90001006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001026
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;Now for the reversed command:
;==============================================================================================

;=======================================<LEFT, LEFT>=========================================
[State -1, L, L: 1st Left]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001054
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, L: Neutral]
type = Explod
triggerAll = NumExplod(90000004) && NumExplod(90001054)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback"
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown" && Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90001055
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, Remove L, L: Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = NumExplod(90000002) || NumExplod(90000003) || NumExplod(90000006) || NumExplod(90000009) || NumExplod(90000008) || NumExplod(90000007) || NumExplod(90000001)
trigger2 = !NumExplod(90001054)
ID = 90001055
ignoreHitPause = 1

[State -1, L, L: 2nd Left]
type = Explod
triggerAll = NumExplod(90001055) && NumExplod(90001054)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001064
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, L, L: 2nd Left (10 ticks)]
type = Explod
triggerAll = NumExplod(90001055) && NumExplod(90001054)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90001074
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;==============================================================================================
;=========================================<DOWN,DOWN>==========================================
;==============================================================================================

;==============================================================================================
;Pretty similar to the Forward, Forward/Back, Back commands, only we don't need to worry about
;the player's facing or anything, since all the inputs are down!

;Also of note is that any up/down direction may be used to activate this command (i.e., a UF, UF
;will still be considered a U, U command).
;==============================================================================================

;=========================================<DOWN,DOWN>==========================================
[State -1, D, D: 1st Down]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "dfwd" || Helper(90000005), command = "dback"
trigger1 = Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "ufwd" || Helper(90000005), command = "uback"
trigger2 = Helper(90000005), command != "down"
anim = 9999
ID = 90000552
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, D: Neutral]
type = Explod
triggerAll = (NumExplod(90000001) || NumExplod(90000002) || NumExplod(90000003)) && NumExplod(90000552)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90000555
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, Remove D, D: Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = NumExplod(90000004) || NumExplod(90000007) || NumExplod(90000008) || NumExplod(90000009) || NumExplod(90000006)
trigger2 = !NumExplod(90000552)
ID = 90000555
ignoreHitPause = 1

[State -1, D, D: 2nd Down]
type = Explod
triggerAll = NumExplod(90000555) && NumExplod(90000552)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "dfwd" || Helper(90000005), command = "dback"
trigger1 = Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "ufwd" || Helper(90000005), command = "uback"
trigger2 = Helper(90000005), command != "down"
anim = 9999
ID = 90000562
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;===================================<QUARTER CIRCLE DOWN>======================================
;==============================================================================================

;==============================================================================================
;This is the SFA2 style Zero Counter command. This is the first command in the system that uses
;a release directional input. However, this command works somewhat differently from the way pretty
;much every other command in this system works, so we're gonna avoid getting deep into discussion
;about anything here. Please see the following command (quarter-circle forward/back) for a basic
;look at how most release inputs work in this system.
;==============================================================================================


;================================<RIGHT, DOWN-RIGHT, DOWN>=====================================
[State -1, R, DR, D: Release Right]
type = Explod
;check to see if the Release Right Detector explod exists. If it exists and down is no longer being
;input, that means it was released!
triggerAll = NumExplod(90000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
;if right isn't currently being input by the user, then right was released!
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd"
;... but if right is currently being input by the user, AND there's another direction being input,
;then right is still considered to have been released.
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90007506
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, R, DR, D: Down-Right]
type = Explod
;the "Right" explod needs to exist before the next command in sequence is allowed
triggerAll = NumExplod(90007506)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90007503
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, DR, D: Down]
type = Explod
triggerAll = NumExplod(90007503)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90007502
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=================================<LEFT, DOWN-LEFT, DOWN>======================================
[State -1, L, DL, D: Release Left]
type = Explod
triggerAll = NumExplod(90000004)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90007554
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, L, DL, D: Down-Left]
type = Explod
triggerAll = NumExplod(90007554)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90007551
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, DL, D: Down]
type = Explod
triggerAll = NumExplod(90007551)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90007552
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;===============================<QUARTER CIRCLE FORWARD/BACK>==================================
;==============================================================================================

;==============================================================================================
;The vast majority of all commands in fighting games allow the first input of any command to be
;a release input, so that you're allowed to hold the direction that the command starts with for
;however long you want, then input the rest of the command, and still get the move. This is why
;in MUGEN, people typically write all their character's commands as starting with a release input;
;however, things are a bit more complicated outside of MUGEN (and thus, more complicated in this
;buffer too). In most games, the window of time a player has to input the next command in sequence
;after performing a release input is shorter than the window of time they have to input the next
;command after a press input. For example, in Street Fighter III, if you want to perform a quarter-
;circle forward motion, and you press (or hold) the "down" direction, you will have 10 ticks to
;input "down-forward" and continue the command. But if instead you were to hold the "down" direction
;down for a few seconds before releasing it, you will have only 5 ticks to input "down-forward" to
;continue entering the command.

;The way this is translated to the EXPLODsive Buffering system is this: we have two separate explods
;for the first input of every command that uses a release directional input. One explod is created
;whenever the first input is entered, and has a RemoveTime of 10 (which is the same amount of time
;that most other directional explods use in this system); one other explod is also created whenever
;the direction of the first input is released: this has a RemoveTime of 5, which is generally what
;commercial fighting games use.

;Do note that not every game gives players the same input windows for every single command: for
;example, in Street Fighter Alpha 3 (on normal speed), press directional inputs all have a 10 tick
;input window, but the input window for the release directional input in a quarter-circle motion is
;6, while the input window for the release directional input in a forward, down, down-forward motion
;is only 4! There's a whole bunch of variance here, sometimes in the same game, and so it's best to check
;the source game of the character you're making (if applicable) to try and get an idea of what RemoveTime
;will be best for each of your commands.
;==============================================================================================

;================================<DOWN, DOWN-RIGHT, RIGHT>=====================================

;Since this is the press directional input for the first input, it has a RemoveTime of 10
[State -1, D, DR, R: Press Down]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010002
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

;And since this is the release directional input for the first input, it has a RemoveTime of only 5!
[State -1, D, DR, R: Release Down]
type = Explod
triggerAll = NumExplod(90000002)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
anim = 9999
ID = 90010052
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, D, DR, R: Down-Right]
type = Explod
;Remember, we have to check to see if either the "press down" or "release down" explods exist!
triggerAll = NumExplod(90010002) || NumExplod(90010052)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90010003
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DR, R: Right]
type = Explod
triggerAll = NumExplod(90010003)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010006
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=================================<DOWN, DOWN-LEFT, LEFT>======================================
[State -1, D, DL, L: Press Down]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010102
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L: Release Down]
type = Explod
triggerAll = NumExplod(90000002)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
anim = 9999
ID = 90010152
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, D, DL, L: Down-Left]
type = Explod
triggerAll = NumExplod(90010102) || NumExplod(90010152)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90010101
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L: Left]
type = Explod
triggerAll = NumExplod(90010101)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010104
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;==============================================================================================
;=====<QUARTER CIRCLE FORWARD, DOWN-FORWARD, BACK/QUARTER CIRCLE BACK, DOWN-BACK, FORWARD>=====
;==============================================================================================

;========================<DOWN, DOWN-RIGHT, RIGHT, DOWN-RIGHT, LEFT>===========================
[State -1, D, DR, R, DR, L: Right]
type = Explod
triggerAll = NumExplod(90010003)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90032406
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DR, R, DR, L: Down-Right]
type = Explod
triggerAll = NumExplod(90032406)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90032403
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DR, R, DR, L: Down]
type = Explod
;the Down explod will be created if either (or both) the Right or Down-Right explods exist
triggerAll = NumExplod(90032406) || NumExplod(90032403)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90032402
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DR, R, DR, L: Down-Left]
type = Explod
;the Down-Left explod will be created if the Right, Down-Right, or Down explods exist
triggerAll = NumExplod(90032406) || NumExplod(90032403) || NumExplod(90032402)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90032401
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DR, R, DR, L: Left]
type = Explod
;the Left explod will be created if the Right, Down-Right, Down, or Down-Left explods exist
triggerAll = NumExplod(90032406) || NumExplod(90032403) || NumExplod(90032402) || NumExplod(90032401)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90032404
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=========================<DOWN, DOWN-LEFT, LEFT, DOWN-LEFT, RIGHT>============================
[State -1, D, DL, L, DL, R: Left]
type = Explod
triggerAll = NumExplod(90010101)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90032504
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L, DL, R: Down-Left]
type = Explod
triggerAll = NumExplod(90032504)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90032501
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L, DL, R: Down]
type = Explod
triggerAll = NumExplod(90032504) || NumExplod(90032501)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90032502
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L, DL, R: Down-Right]
type = Explod
triggerAll = NumExplod(90032504) || NumExplod(90032501) || NumExplod(90032502)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90032503
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, DL, L, DL, R: Right]
type = Explod
triggerAll = NumExplod(90032504) || NumExplod(90032501) || NumExplod(90032502) || NumExplod(90032503)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90032506
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1


;==============================================================================================
;====================<FORWARD, DOWN, DOWN-FORWARD/BACK, DOWN, DOWN-BACK>=======================
;==============================================================================================

;==============================================================================================
;Nothing special here, just the standard dragon punch motion!
;==============================================================================================

;================================<RIGHT, DOWN, DOWN-RIGHT>=====================================
[State -1, R, D, DR: Press Right]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010206
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, D, DR: Release Right]
type = Explod
triggerAll = NumExplod(90000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90010256
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, (Press) R, D, DR: Down]
type = Explod
triggerAll = NumExplod(90010206) || NumExplod(90010256)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010202
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, (Press) R, D, DR: Down-Right]
type = Explod
triggerAll = NumExplod(90010202)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90010203
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;=================================<LEFT, DOWN, DOWN-LEFT>======================================
[State -1, L, D, DL: Press Left]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010304
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, D, DL: Release Left]
type = Explod
triggerAll = NumExplod(90000004)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90010354
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, (Press) L, D, DL: Down]
type = Explod
triggerAll = NumExplod(90010304) || NumExplod(90010354)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010302
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, (Press) L, D, DL: Down-Left]
type = Explod
triggerAll = NumExplod(90010302)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90010301
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;--------------------------------------------------------
;Brergrsart's DP Shortcut (DF,DF / DB, DB)

;=======================================<DR, DR>=========================================

[State -1, DR, DR: 1st DR]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
anim = 9999
ID = 90420562
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, DR, DR: Neutral]
type = Explod
triggerAll = NumExplod(90000003) && NumExplod(90420562)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "dfwd" && Helper(90000005), command != "holdfwd"
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90420563
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, Remove DR, DR: Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(90420562)
ID = 90420563
ignoreHitPause = 1

[State -1, DR, DR: 2nd DR]
type = Explod
triggerAll = NumExplod(90420562) && NumExplod(90420563)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
anim = 9999
ID = 90010203
;see the button explods above for an explanation of this ifElse statement. This statement only goes on the final
;input of any command, and should not go anywhere else in the command!
;We also are using a non-standard removeTime for this input, as dash commands in most games are only active
;for a short period of time (around 1-3 ticks).
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, R, R: 2nd Right (10 ticks)]
type = Explod
triggerAll = NumExplod(90420562) && NumExplod(90420563)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
anim = 9999
ID = 90010203
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;=======================================<DL, DL>=========================================
[State -1, DL, DL: 1st DL]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
anim = 9999
ID = 90420564
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, DL, DL: DL]
type = Explod
triggerAll = NumExplod(90000001) && NumExplod(90420564)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "dback" && Helper(90000005), command != "holdback"
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown" && Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90420565
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, Remove DL, DL: Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(90420564)
ID = 90420565
ignoreHitPause = 1

[State -1, DL, DL: DL]
type = Explod
triggerAll = NumExplod(90420565) && NumExplod(90420564)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
anim = 9999
ID = 90010301
removeTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 3 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

[State -1, DL, DL: 2nd DL (10 ticks)]
type = Explod
triggerAll = NumExplod(90420565) && NumExplod(90420564)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
anim = 9999
ID = 90010301
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;==============================================================================================
;=================================<HALF CIRCLE FORWARD/BACK>===================================
;==============================================================================================

;==============================================================================================
;As mentioned earlier, SNK games have command shortcuts for half-circle moves, allowing the user
;to only input cardinal directions and still complete the command. We have opted to use Capcom's
;method for the standard half circle comands here, but these can very easily be modified to use
;the SNK method!
;==============================================================================================

;========================<LEFT, DOWN-LEFT, DOWN, DOWN-RIGHT, RIGHT>============================
[State -1, L, DL, D, DR, R: Press Left]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010404
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, DL, D, DR, R: Release Left]
type = Explod
triggerAll = NumExplod(90000004)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90010454
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, L, DL, D, DR, R: Down-Left]
type = Explod
triggerAll = NumExplod(90010404) || NumExplod(90010454)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90010401
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, DL, D, DR, R: Down]
type = Explod
triggerAll = NumExplod(90010401) || NumExplod(90010404) || NumExplod(90010454)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010402
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, DL, D, DR, R: Down-Right]
type = Explod
triggerAll = NumExplod(90010402) || NumExplod(90010401)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90010403
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, L, DL, D, DR, R: Right]
type = Explod
triggerAll = NumExplod(90010403) || NumExplod(90010402)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010406
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;========================<RIGHT, DOWN-RIGHT, DOWN, DOWN-LEFT, LEFT>============================
[State -1, R, DR, D, DL, L: Press Right]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "fwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010506
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, DR, D, DL, L: Release Right]
type = Explod
triggerAll = NumExplod(90000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
anim = 9999
ID = 90010556
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, R, DR, D, DL, L: Down-Right]
type = Explod
triggerAll = NumExplod(90010506) || NumExplod(90010556)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "ufwd" && Helper(90000005), command != "back" && Helper(90000005), command != "down"
anim = 9999
ID = 90010503
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, DR, D, DL, L: Down]
type = Explod
triggerAll = NumExplod(90010503) || NumExplod(90010506) || NumExplod(90010556)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90010502
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, DR, D, DL, L: Down-Left]
type = Explod
triggerAll = NumExplod(90010502) || NumExplod(90010503)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "dback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "uback" && Helper(90000005), command != "fwd" && Helper(90000005), command != "down"
anim = 9999
ID = 90010501
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, R, DR, D, DL, L: Left]
type = Explod
triggerAll = NumExplod(90010501) || NumExplod(90010502)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "back" && Helper(90000005), command != "fwd" && Helper(90000005), command != "up" && Helper(90000005), command != "down"
anim = 9999
ID = 90010504
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;==============================================================================================
;======================================<CHARGE DOWN, UP>=======================================
;==============================================================================================

;Do note that we use different variables [var(49) and var(50)] here.
;==============================================================================================

[State -1, Down Charge Increment]
type = VarAdd
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !AIlevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "holddown"
trigger2 = !AIlevel
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "holdup"
var(49) = 1

[State -1, Down Charge Reset]
type = VarSet
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "holddown" || Helper(90000005), command = "holdup"
trigger2 = !AILevel
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command != "holdup" || Helper(90000005), command = "holddown"
var(49) = 0

[State -1, Down Charge Buffer Activation]
type = VarSet
trigger1 = var(49) >= 18
var(50) = 16

[State -1, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(49) < 18 && var(50) > 0
var(50) = -1

[State -1, Charge Down, Up: Up]
type = Explod
triggerAll = var(50) > 0
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" && Helper(90000005), command != "down"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" && Helper(90000005), command != "up"
anim = 9999
ID = 90010808
removeTime = var(50) + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = var(50) + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = var(50) + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1


;==============================================================================================
;==================================<(SPECIAL) DOWN, DOWN >=====================================
;==============================================================================================

;==============================================================================================
;This explod is for the special move variant of the D, D motion; the only difference between this
;and the one above is that this has a RemoveTime of 10, like every other special move, since it's
;designed to be used for special moves (as opposed to the earlier D, D command, which was for air
;dashing).
;==============================================================================================

[State -1, (special) D, D: 2nd Down]
type = Explod
triggerAll = NumExplod(90000555) && NumExplod(90000552)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "dfwd" || Helper(90000005), command = "dback"
trigger1 = Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "ufwd" || Helper(90000005), command = "uback"
trigger2 = Helper(90000005), command != "down"
anim = 9999
ID = 90012602
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;+==================================<(SPECIAL) DOWN, UP >+=====================================
;==============================================================================================

[State -1, D, U: Press Down]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90012702
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, D, U: Release Down]
type = Explod
triggerAll = NumExplod(90000002)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
anim = 9999
ID = 90012752
removeTime = 5
pauseMoveTime = 5
superMoveTime = 5
ignoreHitPause = 1

[State -1, D, U: Up]
type = Explod
triggerAll = NumExplod(90010002) || NumExplod(90010052)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command = "up" && Helper(90000005), command != "back" && Helper(90000005), command != "down" && Helper(90000005), command != "fwd"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" && Helper(90000005), command != "back" && Helper(90000005), command != "up" && Helper(90000005), command != "fwd"
anim = 9999
ID = 90012708
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1



;==============================================================================================
;====================================<DOWN, DOWN, DOWN>========================================
;==============================================================================================

;==============================================================================================
;And this is just extending the principle futher, to a third down input! This is typically used
;as a super command.
;==============================================================================================

[State -1, D, D, D: 2nd Neutral]
type = Explod
triggerAll = (NumExplod(90000001) || NumExplod(90000002) || NumExplod(90000003)) && NumExplod(90012602)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd" && Helper(90000005), command != "back" && Helper(90000005), command != "holdback" && Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
anim = 9999
ID = 90032605
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, Remove D, D, D: 2nd Neutral]
type = RemoveExplod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = NumExplod(90000004) || NumExplod(90000007) || NumExplod(90000008) || NumExplod(90000009) || NumExplod(90000006)
trigger2 = !NumExplod(90012602)
ID = 90032605
ignoreHitPause = 1

[State -1, D, D, D: 3rd Down]
type = Explod
triggerAll = NumExplod(90032605) && NumExplod(90012602)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "down" || Helper(90000005), command = "dfwd" || Helper(90000005), command = "dback"
trigger1 = Helper(90000005), command != "up"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "ufwd" || Helper(90000005), command = "uback"
trigger2 = Helper(90000005), command != "down"
anim = 9999
ID = 90032602
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1

;==============================================================================================
;===========================<SHUN GOKU SATSU/x, x, FORWARD, a, z>==============================
;==============================================================================================

;==============================================================================================
;This move to demonstrates how button press commands work: note that we use unique button press explods
;here because we need to keep track of what order the buttons have been pressed in, and because
;unlike the regular button inputs, which only stay active for a fairly brief period of time, the
;button inputs for the Shun Goku Satsu motion stay active for the same period of time that all other
;directional commands do.
;==============================================================================================

;This is the 2nd x input for this move, but it goes above the 1st x input because otherwise, a single
;press of x would activate both explods! Placing it above the 1st means that x must be input twice, each
;on separate ticks.
[State -1, x, x, F, a, z: 2nd x]
type = Explod
triggerAll = NumExplod(94000200)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "x"
anim = 9999
ID = 94000201
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, x, x, F, a, z: 1st x]
type = Explod
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "x"
anim = 9999
ID = 94000200
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1


;This forward input is a little bit tricky and weird. We have it patterned after SFA and other CPS2 games
;here, where it behaves a little differently compared to how most games (including SFA itself) operate
;for moves done in or inputted while in the air (see http://mugenguild.com/forum/msg.2366955 for a discussion
;about how most games operate). In CPS2 games, if you jump over an opponent while inputting this command,
;"forward" won't have flipped directions until you land. This is in contrast to how the move behaves in SFIII
;and elsewhere. Remove the "StateType != A" in the triggers below to have it work like SFIII/most other games.

;An additional item of interest here is that directional inputs in (most) games's command supers accept diagonals
;in place of cardinal directional inputs; i.e., "LP, LP, DF, LK, HP" would still activate an SGS in SFA2. Weirdly
;enough, though diagonals are allowed in SFA2, SFIII, and the Darkstalkers series, SFA3 only allows a cardinal input!
;SNK games also only allow cardinal inputs. We however have opted to follow Capcom's (usual) method and allow diagonals.
[State -1, x, x, F, a, z: Forward]
type = Explod
triggerAll = NumExplod(94000201)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = ifElse(P2dist x < 0 && StateType != A, Facing = -1, Facing = 1)
trigger1 = (Helper(90000005), command = "fwd" || Helper(90000005), command = "dfwd" || Helper(90000005), command = "ufwd") && Helper(90000005), command != "back"
trigger2 = ifElse(P2dist x < 0 && StateType != A, Facing = 1, Facing = -1)
trigger2 = (Helper(90000005), command = "back" || Helper(90000005), command = "dback" || Helper(90000005), command = "uback") && Helper(90000005), command != "fwd"
anim = 9999
ID = 94000006
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, x, x, F, a, z: a]
type = Explod
triggerAll = NumExplod(94000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "a"
anim = 9999
ID = 94000230
removeTime = 10
pauseMoveTime = 10
superMoveTime = 10
ignoreHitPause = 1

[State -1, x, x, F, a, z: z]
type = Explod
triggerAll = NumExplod(94000230)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command = "z"
anim = 9999
ID = 94000220
removeTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
pauseMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
superMoveTime = 10 + ifElse(HitPauseTime, HitPauseTime - 1, 0)
ignoreHitPause = 1


;==============================================================================================
;===============================<REMOVE DIRECTIONAL DETECTORS>=================================
;==============================================================================================

;==============================================================================================
;This block of RemoveExplods gets rid of any active release detector explods; if the direction in
;question isn't currently being input, or if the direction is being input but other directions are
;also being input, then the detector explod is removed, having served its purpose as a detector.
;This must go at the very bottom of the entire EXPLODsive Buffering system code!
;==============================================================================================

[State -1, Remove Down Detector]
type = RemoveExplod
triggerAll = NumExplod(90000002)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
id = 90000002
ignoreHitPause = 1

[State -1, Remove Down-Right Detector]
type = RemoveExplod
triggerAll = NumExplod(90000003)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command != "down" && Helper(90000005), command != "holddown") || (Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd")
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = (Helper(90000005), command != "up" && Helper(90000005), command != "holdup") || (Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd")
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger4 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
id = 90000003
ignoreHitPause = 1

[State -1, Remove Right Detector]
type = RemoveExplod
triggerAll = NumExplod(90000006)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
id = 90000006
ignoreHitPause = 1

[State -1, Remove Up-Right Detector]
type = RemoveExplod
triggerAll = NumExplod(90000009)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command != "up" && Helper(90000005), command != "holdup") || (Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd")
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = (Helper(90000005), command != "down" && Helper(90000005), command != "holddown") || (Helper(90000005), command != "fwd" && Helper(90000005), command != "holdfwd")
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd"
trigger4 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
id = 90000009
ignoreHitPause = 1

[State -1, Remove Up Detector]
type = RemoveExplod
triggerAll = NumExplod(90000008)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = Helper(90000005), command != "up" && Helper(90000005), command != "holdup"
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = Helper(90000005), command != "down" && Helper(90000005), command != "holddown"
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "back" || Helper(90000005), command = "holdback" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
id = 90000008
ignoreHitPause = 1

[State -1, Remove Up-Left Detector]
type = RemoveExplod
triggerAll = NumExplod(90000007)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command != "up" && Helper(90000005), command != "holdup") || (Helper(90000005), command != "back" && Helper(90000005), command != "holdback")
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = (Helper(90000005), command != "down" && Helper(90000005), command != "holddown") || (Helper(90000005), command != "back" && Helper(90000005), command != "holdback")
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger4 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
id = 90000007
ignoreHitPause = 1

[State -1, Remove Left Detector]
type = RemoveExplod
triggerAll = NumExplod(90000004)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "back" && Helper(90000005), command != "holdback"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown" || Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
id = 90000004
ignoreHitPause = 1

[State -1, Remove Down-Left Detector]
type = RemoveExplod
triggerAll = NumExplod(90000001)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = (Helper(90000005), command != "down" && Helper(90000005), command != "holddown") || (Helper(90000005), command != "back" && Helper(90000005), command != "holdback")
trigger2 = !NumExplod(92828282) && !NumExplod(92468246)
trigger2 = Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
trigger2 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger2 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger3 = NumExplod(92828282) || NumExplod(92468246)
trigger3 = (Helper(90000005), command != "up" && Helper(90000005), command != "holdup") || (Helper(90000005), command != "back" && Helper(90000005), command != "holdback")
trigger4 = NumExplod(92828282) || NumExplod(92468246)
trigger4 = Helper(90000005), command = "up" || Helper(90000005), command = "holdup"
trigger4 = Helper(90000005), command = "back" || Helper(90000005), command = "holdback"
trigger4 = Helper(90000005), command = "fwd" || Helper(90000005), command = "holdfwd" || Helper(90000005), command = "down" || Helper(90000005), command = "holddown"
id = 90000001
ignoreHitPause = 1



;==============================================================================================
;==============================<REMOVE RELEASE BUTTON DETECTORS>===============================
;==============================================================================================

;==============================================================================================
;Same principle here as with the directional release detector explods.
;==============================================================================================

[State -1, Remove x Detector]
type = RemoveExplod
triggerAll = NumExplod(90000201)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "x" && Helper(90000005), command != "holdx"
ID = 90000201
ignoreHitPause = 1

[State -1, Remove y Detector]
type = RemoveExplod
triggerAll = NumExplod(90000211)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "y" && Helper(90000005), command != "holdy"
ID = 90000211
ignoreHitPause = 1

[State -1, Remove z Detector]
type = RemoveExplod
triggerAll = NumExplod(90000221)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "z" && Helper(90000005), command != "holdz"
ID = 90000221
ignoreHitPause = 1

[State -1, Remove a Detector]
type = RemoveExplod
triggerAll = NumExplod(90000231)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "a" && Helper(90000005), command != "holda"
ID = 90000231
ignoreHitPause = 1

[State -1, Remove b Detector]
type = RemoveExplod
triggerAll = NumExplod(90000241)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "b" && Helper(90000005), command != "holdb"
ID = 90000241
ignoreHitPause = 1

[State -1, Remove c Detector]
type = RemoveExplod
triggerAll = NumExplod(90000251)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "c" && Helper(90000005), command != "holdc"
ID = 90000251
ignoreHitPause = 1

[State -1, Remove start Detector]
type = RemoveExplod
triggerAll = NumExplod(90000194)
triggerAll = NumHelper(90000005) && !IsHelper && !AILevel
trigger1 = Helper(90000005), command != "start" && Helper(90000005), command != "holdstart"
ID = 90000194
ignoreHitPause = 1


;==============================================================================================
;==========================================<GUARDING>==========================================
;==============================================================================================

;==============================================================================================
;Here, we override the MUGEN's default guard system when the character is airborne, and add our
;own triggers. This will ensure that the player can always block as long as they are holding a
;direction away from the opponent. This block of code also adds "chicken guarding", which is allowing
;the player to air guard by holding not only back, but down-back and up-back.

;It is also recommended that you also override the guard states (120, 130, 131, 132, 140, 150, 151,
;152, 154, 155) with an updated version that uses the EXPLODsive buffering system. A copy of those
;fixed states can be found here: http://network.mugenguild.com/jmorphman/resources/EXPLODsiveBuffering_GuardStates.txt
;==============================================================================================

[State -1, AssertSpecial: NoAirGuard]
type = AssertSpecial
trigger1 = P2dist x < 0 && StateType = A
trigger1 = !AILevel
flag = NoAirGuard
ignoreHitPause = 0

[State -1, Air Blocking]
type = ChangeState
triggerAll = !AILevel
triggerAll = InGuardDist
triggerAll = StateType = A
triggerAll = ctrl
triggerAll = !(StateNo = [120,155])
triggerAll = !NumExplod(90000004) && !NumExplod(90000006) && !NumExplod(90000001) && !NumExplod(90000003) && !NumExplod(90000007) && !NumExplod(90000009)
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000004)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000006))
trigger2 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000001)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000003))
trigger3 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000007)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000009))
value = 120

;These three state controllers are only used in three siuations: when the character has landed from a jump
;after switching sides (to get around a MUGEN bug where a character's directions don't switch until a
;tick has passed, after they've landed from a jump and switched sides); if one of the control reversing
;explods is active, or if (on a keyboard) two opposite directions are held simultaneously. For the first
;two cases, guarding should still be possible, but in the third, guarding should be disabled. In all other
;situations, MUGEN's default guard behavior works well enough!

;The first state controller disables MUGEN's normal guard system if any of of these scenarios occur.
[State -1, AssertSpecial: No StandGuard and NoCrouchGuard]
type = AssertSpecial
triggerAll = !AILevel
trigger1 = P2dist x < 0 && StateType != A
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger3 = command = "holdback" && command = "holdfwd" || command = "holdup" && command = "holddown"
flag = NoStandGuard
flag2 = NoCrouchGuard
ignoreHitPause = 0

;The next two state controllers serve to manually direct the character into a guard state, but only
;if the one of the first two situations occurs; the third scenario should not trigger guarding because
;of the conflicting directional inputs.
[State -1, Stand Blocking]
type = ChangeState
triggerAll = !AILevel
triggerAll = InGuardDist
triggerAll = (P2dist x < 0 && StateType != A) || NumExplod(94646464) || NumExplod(92468246)
triggerAll = StateType = S
triggerAll = ctrl
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000004)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000006))
value = 120

[State -1, Crouch Blocking]
type = ChangeState
triggerAll = !AILevel
triggerAll = InGuardDist
triggerAll = (P2dist x < 0 && StateType != A) || NumExplod(94646464) || NumExplod(92468246)
triggerAll = StateType = C
triggerAll = ctrl
trigger1 = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000001)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000003))
value = 120



;==============================================================================================
;==============================================================================================
;=============================<End of EXPLODsive Buffering System>=============================
;==============================================================================================
;==============================================================================================

;===========================================================================
;---------------------------------------------------------------------------
;And They Don't Stop Busting (uses two super bars)
[State -1, And They Don't Stop Busting]
type = ChangeState
value = 3600
triggerall = var(59) = 0
triggerall = command = "ProtagonistPairUp"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = numpartner
triggerall = p3name = "Straight Buster" 
triggerall = partner, alive
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1200
trigger6 = numhelper(1201)
trigger6 = helper(1201), movecontact
trigger7 = stateno = 1220
trigger7 = numhelper(1223)
trigger7 = helper(1223), movecontact
trigger8 = stateno = 1600 || stateno = 1610
trigger8 = numhelper(1601)
trigger8 = helper(1601), moveguarded
trigger9 = stateno = 1620
trigger9 = time >= 22
trigger10 = stateno = 11072
trigger10 = time >= 2

;---------------------------------------------------------------------------
;Protagonist Pair-Up (uses two super bars)
[State -1, Protagonist Pair-Up]
type = ChangeState
value = 3500
triggerall = teammode = simul
triggerall = var(59) = 0
triggerall = command = "ProtagonistPairUp"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = numpartner
triggerall = partner, name = "Bodega Ameze"  
triggerall = partner, alive
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3700)
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1200
trigger6 = numhelper(1201)
trigger6 = helper(1201), movecontact
trigger7 = stateno = 1220
trigger7 = numhelper(1223)
trigger7 = helper(1223), movecontact
trigger8 = stateno = 1600 || stateno = 1610
trigger8 = numhelper(1601)
trigger8 = helper(1601), moveguarded
trigger9 = stateno = 1620
trigger9 = time >= 22
trigger10 = stateno = 11072
trigger10 = time >= 2

;---------------------------------------------------------------------------
;Power Mortar (uses one super bar)
[State -1, Power Mortar]
type = ChangeState
value = 3000
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90032506)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90032404))
triggerall = numexplod(90000210) && numexplod(90000220)
;triggerall = command = "PowerGeyser"
triggerall = !numhelper(3006)
triggerall = power >= 1000 || var(38)
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1105
trigger6 = time >= 32
trigger7 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger8 = stateno = 1200
trigger8 = numhelper(1201)
trigger8 = helper(1201), movecontact
trigger9 = stateno = 1220
trigger9 = numhelper(1223)
trigger9 = helper(1223), movecontact
trigger10 = stateno = 1600 || stateno = 1610
trigger10 = numhelper(1601)
trigger10 = helper(1601), moveguarded
trigger11 = stateno = 1620
trigger11 = time >= 22
trigger12 = stateno = 11072
trigger12 = time >= 2


;---------------------------------------------------------------------------
;Limewire Go Bang! (uses one super bar)
[State -1, Limewire Go Bang!]
type = ChangeState
value = 3050
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90032506)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90032404))
triggerall =  numexplod(90000210) && numexplod(90000220)
;triggerall = command = "PowerGeyser"
triggerall = numhelper(3006)
triggerall = power >= 1000 || var(38)
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger7 = stateno = 1100
trigger7 = numhelper(1102)
trigger7 = helper(1102), movecontact
trigger8 = stateno = 1320
trigger8 = numhelper(1321)
trigger8 = helper(1321), movecontact
trigger9 = stateno = 1410
trigger9 = numhelper(1412)
trigger9 = helper(1412), movecontact
trigger10 = stateno = 1500 || stateno = 1502 || stateno = 1503 || stateno = 15030
trigger10 = numhelper(1504)
trigger10 = helper(1504), movecontact
trigger11 = stateno = 11072
trigger11 = time >= 2
trigger12 = stateno = 1620
trigger12 = time >= 22

;---------------------------------------------------------------------------
;Buster Vacation (uses one super bar)
[State -1, Buster Vacation]
type = ChangeState
value = 3700
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000210) && numexplod(90000220)
;triggerall = command = "BusterVacation"
triggerall = power >= 3000 || var(38) && power >= 2000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger7 = stateno = 1100
trigger7 = numhelper(1102)
trigger7 = helper(1102), movecontact
trigger8 = stateno = 1320
trigger8 = numhelper(1321)
trigger8 = helper(1321), movecontact
trigger9 = stateno = 1410
trigger9 = numhelper(1412)
trigger9 = helper(1412), movecontact
trigger10 = stateno = 1500 || stateno = 1502 || stateno = 1503 || stateno = 15030
trigger10 = numhelper(1504)
trigger10 = helper(1504), movecontact
trigger11 = stateno = 11072
trigger11 = time >= 2
trigger12 = stateno = 3050 || stateno = 3101 || stateno = 3151 || stateno = 3153
trigger12 = time >= 14
trigger13 = stateno = 1620
trigger13 = time >= 22

;---------------------------------------------------------------------------
;Hungry Hunter Buster Wolf (uses one super bar)
[State -1, Hungry Hunter Buster Wolf]
type = ChangeState
value = 3300
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010203)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010301))
triggerall = numexplod(90000210) && numexplod(90000220)
;triggerall = command = "HungryHunterBusterWolf"
triggerall = power >= 3000 || var(38) && power >= 2000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger7 = stateno = 1100
trigger7 = numhelper(1102)
trigger7 = helper(1102), movecontact
trigger8 = stateno = 1320
trigger8 = numhelper(1321)
trigger8 = helper(1321), movecontact
trigger9 = stateno = 1410
trigger9 = numhelper(1412)
trigger9 = helper(1412), movecontact
trigger10 = stateno = 1500 || stateno = 1502 || stateno = 1503 || stateno = 15030
trigger10 = numhelper(1504)
trigger10 = helper(1504), movecontact
trigger11 = stateno = 11072
trigger11 = time >= 2
trigger12 = stateno = 3050 || stateno = 3101 || stateno = 3151 || stateno = 3153
trigger12 = time >= 14
trigger13 = stateno = 1620
trigger13 = time >= 22

;---------------------------------------------------------------------------
;Arm Wrestling with Crackheads (uses two super bars)
[State -1, Arm Wrestling with Crackheads]
type = ChangeState
value = 3200
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000240) && numexplod(90000250)
;triggerall = command = "CrackheadArmWrestling"
triggerall = power >= 2000 || var(38) && power >= 1000
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, HA
trigger2 = stateno != 1420 && stateno != 1421
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger7 = stateno = 1100
trigger7 = numhelper(1102)
trigger7 = helper(1102), movecontact
trigger8 = stateno = 1320
trigger8 = numhelper(1321)
trigger8 = helper(1321), movecontact
trigger9 = stateno = 1410
trigger9 = numhelper(1412)
trigger9 = helper(1412), movecontact
trigger10 = stateno = 1500 || stateno = 1502 || stateno = 1503 || stateno = 15030
trigger10 = numhelper(1504)
trigger10 = helper(1504), movecontact
trigger11 = stateno = 11070 || stateno = 11072
trigger11 = time >= 2
trigger12 = stateno = 1620
trigger12 = time >= 22

;---------------------------------------------------------------------------
;A Buster Wolf Seen From Above (uses one super bar)
[State -1, A Buster Wolf Seen From Above]
type = ChangeState
value = 3160
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000240) && numexplod(90000250)
;triggerall = command = "BusterWolf"
triggerall = power >= 1000 || var(38)
triggerall = pos y <= -15
triggerall = statetype = A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, HA
trigger2 = stateno != 1420 && stateno != 1421
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 || stateno = 1415
trigger7 = stateno = 1100
trigger7 = numhelper(1102)
trigger7 = helper(1102), movecontact
trigger8 = stateno = 1320
trigger8 = numhelper(1321)
trigger8 = helper(1321), movecontact
trigger9 = stateno = 1410
trigger9 = numhelper(1412)
trigger9 = helper(1412), movecontact
trigger10 = stateno = 1500 || stateno = 1502 || stateno = 1503 || stateno = 15030
trigger10 = numhelper(1504)
trigger10 = helper(1504), movecontact
trigger11 = stateno = 11070 || stateno = 11072
trigger11 = time >= 2
trigger12 = stateno = 1432
trigger12 = pos y <= -30


;---------------------------------------------------------------------------
;Buster Wolf (uses one super bar)
[State -1, Buster Wolf]
type = ChangeState
value = 3100
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000240) && numexplod(90000250)
;triggerall = command = "BusterWolf"
triggerall = power >= 1000 || var(38)
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3700]
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1405 ||stateno = 1415 || stateno = 1432
trigger7 = stateno = 1200
trigger7 = numhelper(1201)
trigger7 = helper(1201), movecontact
trigger8 = stateno = 1220
trigger8 = numhelper(1223)
trigger8 = helper(1223), movecontact
trigger9 = stateno = 1600 || stateno = 1610
trigger9 = numhelper(1601)
trigger9 = helper(1601), moveguarded
trigger10 = stateno = 1620
trigger10 = time >= 22
trigger11 = stateno = 11072
trigger11 = time >= 2

;---------------------------------------------------------------------------
;Are You Okay? (uses two super bars)
[State -1, Buster Vacation]
type = ChangeState
value = 3800
triggerall = var(59) = 0
triggerall = numexplod(94000220)
;triggerall = command = "AreYouOkay"
triggerall = power >= 2000 || var(38) && power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = stateno = 200
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 203 && movecontact
trigger24 = stateno = 204 && movecontact
trigger25 = stateno = 205 && movecontact
trigger26 = stateno = 452

;---------------------------------------------------------------------------
;Hat of Helpers (uses one super bar)
[State -1, Hat of Helpers]
type = ChangeState
value = 3400
triggerall = var(59) = 0
triggerall = numexplod(90032602)
triggerall = numexplod(90000240) && numexplod(90000250)
;triggerall = command = "HatofHelpers"
triggerall = !numhelper(3401)
triggerall = power >= 2000 || var(38) && power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 203 && movecontact
trigger24 = stateno = 204 && movecontact
trigger25 = stateno = 205 && movecontact
trigger26 = stateno = 452

;===========================================================================
;---------------------------------------------------------------------------
;Roll Backward
[State -1, Roll Backward]
type = ChangeState
value = 705
triggerall = var(59) = 0
triggerall = (numexplod(900000200) || command = "x") && (numexplod(900000250) || command = "a") 
;triggerall = command = "Roll"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 42050 && time >= 8) || stateno = 40 ;For easier roll cancels into the charge moves
trigger1 = var(3) := 1

;---------------------------------------------------------------------------
;Roll
[State -1, Roll]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = (numexplod(900000200) || command = "x") && (numexplod(900000250) || command = "a") 
;triggerall = command = "Roll"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 42050 && time >= 8) || stateno = 40 ;For easier roll cancels into the charge moves
trigger1 = var(3) := 1

[State 0, Null]
type = Null
trigger1 = stateno = 700
trigger1 = numexplod(90000205)
trigger1 = var(3) := 0
trigger2 = stateno = 705
trigger2 = numexplod(90000205)
trigger2 = var(3) := 0

;---------------------------------------------------------------------------
;Air Dodge
[State -1, Air Dodge]
type = ChangeState
value = 710
triggerall = var(59) = 0
triggerall = (numexplod(900000200) || command = "x") && (numexplod(900000250) || command = "a") 
;triggerall = command = "Roll"
triggerall = statetype = A
trigger1 = ctrl || (stateno = 42051 && time >= 8)

;---------------------------------------------------------------------------
;Bongo Buckshot
[State -1, Bongo Buckshot]
type = ChangeState
value = 1600
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90032506)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90032404))
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "Buckshot_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700 && !var(3)
trigger24 = stateno = 705 && !var(3)
trigger25 = stateno = 203 && movecontact
trigger26 = stateno = 204 && movecontact
trigger27 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
;Bongo Beam
[State -1, Bongo Beam]
type = ChangeState
value = 1620
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90032506)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90032404))
triggerall = numexplod(90000220)|| numexplod(90000225)
;triggerall = command = "Buckshot_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700
trigger24 = stateno = 705
trigger25 = stateno = 203 && movecontact
trigger26 = stateno = 204 && movecontact
trigger27 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
;Bongo Buckshot
[State -1, Bongo Buckshot]
type = ChangeState
value = 1610
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90032506)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90032404))
triggerall = numexplod(90000210)|| numexplod(90000215)
;triggerall = command = "Buckshot_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700
trigger24 = stateno = 705
trigger25 = stateno = 203 && movecontact
trigger26 = stateno = 204 && movecontact
trigger27 = stateno = 205 && movecontact

;---------------------------------------------------------------------------
;Power Dunk
[State -1, Power Dunk]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010203)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010301))
triggerall = numexplod(90000230) || numexplod(90000235)
;triggerall = command = "PowerDunk_a"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 600 && movecontact
trigger22 = stateno = 610 && movecontact
trigger23 = stateno = 620 && movecontact
trigger24 = stateno = 630 && movecontact
trigger25 = stateno = 640 && movecontact
trigger26 = stateno = 650 && movecontact
trigger27 = stateno = 452
trigger28 = stateno = 1510 && movecontact
trigger29 = stateno = 1520
trigger29 = movecontact || time >= 16
trigger30 = stateno = 700 && !var(3)
trigger31 = stateno = 705 && !var(3)
trigger32 = stateno = 1106 && movecontact
trigger33 = stateno = 500 && prevstateno = 1106
trigger34 = stateno = 105

;---------------------------------------------------------------------------
;Come on and Slam!
[State -1, Come on and Slam!]
type = ChangeState
value = 1410
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010203)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010301))
triggerall = numexplod(90000240) || numexplod(90000245)
;triggerall = command = "PowerDunk_b"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 600 && movecontact
trigger22 = stateno = 610 && movecontact
trigger23 = stateno = 620 && movecontact
trigger24 = stateno = 630 && movecontact
trigger25 = stateno = 640 && movecontact
trigger26 = stateno = 650 && movecontact
trigger27 = stateno = 452
trigger28 = stateno = 1510 && movecontact
trigger29 = stateno = 1520
trigger29 = movecontact || time >= 16
trigger30 = stateno = 700
trigger31 = stateno = 705
trigger32 = stateno = 1106 && movecontact
trigger33 = stateno = 500 && prevstateno = 1106
trigger34 = stateno = 105

;---------------------------------------------------------------------------
;Shooting Star Dunk
[State -1, Shooting Star Dunk]
type = ChangeState
value = 1430
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010203)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010301))
triggerall = numexplod(90000250) || numexplod(90000255)
;triggerall = command = "PowerDunk_c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 1106 && movecontact
trigger9 = stateno = 500 && prevstateno = 1106
trigger10 = stateno = 105

;---------------------------------------------------------------------------
;Chaos Dunk
[State -1, Chaos Dunk]
type = ChangeState
value = 1420
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010203)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010301))
triggerall = numexplod(90000250) || numexplod(90000255)
;triggerall = command = "PowerDunk_c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 452
trigger22 = stateno = 1510 && movecontact
trigger23 = stateno = 1520
trigger23 = movecontact || time >= 16
trigger24 = stateno = 700
trigger25 = stateno = 705

;---------------------------------------------------------------------------
;Rocket Charge
[State -1, Rocket Charge]
type = ChangeState
value = 1500
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000230) || numexplod(90000235)
triggerall = !numhelper(1501)
;triggerall = command = "PowerCharge_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 452
trigger23 = stateno = 700 && !var(3)
trigger24 = stateno = 705 && !var(3)

;---------------------------------------------------------------------------
;Skamtebord
[State -1, Skamtebord]
type = ChangeState
value = 1520
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000250)
;triggerall = command = "PowerCharge_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 452
trigger23 = stateno = 700
trigger24 = stateno = 705


;---------------------------------------------------------------------------
;Power Charge
[State -1, Power Charge]
type = ChangeState
value = 1510
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000240)
;triggerall = command = "PowerCharge_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 203 && movehit
trigger6 = stateno = 204 && movehit
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 211 && movecontact
trigger9 = (stateno = 212 || stateno = 213) && movecontact
trigger10 = stateno = 221 && movehit
trigger11 = stateno = 223 && movecontact
trigger12 = stateno = 230 && movecontact
trigger13 = stateno = 231 && movecontact
trigger14 = stateno = 232 && movecontact
trigger15 = stateno = 233 && movecontact
trigger16 = (stateno = 234 || stateno = 235) && movecontact
trigger17 = stateno = 240 && movecontact
trigger18 = stateno = 241 && movecontact
trigger19 = stateno = 400 && movecontact
trigger20 = stateno = 410 && movecontact
trigger21 = stateno = 420 && movecontact
trigger22 = stateno = 430 && movecontact
trigger23 = stateno = 440 && movecontact
trigger24 = stateno = 450 && movecontact
trigger25 = stateno = 452
trigger26 = stateno = 700
trigger27 = stateno = 705

;---------------------------------------------------------------------------
;Power Dunk (Backdash cancel shortcut)
[State -1, Power Dunk]
type = ChangeState
value = 1400
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000230) || numexplod(90000235)
;triggerall = command = "PowerDunk_a"
trigger1 = stateno = 105

;---------------------------------------------------------------------------
;Come on and Slam! (Backdash cancel shortcut)
[State -1, Come on and Slam!]
type = ChangeState
value = 1410
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000240) || numexplod(90000245)
;triggerall = command = "PowerDunk_b"
trigger1 = stateno = 105

;---------------------------------------------------------------------------
;Shooting Star Dunk (Backdash cancel shortcut)
[State -1, Shooting Star Dunk]
type = ChangeState
value = 1430
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010406)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010504))
triggerall = numexplod(90000250) || numexplod(90000255)
;triggerall = command = "PowerDunk_c"
trigger1 = statetype = A
trigger1 = stateno = 105

;---------------------------------------------------------------------------
;Slow Down With The Power Waves Dudeo
[State -1, Slow Down With The Power Waves Dudeo]
type = ChangeState
value = 1040
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "PowerWave_x" 
triggerall = numhelper(1001)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700 && !var(3)
trigger24 = stateno = 705 && !var(3)

;---------------------------------------------------------------------------
;Slow Down With The Power Waves Dudeo
[State -1, Slow Down With The Power Waves Dudeo]
type = ChangeState
value = 1040
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000210) || numexplod(90000215) || numexplod(90000220) || numexplod(90000225)
;triggerall = command = "PowerWave_y" || command = "PowerWave_z"
triggerall = numhelper(1001)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700
trigger24 = stateno = 705

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1020
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000220)|| numexplod(90000225)
triggerall = !numhelper(1001)
;triggerall = command = "PowerWave_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700
trigger24 = stateno = 705

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1026
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1000
trigger1 = time >= 20
trigger1 = time <= 50
trigger2 = stateno = 1010
trigger2 = time >= 20
trigger2 = time <= 50
trigger3 = stateno = 1020
trigger3 = time >= 20
trigger3 = time <= 50

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1027
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1004
trigger1 = time >= 20
trigger1 = time <= 55
trigger2 = stateno = 1016
trigger2 = time >= 20
trigger2 = time <= 55
trigger3 = stateno = 1026
trigger3 = time >= 20
trigger3 = time <= 55

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1000
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "PowerWave_x"
triggerall = !numhelper(1001)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700 && !var(3)
trigger24 = stateno = 705 && !var(3)


;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1004
triggerall = var(59) = 0
triggerall = numexplod(90000200)
;triggerall = command = "x"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1000
trigger1 = time >= 20
trigger1 = time <= 50
trigger2 = stateno = 1010
trigger2 = time >= 20
trigger2 = time <= 50
trigger3 = stateno = 1020
trigger3 = time >= 20
trigger3 = time <= 50

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1005
triggerall = var(59) = 0
triggerall = numexplod(90000200)
;triggerall = command = "x"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1004
trigger1 = time >= 20
trigger1 = time <= 55
trigger2 = stateno = 1016
trigger2 = time >= 20
trigger2 = time <= 55
trigger3 = stateno = 1026
trigger3 = time >= 20
trigger3 = time <= 55

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1010
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010006)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010104))
triggerall = numexplod(90000210)|| numexplod(90000215)
triggerall = !numhelper(1001)
;triggerall = command = "PowerWave_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 230 && movecontact
trigger9 = stateno = 231 && movecontact
trigger10 = stateno = 232 && movecontact
trigger11 = stateno = 233 && movecontact
trigger12 = (stateno = 234 || stateno = 235) && movecontact
trigger13 = stateno = 240 && movecontact
trigger14 = stateno = 241 && movecontact
trigger15 = stateno = 400 && movecontact
trigger16 = stateno = 410 && movecontact
trigger17 = stateno = 420 && movecontact
trigger18 = stateno = 430 && movecontact
trigger19 = stateno = 440 && movecontact
trigger20 = stateno = 450 && movecontact
trigger21 = (stateno = 220 || stateno = 223) && movecontact
trigger22 = stateno = 221 && movecontact
trigger23 = stateno = 700
trigger24 = stateno = 705


;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1016
triggerall = var(59) = 0
triggerall = numexplod(90000210)
;triggerall = command = "y"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1000
trigger1 = time >= 20
trigger1 = time <= 50
trigger2 = stateno = 1010
trigger2 = time >= 20
trigger2 = time <= 50
trigger3 = stateno = 1020
trigger3 = time >= 20
trigger3 = time <= 50

;---------------------------------------------------------------------------
;Power Wave
[State -1, Power Wave]
type = ChangeState
value = 1017
triggerall = var(59) = 0
triggerall = numexplod(90000210)
;triggerall = command = "y"
triggerall = statetype != A
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1004
trigger1 = time >= 20
trigger1 = time <= 55
trigger2 = stateno = 1016
trigger2 = time >= 20
trigger2 = time <= 55
trigger3 = stateno = 1026
trigger3 = time >= 20
trigger3 = time <= 55

;---------------------------------------------------------------------------
;Gamers Rise Up
[State -1, Gamers Rise Up]
type = ChangeState
value = 1120+floor(fvar(1))
triggerall = var(59) = 0
triggerall = numexplod(90010808)
triggerall = numexplod(90000220)
;triggerall = command = "Rising_z"
trigger1 = ctrl || stateno = [10,101]
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 600 && movecontact
trigger23 = stateno = 610 && movecontact
trigger24 = stateno = 620 && movecontact
trigger25 = stateno = 630 && movecontact
trigger26 = stateno = 640 && movecontact
trigger27 = stateno = 650 && movecontact
trigger28 = stateno = 1101
trigger29 = prevstateno = 1100
trigger30 = stateno = 700
trigger31 = stateno = 705
trigger32 = stateno = 1520
trigger32 = movecontact || time >= 16
trigger33 = stateno = 1106 && movecontact
trigger34 = stateno = 500 && prevstateno = 1106
trigger35 = stateno = 452


;---------------------------------------------------------------------------
;Rising Tacos - Buckethead
[State -1, Rising Tacos - Buckethead]
type = ChangeState
value = 1106
triggerall = var(59) = 0
triggerall = statetype = A
triggerall = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = command = "x" || command = "y" || command = "z"

;---------------------------------------------------------------------------
;Rising Tacos - Riser Kick
[State -1, Rising Tacos - Riser Kick]
type = ChangeState
value = 1107
triggerall = var(59) = 0
triggerall = statetype = A
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = command = "a" || command = "b"
trigger2 = var(37) <= 1
trigger2 = stateno = 11070
trigger2 = time >= 25
trigger2 = time <= 40
trigger2 = command = "a" || command = "b"

;---------------------------------------------------------------------------
;Rising Tacos - Riser Kick
[State -1, Rising Tacos - Riser Kick]
type = ChangeState
value = 1104
triggerall = var(59) = 0
triggerall = statetype = A
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = command = "c"
trigger2 = stateno = 11070
trigger2 = time >= 22
trigger2 = time <= 40
trigger2 = command = "c"
trigger3 = var(37) > 1
trigger3 = stateno = 11070
trigger3 = time >= 25
trigger3 = time <= 40
trigger3 = command = "a" || command = "b"

;---------------------------------------------------------------------------
;Rising Tacos
[State -1, Rising Tacos]
type = ChangeState
value = 1100
triggerall = var(59) = 0
triggerall = numexplod(90010808)
triggerall = numexplod(90000200) || numexplod(90000205)
triggerall = prevstateno != 1106
;triggerall = command = "Rising_x"
trigger1 = ctrl || stateno = [10,101]
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 600 && movecontact
trigger23 = stateno = 610 && movecontact
trigger24 = stateno = 620 && movecontact
trigger25 = stateno = 630 && movecontact
trigger26 = stateno = 640 && movecontact
trigger27 = stateno = 650 && movecontact
trigger28 = stateno = 700 && !var(3)
trigger29 = stateno = 705 && !var(3)
trigger30 = stateno = 1520
trigger30 = movecontact || time >= 16
trigger31 = stateno = 452

;---------------------------------------------------------------------------
;Falling Tackle
[State -1, Falling Tackle]
type = ChangeState
value = 1130
triggerall = var(59) = 0
triggerall = numexplod(90010808)
triggerall = numexplod(90000210)
;triggerall = command = "Rising_y"
triggerall = statetype = A
trigger1 = ctrl || stateno = [10,101]
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 700
trigger9 = stateno = 705
trigger10 = stateno = 1106 && movecontact
trigger11 = stateno = 500 && prevstateno = 1106

;---------------------------------------------------------------------------
;Big Head Mode
[State -1, Big Head Mode]
type = ChangeState
value = 1110
triggerall = var(59) = 0
triggerall = numexplod(90010808)
triggerall = numexplod(90000210)
;triggerall = command = "Rising_y"
triggerall = statetype != A
trigger1 = ctrl || stateno = [10,101]
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 700
trigger23 = stateno = 705
trigger24 = stateno = 1520
trigger24 = movecontact || time >= 16
trigger25 = numexplod(16001110)
trigger25 = stateno = 1600 || stateno = 1610
trigger25 = time >= 26
trigger26 = stateno = 452

;---------------------------------------------------------------------------
;Crack Shoot
[State -1, Crack Shoot]
type = ChangeState
value = 1300
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000230) || numexplod(90000235)
;triggerall = command = "CrackShoot_a"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact || stateno = 452
trigger22 = stateno = 600 && movecontact
trigger23 = stateno = 610 && movecontact
trigger24 = stateno = 620 && movecontact
trigger25 = stateno = 630 && movecontact
trigger26 = stateno = 640 && movecontact
trigger27 = stateno = 650 && movecontact
trigger28 = stateno = 1520
trigger28 = movecontact || time >= 16
trigger29 = stateno = 700 && !var(3)
trigger30 = stateno = 705 && !var(3)
trigger31 = stateno = 1106 && movecontact
trigger32 = stateno = 500 && prevstateno = 1106

;---------------------------------------------------------------------------
;Crack Shoot
[State -1, Crack Shoot]
type = ChangeState
value = 1310
triggerall = var(59) = 0
triggerAll = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000240)
;triggerall = command = "CrackShoot_b"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact || stateno = 452
trigger22 = stateno = 600 && movecontact
trigger23 = stateno = 610 && movecontact
trigger24 = stateno = 620 && movecontact
trigger25 = stateno = 630 && movecontact
trigger26 = stateno = 640 && movecontact
trigger27 = stateno = 650 && movecontact
trigger28 = stateno = 1520
trigger28 = movecontact || time >= 16
trigger29 = stateno = 700
trigger30 = stateno = 705
trigger31 = stateno = 1106 && movecontact
trigger32 = stateno = 500 && prevstateno = 1106

;---------------------------------------------------------------------------
;Crack Shoot
[State -1, Crack Shoot]
type = ChangeState
value = 1320
triggerall = var(59) = 0
triggerAll = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000250)
;triggerall = command = "CrackShoot_c"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact || stateno = 452
trigger22 = stateno = 600 && movecontact
trigger23 = stateno = 610 && movecontact
trigger24 = stateno = 620 && movecontact
trigger25 = stateno = 630 && movecontact
trigger26 = stateno = 640 && movecontact
trigger27 = stateno = 650 && movecontact
trigger28 = stateno = 1520
trigger28 = movecontact || time >= 16
trigger29 = stateno = 700
trigger30 = stateno = 705
trigger31 = stateno = 1106 && movecontact
trigger32 = stateno = 500 && prevstateno = 1106

;---------------------------------------------------------------------------
;Portal Knuckal (Guard Cancel)
[State -1, Barnacle]
type = ChangeState
value = 1250
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_z" || command = "AlphaKnuckle_z"
triggerall = numexplod(90000220) || numexplod(90000225)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype = A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 154 | stateno = 155
trigger2 = stateno = 42051
trigger2 = time >= 1

;---------------------------------------------------------------------------
;Portal Knuckal
[State -1, Portal Knuckal]
type = ChangeState
value = 1250
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000220) || numexplod(90000225)
;triggerall = command = "BurnKnuckle_z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 1106 && movecontact
trigger9 = stateno = 500 && prevstateno = 1106
trigger10 = power >= 500 || var(38)
trigger10 = stateno = 1502 || stateno = 15030
trigger10 = time >= 20

;---------------------------------------------------------------------------
;Portal Knuckal (Guard Cancel)
[State -1, Barnacle]
type = ChangeState
value = 1240
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_y" || command = "AlphaKnuckle_y"
triggerall = numexplod(90000210) || numexplod(90000215)
;triggerall = command = "BurnKnuckle_y"
triggerall = statetype = A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 154 | stateno = 155
trigger2 = stateno = 42051
trigger2 = time >= 1

;---------------------------------------------------------------------------
;Portal Knuckal
[State -1, Portal Knuckal]
type = ChangeState
value = 1240
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000210) || numexplod(90000215)
;triggerall = command = "BurnKnuckle_y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 1106 && movecontact
trigger9 = stateno = 500 && prevstateno = 1106
trigger10 = power >= 500 || var(38)
trigger10 = stateno = 1502 || stateno = 15030
trigger10 = time >= 20

;---------------------------------------------------------------------------
;Portal Knuckal (Guard Cancel)
[State -1, Barnacle]
type = ChangeState
value = 1230
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_x" || command = "AlphaKnuckle_x"
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype = A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 154 | stateno = 155
trigger2 = stateno = 42051
trigger2 = time >= 1

;---------------------------------------------------------------------------
;Portal Knuckal
[State -1, Portal Knuckal]
type = ChangeState
value = 1230
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = stateno = 610 && movecontact
trigger4 = stateno = 620 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movecontact
trigger7 = stateno = 650 && movecontact
trigger8 = stateno = 1106 && movecontact
trigger9 = stateno = 500 && prevstateno = 1106
trigger10 = power >= 500 || var(38)
trigger10 = stateno = 1502 || stateno = 15030
trigger10 = time >= 20

;---------------------------------------------------------------------------
;Barnacle!
[State -1, Barnacle]
type = ChangeState
value = 1220
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000220)
;triggerall = command = "BurnKnuckle_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 700
trigger23 = stateno = 705

;---------------------------------------------------------------------------
;Barnacles (Guard Cancel)
[State -1, Barnacle]
type = ChangeState
value = 1220
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_z" || command = "AlphaKnuckle_z"
triggerall = numexplod(90000220)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype != A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
trigger2 = stateno = 42050
trigger2 = time >= 1

;---------------------------------------------------------------------------
;Burn Knuckle
[State -1, Burn Knuckle]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000200) || numexplod(90000205)
triggerall = !numhelper(1201)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 700 && !var(3)
trigger23 = stateno = 705 && !var(3)

;---------------------------------------------------------------------------
;Burn Knuckle (Guard Cancel)
[State -1, Burn Knuckle]
type = ChangeState
value = 1200
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_x" || command = "AlphaKnuckle_x"
triggerall = numexplod(90000200) || numexplod(90000205)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype != A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
trigger2 = stateno = 42050
trigger2 = time >= 1

;---------------------------------------------------------------------------
;Blazing Blade
[State -1, Blazing Blade]
type = ChangeState
value = 1210
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90010104)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90010006))
triggerall = numexplod(90000210)
;triggerall = command = "BurnKnuckle_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact
trigger22 = stateno = 700
trigger23 = stateno = 705

;---------------------------------------------------------------------------
;Blazing Blade (Guard Cancel)
[State -1, Blazing Blade]
type = ChangeState
value = 1210
triggerall = var(59) = 0
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90007552)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90007502)) || command = "BurnKnuckle_y" || command = "AlphaKnuckle_y"
triggerall = numexplod(90000210)
;triggerall = command = "BurnKnuckle_x"
triggerall = statetype != A
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
trigger2 = stateno = 42050
trigger2 = time >= 1

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) = 0
triggerall = stateno != 100
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90001016)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90001064))
;trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) = 0
triggerall = stateno != 105
triggerall = stateno != [120,160]
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90001064)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90001016))
;trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Lane Swap (FG)
[State -1, Lane Swap (FG)]
type = ChangeState
value = 900
triggerall = var(59) = 0
triggerall = command = "LaneSwap"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Lane Swap (BG)
[State -1, Lane Swap (BG)]
type = ChangeState
value = 910
triggerall = var(59) = 0
triggerall = command = "LaneSwap"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Grasping Upper Turbo
[State -1, Grasping Upper Turbo]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Straight Buster Throw
[State -1, Straight Buster Throw]
type = ChangeState
value = 830
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Backward Air Throw
[State -1, Backward Air Throw]
type = ChangeState
value = 870
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = command = "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 710 && time >= 20

;---------------------------------------------------------------------------
;Dunk
[State -1, Dunk]
type = ChangeState
value = 850
triggerall = var(59) = 0
triggerall = command = "Throw"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 710 && time >= 20


;===========================================================================
;---------------------------------------------------------------------------
;Light Punch Auto Combo 2
[State -1, Light Punch Auto Combo 2]
type = ChangeState
value = 202
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = stateno = 201
trigger1 = movecontact
trigger2 = stateno = 201
trigger2 = time >= 8
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Light Punch Auto Combo 1
[State -1, Light Punch Auto Combo 1]
type = ChangeState
value = 201
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = stateno = 200
trigger1 = movecontact
trigger2 = stateno = 200
trigger2 = time >= 6
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Boneless Power Charge
[State -1, Boneless Power Charge]
type = ChangeState
value = 205
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 204
trigger1 = movecontact

;---------------------------------------------------------------------------
;Dashing Light Punch Follow-up
[State -1, Dashing Light Punch Follow-up]
type = ChangeState
value = 204
triggerall = var(59) = 0
triggerall = command = "x" || command = "y" || command = "z"
trigger1 = stateno = 203
trigger1 = movecontact

;---------------------------------------------------------------------------
;Dashing Light Punch
[State -1, Dashing Light Punch]
type = ChangeState
value = 203
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = stateno = 100

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
trigger2 = time >= 6
trigger2 = !movecontact
trigger3 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
;Zooooooooooooooom Punch
[State -1, Zooooooooooooooom Punch]
type = ChangeState
value = 223
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = stateno != 100
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 234) && movecontact
trigger4 = (stateno = 235) && movecontact
trigger5 = (stateno = 241) && movecontact

;---------------------------------------------------------------------------
;Dashing Fierce Punch
[State -1, Dashing Fierce Punch]
type = ChangeState
value = 221
triggerall = var(59) = 0
triggerall = command = "z"
trigger1 = stateno = 100

;---------------------------------------------------------------------------
;Standing Fierce Punch
[State -1, Standing Fierce Punch]
type = ChangeState
value = 220
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 201) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 231) && movecontact
trigger5 = (stateno = 240) && movecontact
trigger6 = (stateno = 241) && movecontact
trigger7 = stateno = 42050
trigger7 = time >= 1

;---------------------------------------------------------------------------
;Dashing Medium Punch
[State -1, Dashing Medium Punch]
type = ChangeState
value = 213
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = stateno = 100

;---------------------------------------------------------------------------
;Rocky Mountain Splitting Wave
[State -1, Rocky Mountain Splitting Wave]
type = ChangeState
value = 214
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = stateno != 100
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 211) && movecontact
trigger3 = (stateno = 213) && movecontact

;---------------------------------------------------------------------------
;Strong Punch Auto Combo 2
[State -1, Strong Punch Auto Combo 2]
type = ChangeState
value = 212
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = stateno = 211
trigger1 = movecontact
trigger2 = stateno = 211
trigger2 = time >= 16
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Strong Punch Auto Combo 1
[State -1, Strong Punch Auto Combo 1]
type = ChangeState
value = 211
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = stateno = 210
trigger1 = movecontact
trigger2 = stateno = 210
trigger2 = time >= 11
trigger2 = command = "holdfwd"

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
trigger4 = (stateno = 440) && movecontact
trigger4 = prevstateno != 400
trigger4 = prevstateno != 430
trigger5 = (stateno = 410) && movecontact
trigger5 = prevstateno != 400
trigger5 = prevstateno != 430

;---------------------------------------------------------------------------
;Light Kick Auto Combo 2
[State -1, Light Kick Auto Combo 2]
type = ChangeState
value = 232
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = stateno = 231
trigger1 = movecontact
trigger2 = stateno = 231
trigger2 = time >= 12
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Light Kick Auto Combo 1
[State -1, Light Kick Auto Combo 1]
type = ChangeState
value = 231
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = stateno = 230
trigger1 = movecontact
trigger2 = stateno = 230
trigger2 = time >= 4
trigger2 = command = "holdfwd"

;---------------------------------------------------------------------------
;Slightly Faster Buster Foot Not So Auto Combo
[State -1, Slightly Faster Buster Foot Not So Auto Combo]
type = ChangeState
value = 235
triggerall = command = "a"
trigger1 = stateno = 241
trigger1 = movecontact

;---------------------------------------------------------------------------
;Buster Foot Auto Combo
[State -1, Buster Foot Auto Combo]
type = ChangeState
value = 234
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = stateno = 233
trigger1 = movecontact
trigger2 = stateno = 233
trigger2 = time >= 8
trigger3 = stateno = 241
trigger3 = time >= 13
trigger3 = !movecontact

;---------------------------------------------------------------------------
;Buster Foot
[State -1, Buster Foot]
type = ChangeState
value = 233
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230
trigger2 = time >= 6
trigger2 = !movecontact
trigger3 = (stateno = 430) && movecontact
trigger4 = (stateno = 200) && movecontact
trigger5 = (stateno = 210) && movecontact

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
trigger2 = stateno = 200
trigger2 = time >= 6
trigger2 = !movecontact
trigger3 = stateno = 200
trigger3 = anim = 2000
trigger3 = movecontact
trigger4 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
;Standing Roundhouse Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) && movecontact
trigger3 = (stateno = 240) && movecontact
trigger4 = (stateno = 241) && movecontact
trigger5 = stateno = 42050
trigger5 = time >= 1

;---------------------------------------------------------------------------
;Kick Back
[State -1, Kick Back]
type = ChangeState
value = 241
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 230) && movecontact
trigger5 = (stateno = 233) && movecontact
trigger6 = (stateno = 240) && movecontact

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
trigger4 = (stateno = 410) && movecontact
trigger4 = prevstateno != 400
trigger4 = prevstateno != 430
trigger5 = (stateno = 440) && movecontact
trigger5 = prevstateno != 400
trigger5 = prevstateno != 430

;---------------------------------------------------------------------------
;Taunt Walk
[State -1, Taunt Walk]
type = ChangeState
value = 196
triggerall = var(59) = 0
triggerall = command = "holdstart"
triggerall = command = "holdfwd"
triggerall = var(30) <= 0
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Taunt
[State -1, Jump Taunt]
type = ChangeState
value = 197
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = stateno != 1970

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
trigger2 = (stateno = 430) && movecontact
trigger3 = stateno = 400
trigger3 = time >= 6
trigger3 = !movecontact

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
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 430) && movecontact
trigger4 = (stateno = 440) && movecontact
trigger4 = prevstateno != 400
trigger4 = prevstateno != 430

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 410) && movecontact
trigger3 = (stateno = 440) && movecontact

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
trigger2 = stateno = 430
trigger2 = (time > 9) || (movecontact && time > 5)

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
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
;Hey! Go Burn!
[State -1, Hey! Go Burn!]
type = ChangeState
value = 451
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = (ifElse(P2dist x < 0, Facing = -1, Facing = 1) && NumExplod(90000003)) || (ifElse(P2dist x < 0, Facing = 1, Facing = -1) && NumExplod(90000001))
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 201 && movecontact
trigger4 = stateno = 202 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 211 && movecontact
trigger7 = (stateno = 212 || stateno = 213) && movecontact
trigger8 = stateno = 223 && movecontact
trigger9 = stateno = 230 && movecontact
trigger10 = stateno = 231 && movecontact
trigger11 = stateno = 232 && movecontact
trigger12 = stateno = 233 && movecontact
trigger13 = (stateno = 234 || stateno = 235) && movecontact
trigger14 = stateno = 240 && movecontact
trigger15 = stateno = 241 && movecontact
trigger16 = stateno = 400 && movecontact
trigger17 = stateno = 410 && movecontact
trigger18 = stateno = 420 && movecontact
trigger19 = stateno = 430 && movecontact
trigger20 = stateno = 440 && movecontact
trigger21 = stateno = 450 && movecontact

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
trigger2 = (stateno = 410) && movecontact
trigger3 = (stateno = 440) && movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 710 && time >= 8

;---------------------------------------------------------------------------
;Air Not FSmash Not CD
[State -1, Air Not FSmash Not CD]
type = ChangeState
value = 660
triggerall = var(59) = 0
triggerall = command = "LaneSwap"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 710 && time >= 8

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
trigger3 = stateno = 710 && time >= 8

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
trigger3 = stateno = 710 && time >= 8

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact
trigger3 = stateno = 710 && time >= 8

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
trigger3 = stateno = 710 && time >= 8

;---------------------------------------------------------------------------
;Jump Roundhouse Kick
[State -1, Jump Roundhouse Kick]
type = ChangeState
value = 650
triggerall = var(59) = 0
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610 || stateno = 640
trigger2 = movecontact
trigger3 = stateno = 710 && time >= 8


;---------------------------------------------------------------------------
;A. I. am here to avenge my father Jeff

;---------------------------------------------------------------------------
;Overheat Turbo
;This becomes the highest priority AI at high difficulty levels when Terrance loses often enough.
;When this is active, Terrance shifts his strategy to focus primarily on landing Power Charge to enable Overheating, then getting the one opportunity he needs to land a ToD combo


;Arxos Blocking AI Repurposed for RCing
[State -1, AI]
type = changestate
triggerall=numenemy
triggerall=fvar(27)
triggerall=AILevel>=7&&alive&&roundstate=2
triggerall=ctrl||stateno=111||stateno=1
triggerall=stateno=140||stateno!=[120,155]
triggerall=enemy(var(0)),movetype!=H
triggerall=enemy(var(0)),pos x<=pos x+15||enemy(var(0)),facing=-1
triggerall=enemy(var(0)),pos x>=pos x-15||enemy(var(0)),facing=1
triggerall=life>=650&&AILevel>4||AIlevel>=6
triggerall=!numhelper(1511)||statetype=A
trigger1 = enemy(var(0)),movetype=A && helper(112230),var(10)=[0,6]
trigger2 = helper(112250),var(14)<125
trigger3 = helper(112260),var(2)>0
value = 705

;RC Power Charge (attempt to overheat)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 7
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !numhelper(1511) && !var(38)
triggerall = p2dist x >= 0
triggerall = p2dist x < 135
trigger1 = p2dist y >= -55
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;Roll (when close to a downed opponent with the Power Charge helper)
[State -1, AI]
type = ChangeState
value = ifelse(backedgedist <= 40,700,705)
triggerall = fvar(27) || life <= 600
triggerall = numhelper(1511) || life <= 600
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = ctrl || stateno = 1
trigger1 = p2bodydist x <= 65
trigger1 = random <= (AILevel * 115)

;---------------------------------------------------------------------------
;High priority controllers

;Just smash those Bongos, Donkey Kong.
[State -1, AI]
type = ChangeState
value = 3100
triggerall = numhelper(78912)
triggerall = numhelper(78420) <= 7
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
triggerall = enemynear, life < 450
trigger1 = power >= 1000
trigger1 = ctrl

;Just smash those Bongos, Donkey Kong.
[State -1, AI]
type = ChangeState
value = 3200
triggerall = numhelper(78912)
triggerall = numhelper(78420) <= 7
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = power >= 2000
trigger1 = ctrl

;Just smash those Bongos, Donkey Kong.
[State -1, AI]
type = ChangeState
value = 111
triggerall = numhelper(78912)
triggerall = !numhelper(110)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = roundsexisted
trigger1 = life >= 750
trigger1 = fvar(0) >= 0
trigger1 = ctrl

;Just smash those Bongos, Donkey Kong.
[State -1, AI]
type = ChangeState
value = ifelse(random%2,195,230)
triggerall = numhelper(78912)
triggerall = numhelper(78420) <= 7
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 120) && random <= (AILevel * 94)
trigger1 = helper(78912), stateno != 78912
trigger1 = helper(78912), stateno != 78913
trigger1 = ctrl

;Protagonist Pair-Up
[State -1, AI]
type = ChangeState
value = 3500
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
triggerall = partner, name = "Bodega Ameze" 
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3500)
trigger2 = movecontact

;And They Don't Stop Busting (uses two super bars)
[State -1, And They Don't Stop Busting]
type = ChangeState
value = 3600
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
triggerall = p3name = "Straight Buster"
triggerall = partner, stateno != [3000,3010]
triggerall = partner, stateno != 30010
triggerall = partner, stateno != [1300,1320]
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3050,3700)
trigger2 = movecontact
trigger3 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040 || stateno = 1004 || stateno = 1016 || stateno = 1026 || stateno = 1005 || stateno = 1017 || stateno = 1027
trigger3 = time >= 15
trigger4 = stateno = 452
trigger5 = stateno = 1110
trigger5 = numhelper(1112)
trigger5 = helper(1112), movecontact
trigger6 = stateno = 1200
trigger6 = numhelper(1201)
trigger6 = helper(1201), movecontact
trigger7 = stateno = 1220
trigger7 = numhelper(1223)
trigger7 = helper(1223), movecontact
trigger8 = stateno = 1600 || stateno = 1610
trigger8 = numhelper(1601)
trigger8 = helper(1601), moveguarded
trigger9 = stateno = 1620
trigger9 = time >= 22
trigger10 = stateno = 11072
trigger10 = time >= 2

;LP (Are you Okay?)
[State -1, AI]
type = ChangeState
value = 200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = teammode = simul
triggerall = power >= 2000 || (power >= 1000 && var(38))
triggerall = numpartner
trigger1 = partner, alive
trigger1 = ctrl
trigger1 = partner, life <= lifemax
trigger1 = partner, life <= 420 || partner, movetype = H
trigger1 = partner, movetype != A
trigger1 = partner, pos y >= -90
trigger1 = ifelse(facing = 1, (pos x + 30) <= (partner, pos x), (pos x - 30) >= (partner, pos x))
trigger2 = partner, alive
trigger2 = partner, life <= lifemax
trigger2 = partner, life <= 420 || partner, movetype = H
trigger2 = partner, movetype != A
trigger2 = partner, pos y >= -70
trigger2 = stateno = 200
trigger2 = prevstateno != 200
trigger2 = time >= 6
trigger2 = !movecontact
trigger2 = ifelse(facing = 1, (pos x + 30) <= (partner, pos x), (pos x - 30) >= (partner, pos x))

;LK (Are you Okay?)
[State -1, AI]
type = ChangeState
value = 230
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = teammode = simul
triggerall = power >= 2000 || (power >= 1000 && var(38))
triggerall = numpartner
trigger1 = partner, alive
trigger1 = partner, life <= lifemax
trigger1 = partner, life <= 420 || partner, movetype = H
trigger1 = partner, movetype != A
trigger1 = partner, pos y >= -70
trigger1 = stateno = 200
trigger1 = prevstateno = 200
trigger1 = time >= 6
trigger1 = !movecontact
trigger1 = ifelse(facing = 1, (pos x + 30) <= (partner, pos x), (pos x - 30) >= (partner, pos x))

;Are you okay?
[State -1, AI]
type = ChangeState
value = 3800
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = teammode = simul
triggerall = power >= 2000 || (power >= 1000 && var(38))
triggerall = numpartner
trigger1 = partner, alive
trigger1 = partner, life <= lifemax
trigger1 = partner, life <= 420 || partner, movetype = H
trigger1 = partner, movetype != A
trigger1 = partner, pos y >= -70
trigger1 = stateno = 230
trigger1 = prevstateno = 200
trigger1 = time >= 4
trigger1 = !movecontact
trigger1 = ifelse(facing = 1, (pos x + 30) <= (partner, pos x), (pos x - 30) >= (partner, pos x))

;Raw Buster Wolf Call-out (Overheating)
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = var(38)
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = p2dist x > 0
trigger1 = p2dist x <= 100
trigger1 = p2bodydist y >= -45
trigger1 = p2bodydist y < 20
trigger1 = enemynear, movetype = A
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger2 = power >= 1000
trigger2 = p2dist x > 95
trigger2 = p2dist x <= 300
trigger2 = p2bodydist y >= -45
trigger2 = p2bodydist y < 20
trigger2 = enemynear, movetype = A
trigger2 = ctrl
trigger2 = random <= (AILevel * 90)
trigger2 = random <= (AILevel * 70)
trigger3 = power >= 1500 || var(38)
trigger3 = p2dist x > 100
trigger3 = p2dist x <= 300
trigger3 = p2bodydist y >= -45
trigger3 = p2bodydist y < 20
trigger3 = enemynear, movetype = A
trigger3 = ctrl
trigger3 = random <= (AILevel * 210)
trigger3 = random <= (AILevel * 185)
trigger4 = power >= 1000 || var(38)
trigger4 = p2dist x > 100
trigger4 = p2dist x <= 300
trigger4 = p2bodydist y >= -45
trigger4 = p2bodydist y < 20
trigger4 = enemynear, movetype = A
trigger4 = stateno = 1000 ||  stateno = 1010 || stateno = 1020
trigger4 = time >= 16
trigger4 = random <= (AILevel * 210)
trigger4 = random <= (AILevel * 185)

;Buster Vacation
[State -1, AI]
type = ChangeState
value = 3700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = power >= 3000 && !var(38)
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = p2dist x > 0
trigger1 = p2dist x <= 100
trigger1 = p2bodydist y >= -45
trigger1 = p2bodydist y < 20
trigger1 = enemynear, movetype = A
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;(Hungry Hunter) Buster Wolf
[State -1, AI]
type = ChangeState
value = ifelse(power >= 3000 && !var(38),3300,3100)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = power >= 1000 || var(38)
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = power >= 1000
trigger1 = p2dist x > 95
trigger1 = p2dist x <= 300
trigger1 = p2bodydist y >= -45
trigger1 = p2bodydist y < 20
trigger1 = enemynear, movetype = A
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger2 = power >= 1500 || var(38)
trigger2 = p2dist x > 100
trigger2 = p2dist x <= 300
trigger2 = p2bodydist y >= -45
trigger2 = p2bodydist y < 20
trigger2 = enemynear, movetype = A
trigger2 = ctrl
trigger2 = random <= (AILevel * 210)
trigger2 = random <= (AILevel * 185)
trigger3 = power >= 1000 || var(38)
trigger3 = p2dist x > 100
trigger3 = p2dist x <= 300
trigger3 = p2bodydist y >= -45
trigger3 = p2bodydist y < 20
trigger3 = enemynear, movetype = A
trigger3 = stateno = 1000 ||  stateno = 1010 || stateno = 1020
trigger3 = time >= 16
trigger3 = random <= (AILevel * 210)
trigger3 = random <= (AILevel * 185)

;Power Mortar / Limewire Go Bang! / Buster Vacation
[State -1, AI]
type = ChangeState
value = ifelse(power >= 3000 && !var(38),3700,3000)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = power >= 1000 || var(38)
trigger1 = p2dist x >= -15
trigger1 = p2dist x <= 80
trigger1 = enemynear, pos y >= -65
trigger1 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040
trigger1 = time >= 16
trigger1 = enemynear, movetype != H
trigger1 = random <= (AILevel * 210)

;Power Mortar / Limewire Go Bang! (Anti-Air)
[State -1, AI]
type = ChangeState
value = 3000
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = power >= 1000 || var(38)
trigger1 = ctrl
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 90
trigger1 = enemynear, pos y >= -120
trigger1 = enemynear, pos y < -65
trigger1 = enemynear, movetype != H
trigger1 = random <= (AILevel * 210)
trigger2 = power >= 1000 || var(38)
trigger2 = stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 1040
trigger2 = time >= 16
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 90
trigger2 = enemynear, pos y >= -120
trigger2 = enemynear, pos y < -65
trigger2 = enemynear, movetype != H
trigger2 = random <= (AILevel * 210)

;Hungry Hunter Buster Wolf / Buster Vacation
[State -1, AI]
type = ChangeState
value = 3300+((random%2)*400)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 115)
trigger1 = power >= 3000 && !var(38)
trigger1 = !var(38)
trigger1 = stateno = 1405
trigger1 = time >= 3
trigger1 = p2dist y >= -55
trigger1 = numtarget
trigger1 = target, stateno >= 5020 && target, stateno <= 5035

;Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = power >= 3000 && !var(38)
trigger1 = p2dist y >= -50
trigger1 = stateno = 213
trigger1 = movehit
trigger1 = random <= (AILevel * 210)
trigger2 = numtarget
trigger2 = p2dist x >= 140
trigger2 = stateno = 250
trigger2 = target, movetype = H
trigger2 = target, stateno = 2503 || target, stateno = 2504
trigger2 = random <= (AILevel * 220)
trigger2 = random <= (AILevel * 180)
trigger2 = power >= 3000 && !var(38)
trigger3 = power >= 3000 && !var(38)
trigger3 = !var(38)
trigger3 = stateno = 1405
trigger3 = time >= 3
trigger3 = p2dist y >= -55
trigger3 = numtarget
trigger3 = target, stateno >= 5020 && target, stateno <= 5035
trigger4 = power >= 3000
trigger4 = stateno = 3101 || stateno = 3151
trigger4 = time >= 18
trigger4 = frontedgedist >= 72
trigger4 = numtarget
trigger5 = power >= 3000
trigger5 = stateno = 3153
trigger5 = time >= 30
trigger5 = frontedgedist >= 72
trigger5 = numtarget
trigger6 = numtarget
trigger6 = stateno = 223
trigger6 = target, life <= 200
trigger6 = movehit
trigger6 = power >= 3000 && !var(38)
trigger6 = p2dist y >= -45
trigger6 = prevstateno != 831
trigger6 = enemynear, movetype = H
trigger7 = power >= 3000 && !var(38)
trigger7 = p2dist x >= 150
trigger7 = p2dist x <= 300
trigger7 = p2dist y >= -50
trigger7 = enemynear, movetype = A
trigger7 = enemynear, time >= 3
trigger7 = random <= (AILevel * 190)
trigger7 = random <= (AILevel * 160) 
trigger7 = ctrl || stateno = 1 || stateno = 111
trigger8 = power >= 3000 && !var(38)
trigger8 = p2dist x >= 150
trigger8 = p2dist x <= 300
trigger8 = p2dist y >= -50
trigger8 = enemynear, movetype = A
trigger8 = enemynear, time >= 3
trigger8 = random <= (AILevel * 392)
trigger8 = random <= (AILevel * 326) 
trigger8 = ctrl || stateno = 1 || stateno = 111
trigger8 = life <= 333
trigger8 = (enemynear, life <= (enemynear, lifemax*0.491) && (enemynear, life >= 1000)) || (enemynear, life <= 491 && (enemynear, life < 1000))

;Buster Wolf (Overheat)
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = var(38)
trigger1 = power >= 3000 && var(38)
trigger1 = p2dist y >= -50
trigger1 = stateno = 213 || stateno = 223
trigger1 = movehit
trigger1 = random <= (AILevel * 210)
trigger1 = prevstateno != 831
trigger2 = numtarget
trigger2 = stateno = 250
trigger2 = target, movetype = H
trigger2 = target, stateno = 2503 || target, stateno = 2504
trigger2 = random <= (AILevel * 220)
trigger2 = random <= (AILevel * 180)
trigger2 = power >= 3000 && var(38)
trigger3 = power >= 3000 && var(38)
trigger3 = var(38)
trigger3 = stateno = 1405
trigger3 = time >= 3
trigger3 = p2dist y >= -55
trigger3 = numtarget
trigger3 = target, stateno >= 5020 && target, stateno <= 5035
trigger4 = stateno = 223
trigger4 = movehit
trigger4 = power >= 3000 && var(38)
trigger4 = p2dist y >= -55
trigger4 = enemynear, movetype = H
trigger4 = prevstateno != 831
trigger5 = power >= 3000 && var(38)
trigger5 = p2dist x >= 150
trigger5 = p2dist x <= 300
trigger5 = p2dist y >= -50
trigger5 = enemynear, movetype = A
trigger5 = enemynear, time >= 3
trigger5 = random <= (AILevel * 190)
trigger5 = random <= (AILevel * 160) 
trigger5 = ctrl || stateno = 1 || stateno = 111
trigger6 = power >= 3000 && var(38)
trigger6 = p2dist x >= 150
trigger6 = p2dist x <= 300
trigger6 = p2dist y >= -50
trigger6 = enemynear, movetype = A
trigger6 = enemynear, time >= 3
trigger6 = random <= (AILevel * 392)
trigger6 = random <= (AILevel * 326) 
trigger6 = ctrl || stateno = 1 || stateno = 111
trigger6 = life <= 333
trigger6 = (enemynear, life <= (enemynear, lifemax*0.491) && (enemynear, life >= 1000)) || (enemynear, life <= 491 && (enemynear, life < 1000))

;Arxos Blocking AI - Applies to all AI Levels
[State -1, AI]
type = changestate
triggerall=numenemy
triggerall=!numhelper(78912)
triggerall=AILevel>=3&&alive&&roundstate=2
triggerall=ctrl||stateno=111||stateno=1
triggerall=stateno=140||stateno!=[120,155]
triggerall=enemy(var(0)),movetype!=H
triggerall=enemy(var(0)),pos x<=pos x+15||enemy(var(0)),facing=-1
triggerall=enemy(var(0)),pos x>=pos x-15||enemy(var(0)),facing=1
triggerall=life>=650&&AILevel>4||AILevel<6&&AILevel>4
triggerall=!numhelper(1511)||statetype=A
trigger1 = enemy(var(0)),movetype=A && helper(112230),var(10)=[0,6]
trigger2 = helper(112250),var(14)<125
trigger3 = helper(112260),var(2)>0
value = 120

;RC Follow-up Controller
[State -1, AI]
type = ChangeState
value = var(45)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 95
trigger1 = p2dist y >= -75
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;Roll for Power Wave Anti-Air
[State -1, AI]
type = ChangeState
value = 705
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = !numhelper(1001)
trigger1 = !numhelper(1002)
trigger1 = enemynear, movetype = A
trigger1 = p2dist x >= 35 || inguarddist
trigger1 = p2dist x < 290 || inguarddist
trigger1 = p2dist y < -75
trigger1 = p2dist y >= -135
trigger1 = ctrl

;RC Counter Controller (Power Wave for Anti-Air)
[State -1, AI]
type = ChangeState
value = 1020
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = !numhelper(1001)
trigger1 = !numhelper(1002)
trigger1 = enemynear, movetype = A
trigger1 = p2dist x >= 35 || inguarddist
trigger1 = p2dist x < 290 || inguarddist
trigger1 = p2dist y < -75
trigger1 = p2dist y >= -135
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;Backdash for Portal Knuckal Anti-air
[State -1, AI]
type = ChangeState
value = 105
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = numenemy
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = enemynear, movetype != H
triggerall = fvar(26) < 2
trigger1 = life >= 750 || teammode = simul
trigger1 = p2dist x <= 20 || p2dist x >= 140
trigger1 = p2dist y < -115 || enemynear, pos y < -115
trigger1 = ctrl
trigger1 = random <= (AILevel * 238)
trigger2 = life >= 500 || teammode = simul
trigger2 = p2dist x <= 20 || p2dist x >= 140
trigger2 = p2dist y < -115 || enemynear, pos y < -115
trigger2 = enemynear, vel y <= 0 || enemynear, time >= 45
trigger2 = ctrl
trigger2 = random <= (AILevel * 238)

;Arxos Blocking AI repurposed for Rolling too
[State -1, AI]
type = changestate
triggerall = numenemy
triggerall = statetype != A
triggerall = !numhelper(78912)
triggerall = (var(59))&&(alive)&&(roundstate=2)
triggerall = !(enemynear,hitdefattr = SCA,AT,ST,HT,NT)
triggerall = ctrl || stateno = 111 || stateno = 1
triggerall = enemynear, movetype != H && enemynear, facing != facing
triggerall = numhelper(12345)
triggerall = AILevel >= 6
triggerall = p2dist x >= 0
triggerall = p2dist x < 95
trigger1 = enemynear, movetype = A
trigger1 = inguarddist
trigger1 = (random+helper(12345),var(56)) <= (238 * AILevel)
trigger2 = enemy,numproj = [2,4]
trigger2 = (random+helper(12345),var(56)) <= (244 * AILevel)
trigger3 = enemy,numproj >= 5
trigger3 = (random+helper(12345),var(56)) <= (250 * AILevel)
trigger4 = (enemy,numhelper) = 1
trigger4 = enemynear, movetype = A
trigger4 = helper(12345),var(55) = 0
trigger4 = (random+helper(12345),var(56)) <= (238 * AILevel)
value =  ifelse((power >= 2500 && !var(38)),ifelse(life >= 850,120,700),705) 

;Guard Cancel
[State -1, AI]
type = ChangeState
value = ifelse((life >= 500),1200+((random%3)*10),1200+((random%2)*10))  
triggerall = !fvar(27)
triggerall = (var(59))&&(alive)&&(roundstate=2)
triggerall = statetype != A
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = power >= 500
trigger1 = power >= 1350 && power < 2700 || AILevel < 6
trigger1 = enemynear, pos y >= -60
trigger1 = p2dist x <= 140
trigger1 = p2dist x >= -10
trigger1 = stateno = 150 || stateno = 151 || stateno = 152 || stateno = 153
trigger1 = time > 0
trigger1 = time <= 4

;Guard Cancel (Air)
[State -1, AI]
type = ChangeState
value = 1250
triggerall = !fvar(27)
triggerall = (var(59))&&(alive)&&(roundstate=2)
triggerall = statetype = A
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = power >= 500 || stateno = 42051
triggerall = life >= 750
trigger1 = power >= 1350 && power < 2700 || stateno = 42051
trigger1 = stateno = 154 || stateno = 155 || stateno = 42051
trigger1 = time > 0
trigger1 = time <= 4 || stateno = 42051

;RC Power Charge (attempt to overheat)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = power >= 2500 && !var(38)
triggerall = p2dist x >= 0
triggerall = p2dist x < 165
trigger1 = p2dist y >= -55
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;Arxos Blocking AI repurposed for Rolling too
[State -1, AI]
type = changestate
triggerall = numenemy
triggerall = statetype != A
triggerall = !numhelper(78912)
triggerall = (var(59))&&(alive)&&(roundstate=2)
triggerall = !(enemynear,hitdefattr = SCA,AT,ST,HT,NT)
triggerall = ctrl || stateno = 111 || stateno = 1
triggerall = enemynear, movetype != H && enemynear, facing != facing
triggerall = numhelper(12345)
triggerall = AILevel >= 6
triggerall = p2dist x >= 0
triggerall = p2dist x < 95
trigger1 = enemynear, movetype = A
trigger1 = inguarddist
trigger1 = (random+helper(12345),var(56)) <= (238 * AILevel)
trigger2 = enemy,numproj = [2,4]
trigger2 = (random+helper(12345),var(56)) <= (244 * AILevel)
trigger3 = enemy,numproj >= 5
trigger3 = (random+helper(12345),var(56)) <= (250 * AILevel)
trigger4 = (enemy,numhelper) = 1
trigger4 = enemynear, movetype = A
trigger4 = helper(12345),var(55) = 0
trigger4 = (random+helper(12345),var(56)) <= (238 * AILevel)
value =  ifelse((random%5 >= 2),705,ifelse(life >= 850,120,705)) 

;Crouch Medium Kick (Punish Attempt)
[State -1, AI]
type = ChangeState
value = 440
triggerall = !fvar(27) || fvar(27) && var(38)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = enemynear, movetype = A
triggerall = enemynear, statetype != A
triggerall = !(p2movetype = H && p2statetype = A)
triggerall = fvar(24) <= 2
trigger1 = stateno = 140
trigger1 = p2dist x <= 65
trigger1 = p2dist y >= -20
trigger1 = random <= (AILevel * 245)

;RC Counter Controller (Close)
[State -1, AI]
type = ChangeState
value = var(45)
triggerall = !fvar(27) || fvar(27) && var(38)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = enemynear, movetype = A
trigger1 = p2dist x >= 0 || inguarddist
trigger1 = p2dist x < 95 || inguarddist
trigger1 = p2dist y >= -75
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;RC Counter Controller (Close)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = enemynear, movetype = A
trigger1 = p2dist x >= 0 || inguarddist
trigger1 = p2dist x < 95 || inguarddist
trigger1 = p2dist y >= -75
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;RC Counter Controller (Power Wave/Charge)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1510,1010)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = enemynear, movetype = A
trigger1 = p2dist x >= 95 || inguarddist
trigger1 = p2dist x < 175 || inguarddist
trigger1 = p2dist y >= -75
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;---------------------------------------------------------------------------
;Highest Medium and Hard AI (6-8)
;More or less how I usually make AI. See the sections after this for my scaled down AI

;Stand Still (to overheat)
[State -1, AI]
type = ChangeState
value = 1
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = !var(38)
triggerall = numhelper(1511)
triggerall = life >= 500
trigger1 = power >= 1500 || fvar(27)
trigger1 = p2dist x >= 75
trigger1 = ctrl
trigger1 = random <= (AILevel * 245)
trigger1 = random <= (AILevel * 288)

;Crackhead Armwrestling (For Simul, starting from Difficulty level 4)
[State -1, AI]
type = ChangeState
value = 3200
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4
triggerall = teammode = simul || enemynear, teammode = simul
triggerall = power >= 2000 || power >= 1000 && var(38)
triggerall = numenemy
trigger1 = (stateno = 1020 && time >= 20) || (p2dist x >= 190 && ctrl)
trigger1 = enemynear, movetype = H || enemynear, life <= 187
trigger1 = enemynear, life <= 430
trigger1 = random <= (AILevel * 385)
trigger1 = power < 3000 || power >= 1000 && var(38)
trigger2 = ctrl
trigger2 = p2dist x >= 100
trigger2 = enemynear, life >= 550 || power <= 2500
trigger2 = random <= (AILevel * 385)
trigger3 = ctrl
trigger3 = enemynear, movetype = H || enemynear, life <= 187
trigger3 = enemynear, life <= 430
trigger3 = random <= (AILevel * 385)

;Hat of Helpers (For Simul, starting from Difficulty level 4)
[State -1, AI]
type = ChangeState
value = 3400
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4
triggerall = teammode = simul || enemynear, teammode = simul
triggerall = numpartner
triggerall = power >= 2000 || power >= 1000 && var(38)
triggerall = numenemy
trigger1 = ctrl
trigger1 = partner, alive
trigger1 = p2dist x < 100
trigger1 = enemynear, life >= 550 || power <= 2500
trigger1 = random <= (AILevel * 385)

;Taunt (this kinda cheats to do 197 quickly but it's a taunt so whatever just pretend it's a frame perfect jump into air taunt lol)
[State -1, AI]
type = ChangeState
value = ifelse(random%4 = 0,197,195)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel > 0
triggerall = numenemy
triggerall = fvar(0) >= 2
triggerall = life >= 750
trigger1 = enemynear, teammode != turns
trigger1 = enemynear, statetype = L || p2dist x >= 215
trigger1 = numexplod(195195) = 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 145)
trigger1 = random <= (AILevel * 102)

;Taunt
[State -1, AI]
type = ChangeState
value = ifelse(statetype = A,197,195)
triggerall = !fvar(27)
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel > 0
triggerall = numenemy
triggerall = fvar(0) >= 2
triggerall = life >= 750
trigger1 = enemynear, teammode != turns
trigger1 = enemynear, statetype = L || p2dist x >= 215
trigger1 = numexplod(195195) = 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 135)
trigger1 = random <= (AILevel * 92)

;Straight Buster Throw
[State -1, AI]
type = ChangeState
value = 830
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A)
triggerall = fvar(14) <= 0
triggerall = life <= 850 || life >= 1000
trigger1 = p2bodydist x >= 0
trigger1 = p2dist x <= 43
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 320)
trigger1 = random <= (AILevel * 280)

;LK or Straight Buster Throw
[State -1, AI]
type = ChangeState
value = 200+((random%2)*630)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A)
triggerall = fvar(14) <= 2
triggerall = life <= 850 || life >= 1000
trigger1 = p2bodydist x >= 0
trigger1 = p2dist x <= 43
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 320)
trigger1 = random <= (AILevel * 280)

;Crouch Medium Kick or Light Punch or Kick
[State -1, AI]
type = ChangeState
value = ifelse((random%6 <= 2),440,(200+((random%2)*30)+((random%2)*200))) 
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A)
triggerall = fvar(24) <= 0
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Close Light Punch / Kick
[State -1, AI]
type = ChangeState
value = ifelse((random%8 <= 2),440,(200+((random%2)*230))) 
;triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A)
triggerall = fvar(24) <= 1
trigger1 = p2bodydist x >= 0
trigger1 = p2dist x <= 28
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Crouch Medium Kick
[State -1, AI]
type = ChangeState
value = 440
;triggerall = !fvar(27) || fvar(27) && var(38)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = fvar(24) <= 1
trigger1 = !(p2movetype = H && p2statetype = A)
trigger1 = p2dist x > 45
trigger1 = p2dist x <= 160
trigger1 = p2bodydist y >= -25
trigger1 = ctrl
trigger1 = random <= (AILevel * 320)
trigger1 = random <= (AILevel * 280)
trigger2 = numhelper(3401)
trigger2 = helper(3401), stateno = 3401 || helper(3401), stateno = 3403
trigger2 = p2dist x > 45
trigger2 = p2dist x <= 140
trigger2 = p2bodydist y >= -45
trigger2 = ctrl
trigger2 = random <= (AILevel * 200)
trigger2 = random <= (AILevel * 140)

;Long Range Action (Overheat Turbo)
[State -1, AI]
type = ChangeState
value = 700
triggerall = fvar(27) && !numhelper(1511)
triggerall = !numhelper(1001)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = enemynear, movetype != H
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 155
trigger1 = p2dist y >= -55
trigger1 = ctrl
trigger1 = random <= (AILevel * 113)
trigger1 = random <= (AILevel * 95)

;Long Range Action
[State -1, AI]
type = ChangeState
value = var(47)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = enemynear, movetype != H
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 95
trigger1 = p2dist y >= -55
trigger1 = ctrl
trigger1 = random <= (AILevel * 133)
trigger1 = random <= (AILevel * 95)

;Long Range Action while they're OTG'd (Chad Walk or Power Wave/Shooting Star Dunk)
[State -1, AI]
type = ChangeState
value = ifelse(life >= 900,196,ifelse(numhelper(1001),105,1010))
triggerall = !numhelper(78912)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = enemynear, movetype != H
triggerall = var(30) <= 0
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 95
trigger1 = ctrl
trigger1 = random <= (AILevel * 133)

;Long Range Action while they're OTG'd (Chad Walk or Power Wave/Backdash for Shooting Star Dunk)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),105,1010)
triggerall = !numhelper(78912)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = enemynear, movetype != H
triggerall = var(30) > 0
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 95
trigger1 = ctrl
trigger1 = random <= (AILevel * 133)

;Long Range Action while they're OTG'd (Chad Walk or Power Wave/Shooting Star Dunk)
[State -1, AI]
type = ChangeState
value = 1430
triggerall = !numhelper(78912)
triggerall = !fvar(27)
triggerall = statetype = A
triggerall = p2statetype = L
triggerall = enemynear, movetype != H
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 95
trigger1 = stateno = 105
trigger1 = time > 0
trigger1 = time <= 3

;RC Kick Butt
[State -1, AI]
type = ChangeState
value = 1310
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = numexplod(100705)
trigger1 = p2dist x <= 65
trigger1 = p2dist y < -40
trigger1 = prevstateno = 1
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3

;RC Burn Knuckle Controller from run
[State -1, AI]
type = ChangeState
value = 1200+((random%2)*10) 
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = prevstateno = 1
trigger1 = stateno = 700 || stateno = 705
trigger1 = p2dist x < 0
trigger1 = p2dist y >= -60
trigger1 = time <= 3

;Big Head Mode
[State -1, AI]
type = ChangeState
value = 1110
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4
triggerall = numenemy
triggerall = teammode = simul
trigger1 = life >= 333 || enemynear, life <= 124
trigger1 = p2dist x >= -50
trigger1 = p2dist x <= 75
trigger1 = p2dist y >= -120
trigger1 = p2dist y <= 0
trigger1 = enemynear, movetype = H
trigger1 = enemynear, life <= 333
trigger1 = ctrl
trigger1 = random <= (AILevel * 245)

;Portal Knuckal (Homing, from Backdash)
[State -1, AI]
type = ChangeState
value = 1250
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = alive
triggerall = AILevel >= 6
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = enemynear, movetype != H
triggerall = fvar(26) < 2
trigger1 = life >= 750 || teammode = simul
trigger1 = p2dist y < -75 || enemynear, pos y <= -75
trigger1 = stateno = 105
trigger1 = time >= 3
trigger2 = life >= 500 || teammode = simul
trigger2 = p2dist y < -75 || enemynear, pos y <= -75
trigger2 = stateno = 105
trigger2 = time >= 3
trigger2 = enemynear, vel y <= 0 || enemynear, time >= 45

;Backdash Cancel Controller
[State -1, AI]
type = ChangeState
value = 1250+((random%2)*180)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life >= 750
triggerall = alive
triggerall = AILevel >= 6
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = fvar(26) < 2
trigger1 = stateno = 105
trigger1 = time >= 3

;Backdash Cancel Controller
[State -1, AI]
type = ChangeState
value = 1430
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = fvar(26) >= 2
trigger1 = stateno = 105
trigger1 = time >= 3

;Run Fwd
[State -1, AI]
type = ChangeState
value = 100
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = stateno != 100
triggerall = fvar(22) < 5
trigger1 = p2dist x > 75
trigger1 = p2dist x <= 275
trigger1 = p2dist y >= -65
trigger1 = ctrl
trigger1 = random <= (AILevel * 195)
trigger1 = random <= (AILevel * 175)

;Chad Walk
[State -1, AI]
type = ChangeState
value = 196
triggerall = !numhelper(78912)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 7
triggerall = var(30) <= 0
trigger1 = p2dist x >= 95
trigger1 = p2dist y >= -55
trigger1 = ctrl
trigger1 = life >= 900
trigger1 = random <= (AILevel * 133)
trigger1 = random <= (AILevel * 105)

;Close Light Punch / Straight Buster Throw
[State -1, AI]
type = ChangeState
value = ifelse(fvar(27),200,200+((random%2)*630))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A) || teammode = simul
triggerall = fvar(23) > 3
triggerall = fvar(14) <= 2
trigger1 = p2bodydist x >= 0
trigger1 = p2dist x <= 28
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 320)
trigger1 = random <= (AILevel * 280)

;Close Light Punch / Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*230)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A) || teammode = simul
trigger1 = p2bodydist x >= 0
trigger1 = p2dist x <= 28
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;CHP
[State -1, AI]
type = ChangeState
value = 420
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 6 || AILevel = 7
trigger1 = ctrl
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 35
trigger1 = p2bodydist x <= 85
trigger1 = p2bodydist y <= -60

;Roll (for roll canceling)
[State -1, AI]
type = ChangeState
value = 700+((random%2)*5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = ctrl
trigger1 = enemynear, movetype != H
trigger1 = p2bodydist x > 85
trigger1 = p2bodydist x <= 115
trigger1 = p2dist y <= -5
trigger1 = p2dist y >= -115
trigger1 = random <= (AILevel * 115)
trigger2 = ctrl
trigger2 = enemynear, movetype != H
trigger2 = p2bodydist x >= 0
trigger2 = p2bodydist x < 35
trigger2 = p2dist y <= -5
trigger2 = p2dist y >= -115
trigger2 = random <= (AILevel * 260)

;Roll (when close to a downed opponent with the Power Charge helper)
[State -1, AI]
type = ChangeState
value = ifelse(backedgedist <= 40,700,705)
triggerall = numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4
triggerall = numenemy
trigger1 = power < 1000
trigger1 = ctrl || stateno = 1
trigger1 = p2bodydist x <= 45
trigger1 = random <= (AILevel * 115)

;Roll (when close to a downed opponent that's getting up)
[State -1, AI]
type = ChangeState
value = ifelse(backedgedist <= 40,700,705)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = enemynear, stateno = 5120 || enemynear, stateno = 5201
trigger1 = enemynear, vel x = 0
trigger1 = ctrl || stateno = 1
trigger1 = p2bodydist x <= 75
trigger1 = random <= (AILevel * 115)

;Roll Cancel Crack Shoot
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3
trigger1 = p2bodydist x > 85
trigger1 = p2bodydist x <= 115
trigger1 = p2dist y <= -5
trigger1 = p2dist y >= -115
trigger2 = stateno = 700 || stateno = 705
trigger2 = time <= 3
trigger2 = p2bodydist x >= 0
trigger2 = p2bodydist x < 35
trigger2 = p2dist y <= -5
trigger2 = p2dist y >= -115

;Close Light Kick / Back Throw
[State -1, AI]
type = ChangeState
value = 230+((random%2)*600)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A) || teammode = simul
triggerall = fvar(23) > 3
triggerall = fvar(14) <= 2
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 320)
trigger1 = random <= (AILevel * 280)

;Light Punch or Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*30)+((random%2)*200)
triggerall = !fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = !(p2movetype = H && p2statetype = A) || teammode = simul
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;VAIS Followup
[State -1, AI]
type = ChangeState
value = var(43)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = prevstateno != 1
trigger1 = p2dist y >= -45
trigger1 = stateno = 200 && movecontact
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)
trigger2 = stateno = 230 && movecontact
trigger2 = random <= (AILevel * 245)
trigger3 = p2dist y >= -30
trigger3 = stateno = 400
trigger3 = (movehit && time > 5)
trigger3 = prevstateno != 430
trigger3 = random <= (AILevel * 245)
trigger4 = stateno = 420 && movecontact
trigger4 = random <= (AILevel * 245)
trigger4 = prevstateno != 410 && prevstateno != 440
trigger5 = p2dist y >= -30
trigger5 = stateno = 430
trigger5 = (movecontact && time > 5)
trigger5 = prevstateno != 430
trigger5 = random <= (AILevel * 245)

;Air Dodge
[State -1, AI]
type = ChangeState
value = 710
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 55
trigger1 = pos y >= -45
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -70
trigger1 = enemynear, movetype = A
trigger1 = ctrl
trigger1 = random <= (AILevel * 400)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4
triggerall = numenemy
triggerall = teammode = simul
trigger1 = life >= 850 || enemynear, life <= 124
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 100
trigger1 = p2dist y >= -70
trigger1 = p2dist y <= 0
trigger1 = enemynear, movetype = H
trigger1 = enemynear, life <= 850
trigger1 = ctrl
trigger1 = random <= (AILevel * 245)


;---------------------------------------------------------------------------
;VAIS CMK Combo
;This combo makes the best of low damage scaling, dealing huge amounts of damage, and even over 1000 when Overheating.

;MP
[State -1, AI]
type = ChangeState
value = 210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 440
trigger1 = p2dist y >= -50
trigger1 = p2dist x >= -20
trigger1 = p2dist x <= 80
trigger1 = movecontact
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 440
trigger1 = p2dist y >= -50
trigger1 = p2dist x >= 80
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Kick Butt
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 440
trigger1 = p2dist y < -50 || p2dist x >= 80
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = prevstateno = 440
trigger1 = stateno = 210
trigger1 = pos y >= -25
trigger1 = p2dist x >= -20
trigger1 = p2dist x <= 75
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 211
trigger1 = pos y >= -25
trigger1 = p2dist x >= -20
trigger1 = p2dist x <= 150
trigger1 = movehit
trigger1 = time >= 11
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 1
trigger1 = prevstateno = 1000
trigger1 = time >= 2
trigger1 = random <= (AILevel * 289)
trigger2 = frontedgedist < 80 || power < 1500 || var(38)
trigger2 = stateno = 1
trigger2 = prevstateno = 1000
trigger2 = time >= 2
trigger2 = random <= (AILevel * 289)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(58)
trigger1 = stateno = 1510 && movehit
trigger1 = random <= (AILevel * 210)

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = !fvar(27) || fvar(27) && var(38)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = (power >= 1000 && var(38)) || power < 3000
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = power >= 1000
trigger1 = p2bodydist y >= -55
trigger1 = p2bodydist y < 20
trigger1 = enemynear, movetype = H
trigger1 = stateno = 1405
trigger1 = time >= 0

;Buseter Vacation / Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = ifelse(FrontEdgeDist <= 35,3300+((random%2)*400),3300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = power >= 3000 && !var(38)
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = p2bodydist y >= -55
trigger1 = p2bodydist y < 20
trigger1 = enemynear, movetype = H
trigger1 = stateno = 1405
trigger1 = time >= 0

;Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = power >= 3000
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = frontedgedist >= 72
trigger1 = numtarget
trigger1 = stateno = 3101 || stateno = 3151
trigger1 = time >= 18
trigger1 = enemynear, pos y >= -55
trigger1 = frontedgedist >= 72
trigger2 = numtarget
trigger2 = stateno = 3153
trigger2 = time >= 30
trigger2 = enemynear, pos y >= -55
trigger3 = frontedgedist < 72
trigger3 = numtarget
trigger3 = stateno = 3153
trigger3 = time >= 42
trigger3 = enemynear, pos y < -55

;Buster Vacation
[State -1, AI]
type = ChangeState
value = 3700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 6
triggerall = power >= 3000
triggerall = numenemy
triggerall = !numhelper(3401)
triggerall = frontedgedist < 72
trigger1 = numtarget
trigger1 = stateno = 3101 || stateno = 3151
trigger1 = time >= 14
trigger1 = enemynear, pos y >= -55
trigger2 = numtarget
trigger2 = stateno = 3153
trigger2 = time >= 24
trigger2 = enemynear, pos y >= -55


;---------------------------------------------------------------------------
;VAIS LP Combo Branch (No contact)

;Roll
[State -1, AI]
type = ChangeState
value = 705
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2bodydist x <= 45
trigger1 = stateno = 200 && !movecontact
trigger1 = time >= 13
trigger1 = random <= (AILevel * 245)
trigger2 = p2bodydist x <= 45
trigger2 = anim = 2000
trigger2 = stateno = 200 && !movecontact
trigger2 = time >= 9
trigger2 = random <= (AILevel * 245)

;CMK or Roll Forward
[State -1, AI]
type = ChangeState
value = 440+((random%2)*260)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2bodydist x > 45
trigger1 = stateno = 200 && !movecontact
trigger1 = time >= 13
trigger1 = random <= (AILevel * 245)
trigger2 = p2bodydist x > 45
trigger2 = anim = 2000
trigger2 = stateno = 200 && !movecontact
trigger2 = time >= 9
trigger2 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS LP Combo Branch 5

;MP1
[State -1, AI]
type = ChangeState
value = 210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = stateno = 230 && movecontact
trigger1 = random <= (AILevel * 245)

;Power Charge (Override the combo for an Overheat attempt)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = prevstateno = 200
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Power Charge (Override the combo for an Overheat attempt)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = prevstateno = 230 || prevstateno = 200
trigger1 = stateno = 231 || stateno = 210
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 211+((random%2)*1389)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 5
trigger1 = stateno = 210 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Barnacle or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1220+((random%2)*100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 5
trigger1 = stateno = 210 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320+((random%2)*280)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 5
trigger1 = frontedgedist >= 70
trigger1 = stateno = 211 && moveguarded
trigger1 = time >= 6
trigger1 = random <= (AILevel * 245)

;Barnacle or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1220+((random%2)*100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 5
trigger1 = frontedgedist >= 70
trigger1 = stateno = 211 && moveguarded
trigger1 = time >= 6
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 5
trigger1 = frontedgedist < 70
trigger1 = stateno = 211 && moveguarded
trigger1 = time >= 6
trigger1 = random <= (AILevel * 245)

;Retreating Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 5
trigger1 = frontedgedist < 70
trigger1 = stateno = 211 && moveguarded
trigger1 = time >= 6
trigger1 = random <= (AILevel * 245)

;Buster Foot
[State -1, AI]
type = ChangeState
value = 233
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
triggerall = var(53) != 0
trigger1 = stateno = 210 && movehit
trigger1 = time >= 6
trigger1 = random <= (AILevel * 245)

;Kick Back
[State -1, AI]
type = ChangeState
value = 241
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = stateno = 233 && movecontact
trigger1 = random <= (AILevel * 245)

;Slightly Faster Buster Foot Not So Auto Combo
[State -1, AI]
type = ChangeState
value = 235
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = stateno = 241 && movehit
trigger1 = random <= (AILevel * 245)

;Zooooooooooooooom Punch
[State -1, AI]
type = ChangeState
value = 223
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = p2dist y >= -65
trigger1 = stateno = 235 && movehit
trigger1 = random <= (AILevel * 245)

;Bongo Beam
[State -1, AI]
type = ChangeState
value = 1620
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 223 && movehit

;Power Wave or Bongo Beam
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1620,(1010+((random%2)*10)))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 223 && moveguarded
trigger1 = random <= (AILevel * 245)

;(Hungry Hunter) Buster Wolf
[State -1, AI]
type = ChangeState
value =  ifelse(power >= 3000 && !var(38),3300,3100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = stateno = 1620
trigger1 = enemynear, pos y >= -65
trigger1 = enemynear, vel y >= 0
trigger1 = power >= 1000
trigger1 = enemynear, stateno = 1626 || enemynear, stateno = 1627 || enemynear, stateno = 1628
trigger1 = enemynear, movetype = H
trigger1 = random <= (AILevel * 222)
trigger1 = random <= (AILevel * 168)


;---------------------------------------------------------------------------
;VAIS LP Combo Branch 6 and 7

;HP or Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 220+((random%2)*1380)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7
triggerall = fvar(23) <= 3
trigger1 = stateno = 201 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;HP or Barnacle/Kick Butt
[State -1, AI]
type = ChangeState
value = 220+((random%2)*ifelse(life > 200,1000,1090))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7
triggerall = fvar(23) > 3
trigger1 = stateno = 201 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist >= 75
trigger1 = stateno = 220 && moveguarded
trigger1 = random <= (AILevel * 245)

;Retreating Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist >= 75
trigger1 = stateno = 220 && moveguarded
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist < 75
trigger1 = stateno = 220 && moveguarded
trigger1 = random <= (AILevel * 245)

;Retreating Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist < 75
trigger1 = stateno = 220 && moveguarded
trigger1 = random <= (AILevel * 245)

;LP2 or just go straight into Power Charge (Override the combo for an Overheat attempt)
[State -1, AI]
type = ChangeState
value = 202+((random%2)*1308)
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = stateno = 201 && movehit
trigger1 = hitcount >= 2 || time >= 10
trigger1 = random <= (AILevel * 245)

;Power Charge (Override the combo for an Overheat attempt)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = stateno = 202 && movehit
trigger1 = random <= (AILevel * 245)

;HP
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7
trigger1 = stateno = 201 && movehit
trigger1 = hitcount >= 2 || time >= 10
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7
trigger1 = stateno = 220 && movehit
trigger1 = random <= (AILevel * 245)

;One More! H
[State -1, AI]
type = ChangeState
value = 1026
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = numenemy
trigger1 = numhelper(1002)
trigger1 = helper(1002), stateno = 1002
trigger1 = stateno = 1000
trigger1 = prevstateno = 220
trigger1 = frontedgedist >= 80
trigger1 = power >= 1500
trigger1 = time >= 20
trigger1 = time <= 23
trigger1 = enemynear, movetype = H
trigger1 = random <= (AILevel * 245)

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = !fvar(27) || fvar(27) && var(38)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = stateno = 1026
trigger1 = animtime = 0
trigger1 = enemynear, pos y >= -95
trigger1 = enemynear, vel y >= 0
trigger1 = power >= 1000
trigger1 = enemynear, movetype = H
trigger1 = random <= (AILevel * 222)
trigger1 = random <= (AILevel * 168)


;-----Route 7 branches off here. This is also a backup route for 6 in case certain conditions are unmet------
;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = !numexplod(2131000) 
trigger1 = var(42) = 7 || var(38)
trigger1 = stateno = 1
trigger1 = prevstateno = 1000
trigger1 = time >= 2
trigger1 = random <= (AILevel * 289)
trigger2 = frontedgedist < 80 || power < 1500 || var(38)
trigger2 = stateno = 1
trigger2 = prevstateno = 1000
trigger2 = time >= 2
trigger2 = random <= (AILevel * 289)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6 || var(42) = 7 || var(42) = 9 ;(Also 9 for another sequence involving this link)
trigger1 = stateno = 1510 && movehit
trigger1 = random <= (AILevel * 210)


;---------------------------------------------------------------------------
;VAIS LP Combo Branch 8

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 211+((random%2)*1389)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = stateno = 210 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Barnacle or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 211+((random%2)*ifelse(life > 200,1009,1389))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = stateno = 210 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320+((random%2)*280)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist >= 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist < 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;Retreating Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 6 || var(42) = 7
trigger1 = frontedgedist < 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8
trigger1 = stateno = 210 && movehit
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8
trigger1 = !numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = time >= 10
trigger1 = p2dist y >= -30
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8
trigger1 = numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = p2dist y >= -40
trigger1 = random <= (AILevel * 245)

;Rising Tacos Early
[State -1, AI]
type = ChangeState
value = 1100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8
trigger1 = stateno = 211 && movehit
trigger1 = time >= 10
trigger1 = p2dist y < -40
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8
triggerall = numenemy
triggerall = !numexplod(2131000) 
trigger1 = numhelper(1002)
trigger1 = helper(1002), stateno = 1002
trigger1 = helper(1002), time <= 55
trigger1 = stateno = 1000
trigger1 = prevstateno = 211
trigger1 = time >= 65
trigger1 = enemynear, movetype = H
trigger1 = p2dist x >= 80
trigger1 = p2dist x <= 180
trigger1 = p2dist y >= -140
trigger1 = p2dist y <= -70

;Rising Tacos
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = var(42) >= 8 || var(42) = 5
trigger1 = var(42) != 12
trigger1 = stateno = 1 && prevstateno = 1510
trigger1 = enemynear, movetype = H
trigger1 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -113
trigger1 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -15
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 70
trigger2 = var(42) != 12
trigger2 = stateno = 501
trigger2 = time >= 6
trigger2 = numtarget
trigger2 = enemynear, stateno = 11063
trigger2 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y >= -65
trigger2 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y <= -35
trigger2 = p2dist x >= -40
trigger2 = p2dist x <= 90
trigger3 = var(42) != 12
trigger3 = stateno = 501
trigger3 = time >= 6
trigger3 = numtarget
trigger3 = enemynear, stateno != 11063 && enemynear, movetype = H
trigger3 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -95
trigger3 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -45
trigger3 = p2dist x >= -40
trigger3 = p2dist x <= 90
trigger4 = var(42) = 12
trigger4 = stateno = 501
trigger4 = numtarget
trigger4 = enemynear, stateno = 11063
trigger4 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y >= -50
trigger4 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y <= -15
trigger4 = p2dist x >= -40
trigger4 = p2dist x <= 60

;Rising Tacos
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = var(42) = 4
trigger1 = FrontEdgeDist <= 45
trigger1 = stateno = 501
trigger1 = numtarget
trigger1 = enemynear, stateno = 11063
trigger1 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y >= -56
trigger1 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y <= -35
trigger1 = p2dist x >= -60
trigger1 = p2dist x <= 60

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 8 || var(42) = 5
triggerall = numenemy
trigger1 = stateno = 1510 && movehit
trigger1 = enemynear, movetype = H
trigger1 = p2dist x > 35
trigger1 = p2dist y >= -150

;Bucket Head
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
;triggerall = var(42) >= 8 || var(42) = 5 || var(42) = 6 || prevstateno = 213
triggerall = var(12) = 0
trigger1 = stateno = 1100 && movehit
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) >= -131
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) <= -90
trigger1 = p2dist x >= -20
trigger1 = p2dist x <= 90

;Riser Kick
[State -1, AI]
type = ChangeState
value = ifelse(var(37) <= 1,1107,1104)
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
;triggerall = var(42) >= 8 || var(42) = 5 || var(42) = 6 || var(42) = 4
triggerall = var(12) != 0
triggerall = numtarget
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = p2dist x >= -50
trigger1 = p2dist x <= 80
trigger1 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) >= -115
trigger1 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) <= -35
trigger2 = stateno = 11070
trigger2 = time >= 26
trigger2 = time <= 40
trigger2 = p2dist x >= -40
trigger2 = p2dist x <= 175
trigger2 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) >= 25
trigger2 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) <= 145

;Power Mortar / Limewire Go Bang!
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = power >= 1200 || var(38)
trigger1 = p2dist x >= -35
trigger1 = p2dist x <= 55
trigger1 = stateno = 1105 && numtarget
trigger1 = time >= 32

;---------------------------------------------------------------------------
;VAIS LK Combo Branch 3

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 232+((random%2)*1368)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 3
triggerall = fvar(23) <= 3
trigger1 = stateno = 231 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Barnacle/Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 232+((random%2)*ifelse(life > 200,988,1088))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 3
triggerall = fvar(23) > 3
trigger1 = stateno = 231 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;LK2
[State -1, AI]
type = ChangeState
value = 232
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) <= 3
trigger1 = stateno = 231 && movecontact
trigger1 = p2dist y <= -25
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320+((random%2)*280)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) <= 3
triggerall = fvar(23) <= 3
trigger1 = frontedgedist >= 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) <= 3
trigger1 = frontedgedist < 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Retreating Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1610
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) > 3
trigger1 = frontedgedist < 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bonk or Kick Butt (enemy is too high up in the air for other follow-ups)
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) <= 3
trigger1 = stateno = 232 && movehit
trigger1 = time >= 8
trigger1 = p2dist y <= -25
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) <= 3
triggerall = numenemy
trigger1 = stateno = 231 && movehit
trigger1 = p2dist y > -25
trigger1 = random <= (AILevel * 245)

;The Powerdunk follow-up borrows from a different controller with the same triggers

;---------------------------------------------------------------------------
;VAIS LK Combo Branch 4

;LK2
[State -1, AI]
type = ChangeState
value = 232
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 4
trigger1 = stateno = 231 && movecontact
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320+((random%2)*280)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 4
trigger1 = frontedgedist >= 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Barnacle or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1220+((random%2)*100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
triggerall = var(42) = 4
trigger1 = frontedgedist >= 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 4
trigger1 = frontedgedist < 75
trigger1 = stateno = 232 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Gamers rise up
[State -1, AI]
type = ChangeState
value = 1120+floor(fvar(1))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = var(42) = 4
trigger1 = stateno = 232 && movehit
trigger1 = time >= 11
trigger1 = random <= (AILevel * 210)
trigger1 = random <= (AILevel * 210)
trigger1 = p2dist x >= -10
trigger1 = p2dist x <= 90
trigger2 = prevstateno = 1120 || prevstateno = 1121 || prevstateno = 1122 || prevstateno = 1123
trigger2 = stateno = 1101
trigger2 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -65
trigger2 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -35
trigger2 = p2dist x >= -10
trigger2 = p2dist x <= 90
trigger3 = floor(fvar(1)) = 3
trigger3 = prevstateno = 1101
trigger3 = stateno = 111
trigger3 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -75
trigger3 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -35
trigger3 = p2dist x >= -10
trigger3 = p2dist x <= 90

;---------------------------------------------------------------------------
;VAIS LK Combo Branch 5

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = stateno = 210 && movecontact
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320+((random%2)*280)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
triggerall = fvar(23) <= 3
trigger1 = frontedgedist >= 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;Barnacle or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1220+((random%2)*100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
triggerall = fvar(23) > 3
trigger1 = frontedgedist >= 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
triggerall = var(42) = 5
trigger1 = frontedgedist < 75
trigger1 = stateno = 211 && moveguarded
trigger1 = random <= (AILevel * 245)

;Rocky Mountain Splitting wave
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = stateno = 211 && movehit
trigger1 = enemynear, life <= (118 * fvar(19))
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = power < 3000 || var(38) && power < 2000
trigger1 = !numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = time >= 10
trigger1 = p2dist y >= -30
trigger1 = random <= (AILevel * 245)

;MP2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 245)

;Blazing Blade
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 5
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = stateno = 212 && movehit
trigger1 = random <= (AILevel * 245)

;Buster Vacation
[State -1, AI]
type = ChangeState
value = 3700
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 1210 && movehit
trigger1 = hitcount >= 5 || time >= 18 && time < 21
trigger1 = random <= (AILevel * 255)
trigger1 = p2dist y >= -45
trigger1 = p2dist x <= 85

;---------------------------------------------------------------------------
;Guard Crush Wall Collision Follow-up

;Big Head Mode
[State -1, AI]
type = ChangeState
value = 1110
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = life >= 333 || enemynear, life <= 124
trigger1 = p2dist x <= 75
trigger1 = enemynear, movetype = H
trigger1 = enemynear, stateno = 1604
trigger1 = enemynear, life <= 124 || random <= 300
trigger1 = stateno = 1600 || stateno = 1610
trigger1 = time >= 26 && time <= 28
trigger1 = random <= (AILevel * 245)

;CMK
[State -1, AI]
type = ChangeState
value = 440
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = enemynear, movetype = H
trigger1 = enemynear, stateno = 1604
trigger1 = stateno = 1600 || stateno = 1610
trigger1 = time >= 44
trigger1 = random <= (AILevel * 245)


;---------------------------------------------------------------------------
;Guard Cancel Follow-up

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 9 ;Guardcancel forces the VAIS variable to become 9 to piggyback off another combo where this sequence is involved
triggerall = !numexplod(2131000) 
trigger1 = stateno = 1
trigger1 = prevstateno = 1000
trigger1 = time >= 2
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS CLP Combo Branch (No contact/blocked)

;Roll
[State -1, AI]
type = ChangeState
value = 700+((random%2)*5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = p2bodydist x <= 45
trigger1 = stateno = 400 && !movecontact
trigger1 = time >= 11

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
trigger1 = stateno = 400
trigger1 = prevstateno != 430
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;Barnacle/Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = ifelse(life > 200,1220,1320)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
trigger1 = stateno = 400
trigger1 = prevstateno != 430
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS CLK Combo Branch (Too far/guarded)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) <= 3
trigger1 = stateno = 440
trigger1 = prevstateno = 430
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;Barnacle/Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = ifelse(life > 200,1220,1320)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(23) > 3
trigger1 = stateno = 440
trigger1 = prevstateno != 430
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 440
trigger1 = prevstateno = 430
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = stateno = 1510
trigger1 = prevstateno = 440
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Kick Butt (Stop the combo early and evac with kick butt if they have super armor)
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = !numtarget
trigger1 = prevstateno = 430
trigger1 = stateno = 400 && movehit
trigger1 = random <= (AILevel * 344)

;---------------------------------------------------------------------------
;VAIS CLK Combo Branch 4/5

;CMP
[State -1, AI]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 4 || var(42) = 5 || var(42) = 6
trigger1 = stateno = 400
trigger1 = prevstateno = 430
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;CHP
[State -1, AI]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 4 || var(42) = 5 || var(42) = 6
trigger1 = stateno = 410
trigger1 = prevstateno = 400
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 4 || var(42) = 5
triggerall = numtarget
trigger1 = prevstateno = 410
trigger1 = stateno = 420 && movehit
trigger1 = time >= 20
trigger1 = random <= (AILevel * 344)
ctrl = 1

;ALK
[State -1, AI]
type = ChangeState
value = 630
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(14) >= 2
trigger1 = p2dist x >= -5
trigger1 = p2dist x <= 90
trigger1 = p2bodydist y <= 5
trigger1 = p2bodydist y >= -85
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;Air Throw
[State -1, AI]
type = ChangeState
value = ifelse(var(42) = 4,870,850)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(14) < 2
trigger1 = vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 55
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;Air Throw
[State -1, AI]
type = ChangeState
value = ifelse(random%2,870,850)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = fvar(14) < 2
trigger1 = vel x >= 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 55
trigger1 = pos y >= -25
trigger1 = enemynear, statetype = S || enemynear, pos y >= -45
trigger1 = enemynear, movetype != H
trigger1 = ctrl
trigger1 = random <= (AILevel * 400)

;Shooting Star Dunk
[State -1, AI]
type = ChangeState
value = 1430
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = stateno = 871
trigger1 = time >= 45

;smaktebord
[State -1, AI]
type = ChangeState
value = 1520
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = target, stateno = 861
trigger1 = stateno = 852
trigger1 = time >= 65

;smaktebord
[State -1, AI]
type = ChangeState
value = 1520
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = target, stateno = 861
trigger1 = stateno = 852
trigger1 = time >= 65

;Rising Taco
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = stateno = 1520 && movehit
trigger1 = time >= 26
trigger1 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -55
trigger1 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -35

;Bucket Head - This kicks off the rest of the Rising Taco sequence that's baked into other combos.
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 4
triggerall = var(12) = 0
trigger1 = stateno = 1100 && movehit
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) >= -131
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) <= -90
trigger1 = p2dist x >= -20
trigger1 = p2dist x <= 90

;---------------------------------------------------------------------------
;VAIS CLK Combo Branch 6
;Borrows the same normals from Branches 4 and 5 and continues from there.

;Round Trip Wave (This is meant to miss, but use the empowered version to catch the opponent as CHP launches them by following up as soon as possible)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1020)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = numtarget
trigger1 = prevstateno = 410
trigger1 = stateno = 420 && movehit
trigger1 = random <= (AILevel * 344)

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = numtarget
trigger1 = frontedgedist >= 60
trigger1 = prevstateno = 420
trigger1 = stateno = 1020
trigger1 = time >= 64
trigger1 = random <= (AILevel * 344)
ctrl = 1

;Power dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = numtarget
trigger1 = frontedgedist < 60
trigger1 = prevstateno = 420
trigger1 = stateno = 1020
trigger1 = time >= 64
trigger1 = random <= (AILevel * 344)

;Riser Kick H
[State -1, AI]
type = ChangeState
value = 1104
triggerall = numenemy
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = var(12) = 0
trigger1 = enemynear, life <= (122 * fvar(19))
trigger1 = stateno = 1100 && movehit
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = p2dist x >= -50
trigger1 = p2dist x <= 80
trigger1 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) >= -140
trigger1 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) <= -65
trigger2 = enemynear, life <= (122 * fvar(19))
trigger2 = stateno = 1100
trigger2 = time >= 23
trigger2 = time < 32
trigger2 = p2dist x >= -50
trigger2 = p2dist x <= 80
trigger2 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) >= -115
trigger2 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) <= -35
trigger3 = enemynear, life <= (122 * fvar(19))
trigger3 = stateno = 11070
trigger3 = time >= 26
trigger3 = time <= 40
trigger3 = p2dist x >= -40
trigger3 = p2dist x <= 175
trigger3 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) >= 25
trigger3 = (enemynear,pos y + enemynear,vel y * 19 + 0.5 * (enemynear,gethitvar(yaccel)) * 19 ** 2 - pos y) <= 145

;Bucket Head - This kicks off the rest of the Rising Taco sequence that's baked into other combos too.
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) = 6
triggerall = var(12) = 0
trigger1 = stateno = 1100 && movehit
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) >= -148
trigger1 = (enemynear,pos y + enemynear,vel y * 14 + 0.5 * (enemynear,gethitvar(yaccel)) * 14 ** 2 - pos y) <= -109
trigger1 = p2dist x >= -50
trigger1 = p2dist x <= 90

;Rising Tacos
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) >= 6
triggerall = var(12) != 0
triggerall = numenemy
trigger1 = var(42) != 12
trigger1 = stateno = 501
trigger1 = time >= 6
trigger1 = numtarget
trigger1 = enemynear, stateno = 11063
trigger1 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y >= -58
trigger1 = enemynear,pos y + enemynear,vel y * 6 + 0.5 * 0.35 * 6 ** 2 - pos y <= -30
trigger1 = p2dist x >= -40
trigger1 = p2dist x <= 90
trigger2 = var(42) != 12
trigger2 = stateno = 501
trigger2 = time >= 6
trigger2 = numtarget
trigger2 = enemynear, stateno != 11063 && enemynear, movetype = H
trigger2 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) >= -95
trigger2 = (enemynear,pos y + enemynear,vel y * 6 + 0.5 * (enemynear,gethitvar(yaccel)) * 6 ** 2 - pos y) <= -45
trigger2 = p2dist x >= -40
trigger2 = p2dist x <= 90

;---------------------------------------------------------------------------
;Simple air combo

;MP
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 600 || stateno = 630
trigger1 = pos y <= -35
trigger1 = vel x > 0
trigger1 = movecontact
trigger1 = random <= (AILevel * 245)

;HP
[State -1, AI]
type = ChangeState
value = 620
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 610
trigger1 = p2bodydist y <= 30
trigger1 = p2bodydist y >= -60
trigger1 = movehit
trigger1 = vel x > 0
trigger1 = random <= (AILevel * 245)

;A Buster Wolf Seen From Above
[State -1, AI]
type = ChangeState
value = 3160
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = pos y <= -15
triggerall = AILevel >= 4
triggerall = power >= 1000 || var(38)
trigger1 = numexplod(6203160)
trigger1 = statetype = A
trigger1 = stateno = 1401
trigger1 = movehit
trigger1 = random <= (AILevel * 344)
trigger2 = numtarget
trigger2 = power >= 1500
trigger2 = target, statetype = S
trigger2 = target, movetype = H
trigger2 = statetype = A
trigger2 = stateno = 1401
trigger2 = movehit
trigger2 = random <= (AILevel * 344)
trigger3 = stateno = 1312
trigger3 = movehit
trigger3 = time <= 18
trigger3 = (enemynear,pos y + enemynear,vel y * 17 + 0.5 * (enemynear,gethitvar(yaccel)) * 17 ** 2 - pos y) >= 130
trigger3 = (enemynear,pos y + enemynear,vel y * 17 + 0.5 * (enemynear,gethitvar(yaccel)) * 17 ** 2 - pos y) <= 188
trigger4 = AILevel <= 6
trigger4 = stateno = 1431
trigger4 = movehit
trigger4 = numtarget
trigger4 = target, movetype = H
trigger4 = pos y <= -40
trigger4 = time >= 65 || enemynear, life <= (280 * fvar(19))
trigger4 = random <= (AILevel * 268)
trigger4 = p2dist x >= 50
trigger4 = (enemynear,pos y + enemynear,vel y * 17 + 0.5 * (enemynear,gethitvar(yaccel)) * 17 ** 2 - pos y) >= 68
trigger4 = (enemynear,pos y + enemynear,vel y * 17 + 0.5 * (enemynear,gethitvar(yaccel)) * 17 ** 2 - pos y) <= 108
trigger4 = enemynear, life <= (280 * fvar(19)) || AILevel <= 5 && random <= (AILevel * 158)
trigger5 = stateno = 620 
trigger5 = prevstateno = 610 || prevstateno = 640
trigger5 = movehit

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = statetype = A
trigger1 = stateno = 620
trigger1 = movehit
trigger1 = random <= (AILevel * 344)
trigger2 = statetype = A
trigger2 = stateno = 600 || stateno = 630 || stateno = 610
trigger2 = pos y > -35 || vel x <= 0
trigger2 = movecontact
trigger2 = random <= (AILevel * 245)



;---------------------------------------------------------------------------
;Dashing Attack combos

;Rising Tacos
[State -1, AI]
type = ChangeState
value = 1100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numexplod(10001100)
trigger1 = stateno = 213
trigger1 = movehit
trigger1 = time >= 19
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -45
trigger1 = 1 || var(42) := 12

;Power Wave L (Must have assist ready)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1210,1000) ;Use Blazing Blade instead if this will result in Gutsman's ass
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = !numhelper(1002)
triggerall = !numexplod(10001100)
trigger1 = stateno = 213
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 75
trigger1 = p2bodydist y >= -45

;Run Fwd for followup
[State -1, AI]
type = ChangeState
value = 100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numhelper(1002)
trigger1 = numexplod(2131000)
trigger1 = stateno = 1
trigger1 = prevstateno = 1000
trigger1 = time >= 2

;Kick Butt!
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numhelper(1002)
triggerall = numexplod(2131000)
trigger1 = stateno = 213
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x > -20
trigger1 = p2bodydist x <= 100
trigger1 = p2bodydist y >= -60

;---------------------------------------------------------------------------
;RC skamtebord followup

;Kick Butt!
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = var(42) = 52
trigger1 = stateno = 1520
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x > -20
trigger1 = p2bodydist x <= 70
trigger1 = p2bodydist y >= -80

;---------------------------------------------------------------------------
;RC Crack Sharpshooter followup

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
triggerall = AILevel >= 6
trigger1 = var(42) = 32
trigger1 = var(48) >= 30
trigger1 = var(48) <= 34
trigger1 = stateno = 1323
trigger1 = enemynear, movetype = H
trigger1 = time >= 17
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -80

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = var(42) = 32
trigger1 = stateno = 210
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -80

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(38)
trigger1 = var(42) = 32
trigger1 = stateno = 211
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -80

;Power Charge (Override for Overheat Turbo)
[State -1, AI]
type = ChangeState
value = 1510
triggerall = fvar(27)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = var(42) = 32
trigger1 = stateno = 211
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -80

;MP2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = var(42) = 32
trigger1 = stateno = 211
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -80

;Kick Butt!
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = power <= 3000
trigger1 = var(42) = 32
trigger1 = stateno = 212
trigger1 = movehit
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 85
trigger1 = p2bodydist y >= -80


;---------------------------------------------------------------------------
;Portal Knuckal

;Portal Knuckal or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = ifelse((fvar(26) < 2 || life >= 750),1250,1320)
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = power >= 500 || var(38)
trigger1 = power < 2700 || var(38)
trigger1 = power >= 1500 || power < 1000 || var(38)
trigger1 = stateno = 1502 && movecontact || stateno = 15030
trigger1 = time >= 20
trigger1 = numenemy
trigger1 = enemynear, statetype = A
trigger1 = random <= (AILevel * 210)

;---------------------------------------------------------------------------
;Low priority controllers 

;Quick! Throw out a special move! (Off normals and VAIS somehow doesn't have a route)
[State -1, AI]
type = ChangeState
value = ifelse(!numhelper(1511),1510,1300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 210 && movehit
trigger2 = stateno = 240 && movehit
trigger3 = stateno = 410 && movehit

;Kick Butt!
[State -1, AI]
type = ChangeState
value = 211+((random%2)*1099)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 210 && moveguarded
trigger1 = time >= 10
trigger1 = random <= (AILevel * 245)

;Kick Butt! or Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1310+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = stateno = 211 && moveguarded
trigger1 = time >= 14
trigger1 = random <= (AILevel * 245)

;Power Mortar / Limewire Go Bang!
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
trigger1 = !numexplod(30503050)
trigger1 = !numhelper(1511)
trigger1 = ctrl
trigger1 = power >= 1000
trigger1 = power < 3000
trigger1 = enemynear, statetype = L
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 100

;Chaos Dunk (This is a really bad idea but oh boy if it hits)
[State -1, AI]
type = ChangeState
value = 1420
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life >= 850
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = fvar(25) = 0
triggerall = fvar(0) >= 0
trigger1 = !numexplod(14201420)
trigger1 = ctrl
trigger1 = power < 1000
trigger1 = enemynear, statetype = L
trigger2 = numexplod(30503050)
trigger2 = !numexplod(14201420)
trigger2 = ctrl
trigger2 = power >= 1000
trigger2 = enemynear, statetype = L
trigger3 = numhelper(3401)
trigger3 = helper(3401), stateno = 3402 || helper(3401), stateno = 3404 || helper(3401), stateno = 3406
trigger3 = enemynear, movetype = H
trigger3 = ctrl
trigger4 = ctrl
trigger4 = enemynear, anim = 5300
trigger4 = enemynear, movetype = H

;Portal Knuckal (Tracking)
[State -1, AI]
type = ChangeState
value = 1250
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life >= 750 || teammode = simul
triggerall = alive
triggerall = AILevel >= 6
triggerall = numenemy
triggerall = !var(57)
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = fvar(26) < 2
trigger1 = p2dist x > 180
trigger1 = p2dist y < -40 || p2dist y > 10
trigger1 = random <= (AILevel * 245)
trigger1 = enemynear, movetype != H
trigger1 = ctrl
trigger2 = ctrl
trigger2 = teammode = simul
trigger2 = p2dist x >= 110

;Portal Knuckal (Homing, from Backdash, if no other conditions are met somehow, with some restrictions)
[State -1, AI]
type = ChangeState
value = 1250
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life >= 750
triggerall = alive
triggerall = AILevel >= 6
triggerall = enemynear, stateno != 5120
triggerall = enemynear, stateno != 5201
triggerall = enemynear, stateno != 5210
triggerall = enemynear, movetype != H
triggerall = fvar(26) < 2
trigger1 = stateno = 105
trigger1 = time >= 4


;---------------------------------------------------------------------------
;Buster Foot Combo (This is a low priority combo that has parts of it see use from the Medium difficulty all the way to the highest)

;Kick Back
[State -1, AI]
type = ChangeState
value = 241
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = stateno = 233 && movecontact
trigger1 = random <= (AILevel * 245)
trigger2 =  stateno = 240 && movecontact
trigger2 = p2dist x <= 55
trigger2 = random <= (AILevel * 245)

;Slightly Faster Buster Foot Not So Auto Combo
[State -1, AI]
type = ChangeState
value = 235
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = stateno = 241 && movehit
trigger1 = random <= (AILevel * 245)

;Zooooooooooooooom Punch
[State -1, AI]
type = ChangeState
value = 223
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = stateno = 235 && movehit
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;Medium AI (3-5)
 ;Here, Terrance starts to implement the VAIS, and uses some of the stronger sub-systems at his disposal.
 ;Medium AI focuses more on showcasing a little bit of everything while still putting up a good fight.

;VAIS Followup
[State -1, AI]
type = ChangeState
value = var(43)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = prevstateno != 1
trigger1 = p2dist y >= -45
trigger1 = stateno = 200 && movecontact
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)
trigger2 = p2dist y >= -50
trigger2 = stateno = 230 && movecontact
trigger2 = random <= (AILevel * 245)
trigger3 = stateno = 240
trigger3 = prevstateno != 200
trigger3 = random <= (AILevel * 245)
trigger3 = movehit
trigger4 = p2dist y >= -30
trigger4 = stateno = 400
trigger4 = (movecontact && time > 5)
trigger4 = prevstateno != 430
trigger4 = random <= (AILevel * 245)
trigger5 = p2dist y >= -30
trigger5 = stateno = 430
trigger5 = (movecontact && time > 5)
trigger5 = prevstateno != 430
trigger5 = random <= (AILevel * 245)
trigger6 = stateno = 440
trigger6 = prevstateno != 400
trigger6 = prevstateno != 430
trigger6 = random <= (AILevel * 245)
trigger6 = movehit

;Guard Cancel
[State -1, AI]
type = ChangeState
value = 1200+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = power >= 500 || var(38)
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 100
trigger1 = p2bodydist y < -50
trigger1 = p2bodydist y >= -90
trigger1 = stateno = 42050
trigger1 = time >= 1
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Guard Cancel
[State -1, AI]
type = ChangeState
value = 220+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 100
trigger1 = p2bodydist y >= -50
trigger1 = stateno = 42050
trigger1 = time >= 1
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Power Wave L (Guard Cancel Follow-up)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = stateno = 220 && movecontact
trigger1 = prevstateno = 42050
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 100
trigger1 = p2bodydist y >= -65

;Round Trip Wave (Guard Cancel Follow-up)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1620,1020)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = stateno = 250 && movecontact
trigger1 = prevstateno = 42050
trigger1 = time >= 50 
trigger1 = p2bodydist y >= -70
trigger1 = power < 1000 && !var(38)

;Hungry Hunter Buster Wolf / Buster Vacation
[State -1, AI]
type = ChangeState
value = 3300+((random%2)*400)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 213 || stateno = 232
trigger1 = movehit
trigger1 = random <= (AILevel * 210)

;Mountain Splitting Wave / Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = ifelse((power >= 2000 || var(38)),3400,214)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = power < 3000
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 213
trigger1 = movehit
trigger1 = random <= (AILevel * 210)

;Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
triggerall = numenemy
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = p2dist y >= -50
trigger1 = stateno = 213 || stateno = 223
trigger1 = movehit
trigger1 = random <= (AILevel * 210)
trigger2 = numtarget
trigger2 = stateno = 250
trigger2 = target, movetype = H
trigger2 = target, stateno = 2503 || target, stateno = 2504
trigger2 = random <= (AILevel * 220)
trigger2 = random <= (AILevel * 180)
trigger2 = power >= 3000 || var(38)
trigger3 = power >= 3000 || (power >= 2000 && var(38))
trigger3 = !var(38)
trigger3 = stateno = 1405
trigger3 = time >= 3
trigger3 = p2dist y >= -65
trigger3 = numtarget
trigger3 = target, stateno >= 5020 && target, stateno <= 5035
trigger4 = power >= 3000
trigger4 = stateno = 3101 || stateno = 3151
trigger4 = time >= 18
trigger4 = numtarget
trigger5 = power >= 3000
trigger5 = stateno = 3153
trigger5 = time >= 30
trigger5 = numtarget
trigger6 = stateno = 223
trigger6 = movehit
trigger6 = target, life <= 300
trigger6 = power >= 3000 || var(38)
trigger6 = p2dist y >= -60
trigger6 = enemynear, movetype = H
trigger7 = power >= 3000 || (power >= 2000 && var(38))
trigger7 = AILevel >= 5
trigger7 = p2dist x >= 150
trigger7 = p2dist x <= 300
trigger7 = p2dist y >= -50
trigger7 = enemynear, movetype = A
trigger7 = enemynear, time >= 3
trigger7 = random <= (AILevel * 392)
trigger7 = random <= (AILevel * 326) 
trigger7 = ctrl || stateno = 1 || stateno = 111
trigger7 = life <= 333
trigger7 = (enemynear, life <= (enemynear, lifemax*0.491) && (enemynear, life >= 1000)) || (enemynear, life <= 491 && (enemynear, life < 1000))

;Buster Vacation
[State -1, AI]
type = ChangeState
value = 3700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall =  AILevel = 5
triggerall = numenemy
trigger1 = frontedgedist <= 40
trigger1 = p2dist y >= -50
trigger1 = power >= 3000
trigger1 = stateno = 3101 || stateno = 3151 || stateno = 3153
trigger1 = time >= 14
trigger1 = numtarget
trigger2 = power >= 3000 || (power >= 2000 && var(38))
trigger2 = p2dist x < 150
trigger2 = p2dist y >= -50
trigger2 = enemynear, movetype = A
trigger2 = enemynear, time >= 3
trigger2 = random <= (AILevel * 190)
trigger2 = random <= (AILevel * 160) 
trigger2 = ctrl || stateno = 1 || stateno = 111
trigger2 = life <= 500
trigger3 = power >= 3000 || (power >= 2000 && var(38))
trigger3 = p2dist x < 150
trigger3 = p2dist y >= -50
trigger3 = enemynear, movetype = A
trigger3 = enemynear, time >= 3
trigger3 = random <= (AILevel * 392)
trigger3 = random <= (AILevel * 326) 
trigger3 = ctrl || stateno = 1 || stateno = 111
trigger3 = life <= 333
trigger3 = (enemynear, life <= (enemynear, lifemax*0.604) && (enemynear, life >= 1000)) || (enemynear, life <= 604 && (enemynear, life < 1000))

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = power >= 1000 || var(38)
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = enemynear, stateno != 5100
triggerall = enemynear, stateno != 5101
triggerall = enemynear, stateno != 5110
triggerall = !numhelper(3401)
trigger1 = numtarget
trigger1 = stateno = 250
trigger1 = target, movetype = H
trigger1 = target, stateno = 2503 || target, stateno = 2504
trigger1 = random <= (AILevel * 120)
trigger1 = random <= (AILevel * 110)
trigger1 = power >= 2000 || var(38)
trigger1 = power < 3000 || var(38)
trigger2 = p2dist x >= 145
trigger2 = p2dist x <= 185
trigger2 = time >= 14
trigger2 = time <= 20
trigger2 = stateno = 1000 || stateno = 1020
trigger2 = enemynear, pos y >= -15
trigger2 = enemynear, movetype = H
trigger2 = power < 3000 || var(38)
trigger3 = p2dist x >= 145
trigger3 = p2dist x <= 185
trigger3 = time >= 14
trigger3 = time <= 20
trigger3 = stateno = 1004 || stateno = 1026  
trigger3 = enemynear, pos y >= -15
trigger3 = enemynear, movetype = H
trigger3 = power < 3000 || var(38)
trigger4 = p2dist x >= 145
trigger4 = p2dist x <= 185
trigger4 = time >= 14
trigger4 = time <= 20
trigger4 = stateno = 1005 || stateno = 1027 
trigger4 = enemynear, pos y >= -15
trigger4 = enemynear, movetype = H
trigger4 = power < 3000 || var(38)

;Power Geyser
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = power >= 1000 || var(38)
triggerall = !numhelper(3006)
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = enemynear, stateno != 5100
triggerall = enemynear, stateno != 5101
triggerall = enemynear, stateno != 5110
trigger1 = p2dist x >= 20
trigger1 = p2dist x <= 90
trigger1 = stateno = 1000 || stateno = 1004 || stateno = 1005 || stateno = 1040 
trigger1 = time >= (ifelse(stateno = 1040,14,25))
trigger1 = time <= 25
trigger1 = enemynear, pos y >= -15
trigger1 = enemynear, movetype = H
trigger1 = power < 3000 || var(38)
trigger2 = enemynear, life <= 300 || power >= 2000 && power <= 2800
trigger2 = power >= 1000 || var(38)
trigger2 = AILevel >= 5
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 120
trigger2 = p2dist y >= -100
trigger2 = enemynear, movetype = A
trigger2 = enemynear, time >= 2
trigger2 = random <= (AILevel * 185)
trigger2 = random <= (AILevel * 160) 
trigger2 = ctrl || stateno = 1 || stateno = 111
trigger3 = life <= 333
trigger3 = enemynear, life <= 300 || power >= 1750 && power <= 2800
trigger3 = power >= 1000 || var(38)
trigger3 = AILevel >= 5
trigger3 = p2dist x >= 0
trigger3 = p2dist x <= 120
trigger3 = p2dist y >= -100
trigger3 = enemynear, movetype = A
trigger3 = enemynear, time >= 2
trigger3 = random <= (AILevel * 370)
trigger3 = random <= (AILevel * 320) 
trigger3 = ctrl || stateno = 1 || stateno = 111

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = power >= 1000 || var(38)
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = numtarget
trigger1 = stateno = 223
trigger1 = movehit
trigger1 = (power >= 1500 && power <= 2500) || var(38)
trigger1 = p2dist y >= -60
trigger1 = enemynear, movetype = H
trigger1 = target, life <= 450
trigger2 = enemynear, life <= 314 || power >= 2000 && power <= 2800
trigger2 = power >= 1000 || var(38)
trigger2 = AILevel >= 5
trigger2 = p2dist x > 120
trigger2 = p2dist y >= -55
trigger2 = enemynear, movetype = A
trigger2 = enemynear, time >= 2
trigger2 = random <= (AILevel * 185)
trigger2 = random <= (AILevel * 160) 
trigger2 = ctrl || stateno = 1 || stateno = 111
trigger2 = life <= 250

;Crackhead Armwrestling
[State -1, AI]
type = ChangeState
value = 3200
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 5
triggerall = power >= 2000 || power >= 1000 && var(38)
triggerall = power < 3000 || power >= 1000 && var(38)
triggerall = numenemy
trigger1 = (stateno = 1020 && time >= 20) || (p2dist x >= 190 && ctrl)
trigger1 = enemynear, movetype = H || enemynear, life <= 187
trigger1 = enemynear, life <= 430
trigger1 = random <= (AILevel * 125)
trigger1 = random <= (AILevel * 95) 

;Airdodge
[State -1, AI]
type = ChangeState
value = 710
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 2 && AILevel <= 6
triggerall = numenemy
trigger1 = ctrl
trigger1 = p2bodydist x >= 50
trigger1 = p2bodydist x <= 135
trigger1 = p2bodydist y >= -80
trigger1 = p2bodydist y <= 130
trigger1 = enemynear, movetype = A
trigger1 = enemynear, time <= 12
trigger1 = random <= (AILevel * 135)
trigger1 = random <= (AILevel * 110) 

;Charge Down
[State -1, AI]
type = ChangeState
value = 111
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel > 0 && AILevel <= 4
triggerall = numenemy
trigger1 = ctrl
trigger1 = stateno != 12
trigger1 = statetype = S
trigger1 = p2bodydist x > 45
trigger1 = p2dist x <= 110
trigger1 = random%1000 >= (AILevel * 165)
trigger1 = random%1000 >= (AILevel * 120)

;Roll or Laneswap
[State -1, AI]
type = ChangeState
value = 700+((random%2)*200)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = ctrl
trigger1 = p2bodydist x >= 75
trigger1 = enemynear, movetype = A
trigger1 = enemynear, time <= 12
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;Laneswap 
[State -1, AI]
type = ChangeState
value = 900+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = ctrl
trigger1 = p2bodydist x >= 75
trigger1 = enemynear, movetype = A
trigger1 = enemynear, time <= 14
trigger1 = random <= (AILevel * 130)
trigger1 = random <= (AILevel * 105) 

;Power Wave or Bongo Beam
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1620,1010+((random%2)*10))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = numtarget
trigger1 = stateno = 223
trigger1 = movehit
trigger1 = enemynear, movetype = H

;Bongo Beam
[State -1, AI]
type = ChangeState
value = 1620
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = power >= 1000 || var(38)
triggerall = numenemy
triggerall = numtarget
trigger1 = stateno = 223
trigger1 = movehit
trigger1 = power < 1500 && !var(38)
trigger1 = p2dist y >= -60
trigger1 = enemynear, movetype != H

;Chad Walk
[State -1, AI]
type = ChangeState
value = 196
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
triggerall = AILevel >= 5 || random <= (AILevel * 117)
triggerall = var(30) <= 0
trigger1 = p2dist x >= 95
trigger1 = p2dist y >= -55
trigger1 = ctrl
trigger1 = life >= (ifelse(AILevel = 4,1000,900))
trigger1 = random <= (AILevel * 133)
trigger1 = random <= (AILevel * 105)

;Get in there
[State -1, AI]
type = ChangeState
value = 100+((random%2)*600)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = ctrl
trigger1 = p2bodydist x > 250
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;Roll (for roll canceling)
[State -1, AI]
type = ChangeState
value = 700+((random%2)*5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4 || life <= 250
triggerall = AILevel >= 5 || random <= (AILevel * 76)
triggerall = numenemy
trigger1 = ctrl
trigger1 = p2bodydist x >= 75
trigger1 = p2bodydist x <= 250
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 193)
trigger1 = random <= (AILevel * 185) 
trigger2 = enemynear, movetype = A
trigger2 = ctrl
trigger2 = p2dist x >= 0
trigger2 = p2dist x < 75
trigger2 = p2dist y >= -50
trigger2 = random <= (AILevel * 113)
trigger2 = random <= (AILevel * 90) 
trigger3 = ctrl
trigger3 = p2dist x >= 0
trigger3 = p2dist x < 110
trigger3 = p2dist y <= -5
trigger3 = p2dist y >= -115
trigger3 = random <= (AILevel * 260)
trigger3 = random <= (AILevel * 210) 

;Roll Cancel Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = enemynear, movetype = A
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x < 75
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;Roll Cancel / Chad Walk Crack Shoot
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4 && AILevel <= 5
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x < 110
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -115
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 
trigger2 = stateno = 196
trigger2 = p2dist x >= 0
trigger2 = p2dist x < 110
trigger2 = p2bodydist y <= -5
trigger2 = p2bodydist y >= -115
trigger2 = random <= (AILevel * 260)
trigger2 = random <= (AILevel * 210) 

;Crack Shoot With no RC
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 2 || AILevel = 3
trigger1 = ctrl
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x < 110
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -115
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;Roll Cancel
[State -1, AI]
type = ChangeState
value = ifelse((var(46) != 5 && var(46) != 7 && var(46) != 11),var(47),(1210+((random%2)*110)))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = stateno = 700 || stateno = 705
trigger1 = time <= 3
trigger1 = p2bodydist x >= 75
trigger1 = p2bodydist x <= 250
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;Power Wave and other stuff too
[State -1, AI]
type = ChangeState
value = var(47)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = ctrl
trigger1 = p2bodydist x >= 85
trigger1 = p2bodydist x <= 250
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) 

;One More!
[State -1, AI]
type = ChangeState
value = 1016
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
trigger1 = p2bodydist y >= -65
trigger1 = p2bodydist x >= 175
trigger1 = stateno = 1010
trigger1 = time >= 20
trigger1 = time <= 50
trigger1 = power >= 2000
trigger1 = power < 3000
trigger1 = random <= (AILevel * 170)
trigger1 = random <= (AILevel * 198)

;Two More!
[State -1, AI]
type = ChangeState
value = 1017+((random%2)*10)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
trigger1 = p2bodydist y >= -65
trigger1 = p2bodydist x >= 175
trigger1 = stateno = 1016
trigger1 = time >= 20
trigger1 = time <= 55
trigger1 = power >= 1500
trigger1 = power < 3000
trigger1 = random <= (AILevel * 170)
trigger1 = random <= (AILevel * 198)

;Power Wave
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
trigger1 = p2bodydist y >= -65
trigger1 = stateno = 220 && movecontact
trigger1 = prevstateno = 42050
trigger1 = random <= (AILevel * 210)

;Rocky Mountain Splitting Wave (similar to the one in the Easy AI, with different conditions)
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 3
trigger1 = power >= 2000 || (power >= 1000 && var(38))
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 70
trigger1 = ctrl
trigger1 = random <= (AILevel * 165)
trigger1 = random <= (AILevel * 120)

;Rocky Mountain Splitting Wave (similar to the one in the Easy AI, with different conditions)
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype = C
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
trigger1 = power >= 2000 || (power >= 1000 && var(38))
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 70
trigger1 = ctrl
trigger1 = random <= (AILevel * 165)
trigger1 = random <= (AILevel * 120)

; Zooooooooooooooom Punch or Run Fwd
[State -1, AI]
type = ChangeState
value = ifelse(fvar(16) <= 2,100+((random%2)*123),100)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = stateno != 100
triggerall = fvar(22) < 8
trigger1 = power >= 3000 || (power >= 2000 && var(38))
trigger1 = p2dist x > 75
trigger1 = p2dist x <= 265
trigger1 = p2dist y >= -65
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)
trigger2 = power >= 2000
trigger2 = power < 2800
trigger2 = p2dist x > 75
trigger2 = p2dist x <= 275
trigger2 = p2dist y >= -65
trigger2 = ctrl
trigger2 = random <= (AILevel * 195)
trigger2 = random <= (AILevel * 175)

; Zooooooooooooooom Punch or Run Fwd
[State -1, AI]
type = ChangeState
value = 223
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
triggerall = stateno != 100
triggerall = fvar(22) >= 8
trigger1 = power >= 3000 || (power >= 2000 && var(38))
trigger1 = p2dist x > 75
trigger1 = p2dist x <= 265
trigger1 = p2dist y >= -65
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)
trigger2 = power >= 2000
trigger2 = power < 2800
trigger2 = p2dist x > 75
trigger2 = p2dist x <= 275
trigger2 = p2dist y >= -65
trigger2 = ctrl
trigger2 = random <= (AILevel * 195)
trigger2 = random <= (AILevel * 175)

;Portal Knuckal
[State -1, AI]
type = ChangeState
value = 1230+((random%2)*20)
triggerall = statetype = A
triggerall = numenemy
triggerall = enemynear, movetype != H
triggerall = enemynear, statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2dist x >= 70
trigger1 = p2bodydist y >= -70
trigger1 = stateno = 105
trigger1 = random <= (AILevel * 118)

;Backdash or Roll Forward
[State -1, AI]
type = ChangeState
value = ifelse(backedgedist <= 40,700,105)
triggerall = statetype != A
triggerall = numenemy
triggerall = enemynear, statetype = L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x >= -10
trigger1 = p2bodydist x <= 25
trigger1 = p2bodydist y >= -70
trigger1 = ctrl
trigger1 = random <= (AILevel * 118)

;Grounded Throw
[State -1, AI]
type = ChangeState
value = 800+((random%2)*30)
triggerall = fvar(14) <= 2
triggerall = statetype != A
triggerall = numenemy
triggerall = enemynear, movetype != H
triggerall = enemynear, statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = enemynear, stateno != 5120 || enemynear, prevstateno != 5120
trigger1 = fvar(14) <= 2
trigger1 = p2bodydist x >= -10
trigger1 = p2bodydist x <= 25 || p2bodydist x <= 5
trigger1 = p2bodydist y >= -70
trigger1 = ctrl
trigger1 = random <= (AILevel * 145)
trigger1 = random <= (AILevel * 180)

;Medium Kick
[State -1, AI]
type = ChangeState
value = 240
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x > 75
trigger1 = p2bodydist x <= 80
trigger1 = p2bodydist y < -45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 210+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist x <= 75
trigger1 = p2bodydist y < -45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Medium Kick
[State -1, AI]
type = ChangeState
value = 240+((random%2)*200)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x > 75
trigger1 = p2bodydist x <= 80
trigger1 = p2bodydist y >= -45
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 210+((random%2)*200)+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist x <= 75
trigger1 = p2bodydist y >= -45
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Light/Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*30)+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y < -45
trigger1 = p2bodydist y >= -75
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;Light/Medium Punch or Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*200)+((random%2)*30)+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
triggerall = (enemynear, stateno != 2502 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2503 && enemynear, movetype != H)
triggerall = (enemynear, stateno != 2504 && enemynear, movetype != H)
trigger1 = p2bodydist x >= 0
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -45
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)


;Jump not CD Not FSmash
[State -1, AI]
type = ChangeState
value = 660
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = vel x > 0
trigger1 = p2dist x <= 100
trigger1 = p2dist y >= -40
trigger1 = p2dist y <= 10
trigger1 = vel y < -1.5 || pos y <= -90
trigger1 = random <= (AILevel * 245)
trigger1 = ctrl

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = ctrl
trigger1 = numtarget
trigger1 = target, stateno = 11063
trigger1 = random <= (AILevel * 332)
trigger1 = p2dist x >= 30
trigger1 = p2dist x <= 180
trigger1 = p2dist y >= -105

;Rising Tacos
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = ctrl
trigger1 = numtarget
trigger1 = target, stateno = 11063
trigger1 = random <= (AILevel * 332)
trigger1 = p2dist x >= -30
trigger1 = p2dist x <= 55
trigger1 = p2dist y >= -105

;Bucket Head
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
triggerall = var(12) = 0
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = p2dist x >= -15
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -20
trigger1 = p2dist y >= -95

;Riser Kick
[State -1, AI]
type = ChangeState
value = 1104
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
triggerall = var(12) != 0
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = target, vel x > 0
trigger1 = p2dist x >= -45
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -10
trigger1 = p2dist y >= -100


;---------------------------------------------------------------------------
;VAIS LP Combo Branch (No contact)

;Roll backwards or CLK
[State -1, AI]
type = ChangeState
value = 430+((random%2)*275)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x <= 45
trigger1 = stateno = 200 && !movecontact
trigger1 = time >= 13
trigger1 = random <= (AILevel * 245)

;CMK or Roll Forward
[State -1, AI]
type = ChangeState
value = 440+((random%2)*260)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x > 45
trigger1 = stateno = 200 && !movecontact
trigger1 = time >= 13
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS LP Combo Branch 0

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = prevstateno != 440
trigger1 = stateno = 210 && movecontact
trigger1 = time >= 11
trigger1 = random <= (AILevel * 245)

;MP2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = power < 1500
trigger1 = stateno = 211 && movecontact
trigger1 = time >= 16
trigger1 = random <= (AILevel * 245)

;MP2 as usual or Power Mortar / Limewire Go Bang
[State -1, AI]
type = ChangeState
value = 212+((random%2)*2788)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = power >= 1500 || var(38)
trigger1 = stateno = 211 && movecontact
trigger1 = time >= 16
trigger1 = random <= (AILevel * 245)

;Power Dunk / Come on and Slam!
[State -1, AI]
type = ChangeState
value = 1400+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = stateno = 212 && movecontact
trigger1 = random <= (AILevel * 245)


;---------------------------------------------------------------------------
;VAIS LP Combo Branch 1

;Too high for the standard VAIS Followup
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
trigger1 = p2dist y < -45
trigger1 = stateno = 200 && movecontact
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)

;HP
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
trigger1 = p2dist y >= -45
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = random <= (AILevel * 245)

;Kick Butt!
[State -1, AI]
type = ChangeState
value = 1310
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
trigger1 = p2dist y < -45
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
triggerall = !numhelper(1002)
trigger1 = stateno = 220 && movecontact
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)

;See State 1 for the last hit

;Bongo Beam(for level 3)
[State -1, AI]
type = ChangeState
value = 1620
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 3
triggerall = var(42) = 1
trigger1 = stateno = 223 && movecontact
trigger1 = random <= (AILevel * 209)

;Come on and Slam! (for levels 4 and 5)
[State -1, AI]
type = ChangeState
value = 1410
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
triggerall = var(42) = 1
trigger1 = stateno = 223 && movecontact
trigger1 = random <= (AILevel * 209)

;Power Wave H
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1020)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
triggerall = numhelper(1002)
trigger1 = stateno = 220 && movecontact
trigger1 = time >= 1
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS LP Combo Branch 2

;HP
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 2
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = random <= (AILevel * 245)

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 2
trigger1 = stateno = 220 && movecontact
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS LP Combo Branch 3 / 4

;MP1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 3 || var(42) = 4
trigger1 = stateno = 210 && movehit
trigger1 = random <= (AILevel * 245)

;Power Mortar / Limewire Go Bang!
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 3 || var(42) = 4
trigger1 = stateno = 211 && movehit
trigger1 = power >= 1000 || var(38)
trigger1 = power < 3000
trigger1 = p2dist x >= -35
trigger1 = p2dist x <= 55
trigger1 = time >= 11
trigger1 = random <= (AILevel * 210)

;Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 3 || var(42) = 4
trigger1 = power >= 3000 || var(38) && power >= 2000
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 211
trigger1 = time >= 11
trigger1 = movehit
trigger1 = random <= (AILevel * 210)

;MP2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 3 || var(42) = 4
trigger1 = stateno = 211 && movehit
trigger1 = !var(38)
trigger1 = power < 1000
trigger1 = p2dist x >= -35
trigger1 = p2dist x <= 55
trigger1 = time >= 11
trigger1 = random <= (AILevel * 210)

;Come on and Slam!
[State -1, AI]
type = ChangeState
value = 1410
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 3 || var(42) = 4
trigger1 = stateno = 212 && movehit
trigger1 = random <= (AILevel * 210)


;---------------------------------------------------------------------------
;VAIS LK Combo Branch (No contact)

;Roll backwards or CLK
[State -1, AI]
type = ChangeState
value = 430+((random%2)*275)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x <= 35
trigger1 = stateno = 230 && !movecontact
trigger1 = time >= 11
trigger1 = random <= (AILevel * 245)

;CMK or Roll Forward
[State -1, AI]
type = ChangeState
value = 440+((random%2)*260)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x > 35
trigger1 = stateno = 230 && !movecontact
trigger1 = time >= 11
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS LK Combo Branches

;LK1
[State -1, AI]
type = ChangeState
value = 231
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = stateno = 230 && movecontact
trigger1 = random <= (AILevel * 245)

;Power Bonk
[State -1, AI]
type = ChangeState
value = 1300+((random%3)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = stateno = 231 && movehit
trigger1 = p2dist y <= -30
trigger1 = random <= (AILevel * 245)

;Power Wave L
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = enemynear, statetype != C
trigger1 = stateno = 231 && moveguarded
trigger1 = random <= (AILevel * 245)

;Rocky Mountain Splitting Wave or Crack Shoot 
[State -1, AI]
type = ChangeState
value = 214+((random%2)*1086)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = life > 500
trigger1 = enemynear, statetype = C
trigger1 = stateno = 231 && moveguarded
trigger1 = random <= (AILevel * 245)

;Crack Shoot or Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = numenemy
trigger1 = life <= 500
trigger1 = enemynear, statetype = C
trigger1 = stateno = 231 && moveguarded
trigger1 = random <= (AILevel * 245)

;Hey, Go Burn!
[State -1, AI]
type = ChangeState
value = 451
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0 || var(42) = 1
trigger1 = stateno = 231 && movecontact
trigger1 = p2dist y > -30
trigger1 = random <= (AILevel * 245)

;Rocket Charge
[State -1, AI]
type = ChangeState
value = 1500
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = stateno = 452 && movecontact
trigger1 = random <= (AILevel * 245)

;Come on and Slam!
[State -1, AI]
type = ChangeState
value = 1410
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1
trigger1 = stateno = 452 && movecontact
trigger1 = p2dist y <= -50
trigger1 = random <= (AILevel * 245)

;LK2
[State -1, AI]
type = ChangeState
value = 232
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 2
trigger1 = stateno = 231 && movecontact
trigger1 = p2dist y > -30
trigger1 = random <= (AILevel * 245)

;Rocket Charge
[State -1, AI]
type = ChangeState
value = 1500
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 2
trigger1 = stateno = 232 && movecontact
trigger1 = random <= (AILevel * 245)

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 2
triggerall = !numhelper(3401)
trigger1 = power >= 1000 || var(38)
trigger1 = stateno = 1502 && movecontact || stateno = 15030
trigger1 = time >= 9
trigger1 = time < 12
trigger1 = numenemy
trigger1 = enemynear, statetype = A
trigger1 = random <= (AILevel * 210)

;Portal Knuckal
[State -1, AI]
type = ChangeState
value = 1250
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 2
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 1502 && movecontact || stateno = 15030
trigger1 = time >= 20
trigger1 = numenemy
trigger1 = enemynear, statetype = A
trigger1 = random <= (AILevel * 210)

;---------------------------------------------------------------------------
;VAIS CLP/K Combo Branch (No contact)

;Roll
[State -1, AI]
type = ChangeState
value = 700+((random%2)*5)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = p2bodydist x <= 45
trigger1 = stateno = 400 || stateno = 430 
trigger1 = !movecontact
trigger1 = time >= 14
trigger1 = random <= (AILevel * 245)

;CMK or Roll Forward
[State -1, AI]
type = ChangeState
value = 440+((random%2)*260)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = p2bodydist x > 45
trigger1 = stateno = 400 || stateno = 430 
trigger1 = !movecontact
trigger1 = time >= 14
trigger1 = random <= (AILevel * 245)


;---------------------------------------------------------------------------
;VAIS CLP Combo Branch 2
; CLP borrows mostly from CLK's branches, but since branch 2 doesn't feature CLP, this branch uses an entirely new combo.

;Power Charge or smaktebord
[State -1, AI]
type = ChangeState
value = 1510+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) = 2
trigger1 = stateno = 440 && movehit
trigger1 = random <= (AILevel * 245)

;Rocky Mountain Splitting Wave or Crack Shoot 
[State -1, AI]
type = ChangeState
value = 214+((random%2)*1086)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = life > 750
trigger1 = stateno = 440 && moveguarded
trigger1 = prevstateno = 400
trigger1 = random <= (AILevel * 245)

;Crack Shoot or Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = life <= 750
trigger1 = stateno = 440 && moveguarded
trigger1 = prevstateno = 400
trigger1 = random <= (AILevel * 245)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) = 2
trigger1 = prevstateno = 440
trigger1 = stateno = 1510 && movehit
trigger1 = random <= (AILevel * 245)

[State 0, Null]
type = Null
triggerall = stateno = 1520 && time = 1
triggerall = AILevel >= 3
trigger1 = 1 || var(52) := random%3
ignorehitpause = 1

[State 0, Null]
Type = Null
triggerall = stateno = 1520 && time = 1
triggerall = AILevel >= 3
trigger1 = var(52) <= 0
trigger1 = 1 || var(43) := 1400
trigger2 = !numhelper(1511)
trigger2 = var(52) = 1
trigger2 = 1 || var(43) := 1300+((random%3)*10)
trigger3 = numhelper(1511)
trigger3 = var(52) = 1
trigger3 = 1 || var(43) := 1300+((random%2)*20)
trigger4 = var(52) >= 2
trigger4 = 1 || var(43) := 1100+((random%2)*20)
ignorehitpause = 1

;A lotta stuff - Uses a mini VAIS to decide what to do next
[State -1, AI]
type = ChangeState
value = var(43)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) = 2
trigger1 = prevstateno = 440 || numhelper(1511)
trigger1 = stateno = 1520 && movehit
trigger1 = time >= 20
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS CLK Combo Branch 0/2/3 (They have the same leadup, but branch at CHP.)

;Rocky Mountain Splitting Wave or Crack Shoot 
[State -1, AI]
type = ChangeState
value = 214+((random%2)*1086)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 2
trigger1 = life > 800
trigger1 = stateno = 430 || stateno = 400
trigger1 = moveguarded
trigger1 = prevstateno = 430
trigger1 = random <= (AILevel * 245)

;Crack shoot or Bongo Buckshoot 
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
trigger1 = life > 500
trigger1 = life <= 800
trigger1 = stateno = 430 || stateno = 400
trigger1 = moveguarded
trigger1 = prevstateno = 430
trigger1 = random <= (AILevel * 245)

;CMK or Bongo Buckshoot 
[State -1, AI]
type = ChangeState
value = 440+((random%2)*1160)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = life <= 500
trigger1 = stateno = 430 || stateno = 400
trigger1 = moveguarded
trigger1 = prevstateno = 430
trigger1 = random <= (AILevel * 245)

;CLP
[State -1, AI]
type = ChangeState
value = 400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) = 1 || var(42) = 3
trigger1 = prevstateno = 430
trigger1 = stateno = 430 && movecontact
trigger1 = p2bodydist y >= -45
trigger1 = random <= (AILevel * 210)

;CMP
[State -1, AI]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) <= 0 || var(42) = 1 || var(42) = 3
trigger1 = stateno = 400 && movecontact
trigger1 = prevstateno = 430
trigger1 = random <= (AILevel * 245)

;Bonk or Bongo Buckshoot 
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*300)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = life >= 500
trigger1 = stateno = 410
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;Bonk or Bongo Buckshoot 
[State -1, AI]
type = ChangeState
value = 1300
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
trigger1 = life < 500
trigger1 = stateno = 410
trigger1 = moveguarded
trigger1 = random <= (AILevel * 245)

;CHP
[State -1, AI]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3
triggerall = var(42) <= 0 || var(42) = 1 || var(42) = 3
trigger1 = prevstateno != 440
trigger1 = stateno = 410 && movehit
trigger1 = random <= (AILevel * 245)

;Bonk
[State -1, AI]
type = ChangeState
value = 1300
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = var(42) <= 0 || var(42) = 1 || var(42) = 3
trigger1 = prevstateno = 410
trigger1 = stateno = 420 && movehit
trigger1 = random <= (AILevel * 245)


;---------------------------------------------------------------------------
;HK Follow-up

;Round-Trip Wave or Bongo Beam
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1620,1020)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = power < 1000
trigger1 = target, stateno = 2500 || target, stateno = 2501 || target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = p2dist x >= 140
trigger1 = stateno = 250 && movehit
trigger1 = time >= 49

;Power Charge
[State -1, AI]
type = ChangeState
value = 1500+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = power < 1000
trigger1 = target, stateno = 2500 || target, stateno = 2501 || target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = p2dist x < 140
trigger1 = stateno = 250 && movehit
trigger1 = time >= 49

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = !fvar(27) || fvar(27) && var(38) || power >= 4000 || var(38)
trigger1 = power < 3000 || var(38)
trigger1 = power >= 1000 || var(38)
trigger1 = target, stateno = 2500 || target, stateno = 2501 || target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = stateno = 250 && movehit
trigger1 = time >= 49

;Hungry Hunter Buster Wolf
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = power >= 3000
trigger1 = target, stateno = 2500 || target, stateno = 2501 || target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = p2dist x >= 140
trigger1 = stateno = 250 && movehit
trigger1 = time >= 49

;Buster Vacation
[State -1, AI]
type = ChangeState
value = 3700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 6
triggerall = numtarget
trigger1 = power >= 3000
trigger1 = target, stateno = 2500 || target, stateno = 2501 || target, stateno = 2502 || target, stateno = 2503 || target, stateno = 2504
trigger1 = p2dist x < 140
trigger1 = stateno = 250 && movehit
trigger1 = time >= 49
trigger1 = random <= (AILevel * 245)

;----------------------------------------------------
;Sub branch (0)

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = stateno = 420
trigger1 = time >= 20
trigger1 = movehit
ctrl = 1

;Light kick or Not CD
[State -1, AI]
type = ChangeState
value = 630+((random%2)*30)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x < 45
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;Not CD
[State -1, AI]
type = ChangeState
value = 660
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = vel x > 0
trigger1 = p2dist x >= 45
trigger1 = p2dist x <= 90
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;MP
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = stateno = 600 || stateno = 630
trigger1 = pos y <= -35
trigger1 = pos y >= -65
trigger1 = movecontact
trigger1 = random <= (AILevel * 245)

;HP
[State -1, AI]
type = ChangeState
value = 620
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = stateno = 610 || stateno = 640
trigger1 = p2bodydist y <= 30
trigger1 = p2bodydist y >= -60
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = statetype = A
trigger1 = stateno = 620
trigger1 = movehit
trigger1 = random <= (AILevel * 344)
trigger2 = statetype = A
trigger2 = stateno = 600 || stateno = 630
trigger2 = pos y > -35
trigger2 = movecontact
trigger2 = random <= (AILevel * 245)
trigger3 = stateno = 661
trigger3 = numtarget
trigger3 = target, stateno = 11063
trigger3 = random <= (AILevel * 332)
trigger3 = p2dist x <= 180
trigger3 = p2dist y >= -125

;----------------------------------------------------
;Sub branch (1)

;Gamers rise up
[State -1, AI]
type = ChangeState
value = 1120+floor(fvar(1))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 1 ;This also coincides with the CMK branch
trigger1 = stateno = 420 && movecontact
trigger1 = time >= 14
trigger1 = random <= (AILevel * 210)


;----------------------------------------------------
;Sub branch (2 and 3, and branching off to 4 if only one CLK was used before Rising Taco)

;Gamers Rise Up
[State -1, AI]
type = ChangeState
value = 1120+floor(fvar(1))
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 2
trigger1 = stateno = 430 && movehit
trigger1 = prevstateno = 430
trigger1 = p2dist x >= -40
trigger1 = p2dist x <= 90

;Rising Taco
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = stateno = 430 && movehit
trigger1 = prevstateno = 430
trigger1 = p2dist x >= -40
trigger1 = p2dist x <= 90

;Bucket Head
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) >= 2 && var(42) <= 4
triggerall = var(12) = 0
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = p2dist x >= 30
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -30
trigger1 = p2dist y >= -100

;Portal Kombat
[State -1, AI]
type = ChangeState
value = 1250
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = stateno = 500 || stateno = 1106
trigger1 = numtarget
trigger1 = target, vel y >= 0
trigger1 = p2dist y >= -60
trigger1 = p2dist y <= 50
trigger1 = target, stateno = 11063

;Terrance then uses Rising Taco again when landing from Bucket Head.
;See State 501 (The custom fall state from various air specials)

;Riser Kick
[State -1, AI]
type = ChangeState
value = 1104
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 3
triggerall = var(42) >= 2 && var(42) <= 4
triggerall = var(12) != 0
trigger1 = numtarget
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = target, vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -30
trigger1 = p2dist y >= -100
trigger2 = stateno = 11070
trigger2 = time >= 25
trigger2 = time <= 40
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 175
trigger2 = p2dist y <= 45
trigger2 = p2dist y >= -50

;Riser Kick
[State -1, AI]
type = ChangeState
value = 1104
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 4
triggerall = var(12) != 0
trigger1 = numtarget
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = target, vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -30
trigger1 = p2dist y >= -100
trigger2 = stateno = 11070
trigger2 = time >= 26
trigger2 = time <= 40
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 175
trigger2 = p2dist y <= 45
trigger2 = p2dist y >= -50

;Riser Kick
[State -1, AI]
type = ChangeState
value = ifelse(var(37) <= 1,1107,1104)
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4 && AILevel <= 5
triggerall = var(42) = 2 || var(42) = 3
triggerall = var(12) != 0
triggerall = numtarget
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = target, vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= -30
trigger1 = p2dist y >= -100
trigger2 = stateno = 11070
trigger2 = time >= 26
trigger2 = time <= 40
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 175
trigger2 = p2dist y <= 45
trigger2 = p2dist y >= -50

;---------------------------------------------------------------------------
;VAIS CLK Combo Branch 3

;Rising Taco
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
triggerall = numtarget
trigger1 = stateno = 420 && movehit
trigger1 = time >= 14
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 110
trigger1 = target, pos y >= -50

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
triggerall = numtarget
trigger1 = stateno = 420
trigger1 = time >= 20
trigger1 = movehit
trigger1 = target, pos y <= -50
ctrl = 1

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
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
trigger1 = vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 90
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;AMP
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
trigger1 = stateno = 600 || stateno = 630
trigger1 = pos y <= -35
trigger1 = pos y >= -65
trigger1 = movecontact
trigger1 = random <= (AILevel * 245)

;AHP
[State -1, AI]
type = ChangeState
value = 620
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
trigger1 = stateno = 610
trigger1 = p2bodydist y <= 30
trigger1 = p2bodydist y >= -60
trigger1 = movehit
trigger1 = random <= (AILevel * 245)

;Rising Taco
[State -1, AI]
type = ChangeState
value = 1100
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
triggerall = var(42) = 3
trigger1 = statetype = A
trigger1 = stateno = 620
trigger1 = movehit
trigger1 = random <= (AILevel * 344)
trigger2 = statetype = A
trigger2 = stateno = 600 || stateno = 630
trigger2 = pos y > -35
trigger2 = movecontact
trigger2 = random <= (AILevel * 245)

;Power Mortar / Limewire Go Bang!
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
trigger1 = power >= 2000 || (power >= 1000 && var(38))
trigger1 = power < 3000
trigger1 = p2dist x >= -35
trigger1 = p2dist x <= 55
trigger1 = stateno = 1105 && numtarget
trigger1 = time >= 32

;---------------------------------------------------------------------------
;Boneless Power Charge Combo

;Dashing Light Punch Follow-up
[State -1, AI]
type = ChangeState
value = 204
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
trigger1 = stateno = 203
trigger1 = movehit

;Boneless Power Charge
[State -1, AI]
type = ChangeState
value = 205
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
trigger1 = stateno = 204
trigger1 = movehit

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = power >= 1000 || var(38)
triggerall = AILevel >= 1
triggerall = numtarget
triggerall = !numhelper(3401)
trigger1 = stateno = 205
trigger1 = time >= 13
trigger1 = movehit
trigger1 = random <= (AILevel * 120)

;---------------------------------------------------------------------------
;VAIS MK Combo

;HP
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = var(42) = 4
trigger1 = stateno = 240 && movecontact
trigger1 = random <= (AILevel * 245)

;Power Wave
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
trigger1 = stateno = 220 && movecontact
trigger1 = prevstateno = 240
trigger1 = random <= (AILevel * 245)

;One More! H
[State -1, AI]
type = ChangeState
value = 1026
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = numenemy
triggerall = var(42) != 7
trigger1 = numhelper(1002)
trigger1 = helper(1002), stateno = 1002
trigger1 = stateno = 1000
trigger1 = prevstateno = 220
trigger1 = frontedgedist >= 60
trigger1 = power >= 500
trigger1 = time >= 20
trigger1 = time <= 23
trigger1 = enemynear, movetype = H
trigger1 = random <= (AILevel * 245)

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 6
triggerall = numenemy
triggerall = !numhelper(3401)
trigger1 = stateno = 1026
trigger1 = animtime = 0
trigger1 = enemynear, pos y >= -95
trigger1 = enemynear, vel y >= 0
trigger1 = power >= 1000
trigger1 = enemynear, movetype = H
trigger1 = random <= (AILevel * 222)
trigger1 = random <= (AILevel * 168)


;---------------------------------------------------------------------------
;VAIS CMK Combo Branch (No contact)

;Roll Backward
[State -1, AI]
type = ChangeState
value = 705
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x <= 45
trigger1 = stateno = 440 && !movecontact
trigger1 = time >= 26
trigger1 = random <= (AILevel * 245)

;Roll
[State -1, AI]
type = ChangeState
value = 700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = p2bodydist x > 45
trigger1 = stateno = 440 && !movecontact
trigger1 = time >= 26
trigger1 = random <= (AILevel * 245)

;---------------------------------------------------------------------------
;VAIS CMK Combo Branches
; All of my combos off CMK tend to lead to MP or CMP, so the first few controllers will have a lot of different var(42) mentions in them.

;Crack Sharpshooter
[State -1, AI]
type = ChangeState
value = 1320
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) <= 0
trigger1 = prevstateno = 440
trigger1 = stateno = 210 && movehit
trigger1 = random <= (AILevel * 245)

;MP Auto Combo 1
[State -1, AI]
type = ChangeState
value = 211
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 2 || var(42) = 3 || var(42) = 5 || var(42) = 6 || var(42) = 7 || var(42) = 9 || var(42) = 10
trigger1 = prevstateno = 440
trigger1 = stateno = 210 && movehit
trigger1 = time >= 8
trigger1 = random <= (AILevel * 245)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4 && AILevel <= 5
trigger1 = prevstateno = 0
trigger1 = stateno = 210 && movehit
trigger1 = time >= 8
trigger1 = random <= (AILevel * 245)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 4 && AILevel <= 5
trigger1 = prevstateno = 210
trigger1 = stateno = 1510 && movehit
trigger1 = random <= (AILevel * 245)

;CHP
[State -1, AI]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 1 || var(42) = 4 || var(42) = 8
trigger1 = prevstateno = 440
trigger1 = stateno = 410 && movehit
trigger1 = random <= (AILevel * 245)

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = prevstateno = 410
trigger1 = stateno = 420 && movehit
trigger1 = time >= 20
trigger1 = random <= (AILevel * 344)
ctrl = 1

;Rocky Mountain Splitting Wave
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 2
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 245)

;Rocket Charge
[State -1, AI]
type = ChangeState
value = 1500
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 3
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 245)

;Rocky Mountain Splitting wave
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 2 && AILevel <= 5
trigger1 = stateno = 211 && movehit
trigger1 = enemynear, life <= (118 * fvar(19))
trigger1 = random <= (AILevel * 245)

;Portal Knuckal
[State -1, AI]
type = ChangeState
value = 1250
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
trigger1 = var(42) = 3
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 1502 && movecontact || stateno = 15030
trigger1 = time >= 20
trigger1 = numenemy
trigger1 = enemynear, statetype = A
trigger1 = random <= (AILevel * 210)

;Air Light Kick
[State -1, AI]
type = ChangeState
value = 630
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 90
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;MP
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = stateno = 600 || stateno = 630
trigger1 = movecontact

;HP
[State -1, AI]
type = ChangeState
value = 620
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = stateno = 610 || stateno = 640
trigger1 = p2bodydist y <= 30
trigger1 = p2bodydist y >= -60
trigger1 = movehit

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 4
trigger1 = stateno = 620
trigger1 = movehit
trigger1 = random <= (AILevel * 344)

;MP Auto Combo 2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 5
trigger1 = stateno = 211 && movehit
trigger1 = time >= 16
trigger1 = random <= (AILevel * 245)

;MP Auto Combo 2
[State -1, AI]
type = ChangeState
value = 212
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 5
trigger1 = stateno = 211 && movehit
trigger1 = time >= 16
trigger1 = random <= (AILevel * 245)

;Blazing Blade
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
trigger1 = var(42) = 5
trigger1 = stateno = 212 && movehit
trigger1 = random <= (AILevel * 210)
trigger2 = var(42) = 7
trigger2 = numhelper(1002) || frontedgedist < 85
trigger2 = stateno = 211 && movehit
trigger2 = random <= (AILevel * 210)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 6
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 210)

;Rising Taco
[State -1, AI]
type = ChangeState
value = 1100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 6
trigger1 = stateno = 1510 && movehit
trigger1 = time >= 43
trigger1 = p2dist x > -20
trigger1 = p2dist x <= 90
trigger1 = p2dist y >= -80
trigger1 = random <= (AILevel * 210)

;Bucket Head
[State -1, AI]
type = ChangeState
value = 1106
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 6
triggerall = var(12) = 0
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = numtarget
trigger1 = p2dist x >= -15
trigger1 = p2dist x <= 80
trigger1 = p2dist y <= 0
trigger1 = p2dist y >= -50

;Riser Kick
[State -1, AI]
type = ChangeState
value = ifelse(var(37) <= 1,1107,1104)
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 6
triggerall = var(12) != 0
triggerall = numtarget
trigger1 = stateno = 1100
trigger1 = time >= 23
trigger1 = time < 32
trigger1 = target, vel x > 0
trigger1 = p2dist x >= 35
trigger1 = p2dist x <= 60
trigger1 = p2dist y <= -30
trigger1 = p2dist y >= -100
trigger2 = stateno = 11070
trigger2 = time >= 26
trigger2 = time <= 40
trigger2 = p2dist x >= 0
trigger2 = p2dist x <= 175
trigger2 = p2dist y <= 55
trigger2 = p2dist y >= -50

;Power Wave
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
trigger1 = frontedgedist >= 85
trigger1 = !numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 210)

;One More!
[State -1, AI]
type = ChangeState
value = 1026
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
triggerall = power >= 500 || var(38)
trigger1 = stateno = 1000
trigger1 = numtarget
trigger1 = frontedgedist >= 60
trigger1 = time >= 20
trigger1 = random <= (AILevel * 210)

;Light Punch
[State -1, AI]
type = ChangeState
value = 200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
trigger1 = numtarget
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -45
trigger1 = ctrl || stateno = 1
trigger1 = random <= (AILevel * 210)

;Light Punch Auto Combo 1
[State -1, AI]
type = ChangeState
value = 201
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
trigger1 = stateno = 200 && movehit
trigger1 = random <= (AILevel * 210)

;Power Mortar/Limewire Go Bang
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
triggerall = power >= 2250 || (power >= 1250 && var(38))
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = random <= (AILevel * 210)

;Power Dunk L
[State -1, AI]
type = ChangeState
value = ifelse(random%2,1400,(ifelse(numhelper(1001),1040,1000)))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = p2bodydist x <= 60
trigger1 = random <= (AILevel * 210)

;Power Wave (At this point the projectile from Round Trip Wave should still be around, so this should always be Gutsman's Ass)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 7
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = p2bodydist x > 60
trigger1 = random <= (AILevel * 210)

;Crack Shoot
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 8
trigger1 = numhelper(1002)
trigger1 = stateno = 420 && movehit
trigger1 = random <= (AILevel * 210)
trigger2 = frontedgedist < 65 
trigger2 = stateno = 420 && movehit
trigger2 = random <= (AILevel * 210)

;Power Wave H
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1300+((random%2)*10),1020)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 8
triggerall = !numhelper(1002)
trigger1 = frontedgedist >= 65 
trigger1 = stateno = 420 && movehit
trigger1 = random <= (AILevel * 210)

;Power Wave
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = var(42) = 9
trigger1 = !numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 210)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = var(42) = 9
triggerall = !numexplod(2131000) 
trigger1 = stateno = 1
trigger1 = prevstateno = 1000
trigger1 = time >= 2
trigger1 = random <= (AILevel * 245)

;The Ghost of Christmas Bogard
[State -1, AI]
type = ChangeState
value = 1200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = var(42) = 9
trigger1 = numhelper(1002)
trigger1 = stateno = 211 && movehit
trigger1 = random <= (AILevel * 210)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
triggerall = var(42) = 8
trigger1 = stateno = 1
trigger1 = time >= 2
trigger1 = random <= (AILevel * 210)

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = var(42) = 3 || var(42) = 9
trigger1 = stateno = 1510 && movehit
trigger1 = random <= (AILevel * 210)

;Buster Wolf
[State -1, AI]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1
triggerall = var(42) = 7 || var(42) = 9
triggerall = power >= 1000 || var(38)
triggerall = !numhelper(3401)
trigger1 = power >= 1000
trigger1 = power < 3000
trigger1 = !var(38)
trigger1 = stateno = 1405
trigger1 = time >= 3
trigger1 = p2dist y >= -65
trigger1 = target, stateno >= 5020 && target, stateno <= 5035
trigger2 = power >= 3000
trigger2 = var(38)
trigger2 = stateno = 1405
trigger2 = time >= 3
trigger2 = p2dist y >= -65
trigger2 = target, stateno >= 5020 && target, stateno <= 5035

;Power Wave (after Zooooooooooooooom Punch)
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1620,1000+((random%3)*10)+((random%2)*200))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
trigger1 = stateno = 223
trigger1 = movecontact
trigger1 = p2dist y >= -50
trigger1 = anim >= 2232

;Bongo Buckshot
[State -1, AI]
type = ChangeState
value = 1600+((random%2)*10)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 4 || AILevel = 5
trigger1 = stateno = 223
trigger1 = moveguarded
trigger1 = p2dist y >= -50
trigger1 = p2dist x <= 70
trigger2 = stateno = 201
trigger2 = time >= 8
trigger2 = moveguarded
trigger2 = random <= (AILevel * 240)
trigger2 = random <= (AILevel * 190)

;Power Charge or Kick Butt
[State -1, AI]
type = ChangeState
value = 1310+((random%2)*200)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 5
trigger1 = stateno = 223
trigger1 = movehit
trigger1 = p2dist y >= -50
trigger1 = anim < 2232

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 3 && AILevel <= 5
trigger1 = stateno = 1510
trigger1 = prevstateno = 223
trigger1 = movehit
trigger1 = p2dist y >= -50
trigger1 = anim < 2232

;---------------------------------------------------------------------------
;Easy AI (1-2)
 ;Nothing fancy. Just most of the special moves done raw, some quick normals that lead to simple low damage combos, and a pinch of super moves.

;Are you okay?
[State -1, AI]
type = ChangeState
value = 3800
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 3
triggerall = power >= 2000 || (power >= 1000 && var(38))
triggerall = numenemy
trigger1 = enemynear, life <= ((enemynear, lifemax) - 200)
trigger1 = p2bodydist y >= -55
trigger1 = enemynear, movetype = A || (enemynear, vel x != 0 && vel y >= 0)
trigger1 = ctrl
trigger1 = random <= (AILevel * 250)

;Buster Wolf
[State -1, Buster Wolf]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
triggerall = power >= 1000 || var(38)
triggerall = !numhelper(3401)
trigger1 = numtarget
trigger1 = target, life >= 500
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = p2bodydist y >= -65
trigger1 = random <= (AILevel * 210)

;Power Wave and other stuff too
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000+((random%3)*10)+((random%2)*200))
triggerall = numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel <= 2
trigger1 = ctrl
trigger1 = p2bodydist x >= 95
trigger1 = p2bodydist x <= 220
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) || (AILevel = 1 && numhelper(1001))

;Power Wave and other stuff too
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000+((random%3)*10)+((random%3)*200))
triggerall = !numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1
trigger1 = ctrl
trigger1 = p2bodydist x >= 95
trigger1 = p2bodydist x <= 220
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) || (AILevel = 1 && numhelper(1001))

;Power Wave and other stuff too
[State -1, AI]
type = ChangeState
value = ifelse(numhelper(1001),1040,1000+((random%3)*10)+((random%4)*200))
triggerall = !numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 2
trigger1 = ctrl
trigger1 = p2bodydist x >= 95
trigger1 = p2bodydist x <= 220
trigger1 = p2bodydist y >= -50
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210) || (AILevel = 1 && numhelper(1001))

;Rocky Mountain Splitting Wave
[State -1, AI]
type = ChangeState
value = 214
triggerall = statetype != A
triggerall = p2statetype = S
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = power >= 2000 || (power >= 1000 && var(38))
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 75
trigger1 = ctrl
trigger1 = random <= (AILevel * 185)
trigger1 = random <= (AILevel * 200)
trigger2 = p2bodydist x <= 75
trigger2 = ctrl
trigger2 = random <= (AILevel * 112)
trigger2 = random <= (AILevel * 178)

;Buster Wolf / Buster Vacation
[State -1, AI]
type = ChangeState
value = 3100+((random%2)*600)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
triggerall = !numhelper(3401)
trigger1 = power >= 3000 || (power >= 2000 && var(38))
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 214 && movecontact
trigger1 = random <= (AILevel * 210)

;Power Mortar / Buster Wolf
[State -1, AI]
type = ChangeState
value = 3000+((random%2)*100)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel >= 1 && AILevel <= 3
trigger1 = power >= 1000 || var(38)
trigger1 = power < 3000
trigger1 = p2bodydist y >= -45
trigger1 = stateno = 214 && movecontact
trigger1 = random <= (AILevel * 210)

;Light Punch or Kick
[State -1, AI]
type = ChangeState
value = 200+((random%2)*200)+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = p2bodydist x > 5
trigger1 = p2bodydist x <= 45
trigger1 = p2bodydist y >= -45
trigger1 = ctrl
trigger1 = random <= (AILevel * 260)
trigger1 = random <= (AILevel * 210)

;LP 1
[State -1, AI]
type = ChangeState
value = 201
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 200 && movecontact
trigger1 = p2bodydist y >= -65
trigger1 = random <= (AILevel * 210)

;Power Dunk L
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 201 && movecontact
trigger1 = time >= 8 || hitcount >= 2
trigger1 = p2bodydist y >= -65
trigger1 = random <= (AILevel * 210)

;LK 1
[State -1, AI]
type = ChangeState
value = 231
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 230 && movecontact
trigger1 = p2bodydist y >= -65
trigger1 = random <= (AILevel * 210)

;Hey, Go Burn!
[State -1, AI]
type = ChangeState
value = 451
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 231 && movecontact
trigger1 = p2bodydist y >= -20
trigger1 = random <= (AILevel * 210)

;LK 2
[State -1, AI]
type = ChangeState
value = 232
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 231 && movecontact
trigger1 = p2bodydist y < -20
trigger1 = p2bodydist y >= -115
trigger1 = random <= (AILevel * 210)

;Crackshoots
[State -1, AI]
type = ChangeState
value = 1300+((random%3)*10)
triggerall = !numhelper(1511)
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 232 && movecontact
trigger1 = p2bodydist y >= -135
trigger1 = random <= (AILevel * 210)

;Crackshoots
[State -1, AI]
type = ChangeState
value = 1300+((random%2)*20)
triggerall = numhelper(1511)
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 232 && movecontact
trigger1 = p2bodydist y >= -135
trigger1 = random <= (AILevel * 210)

;Rocket Charge
[State -1, AI]
type = ChangeState
value = 1500
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 452 && movecontact
trigger1 = p2bodydist y >= -65
trigger1 = random <= (AILevel * 210)

;Portal Knuckal
[State -1, AI]
type = ChangeState
value = 1250
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
triggerall = numenemy
trigger1 = power >= 500 || var(38)
trigger1 = stateno = 1502 && movecontact || stateno = 15030
trigger1 = time >= 20
trigger1 = enemynear, statetype = A
trigger1 = random <= (AILevel * 210)

;LK or LP
[State -1, AI]
type = ChangeState
value = 400+((random%2)*30)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = prevstateno != 430
trigger1 = stateno = 430 && movecontact
trigger1 = p2bodydist y >= -35
trigger1 = random <= (AILevel * 210)

;Gamers rise up
[State -1, AI]
type = ChangeState
value = 1120+floor(fvar(1))
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = prevstateno = 430
trigger1 = stateno = 430 && movecontact
trigger1 = random <= (AILevel * 210)
trigger2 = prevstateno != 430
trigger2 = stateno = 430 && movecontact
trigger2 = p2bodydist y < -35
trigger2 = random <= (AILevel * 210)

;CMK or CMP
[State -1, AI]
type = ChangeState
value = 410+((random%2)*30)
triggerall = !numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 400 && movecontact
trigger1 = p2bodydist y >= -45
trigger1 = random <= (AILevel * 210)

;CMP
[State -1, AI]
type = ChangeState
value = 410
triggerall = numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 400 && movecontact
trigger1 = p2bodydist y >= -45
trigger1 = random <= (AILevel * 210)

;Blazing Blade
[State -1, AI]
type = ChangeState
value = 1210
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 400 && movecontact
trigger1 = p2bodydist y < -45
trigger1 = random <= (AILevel * 210)

;Power Charge
[State -1, AI]
type = ChangeState
value = 1510+((random%2)*10)
triggerall = !numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 440 && movecontact
trigger1 = random <= (AILevel * 210)

;skamtebord
[State -1, AI]
type = ChangeState
value = 1520
triggerall = numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 440 && movecontact
trigger1 = random <= (AILevel * 210)

;Power Dunk Varaints
[State -1, AI]
type = ChangeState
value = 1400+((random%2)*20)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 2
trigger1 = power < 1500
trigger1 = stateno = 1510 || stateno = 1520
trigger1 = movecontact
trigger1 = random <= (AILevel * 210)
trigger2 = numtarget
trigger2 = target, life < 350
trigger2 = power >= 1500 || var(38)
trigger2 = stateno = 1510 || stateno = 1520
trigger2 = movecontact
trigger2 = time >= 18
trigger2 = random <= (AILevel * 210)

;Power Geyser
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 2
triggerall = numtarget
triggerall = target, life >= 350
trigger1 = power >= 1500 || var(38)
trigger1 = stateno = 1510 || stateno = 1520
trigger1 = movecontact
trigger1 = time >= 18
trigger1 = random <= (AILevel * 210)
trigger2 = target, life >= 450
trigger2 = power >= 2000 || (power >= 1000 && var(38))
trigger2 = stateno = 420 && movecontact
trigger2 = random <= (AILevel * 210)

;CHP
[State -1, AI]
type = ChangeState
value = 420
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = prevstateno != 440
trigger1 = stateno = 410 && movehit
trigger1 = random <= (AILevel * 210)

;Jump Crack
[State -1, AI]
type = ChangeState
value  = ifelse((random%2 = 1),40,(1300+((random%3)*10)))
triggerall = !numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 420 && movecontact
trigger1 = random <= (AILevel * 210)

;Jump
[State -1, AI]
type = ChangeState
value = 40
triggerall = numhelper(1511)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 420 && movehit
trigger1 = time >= 20
trigger1 = random <= (AILevel * 344)
ctrl = 1

;Light Punch or Kick
[State -1, AI]
type = ChangeState
value = 600+((random%2)*30)
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = vel x > 0
trigger1 = p2dist x >= 0
trigger1 = p2dist x <= 65
trigger1 = p2bodydist y <= -5
trigger1 = p2bodydist y >= -80
trigger1 = ctrl
trigger1 = random <= (AILevel * 800)

;MP
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 600 || stateno = 630
trigger1 = movecontact

;HP
[State -1, AI]
type = ChangeState
value = 620
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 610 || stateno = 640
trigger1 = p2bodydist y <= 30
trigger1 = p2bodydist y >= -60
trigger1 = movehit

;Power Dunk
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 620
trigger1 = movehit
trigger1 = random <= (AILevel * 344)

;Crack Shoot
[State -1, AI]
type = ChangeState
value  = ifelse(numhelper(1511),1300+((random%2)*20),(1300+((random%3)*10)))
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel = 1 || AILevel = 2
trigger1 = stateno = 610 || stateno = 640
trigger1 = p2bodydist y < -60
trigger1 = movehit

;Fake Crouch (Same as above fake crouch controller found in Medium AI, with slightly tighter AI Level requirement)
[State -1, AI]
type = ChangeState
value = 111
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel > 0 && AILevel <= 3
triggerall = numenemy
trigger1 = ctrl
trigger1 = stateno != 12
trigger1 = statetype = S
trigger1 = p2bodydist x > 45
trigger1 = p2dist x <= 110
trigger1 = random%1000 >= (AILevel * 165)
trigger1 = random%1000 >= (AILevel * 120) 


;---------------------------------------------------------------------------
;Taunt when there's nothing else to do

;Taunt
[State -1, AI]
type = ChangeState
value  = 195
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel != 0
triggerall = AILevel <= 5
triggerall = !numhelper(1511)
trigger1 = numenemy
trigger1 = enemynear, teammode != simul
trigger1 = p2statetype = L
trigger1 = ctrl
trigger1 = p2bodydist x >= 60
trigger1 = life >= 780
trigger1 = random%1000 >= (AILevel * 134)
trigger1 = random%1000 >= (AILevel * 155) 
trigger2 = ctrl
trigger2 = !numenemy
trigger2 = random%1000 >= (AILevel * 154)
trigger2 = random%1000 >= (AILevel * 175) 

;Air Taunt
[State -1, AI]
type = ChangeState
value  = 197
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel != 0
triggerall = AILevel <= 4
triggerall = !numhelper(1511)
trigger1 = numenemy
trigger1 = enemynear, teammode != simul
trigger1 = p2statetype = L
trigger1 = ctrl
trigger1 = p2bodydist x >= 60
trigger1 = life >= 780
trigger1 = random%1000 >= (AILevel * 144)
trigger1 = random%1000 >= (AILevel * 165) 
trigger2 = ctrl
trigger2 = !numenemy
trigger2 = random%1000 >= (AILevel * 164)
trigger2 = random%1000 >= (AILevel * 185) 

;Wheeeeeeee
[State -1, AI]
type = ChangeState
value = 700+((random%2)*5)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AILevel != 0
triggerall = !numhelper(1511)
trigger1 = ctrl
trigger1 = !numenemy
