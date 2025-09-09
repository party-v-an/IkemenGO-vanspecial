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

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

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

;--- None of your own command definitions should be above this line. ---

;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+y
time = 1

;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "Sento"
command = ~D, DF, F, D, DF, F, x+y
time = 20
[Command]
name = "RSento"
command = ~D, DB, B, D, DB, B, x+y
time = 20
[Command]
name = "Sento"
command = ~D, DF, F, D, DF, F, z
time = 20
[Command]
name = "RSento"
command = ~D, DB, B, D, DB, B, z
time = 20

[Command]
name = "PunchyCannon"
command = ~D, DF, F, x+y

[Command]
name = "SmartieBomb"
command = ~D, DB, B, a+b

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, a+b

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, x+y

[Command]
name = "PunchyCannon"
command = ~D, DF, F, z

[Command]
name = "SmartieBomb"
command = ~D, DB, B, c

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, c

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, z



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

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, F, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

[Command]
name = "PlasmaKick"
command = ~F, D, DF, a
[Command]
name = "PlasmaKick"
command = ~F, D, DF, b

[Command]
name = "r_PlasmaKick"
command = ~B, D, DB, a
[Command]
name = "r_PlasmaKick"
command = ~B, D, DB, b


[Command]
name = "Gun"
command = B, F, y
time = 15

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "AFF"     ;Required (do not remove)
command = $F, ~F, F
time = 10

[Command]
name = "ABB"     ;Required (do not remove)
command = $B, ~B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "dbg";Required (do not remove)
command = c+z
time = 1

[Command]
name = "CD"
command = y+b
time = 1

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "SupahJump"
;command = ~$D, $U
command = ~$D, $U
time = 5
buffer.time = 2

[Command]
name = "ChargedSupahJump"
;command = ~$D, $U
command = ~12$D, $U
time = 5
buffer.time = 2

[Command]
name = "upper_what"
command = ~15$D, $U, x
time = 10
[Command]
name = "upper_what"
command = ~15$D, $U, y
time = 10
[Command]
name = "upper_what"
command = ~15$D, $U, z
time = 10
[Command]
name = "upper_what"
command = ~15$D, $U, a
time = 10
[Command]
name = "upper_what"
command = ~15$D, $U, b
time = 10
[Command]
name = "upper_what"
command = ~15$D, $U, c
time = 10

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

; The main purpose of having these next two controllers here at the top of
; StateDef -1 is to make sure the AI helper never changes to a different state,
; nor encounters any VarSets within State -1.
; But they also improve efficiency by preventing Mugen from wasting time
; processing the entire State -1 for the helper.
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
;trigger2 = (anim != 241 || (anim = 241 && animelemtime(6)>=-6) )
trigger2 = movecontact
trigger3 = stateno = 609 && time >= 3
var(1) = 1


[State -1, AI Consideration reset]
type = VarSet
trigger1 = stateno != 40
var(52) = 0
ignorehitpause = 1

; AI STARTS HERE

[State AI, Consider backing off]
type = VarSet
triggerall = var(55)
triggerall = var(52) = 0 || random < 80+var(55)
triggerall = random < 200 + (123*(prevstateno = 440 && (p2stateno=[5070,5100]) ) )
triggerall = numenemy
triggerall = (p2stateno = [5110,5130]) || ((enemynear,time <= 10) && (enemynear,prevstateno = 5120))
triggerall = p2bodydist x <= 40
trigger1 = stateno != 40
trigger1 = ctrl
var(52) = 105

[State AI, Consider S.X]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (9*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(43*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-40*const(size.yscale)) - (enemynear,vel y*3)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -70*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 3) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = (stateno = 230 || (stateno = 400 && prevstateno != 200) || stateno = 430 ) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 200
ignorehitpause = 1
[State AI, Consider S.Y]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (6*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 190)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(63*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-25*const(size.yscale)) - (enemynear,vel y*7)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -60*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 7) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = (stateno = 200 || stateno = 230 || stateno = 430 || (stateno = 410 && prevstateno != 210)) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 210
ignorehitpause = 1
[State AI, Consider S.A]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (9*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(38*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-20*const(size.yscale)) - (enemynear,vel y*3)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 3) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger3 = stateno = 609 && time >= 6
var(52) = 230
ignorehitpause = 1
[State AI, Consider S.B]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (5*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 100)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(84*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-20*const(size.yscale)) - (enemynear,vel y*7)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -50*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 7) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 240
ignorehitpause = 1
[State AI, I NEED MORE RANGE]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (10*(var(55)*var(55)))
triggerall = p2stateno != [120,159]
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x >= (84*const(size.xscale))-(19*movecontact)
triggerall = (enemynear,GetHitVar(hittime) >= 8) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025])
triggerall = time < 8
trigger1 = stateno = 240
trigger2 = stateno = 440
var(52) = 555
ignorehitpause = 1

