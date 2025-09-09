; ______________________________
;| Bison by Coelasquid and PotS |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;====================< BUTTON REMAPPING >====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;====================< DEFAULT VALUES >====================

[Defaults]
command.time = 15
command.buffer.time = 1


;====================< SINGLE BUTTON >====================

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


;====================< HOLD DIR >====================

[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1


;====================< HOLD BUTTON >====================

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


;====================< DIR >====================

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


;====================< RELEASE DIR >====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1
[Command]
name = "rlsback"
command = ~$B
time = 1
[Command]
name = "rlsup"
command = ~$U
time = 1
[Command]
name = "rlsdown"
command = ~$D
time = 1


;====================< RELEASE BUTTON >====================

[Command]
name = "rlsx"
command = ~x
time = 1
[Command]
name = "rlsy"
command = ~y
time = 1
[Command]
name = "rlsz"
command = ~z
time = 1
[Command]
name = "rlsa"
command = ~a
time = 1
[Command]
name = "rlsb"
command = ~b
time = 1
[Command]
name = "rlsc"
command = ~c
time = 1


;====================< DOUBLE TAP >====================

[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10


;====================< 2/3 BUTTON COMBINATION >====================

[Command]
name = "recovery"
command = x
time = 1
[Command]
name = "recovery"
command = y
time = 1
[Command]
name = "recovery"
command = z
time = 1
[Command]
name = "recovery"
command = a
time = 1
[Command]
name = "recovery"
command = b
time = 1
[Command]
name = "recovery"
command = c
time = 1


;==============================================================================================
;========================================< -1 STATES >===========================================
;==============================================================================================
[Statedef -1]

[State -1, Run]
type = changestate
value = 102
triggerall = !AIlevel
triggerall = command = "FF"
triggerall = roundstate = 2 && statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 220) && movecontact

[State -1, Dash Backward]
type = changestate
value = 105
triggerall = !AIlevel
triggerall = command = "BB"
triggerall = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, Running Attack]
type = changestate
value = 230
triggerall = !AIlevel
triggerall = statetype != A
triggerall = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger1 = stateno = 100 || (stateno = 102 && animelemtime(3) >= 1)

[State -1, Standing Hard Attack]
type = changestate
value = 220
triggerall = !AIlevel
triggerall = statetype != A
triggerall = command = "c" || command = "z"
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210) && movecontact

[State -1, Standing Medium Attack]
type = changestate
value = 210
triggerall = !AIlevel
triggerall = statetype != A
triggerall = command = "b" || command = "y"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact

[State -1, Standing Light Attack]
type = changestate
value = 200
triggerall = !AIlevel
triggerall = statetype != A
triggerall = command = "a" || command = "x"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact

[State -1, Jumping Hard Attack]
type = changestate
value = 620
triggerall = !AIlevel
triggerall = statetype = A
triggerall = command = "c" || command = "z"
trigger1 = ctrl

[State -1, Jumping Medium Attack]
type = changestate
value = 610
triggerall = !AIlevel
triggerall = statetype = A
triggerall = command = "b" || command = "y"
trigger1 = ctrl

[State -1, Jumping Light Attack]
type = changestate
value = 600
triggerall = !AIlevel
triggerall = statetype = A
triggerall = command = "a" || command = "x"
trigger1 = ctrl

[State -1, Taunt]
type = changestate
value = 195
triggerall = !AIlevel
triggerall = statetype != A
triggerall = command = "start"
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 220) && movecontact


;==================================================================================================
;============================================< A.I. >==============================================
;==================================================================================================

[State -1, Run]
type = changestate
value = 102
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = S
triggerall = p2statetype != L
trigger1 = ctrl
trigger1 = p2bodydist x > 80
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 220 && movecontact
trigger2 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Running Attack]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = stateno = 100 || (stateno = 102 && animelemtime(3) >= 1)
trigger1 = p2bodydist x <= 40
trigger1 = time > 40 || hitcount >= 3
trigger1 = random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Standing Hard Attack]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = (p2bodydist x = [0, 100]) && (p2dist y = [-100, 50])
trigger1 = ctrl
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 210) && movecontact
trigger2 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Standing Medium Attack]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = (p2bodydist x = [0, 70]) && (p2dist y = [-75, 50])
trigger1 = ctrl
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 200 && movecontact
trigger2 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Standing Light Attack]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = (p2bodydist x = [0, 60]) && (p2dist y = [-50, 50])
trigger1 = ctrl
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Hard Attack]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = statetype = A
triggerall = p2bodydist x <= 10
triggerall = p2statetype = S || p2statetype = C || p2statetype = L
trigger1 = ctrl
trigger1 = vel y >= 0
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Medium Attack]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = statetype = A
triggerall = p2bodydist x <= 50
triggerall = p2statetype = A
trigger1 = ctrl
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Light Attack]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = statetype = A
triggerall = p2bodydist x <= 40
triggerall = p2statetype = S || p2statetype = C
trigger1 = ctrl
trigger1 = vel y >= 0
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Taunt]
type = changestate
value = 195
triggerall = AIlevel && numenemy
triggerall = statetype != A
triggerall = life >= 0.5 * lifemax
triggerall = (enemynear, life / enemynear, lifemax) < ((life / lifemax) / 2)
trigger1 = ctrl
trigger1 = p2dist x >= 160 && !(enemynear, ctrl)
trigger1 = (enemynear, movetype = H) && (enemynear, hitfall) && random < (50 * (AIlevel ** 2 / 64.0))
