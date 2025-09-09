; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
trigger1 = (!map(dark) && anim != 0) || (map(dark) && anim != 1)
trigger1 = anim != 5
trigger2 = anim = 5 && !animtime
value = ifelse(map(dark), 1, 0)

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
trigger1 = !time
trigger1 = anim = 12
value = 10
elem = 3 - animelemno(0)

[State 10, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 47
value = 10
elem = 2

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


;==========<WALKING>==========
[Statedef 20]
type = S
physics = S
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

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Pos]
type = posset
trigger1 = 1
y = 0

[State 100, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

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
value = 3, 7
channel = 0
persistent = 0

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
pos = ceil(18 * const(size.xscale)), 0
vel = 2, 0
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


;======================<DASH>===========================
[Statedef 102]
type = S
physics = N
movetype = I
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

[State 102, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 102, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.39

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = 5.6
y = -2.75

[State 102, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
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

[State 105, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.39

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

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
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 106


;----- LAND -----
[Statedef 106]
type = S
physics = S
ctrl = 1
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


;========================<OFF SCREEN>==========================
[Statedef 110]
type = S
physics = S
anim = 100
ctrl = 0
sprpriority = 1

[State 110, Bound]
type = screenbound
trigger1 = anim = 100
value = 0
movecamera = 0, 1

[State 110, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 110, Width]
type = width
trigger1 = 1
value = 8

[State 110, Turn]
type = turn
trigger1 = anim = 100 && (pos x != [-240, 240]) && (frontedgedist < backedgedist)

[State 110, Vel]
type = velset
trigger1 = anim = 100
x = ifelse(backedgedist < -160, 1.5, 1) * const(velocity.run.fwd.x)

[State 110, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 2 || animelem = 5)
value = 0, ifelse((animelem = 2), 103, 106)

[State 110, change]
type = changeanim
trigger1 = anim = 100 && (pos x = [-120, 120])
value = 101
persistent = 0

[State 110, Sound]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0

[State 110, Dust]
type = explod
trigger1 = anim = 101 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = ceil(18 * const(size.xscale)), 0
vel = 2, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 110, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 101
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
;anim = 130

; Sakura has special handling for animation
[State 151, Anim]
type = changeanim
trigger1 = anim != 130
trigger1 = anim != 150
value = 130

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
;anim = 131

; Sakura has special handling for animation
[State 153, Anim]
type = changeanim
trigger1 = anim != 131
trigger1 = anim != 151
value = 131

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
;anim = 132

; Sakura has special handling for animation
[State 155, Anim]
type = changeanim
trigger1 = anim != 132
trigger1 = anim != 152
value = 132

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


;==========<CLASSIC TAUNT>==========
[Statedef 195]
type = S
physics = S
movetype = A
anim = 195
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 195, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 195, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 195, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = 10, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(map(customcombo), 4, 8), ifelse(map(customcombo), 4, 8)
sparkno = -1 + 0 * (map(sparkno) := ifelse(map(cfg_sparks) = 2, 8013, 8010))
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 30), map(sparky) := -79
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 18
air.velocity = -4, -8
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1

[State 195, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 3
channel = 0

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<SLEEPY TAUNT>==========
[Statedef 196]
type = S
physics = S
movetype = I
anim = 196
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 196, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 196, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 20
channel = 0

[State 196, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<HUMILIATE>==========
[Statedef 197]
type = S
movetype = I
physics = S
anim = 197
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 197, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 197, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 4
channel = 0

[State 197, Sound]
type = playsnd
triggerall = time >= 80
trigger1 = animelemtime(6) >= 0 && animelemtime(10) < 0
trigger1 = command = "holdfwd" || command != "holdback"
trigger2 = animelemtime(14) >= 0
trigger2 = command != "holdfwd" || command = "holdback"
value = 3, 7
channel = 0
persistent = 0

[State 197, End]
type = changestate
triggerall = time >= 80
trigger1 = animelemtime(6) >= 0 && animelemtime(10) < 0
trigger1 = command = "holdfwd" || command != "holdback"
trigger2 = animelemtime(14) >= 0
trigger2 = command != "holdfwd" || command = "holdback"
value = 0
ctrl = 1

[State 197, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 15
value = 1, 6
freqmul = 0.85
volumescale = 50
;channel = 1


;==========<DARK TAUNT>==========
[Statedef 198]
type = S
physics = S
movetype = I
anim = 198
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 198, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 198, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 1
channel = 0

[State 198, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<COMBO TAUNT>==========
[Statedef 199]
type = S
physics = S
movetype = I
anim = 199
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 199, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 199, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 7
channel = 0

[State 199, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


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
value = 3, 1
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
pos = ceil(37 * const(size.xscale)), -64
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
value = 3, 1
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
pos = ceil(37 * const(size.xscale)), -41
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
value = 3, 1
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
pos = ceil(44 * const(size.xscale)), -77
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
trigger1 = animelem = 1
value = 3, 7
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
value = ifelse((command = "a" || command = "b" || command = "c"), 240, 210)

[State 710, Attack]
type = changestate
trigger1 = AIlevel
trigger1 = time = [15, 25]
trigger1 = !inguarddist
trigger1 = p2dist y >= -60
trigger1 = abs(map(truebodydistx)) < 70
value = ifelse(abs(map(truebodydistx)) < 35, 210, 240)

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


;==========<FORWARD ROLL>==========
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
value = 3, 7
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = 4, 9
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 6.25

[State 720, Vel]
type = velset
trigger1 = animelem = 7
x = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 720, Push]
type = playerpush
trigger1 = animelemtime(8) < 0
value = 0

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<BACKWARD ROLL>==========
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
value = 3, 7
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = 4, 9
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 2
x = -4.69

[State 725, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 725, Push]
type = playerpush
trigger1 = 1
value = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

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
value = 3, 0
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
value = 4, 5
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
value = 3, 1
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
pos = ceil(37 * const(size.xscale)), -64
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
value = 4, 5
channel = 0

[State 760, Superpause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = ceil(-10 * const(size.xscale)), ceil(-56 * const(size.yscale))
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
value = 4, 5
channel = 0

[State 765, Superpause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = ceil(-3 * const(size.xscale)), ceil(-64 * const(size.yscale))
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
value = 11, 1

[State 5950, Sound]
type = playsnd
trigger1 = animelem = 4
value = F 7, 0
freqmul = 1.2

[State 5950, FX]
type = explod
trigger1 = animelem = 4
anim = F 60
postype = p1
pos = 12 * const(size.xscale), 0
scale = 0.67, 0.67
sprpriority = -10
ownpal = 1

[State 5950, Pos]
type = posadd
trigger1 = animelem = 9 || animelem = 10
x = -8 * const(size.xscale)

[State 5950, Sound]
type = playsnd
trigger1 = animelem = 11
value = F 7, 0

[State 5950, FX]
type = explod
trigger1 = animelem = 11
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


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
trigger1 = !roundsexisted
source = 1, 1
dest = 1, palno

[State 5900, Mode Var]
type = mapset
map = "dark"
trigger1 = !roundsexisted
value = palno = [7, 12]

[State 5900, Change Name]
type = modifyplayer
trigger1 = !time
trigger1 = !map(dark)
displayname = "Sakura"
lifebarname = "Sakura"

[State 5900, Change Name]
type = modifyplayer
trigger1 = !time
trigger1 = map(dark)
displayname = "Dark Sakura"
lifebarname = "Dark Sakura"

[State 5900, End]
type = changestate
trigger1 = time > 0; Wait for enemy to be loaded
value = 5901; Config


;----- After Config -----
[Statedef 5902]
type = S

[State 5902, Intro vs Ryu]
type = changestate
trigger1 = numenemy
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = enemy, var(1) = 1 || enemy, var(1) = 3
value = 352

[State 5902, Intro vs other Ryus]
type = changestate
triggerall = numenemy
triggerall = teamleader = playerno
triggerall = enemy, teamleader = enemy, playerno
triggerall = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, name = "Ryu" && !(enemy,authorname = "Phantom.of.the.Server")
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsryu" && enemy, palno <= 6
value = 353

[State 5902, Scratch Head vs Karin]
type = changestate
trigger1 = numenemy = 1
trigger1 = !(enemy, roundsexisted)
trigger1 = enemy, name = "Karin" || enemy, name = "Karin Kanzuki"
value = 350

[State 5902, Scratch Head vs Others]
type = changestate
triggerall = numenemy
triggerall = !(enemy, roundsexisted)
triggerall = enemy, teamleader = enemy, playerno
trigger1 = enemy, name = "Dan" || enemy, name = "Dan Hibiki"
trigger2 = enemy, name = "Athena" || enemy, name = "Athena Asamiya"
trigger3 = enemy, authorname = "Warusaki3"
trigger3 = enemy, name = "cvsdan" || enemy, name = "cvsathena"
trigger4 = enemy, authorname = "Mr.X -file"
trigger4 = enemy, name = "Dan_TLE" || enemy, name = "Dan_Violent"
trigger5 = enemy, name = "darkkarin" && enemy, authorname = "Drowin"
trigger6 = enemy, displayname = "Evil Dan"
value = 350

[State 5902, vs CvS Yuri]
type = changestate
triggerall = numenemy
triggerall = teamleader = playerno
triggerall = enemy, teamleader = enemy, playerno
triggerall = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Yuri Sakazaki"
trigger2 = enemy, authorname = "Warusaki3" && enemy, name = "cvsyuri"
trigger3 = enemy, authorname = "David Demianoff" && enemy, name = "Yuri Sakazaki"
value = 351

[State 5902, vs Jmorphman Shingo]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Jmorphman" && enemy, name = "Shingo Yabuki"
value = 360

[State 5902, Intro vs cute chars ^_^]
type = changestate
triggerall = numenemy
triggerall = teamleader = playerno
triggerall = enemy, teamleader = enemy, playerno
triggerall = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, name = "Pocket Shin Gouki" || enemy, name = "Pocket Gouki" || enemy, name = "Pocket Akuma"
trigger2 = enemy, name = "Duck Hunt" || enemy, name = "Lakitu" || enemy, name = "Bison Bison"
trigger3 = enemy, name = "Pocket Ryu" || enemy, name = "NxC Ryu"
trigger4 = enemy, authorname = "Renzoku" && enemy, name = "Ken3rd"
trigger5 = enemy, name = "BDI_Pocket_Chun-li"
trigger6 = enemy, authorname = "Kung Fu Man" && (enemy, name = "T.A.C." || enemy, name = "King DeDeDe")
trigger7 = enemy, name = "KIRBYXeX"
trigger8 = enemy, name = "Neco-Arc"
trigger9 = enemy, name = "llamageddon"
value = 356

[State 5902, Intro vs P.O. Sakura]
type = changestate
trigger1 = numenemy
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = roundno = 1 || !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Patrick Ching(Pneophen)" && enemy, name = "Pneophen's pissed off Sakura"
value = 357

[State 5902, Turns Intro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, End]
type = changestate
trigger1 = 1
value = ifelse(roundno = 1, 190, 0)


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

[State 170, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5000, 170

[State 170, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 3
volumescale = 75

[State 170, Dust]
type = explod
trigger1 = animelem = 3
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ceil(-20 * const(size.xscale)), 0
ownpal = 1
scale = 0.33, 0.33


;==========<DRAWGAME (Time over)>==========
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0

[State 175, End]
type = changestate
trigger1 = 1
value = 170


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 354))


;==========<INTRO 1 - IKUZO>==========
[Statedef 191]
type = S
physics = N
anim = ifelse(map(dark), 1, 0)

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = changeanim
trigger1 = anim != 191
trigger1 = roundstate != 0
value = 191

[State 191, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 191, Push]
type = playerpush
trigger1 = 1
value = 0

[State 191, Sound]
type = playsnd
trigger1 = animelem = 2
trigger1 = anim = 191
value = 4, 2
channel = 0

[State 191, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = anim = 191
value = 1, 1
;channel = 1

[State 191, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 191
value = 0


;==========<INTRO 2 - RUNNING LATE>==========
[Statedef 192]
type = S
physics = N
anim = 192
sprpriority = 1

[State 192, Dark]
type = changestate
trigger1 = !time
trigger1 = map(dark)
value = 355

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 192, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 192, Bound]
type = screenbound
trigger1 = 1
value = 0

[State 192, Pos]
type = posset
trigger1 = !time
x = 400 * facing

[State 192, Vel]
type = velset
trigger1 = anim = 192
trigger1 = roundstate != 0
x = -6.67

[State 192, Sound]
type = playsnd
trigger1 = roundstate != 0
value = 4, 6
channel = 0
persistent = 0

[State 192, steps]
type = playsnd
trigger1 = roundstate != 0
trigger1 = anim = 192
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 192, Anim]
type = changeanim
trigger1 = time
trigger1 = anim = 192
trigger1 = numhelper(8999) && animelemtime(11) >= 0
trigger1 = (helper(8999), rootdist x) < 90
value = 193

[State 192, Sound]
type = playsnd
trigger1 = anim = 193 && animelem = 4
value = 4, 24
channel = 0

[State 192, Sound]
type = playsnd
trigger1 = anim = 193 && animelem = 2
value = 0, 101
persistent = 0

[State 192, Dust]
type = explod
trigger1 = anim = 193 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = ceil(-18 * const(size.xscale)), 0
vel = -2, 0
ownpal = 1
scale = 0.5, 0.5

[State 192, Vel]
type = velset
trigger1 = anim = 193 && animelem = 1
x = (helper(8999), rootdist x) / -15

[State 192, Pos]
type = posset
trigger1 = anim = 193 && numhelper(8999) && animelemtime(5) >= 0
x = helper(8999), pos x

[State 192, Vel]
type = velset
trigger1 = anim = 193 && numhelper(8999) && animelemtime(5) >= 0
x = 0

[State 192, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 193
value = 0


;==========<INTRO 3 - KEI>==========
[Statedef 354]
type = S
physics = N
anim = 354
sprpriority = -1

[State 354, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 354, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 354, Camera]
type = helper
trigger1 = !time
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 354, Pos]
type = posadd
trigger1 = !time
x = 48

[State 354, Kei]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Kei"
postype = p1
pos = -10 * const(size.xscale), 0
facing = 1
size.shadowoffset = -5
ownpal = 1

[State 354, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 18
channel = 0

[State 354, Vel]
type = velset
trigger1 = animelem = 6
x = (helper(8999), rootdist x) / animelemtime(8)

[State 354, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 102

[State 354, Sound]
type = playsnd
trigger1 = animelem = 8
value = 0, 103

[State 354, Pos]
type = posset
trigger1 = animelem = 8
trigger1 = numhelper(8999)
x = helper(8999), pos x

[State 354, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 354, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<DARK INTRO - RUNNING LATE>==========
[Statedef 355]
type = S
physics = N
anim = 355
sprpriority = -1

[State 355, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 355, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 355, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 355, Bound]
type = screenbound
trigger1 = 1
value = 0

[State 355, Pos]
type = posset
trigger1 = !time
x = 320 * facing

[State 355, Turn]
type = angledraw
trigger1 = numenemy
trigger1 = (enemy(0), pos x - pos x) * facing < 0
scale = -1, 1

[State 355, Vel]
type = velset
trigger1 = roundstate != 0
trigger1 = animelemtime(4) < 0
x = -7.50
persistent = 0

[State 355, Friction]
type = velmul
trigger1 = abs(vel x) > 1
trigger1 = numhelper(8999)
trigger1 = abs(helper(8999), rootdist x) < 70
x = 0.9

[State 355, Sound]
type = playsnd
trigger1 = roundstate != 0
value = 4, 25
channel = 0
persistent = 0

[State 355, Sound]
type = playsnd
trigger1 = roundstate != 0
value = 5, 8
persistent = 0

[State 355, Anim Loop]
type = changeanim
trigger1 = animelem = 4
trigger1 = numhelper(8999)
trigger1 = helper(8999), rootdist x > 0
value = 355
elem = 1

[State 355, Anim Continue]
type = changeanim
triggerall = animelemtime(4) < 0
trigger1 = numhelper(8999)
trigger1 = helper(8999), rootdist x <= 0
trigger2 = time > 300
value = 355
elem = 4

[State 355, Darken]
type = palfx
trigger1 = animelemtime(4) < 0
time = 1
mul = 128, 128, 128

[State 355, Afterimage]
type = explod
trigger1 = animelemtime(4) < 0
ID = 1500
postype = p1
pos = 0, 2 * cos(time / 8.0 * pi)
sprpriority = sprpriority - 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 12
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
palfx.time = 12
palfx.mul = 128, 128, 128
interpolation.time = 12
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1
facing = ifelse((enemy(0), pos x - pos x) * facing < 0, -1, 1)

[State 355, Eye]
type = explod
trigger1 = animelemtime(4) < 0
ID = 1500
anim = 8060
postype = p1
pos = ifelse((enemy(0), pos x - pos x) * facing < 0, -1, 1) * const(size.xscale) - 0.5 * vel x, -85 * const(size.yscale)
sprpriority = sprpriority + 1
removetime = 12
trans = addalpha
alpha = 256, 256
scale = 0.02 * abs(vel x), 0.02
palfx.time = 12
palfx.color = 0
palfx.mul = 256, 0, 128
interpolation.time = 12
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1
facing = ifelse((enemy(0), pos x - pos x) * facing < 0, -1, 1)

[State 355, Vel]
type = velset
trigger1 = animelem = 4
x = 0
y = 0

[State 355, Pos]
type = posset
trigger1 = animelem = 4
x = helper(8999), pos x

[State 355, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 26
channel = 0

[State 355, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<SCRATCH HEAD INTRO>==========
[Statedef 350]
type = S
physics = N
anim = 350

[State 350, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 350, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 350, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 23
channel = 0

[State 350, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<CvS YURI INTRO>==========
[Statedef 351]
type = S
physics = N
anim = ifelse(map(dark), 1, 0)

[State 351, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 351, Wait]
type = changeanim
triggerall = anim != 351
triggerall = roundstate != 0
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemy, animelemtime(1) >= 30
value = 351

[State 351, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 351, Push]
type = playerpush
trigger1 = 1
value = 0

[State 351, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = anim = 351
value = 4, 23
channel = 0

[State 351, Sound]
type = playsnd
trigger1 = animelem = 16
trigger1 = anim = 351
value = 4, 8
channel = 0

[State 351, Sound]
type = playsnd
trigger1 = animelem = 22
trigger1 = anim = 351
value = 4, 16
channel = 0

[State 351, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 351
value = 0


;==========<INTRO vs RYU>==========
[Statedef 352]
type = S
physics = N
anim = 352

[State 352, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 352, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 352, Hadouken]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 1003
ID = 1003
name = "Hadouken Intro"
postype = p1
ownpal = 1

[State 352, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1

[State 352, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 5
channel = 0

[State 352, Sound]
type = playsnd
trigger1 = animelem = 28
value = 4, 0
channel = 0

[State 352, Sound]
type = playsnd
trigger1 = animelem = 29
value = 5, 6

[State 352, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs other RYUs>==========
[Statedef 353]
type = S
physics = N
anim = 353

[State 353, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 353, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 353, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1

[State 353, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs CUTE CHARS>==========
[Statedef 356]
type = S
physics = N
anim = ifelse(map(dark), 1, 0)

[State 356, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 356, Wait]
type = changeanim
trigger1 = anim != 356
trigger1 = roundstate != 0
value = 356

[State 356, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 356, Push]
type = playerpush
trigger1 = 1
value = 0

[State 356, Sound]
type = playsnd
trigger1 = anim = 356
trigger1 = animelem = 4
value = 4, 22
channel = 0

[State 356, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs P.O. SAKURA>==========
[Statedef 357]
type = S
physics = N
anim = 357

[State 357, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 357, Anim]
type = changeanim
trigger1 = !roundstate
value = 357

[State 357, Sound]
type = playsnd
trigger1 = animelem = 8
value = 3, 1
channel = 0

[State 357, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO VS SHINGO >==========
[Statedef 360]
type = S
physics = N
anim = 9999
sprpriority = 1

[State 360, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 360, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 360, Bound]
type = screenbound
trigger1 = 1
value = 0

[State 360, Pos]
type = posset
trigger1 = !time
x = 450 * facing

[State 360, Snd]
type = playsnd
trigger1 = time = 54
value = 4, 6
channel = 0

[State 360, Anim]
type = changeanim
trigger1 = time = 54
value = 192

[State 360, Vel]
type = velset
trigger1 = anim = 192
x = -7.50

[State 360, Steps]
type = playsnd
trigger1 = anim = 192
trigger1 = animelem = 3 || animelem = 6
value = 0, 100

[State 360, Anim]
type = changeanim
trigger1 = anim = 192
trigger1 = abs(pos x - p2, pos x) < 40
value = 360

[State 360, PosFreeze]
type = posfreeze
trigger1 = anim = 360
trigger1 = animelemtime(2) > 0 && animelemtime(3) < 0
value = 1

[State 360, Snd]
type = playsnd
trigger1 = anim = 360
trigger1 = animelem = 2
value = 4, 11
channel = 0

[State 360, HitSound]
type = playsnd
trigger1 = anim = 360
trigger1 = animelem = 2
value = 2, 6
channel = 2

[State 360, EnvShake]
type = envshake
trigger1 = anim = 360
trigger1 = animelem = 2
time = 24
freq = 180
ampl = 2
mul = 0.8

;[State 360, Spark]
;in ZSS

[State 360, Vel]
type = velset
trigger1 = anim = 360
trigger1 = animelem = 3
trigger1 = numhelper(8999)
x = 0.8 * (helper(8999), rootdist x) / -22
y = -7.5

[State 360, VelAdd]
type = veladd
trigger1 = anim = 360
trigger1 = animelemtime(3) > 0
y = 0.75

[State 360, StateTypeSet]
type = statetypeset
trigger1 = anim = 360 && animelem = 6
statetype = A
physics = N

[State 360, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 361


;----- Brake -----
[Statedef 361]
type = A
physics = N
movetype = I
anim = 361
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 361, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 361, Pos]
type = posset
trigger1 = 1
y = 0

[State 361, Vel]
type = velset
trigger1 = !time
x = (helper(8999), rootdist x) / -8

[State 361, Snd]
type = playsnd
trigger1 = !time
value = 0, 101

[State 361, Dust]
type = explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = ceil(20 * const(size.xscale)), 0
vel = -2, 0
ownpal = 1
scale = 0.5, 0.5

[State 361, Pos]
type = posset
trigger1 = animelem = 3
x = helper(8999), pos x

[State 361, Vel]
type = velset
trigger1 = animelem = 3
x = 0

[State 361, HitSound]
type = playsnd
trigger1 = animelem = 9
value = 4, 23
channel = 0

[State 361, End]
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
trigger1 = !time
value = 0, 52

[State 6901, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 2
channel = 0

[State 6901, Sound]
type = playsnd
trigger1 = animelem = 11
value = 1, 1
;channel = 1

[State 6901, End]
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
trigger1 = !time
value = randomrange(1, 11)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Ryu"
trigger1 = !(enemynear, authorname = "Phantom.of.the.Server" && enemynear, var(1) = 2)
trigger2 = enemynear, name = "cvsryu" || enemynear, name = "svcryu"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Dan Hibiki"
trigger2 = enemynear, name = "cvsdan" || enemynear, name = "svcdan"
value = 51

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Karin Kanzuki"
trigger2 = enemynear, name = "cvskarin"
value = 52

[State 180, Win SGS]
type = changestate
trigger1 = prevstateno = 4012
value = 4012

[State 180, Win]
type = changestate
triggerall = !numhelper(6000)
trigger1 = command = "/s"
trigger2 = random < 250
trigger2 = !winperfect
value = 187

[State 180, Win]
type = changestate
trigger1 = !time
trigger1 = command = "/x" || command = "/y" || command = "/z"
value = ifelse((command = "/x"), 181, ifelse((command = "/y"), 182, 183))

[State 180, Win]
type = changestate
trigger1 = !time
trigger1 = command = "/a" || command = "/b" || command = "/c"
value = ifelse((command = "/a"), 186, ifelse((command = "/b"), 184, 185))

[State 180, Perfect]
type = changestate
trigger1 = winperfect
value = 188

[State 180, Win]
type = changestate
trigger1 = 1
value = randomrange(181, 186)


;==========<WIN 1>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
velset = 0, 0

[State 181, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 4
channel = 0

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;==========<WIN 2 - DANCE>==========
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
trigger1 = animelem = 7 || animelem = 15
value = 1, 6
freqmul = 0.85
volumescale = 50
;channel = 1


;==========<WIN 3 - LOSE SHOE>==========
[Statedef 183]
type = S
anim = 183
ctrl = 0
velset = 0, 0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 9
value = 3, 2
channel = 0

[State 183, Shoe]
type = helper
trigger1 = animelem = 9
trigger1 = !numhelper(6091)
helpertype = normal
stateno = 6091
ID = 6091
name = "Shoe"
postype = p1
pos = ceil(59 * const(size.xscale)), -103

[State 183, Sound]
type = playsnd
trigger1 = animelem = 18
value = 3, 3
channel = 0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1

[State 183, Sound]
type = playsnd
trigger1 = animelem = 8
value = 1, 6
;channel = 1

[State 183, Sound]
type = playsnd
trigger1 = animelem = 19
value = 1, 1
;channel = 1

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;==========<WIN 4>==========
[Statedef 184]
type = S
anim = 184
ctrl = 0
velset = 0, 0

[State 184, Sound]
type = playsnd
trigger1 = animelem = 7
value = 4, 7
channel = 0

[State 184, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;==========<WIN 5>==========
[Statedef 185]
type = S
anim = 185
ctrl = 0
velset = 0, 0

[State 185, Sound]
type = playsnd
trigger1 = time = 10
value = 4, 27
channel = 0

[State 185, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;==========<WIN 6 - KEEP SHOE>==========
[Statedef 186]
type = S
anim = 186
ctrl = 0
velset = 0, 0

[State 186, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0

[State 186, Sound]
type = playsnd
trigger1 = animelem = 9
value = 3, 2
channel = 0

[State 186, Sound]
type = playsnd
trigger1 = animelem = 18
value = 3, 3
channel = 0

[State 186, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1

[State 186, Sound]
type = playsnd
trigger1 = animelem = 8
value = 1, 6
;channel = 1

[State 186, Sound]
type = playsnd
trigger1 = animelem = 19
value = 1, 1
;channel = 1

[State 186, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;==========<WIN by PERFECT>==========
[Statedef 188]
type = S
anim = 188
ctrl = 0
velset = 0, 0

[State 188, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 188, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 20
channel = 0


;==========<WIN KEI>==========
[Statedef 187]
type = S
ctrl = 0
velset = 0, 0

[State 187, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 187, Push]
type = playerpush
trigger1 = 1
value = 0

[State 187, Turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < 120

[State 187, Assert]
type = assertspecial
triggerall = time < 180
trigger1 = anim != 187
trigger2 = anim = 187
trigger2 = animelemtime(13) < 60
flag = roundnotover

[State 187, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 0
value = 0

[State 187, Kei Trip]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
trigger1 = random < 333
helpertype = normal
stateno = 6002
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1
size.shadowoffset = 5

[State 187, Kei Dance]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6004
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1

[State 187, Anim]
type = changeanim
trigger1 = anim != 187
trigger1 = numhelper(6000)
trigger1 = helper(6000), anim = 6003
value = 187

[State 187, Anim]
type = changestate
trigger1 = numhelper(6000)
trigger1 = helper(6000), anim = 6004
value = 182


;==========<WIN by S.G.S.>==========
[Statedef 4012]
type = S
anim = 4012
velset = 0, 0
ctrl = 0
sprpriority = -4

[State 4012, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 4012, Flower Petals]
type = explod
trigger1 = prevstateno = 4011
trigger1 = numexplod(6090) < 12
anim = 6090
ID = 6090
postype = p1
pos = ceil(25 * const(size.xscale)), -110
vel = -(random / 2000.0), 0.5
accel = -0.0075, 0
random = 100, 50
sprpriority = 4
removetime = 210
scale = 0.25 * ifelse(random < 500, -1, 1), 0.25 * ifelse(random < 500, -1, 1)
ownpal = 1

[State 4012, Allow Round End]
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
value = 4, 9
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
value = 3, 7
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
trigger1 = numtarget(1335)
trigger1 = stateno = 1335
trigger1 = target(1335), gethitvar(frame)
trigger1 = target(1335), stateno = 5000 || target(1335), stateno = 5010
value = 1390
ID = 1335
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
trigger1 = map(dark)
trigger1 = numtarget
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
trigger1 = ifelse((stateno = 200 || stateno = 400), (prevstateno != 200 && prevstateno != 400 && prevstateno != 430), 1)
trigger1 = ifelse((stateno = 230 || stateno = 231 || stateno = 430), prevstateno != 430, 1)
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

[State -2, Sakura Life Points]
type = defencemulset
trigger1 = !map(dark)
trigger1 = movetype != H
value = 1.0
onhit = 0
multype = 1
ignorehitpause = 1

[State -2, Dark Sakura Life Points]
type = defencemulset
trigger1 = map(dark)
value = 0.9
onhit = 0
multype = 1
ignorehitpause = 1

;Redundant now that defense affects stun damage
;[State -2, Dark Sakura Stun Points]
;type = dizzypointsset
;trigger1 = map(dark)
;trigger1 = dizzypoints > (0.9 * dizzypointsmax)
;value = 0.9 * dizzypointsmax
;ignorehitpause = 1

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
value = 5000, 170
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
trigger1 = stateno = const(StateGuardBreakRecover)
value = 5000, (random % 3)
lowpriority = 1
channel = 0

[State -2, Dizzy Slap]
type = playsnd
trigger1 = anim = 5300
trigger1 = animelem = 3
value = 5, 4
channel = 2

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
trigger1 = stateno != 1000 && stateno != 1010 && stateno != 1020 && stateno != 1030 && stateno != 1050
trigger1 = stateno != 3000 && stateno != 3020 && stateno != 3301 && stateno != 4300
trigger2 = stateno = 1000 && animelemtime(10) < 0
trigger3 = stateno = 1010 && animelemtime(5) < 0
trigger4 = stateno = 1020 && animelemtime(10) < 0
trigger5 = stateno = 1030 && animelemtime(5) < 0
trigger6 = stateno = 1050 && animelemtime(2) < 0
trigger7 = stateno = 3000 && time <= 8
trigger8 = stateno = 3020 && time <= 8
trigger9 = stateno = 3300
trigger10 = stateno = 4300 && time <= 8
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
triggerall = map(customcombo) <= 0
triggerall = map(projflag) != 1
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1010 && numhelper(1015)
trigger2 = helper(1015), stateno = 1015 && helper(1015), movetype = A
trigger3 = stateno != 1020 && numhelper(1025)
trigger3 = helper(1025), stateno = 1005
trigger4 = stateno != 1030 && numhelper(1035)
trigger4 = helper(1035), stateno = 1015
trigger5 = stateno != 1050 && numhelper(1055)
trigger5 = helper(1055), stateno = 1055
trigger6 = stateno != 3000 && numhelper(3005)
trigger6 = helper(3005), stateno = 3005
trigger7 = stateno != 3020 && numhelper(3025)
trigger7 = helper(3025), stateno = 3025
trigger8 = stateno != 3301 && numhelper(3305)
trigger8 = helper(3305), stateno = 3305
trigger9 = stateno != 4300 && numhelper(4305)
trigger9 = helper(4305), stateno = 4305
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
trigger4 = stateno = 200
trigger5 = stateno = 210
trigger5 = (movecontact || movereversed) && animelemtime(5) < 0
trigger5 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger6 = stateno = 211
trigger6 = (movecontact || movereversed) && animelemtime(5) < 0
trigger6 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger7 = stateno = 221
trigger7 = (movecontact || movereversed) && animelemtime(4) < 0
trigger7 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger8 = stateno = 230 || stateno = 231
trigger8 = (movecontact || movereversed) && animelemtime(4) < 0
trigger9 = stateno = 400
trigger10 = stateno = 410
trigger10 = (movecontact || movereversed) && animelemtime(6) < 0
trigger10 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger11 = stateno = 420
trigger11 = (movecontact || movereversed) && animelemtime(3) < 0
trigger11 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger12 = stateno = 430
trigger13 = stateno = 600
trigger13 = (movecontact || movereversed) && animelemtime(4) < 0
trigger13 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger14 = stateno = 630
trigger14 = (movecontact || movereversed) && animelemtime(4) < 0
trigger14 = ifelse(map(dark), prevstateno != [200, 699], 1)
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
trigger2 = stateno = 220
trigger2 = (movecontact || movereversed) && animelemtime(6) < 0
trigger2 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger3 = stateno = 251
trigger3 = (movecontact || movereversed) && animelemtime(5) < 0
trigger3 = ifelse(map(dark), prevstateno != [200, 699], 1)
trigger4 = stateno = 1000
trigger4 = animelemtime(11) = [1, 12] && map(projcontact) = [1, 12]
trigger5 = stateno = 1010
trigger5 = map(projcontact) = [1, 12]
trigger6 = stateno = 1020
trigger6 = animelemtime(11) = [1, 12] && map(projcontact) = [1, 12]
trigger7 = stateno = 1030
trigger7 = map(projcontact) = [1, 12]
trigger8 = stateno = 1100
trigger8 = (movecontact + movereversed) = [1, 12]
trigger9 = stateno = 1110
trigger9 = (movecontact + movereversed) = [1, 12]
trigger10 = stateno = 1150
trigger10 = (movecontact + movereversed) = [1, 12]
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
trigger1 = anim = 3001 && animelemtime(2) = [1, 40] && map(projcontact) = [1, 12]
trigger2 = stateno = 3020
trigger2 = anim = 3021 && animelemtime(2) = [1, 40] && map(projcontact) = [1, 12]
trigger3 = stateno = 3100
trigger3 = (movecontact + movereversed) = [1, 12]
trigger4 = stateno = 3200
trigger4 = (movecontact + movereversed) = [1, 12]
trigger5 = stateno = 4110
trigger5 = (movecontact + movereversed) = [1, 12]
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
trigger2 = stateno = 3020 && time = 3
trigger3 = stateno = 3100 && time = 3
trigger4 = stateno = 3200 && time = 3
trigger5 = stateno = 4200 && time = 3
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
trigger1 = stateno = 4100 && time = 3
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
trigger1 = stateno = 4000 && time = 3
trigger2 = stateno = 4050 && time = 3
trigger3 = stateno = 4300 && time = 3
trigger4 = stateno = 3300 && time = 3
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
trigger1 = stateno = 50 || stateno = [600, 699]
trigger1 = (map(jumptype) = 2 || map(jumptype) = 3) && vel y < -1
trigger2 = map(customcombo)
trigger3 = stateno = [3000, 4999]
trigger3 = stateno != 4012
trigger4 = stateno = [710, 725]
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
trigger3 = numhelper(1015)
trigger3 = helper(1015), map(projcontact)
trigger4 = numhelper(1025)
trigger4 = helper(1025), map(projcontact)
trigger5 = numhelper(1035)
trigger5 = helper(1035), map(projcontact)
trigger6 = numhelper(1475)
trigger6 = helper(1475), map(projcontact)
trigger7 = stateno = 810
trigger7 = animelemtime(5) = [0, 1]
trigger8 = stateno = 822
trigger8 = animelemtime(4) = [0, 1]
trigger9 = stateno = 830
trigger9 = animelemtime(16) = [0, 1]
trigger10 = stateno = 860
trigger10 = animelemtime(5) = [0, 1]
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
triggerall = !numhelper(8600)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = movecontact = [1, 4]
trigger1 = stateno = [3000, 4999] || stateno = 1195
trigger1 = map(superfinish) := stateno
trigger2 = numhelper(3005)
trigger2 = helper(3005), map(projcontact)
trigger2 = map(superfinish) := 3000
trigger3 = numhelper(3025)
trigger3 = helper(3025), map(projcontact)
trigger3 = map(superfinish) := 3020
trigger4 = stateno = 3300 && map(projcontact)
trigger4 = map(superfinish) := 3300
trigger5 = numhelper(3305)
trigger5 = helper(3305), map(projcontact)
trigger5 = map(superfinish) := 3300
trigger6 = numhelper(4305)
trigger6 = helper(4305), map(projcontact)
trigger6 = map(superfinish) := 4300
trigger7 = stateno = [4011, 4012]
trigger7 = map(superfinish) := 4000
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
bgm = "sakwin.mp3"
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