[State AI, Consider C.X]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (9*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(62*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-10*const(size.yscale)) - (enemynear,vel y*2)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -40*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 2) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = ((stateno = 200 && prevstateno != 400) || (stateno = 430 && prevstateno != 400) ) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 400
ignorehitpause = 1
[State AI, Consider C.Y]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (6*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(35*const(size.xscale))-(15*movecontact)]
triggerall = p2dist y >= (-100*const(size.yscale)) - (enemynear,vel y*4)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -30*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 4) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = (stateno = 400 || stateno = 230 || stateno = 430 || (stateno = 210 && prevstateno != 410)) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 410
ignorehitpause = 1
[State AI, Consider C.A]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (8*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(49*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-20*const(size.yscale)) - (enemynear,vel y*6)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 6) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = ( (stateno = 400 && prevstateno != 430) ) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 430
ignorehitpause = 1
[State AI, Consider C.B]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+(var(55)*2)
triggerall = var(55)
triggerall = random < (4*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,-10),(86*const(size.xscale))-(19*movecontact)]
triggerall = p2dist y >= (-40*const(size.yscale)) - (enemynear,vel y*6)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 6) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = ctrl || (stateno = 100 && random < 150)
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430) && (movecontact)
trigger3 = stateno = 609 && time >= 6
var(52) = 440
ignorehitpause = 1

[State AI, J.LP]
type = Varset
triggerall = numenemy
triggerall = var(52) = 0 || random < 123
triggerall = var(55)
triggerall = p2bodydist x = [-30+(vel x*5)+(enemynear,vel x*5),37+(vel x*5)+(enemynear,vel x*5)]
triggerall = P2dist y = [-47+(vel y*5)+(enemynear,vel y*5),70+(vel y*5)+(enemynear,vel y*5)]
triggerall = Statetype = A
triggerall = p2stateno != [5100,5120]
triggerall = p2Statetype = A || vel y >= 0
triggerall = random < (5*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = time >= 7-var(55) || random < 10
trigger1 = ctrl
var(52) = 600
[State AI, J.HP]
type = Varset
triggerall = numenemy
triggerall = var(52) = 0 || random < 123
triggerall = var(55)
triggerall = p2bodydist x = [-30+(vel x*4)+(enemynear,vel x*4),45+(vel x*4)+(enemynear,vel x*4)]
triggerall = P2dist y = [-47+(vel y*4)+(enemynear,vel y*4),70+(vel y*4)+(enemynear,vel y*4)]
triggerall = Statetype = A
triggerall = p2stateno != [5100,5120]
triggerall = (stateno != [120,169])
triggerall = random < (5*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = time >= 7-var(55) || random < 10
trigger1 = ctrl
var(52) = 610
[State AI, J.LK]
type = Varset
triggerall = numenemy
triggerall = var(52) = 0 || random < 123
triggerall = var(55)
triggerall = p2bodydist x = [-48+(vel x*3)+(enemynear,vel x*3),12+(vel x*3)+(enemynear,vel x*3)]
triggerall = P2dist y = [-47+(vel y*5)+(enemynear,vel y*5),70+(vel y*5)+(enemynear,vel y*5)]
triggerall = p2dist y >= (-67*const(size.yscale)) + (vel y*3) + (enemynear,vel y*3)
triggerall = Statetype = A
triggerall = p2stateno != [5100,5120]
triggerall = (stateno != [120,169])
triggerall = random < (5*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = time >= 7-var(55) || random < 10
trigger1 = ctrl
var(52) = 630
[State AI, J.HK]
type = Varset
triggerall = numenemy
triggerall = var(52) = 0 || random < 123
triggerall = var(55)
;triggerall = (p2bodydist x + p2bodydist y - (enemynear,vel y*9)) = [-45,45]
triggerall = (p2bodydist x - p2bodydist y - (enemynear,vel y*9)) = [-90,-18]
;triggerall = p2bodydist x <= 77
triggerall = Statetype = A
triggerall = p2stateno != [5100,5120]
triggerall = (stateno != [120,169])
triggerall = random < (5*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = time >= 7-var(55) || random < 10
trigger1 = ctrl
var(52) = 640

[State AI, Consider Poppin'Caps]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,250]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (4*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 50)
triggerall = p2stateno != [5080,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,10),90*const(size.xscale)-(19*(movecontact>=1))]
triggerall = p2dist y >= -50*const(size.yscale) - (enemynear,vel y*9)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -50*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 9) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = stateno != 100 || random < 50
trigger1 = var(1)
var(52) = 1000
ignorehitpause = 1
[State AI, Consider Smoke Bombing Dat Ass]
type = VarSet
triggerall = !numhelper(1055)
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,250]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5110,5120]
triggerall = (p2stateno != [5080,5109]) || !(var(42) & floor(exp(0*ln(2)) + 0.5) )
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,10),185*const(size.xscale)-(19*(movecontact>=1))]
triggerall = p2dist y >= -66*const(size.yscale) - (enemynear,vel y*10)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 10) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = stateno != 100 || random < 50
trigger1 = var(1)
var(52) = ifelse(p2bodydist x<=145&&(random<500||p2statetype=L),1050,1060)
ignorehitpause = 1
[State AI, Consider Swag]
type = VarSet
triggerall = !numhelper(1108)
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,250]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,2,1) * ifelse(prevstateno=52||stateno=609||prevstateno=1050||prevstateno=1060,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5080,5130]
triggerall = p2dist y >= -120 - (p2dist x/2) - (enemynear,vel y*16)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -60*const(size.yscale)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 16) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
triggerall = ( enemynear, vel y <= 0 ) || ( (enemynear, vel y*16) + (enemynear, pos y) <= -16-(p2dist x/4) ) || (p2stateno != [5030,5120])
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = stateno != 100 || random < 50
trigger1 = var(1)
var(52) = ifelse((p2bodydist x<=120-(p2dist y/2)&&random<700)||(p2dist x = [105,135]),1100,1110)
ignorehitpause = 1
[State AI, Consider Blasting Repulsively]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,250]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(moveguarded,2,1)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0)
triggerall = p2stateno != [5110,5130]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-5,10),88*const(size.xscale)]
triggerall = p2dist y >= -90*const(size.yscale) - (enemynear,vel y*33)
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 33) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025]) || (moveguarded)
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = stateno != 100 || random < 50
trigger1 = var(1)
var(52) = 1150
ignorehitpause = 1

