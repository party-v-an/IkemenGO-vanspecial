; _______________________________
;| Nash by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<SYSTEM STATES>========================================
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


;====================<JUMPING>====================
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
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, vel normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, vel short]
type = velset
trigger1 = !animtime && map(jumptype) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, vel medium]
type = velset
trigger1 = !animtime && map(jumptype) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, vel long]
type = velset
trigger1 = !animtime && map(jumptype) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, vel run]
type = velset
trigger1 = !animtime && prevstateno = 100 && sysvar(1) = 1
trigger1 = map(jumptype) := ifelse((map(jumptype) = 1 || map(jumptype) = 2), 2, 3)
x = const(velocity.runjump.fwd.x)

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
anim = 8102
sprpriority = -3
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
physics = N
movetype = I
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
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Steps]
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
trigger1 = !AIlevel
trigger1 = command != "holdfwd" || command = "holdback"
trigger2 = AIlevel && p2bodydist x <= 90
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
anim = 8103
sprpriority = 3
postype = p1
pos = ceil(20 * const(size.xscale)), 0
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
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = 7.0

[State 102, End]
type = changestate
trigger1 = !animtime
value = 103


;----- STOP -----
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 103, Dust]
type = explod
trigger1 = !time
anim = 8102
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

[State 105, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.6

[State 105, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 106


;----- LAND -----
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

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
anim = 8102
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
value = ifelse(map(shadow), 14, 4), 0
channel = 0

[State 700, Sound]
type = playsnd
trigger1 = !time
value = 0, 700

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 700, FX]
type = explod
trigger1 = !time
anim = 8300
ontop = 1
postype = p1
pos = ceil(19 * const(size.xscale)), ceil(-64 * const(size.yscale))
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
value = ifelse(map(shadow), 14, 4), 0
channel = 0

[State 701, Sound]
type = playsnd
trigger1 = !time
value = 0, 700

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 701, FX]
type = explod
trigger1 = !time
anim = 8300
ontop = 1
postype = p1
pos = ceil(24 * const(size.xscale)), ceil(-33 * const(size.yscale))
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
value = ifelse(map(shadow), 14, 4), 0
channel = 0

[State 702, Sound]
type = playsnd
trigger1 = !time
value = 0, 700

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, FX]
type = explod
trigger1 = !time
anim = 8300
ontop = 1
postype = p1
pos = ceil(24 * const(size.xscale)), ceil(-75 * const(size.yscale))
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


;====================<DODGE>====================
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
ctrl = 0
velset = 0, 0
sprpriority = -2

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
value = ifelse(map(shadow), 14, 4), 5
channel = 0

[State 710, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 3

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
value = ifelse((command = "a" || command = "b" || command = "c"), 250, 211)

[State 710, Attack]
type = changestate
trigger1 = AIlevel
trigger1 = time = [15, 25]
trigger1 = !inguarddist
trigger1 = p2dist y >= -60
trigger1 = abs(map(truebodydistx)) < 60
value = ifelse(abs(map(truebodydistx)) < 40, 211, 250)

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


;====================<FORWARD ROLL>====================
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 720, Push]
type = playerpush
trigger1 = animelemtime(6) < 0
value = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 6)
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 6.0

[State 720, Vel]
type = velset
trigger1 = animelem = 6
x = 0

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<BACK ROLL>====================
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 725, Push]
type = playerpush
trigger1 = animelemtime(8) < 0
value = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 6)
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 3
x = -6.0

[State 725, Vel]
type = velset
trigger1 = animelem = 6
x = 0

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<POWER CHARGE>==========
[Statedef 730]
type = S
physics = S
movetype = I
anim = 730
velset = 0, 0
ctrl = 0

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 730, Power]
type = poweradd
trigger1 = 1
value = 4 + ifelse(time < 60, 0, (time - 60) / 15)

[State 730, Sound]
type = playsnd
trigger1 = time = 8
value = ifelse(map(shadow), 14, 4), 3
channel = 0

[State 730, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 730, FX]
type = helper
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, FX]
type = helper
trigger1 = !numhelper(8332)
helpertype = normal
stateno = 8332
ID = 8332
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, End]
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
value = 731


;----- END -----
[Statedef 731]
type = S
physics = S
movetype = I
anim = 731
velset = 0, 0
ctrl = 0

[State 731, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 730, Sound]
type = playsnd
trigger1 = !time
trigger1 = power >= const(data.power)
value = ifelse(map(shadow), 15, 5), 4
channel = 0

