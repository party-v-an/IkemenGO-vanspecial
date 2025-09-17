; ____________________________________________
;| Pocket Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0
juggle = 0

[State 0, Gone]
type = destroyself
trigger1 = ishelper
removeexplods = 1

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Dead]
type = selfstate
trigger1 = !alive
value = 5050
ctrl = 0

[State 0, Not Myself]
type = selfstate
trigger1 = incustomstate
trigger1 = time > 0
value = 5040


;==========<CROUCHING>==========
[Statedef 10]
type = C
physics = N
movetype = I
velset = vel x, 0
sprpriority = 0

[State 10, Skip]
type = selfstate
trigger1 = !time
trigger1 = prevstateno = 12
value = 11

[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = selfstate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = N
movetype = I
anim = 11
velset = vel x, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6
trigger1 = !animtime
value = 11


[Statedef 12]
type = S
physics = N
movetype = I
velset = vel x, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;==========<WALK>==========
[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x) * ifelse(var(1) != 1, 1.10, 1.0)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x) * ifelse(var(1) != 1, 1.10, 1.0)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 5 && anim != 12 && anim != 20
trigger2 = anim = 5
trigger2 = !animtime
trigger3 = anim = 12
trigger3 = !animtime
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 5 && anim != 12 && anim != 21
trigger2 = anim = 5
trigger2 = !animtime
trigger3 = anim = 12
trigger3 = !animtime
value = 21


;===================<JUMPING>================
;----- JUMP START -----
[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = (prevstateno != 100)

[State 40, Keyboard Check]; currently obsolete in Ikemen
type = changestate
trigger1 = !time
trigger1 = !AIlevel
trigger1 = prevstateno = 52
trigger1 = command = "holddown" && command = "holdup"
value = 10
ctrl = 1

;Alternative to giving control to this state
[State 40, Pre-Jump Guard]
type = changestate
triggerall = inguarddist
triggerall = isasserted(nostandguard) = 0
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger2 = AIlevel
value = 120

[State 40, Super Jump]
type = mapset
trigger1 = !time
map = "superjump"
value = 0

[State 40, Super Jump]
type = mapset
triggerall = !time
trigger1 = !AIlevel
trigger1 = map(cmd_highjump)
trigger2 = AIlevel
trigger2 = random < 333
trigger2 = p2dist y < -40
trigger3 = prevstateno = 420
map = "superjump"
value = 1

[State 40, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 40, Direction]
type = varset
trigger1 = !AIlevel
trigger1 = time >= 1
trigger1 = command = "holdfwd" || command = "holdback"
sysvar(1) = (command = "holdfwd") - (command = "holdback")
persistent = 0

[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse(p2bodydist x < 30, 0, ifelse((life - p2life) > 200 && p2movetype != H && random < 333, -1, 1))

[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
sysvar(1) = 1

[State 40, Sound]
type = playsnd
trigger1 = !animtime
value = 0, ifelse(map(superjump), 41, 40)

[State 40, Dust]
type = explod
trigger1 = !animtime
trigger1 = map(superjump)
anim = 6021
ID = 6021
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 40, Normal Jump]
type = velset
trigger1 = !animtime
trigger1 = !map(superjump)
x = ifelse(sysvar(1) = 0, const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Running Jump]
type = velset
trigger1 = !animtime
trigger1 = !map(superjump)
trigger1 = prevstateno = 100 && sysvar(1) = 1
x = const(velocity.runjump.fwd.x)
y = const(velocity.runjump.y)

[State 40, Super Jump]
type = velset
trigger1 = !animtime
trigger1 = map(superjump)
x = ifelse(sysvar(1) = 0, const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 3.90, -3.90))
y = -20.067

[State 40, End]
type = selfstate
trigger1 = !animtime
value = 50
ctrl = 1


;----- JUMP UP -----
[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x || map(superjump), 41, ifelse((vel x) > 0, 42, 43))

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Turn]
type = turn
trigger1 = map(superjump) && p2dist x < 0

[State 50, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP FALL -----
[Statedef 51]
type = A
physics = N
anim = 51

[State 51, Turn]
type = turn
trigger1 = map(superjump) && p2dist x < 0

[State 51, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP LAND -----
[Statedef 52]
type = S
physics = S
anim = 47
ctrl = 1; state -1 only sees this in the next frame
velset = 0, 0
sprpriority = 1

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
postype = p1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, Disable Trip Guard]; this is a bit different between Mugen and Ikemen
type = assertspecial
trigger1 = !time
trigger1 = prevstateno != [5000, 5999] && prevmovetype != H
trigger1 = prevstateno != 50 && prevstateno != 51 && prevstateno != [120, 155]
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 52, Trip Guard]; actually no longer necessary for human players
type = changestate
triggerall = !time
triggerall = ctrl
triggerall = inguarddist
triggerall = isasserted(nostandguard) = 0
triggerall = isasserted(nocrouchguard) = 0
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger2 = AIlevel
trigger2 = random < (1000 * (AIlevelF / 8.0))
value = 120

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RUN>===========================
[Statedef 100]
type = S
physics = S
anim = 100
ctrl = 1
sprpriority = 1

[State 100, Flags]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Sound]
type = playsnd
trigger1 = !time
value = 0, 40

[State 100, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
vel = -0.5, -0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 100, Steps]
type = playsnd
trigger1 = animelem = 3
trigger2 = animelem = 6
value = 0, 52

[State 100, End]
type = changestate
triggerall = time >= 9
trigger1 = !AIlevel
trigger1 = command != "holdfwd" || command = "holdback"
trigger2 = AIlevel && p2bodydist x <= 32
trigger3 = p2dist x < -const(size.ground.back)
value = 101


[Statedef 101]
type = S
physics = S
anim = 101
ctrl = 1
sprpriority = 1