[State AI, Consider Smoking Weed Every Day]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,255]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,3,1)
triggerall = random < 300 + ((lifemax - life)/16)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 50)
triggerall = p2stateno != [5080,5140]
triggerall = p2dist y = [-69*const(size.yscale) - (enemynear,vel y*6),64]
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -50*const(size.yscale)
triggerall = ( enemynear, vel y <= 0 ) || ( (enemynear, vel y*16) + (enemynear, pos y) <= -16 ) || (p2stateno != [5030,5120])
triggerall = power >= 1000
triggerall = (p2movetype = H) || (enemynear, ctrl = 0) || (enemynear, statetype = A)
triggerall = p2stateno != [120,165]
triggerall = (prevstateno != [2000,3902]) || (stateno = [2000,3902])
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 6 ) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025])
trigger1 = anim != 20
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = var(1)
trigger2 = (stateno = 1000 && animelemtime(19) > 0) || (stateno = 1150)
trigger2 = movehit
var(52) = 3000
ignorehitpause = 1
[State AI, Consider Playing Some More Dyna Gear]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,255]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,3,1)
triggerall = random < 300 + ((lifemax - life)/16)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 50)
triggerall = p2stateno != [5080,5140]
triggerall = p2bodydist x = [ifelse(p2statetype!=A,-32,-32),64*const(size.xscale)-(16*(movecontact>=1))]
triggerall = p2dist y >= -69*const(size.yscale) - (enemynear,vel y*8)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -20*const(size.yscale)
triggerall = ( enemynear, vel y <= 0 ) || ( (enemynear, vel y*8) + (enemynear, pos y) <= -8 ) || (p2stateno != [5030,5120])
triggerall = power >= 1000
triggerall = (p2movetype = H) || (enemynear, ctrl = 0) || (enemynear, statetype = A)
triggerall = p2stateno != [120,165]
triggerall = (prevstateno != [2000,3902]) || (stateno = [2000,3902])
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 6 ) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025])
trigger1 = anim != 20
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = var(1)
trigger2 = (stateno = 1000 && animelemtime(19) > 0) || (stateno = 1150)
trigger2 = movehit
var(52) = 3050
ignorehitpause = 1
[State AI, Consider Bangin Dem Protton Cannons Nigga since 1982]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,255]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,3,1)
triggerall = random < 300 + ((lifemax - life)/16)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 50)
triggerall = p2stateno != [5080,5140]
triggerall = (p2bodydist x = [ifelse(p2statetype!=A,-5,0),118*const(size.xscale)-(16*(movecontact>=1))]) || (!movehit)
triggerall = p2dist y >= -69*const(size.yscale) - (enemynear,vel y*6)
triggerall = ( p2dist y + (enemynear,const(size.head.pos.y) / ifelse(p2statetype=C,2,1) ) ) <= -50*const(size.yscale)
triggerall = ( enemynear, vel y <= 0 ) || ( (enemynear, vel y*16) + (enemynear, pos y) <= -16 ) || (p2stateno != [5030,5120])
triggerall = power >= 2000
triggerall = (p2movetype = H) || (enemynear, ctrl = 0) || (enemynear, statetype = A)
triggerall = p2stateno != [120,165]
triggerall = (prevstateno != [2000,3902]) || (stateno = [2000,3902])
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
triggerall = (enemynear,GetHitVar(hittime) >= 17 ) || (p2movetype != H) || (p2statetype = A) || (p2stateno != [5000,5025])
trigger1 = anim != 20
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = var(1)
trigger2 = (stateno = 1000 && animelemtime(19) > 0) || (stateno = 1150)
trigger2 = movehit
var(52) = 3150
ignorehitpause = 1
[State AI, Consider Inviting The Party]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,255]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (3*(var(55)*var(55))) * ifelse(movehit,3,1)
triggerall = random < 300 + ((lifemax - life)/16)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 150)
triggerall = p2stateno != [5080,5140]
triggerall = (p2bodydist x = [ifelse(p2statetype!=A,-5,0),118*const(size.xscale)-(16*(movecontact>=1))]) || (!movehit)
triggerall = p2dist y >= -108*const(size.yscale) - (enemynear,vel y*6)
triggerall = ( enemynear, vel y <= 0 ) || ( (enemynear, vel y*5) + (enemynear, pos y) <= -5 ) || (p2stateno != [5030,5120])
triggerall = power >= 3000
triggerall = (p2movetype = H) || (enemynear, ctrl = 0) || (enemynear, statetype = A)
triggerall = p2stateno != [120,165]
triggerall = (prevstateno != [2000,3902]) || (stateno = [2000,3902])
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
trigger1 = anim != 20
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = var(1)
trigger2 = (stateno = 1000 && animelemtime(19) > 0) || (stateno = 1150)
trigger2 = movehit
var(52) = 3250
ignorehitpause = 1
[State AI, Consider Smartie Bombing]
type = VarSet
triggerall = !numhelper(3101)
triggerall = numenemy
triggerall = var(52) = 0 || ( (random < 80+var(55)) && (var(52)!=[200,255]) && (var(52)!=[400,450]) )
triggerall = var(55)
triggerall = random < (1*(var(55)*var(55)))
triggerall = random < 300 + ((lifemax - life)/16)
triggerall = ((p2movetype != A && enemynear, numproj = 0) || (EnemyNear, Facing = Facing) || (EnemyNear, moveguarded >= 8) || (var(51)) || (!InGuardDist) ) || (p2movetype!= A && enemynear, ctrl = 0) || (random < 50)
triggerall = power >= 1000
triggerall = (p2movetype != H) || (p2stateno = [120,165])
triggerall = (enemynear, ctrl = 0) || (enemynear, statetype = A)
triggerall = (prevstateno != [2000,3902]) || (stateno = [2000,3902])
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
trigger1 = anim != 20
trigger1 = stateno != 40
trigger1 = stateno != 20 || random < 500 || p2movetype = H
trigger1 = var(1)
trigger1 = !movehit
var(52) = 3100
ignorehitpause = 1