[State 730, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<GUARD CANCEL>====================
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000
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

[State 750, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 750, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 750, Sound]
type = playsnd
trigger1 = !time
value = ifelse(map(shadow), 14, 4), 0
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
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = ceil(57 * const(size.xscale)), ceil(-56 * const(size.yscale))
supermovetime = 255
ownpal = 1

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 10
movetime = 10
p2defmul = 1
anim = -1
sound = s0, 750
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
[Statedef 900]
type = S
physics = S
movetype = A
anim = 900
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 8

[State 900, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 900, Var]
type = mapset
trigger1 = time >= 4
map = "customcombo"
value = 300

[State 900, Super Pause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Pause"
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-93 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 900, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s0, 900
p2defmul = 1
darken = 0

[State 900, Afterimage]
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

[State 900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- AIR -----
[Statedef 905]
type = A
physics = N
movetype = A
anim = 905
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 905, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 8

[State 905, Var]
type = mapset
trigger1 = time >= 4
map = "customcombo"
value = 300

[State 905, Super Pause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Pause"
postype = p1
pos = ceil(1 * const(size.xscale)), ceil(-76 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 905, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s0, 900
p2defmul = 1
darken = 0

[State 905, Afterimage]
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

[State 905, End]
type = changestate
trigger1 = !animtime
value = 906
ctrl = 1

[State 905, Freeze]
type = posfreeze
trigger1 = 1
value = 1


[Statedef 906]
type = A
physics = N
movetype = I
anim = 906
ctrl = 1

[State 906, Accel]
type = gravity
trigger1 = 1

[State 906, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;==========<K.O.>==========
[Statedef 5150]
type = L
physics = N
movetype = H
sprpriority = -3
ctrl = 0

[State 5150, Anim]
type = changeanim
trigger1 = !time
value = 5150

[State 5150, Vel]
type = velmul
trigger1 = 1
x = 0.85

[State 5150, Vel]
type = velset
trigger1 = vel x
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
x = 0

[State 5150, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5150, Shadow Explosion]
type = playsnd
triggerall = map(shadow)
triggerall = !alive
triggerall = time = 120
trigger1 = teammode = turns
trigger2 = teammode = tag
trigger3 = matchover
value = 7, 8

[State 5150, Shadow Explosion]
type = explod
triggerall = map(shadow)
triggerall = !alive
triggerall = time = 120
trigger1 = teammode = turns
trigger2 = teammode = tag
trigger3 = matchover
anim = 3415
sprpriority = -2
postype = p1
pos = 0, -40
ownpal = 1

[State 5150, Shadow Explosion]
type = assertspecial
triggerall = map(shadow)
triggerall = !alive
triggerall = time > 120
trigger1 = teammode = turns
trigger2 = teammode = tag
trigger3 = matchover
flag = invisible

[State 5150, End]
type = selfstate
trigger1 = alive
value = 5120


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
trigger1 = !time
value = ifelse(map(shadow), 14, 4), 0
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
pos = 0, ceil(-18 * const(size.yscale))
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


;----- AIR -----
[Statedef 5210]
type = A
physics = N
movetype = I
anim = 5210
ctrl = 0

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

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = ifelse(map(shadow), 14, 4), 0
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
anim = 8102
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
value = 11, ifelse(map(shadow), 4, 2)

[State 5950, Pos]
type = posadd
trigger1 = animelem = 4
x = -16 * const(size.xscale)

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


;====================<LOSE>====================
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


;====================<DRAW GAME>====================
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0

[State 175, End]
type = changestate
trigger1 = 1
value = 170


;====================<CONTINUE?>====================
[Statedef 5500]
type = S
anim = 5300
velset = 0, 0
ctrl = 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;====================<INITIALIZE>====================
;----- Intro Selection -----
[Statedef 5902]
type = S

[State 5902, Shadow Intro]
type = changestate
trigger1 = roundno = 1 && map(shadow)
value = 194

[State 5902, vs Guile]
type = changestate
triggerall = numenemy && !map(shadow)
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted || !(enemy, roundsexisted)
trigger1 = enemy, name = "Guile" || enemy, name = "cvsguile"
trigger2 = enemy, name = "SF2Guile" || enemy, name = "William F. Guile"
value = 6910

[State 5902, vs Shin Gouki]
type = changestate
triggerall = numenemy && !map(shadow)
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted
trigger1 = numenemy && !roundsexisted && !map(shadow)
trigger1 = enemy, name = "Shin Gouki" || enemy, name = "Shin Akuma"
value = 6913

[State 5902, vs Vega]
type = changestate
triggerall = numenemy && !map(shadow)
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted
trigger1 = (enemy, name = "Vega") && (enemy, authorname = "Phantom.of.the.Server")
trigger2 = (enemy, name = "cvsvega") && ((enemy, authorname = "Warusaki3") || (enemy, authorname = "Gargoyle"))
trigger3 = (enemy, name = "M.Bison") && (enemy, authorname = "N-Mario")
trigger4 = enemy, name = "[Necromancer's] M. Bison"
trigger5 = (enemy, name = "M. Bison") && (enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous")
trigger6 = (enemy, name = "CvSBison") && (enemy, authorname = "Team Kai (Saiai and Koga)")
value = 6913

[State 5902, Turns Intro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, Joke Intro]
type = changestate
trigger1 = roundno = 1
trigger1 = command = "holdup" || random < 10
value = 6911

[State 5902, Intro]
type = changestate
trigger1 = roundno = 1
value = 190 + (random % 2)

[State 5902, End]
type = changestate
trigger1 = 1
value = 0


;====================<INTRO 1>====================
[Statedef 190]
type = S
physics = S
anim = 190

[State 190, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 190, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 190, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 2>====================
[Statedef 191]
type = S
physics = S
anim = 191

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<SHADOW INTRO>====================
[Statedef 194]
type = S
physics = S
anim = 194

[State 194, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 194, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 194, Palfx]
type = palfx
trigger1 = animelemtime(3) < 0
time = 1
add = -255, -255, -255

[State 194, Palfx]
type = palfx
trigger1 = animelemtime(3) = -1
time = 16
add = -255, -255, -255
sinadd = 255, 255, 255, 64

[State 194, Sound]
type = playsnd
trigger1 = animelem = 2
value = 7, 4

[State 194, FX]
type = explod
trigger1 = animelem = 2
anim = 1307
ID = 1307
postype = p1
scale = const(size.xscale), const(size.yscale)
ownpal = 1

[State 194, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 5

[State 194, FX]
type = explod
trigger1 = animelem = 5
anim = 6005
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-93 * const(size.yscale))
sprpriority = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

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

[State 6900, Bound]
type = screenbound
trigger1 = 1
value = 0

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
trigger1 = time && vel y > 0 && (pos y > -vel y)
value = 6901


;----- LAND -----
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
trigger1 = 1
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

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 6902


;====================<TURNS INTRO 1>====================
[Statedef 6902]
type = S
physics = S
anim = 6902

[State 6902, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, Sound]
type = playsnd
trigger1 = animelem = 4
value = ifelse(map(shadow), 15, 5), ifelse(random < 500, 5, 4)
channel = 0

[State 6902, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO vs GUILE>====================
[Statedef 6910]
type = S
physics = S
anim = 6910

[State 6910, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 7
value = 1, 0

[State 6910, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<JOKE INTRO>====================
[Statedef 6911]
type = A
physics = N
anim = 6911
velset = 0, 0
ctrl = 0

[State 6911, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6911, Bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 6911, Pos]
type = posadd
trigger1 = !time
y = -640

[State 6911, Vel]
type = velset
trigger1 = !time
y = 4

[State 6911, Accel]
type = veladd
trigger1 = 1
y = 0.25

[State 6911, Sound]
type = playsnd
trigger1 = time = 10
value = 11, ifelse(map(shadow), 3, 1)
channel = 0

[State 6911, End]
type = changestate
trigger1 = time
trigger1 = pos y > -vel y
value = 6912


;----- HIT GROUND -----
[Statedef 6912]
type = L
physics = C
anim = 6912
velset = 0, 0

[State 6912, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6912, Pos]
type = posset
trigger1 = !time
y = 0

[State 6912, Sound]
type = playsnd
trigger1 = !time
value = ifelse(map(shadow), 5010, 5000), 4
channel = 0

[State 6912, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 6912, Dust]
type = explod
trigger1 = !time
anim = F 62
postype = p1
sprpriority = 10
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6912, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = 2
mul = 0.8

[State 6912, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(4) < 0
y = 1.0

[State 6912, Vel]
type = velset
trigger1 = animelem = 2
y = -6

[State 6912, Vel]
type = velset
trigger1 = animelem = 4
y = 0

[State 6912, Pos]
type = posset
trigger1 = animelem = 4
y = 0

[State 6912, Sound]
type = playsnd
trigger1 = animelem = 4
value = F 7, 0

[State 6912, Dust]
type = explod
trigger1 = animelem = 4
anim = F 60
postype = p1
sprpriority = -10
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6912, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = S
physics = S

[State 6912, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO vs VEGA>====================
[Statedef 6913]
type = A
physics = N
anim = 6913
velset = 0, 0
ctrl = 0

[State 6913, Intro]
type = assertspecial
trigger1 = 1
flag = intro
flag2 = nobardisplay

[State 6913, Bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 6913, harrier]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6000
ID = 6000
name = "Harrier"
postype = p1
pos = 0, -216
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 6913, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = ceil(pos y - screenpos y)

[State 6913, Vel]
type = velset
trigger1 = animelem = 2
y = 4

[State 6913, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.25

[State 6913, End]
type = changestate
trigger1 = time
trigger1 = pos y > -vel y
value = 6914


;----- LAND -----
[Statedef 6914]
type = S
physics = S
anim = 6914
velset = 0, 0

[State 6914, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 6914, Pos]
type = posset
trigger1 = !time
y = 0

[State 6914, Sound]
type = playsnd
trigger1 = animelem = 16
value = ifelse(map(shadow), 15, 5), 4
channel = 0

[State 6914, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6914, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

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
value = randomrange(1, 11)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Guile"
trigger2 = enemynear, name = "cvsguile" || enemynear, name = "svcguile"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemynear, name = "Vega" && enemynear, authorname = "Phantom.of.the.Server"
trigger2 = enemynear, name = "cvsvega" && (enemynear, authorname = "Warusaki3" || enemynear, authorname = "Gargoyle")
trigger3 = enemynear, name = "M.Bison" && enemynear, authorname = "N-Mario"
trigger4 = enemynear, name = "M. Bison" && enemynear, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemynear, name = "CvSBison" && enemynear, authorname = "Team Kai (Saiai and Koga)"
value = 51

[State 180, Win Final Mission]
type = changestate
trigger1 = prevstateno = 3490
value = 3490

[State 180, Warp out]
type = changestate
trigger1 = map(shadow) && matchover
value = 189

[State 180, Win]
type = changestate
trigger1 = command = "/x" || command = "/y" || command = "/z"
value = ifelse(command = "/z", 183, ifelse(command = "/y", 182, 181))

[State 180, Win]
type = changestate
trigger1 = command = "/a" || command = "/b" || command = "/c"
value = ifelse(command = "/c", 181, ifelse(command = "/b", 181, 184))

[State 180, Win]
type = changestate
trigger1 = 1
value = 181 + (random % 4)


;====================<WIN 1>====================
[Statedef 181]
type = S
physics = S
anim = 181
ctrl = 0
velset = 0, 0

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;====================<WIN 2>====================
[Statedef 182]
type = S
physics = S
anim = 182
ctrl = 0
velset = 0, 0

[State 182, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 182, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 182, Sound]
type = playsnd
trigger1 = animelem = 5
value = ifelse(map(shadow), 15, 5), 6
channel = 0

[State 182, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 0
;channel = 1


;====================<WIN 3>====================
[Statedef 183]
type = S
physics = S
anim = 183
ctrl = 0
velset = 0, 0

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Sound]
type = playsnd
trigger1 = animelem = 12
value = ifelse(map(shadow), 15, 5), ifelse(random < 500, 5, 4)
channel = 0


;====================<WIN 4>====================
[Statedef 184]
type = S
physics = S
anim = 184
ctrl = 0
velset = 0, 0

[State 184, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 184, Sound]
type = playsnd
trigger1 = animelem = 14
value = ifelse(map(shadow), 15, 5), ifelse(random < 500, 5, 4)
channel = 0


;====================<WIN SHADOW>====================
[Statedef 189]
type = S
physics = S
anim = 189
ctrl = 0
velset = 0, 0

[State 189, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 189, Palfx]
type = palfx
trigger1 = animelemtime(8) = -10
time = 10
sinadd = -255, -255, -255, 40

[State 189, Sound]
type = playsnd
trigger1 = animelem = 8
value = 7, 4

[State 189, FX]
type = explod
trigger1 = animelem = 8
anim = 1306
sprpriority = 0
postype = p1
scale = const(size.xscale), const(size.yscale)
ownpal = 1


;====================<TAUNT>====================
[Statedef 195]
type = S
physics = S
movetype = I
anim = 195
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 195, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 195, Sound]
type = playsnd
trigger1 = animelem = 14
value = ifelse(map(shadow), 15, 5), ifelse(random < 500, 5, 4)
channel = 0

[State 195, Anim]
type = changeanim
trigger1 = !animelemtime(13)
trigger1 = command = "/s"
value = 195
elem = 10

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Alternate -----
[Statedef 196]
type = S
physics = S
movetype = I
anim = 196
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 196, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 0
;channel = 1
volumescale = 67

[State 196, End]
type = changestate
trigger1 = !animtime
value = 0
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
trigger1 = numtarget(1220)
trigger1 = stateno = 1220 || prevstateno = 1220
trigger1 = target(1220), gethitvar(frame)
trigger1 = target(1220), stateno = 5000 || target(1220), stateno = 5010
value = 7070
ID = 1220
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
trigger1 = map(shadow)
trigger1 = numtarget
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
trigger1 = ifelse((stateno = 200 || stateno = 400), (prevstateno != 200 && prevstateno != 400 && prevstateno != 430), 1)
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

;This code would be replaced with ModifyPlayer but it currently has issues when loading a cached character
[State -2, Shadow Life Points]
type = defencemulset
trigger1 = map(shadow)
value = 0.85
onhit = 0
multype = 1
ignorehitpause = 1

;Redundant now that defense affects stun damage
;[State -2, Shadow Stun Points]
;type = dizzypointsset
;trigger1 = map(shadow)
;trigger1 = dizzypoints > (0.85 * dizzypointsmax)
;value = 0.85 * dizzypointsmax
;ignorehitpause = 1

[State -2, Shadow9000]
type = playerpush
trigger1 = map(shadow)
trigger1 = palno = 12
trigger1 = stateno = [0, 105]
value = 0
ignorehitpause = 1

[State -2, Shadow9000]
type = helper
trigger1 = map(shadow)
trigger1 = palno = 12
trigger1 = !numhelper(6010)
trigger1 = time > 0
helpertype = normal
stateno = 6010
ID = 6010
name = "Shadow FX"
postype = p1
supermovetime = 65535
ownpal = 1

[State -2, Shadow9000]
type = sprpriority
trigger1 = map(shadow)
trigger1 = palno = 12
trigger1 = sprpriority > -1
value = -1

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
value = 11, ifelse(map(shadow), 3, 1)
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
value = ifelse(map(shadow), 5010, 5000), (random % 5)
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
value = ifelse(map(shadow), 5010, 5000), (random % 5)
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
value = ifelse(map(shadow), 5010, 5000), (random % 5)
lowpriority = 1
channel = 0

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = ifelse(map(shadow), 5010, 5000), 4
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
trigger1 = stateno = const(StateGuardBreakRecover)
value = ifelse(map(shadow), 5010, 5000), 4
lowpriority = 1
channel = 0

;[State -2, Voice Pos];happens automatically in Ikemen GO 0.99
;type = sndpan
;trigger1 = 1
;channel = 0
;pan = 0
;ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
triggerall = target, time > 0
trigger1 = target, stateno = 5040
trigger2 = target, stateno = 5201
trigger3 = target, movetype != H
trigger3 = target, movereversed = 0
ignorehitpause = 1


;==================================================================================================
;===========================================<STATE -3>=============================================
;==================================================================================================
[Statedef -3]

[State -3, ProjContact Reset]
type = mapset
triggerall = map(projcontact)
trigger1 = stateno != [1000, 1020] && stateno != 1120 && stateno != 3000 && stateno != 3600 && stateno != 3700
trigger2 = stateno = 1000 && animelemtime(5) < 0
trigger3 = stateno = 1120 && animelemtime(4) < 0
trigger4 = stateno = 3000 && anim = 3000 && animelemtime(3) < 0
trigger5 = stateno = 3600 && animelemtime(4) < 0
trigger6 = stateno = 3700 && animelemtime(7) < 0
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
trigger2 = stateno != 1020 && numhelper(1025)
trigger2 = helper(1025), stateno = 1025
trigger3 = stateno != 1120 && numhelper(1125)
trigger3 = helper(1125), stateno = 1125
trigger4 = stateno != 3000 && numhelper(3005)
trigger4 = helper(3005), stateno = 3005
trigger5 = stateno != 3600 && numhelper(3605)
trigger5 = helper(3605), stateno = 3605
trigger6 = stateno != 3700 && numhelper(3705)
trigger6 = helper(3705), stateno = 3705
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
trigger4 = stateno = 200 || stateno = 400 || stateno = 430
trigger5 = stateno = 211
trigger5 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger5 = (movecontact || movereversed) && animelemtime(3) < 0
trigger6 = stateno = 221
trigger6 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger6 = (movecontact || movereversed) && animelemtime(3) < 0
trigger7 = stateno = 600
trigger7 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger7 = (movecontact || movereversed) && animelemtime(2) < 4
trigger8 = stateno = 250
trigger8 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger8 = (movecontact || movereversed) && animelemtime(4) < 0
trigger9 = stateno = 410
trigger9 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger9 = (movecontact || movereversed) && animelemtime(4) < 0
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
triggerall = stateno = [200, 4999]
trigger1 = map(specialcancel)
trigger2 = stateno = 221
trigger2 = ifelse(map(shadow), prevstateno != [200, 699], 1)
trigger2 = (movecontact || movereversed) && animelemtime(4) < 0
trigger3 = stateno = 420
trigger3 = (movecontact || movereversed) && animelemtime(3) < 0
trigger4 = stateno = 1000 || stateno = 1020
trigger4 = animelemtime(5) = [1, 12] && map(projcontact) = [1, 12]
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
trigger1 = map(projcontact) = [1, 24]
trigger2 = stateno = 3100
trigger2 = animelemtime(27) < 0
trigger2 = (movecontact + movereversed) = [1, 12]
trigger3 = stateno = 3200
trigger3 = (movecontact + movereversed) = [1, 12]
trigger4 = stateno = 3301
trigger4 = animelemtime(30) < 0
trigger4 = (movecontact + movereversed) = [1, 12]
trigger5 = stateno = 3500
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

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1 && !map(customcombo)
trigger1 = stateno = 50 && (map(jumptype) = 2 || map(jumptype) = 3)
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
trigger1 = stateno = 3000 && time = 4
trigger2 = stateno = 3200 && time = 4
trigger3 = stateno = 3500 && time = 3
trigger4 = stateno = 3700 && time = 4
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
trigger1 = stateno = 3100 && time = 4
trigger2 = stateno = 3300 && time = 4
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
trigger1 = stateno = 3400 && time = 3
trigger2 = stateno = 3600 && time = 4
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
trigger1 = stateno = 50 || (stateno = [600, 650])
trigger1 = (map(jumptype) = 2 || map(jumptype) = 3) && vel y < -1
trigger2 = stateno = [710, 725]
trigger3 = map(customcombo)
trigger4 = stateno = [3000, 4999]
time = 2
ignorehitpause = 1

[State -3, Afterimage Off]
type = afterimagetime
trigger1 = time <= 1
trigger1 = stateno = 3000 || stateno = 3100 || stateno = 3200 || stateno = 3300 || stateno = 3400 || stateno = 3500 || stateno = 3600 || stateno = 3700
trigger2 = stateno = 3410 && time
trigger3 = stateno = [3411, 3412]
trigger4 = stateno = 3490
time = 0
ignorehitpause = 1

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
trigger2 = numhelper(1000)
trigger2 = helper(1000), map(projcontact)
trigger3 = numhelper(1020)
trigger3 = helper(1020), map(projcontact)
trigger4 = stateno = 810
trigger4 = animelemtime(6) = [0, 1]
trigger5 = stateno = 820
trigger5 = animelemtime(11) = [0, 1]
trigger6 = stateno = 861
trigger6 = time <= 1
trigger7 = stateno = 870
trigger7 = animelemtime(4) = [0, 1]
helpertype = normal
stateno = 8650
ID = 8600
name = "Custom Combo Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -3, Super Finish]
type = helper
triggerall = winHyper
triggerall = roundstate = 3
triggerall = !numhelper(8600)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = movecontact = [1, 4]
trigger1 = stateno = [3000, 4999]
trigger1 = map(superfinish) := stateno
trigger2 = numhelper(3005)
trigger2 = map(projcontact) || (helper(3005), map(projcontact))
trigger2 = map(superfinish) := 3000
trigger3 = stateno = 3412
trigger3 = map(superfinish) := 3400
trigger4 = numhelper(3605) && map(projcontact)
trigger4 = map(superfinish) := 3600
trigger5 = numhelper(3705) && map(projcontact)
trigger5 = map(superfinish) := 3700
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

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
bgm = "nashwin.mp3"
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
