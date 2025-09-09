; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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


;====================<CROUCHING>====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
triggerall = !time
trigger1 = anim = 12
trigger2 = anim = 47
value = 10
elem = 3 - animelemno(0)

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
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6
trigger1 = !animtime
value = 11


[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 10
value = 12
elem = 3 - animelemno(0)

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;====================<WALKING>====================
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

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
movetype = I
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

[State 40, Direction AI Aerial Rave]
type = varset
trigger1 = AIlevel
trigger1 = prevstateno = 420
sysvar(1) = 1

[State 40, High Jump]
type = mapset
trigger1 = !time
map = "jumptype"
value = 0

[State 40, High Jump]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
trigger1 = map(cmd_highjump)
map = "jumptype"
value = 3

[State 40, High Jump]
type = mapset
trigger1 = !time
trigger1 = AIlevel
trigger1 = p2bodydist x > 80 && p2statetype != L
trigger1 = random < 333
map = "jumptype"
value = 3

[State 40, Running Jump]
type = mapset
trigger1 = prevstateno = 100
map = "jumptype"
value = 3

[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
sysvar(1) = 1

[State 40, Low Jump]
type = mapset
trigger1 = !AIlevel
trigger1 = command != "holdup"
trigger1 = map(jumptype) != [1, 2]
map = "jumptype"
value = ifelse((map(jumptype) = 3 && sysvar(1)), 2, 1)

[State 40, Low Jump]
type = mapset
trigger1 = AIlevel
trigger1 = !animtime
trigger1 = map(jumptype) != [1, 2]
trigger1 = p2statetype = S || p2statetype = C
trigger1 = p2bodydist x < 70
trigger1 = random < ifelse(sysvar(1) = 1, 500, 125)
trigger1 = random < ifelse(p2statetype = C, 500, 250)
map = "jumptype"
value = ifelse((map(jumptype) = 3 && sysvar(1)), 2, 1)

[State 40, Jump Cancel]
type = mapset
trigger1 = prevstateno = 420
map = "jumptype"
value = 3

[State 40, Jump Cancel]
type = mapset
trigger1 = prevstateno = 420
map = "juggle_count"
value = 0

[State 40, Sound]
type = playsnd
trigger1 = !animtime
value = 0, ifelse(map(jumptype) = [2, 3], 41, 40)

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Short]
type = velset
trigger1 = !animtime && map(jumptype) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Vel Medium]
type = velset
trigger1 = !animtime && map(jumptype) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Vel Long]
type = velset
trigger1 = !animtime && map(jumptype) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

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
value = ifelse(!vel x, 41, ifelse(vel x > 0, 42, 43)) + 10 * (map(jumptype) = [1, 2])
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = map(jumptype) = 1 || map(jumptype) = 2
flag = noairguard

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP FALL -----
[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP LAND -----
[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 1; state -1 only sees this in the next frame
velset = 0, 0
sprpriority = 1

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Hop Recovery]
type = changeanim
trigger1 = !time
trigger1 = map(jumptype) = 1 || map(jumptype) = 2
trigger1 = prevstateno = [600, 699]
value = 57

[State 52, Hop Recovery]
type = ctrlset
trigger1 = !time
trigger1 = anim = 57
value = 0

[State 52, Disable Trip Guard]; this is a bit different between Mugen and Ikemen
type = assertspecial
trigger1 = !time
trigger1 = prevstateno != [5000, 5999] && prevmovetype != H
trigger1 = prevstateno != 50 && prevstateno != 51 && prevstateno != [120, 155]
trigger1 = prevstateno != 703; air parry
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

[State 52, No Walk]
type = assertspecial
trigger1 = animtime
trigger1 = anim != 5
flag = nowalk

[State 52, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RUN>===========================
[Statedef 100]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Sound]
type = playsnd
trigger1 = !time
value = 0, 100

[State 100, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Pos]
type = posset
trigger1 = 1
y = 0

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, steps]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump]
type = changestate
trigger1 = AIlevel
trigger1 = random < 25
value = 40

[State 100, End]
type = changestate
triggerall = time >= 9
trigger1 = !AIlevel
trigger1 = command != "holdfwd" || command = "holdback"
trigger2 = AIlevel && (p2movetype = A || p2dist x < 80)
trigger3 = p2dist x < -const(size.ground.back)
value = 101


;----- STOP -----
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 101, Dust]
type = explod
trigger1 = !time
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdup"
value = 40

[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


;========================<FORWARD DASH>==========================
[Statedef 102]
type = S
physics = N
movetype = I
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = time <= 5
trigger1 = !AIlevel
trigger1 = command != "holdfwd"
trigger2 = AIlevel && p2bodydist x < 120
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = time = 5 && sysvar(1)
value = 100

[State 102, Freeze]
type = changeanim
trigger1 = time <= 1
trigger2 = time < 5
trigger2 = sysvar(1) = 1
value = 102
elem = 1

[State 102, Vel]
type = veladd
trigger1 = vel x
x = -0.50

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = 11.00
y = 0

[State 102, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 102, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, End]
type = changestate
trigger1 = !animtime
value = 103


;----- LAND -----
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 103, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<BACK DASH>==========================
[Statedef 105]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Vel]
type = veladd
trigger1 = vel x
x = 0.50

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, End]
type = changestate
trigger1 = !animtime
value = 106


;----- LAND -----
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Sound]
type = playsnd
trigger1 = !time
value = 0, 106

