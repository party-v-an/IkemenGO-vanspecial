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
;   a fast attack, such as Duke's light punch.
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
name = "Quake"
command = ~D, DF, F, x+y
time = 20

[Command]
name = "Quake"
command = ~D, DF, F, y+z
time = 20

[Command]
name = "Quake"
command = ~D, DF, F, x+z
time = 20

[Command]
name = "Ride"
command = ~D, DB, B, a+b
time = 20

[Command]
name = "Ride"
command = ~D, DB, B, b+c
time = 20

[Command]
name = "Ride"
command = ~D, DB, B, a+c
time = 20

;-| Special Motions |------------------------------------------------------

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
name = "Throw"
command = x+a
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

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "Charge"
command = /x+y
time = 1

[Command]
name = "Devastator"
command = c+z
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
;Those Alien Bastards...! (uses one super bar)
[State -1, Those Alien Bastards...!]
type = ChangeState
value = 3050
triggerall = command = "Ride"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = var(59) = 0
trigger1 = ctrl

;---------------------------------------------------------------------------
;Quake Site (uses one super bar)
[State -1, Quake Site]
type = ChangeState
value = 3000
triggerall = command = "Quake"
triggerall = power >= 1000
triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl

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
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Devastator Fire
[State -1, Devastator Fire]
type = ChangeState
value = 960
triggerall = var(59) = 0
triggerall = command = "Devastator"
triggerall = var(31) != 0
triggerall = roundstate = 2
trigger1 = ctrl

;---------------------------------------------------------------------------
;Devastator
[State -1, Devastator]
type = ChangeState
value = 950
triggerall = var(59) = 0
triggerall = command = "Devastator"
triggerall = statetype != A
triggerall = var(31) = 0
triggerall = fvar(3) >= 1
triggerall = roundstate = 2
trigger1 = ctrl

;---------------------------------------------------------------------------
;Tazer
[State -1, Tazer]
type = ChangeState
value = 800
triggerall = command = "Throw"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Pistol Reload
[State -1, Pistol Reload]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = var(5) <= 0
triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Shotgun
[State -1, Stand Shotgun]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Special Weapon
[State -1, Special Weapon]
type = ChangeState
value = 6000+(floor(fvar(10))*100)
triggerall = fvar(10) != 0
triggerall = command = "z"
triggerall = var(59) = 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Special Weapon
[State -1, Special Weapon]
type = ChangeState
value = 2000+(floor(fvar(10))*100)
triggerall = fvar(10) != 0
triggerall = command = "z"
triggerall = var(59) = 0
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Item
[State -1, Item]
type = ChangeState
value = 1000+(floor(fvar(12))*100)
triggerall = command = "c"
triggerall = var(59) = 0
trigger1 = fvar(12) != 0
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Ungh! Where is it?!
[State -1, Ungh! Where is it?!]
type = ChangeState
value = 220
triggerall = var(59) = 0
triggerall = command = "z"
trigger1 = fvar(10) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype = C
trigger2 = ctrl

;---------------------------------------------------------------------------
;Ungh! Where is it?!
[State -1, Ungh! Where is it?!]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = command = "c"
trigger1 = fvar(12) = 0
trigger1 = fvar(13) > 0
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Ungh! Where is it?!
[State -1, Ungh! Where is it?!]
type = ChangeState
value = 251
triggerall = var(59) = 0
triggerall = command = "c"
trigger1 = fvar(12) = 0
trigger1 = fvar(13) <= 0
trigger1 = statetype != A
trigger1 = ctrl


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
trigger2 = stateno = 2500
trigger2 = time >= 10
trigger3 = stateno = 25000
trigger3 = time >= 5
trigger4 = stateno = 2600
trigger4 = time >= 10
trigger5 = stateno = 26000
trigger5 = time >= 5

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
trigger2 = (stateno = 230) && time >= 13
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 2500
trigger4 = time >= 10
trigger5 = stateno = 25000
trigger5 = time >= 5
trigger6 = stateno = 2600
trigger6 = time >= 10
trigger7 = stateno = 26000
trigger7 = time >= 5

;---------------------------------------------------------------------------
;Pistol Reload
[State -1, Pistol Reload]
type = ChangeState
value = 405
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = var(5) <= 0
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Shotgun
[State -1, Crouching Shotgun]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

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
trigger2 = stateno = 2500
trigger2 = time >= 10
trigger3 = stateno = 25000
trigger3 = time >= 5
trigger4 = stateno = 2600
trigger4 = time >= 10
trigger5 = stateno = 26000
trigger5 = time >= 5

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
trigger2 = stateno = 430
trigger2 = movecontact
trigger3 = stateno = 2500
trigger3 = time >= 10
trigger4 = stateno = 25000
trigger4 = time >= 5
trigger5 = stateno = 2600
trigger5 = time >= 10
trigger6 = stateno = 26000
trigger6 = time >= 5