[State AI, Consider Throwing]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 900
triggerall = var(55)
triggerall = random < (15*(var(55)*var(55)))
triggerall = p2stateno != [5080,5130]
triggerall = abs(p2bodydist x) < 6
triggerall = statetype != A
triggerall = p2movetype != H
triggerall = p2statetype != A
triggerall = var(8) = 0
triggerall = prevstateno != [800,899]
trigger1 = stateno != 40
trigger1 = ctrl
var(52) = ifelse(random<500,800,830)
ignorehitpause = 1

[State AI, Consider Advancing]
type = VarSet
triggerall = var(55)
triggerall = var(52) = 0 || random < 80+var(55)
triggerall = random < (33*var(55))
triggerall = ((enemynear, ctrl = 0) && p2movetype != A) || (p2movetype = A && (enemynear, facing = facing))
triggerall = (p2stateno != [5080,5130]) || (p2bodydist x = [45,100])
triggerall = p2bodydist x >= 45
triggerall = statetype != A
triggerall = time >= 7-var(55) || random < 10
trigger1 = stateno != 40
trigger1 = stateno != 100
trigger1 = ctrl
trigger1 = !moveguarded
var(52) = ifelse(random<200,41,ifelse(random<50,710,100))
[State AI, Consider jumping in]
type = VarSet
triggerall = numenemy
triggerall = var(52) = 0 || random < 80+var(55) + (100*(stateno = 640)) + (100*(stateno = 240))
triggerall = var(55)
triggerall = p2stateno != [5080,5130]
triggerall = statetype != A || stateno = 640
triggerall = p2statetype = A && p2movetype = H
triggerall = (enemynear, pos y <= -45)
trigger1 = ctrl || stateno = 100 || stateno = 40
trigger2 = stateno = 240 || stateno = 640 || stateno = 1402 || stateno = 1403
trigger2 = !(var(22) & floor(exp(0*ln(2)) + 0.5) ) || statetype != A
trigger2 = movecontact
var(52) = ifelse(p2bodydist x>=20,ifelse(p2bodydist x>=160,44,41),42)
ignorehitpause = 1