[State 106, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

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
physics = A

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
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
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
trigger1 = 1
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

;[State 132, Stop guarding was here]


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
physics = A

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
trigger1 = 1
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


;====================<PARRY>====================
;----- STANDING -----
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1 || map(parry_helper_ID) := 0
trigger1 = gethitvar(ID)
trigger1 = playerIDexist(gethitvar(ID))
trigger1 = playerID(gethitvar(ID)), ishelper
trigger1 = 1 || map(parry_helper_ID) := gethitvar(ID)

[State Freeze Parried Helper]
redirectID = map(parry_helper_ID)
type = modifyplayer
trigger1 = !time
trigger1 = playerIDexist(map(parry_helper_ID))
trigger1 = playerID(map(parry_helper_ID)), movetype = A
hitpausetime = 15

[State 700, Consecutive Parries]
type = posadd
trigger1 = !time
trigger1 = map(parry_nowalk) > 0
x = -8

[State 700, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 700, No walking]
type = mapset
trigger1 = 1
map = "parry_nowalk"
value = 4

[State 700, Sound]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0

[State 700, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 700, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 36, -65
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 700, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- CROUCHING -----
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1 || map(parry_helper_ID) := 0
trigger1 = gethitvar(ID)
trigger1 = playerIDexist(gethitvar(ID))
trigger1 = playerID(gethitvar(ID)), ishelper
trigger1 = 1 || map(parry_helper_ID) := gethitvar(ID)

[State Freeze Parried Helper]
redirectID = map(parry_helper_ID)
type = modifyplayer
trigger1 = !time
trigger1 = playerIDexist(map(parry_helper_ID))
trigger1 = playerID(map(parry_helper_ID)), movetype = A
hitpausetime = 15

[State 701, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 701, No walking]
type = mapset
trigger1 = 1
map = "parry_nowalk"
value = 4

[State 701, Sound]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0

[State 701, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 701, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 27, -21
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 701, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- JUMPING -----
[Statedef 702]
type = A
physics = N
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1 || map(parry_helper_ID) := 0
trigger1 = gethitvar(ID)
trigger1 = playerIDexist(gethitvar(ID))
trigger1 = playerID(gethitvar(ID)), ishelper
trigger1 = 1 || map(parry_helper_ID) := gethitvar(ID)

[State Freeze Parried Helper]
redirectID = map(parry_helper_ID)
type = modifyplayer
trigger1 = !time
trigger1 = playerIDexist(map(parry_helper_ID))
trigger1 = playerID(map(parry_helper_ID)), movetype = A
hitpausetime = 15

[State 702, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 702, Sound]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0

[State 702, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 41, -64
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 702, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 702, End]
type = changestate
trigger1 = !animtime
value = 703
ctrl = 1


[Statedef 703]
type = A
physics = N
movetype = I
anim = 703
ctrl = 1

[State 703, Vel]
type = velset
trigger1 = !time
x = vel x
y = ifelse(vel y < -2.5, vel y, -2.5)

[State 703, Accel]
type = gravity
trigger1 = time > 0

[State 703, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- HELPER -----
[Statedef 705]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 706, ifelse(root, statetype = A, 707, 705))
velset = 0, 0
ctrl = 0

[State 705, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 705, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "D"
trigger2 = root, AIlevel
trigger2 = (root, statetype != A) && p2statetype = C
value = 706

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "F"
trigger2 = root, AIlevel
trigger2 = anim != 706
value = ifelse((root, statetype = A), 707, 705)

[State 705, Anim]
type = changeanim
trigger1 = anim = 705 || anim = 707
value = ifelse((root, statetype = A), 707, 705)

[State 705, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 8, 10)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = root, stateno != [700, 702]
trigger3 = root, stateno != 5120
trigger4 = root, stateno = [120, 155]
trigger4 = root, stateno != 140
var(0) = 1

[State 705, Disable]
type = varset
triggerall = !var(0)
triggerall = !(root, AIlevel)
trigger1 = root, p2dist x >= 0
trigger1 = root, command = "holdback"
trigger2 = root, p2dist x < 0
trigger2 = root, command = "holdfwd"
trigger3 = time < 5
trigger3 = root, p2dist x >= 0
trigger3 = (root, command = "holdfwd" + root, command = "holddown") > 1
trigger4 = time < 5
trigger4 = root, p2dist x < 0
trigger4 = (root, command = "holdback" + root, command = "holddown") > 1
trigger5 = time >= 5
trigger5 = root, p2dist x >= 0
trigger5 = root, command = "holdfwd" || root, command = "holddown"
trigger6 = time >= 5
trigger6 = root, p2dist x < 0
trigger6 = root, command = "holdback" || root, command = "holddown"
trigger7 = time >= 1
trigger7 = anim = 705 || anim = 707
trigger7 = root, command = "D"
trigger8 = time >= 1
trigger8 = anim = 706
trigger8 = ifelse(root, p2dist x < 0, root, command = "B", root, command = "F")
var(0) = 1

[State 705, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9999

[State 705, Standing / Air]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 705 || anim = 707
trigger1 = (root, stateno != 5120) || !(root, animtime)
reversal.attr = SCA, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Crouching]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 706
reversal.attr = SC, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr =
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 705, End]
type = destroyself
trigger1 = time >= 23
trigger2 = root, movetype != I
trigger3 = root, ctrl = 0
trigger3 = root, stateno != [700, 702] && root, stateno != 5120
trigger4 = root, stateno = [700, 702]
trigger4 = root, time <= 1


;----- Success -----
[Statedef 706]
movetype = I
ctrl = 0

[State 706, Disable]
type = varset
trigger1 = 1
var(0) = 1

[State 706, End]
type = destroyself
trigger1 = root, stateno = [700, 702]
trigger2 = time >= 2


;==========<DODGE>==========
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 710, Sound]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 710, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 4
;channel = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0

[State 710, HB]
type = hitby
trigger1 = animtime != 0
value = SCA, AT
time = 1

[State 710, Attack]
type = changestate
trigger1 = !AIlevel
trigger1 = time = [15, 25]
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
value = ifelse((command = "a" || command = "b" || command = "c"), 241, 220)

[State 710, Attack]
type = changestate
trigger1 = AIlevel
trigger1 = time = [15, 25]
trigger1 = !inguarddist
trigger1 = p2dist y >= -60
trigger1 = abs(map(truebodydistx)) < 60
value = ifelse(abs(map(truebodydistx)) < 30, 241, 220)

[State 710, AI Guard]
type = assertinput
trigger1 = AIlevel
trigger1 = animtime = [-10, -1]
trigger1 = facing = 1
flag = L

[State 710, AI Guard]
type = assertinput
trigger1 = AIlevel
trigger1 = animtime = [-10, -1]
trigger1 = facing = -1
flag = R

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<ROLL>==========
;----- FORWARD -----
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 250, 0, ifelse(random < 333, 1, ifelse(random < 500, 3, 4)))
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 5.34

[State 720, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 720, Push]
type = playerpush
trigger1 = animelemtime(9) < 0
value = 0

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- BACK -----
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 250, 0, ifelse(random < 333, 1, ifelse(random < 500, 3, 4)))
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 2
x = -4.01

[State 725, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 725, Push]
type = playerpush
trigger1 = animelemtime(9) < 0
value = 0

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<POWER CHARGE>==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 740, Power]
type = poweradd
trigger1 = 1
value = 4 + ifelse(time < 60, 0, (time - 60) / 15)

[State 740, Sound]
type = playsnd
trigger1 = time = 8
value = 3, 2
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(7241)
helpertype = normal
stateno = 7241
ID = 7241
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Aura]
type = helper
trigger1 = animelemtime(5) >= 0 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 740, End]
type = changestate
triggerall = time >= 24
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel
trigger2 = command != "/b" || command != "/y"
trigger3 = AIlevel
trigger3 = inguarddist || p2bodydist x <= 120
trigger4 = AIlevel
trigger4 = p2movetype = A
trigger4 = p2stateno = [3000, 4999] || (p2, vel x * p2, facing * facing) < -1
value = 741


;----- END -----
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 0

[State 741, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 741, Sound]
type = playsnd
trigger1 = !time
trigger1 = power >= const(data.power)
value = 4, 15
channel = 0

[State 741, End]
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
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
map = "strength"
value = ifelse((command = "counter_a" + command = "counter_b" + command = "counter_c") >= 2, 1, 0)
ignorehitpause = 1

[State 750, Strength AI]
type = mapset
trigger1 = !time
trigger1 = AIlevel
map = "strength"
value = ifelse((p2statetype = A), 0, ifelse((p2statetype = C), 1, ifelse(random < 500, 0, 1)))
ignorehitpause = 1

[State 750, Sound]
type = playsnd
trigger1 = !time
value = 3, 0
channel = 0