;---------------------------------------------------------------------------
;Pistol Reload
[State -1, Pistol Reload]
type = ChangeState
value = 605
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = var(5) <= 0
trigger1 = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Jump Shotgun
[State -1, Jump Shotgun]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 6500
trigger2 = time >= 10
trigger3 = stateno = 65000
trigger3 = time >= 5
trigger4 = stateno = 6600
trigger4 = time >= 10
trigger5 = stateno = 66000
trigger5 = time >= 5

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
trigger2 = stateno = 6500
trigger2 = time >= 10
trigger3 = stateno = 65000
trigger3 = time >= 5
trigger4 = stateno = 6600
trigger4 = time >= 10
trigger5 = stateno = 66000
trigger5 = time >= 5

;---------------------------------------------------------------------------
;AI've come to chew ass and kick bubblegum, and I'm all out of ass.

;------NEUTRAL------

;Devastator and Jetpack
[State -1, AI]
type = ChangeState
value = 950
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = var(31) = 0
triggerall = fvar(3) >= 1
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = !numhelper(2801)
trigger1 = (stateno = [200,299]) || (stateno = [400,499])
trigger1 = movehit
trigger2 = stateno = 210 || stateno = 240 || stateno = 440
trigger2 = time >= 10
trigger3 = random <= (AILevel * 90)
trigger3 = random <= (AILevel * 90)
trigger3 = p2bodydist x > 65
trigger3 = ctrl

;Devastator Fire
[State -1, AI]
type = ChangeState
value = 960
triggerall = var(59) != 0
triggerall = var(31) != 0
triggerall = roundstate = 2
triggerall = p2statetype != L
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = !numhelper(2801)
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = p2bodydist y >= -90
trigger1 = p2bodydist y <= 30

;Quake Site
[State -1, AI]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 65) && random <= (AILevel * 42)
triggerall = power >= 1000
trigger1 = power >= 3000
trigger1 = fvar(10) = 7 || fvar(10) = 8
trigger1 = p2bodydist x > 60
trigger1 = p2bodydist y >= -50
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 90)

;Those Alien Bastards...!
[State -1, AI]
type = ChangeState
value = 3050
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 65) && random <= (AILevel * 42)
triggerall = power >= 1000
trigger1 = !numhelper(3051)
trigger1 = enemynear, life <= 443
trigger1 = p2bodydist x >= 30
trigger1 = p2bodydist x <= 140
trigger1 = ctrl
trigger1 = random <= (AILevel * 78)
trigger1 = random <= (AILevel * 112)

;Shotgun (Shrinker Follow-up)
[State -1, AI]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = enemynear, pos y >= -35
trigger1 = enemynear, movetype = H
trigger1 = enemynear, stateno = 2806

;Shotgun (Shrinker Follow-up)
[State -1, AI]
type = ChangeState
value = 210
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = enemynear, pos y < -35
trigger1 = enemynear, pos y >= -85
trigger1 = enemynear, movetype = H
trigger1 = enemynear, stateno = 2806

;Shotgun (Shrinker Follow-up)
[State -1, AI]
type = ChangeState
value = 610
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist y >= -70
trigger1 = p2bodydist y <= -20
trigger1 = enemynear, movetype = H
trigger1 = enemynear, stateno = 2806

;Ungh! (Weapons)
[State -1, AI]
type = ChangeState
value = 220
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = fvar(10) = 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 160
trigger2 = fvar(10) = 0
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)
trigger3 = ctrl
trigger3 = power >= 3000
trigger3 = fvar(10) <= 6
trigger3 = random <= (AILevel * 90)
trigger3 = random <= (AILevel * 70)
trigger3 = p2bodydist x >= 120

;Ungh! (Items)
[State -1, AI]
type = ChangeState
value = 250
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(12) = 0
triggerall = fvar(13) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 160
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Freezethrower
[State -1, AI]
type = ChangeState
value = 2500
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 5
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > -5
trigger1 = p2bodydist x <= 130
trigger1 = p2bodydist y >= -80
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > -5
trigger2 = p2bodydist x <= 130
trigger2 = p2bodydist y >= -80
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H

;Flamethrower
[State -1, AI]
type = ChangeState
value = 2600
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 6
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 65
trigger1 = p2bodydist x <= 115
trigger1 = p2bodydist y >= -80
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 65
trigger2 = p2bodydist x <= 115
trigger2 = p2bodydist y >= -80
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H