[State 101, Flags]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<DASH BACKWARDS>==========================
[Statedef 105]
type = S
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 1
sprpriority = 1

[State 105, Flags]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 105, Accel]
type = gravity
trigger1 = animelemtime(2) >= 0

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A

[State 105, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 105, Dust]
type = explod
trigger1 = animelem = 2
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0.5, -0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State Land]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 106


[Statedef 106]
type = S
physics = S
anim = 106
velset = 0, 0
ctrl = 1
sprpriority = 1

[State 105, Flags]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, steps]
type = playsnd
trigger1 = !time
value = 0, 52

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<GUARD>========================
;----- START -----
[Statedef 120]
type = U
physics = U

[State 120, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 120, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = N

[State 120, Vel]
type = velset
trigger1 = !time
trigger1 = statetype != A
x = 0
y = 0

[State 120, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 120, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2

[State 120, End]
type = changestate
trigger1 = !animtime
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop Guarding]
type = changestate
triggerall = statetype != A
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140

[State 120, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
ctrl = 1

[State 120, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- STAND GUARD (Guarding) -----
[Statedef 130]
type = S
physics = S
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 130, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 130, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, AI fix]
type = changestate
trigger1 = AIlevel
trigger1 = numenemy
trigger1 = time >= 120 || p2, time >= 60
trigger1 = random < 17
value = 40

[State 130, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52

[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 6020
ID = 6020
postype = p1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 130, High to Low]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
value = 131

[State 130, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140

[State 130, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- CROUCH GUARD (Guarding) -----
[Statedef 131]
type = C
physics = C
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 131, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 131, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Low to High]
type = changestate
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
value = 130

[State 131, AI fix]
type = changestate
trigger1 = AIlevel
trigger1 = numenemy
trigger1 = time >= 120 || p2, time >= 60
trigger1 = random < 17
value = 40

[State 131, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140


;----- AIR GUARD (Guarding) -----
[Statedef 132]
type = A
physics = N

[State 132, Do or do not]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 132, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132

[State 132, Accel]
type = veladd
trigger1 = 0
y = const(movement.yaccel)

[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 132, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding];Marvel games do this
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140


;----- GUARD (End) -----
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = N

[State 140, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 140, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

[State 140, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk

[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

[State 140, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
ctrl = 1


;----- STAND GUARD HIT (Shaking) -----
[Statedef 150]
type = S
physics = N
movetype = H
velset = 0, 0

[State 150, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = ifelse((!AIlevel && command = "holddown") || (AIlevel && !map(ai_blockhigh)), 153, 151)

[State 150, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 150, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 150, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- STAND GUARD HIT 2 (Knocked back) -----
[Statedef 151]
type = S
physics = S
movetype = H
anim = 130

[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 151, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 151, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;----- CROUCH GUARD HIT (Shaking) -----
[Statedef 152]
type = C
physics = N
movetype = H
velset = 0, 0

[State 152, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = ifelse((!AIlevel && command = "holddown") || (AIlevel && !map(ai_blockhigh)), 153, 151)

[State 152, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 152, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 152, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- CROUCH GUARD HIT 2 (Knocked back) -----
[Statedef 153]
type = C
physics = C
movetype = H
anim = 131

[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 153, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 153, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;----- AIR GUARD HIT (Shaking) -----
[Statedef 154]
type = A
physics = N
movetype = H
velset = 0, 0

[State 154, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

[State 154, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- AIR GUARD HIT 2 (Knocked away) -----
[Statedef 155]
type = A
physics = N
movetype = H
anim = 132

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Accel]
type = veladd
trigger1 = 0
y = const(movement.yaccel)

[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;==========<POWER CHARGE>==========
[Statedef 520]
type = S
physics = S
movetype = I
anim = 520
ctrl = 0
velset = 0, 0

[State 520, Sound]
type = playsnd
trigger1 = time = 8
value = 3, 4
channel = 0

[State 520, Power]
type = poweradd
trigger1 = 1
value = 4 + ifelse(time < 60, 0, (time - 60) / 15)

[State 520, Aura]
type = explod
trigger1 = animelemtime(4) >= 0
trigger1 = !numexplod(6050)
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
removetime = 600
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 520, FX]
type = helper
trigger1 = animelemtime(4) >= 0
trigger1 = !numhelper(525)
helpertype = normal
stateno = 525
ID = 525
name = "Power Charge"
postype = p1
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 520, Sound]
type = playsnd
trigger1 = power >= powermax
value = 3, 9
channel = 0
persistent = 0

[State 520, End]
type = changestate
triggerall = time >= 24
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel
trigger2 = (command = "/x" || command = "/y" || command = "/z") + (command = "/a" || command = "/b" || command = "/c") != 2
trigger3 = AIlevel
trigger3 = inguarddist || p2bodydist x <= 120
trigger4 = AIlevel
trigger4 = p2movetype = A
trigger4 = p2stateno = [3000, 4999] || (p2, vel x * p2, facing * facing) < -1
value = 521


;----- END -----
[Statedef 521]
type = S
physics = S
movetype = I
anim = 521
velset = 0, 0
ctrl = 0

[State 521, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 521, Sound]
type = playsnd
trigger1 = !time
trigger1 = power >= const(data.power)
value = 3, 9
channel = 0

[State 521, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<GUARD CANCEL>==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000
facep2 = 1

[State 750, Flash]
type = palfx
trigger1 = time < 10
trigger1 = !(time % 2)
add = 255, 255, 255
time = 1

[State 750, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 12
add = 255, 255, 255
sinadd = -255, -255, -255, 48

[State 750, Pause]
type = superpause
trigger1 = !time
time = 12
movetime = 12
anim = s6110
pos = 50 - screenpos x, 0
sound = s6, 1
darken = 0

[State 750, Sound]
type = playsnd
trigger1 = !time
value = 6, 1

[State 750, Guard Points]
type = guardpointsadd
trigger1 = !time
value = -min((guardpoints - 1), 300)

[State 750, End]
type = changestate
trigger1 = time >= 15
value = 2900


;==========<TAUNT>==========
[Statedef 195]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 1
anim = 195
ctrl = 0

[State 195, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 195, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 9
channel = 0

[State 195, Shake]
type = envshake
trigger1 = animelem = 4
time = 24
freq = 180
ampl = 3
mul = 0.8

[State 195, Dust]
type = explod
trigger1 = animelem = 4
anim = 6020
ID = 6020
sprpriority = 2
postype = p1
pos = ceil(-17 * const(size.xscale)), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 195, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 4

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<LOSE (Time over)>==========
[Statedef 170]
type = S
anim = 170
ctrl = 0
velset = 0, 0

[State 170, Anim]
type = changeanim
trigger1 = !time
value = 170

[State 170, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 2
channel = 0


;==========<DRAWGAME (Time over)>==========
[Statedef 175]
type = S
anim = 175
ctrl = 0
velset = 0, 0

[State 175, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 7
channel = 0
persistent = 0


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Intro1]
type = changestate
trigger1 = !time
value = ifelse(random < 250, 191, ifelse(random < 333, 192, ifelse(random < 500, 193, 194)))


;==========<INTRO 1>==========
[Statedef 191]
type = S
anim = 191

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 191, ten]
type = modifyexplod
trigger1 = numexplod(6052)
trigger1 = roundstate = 0
ID = 6052
anim = 6052

[State 191, ten]
type = explod
trigger1 = !time
anim = 6052
ID = 6052
sprpriority = 2
postype = p1
pos = ceil(ifelse(facing = -1, 9, 0) * const(size.xscale)), 0
scale = const(size.xscale), const(size.yscale)
facing = facing
bindtime = -1
ownpal = 1
removeongethit = 1

[State 191, Sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 33
channel = 0

[State 191, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 4

[State 191, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 3
mul = 0.8

[State 191, Aura]
type = explod
trigger1 = animelem = 5
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
removetime = 300
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 191, Dust]
type = explod
trigger1 = animelem = 5
anim = 6024
ID = 6024
sprpriority = -1
postype = p1
pos = ceil(-17 * const(size.xscale)), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 191, Kanji]
type = explod
trigger1 = animelemtime(5) = 1
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 2 - BOO>==========
[Statedef 192]
type = S
anim = 192

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 192, ten]
type = modifyexplod
trigger1 = numexplod(6052)
trigger1 = roundstate = 0
ID = 6052
anim = 6052

[State 192, ten]
type = explod
trigger1 = !time
anim = 6052
ID = 6052
sprpriority = 2
postype = p1
pos = ceil(ifelse(facing = -1, 9, 0) * const(size.xscale)), 0
scale = const(size.xscale), const(size.yscale)
facing = facing
bindtime = -1
ownpal = 1
removeongethit = 1

[State 192, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 3
channel = 0

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0



;==========<INTRO 3 - THUNDER>==========
[Statedef 193]
type = S
anim = 193

[State 193, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 193, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 193, Sound]
type = playsnd
trigger1 = animelemtime(2) = 20
value = 5000, 0
channel = 0

[State 193, Dust]
type = explod
trigger1 = animelemtime(1) = 28
anim = 6024
ID = 6024
sprpriority = -1
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 193, thunder]
type = helper
trigger1 = animelemtime(1) = 28
helpertype = normal
stateno = 358
ID = 358
name = "thunder"
postype = p1
pos = 0, -6
ownpal = 1
persistent = 0

[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 4 - CYBER>==========
[Statedef 194]
type = A
physics = N
anim = 194

[State 194, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 194, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 194, Push]
type = playerpush
trigger1 = 1
value = 0

[State 194, Bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 194, Pos]
type = posset
trigger1 = !time
y = -280

[State 194, Vel]
type = velset
trigger1 = anim = 194
trigger1 = roundstate != 0
y = 5
persistent = 0

[State 194, Vel]
type = velmul
trigger1 = anim = 194
x = 0
y = 0.98

[State 194, Sound]
type = playsnd
trigger1 = roundstate != 0
value = 4, 11
channel = 0
persistent = 0

[State 194, Cyber Gear]
type = modifyexplod
trigger1 = numexplod(6060)
trigger1 = roundstate = 0
ID = 6060
anim = 6060

[State 194, Cyber Gear]
type = explod
trigger1 = !time
anim = 6060
ID = 6060
sprpriority = 1
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1
scale = const(size.xscale), const(size.yscale)

[State 194, Jet]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6061
ID = 6061
name = "jet"
postype = p1
ownpal = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)
persistent = 0

[State 194, Dust]
type = explod
trigger1 = numhelper(6061)
trigger1 = pos y > -100 && !(time % 12)
anim = 6024
sprpriority = -1
postype = p1
pos = 0, -pos y
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 194, Cyber Fade]
type = modifyexplod
trigger1 = vel y <= 0.4
trigger1 = roundstate != 0
ID = 6060
anim = 6062
persistent = 0

[State 194, Cyber Fade]
type = playsnd
trigger1 = vel y <= 0.4
trigger1 = roundstate != 0
value = 5, 15
persistent = 0

[State 194, Anim]
type = changeanim
trigger1 = !numexplod(6060)
value = 51
persistent = 0

[State 194, Accel]
type = veladd
trigger1 = anim = 51
y = 0.5

[State 194, Vel]
type = velset
trigger1 = anim = 51
y = 0
persistent = 0

[State 194, Sound]
type = playsnd
trigger1 = anim = 51
value = 3, 9
channel = 0
persistent = 0

[State 194, Anim]
type = changeanim
trigger1 = anim != 47
trigger1 = pos y >= 0
value = 47

[State 194, Pos]
type = posset
trigger1 = anim = 47
y = 0

[State 194, Vel]
type = velset
trigger1 = pos y >= 0
x = 0
y = 0

[State 194, Sound]
type = playsnd
trigger1 = anim = 47
value = 0, 52
persistent = 0

[State 194, Dust]
type = explod
trigger1 = anim = 47
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
persistent = 0

[State 194, End]
type = changestate
trigger1 = anim = 47
trigger1 = !animtime
value = 0


;==========<INTRO vs RYU>==========
[Statedef 6910]
type = S
anim = 6910

[State 6910, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6910, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6910, Ten]
type = explod
trigger1 = !time
trigger1 = !numexplod(6052)
anim = 6052
ID = 6052
sprpriority = 2
postype = p1
pos = ceil(ifelse(facing = -1, 9, 0) * const(size.xscale)), 0
scale = const(size.xscale), const(size.yscale)
facing = facing
bindtime = -1
ownpal = 1
removeongethit = 1

[State 6910, Ten]
type = modifyexplod
trigger1 = roundstate = 0
trigger1 = numexplod(6052)
ID = 6052
anim = 6052

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 33
channel = 0

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 4

[State 6910, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 3
mul = 0.8

[State 6910, Aura]
type = explod
trigger1 = animelem = 5
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
removetime = 300
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 6910, Dust]
type = explod
trigger1 = animelem = 5
anim = 6024
ID = 6024
sprpriority = -1
postype = p1
pos = ceil(-17 * const(size.xscale)), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6910, Kanji]
type = explod
trigger1 = animelemtime(5) = 1
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 6910, Remove Aura]
type = removeexplod
trigger1 = animelem = 17
ID = 6050

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 17
value = 0, 170
channel = 0

[State 6910, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO vs LEI-LEI>====================
[Statedef 6911]
type = A
anim = 6911
velset = 0, 0
ctrl = 0

[State 6911, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6911, Wait]
type = assertspecial
trigger1 = roundstate = 0
trigger2 = enemy, stateno = 6910
trigger2 = enemy, animelemtime(7) < 0
flag = animfreeze

[State 6911, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 6911, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6911, Anim]
type = changeanim
trigger1 = enemy, stateno = 6910
trigger1 = enemy, animelemtime(7) = 0
value = 6911
elem = 2

[State 6911, Pos]
type = posset
trigger1 = !time
x = enemy, pos x + (64 * enemy, const(size.xscale) * enemy, facing)
y = -64 * enemy, const(size.yscale)

[State 6911, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 6911, Vel]
type = velset
trigger1 = animelem = 2
x = (helper(8999), rootdist x) / -50.0
y = -11
persistent = 0

[State 6911, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 7
channel = 0
persistent = 0

[State 6911, Sound]
type = playsnd
trigger1 = animelemtime(2) >= 0
trigger1 = !(time % 12)
value = 1, 2
;channel = 1

[State 6911, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6912


;----- Land -----
[Statedef 6912]
type = S
physics = S
anim = 6912
velset = 0, 0

[State 6912, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6912, Pos]
type = posset
trigger1 = !time
trigger1 = numhelper(8999)
x = helper(8999), pos x

[State 6912, Pos]
type = posset
trigger1 = !time
y = 0

[State 6912, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6912, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
postype = p1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6912, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S
ctrl = 0
velset = 0, 0

;[State 180, Quote]
;type = victoryquote
;trigger1 = 1
;value = randomrange(1, 11)

[State 180, winSGS]
type = changestate
trigger1 = prevstateno = 4090
value = 4090

[State 180, Win]
type = changestate
trigger1 = !time
trigger1 = command = "/x" || command = "/y" || command = "/z" || command = "/a" || command = "/b" || command = "/c"
value = ifelse((command = "/z" || command = "/c"), 183, ifelse((command = "/y" || command = "/b"), 182, 181))

[State 180, Win]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 181, ifelse(random < 500, 182, 183))


;==========<WIN 1 - TURN BACK>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
velset = 0, 0

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 181, Sound]
type = playsnd
trigger1 = animelemtime(3) = 15
value = 4, ifelse(random < 333, 15, ifelse(random < 500, 24, 25))
channel = 0

[State 181, ten]
type = explod
trigger1 = animelemtime(3) = 15
trigger1 = !numexplod(6052)
anim = 6053
ID = 6052
sprpriority = 2
postype = p1
pos = ceil(ifelse(facing = -1, 9, 0) * const(size.xscale)), 0
scale = const(size.xscale), const(size.yscale)
facing = facing
bindtime = -1
ownpal = 1
removeongethit = 1


;==========<WIN 2 - STOMP>==========
[Statedef 182]
type = S
anim = 182
ctrl = 0
velset = 0, 0

[State 182, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 182, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
persistent = 0

[State 182, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 3
mul = 0.8
persistent = 0

[State 182, Dust]
type = explod
trigger1 = animelem = 5
anim = 6024
ID = 6024
sprpriority = -1
postype = p1
pos = ceil(-17 * const(size.xscale)), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
persistent = 0


;==========<WIN 3 - NECKLACE>==========
[Statedef 183]
type = S
anim = 183
ctrl = 0
velset = 0, 0

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Sound]
type = playsnd
trigger1 = animelem = 5
value = 2, 3

[State 183, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 25
channel = 0

[State 183, necklace1]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(6 * const(size.xscale)), -28
size.height = 1

[State 183, necklace2]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(14 * const(size.xscale)), -27
size.height = 2

[State 183, necklace3]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(-1 * const(size.xscale)), -31
size.height = 3

[State 183, necklace4]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(18 * const(size.xscale)), -30
size.height = 4

[State 183, necklace5]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(-7 * const(size.xscale)), -35
size.height = 5

[State 183, necklace6]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(2 * const(size.xscale)), -41
size.height = 6

[State 183, necklace7]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(10 * const(size.xscale)), -40
size.height = 7

[State 183, necklace8]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 360
name = "Necklace"
postype = p1
pos = ceil(16 * const(size.xscale)), -35
size.height = 8


;==========<WIN by S.G.S>==========
[Statedef 4090]
type = S
ctrl = 0
velset = 0, 0
sprpriority = -4

[State 4090, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 4090, Anim]
type = changeanim
trigger1 = anim != 4090
value = 4090

[State 4090, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 4010
value = 6, 4

[State 4090, Kanji BG]
type = explod
trigger1 = !time
trigger1 = !numexplod(6200)
trigger1 = prevstateno = 4010
anim = 6200
ID = 6200
under = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 1, 1 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 60

[State 4090, noFG]
type = assertspecial
trigger1 = time <= 45
trigger1 = prevstateno = 4010
flag = noFG
flag2 = nobardisplay

[State 4090, Black]
type = bgpalfx
trigger1 = time <= 45
trigger1 = prevstateno = 4010
time = 15
add = -255, -255, -255
sinadd = 255, 255, 255, 60

[State 4090, Shake]
type = envshake
trigger1 = !time
trigger1 = prevstateno = 4010
time = 24
freq = 180
ampl = 3
mul = 0.8

[State 4090, Allow Round End]
type = ctrlset
trigger1 = time >= 120
trigger1 = roundstate = [2, 3]
trigger1 = time > (fightscreenvar(round.over.hittime) + fightscreenvar(round.over.waittime) + fightscreenvar(round.over.wintime))
value = 1


;==========<CONTINUE?>==========
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;====================<INITIALIZE>====================
;----- Before Config -----
[Statedef 5900]
type = S
anim = 9999

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, End]
type = changestate
trigger1 = time > 0; Wait for enemy to be loaded
value = 5901; Config


;----- After Config -----
[Statedef 5902]
type = S

[State 5902, Intro vs Ryu]
type = changestate
triggerall = numenemy
triggerall = teamleader = playerno
triggerall = enemy, teamleader = enemy, playerno
triggerall = !roundsexisted
trigger1 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server"
trigger2 = enemy, name = "Sakura Kasugano" && enemy, authorname = "Phantom.of.the.Server"
value = 6910

[State 5902, Intro vs Lei-Lei]
type = changestate
trigger1 = numenemy
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = !roundsexisted
trigger1 = enemy, name = "Lei-Lei" && enemy, authorname = "Phantom.of.the.Server"
value = 6911

[State 5902, Turns Intro]
type = changestate
trigger1 = !time
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = ifelse(random < 500, 193, 194)

[State 5902, Intro]
type = changestate
trigger1 = roundno = 1
value = 190

[State 5902, End]
type = changestate
trigger1 = 1
value = 0


;==========<FALL RECOVERY>==========
[Statedef 5200]
type = A
physics = N
movetype = H

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035
trigger1 = !animtime
value = 5050

[State 5200, Accel]
type = veladd
trigger1 = time > 0
y = max(0.35, gethitvar(yaccel))

[State 5200, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5201


[Statedef 5201]
type = S
physics = N
movetype = I
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0

[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0

[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Sound]
type = playsnd
trigger1 = !time
value = 3, 6
channel = 0

[State 5201, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5201, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-16 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- AIR -----
[Statedef 5210]
type = A
physics = N
movetype = I
anim = 5210
ctrl = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 3, 6
channel = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5210, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-48 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[State 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[State 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[State 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[State 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[State 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[State 5210, Back]
type = veladd
trigger1 = !time
trigger1 = command = "holdback"
x = const(velocity.air.gethit.airrecover.back)

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;====================<CHEAP K.O.>====================
[Statedef 5950]
type = S
movetype = H
physics = S
anim = 5950
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, Assert]
type = assertspecial
trigger1 = 1
flag = nokosnd
flag2 = nomakedust
flag3 = sizepushonly; because anim has no Clsn2

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time
trigger1 = !alive
channel = 0

[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2
trigger1 = !alive
value = 11, 1

[State 5950, Pos]
type = posadd
trigger1 = animelem = 5
x = -8 * const(size.xscale)

[State 5950, Sound]
type = playsnd
trigger1 = animelem = 7
value = F 7, 0

[State 5950, FX]
type = explod
trigger1 = animelem = 7
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==================================================================================================
;===========================================<STATE -2>=============================================
;==================================================================================================
[Statedef -2]

[State -2, Reset Action Limit]
type = mapset
triggerall = map(tenmakujin)
trigger1 = statetype != A
trigger2 = movetype = H
map = "tenmakujin"
value = 0

[State -2, P2 Terminal Velocity]
redirectID = p2, ID
type = velset
trigger1 = numenemy
trigger1 = alive && !standby
trigger1 = teammode != simul
trigger1 = p2, vel y > 12.0
trigger1 = p2, movetype != H
trigger1 = p2, physics = A || p2, physics = N
trigger1 = p2, stateno = 5040 || (p2, stateno = [200, 899] && p2, prevstateno = 5040)
trigger1 = p2, hitdefattr != SCA, SA, HA, ST, HT
y = 12.0

[State -2, Throw in Front]
type = null
trigger1 = 1 || map(grabbehind) := 0
trigger1 = p2dist x < 0
trigger1 = p2dist x < ifelse((facing = p2, facing), -(p2, const(size.ground.front)), -(p2, const(size.ground.back)))
trigger1 = map(grabbehind) := 1
ignorehitpause = 1

[State -2, Unthrowable Flag]
type = mapadd
trigger1 = map(unthrowable) > 0
trigger1 = numenemy
trigger1 = p2stateno != 52 || p2, ctrl || p2, time >= 6
map = "unthrowable"
value = -1
ignorehitpause = 1

[State -2, Unthrowable Flag - Jump Start]
type = mapset
trigger1 = numenemy
trigger1 = p2stateno = 40
trigger1 = p2movetype = I
trigger1 = p2, time < 10
map = "unthrowable"
value = 1
ignorehitpause = 1

[State -2, Unthrowable Flag - Hurt]
type = mapset
triggerall = p2, ctrl = 0
triggerall = p2, anim != 5300
triggerall = p2stateno != p2, const(statedizzy)
trigger1 = p2stateno = [150, 155]
trigger2 = p2stateno = 5120; Just in case
trigger3 = p2stateno = 5201
trigger4 = p2movetype = H
trigger4 = p2statetype != A
trigger5 = p2movetype = H
trigger5 = p2statetype = A
trigger5 = p2, hitfall = 0
map = "unthrowable"
value = 3
ignorehitpause = 1

[State -2, Total Combo Damage]
type = mapset
trigger1 = p2movetype != H
trigger1 = p2, anim != 5300
trigger1 = p2, dizzy = 0
trigger2 = map(startingp2life) < p2life
map = "startingp2life"
value = p2life
ignorehitpause = 1

[State -2, Dampener]
type = mapset
trigger1 = numenemy
map = "damagescaling"
value = ifelse(map(startingp2life) - p2life <= 0, 1.0, ifelse(map(startingp2life) - p2life >= 500, 0.1, 1 - ((map(startingp2life) - p2life) * 0.0018)))
ignorehitpause = 1

[State -2, Meter Scaling]
type = null
trigger1 = map(meterscaling) := map(damagescaling)
ignorehitpause = 1

[State -2, Damage Scaling - Override Fall Defense Bonus]
redirectID = p2, ID
type = assertspecial
trigger1 = numenemy
trigger1 = p2movetype = H
trigger1 = p2, gethitvar(playerno) = playerno
flag = nofalldefenceup
ignorehitpause = 1

[State -2, Damage Scaling - Root Multiplier]
type = attackmulset
trigger1 = 1
value = map(damagescaling)
ignorehitpause = 1

[State -2, Juggle - Hitvel Decay]
type = mapset
trigger1 = numenemy
trigger1 = p2movetype = H
map = "juggledecay"
value = ifelse(p2, gethitvar(hitcount) < 12, 0, (p2, gethitvar(hitcount) - 12) * 0.5)
ignorehitpause = 1

[State -2, Juggle - Hitvel Decay]
type = mapset
trigger1 = p2movetype != H
map = "juggledecay"
value = 0
ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
triggerall = target, time > 0
trigger1 = target, stateno = 5201
trigger2 = target, movetype != H
trigger2 = target, movereversed = 0
ignorehitpause = 1

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time <= 1
triggerall = movetype = H
triggerall = !hitoverridden
triggerall = stateno != [120, 155]
triggerall = gethitvar(damage) = (0, life)
trigger1 = gethitvar(animtype) = 0 && random < 250
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) >= 2 && random < 500
trigger4 = gethitvar(damage) >= 100
trigger5 = gethitvar(fall)
trigger6 = gethitvar(attr) = SCA, HA, HT, HP
value = 5000, (random % 4)
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
trigger1 = stateno = 5100
trigger1 = gethitvar(fall.damage) > 0 || sysvar(1) > 14
trigger2 = stateno = 5050 || stateno = 5100
trigger2 = prevstateno != [5000, 5120]
value = 5000, (random % 4)
lowpriority = 1
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
triggerall = incustomstate
trigger1 = anim = [5000, 5002]
trigger2 = anim = [5010, 5012]
trigger3 = anim = [5020, 5022]
trigger4 = anim = 5030
trigger5 = anim = 5070
trigger6 = anim = 5080
trigger7 = anim = [5100, 5101]
trigger8 = anim = 5170
trigger9 = anim = 5950
trigger10 = anim = 170
value = 5000, (random % 4)
lowpriority = 1
channel = 0

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 0
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
trigger1 = stateno = const(StateGuardBreakRecover)
value = 5000, 4
lowpriority = 1
channel = 0

;[State -2, Voice Pos];happens automatically in Ikemen GO 0.99
;type = sndpan
;trigger1 = 1
;channel = 0
;pan = 0
;ignorehitpause = 1


;==================================================================================================
;===========================================<STATE -3>=============================================
;==================================================================================================
[Statedef -3]

[State -3, Dashing Momentum]
type = veladd
trigger1 = vel x != 0
trigger1 = physics = N
trigger1 = stateno = [10, 12] || stateno = [200, 499]
trigger1 = stateno != 290
x = ifelse(abs(vel x) <= 0.50, -vel x, ifelse(vel x > 0, -0.50, 0.50))

[State -3, Gravity]
type = veladd
triggerall = statetype = A
triggerall = physics = N
triggerall = movetype != H || stateno = 155
trigger1 = stateno = [0, 699] || stateno = 850 || stateno = 1220
trigger1 = stateno != 105 && stateno != 154 && stateno != 194 && stateno != 290
y = ifelse(!map(superjump), const(movement.yaccel), ifelse(vel y < 0, 0.610, 0.4883))

[State -3, Gravity - Super Hop]
type = veladd
triggerall = map(superjump)
triggerall = vel y < 0
triggerall = statetype = A
triggerall = physics = N
triggerall = movetype != H
triggerall = (!AIlevel && command = "holddown") || (AIlevel && p2statetype != A)
trigger1 = stateno = [0, 699] || stateno = 850
trigger1 = stateno != 105 && stateno != 154 && stateno != 194 && stateno != 290
y = 0.610

[State -3, Terminal Velocity]
type = velset
triggerall = vel y > 12.0
triggerall = movetype != H
trigger1 = (stateno = [0, 699]) || stateno = 850
trigger1 = stateno != 105 && stateno != 154 && stateno != 290 && stateno != 194
y = 12.0

[State -3, Jump X Air Drag];1536
type = veladd
triggerall = !map(superjump)
trigger1 = stateno = [50, 51]
trigger2 = stateno = [600, 699]
x = ifelse(vel x >= 0.027, -0.027, ifelse(vel x <= -0.027, 0.027, -vel x))

[State -3, Super Jump X Air Drag];512
type = veladd
triggerall = map(superjump)
trigger1 = stateno = [50, 51]
trigger2 = stateno = [600, 699]
x = ifelse(vel x >= 0.009, -0.009, ifelse(vel x <= -0.009, 0.009, -vel x))

[State -3, Super Jump X Steering]
type = veladd
trigger1 = map(superjump)
trigger1 = command = "holdback"
trigger1 = vel x > -3.90 * 0.5
;trigger1 = vel x > -3.90 MvC1
trigger1 = stateno = [50, 51] || stateno = [600, 699]
x = -0.2852 * 0.5
;x = -0.0356 MvC1

[State -3, Super Jump X Steering]
type = veladd
trigger1 = map(superjump)
trigger1 = command = "holdfwd" && vel x < 3.90
trigger1 = stateno = [50, 51] || stateno = [600,699]
x = 0.2852

[State -3, Super Jump X Corners];Made this one up
type = velset
trigger1 = map(superjump)
trigger1 = (stateno = [50, 51]) || stateno = [600, 699]
trigger1 = (vel x < 0 && backedgedist <= 0) || (vel x > 0 && frontedgedist <= 0)
x = 0

[State -3, ProjContact Reset]
type = mapset
triggerall = map(projcontact)
trigger1 = stateno != 1000 && stateno != 1020 && stateno != 1050 && stateno != 3000
trigger1 = stateno != 3020 && stateno != 3050 && stateno != 3060 && stateno != 4100
trigger2 = stateno = 1000 && animelemtime(5) < 0
trigger3 = stateno = 1020 && animelemtime(7) < 0
trigger4 = stateno = 1050 && animelemtime(2) < 0
trigger5 = stateno = 3000 && animelemtime(15) < 0
trigger6 = stateno = 3020 && animelemtime(5) < 0
trigger7 = stateno = 3050 && animelemtime(4) < 0
trigger8 = stateno = 3060 && animelemtime(4) < 0
trigger9 = stateno = 4100 && animelemtime(5) < 0
map = "projcontact"
value = 0

[State -3, ProjContact Timer]
type = mapadd
trigger1 = map(projcontact)
map = "projcontact"
value = 1

[State -3, Projectile Flag]
type = mapset
trigger1 = 1
map = "projflag"
value = 0
ignorehitpause = 1

[State -3, Projectile Flag 1]
type = mapset
triggerall = map(projflag) != 1
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1020 && numhelper(1025)
trigger2 = helper(1025), stateno = 1025
;No Zankuu
map = "projflag"
value = 1
ignorehitpause = 1

[State -3, Projectile Flag 2]
type = mapset
triggerall = map(projflag) != 2
trigger1 = stateno != 3000 && numhelper(3005)
trigger1 = helper(3005), stateno = 3005
trigger2 = stateno != 3020 && numhelper(3025)
trigger2 = helper(3025), stateno = 3025
trigger3 = stateno != 3050 && numhelper(3055)
trigger3 = helper(3055), stateno = 3055
trigger4 = stateno != 3050 && numhelper(3055)
trigger4 = helper(3055), stateno = 3055
trigger5 = stateno != 4100 && numhelper(4105)
trigger5 = helper(4105), stateno = 4105
map = "projflag"
value = 2
ignorehitpause = 1

[State -3, Special Cancel Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "specialcancel"
value = 0
ignorehitpause = 1

[State -3, Special Cancel Check]
type = mapset
triggerall = !map(flyingscreen)
trigger1 = stateno = [200, 699]
trigger1 = stateno != 215
map = "specialcancel"
value = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "supercancel"
value = 0
ignorehitpause = 1

[State -3, Super Cancel Check]
type = mapset
triggerall = !map(flyingscreen)
trigger1 = stateno = [200, 699]
trigger1 = stateno != 215
trigger2 = stateno = [1000, 1999]
trigger2 = stateno != [1510, 1511]
trigger2 = stateno != [1520, 1521]
map = "supercancel"
value = 1
ignorehitpause = 1

[State -3, Throw Cancel Fix]; Because first frame of a throw has movehit and Custom Combo has so much freedom
type = null
trigger1 = numtarget
trigger1 = movehitvar(frame)
trigger1 = hitdefattr != SCA, AA
trigger1 = target, gethitvar(frame)
trigger1 = target, stateowner, ID = ID
trigger1 = time <= 0 && target, time <= 0
trigger1 = map(normalcancel) := 0 || map(specialcancel) := 0 || map(supercancel) := 0 || map(hypercancel) := 0
ignorehitpause = 1

[State -3, Movement Afterimage]
type = afterimage
trigger1 = time = 1
trigger1 = stateno = 50 && map(superjump)
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
trans = add1

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3000 && animelem = 2
trigger2 = stateno = 3050 && animelem = 2
trigger3 = stateno = 3100
trigger3 = anim = 3100 && animelemtime(1) = 3
trigger4 = stateno = 3200
trigger4 = anim = 3200 && animelem = 2
trigger5 = stateno = 3220
trigger5 = animelemtime(1) = 1
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 0, 64, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3020 && animelem = 5
trigger2 = stateno = 3060 && animelem = 2
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 128, 0, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 4000 && time = 1
trigger2 = stateno = 4100 && animelemtime(1) = 3
trigger3 = stateno = 4200
trigger3 = anim = 4201 && animelem = 2
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = vel y < -1
trigger1 = map(superjump)
trigger1 = stateno = 50 || stateno = [600, 699]
trigger2 = stateno = [3000, 4999]
trigger2 = anim != 4010
time = 2
ignorehitpause = 1

[State -3, Level 1 Super BGPalFX]
type = bgpalfx
trigger1 = stateno = 3000 && animelem = 2
trigger2 = stateno = 3050 && animelem = 2
trigger3 = stateno = 3100
trigger3 = anim = 3100 && animelemtime(1) = 3
trigger4 = stateno = 3200
trigger4 = anim = 3200 && animelem = 2
trigger5 = stateno = 3220 && animelemtime(1) = 1
time = 45
color = 0
mul = 0, 0, 256

[State -3, Level 2 Super BGPalFX]
type = bgpalfx
trigger1 = stateno = 3020 && animelem = 5
trigger2 = stateno = 3060 && animelem = 2
time = 45
color = 0
mul = 192, 0, 256

[State -3, Level 3 Super BGPalFX]
type = bgpalfx
trigger1 = stateno = 4000 && time = 3
trigger2 = stateno = 4100 && animelemtime(1) = 3
trigger3 = stateno = 4200 && anim = 4200 && animelem = 2
time = 45
color = 0
mul = 256, 0, 0

[State -3, Super Portrait]
type = explod
triggerall = stateno = [3000, 4999]
trigger1 = stateno = 3000 && animelem = 2
trigger2 = stateno = 3050 && animelem = 2
trigger3 = stateno = 3100
trigger3 = anim = 3100 && animelemtime(1) = 3
trigger4 = stateno = 3200
trigger4 = anim = 3200 && animelem = 2
trigger5 = stateno = 3220 && animelemtime(1) = 1
trigger6 = stateno = 3020 && animelem = 5
trigger7 = stateno = 3060 && animelem = 2
trigger8 = stateno = 4000 && time = 3
trigger9 = stateno = 4100 && animelemtime(1) = 3
trigger10 = stateno = 4200
trigger10 = anim = 4200 && animelem = 2
anim = 6102
ID = 6102
postype = back
pos = -160, ifelse((gamewidth / gameheight) > 1.55, -20, 0)
bindtime = 1
supermovetime = 180
vel = 6, 0
accel = -0.1333, 0
under = 1
ownpal = 1
removeongethit = 1

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Jump Reset]
type = mapset
trigger1 = map(superjump)
trigger1 = stateno != 40
trigger1 = statetype != A || movetype = H
map = "superjump"
value = 0

[State -3, Victory Camera]
type = mapset
trigger1 = roundstate != 4
map = "victorycam"
value = 0

[State -3, Victory Camera]
type = mapset
trigger1 = map(cfg_winzoom)
trigger1 = map(zoom_allowed)
trigger1 = alive && !standby
trigger1 = winKO
trigger1 = stateno > 180
trigger1 = roundstate = 4
trigger1 = camerazoom <= 1
trigger1 = screenpos y = [0, gameheight]
trigger1 = numenemy
trigger1 = p2, incustomstate = 0
map = "victorycam"
value = 1

[State -3, Victory Camera]
type = zoom
trigger1 = map(victorycam)
scale = 1.0 / camerazoom
lag = 0.92
stagebound = 1
camerabound = 0
pos = pos x * camerazoom, 0

[State -3, Victory BGM]
type = mapset
map = "victorybgm"
trigger1 = map(victorybgm) != 0
trigger1 = motifstate(victoryscreen) = 0
value = 0

[State -3, Victory BGM]
type = mapadd
map = "victorybgm"
trigger1 = map(cfg_victorybgm)
trigger1 = motifstate(victoryscreen)
trigger1 = teamleader = playerno
trigger1 = matchover
trigger1 = alive
trigger1 = win
value = 1

[State -3, Victory BGM];Assertspecial nomusic does not work here
type = playbgm
trigger1 = map(cfg_victorybgm)
trigger1 = map(victorybgm) = [1, 5]
bgm = ""

[State -3, Victory BGM]
type = playbgm
trigger1 = map(cfg_victorybgm)
trigger1 = map(victorybgm) = 6
bgm = "psgwin.mp3"
loop = 0
volume = 100

[State -3, Antifreeze]
type = changestate
triggerall = !ctrl
triggerall = time >= 300
triggerall = roundstate = 2
trigger1 = pos y > 0 && screenpos y > gameheight
trigger2 = !selfanimexist(anim)
value = 5040

[State -3, Antifreeze]
redirectID = p2, ID
type = selfstate
trigger1 = numenemy
trigger1 = movetype != A
trigger1 = p2, time >= 300
trigger1 = p2, incustomstate
trigger1 = p2, stateowner, playerno = playerno
value = 5040


;========================================<IKEMEN ENGINE FIXES>========================================
;Probably temporary

[State -3, OTG Position Fix]; TODO: Is this duplicated?
redirectID = p2, ID
type = posset
trigger1 = numenemy
trigger1 = alive && !standby
trigger1 = p2, pos y
trigger1 = p2stateno = [5080, 5081]
y = 0
ignorehitpause = 1


;==================================================================================================
;===========================================<STATE -4>=============================================
;==================================================================================================
[Statedef -4]

[State -4, Damage Scaling - Helper Multiplier]
type = attackmulset
trigger1 = ishelper
value = root, map(damagescaling)
ignorehitpause = 1