[State 750, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
time = 5

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 23, -74
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 10
movetime = 10
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0

[State 750, Guard Points]
type = guardpointsadd
trigger1 = !time
value = -min((guardpoints - 1), 300)

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(map(strength) = 1, 2910, 2900)


;====================<CUSTOM COMBO>====================
;----- GROUND -----
[Statedef 760]
type = S
physics = S
movetype = A
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 760, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 8

[State 760, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 760, Var]
type = mapset
trigger1 = time >= 4
map = "customcombo"
value = 300

[State 760, Sound]
type = playsnd
trigger1 = time = 4
value = 4, 11
channel = 0

[State 760, Superpause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = -4, -56
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 760, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1
darken = 0

[State 760, Afterimage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- AIR -----
[Statedef 765]
type = A
physics = N
movetype = A
anim = 765
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 765, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 8

[State 765, Var]
type = mapset
trigger1 = time >= 4
map = "customcombo"
value = 300

[State 765, Sound]
type = playsnd
trigger1 = time = 4
value = 4, 11
channel = 0

[State 765, Superpause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = 1, -84
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 765, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1
darken = 0

[State 765, Afterimage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 765, End]
type = changestate
trigger1 = !animtime
value = 766
ctrl = 1

[State 765, Freeze]
type = posfreeze
trigger1 = 1
value = 1


[Statedef 766]
type = A
physics = N
movetype = I
anim = 766
ctrl = 1

[State 766, Accel]
type = gravity
trigger1 = 1

[State 766, Land]
type = changestate
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
value = 11, 3

[State 5950, Sound]
type = playsnd
trigger1 = animelem = 3
value = F 7, 0
freqmul = 1.2

[State 5950, FX]
type = explod
trigger1 = animelem = 3
anim = F 60
postype = p1
pos = -5 * const(size.xscale), 0
scale = 0.67, 0.67
sprpriority = -10
ownpal = 1

[State 5950, Pos]
type = posadd
trigger1 = animelem = 7
x = ceil(-16 * const(size.xscale))

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


;==========<TAUNT>==========
[Statedef 195]
type = S
physics = S
movetype = A
anim = 195
velset = 0, 0
sprpriority = 2
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)
ctrl = 0

[State 195, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 195, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
ID = 195
attr = S, SA
damage = 10, 0
animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -40) * (map(sparkx.max) := 40), map(sparky) := -70
hitsound = s2, 12
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 18
down.hittime = 18
ground.velocity = -4, -8
guard.velocity = -10.52
air.type = Low
air.velocity = -4, -8
down.velocity = -4, -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
;envshake.time = 9
;envshake.freq = 60
;envshake.ampl = ifelse((gametime % 2), -1, 1)
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
forcenofall = !map(customcombo)

[State 195, Aura]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 195, Kanji]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
name = "Kanji"
postype = p1
pos = -5, -100
facing = ifelse(facing = -1, -1, 1)
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 195, Afterimage]
type = explod
trigger1 = animelem = 5
ID = 195
postype = p1
pos = 0, 0
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 16
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
interpolation.time = 16
interpolation.alpha = 0, 256
interpolation.scale = 1.15 * const(size.xscale), 1.15 * const(size.yscale)
removeonchangestate = 1
ownpal = 1

[State 195, Sound]
type = playsnd
trigger1 = animelem = 6
value = 4, 6
channel = 0

[State 195, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 5

[State 195, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 195, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 195, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<LOSE (Time over)>==========
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 170, Dust]
type = explod
trigger1 = animelem = 2
anim = 7102
ID = 7102
sprpriority = -10
postype = p1
pos = -6, 0
ownpal = 1
scale = 0.33, 0.33

[State 170, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 52


;==========<DRAWGAME (Time over)>==========
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0

[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 175, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -5, 8
ownpal = 1

[State 175, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 5


;==========<INITIALIZE>==========
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

[State 5900, Set PalFX 1 Colors]
type = null
;Magenta
trigger1 = palno = 8
trigger1 = 1 || map(palfx1_r) := 256 || map(palfx1_g) := 0 || map(palfx1_b) := 128
;Orange
trigger2 = palno = 9
trigger2 = 1 || map(palfx1_r) := 256 || map(palfx1_g) := 128 || map(palfx1_b) := 0
;Blue
trigger3 = palno = 10
trigger3 = 1 || map(palfx1_r) := 0 || map(palfx1_g) := 128 || map(palfx1_b) := 256
;Purple (Default)
trigger4 = 1
trigger4 = 1 || map(palfx1_r) := 128 || map(palfx1_g) := 0 || map(palfx1_b) := 256

[State 5900, End]
type = changestate
trigger1 = time > 0; Wait for enemy to be loaded
value = 5901; Config


;----- After Config -----
[Statedef 5902]
type = S

[State 5902, Intro vs Evil Ryu]
type = changestate
trigger1 = numenemy
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = enemy, var(1) = [2, 3]
value = 6910

[State 5902, Intro vs Vega]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = !roundsexisted
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Vega"
value = 6911

[State 5902, Intro vs Haohmaru]
type = changestate
triggerall = numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, name = "Cvshaohmaru" && enemy, authorname = "Z Sabre User"
trigger2 = enemy, name = "HaohmaruMG" && enemy, authorname = "Master Gouken"
trigger3 = enemy, name = "cvshaohmaru" && enemy, authorname = "Warusaki3"
value = 6912

[State 5902, Intro vs Adon]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Sepp" && enemy, name = "Adon"
value = 6913

[State 5902, Intro vs Evil Ken]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted
trigger1 = enemy, authorname = "Reu" && enemy, name = "Evil Ken"
value = 192

[State 5902, Intro vs Nash]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, name = "Nash" && enemy, authorname = "Phantom.of.the.Server"
value = 194

[State 5902, Turns Intro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, End]
type = changestate
trigger1 = 1
value = ifelse(roundno = 1, 190, 0)


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Vega Exists]
type = varset
trigger1 = !time
var(0) = 0

[State 190, Vega Exists]
type = varset
trigger1 = numhelper(6100)
var(0) = 1

[State 190, Vega Exists]
type = varset
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "cvsgouki" && enemy, authorname = "Warusaki3"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname = "Gargoyle")
trigger4 = enemy, name = "M.Bison" && enemy, authorname = "N-Mario"
trigger5 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger8 = enemy, name = "Cammy" && enemy, authorname = "Phantom.of.the.Server"
trigger9 = enemy, name = "Shining Force 2 Kraken" && enemy, authorname = "Phantom.of.the.Server"
trigger10 = enemy, name = "Sky Chase" && enemy, authorname = "Phantom.of.the.Server"
var(0) = 1

[State 190, Boss Intro]
type = changestate
trigger1 = !var(0)
trigger1 = AIlevel
trigger1 = ishometeam
trigger1 = matchno >= 8
trigger1 = gamemode = "arcade"
value = 193

[State 190, Kill Vega]
type = changestate
triggerall = !time
triggerall = !numpartner && !var(0)
trigger1 = AIlevel
trigger1 = random < 250
trigger2 = !AIlevel
trigger2 = command = "holdup"
value = 194

[State 190, SvC Intro]
type = changestate
trigger1 = 1
trigger1 = random < 250
trigger1 = numpartner = 0 && numenemy = 1
trigger1 = enemy, name != "Shin Gouki" || enemy, authorname != "Phantom.of.the.Server" || enemy, stateno != 6914; no duplicate intro
value = 6914

[State 190, Intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 193))


;==========<INTRO 1 - KANJI>==========
[Statedef 191]
type = S
anim = 191
sprpriority = -2

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 191, Kanji]
type = modifyexplod
trigger1 = numexplod(6010)
trigger1 = roundstate = 0
anim = 6010
ID = 6010

[State 191, Kanji]
type = explod
trigger1 = !time
anim = 6010
ID = 6010
sprpriority = sprpriority + 1
postype = p1
facing = ifelse(facing = -1, -1, 1)
pos = ifelse(facing = -1, 34, 0)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 191, Afterimage]
type = explod
trigger1 = time = 0 || time = 1
ID = 191
postype = p1
pos = 0, 0
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
scale = 1.1 * const(size.xscale), 1.1 * const(size.yscale)
removetime = 90
trans = addalpha
alpha = ifelse(numexplod(191), 128, 256), ifelse(numexplod(191), 128, 0)
interpolation.time = 90
interpolation.alpha = 0, 256
interpolation.scale = const(size.xscale), const(size.yscale)
removeonchangestate = 1
ownpal = 1

[State 191, Afterimage]
type = modifyexplod
trigger1 = 1
ID = 191
index = 0
postype = p1
pos = 1 * cos((gametime + 0) / 45.0 * pi), -1 + 1 * sin((gametime + 5) / 45.0 * pi)
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)

[State 191, Afterimage]
type = modifyexplod
trigger1 = 1
ID = 191
index = 1
postype = p1
pos = 2 * cos((gametime + 10) / 45.0 * pi), -2 + 2 * sin((gametime + 15) / 45.0 * pi)
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)

[State 191, Sound]
type = playsnd
trigger1 = roundstate != 0
trigger1 = animelemtime(2) >= -60
value = 4, 3
channel = 0
persistent = 0

[State 191, Sprite Priority]
type = sprpriority
trigger1 = animelem = 4
value = 0

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 2 - STOMP>==========
[Statedef 192]
type = S
anim = 192
sprpriority = -1

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Wait]
type = assertspecial
trigger1 = roundstate = 0
trigger2 = time < 660
trigger2 = enemy, authorname = "Reu" && enemy, name = "Evil Ken"
flag = animfreeze

[State 192, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 192, Aura]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 192, Kanji]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6002
ID = 6002
name = "Kanji"
postype = p1
pos = -5, -100
facing = ifelse(facing = -1, -1, 1)
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 192, Afterimage]
type = explod
trigger1 = animelem = 7
ID = 192
postype = p1
pos = 0, 0
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 16
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
interpolation.time = 16
interpolation.alpha = 0, 256
interpolation.scale = 1.15 * const(size.xscale), 1.15 * const(size.yscale)
removeonchangestate = 1
ownpal = 1

[State 192, Sound]
type = playsnd
trigger1 = animelem = 7
value = 3, 5
channel = 0

[State 192, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 5

[State 192, Dust]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 192, Shake]
type = envshake
trigger1 = animelem = 7
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 3 - ENERGY>==========
[Statedef 193]
type = S
anim = 193
sprpriority = -2

[State 193, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 193, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 193, Kanji]
type = modifyexplod
trigger1 = numexplod(6015)
trigger1 = animelemtime(1) = 0
anim = ifelse(facing = -1, 6016, 6015)
ID = 6015

[State 193, Kanji]
type = explod
trigger1 = !time
anim = ifelse(facing = -1, 6016, 6015)
ID = 6015
sprpriority = sprpriority + 1
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1

[State 193, Sound]
type = playsnd
trigger1 = !time
value = 5, 11