;Pistol Reload
[State -1, AI]
type = ChangeState
value = 205
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = var(5) = 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 160
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Pistol Reload (Air)
[State -1, AI]
type = ChangeState
value = 605
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = var(5) = 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 160
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Run Forward
[State -1, AI]
type = ChangeState
value = 101
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(14) >= 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 74)
trigger1 = random <= (AILevel * 89)
trigger1 = p2bodydist x > 35
trigger1 = p2bodydist x <= 185
trigger1 = FrontEdgeBodyDist >= 60

;Backdash
[State -1, AI]
type = ChangeState
value = 105
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(14) <= 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 30)
trigger1 = random <= (AILevel * 40)
trigger1 = p2bodydist x > 65
trigger1 = p2bodydist x <= 100
trigger1 = FrontEdgeBodyDist < 60
trigger2 = ctrl
trigger2 = random <= (AILevel * 60)
trigger2 = random <= (AILevel * 90)
trigger2 = p2bodydist x <= 180
trigger2 = p2bodydist x > 0
trigger2 = BackEdgeBodyDist >= 40
trigger3 = p2statetype = L
trigger3 = ctrl
trigger3 = random <= (AILevel * 60)
trigger3 = random <= (AILevel * 70)
trigger3 = p2bodydist x <= 50
trigger3 = p2bodydist x >= -5
trigger3 = BackEdgeBodyDist >= 40
trigger4 = stateno = 2400
trigger4 = time >= 35
trigger4 = random <= (AILevel * 60)
trigger4 = random <= (AILevel * 70)

;Tazer
[State -1, AI]
type = ChangeState
value = 800
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(18) < 3
trigger1 = enemynear, movetype != H
trigger1 = ctrl
trigger1 = random <= (AILevel * 42)
trigger1 = random <= (AILevel * 31)
trigger1 = p2bodydist x <= 35
trigger1 = p2bodydist y >= -80

;Quick Kick
[State -1, AI]
type = ChangeState
value = 230+((random%2)*200)
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -50

;Quick Kick
[State -1, AI]
type = ChangeState
value = 230
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = stateno = 2500 || stateno = 25000
trigger1 = time >= 16
trigger1 = random <= (AILevel * 104)
trigger1 = random <= (AILevel * 86)
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -50
trigger2 = fvar(11) <= 1
trigger2 = stateno = 2600 || stateno = 26000
trigger2 = time >= 16
trigger2 = random <= (AILevel * 104)
trigger2 = random <= (AILevel * 86)
trigger2 = p2bodydist x <= 65
trigger2 = p2bodydist y >= -50

;Quick Kick
[State -1, AI]
type = ChangeState
value = 630
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x <= 65
trigger1 = p2bodydist y >= -50

 ;------ITEMS------

;Health Pack
[State -1, AI]
type = ChangeState
value = 1100
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(12) = 1
triggerall = life <= (lifemax - 300)
trigger1 = ctrl
trigger1 = random <= (AILevel * 137)
trigger1 = random <= (AILevel * 98)
trigger1 = p2bodydist x >= 135 || enemynear, statetype = L

;Access Card
[State -1, AI]
type = ChangeState
value = 1200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(12) = 2
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x >= 90
trigger1 = enemynear, pos y >= -70

;Steroids
[State -1, AI]
type = ChangeState
value = 1300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(12) = 3
triggerall = fvar(14) <= 0
triggerall = life >= 506
trigger1 = ctrl
trigger1 = random <= (AILevel * 96)
trigger1 = random <= (AILevel * 87)
trigger1 = p2bodydist x >= 105 || enemynear, statetype = L

;Holoduke
[State -1, AI]
type = ChangeState
value = 1400
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(12) = 4
trigger1 = ctrl
trigger1 = random <= (AILevel * 116)
trigger1 = random <= (AILevel * 127)
trigger1 = p2bodydist x >= 115

 ;------SPECIAL WEAPONS------

;Chaingun Cannon
[State -1, AI]
type = ChangeState
value = 2100
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 1
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 65
trigger1 = p2bodydist y >= -80
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 65
trigger2 = p2bodydist y >= -80
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H

;Chaingun Cannon (Air)
[State -1, AI]
type = ChangeState
value = 6100
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 1
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 65
trigger1 = p2bodydist y >= -55
trigger1 = p2bodydist y <= 45
trigger1 = pos y <= -60
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 65
trigger2 = p2bodydist y >= -80
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H
trigger2 = pos y <= -60

;Throwing Knife
[State -1, AI]
type = ChangeState
value = 2200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 2
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist y >= -60
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 45
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H

;Throwing Knife (Air)
[State -1, AI]
type = ChangeState
value = 6200
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 2
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist y >= -45
trigger1 = p2bodydist y <= 35
trigger1 = pos y <= -60
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 45
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 20
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = enemynear, movetype = H
trigger2 = pos y <= -60