[State AI, Guard S]
type = ChangeState
triggerall = stateno != 40
triggerall = random < 125*var(55)
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType != C) && (((P2MoveType = A) && (inguarddist)) || (EnemyNear, NumProj > 0))
value = 130

[State AI, Guard L]
type = ChangeState
triggerall = stateno != 40
triggerall = random < 125*var(55)
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType = C) && (((P2MoveType = A) && (inguarddist)) || (EnemyNear, NumProj > 0))
value = 131

; AI ENDS HERE

;===========================================================================
;---------------------------------------------------------------------------
;Smartie Bomb
[State -1, Final Gamble]
type = ChangeState
value = 3250
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "Sento",command = "RSento")) || var(52) = 3250
triggerall = power >= 3000
triggerall = !numhelper(3300)
triggerall = statetype != A
trigger1 = var(1) = 1
trigger2 = (stateno = 1000 && (movecontact || animelemtime(19)>=0)) || (stateno = 1150 && movecontact)

[State -1, Smartie Bomb]
type = ChangeState
value = 3150
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "PunchyCannon",command = "SmashKFUpper")) || var(52) = 3150
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = var(1) = 1
trigger2 = (stateno = 1000 && (movecontact || animelemtime(19)>=0)) || (stateno = 1150 && movecontact)

;Smartie Bomb
[State -1, Smartie Bomb]
type = ChangeState
value = 3100
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "SmartieBomb",command = "TripleKFPalm")) || var(52) = 3100
triggerall = power >= 1000
triggerall = statetype != A
triggerall = !numhelper(3101)
trigger1 = var(1) = 1
trigger2 = (stateno = 1000 && (movecontact || animelemtime(19)>=0)) || (stateno = 1150 && movecontact)

;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "SmashKFUpper",command = "PunchyCannon")) || var(52) = 3050
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = var(1) = 1
trigger2 = (stateno = 1000 && (movecontact || animelemtime(19)>=0)) || (stateno = 1150 && movecontact)


;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "TripleKFPalm",command = "SmartieBomb")) || var(52) = 3000
triggerall = power >= 1000
trigger1 = var(1) = 1
trigger2 = (stateno = 1000 && (movecontact || animelemtime(19)>=0)) || (stateno = 1200 && movecontact)
trigger3 = statetype = A
trigger3 = ctrl || ((stateno=[600,640]) && movecontact)


;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
;[State -1, Fast Kung Fu Palm]
;type = ChangeState
;value = 1020
;triggerall = command = "QCF_xy"
;trigger1 = var(1) ;Use combo condition (above)