[State 193, Hadou]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 0
postype = p1
pos = 16, -72
removetime = 600
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 193, Grow]
type = modifyexplod
trigger1 = time < 80
ID = 6020
scale = 0.5 * sin(time / 160.0 * pi), 0.5 * sin(time / 160.0 * pi)

[State 193, Normal]
type = modifyexplod
trigger1 = time >= 80
trigger1 = animelemtime(1) <= 120
ID = 6020
scale = 0.5, 0.5

[State 193, Shrink]
type = modifyexplod
trigger1 = animelemtime(1) > 120
trigger1 = animelemtime(1) <= 270
ID = 6020
scale = 0.5 * cos((animelemtime(1) - 120) / 300.0 * pi), 0.5 * cos((animelemtime(1) - 120) / 300.0 * pi)
trans = addalpha
alpha = ifelse(animelemtime(1) <= 195, 256, 256 - 256 * ((animelemtime(1) - 195) / 75.0)), 256

[State 193, Remove]
type = removeexplod
trigger1 = animelemtime(1) = 270
ID = 6020

[State 193, FX]
type = helper
trigger1 = animelemtime(1) = 120
helpertype = normal
stateno = 6021
ID = 6021
name = "Red Particles"
postype = p1
ownpal = 1

[State 193, Aura]
type = explod
trigger1 = animelemtime(5) < 120
ID = 193
postype = p1
pos = -1 + (random / 500.0), (random / 500.0)
sprpriority = sprpriority + 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 12
trans = addalpha
alpha = 64, 256
scale = const(size.xscale), const(size.yscale)
palfx.time = 12
palfx.color = 0
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
interpolation.time = 12
interpolation.alpha = 0, 256
interpolation.scale = 1.20, 1.20
removeonchangestate = 1
ownpal = 1

[State 193, Dust]
type = explod
trigger1 = !(animelemtime(1) % 12)
trigger1 = animelemtime(1) > 120 && animelemtime(1) <= 240
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ifelse(animelemtime(4) >= 0, 16, 20), 0
ownpal = 1
scale = 0.5, 0.5

[State 193, Sound]
type = playsnd
trigger1 = animelemtime(1) = [100, 239]
value = 5, 12
channel = 4
lowpriority = 1

[State 193, Sound Fade]
type = modifysnd
trigger1 = animelemtime(1) = [240, 260]
channel = 4
volumescale = 100 - 5 * (animelemtime(1) - 240)

[State 193, Sound]
type = playsnd
trigger1 = animelemtime(1) = 170
value = 4, 7
channel = 0

[State 193, Shake]
type = envshake
trigger1 = !(time % 4)
trigger1 = animelemtime(1) = [120, 240]
time = 4
freq = 180
ampl = 1