;Pipebomb
[State -1, AI]
type = ChangeState
value = 2300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 3
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 90
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Pipebomb (Air)
[State -1, AI]
type = ChangeState
value = 6300
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 3
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = p2bodydist x >= 90
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Pipebomb Detonator
[State -1, AI]
type = ChangeState
value = 3300
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 13
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = numhelper(2301)
trigger1 = (enemynear, pos x) - (helper(2301), pos x) >= -70
trigger1 = (enemynear, pos x) - (helper(2301), pos x) <= 70
trigger1 = (enemynear, pos y) - (helper(2301), pos y) >= -50
trigger1 = (enemynear, pos y) - (helper(2301), pos y) <= 10

;Pipebomb Detonator
[State -1, AI]
type = ChangeState
value = 7300
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 13
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)
trigger1 = numhelper(2301)
trigger1 = (enemynear, pos x) - (helper(2301), pos x) >= -70
trigger1 = (enemynear, pos x) - (helper(2301), pos x) <= 70
trigger1 = (enemynear, pos y) - (helper(2301), pos y) >= -50
trigger1 = (enemynear, pos y) - (helper(2301), pos y) <= 10

;Laser Tripmine
[State -1, AI]
type = ChangeState
value = 2400
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 4
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 59)
trigger1 = random <= (AILevel * 42)
trigger1 = p2bodydist x > 65
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;Laser Tripmine (Air)
[State -1, AI]
type = ChangeState
value = 6400
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 4
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 59)
trigger1 = random <= (AILevel * 42)
trigger1 = p2bodydist x > 25
trigger2 = ctrl 
trigger2 = p2statetype = L
trigger2 = random <= (AILevel * 90)

;RPG
[State -1, AI]
type = ChangeState
value = 2700
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 7
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist y >= -60
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 45
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)

;RPG (Air)
[State -1, AI]
type = ChangeState
value = 6700
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 7
triggerall = fvar(11) > 0
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 45
trigger1 = p2bodydist y >= -45
trigger1 = p2bodydist y <= 35
trigger1 = pos y <= -65
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 45
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 20
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)
trigger2 = pos y <= -65

;Shrinker
[State -1, AI]
type = ChangeState
value = 2800
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 8
triggerall = fvar(11) > 0
triggerall = !numhelper(2801)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 165
trigger1 = p2bodydist y >= -60
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 165
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)

;Shrinker
[State -1, AI]
type = ChangeState
value = 6800
triggerall = statetype = A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = fvar(10) = 8
triggerall = fvar(11) > 0
triggerall = !numhelper(2801)
triggerall = pos y <= -115
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist x > 165
trigger1 = p2bodydist y >= -60
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger2 = ctrl
trigger2 = random <= (AILevel * 89)
trigger2 = random <= (AILevel * 62)
trigger2 = p2bodydist x > 165
trigger2 = p2bodydist y >= -60
trigger2 = p2bodydist y <= 30
trigger2 = enemynear, pos y >= -70
trigger2 = numhelper(200)

 ;------COMBO 1: Mighty Foot Engaged-------

;Mighty Foot
[State -1, Mighty Foot]
type = ChangeState
value = 240
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = var(59) != 0
trigger1 = (stateno = 230) && movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Mighty Foot
[State -1, Mighty Foot]
type = ChangeState
value = 440
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = var(59) != 0
trigger1 = (stateno = 430) && movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)

;Mighty Foot
[State -1, Mighty Foot]
type = ChangeState
value = 640
triggerall = statetype = A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = life > 0
triggerall = alive
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
triggerall = var(59) != 0
trigger1 = (stateno = 630) && movehit
trigger1 = random <= (AILevel * 90)
trigger1 = random <= (AILevel * 70)


 ;------COMBO 2: Pistol Follow-up-------

;Shotgun
[State -1, AI]
type = ChangeState
value = 210+((random%2)*200)
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist y >= -80
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -70
trigger1 = numhelper(200)
trigger1 = enemynear, movetype = H

;Shotgun (Low)
[State -1, AI]
type = ChangeState
value = 410
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist y >= -40
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -30
trigger1 = numhelper(200)
trigger1 = enemynear, movetype = H

;Shotgun (High)
[State -1, AI]
type = ChangeState
value = 210
triggerall = statetype != A
triggerall = var(59) != 0
triggerall = roundstate = 2
triggerall = AIlevel >= 7 || random <= (AILevel * 80) && random <= (AILevel * 68)
trigger1 = ctrl
trigger1 = random <= (AILevel * 99)
trigger1 = random <= (AILevel * 72)
trigger1 = p2bodydist y >= -90
trigger1 = p2bodydist y <= 30
trigger1 = enemynear, pos y >= -40
trigger1 = enemynear, pos y < -30
trigger1 = numhelper(200)
trigger1 = enemynear, movetype = H