;Repulsive Blast
[State -1, Repulsive Blast]
type = ChangeState
value = 1150
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "PlasmaKick",command = "r_PlasmaKick")) || var(52) = 1150
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Kemuri no Bakuudan
[State -1, Smoke Gun]
type = ChangeState
value = 1050
triggerall = !numhelper(1055)
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "QCF_x",command = "QCB_x")) || var(52) = 1050
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Kemuri no Bakuudan
[State -1, Smoke Gun]
type = ChangeState
value = 1060
triggerall = !numhelper(1055)
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "QCF_y",command = "QCB_y")) || var(52) = 1060
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Dollar Pack Shot
[State -1, Swag shot]
type = ChangeState
value = 1100
triggerall = !numhelper(1108)
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "QCB_x",command = "QCF_x")) || var(52) = 1100
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Dollar Pack Shot
[State -1, Swag shot]
type = ChangeState
value = 1110
triggerall = !numhelper(1108)
triggerall = (var(55)<5 && ifelse((anim!=[5,6]),command = "QCB_y",command = "QCF_y")) || var(52) = 1110
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Poppin Caps
[State -1, Stun Gun]
type = ChangeState
value = 1000
triggerall = (var(55)<5 && command = "Gun") || var(52) = 1000
trigger1 = var(1) ;Use combo condition (above)


;---------------------------------------------------------------------------
;Strong Kung Fu Blow
;[State -1, Strong Kung Fu Blow]
;type = ChangeState
;value = 1210
;triggerall = command = "QCB_y"
;trigger1 = var(1) ;Use combo condition (above)


;===========================================================================
;---------------------------------------------------------------------------
[State -1, AKUMA]
type = ChangeState
value = 700
triggerall = (!var(55) && command = "CD")  || var(52) = 700
triggerall = power >= 500
;triggerall = statetype != A
trigger1 = stateno = [150,156]

;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = (command = "FF") || (var(52) = 100)
triggerall = stateno != 100
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = (command = "BB") || (var(52) = 105)
triggerall = stateno != 105
trigger1 = statetype = S
trigger1 = ctrl

[State -1, FLY AWAY]
type = ChangeState
value = 110
triggerall = (var(55)<5 && command = "AFF") || (var(52) = 110)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,630]
trigger2 = movecontact

[State -1, UGH]
type = ChangeState
value = 115
triggerall = (var(55)<5 && command = "ABB") || (var(52) = 115)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,630]
trigger2 = movecontact

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = (command = "y" && (command = "holdfwd" || command = "holdback")) || var(52) = 800
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = var(8) = 0
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = (command = "b" && (command = "holdfwd" || command = "holdback")) || var(52) = 830
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = var(8) = 0
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = (var(55)<5 && (command = "x" && command != "holddown")) || var(52) = 200
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 230 || (stateno = 400 && prevstateno != 200) || stateno = 430 ) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = (var(55)<5 && (command = "y" && command != "holddown")) || var(52) = 210
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 430 || (stateno = 410 && prevstateno != 210)) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = (var(55)<5 && (command = "a" && command != "holddown")) || var(52) = 230
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = (var(55)<5 && (command = "b" && command != "holddown")) || var(52) = 240
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 1955
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = (var(55)<5 && (command = "x" && command = "holddown")) || var(52) = 400
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = ((stateno = 200 && prevstateno != 400) || (stateno = 430 && prevstateno != 400) ) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = (var(55)<5 && (command = "y" && command = "holddown")) || var(52) = 410
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400 || stateno = 230 || stateno = 430 || (stateno = 210 && prevstateno != 410)) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = (var(55)<5 && (command = "a" && command = "holddown")) || var(52) = 430
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = ( (stateno = 400 && prevstateno != 430) ) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = (var(55)<5 && (command = "b" && command = "holddown")) || var(52) = 440
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430) && (movecontact)
trigger3 = stateno = 609 && time >= 6

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = (var(55)<5 && (command = "x")) || var(52) = 600
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = (var(55)<5 && (command = "y")) || var(52) = 610
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = (var(55)<5 && (command = "a")) || var(52) = 630
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = (var(55)<5 && (command = "b")) || var(52) = 640
trigger1 = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;[State -1, DBG]
;type = ChangeState
;value = 180
;trigger1 = command = "dbg"
;trigger1 = command != "holddown"

;[State -1, DBG]
;type = ChangeState
;value = 170
;trigger1 = command = "dbg"
;trigger1 = command = "holddown"