[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;========================<MISOGI INTRO>=============================
[Statedef 194]
type = A
physics = N
movetype = I
anim = 194
ctrl = 0
sprpriority = -1

[State 194, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 194, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 194, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 1
movecamera = 1, 0

[State 194, Vega]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6100
ID = 6100
name = "Vega"
postype = p1
pos = 20, -pos y
size.shadowoffset = 6
ownpal = 1

[State 194, Palfx]
type = palfx
trigger1 = animelemtime(2) < 0
add = -255, -255, -255
sinadd = 255, 255, 255, 32
time = 8

[State 194, Pos]
type = posadd
trigger1 = !time
y = -240

[State 194, Vel]
type = velset
trigger1 = animelem = 2
y = 20

[State 194, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
trigger1 = animelemtime(5) < 0
y = 0.5

[State 194, Anim]
type = changeanim
trigger1 = time
trigger1 = animelemtime(5) < 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 194
elem = 5
persistent = 0

[State 194, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0

[State 194, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0

[State 194, Eye]
type = explod
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
ID = 4111
anim = 8060
postype = p1
pos = -13 * const(size.xscale), -78 * const(size.yscale) - vel y
sprpriority = sprpriority + 1
removetime = 16
trans = addalpha
alpha = 256, 256
scale = 0.025, 0.025 * abs(vel y)
palfx.time = 4
palfx.color = 0
palfx.mul = 256, 0, 0
interpolation.time = 4
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 194, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 194, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 10

[State 194, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1

[State 194, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 10
channel = 0

[State 194, Sound]
type = playsnd
trigger1 = animelem = 25
value = 4, 15
channel = 0

[State 194, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<TURNS INTRO>====================
[Statedef 6900]
type = A
anim = 6900
velset = 0, 0
ctrl = 0

[State 6900, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6900, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 6900, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6900, Pos]
type = posset
trigger1 = !time
x = (-320 + abs(pos x)) * facing

[State 6900, Vel]
type = velset
trigger1 = roundstate != 0
x = (helper(8999), rootdist x) / -40.0
y = -10.25
persistent = 0

[State 6900, Accel]
type = veladd
trigger1 = roundstate != 0
y = 0.5

[State 6900, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6901


;----- Land -----
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0, 0

[State 6901, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6901, Pos]
type = posset
trigger1 = !time
trigger1 = numhelper(8999)
x = helper(8999), pos x

[State 6901, Pos]
type = posset
trigger1 = !time
y = 0

[State 6901, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0

[State 6901, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6901, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs EVIL RYU>==========
[Statedef 6910]
type = S
physics = N
anim = 6910
sprpriority = 0

[State 6910, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6910, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6910, Screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 6910, Vel]
type = posset
trigger1 = !time
x = -240 * facing

[State 6910, Vel]
type = velset
trigger1 = numenemy
trigger1 = ifelse(enemy, authorname = "Phantom.of.the.Server", roundstate != 0, time = 0)
x = 6
persistent = 0

[State 6910, Sound]
type = playsnd
trigger1 = numenemy
trigger1 = ifelse(enemy, authorname = "Phantom.of.the.Server", roundstate != 0, time = 1)
value = 5, 6
persistent = 0

[State 6910, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0
trigger1 = p2dist x <= 72
value = 6910
elem = 2

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 10
channel = 0

[State 6910, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0

[State 6910, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -36 * facing

[State 6910, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80

[State 6910, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0

[State 6910, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 6910, Grab Sound]
type = playsnd
trigger1 = animelem = 2
value = 2, 800
volumescale = 75

[State 6910, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
value = 2, 0
channel = 2

;[State 6910, Spark]
;in ZSS

[State 6910, Shake]
type = envshake
trigger1 = teamside = 1
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
time = 12
freq = 180
ampl = ifelse((gametime % 2), -2, 2)

[State 6910, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 72 && animelemtime(3) < 0
value = 6910
elem = 3

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5000, 3
channel = 0

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 3 && teamside = 1
value = 7, 1

[State 6910, Lightning]
type = helper
trigger1 = animelem = 3 && teamside = 1
helpertype = normal
stateno = 7250
ID = 7250
postype = left
pos = 160, -60
ownpal = 1
supermovetime = 999

[State 6910, Vel]
type = velset
trigger1 = animelem = 3
x = -6

[State 6910, Pos]
type = posset
trigger1 = animelemtime(3) >= 0 && (helper(8999), rootdist x <= 0)
x = helper(8999), pos x

[State 6910, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && (helper(8999), rootdist x <= 0)
x = 0

[State 6910, End]
type = changestate
trigger1 = !animtime
value = 0


;========================<INTRO vs VEGA>=============================
[Statedef 6911]
type = A
physics = N
movetype = I
anim = 6911
ctrl = 0
sprpriority = -1

[State 6911, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6911, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0

[State 6911, Palfx]
type = palfx
trigger1 = animelemtime(2) <= 0
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7

[State 6911, Pos]
type = posset
trigger1 = !time
y = -240

[State 6911, Sound]
type = playsnd
trigger1 = roundstate != 0
trigger1 = enemy, authorname = "Phantom.of.the.Server"
trigger2 = time = 5
trigger2 = enemy, authorname != "Phantom.of.the.Server"
value = 4, 7
channel = 0
persistent = 0

[State 6911, Anim]
type = changeanim
trigger1 = roundstate = 0
trigger1 = enemy, authorname = "Phantom.of.the.Server"
value = 6911
elem = 1

[State 6911, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 6911, Vel]
type = velset
trigger1 = animelem = 2
y = 15

[State 6911, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 9

[State 6911, Eye]
type = explod
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
ID = 4111
anim = 8060
postype = p1
pos = -18 * const(size.xscale), -78 * const(size.yscale) - vel y
sprpriority = sprpriority + 1
removetime = 16
trans = addalpha
alpha = 256, 256
scale = 0.025, 0.025 * abs(vel y)
palfx.time = 4
palfx.color = 0
palfx.mul = 256, 0, 0
interpolation.time = 4
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 6911, Anim]
type = changeanim
trigger1 = time
trigger1 = animelemtime(5) < 0
trigger1 = pos y > -vel y
value = 6911
elem = 5
persistent = 0

[State 6911, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0

[State 6911, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0

[State 6911, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 6911, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 10

[State 6911, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1

[State 6911, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs HAOHMARU>==========
[Statedef 6912]
type = S
anim = 6912
sprpriority = -2

[State 6912, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6912, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 6912, Kanji]
type = explod
trigger1 = !time
anim = 6014
ID = 6014
sprpriority = sprpriority + 1
postype = p1
facing = ifelse(facing = -1, -1, 1)
pos = ifelse(facing = -1, 34, 0)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 6912, Sound]
type = playsnd
trigger1 = time = 180
value = 4, 15
channel = 0

[State 6912, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs ADON by Sepp>==========
[Statedef 6913]
type = S
anim = 6913
sprpriority = -1

[State 6913, Intro]
type = assertspecial
trigger1 = 1
flag = intro
ignorehitpause = 1

[State 6913, Sound]
type = playsnd
trigger1 = animelemtime(2) < 0 && time = 15
value = 4, 3
channel = 0
persistent = 0

[State 6913, Anim]
type = changeanim
trigger1 = animelemtime(5) > 0 && animelemtime(6) < 0
value = 6913
elem = 5

[State 6913, Anim]
type = changeanim
trigger1 = animelemtime(6) < 0 && (p2, anim = 1220) && (p2, vel x > 0) && p2dist x <= 102
value = 6913
elem = 6

[State 6913, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 14

[State 6913, Dust]
type = explod
trigger1 = animelem = 6
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -35
vel = -0.5, 0
ownpal = 1
scale = 0.5, 0.5

[State 6913, Sound]
type = playsnd
trigger1 = animelem = 11
value = 4, 10
channel = 0

[State 6913, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
movetype = A

[State 6913, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, NA
animtype = Up
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -76
hitsound = s2, 3
hitsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 16
ground.velocity = -1, -6
air.type = High
air.velocity = -1, -6
getpower = 0, 0
givepower = 0
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
sprpriority = 1

[State 6913, Aura]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 6913, Kanji]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6002
ID = 6002
name = "Kanji"
postype = p1
pos = -5, -100
facing = ifelse(facing = -1, -1, 1)
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 6913, Sound]
type = playsnd
trigger1 = animelem = 24
value = 4, 13
channel = 0

[State 6913, Sound]
type = playsnd
trigger1 = animelem = 24
value = 5, 5

[State 6913, Dust]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 6913, Shake]
type = envshake
trigger1 = animelem = 24
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 6913, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 5 - SVC CHAOS>==========
[Statedef 6914]
type = S
anim = 6914
sprpriority = -2

[State 6914, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6914, Wait]
type = assertspecial
trigger1 = roundstate = 0
trigger2 = p2stateno != 0
trigger2 = time < 300
flag = animfreeze

[State 6914, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 20

[State 6914, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 7
channel = 0

[State 6914, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 21

[State 6914, Black]
type = envcolor
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
value = 0, 0, 0

[State 6914, Black]
type = assertspecial
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 6914, Closeup]
type = explod
trigger1 = animelemtime(2) = [0, 2]
ID = 6030
anim = 6030
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
trans = addalpha
alpha = 64, 256
removetime = abs(animelemtime(3))
removeonchangestate = 1
ontop = 1

[State 6914, Afterimage]
type = afterimage
trigger1 = animelem = 3
time = abs(animelemtime(4))
timegap = 1
framegap = 1
length = 3
palbright = 0, 0, 0
palcontrast = 256, 256, 256
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = addalpha
alpha = 128, 128

[State 6914, Large Dust Front]
type = explod
trigger1 = animelem = 4
ID = 7107
anim = 7107
animelem = 5
sprpriority = 5
trans = addalpha
alpha = 256, 256
postype = p1
pos = 0, 0
ownpal = 1

[State 6914, Shake]
type = envshake
trigger1 = animelem = 4
time = 24
freq = 180
ampl = 4
mul = 0.8

[State 6914, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S
ctrl = 0
velset = 0, 0

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = randomrange(1, 15)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Ryu"
trigger2 = enemynear, name = "cvsryu" || enemynear, name = "svcryu"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Gen"
trigger2 = enemynear, name = "cvsgen" || enemynear, name = "MasterGen"
value = 51

[State 180, No turning]
type = assertspecial
trigger1 = prevstateno = 4190
flag = noautoturn

[State 180, winSGS / misogi]
type = changestate
trigger1 = prevstateno = 4090 || prevstateno = 4190
value = prevstateno

[State 180, Win]
type = changestate
trigger1 = !time
trigger1 = command = "/x" || command = "/y" || command = "/z" || command = "/a" || command = "/b" || command = "/c"
value = ifelse((command = "/z" || command = "/c"), 183, ifelse((command = "/y" || command = "/b"), 181, 182))

[State 180, Win]
type = changestate
trigger1 = !time
value = ifelse(random < 333, 181, ifelse(random < 500, 182, 183))


;==========<WIN 1 - TURN>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
velset = 0, 0

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 181, Sprite Priority]
type = sprpriority
trigger1 = animelem = 2
value = -4

[State 181, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(life < (lifemax * 0.10), 16, ifelse(life < (lifemax * 0.667), 8, 1))
channel = 0

[State 181, Kanji]
type = explod
trigger1 = animelemtime(4) = 15
anim = 6011
ID = 6011
sprpriority = sprpriority + 1
postype = p1
facing = ifelse(facing = -1, -1, 1)
pos = ifelse(facing = -1, 34, 0)
bindtime = -1
removeongethit = 1
ownpal = 1


;==========<WIN 2 - FLEX>==========
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
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0


;==========<WIN 3 - STOMP>==========
[Statedef 183]
type = S
anim = 183
ctrl = 0
velset = 0, 0

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Aura]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 183, Kanji]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
name = "Kanji"
postype = p1
pos = -5, -100
facing = ifelse(facing = -1, -1, 1)
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 5

[State 183, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 13
channel = 0

[State 183, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 183, Shake]
type = envshake
trigger1 = roundstate = 4;not in continue screen
trigger1 = animelemtime(5) >= 0
trigger1 = !(time % 4)
time = 4
freq = 180
ampl = 1

[State 183, Sound]
type = playsnd
trigger1 = roundstate = 4
trigger1 = animelemtime(5) >= 0
value = 5, 12
channel = 5
lowpriority = 1


;==========<WIN by S.G.S.>==========
[Statedef 4090]
type = S
anim = 4090
velset = 0, 0
ctrl = 0
sprpriority = -4

[State 4090, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 4090, Remove Kanji]
type = removeexplod
trigger1 = !time
trigger1 = numexplod(6013)
ID = 6013

[State 4090, Kanji Back]
type = explod
trigger1 = !time
trigger1 = prevstateno = 4010
ID = 6010
anim = 6012
sprpriority = sprpriority + 1
postype = p1
pos = ifelse(facing = -1, 34, 0)
facing = ifelse(facing = -1, -1, 1)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4090, Kanji Back Brighten]
type = modifyexplod
trigger1 = time <= 30
trigger1 = prevstateno = 4010
ID = 6010
palfx.time = 60
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 240

[State 4090, Kanji Background]
type = helper
trigger1 = !time
trigger1 = prevstateno = 4010
trigger1 = !numhelper(8690) && !numhelper(8600)
helpertype = normal
stateno = 8690
ID = 8690
postype = left
ownpal = 1

[State 4090, Sound]
type = playsnd
trigger1 = time = 10
trigger1 = prevstateno = 4010
value = 4, 12
channel = 0

[State 4090, Allow Round End]
type = ctrlset
trigger1 = time >= 120
trigger1 = roundstate = [2, 3]
trigger1 = time > (fightscreenvar(round.over.hittime) + fightscreenvar(round.over.waittime) + fightscreenvar(round.over.wintime) + fightscreenvar(round.over.wintime))
trigger1 = !numhelper(8690)
value = 1


;==========<WIN by MISOGI>==========
[Statedef 4190]
type = S
velset = 0, 0
ctrl = 0
sprpriority = -4

[State 4190, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 4190, No turning]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 4190, Anim]
type = changeanim
trigger1 = anim != 4190
value = 4190

[State 4190, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 8
channel = 0

[State 4190, Kanji]
type = explod
trigger1 = animelem = 9
anim = 6011
ID = 6011
sprpriority = sprpriority + 1
postype = p1
facing = ifelse(facing = -1, -1, 1)
pos = ifelse(facing = -1, 34, 0)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4190, Allow Round End]
type = ctrlset
trigger1 = time >= 120
trigger1 = roundstate = [2, 3]
trigger1 = time > (fightscreenvar(round.over.hittime) + fightscreenvar(round.over.waittime) + fightscreenvar(round.over.wintime))
value = 1


;==========<CONTINUE?>==========
[Statedef 5500]
type = S
anim = 5500
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


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
y = gethitvar(yaccel)

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
trigger1 = animelem = 1
value = 3, 1
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

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
physics = N
movetype = I
anim = 5210
ctrl = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 3, 1
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
pos = 0, ceil(-74 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[state 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[state 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[state 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[state 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[state 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[state 5210, Back]
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


;==========<RECOVERY ROLL>==========
[Statedef 5220]
type = A
physics = N
movetype = H

[State 5220, Anim]
type = changeanim
trigger1 = anim = 5035
trigger1 = !animtime
value = 5050

[State 5220, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5220, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5221


[Statedef 5221]
type = S
physics = N
movetype = I
anim = 5220
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 5221, Push]
type = playerpush
trigger1 = 1
value = 0

[State 5221, Pos]
type = posset
trigger1 = 1
y = 0

[State 5221, Vel]
type = velset
trigger1 = time = 10
x = 6.15

[State 5221, End]
type = changestate
trigger1 = time >= 29 && command != "holdfwd"
trigger2 = time >= 48
value = 11
ctrl = 1


;========================<TARGET OTG OVERRIDE>========================
[Statedef 1115080]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1115080, Pos]
type = posset
trigger1 = 1
y = 0

[State 1115080, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 1115080, End]
type = changestate
trigger1 = hitshakeover
value = 1115081


[Statedef 1115081]
type = L
physics = C
movetype = H
velset = 0, 0

[State 1115081, Var]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 1115081, End]
type = selfstate
trigger1 = time >= 18
value = 5110


;==================================================================================================
;===========================================<STATE -2>=============================================
;==================================================================================================
[Statedef -2]

[State -2, P2 Custom State - Face First Knockdown]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(1320)
trigger1 = stateno = 1320 || prevstateno = 1320
trigger1 = target(1320), gethitvar(frame)
trigger1 = target(1320), stateno = 5000 || target(1320), stateno = 5010
value = 1390
ID = 1320
ignorehitpause = 1

[State -2, Juggle Increase]
type = null; mapadd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(frame)
trigger1 = target, hitfall
trigger1 = target, movetype = H
trigger1 = target, gethitvar(ID) = ID
map = "juggle_count"
value = 1
ignorehitpause = 1

[State -2, Juggle Reset]
type = null; mapset
triggerall = map(juggle_count)
triggerall = p2, time >= 1
trigger1 = p2movetype != H
trigger2 = p2, hitfall = 0
trigger3 = p2statetype = S || p2statetype = C
trigger4 = p2statetype = L && p2, pos y = 0 && p2, vel y = 0
trigger5 = p2stateno = [120, 155] || p2stateno = 5201 || p2stateno = 5210
trigger6 = moveguarded = 1 || movereversed = 1
trigger7 = roundstate != 2
trigger8 = p2, ctrl
map = "juggle_count"
value = 0
ignorehitpause = 1

[State -2, Aerial Rave Juggle]
type = mapset
trigger1 = time = 1
trigger1 = stateno = 40 && prevstateno = 420
trigger2 = time = 1
trigger2 = stateno = [600, 699]
trigger2 = prevstateno = [600, 699]
map = "juggle_count"
value = 0
ignorehitpause = 1

[State -2, Reset Combo Limits]
type = null
trigger1 = numenemy
trigger1 = p2, time > 0
trigger1 = p2movetype != H || p2stateno = p2, const(statedizzy)
trigger1 = map(jugglereset) || map(wallbounce)
trigger1 = 1 || map(jugglereset) := 0
trigger1 = 1 || map(wallbounce) := 0
ignorehitpause = 1

[State -2, Custom Combo End]
type = mapset
triggerall = map(customcombo) != 0
trigger1 = map(customcombo) < 0
trigger2 = standby
trigger3 = movetype = H
trigger4 = roundstate != 2
trigger5 = stateno = [3000, 4999]
map = "customcombo"
value = 0
ignorehitpause = 1

[State -2, Custom Combo Timer]
type = mapadd
trigger1 = map(customcombo) > 0
map = "customcombo"
value = -1
ignorehitpause = 1

[State -2, Custom Combo Disable Guard]
type = assertspecial
trigger1 = map(customcombo) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = map(customcombo) > 60
time = 2
add = 24 + ceil(sin(map(customcombo) / 16.0 * pi) * 24), 24 + ceil(sin(map(customcombo) / 16.0 * pi) * 24), 24 + ceil(sin(map(customcombo) / 16.0 * pi) * 24)
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = map(customcombo) = [1, 60]
trigger1 = !(gametime % 4)
time = 2
add = 0, 96, 256
ignorehitpause = 1

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
triggerall = numenemy
triggerall = p2, anim != 5300
triggerall = p2stateno != p2, const(statedizzy)
trigger1 = p2stateno = [150, 155]
trigger2 = p2stateno = 51
trigger2 = p2, prevstateno = [140, 155]
trigger3 = p2stateno = 5040
trigger4 = p2stateno = 5120;just in case
trigger5 = p2stateno = 5201
trigger6 = !map(customcombo)
trigger6 = p2movetype = H
trigger6 = p2statetype != A
trigger7 = p2movetype = H
trigger7 = p2statetype = A
trigger7 = p2, hitfall = 0
map = "unthrowable"
value = 3
ignorehitpause = 1

[State -2, Unthrowable Flag - Crumple]
type = mapset
trigger1 = numenemy
trigger1 = numtarget(1510)
trigger1 = p2, ID = target(1510), ID
trigger1 = target(1510), incustomstate
trigger1 = target(1510), stateno = [1520, 1521]
map = "unthrowable"
value = 0
ignorehitpause = 1

[State -2, Damage Scaling - Reset]
type = null
trigger1 = p2movetype != H
trigger1 = p2, dizzy = 0
trigger1 = p2stateno != p2, const(statedizzy)
trigger1 = 1 || map(combototal) := 0
trigger1 = 1 || map(combocheck) := 0
ignorehitpause = 1

[State -2, Damage Scaling - Attack Connected Flag]
type = mapset
trigger1 = movecontact = 1
trigger1 = hitcount <= 1
map = "combocheck"
value = 1
ignorehitpause = 1

[State -2, Damage Scaling - Base Formula]
type = mapset
trigger1 = 1
map = "damagescaling"
value = ifelse(map(combototal) <= 0, 1, ifelse(map(combototal) >= 9, 0.1, 1 - 0.1 * map(combototal)))
ignorehitpause = 1

[State -2, Damage Scaling - Chain Combos]
type = mapset
trigger1 = !map(customcombo)
trigger1 = numtarget
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
trigger1 = ifelse((stateno = 200 || stateno = 201 || stateno = 400), (prevstateno != 200 && prevstateno != 201 && prevstateno != 400 && prevstateno != 430), 1)
trigger1 = ifelse((stateno = 230 || stateno = 430), prevstateno != 430, 1)
map = "damagescaling"
value = 0.75 * map(damagescaling)
ignorehitpause = 1

[State -2, Damage Scaling - Custom Combo Calculation]
type = null
trigger1 = map(customcombo_p2life) < p2, life
trigger1 = map(customcombo_p2life) := p2, life
trigger2 = !map(customcombo)
trigger2 = map(customcombo_p2life) := p2, life
trigger3 = map(customcombo)
trigger3 = map(customcombo_damage) := (map(customcombo_p2life) - p2, life)
ignorehitpause = 1

[State -2, Damage Scaling - Custom Combo]
type = mapset
trigger1 = map(customcombo)
trigger1 = numenemy
map = "damagescaling"
value = max(0.1, ifelse(map(customcombo_damage) <= 0, 1.0, ifelse(map(customcombo_damage) >= 450, 0.1, (500 - map(customcombo_damage)) / 500.0)) * map(damagescaling))
ignorehitpause = 1

[State -2, Damage Scaling - Minimum Super Damage]
type = null
triggerall = stateno = [3000, 4999]
;Level 3
trigger1 = map(superlevel) = 3
trigger1 = map(damagescaling) < 0.5
trigger1 = 1 || map(damagescaling) := 0.5
;Level 2
trigger2 = map(superlevel) = 2
trigger2 = map(damagescaling) < 0.4
trigger2 = 1 || map(damagescaling) := 0.4
;Other
trigger3 = stateno = [3000, 4999]
trigger3 = map(damagescaling) < 0.3
trigger3 = 1 || map(damagescaling) := 0.3
ignorehitpause = 1

[State -2, Meter Scaling]
type = null
trigger1 = map(customcombo)
trigger1 = 1 || map(meterscaling) := 0
trigger2 = !map(customcombo)
trigger2 = 1 || map(meterscaling) := map(damagescaling)
ignorehitpause = 1

[State -2, Damage Scaling - Override Fall Defense Bonus]
redirectID = p2, ID
type = assertspecial
trigger1 = numenemy
trigger1 = p2movetype = H
trigger1 = p2, gethitvar(playerno) = playerno
flag = nofalldefenceup
ignorehitpause = 1

[State -2, Damage Scaling - Long Combo Guts]
type = mapset
trigger1 = numenemy
trigger1 = p2, receiveddamage >= (p2, lifemax * 0.50)
map = "damagescaling"
value = map(damagescaling) * ifelse(p2, receiveddamage >= (p2, lifemax * 0.85), 0.75, ifelse(p2, receiveddamage >= (p2, lifemax * 0.70), 0.90, 0.95))
ignorehitpause = 1

[State -2, Damage Scaling - Root Multiplier]
type = attackmulset
trigger1 = 1
value = map(damagescaling); * ifelse(map(counterhit_buffer), 1.2, 1)
ignorehitpause = 1

[State -2, No Dizzy >:)]
type = selfstate
triggerall = AIlevel >= 8
trigger1 = stateno = const(StateDizzy)
trigger2 = anim = 5300
trigger2 = p2movetype != A
trigger2 = vel y = 0 && pos y = 0
trigger2 = ((enemy, name = "Catwalk") + (enemy, authorname = "Phantom.of.the.Server")) != 2
value = 0
ctrl = 1

[State -2, KO snd]
type = mapset
trigger1 = alive
trigger1 = map(kosound) > 0
trigger2 = !alive
map = "kosound"
value = ifelse(alive, 0, map(kosound) + 1)
ignorehitpause = 1

[State -2, KO snd]
type = playsnd
trigger1 = !alive
trigger1 = map(kosound) = 1
trigger1 = !isasserted(nokosnd)
trigger1 = stateno != 5950
value = 11, ifelse(random < 500, 1, 2)
ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
triggerall = target, time > 0
trigger1 = target, stateno = 5040
trigger2 = target, stateno = 5201
trigger3 = target, movetype != H
trigger3 = target, movereversed = 0
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
value = 5000, (random % 5)
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
value = 5000, (random % 5)
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
value = 5000, (random % 5)
lowpriority = 1
channel = 0

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 4
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
trigger1 = stateno = const(StateGuardBreakRecover)
value = 5000, ifelse(random < 500, 3, 4)
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

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2
triggerall = !numhelper(705)
triggerall = !map(customcombo)
triggerall = ifelse(statetype = A, map(jumptype) != [1, 2], 1)
triggerall = (movetype = I && ctrl) || stateno = [700, 702] || stateno = 5120
trigger1 = !AIlevel
trigger1 = command != "rlsdir"
trigger1 = statetype = S || statetype = C || stateno = 5120
trigger1 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B") || command = "D"
trigger2 = !AIlevel
trigger2 = command != "rlsdir"
trigger2 = statetype = A
trigger2 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B")
trigger3 = AIlevel
trigger3 = inguarddist
trigger3 = stateno != [700, 702]
trigger3 = p2bodydist x < map(ai_p2fireball_distx)
trigger3 = random < (ifelse(life < 100 || guardpoints < 200, 100, 50) * (AIlevelF / 8.0))
trigger4 = AIlevel
trigger4 = inguarddist
trigger4 = stateno != [700, 702]
trigger4 = map(ai_p2fireball_eta) = [1, 8]
trigger4 = random < 200 * (AIlevelF / 8.0)
trigger5 = AIlevel
trigger5 = stateno = [700, 702]
trigger5 = time = 14 && random < (250 + 700 * (AIlevel / 8.0))
helpertype = normal
stateno = 705
ID = 705
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = helper(705), stateno = 706
value = ifelse((helper(705), anim = 707), 702, ifelse((helper(705), anim = 706), 701, 700))
ctrl = 0

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 705)
attr = SA, AP
stateno = 700
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 706)
attr = C, AP
stateno = 701
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 707)
attr = SCA, AP
stateno = 702
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = map(parry_nowalk) > 0
trigger1 = 1 || map(parry_nowalk) := (map(parry_nowalk) - 1)
flag = nowalk

[State -3, ProjContact Reset]
type = mapset
triggerall = map(projcontact)
trigger1 = stateno != 1000 && stateno != 1020 && stateno != [1050, 1053]
trigger1 = stateno != 3000 && (stateno != [3020, 3022]) && stateno != 3050 && stateno != 3070 && stateno != 4200 && stateno != 4300
trigger2 = stateno = 1000 && animelemtime(5) < 0
trigger3 = stateno = 1020 && animelemtime(10) < 0
trigger4 = stateno = 1050 && animelemtime(2) < 0
trigger5 = stateno = 3000 && anim = 3000
trigger6 = stateno = 3020
trigger7 = stateno = 3050 && animelemtime(8) < 0
trigger8 = stateno = 3070 && animelemtime(5) < 0
trigger9 = stateno = 4200 && animelemtime(15) < 0
trigger10 = stateno = 4300 && anim = 4300 && animelemtime(6) < 0
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

[State -3, Projectile Flag]
type = mapset
triggerall = map(projflag) != 1
triggerall = map(customcombo) <= 0
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1020 && numhelper(1025)
trigger2 = helper(1025), stateno = 1025
trigger3 = stateno != 1050 && numhelper(1055)
trigger3 = helper(1055), stateno = 1055
trigger4 = stateno != 1050 && numhelper(1056)
trigger4 = helper(1056), stateno = 1055
trigger5 = stateno != 3000 && numhelper(3005)
trigger5 = helper(3005), stateno = 3005
trigger6 = stateno != [3021, 3022] && numhelper(3025)
trigger6 = helper(3025), stateno = 3025
trigger7 = stateno != 3050 && numhelper(3055)
trigger7 = helper(3055), stateno = 3055
trigger8 = stateno != 3070 && numhelper(3075)
trigger8 = helper(3075), stateno = 3075
trigger9 = stateno != 4200 && numhelper(4206)
trigger9 = helper(4206), stateno = 4206
trigger10 = stateno != 4300 && numhelper(4305)
trigger10 = helper(4305), stateno = 4305
map = "projflag"
value = 1
ignorehitpause = 1

[State -3, Cancel into Normals Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "normalcancel"
value = 0
ignorehitpause = 1

[State -3, Cancel into Normals Check]
type = mapset
triggerall = map(customcombo)
trigger1 = stateno = [200, 699]
trigger1 = movecontact || movereversed
trigger2 = stateno = [1000, 2999] && statetype != A
trigger2 = movecontact || movereversed || map(projcontact)
map = "normalcancel"
value = 1
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
triggerall = stateno = [200, 2999]
trigger1 = map(customcombo) && stateno = [200, 699]
trigger2 = map(customcombo) && stateno = [1000, 2999] && ((movecontact + movereversed) || map(projcontact))
trigger3 = !AIlevel
trigger3 = time <= 2
trigger3 = stateno = [200, 699]
trigger3 = prevstateno != [200, 4999]
trigger4 = stateno = [200, 699]
trigger4 = stateno != 245 && stateno != [255, 256]; Previously 215 too
trigger4 = (movecontact + movereversed) = [1, 12]
trigger5 = stateno = 1341
trigger5 = animelemtime(2) > 0 && map(customcombo)
trigger5 = cond(numtarget, target, gethitvar(isbound) = 0, 1)
trigger6 = stateno = [1351, 1352]
trigger6 = (animelemtime(2) > 0 || stateno = 1352) && map(customcombo)
trigger6 = cond(numtarget, target, gethitvar(isbound) = 0, 1)
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
triggerall = stateno = [200, 2999]
trigger1 = map(specialcancel)
trigger2 = stateno = 245
trigger2 = (movecontact + movereversed) = [1, 12]
trigger3 = stateno = 1000
trigger3 = animelemtime(5) < 12 && map(projcontact) = [1, 12]
trigger4 = stateno = 1020
trigger4 = animelemtime(10) < 24 && map(projcontact) = [1, 12]
trigger5 = stateno = 1050
trigger5 = animelemtime(5) < 12 && map(projcontact) = [1, 12]
trigger6 = stateno = 1100
trigger6 = (movecontact + movereversed) = [1, 24]
trigger7 = stateno = 1200
trigger7 = (movecontact + movereversed) = [1, 12]
trigger8 = stateno = 1250
trigger8 = (movecontact + movereversed) = [1, 12]
trigger9 = stateno = 1310
trigger9 = (movecontact + movereversed) = [1, 12]
trigger10 = stateno = 1320
trigger10 = (movecontact + movereversed) = [1, 12]
trigger11 = stateno = 1330
trigger11 = (movecontact + movereversed) = [1, 12]
trigger12 = stateno = 1510
trigger12 = (movecontact + movereversed) = [1, 12]
map = "supercancel"
value = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "hypercancel"
value = 0
ignorehitpause = 1

[State -3, Hyper Cancel Check]
type = mapset
triggerall = stateno = [3000, 4999]
trigger1 = stateno = 3000
trigger1 = anim = 3001 && map(projcontact) = [1, 12]
trigger2 = stateno = [3021, 3022]
trigger2 = map(projcontact) = [1, 12]
trigger3 = stateno = 3050
trigger3 = animelemtime(8) = [1, 32] && map(projcontact) = [1, 12]
trigger4 = stateno = 3070
trigger4 = animelemtime(35) < 0 && map(projcontact) = [1, 12]
trigger5 = stateno = 3100
trigger5 = (movecontact + movereversed) = [1, 24]
trigger6 = stateno = 3200
trigger6 = (movecontact + movereversed) = [1, 12]
trigger7 = stateno = 3250
trigger7 = (movecontact + movereversed) = [1, 12]
trigger8 = stateno = 4200
trigger8 = animelemtime(15) > 12 && map(projcontact) = [1, 12]
trigger9 = stateno = 4300
trigger9 = animelemtime(7) >= 1 && map(projcontact) = [1, 12]
map = "hypercancel"
value = 1
ignorehitpause = 1

[State -3, Super Cancel Flag Reset]
type = mapset
trigger1 = map(supercancelflag)
trigger1 = (stateno != [3000, 4999]) || movetype = H
map = "supercancel_flag"
value = 0
ignorehitpause = 1

[State -3, Hyper Cancel Flag Reset]
type = mapset
trigger1 = map(hypercancelflag)
trigger1 = (stateno != [3000, 4999]) || movetype = H
map = "hypercancel_flag"
value = 0
ignorehitpause = 1

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1 && !map(customcombo)
trigger1 = stateno = 50 && map(jumptype) = [2, 3]
trigger2 = stateno = [710, 725]
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
trigger1 = stateno = 3000 && time = 3
trigger2 = stateno = 3050 && time = 3
trigger3 = stateno = 3100 && time = 3
trigger4 = stateno = 3200 && time = 3
trigger5 = stateno = 3250 && time = 3
trigger6 = stateno = 3300 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 0, 64, 256
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3020 && time = 3
trigger2 = stateno = 3070 && time = 3
trigger3 = stateno = 4200 && time = 3
trigger4 = stateno = 4300 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 256
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 4000 && time = 3
trigger2 = stateno = 4100
trigger2 = anim = 4101 && animelemtime(1) = 1
trigger3 = stateno = 6910 && time = 1
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || stateno = [600, 699]
trigger1 = (map(jumptype) = 2 || map(jumptype) = 3) && vel y < -1
trigger2 = map(customcombo) > 0
trigger3 = stateno = [710, 725]
trigger4 = stateno = [3000, 4999]
trigger4 = anim != 1101 && anim != 1102 && anim != 3205 && stateno != 4090 && stateno != 4190 && anim != 4301
trigger5 = stateno = 6910 && animelemtime(2) < 0
time = 2
ignorehitpause = 1

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Jump Reset]
type = mapset
trigger1 = map(jumptype)
trigger1 = stateno != 40
trigger1 = statetype != A || movetype = H
map = "jumptype"
value = 0

[State -3, Reset Super Finish Var]
type = mapset
trigger1 = map(superfinish)
trigger1 = roundstate = [0, 2]
map = "superfinish"
value = 0

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = map(customcombo) && !numhelper(8600)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = movecontact = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), map(projcontact)
trigger3 = numhelper(1025)
trigger3 = helper(1025), map(projcontact)
trigger4 = numhelper(1055)
trigger4 = helper(1055), map(projcontact)
trigger5 = numhelper(1056)
trigger5 = helper(1056), map(projcontact)
trigger6 = stateno = 805
trigger6 = animelemtime(4) >= 0 && animelemtime(6) < 0
trigger7 = stateno = 810
trigger7 = animelemtime(4) = [0, 1]
trigger8 = stateno = 815
trigger8 = animelemtime(12) = [0, 1]
trigger9 = stateno = 860
trigger9 = animelemtime(8) = [0, 1]
trigger10 = stateno = 1341
trigger10 = animelemtime(2) = [0, 1]
trigger11 = stateno = 1351
trigger11 = time <= 1
helpertype = normal
stateno = 8600
ID = 8600 + 0 * (map(superfinish) := 900)
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winHyper
triggerall = roundstate = 3
triggerall = !numhelper(8600) && !numhelper(8690)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = movecontact = [1, 4]
trigger1 = stateno = [3000, 4999]
trigger1 = map(superfinish) := stateno
trigger2 = numhelper(3005)
trigger2 = helper(3005), map(projcontact)
trigger2 = map(superfinish) := 3000
trigger3 = stateno = [3021, 3022]
trigger3 = map(projcontact)
trigger3 = map(superfinish) := 3020
trigger4 = numhelper(3025)
trigger4 = helper(3025), map(projcontact)
trigger4 = map(superfinish) := 3020
trigger5 = numhelper(3055)
trigger5 = helper(3055), map(projcontact)
trigger5 = map(superfinish) := 3050
trigger6 = stateno = 3070
trigger6 = map(projcontact)
trigger6 = map(superfinish) := 3070
trigger7 = numhelper(3075)
trigger7 = helper(3075), map(projcontact)
trigger7 = map(superfinish) := 3070
trigger8 = numhelper(4205)
trigger8 = helper(4205), map(projcontact)
trigger8 = map(superfinish) := 4200
trigger9 = numhelper(4206)
trigger9 = helper(4206), map(projcontact)
trigger9 = map(superfinish) := 4200
trigger10 = numhelper(4305)
trigger10 = helper(4305), map(projcontact)
trigger10 = map(superfinish) := 4300
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

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
bgm = "shinwin.mp3"
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


;==================================================================================================
;===========================================<STATE -4>=============================================
;==================================================================================================
[Statedef -4]

[State -4, Helper Damage Scaling - Update Root]
type = null
trigger1 = ishelper
trigger1 = pausetime = 0
trigger1 = !map(combocheck)
trigger1 = movecontact && numtarget
trigger1 = root, map(combocheck) := 1
trigger1 = map(combocheck) := 1
ignorehitpause = 1

[State -4, Damage Scaling - Helper Multiplier]
type = attackmulset
trigger1 = ishelper
value = root, map(damagescaling)
ignorehitpause = 1

[State -4, Helper Juggle Increase]
type = null; rootmapadd
trigger1 = ishelper
trigger1 = movehit = 1
trigger1 = pausetime = 0
trigger1 = numtarget
trigger1 = target, gethitvar(frame)
trigger1 = target, hitfall
trigger1 = target, movetype = H
trigger1 = target, gethitvar(ID) = ID
map = "juggle_count"
value = 1
ignorehitpause = 1
