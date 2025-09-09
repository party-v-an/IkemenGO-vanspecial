; ______________________________
;| Bison by Coelasquid and PotS |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = -1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050

[State 0, Steam]
type = playsnd
trigger1 = animelem = 4 && (time % 92) > 46
value = 7, 2

[State 0, Steam]
type = explod
trigger1 = animelem = 4 && (time % 92) > 46
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 112), ceil(const(size.yscale) * -82)
vel = -2, 2
ownpal = 1

[State 0, Steam]
type = explod
trigger1 = animelem = 4 && (time % 92) > 46
anim = 6202
sprpriority = -2
postype = p1
pos = ceil(const(size.xscale) * 136), ceil(const(size.yscale) * -86)
vel = 2, 2
ownpal = 1


;====================<CROUCHING OVERRIDE>====================
[Statedef 10]
type = S
physics = N
movetype = I
sprpriority = -1

[State 10, End]
type = changestate
trigger1 = 1
value = 11


[Statedef 11]
type = S
physics = S
sprpriority = 0
 
[State 11, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)
 
[State 11, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)
 
[State 11, Vel]
type = velset
trigger1 = command = "holdfwd" + command = "holdback" != 1
x = 0
 
[State 11, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animtime = 0
value = 20
 
[State 11, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animtime = 0
value = 21
 
[State 11, Anim]
type = changeanim
triggerall = vel x = 0
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && animtime = 0
value = 0
 
[State 11, End]
type = changestate
trigger1 = command != "holddown"
trigger1 = command = "holdfwd" + command = "holdback" != 1
value = 0

[State 11, Snd]
type = playsnd
trigger1 = anim = 20 && (animelem = 2 || animelem = 3)
trigger2 = anim = 21 && (animelem = 2 || animelem = 3)
value = 0, 20

[State 11, Shake]
type = envshake
trigger1 = anim = 20 && (animelem = 2 || animelem = 3)
trigger2 = anim = 21 && (animelem = 2 || animelem = 3)
time = 4
ampl = -1
freq = 180


[Statedef 12]
type = S
physics = N
movetype = I
sprpriority = -1

[State 12, End]
type = changestate
trigger1 = 1
value = 0


;====================<WALKING>====================
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = -1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

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
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && !animtime
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && !animtime
value = 21

[State 20, Snd]
type = playsnd
trigger1 = anim = 20 && (animelem = 2 || animelem = 3)
trigger2 = anim = 21 && (animelem = 2 || animelem = 3)
value = 0, 20

[State 20, Shake]
type = envshake
trigger1 = anim = 20 && (animelem = 2 || animelem = 3)
trigger2 = anim = 21 && (animelem = 2 || animelem = 3)
time = 4
ampl = -1
freq = 180


;====================<JUMPING>====================
[Statedef 40]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 40, Anim]
type = changeanim
trigger1 = anim != 40
value = 40

[State 40, Direction]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))

[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = 0, 40

[State 40, Vel]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Running]
type = velset
trigger1 = !animtime
trigger1 = sysvar(1) = 1 && prevstateno = 100
x = const(velocity.runjump.fwd.x)

[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1


[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = -1

[State 50, Anim]
type = changeanim
trigger1 = anim != 41
value = 41

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = -1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 52]
type = S
physics = S
movetype = I
ctrl = 1
velset = 0, 0
sprpriority = -1

[State 52, Anim]
type = changeanim
trigger1 = anim != 47
value = 47

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, No walking]
type = assertspecial
trigger1 = anim != 5
flag = nowalk

[State 52, Shake FX]
type = envshake
trigger1 = !time && prevstateno != 6001
time = 12
ampl = -2
freq = 180

[State 52, Shake FX]
type = playsnd
trigger1 = !time && prevstateno != 6001
value = 0, 52

[State 52, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6001
anim = 6200
sprpriority = -3
postype = p1
pos = ceil(const(size.xscale) * -54), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, Turn]
type = changeanim
trigger1 = ctrl && p2dist x < 0
trigger1 = anim != 5
value = 5

[State 52, Turn]
type = turn
trigger1 = anim = 5 && animelem = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RUN>===========================
;--- STARTUP ---
[Statedef 102]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = -1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 102, Anim]
type = changeanim
trigger1 = anim != 102
value = 102

[State 102, Steam]
type = playsnd
trigger1 = animelem = 3
value = 7, 2

[State 102, Steam]
type = explod
trigger1 = animelem = 3
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 112), ceil(const(size.yscale) * -82)
vel = -2, 2
ownpal = 1

[State 102, Steam]
type = explod
trigger1 = animelem = 3
anim = 6202
sprpriority = -2
postype = p1
pos = ceil(const(size.xscale) * 136), ceil(const(size.yscale) * -86)
vel = 2, 2
ownpal = 1

[State 102, End]
type = changestate
trigger1 = !animtime
value = 100


;--- RUNNING ---
[Statedef 100]
type = S
physics = N
movetype = A
ctrl = 0
sprpriority = 1
velset = vel x * (prevstateno = 6001), vel y * (prevstateno = 6001)

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 100, Anim]
type = changeanim
trigger1 = anim != 100
value = 100

[State 100, Pos]
type = posset
trigger1 = 1
y = 0

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)
y = 0

[State 100, Dust]
type = explod
trigger1 = !time && prevstateno != 6001
anim = 6203
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 100, Shake FX]
type = envshake
trigger1 = animelem = 3
time = 10
ampl = -2
freq = 180

[State 100, Shake FX]
type = playsnd
trigger1 = (animelem = 2 || animelem = 3)
value = 0, 20

[State 100, Dust]
type = explod
trigger1 = (gametime % 4) = 0
anim = 6201
sprpriority = 2
postype = p1
pos = 0, 4
random = 16, 8
vel = -1 - (random / 500.0), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 100, Dust]
type = explod
trigger1 = (gametime % 4) = 2
anim = 6201
sprpriority = -2
postype = p1
pos = 0, -4
random = 16, 8
vel = -1 - (random / 500.0), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Hit]
type = hitdef
trigger1 = (hitcount % 2) = 0
trigger1 = !((movecontact + movereversed) % 4)
attr = S, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 30, 8
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -9.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -9.0
guard.cornerpush.veloff = 0
air.velocity = -6.0, -12.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ceil(const(size.yscale) * -146)

[State 100, Hit]
type = hitdef
trigger1 = (hitcount % 2) = 1
trigger1 = !((movecontact + movereversed) % 4)
attr = S, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 30, 8
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -9.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -9.0
guard.cornerpush.veloff = 0
air.velocity = -6.0, -12.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.6
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ceil(const(size.yscale) * -146)

[State 100, End]
type = changestate
triggerall = time >= 16
trigger1 = time >= 64
trigger2 = frontedgebodydist <= 0 && movecontact >= 8
trigger3 = !AIlevel
trigger3 = command != "holdfwd"
trigger4 = numenemy
trigger4 = moveguarded = 1 || (movehit = 1 && hitcount >= 5)
trigger4 = enemynear, backedgebodydist <= 0 || enemynear, frontedgebodydist <= 0
value = 101


;--- STOP ---
[Statedef 101]
type = S
physics = S
movetype = I
ctrl = 0
sprpriority = -1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 101, Anim]
type = changeanim
trigger1 = anim != 101
value = 101

[State 101, Snd]
type = playsnd
trigger1 = !time && prevstateno != 6001
value = 0, 101

[State 101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<BACK DASH>==========================
[Statedef 105]
type = A
physics = N
movetype = I
ctrl = 0
velset = vel x * (prevstateno = 6001), vel y * (prevstateno = 6001)
sprpriority = -1

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 105, Anim]
type = changeanim
trigger1 = anim != 105
value = 105

[State 105, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 105

[State 105, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.5

[State 105, Vel]
type = velset
trigger1 = animelem = 4
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Ctrl]
type = ctrlset
trigger1 = animelem = 4
value = 1

[State 105, Land]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 106


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
velset = 0, 0

[State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State 106, Anim]
type = changeanim
trigger1 = anim != 106
value = 106

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Shake FX]
type = envshake
trigger1 = !time && prevstateno != 6001
time = 12
ampl = -2
freq = 180

[State 106, Shake FX]
type = playsnd
trigger1 = !time && prevstateno != 6001
value = 0, 52

[State 106, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6001
anim = 6200
sprpriority = -3
postype = p1
pos = ceil(const(size.xscale) * -54), 0
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


;====================<LOSE>====================
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, Assert]
type = assertspecial
trigger1 = time < 300
flag = roundnotover


;====================<DRAW GAME>====================
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0

[State 175, switch]
type = changestate
trigger1 = !time
value = 170


;===========<Weak Attack>==========
[Statedef 200]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
movehitpersist = (prevstateno = 6001)
hitcountpersist = (prevstateno = 6001)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 200, Anim]
type = changeanim
trigger1 = anim != 200
trigger2 = !time && prevstateno = 200
value = 200

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 2
value = 4, ifelse(random < 500, 0, 1)
channel = 4

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 2
value = 1, 0
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = animelemtime(2) >= 0
trigger1 = !movecontact && !movereversed
ID = 200
attr = A, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 40, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10
ground.slidetime = 10
guard.hittime = 10
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -6.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -6.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 1
guard.sparkno = 40
sparkxy = -10, floor(const(size.yscale) * -140)

[State 200, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 200, End]
type = changestate
trigger1 = !animtime
trigger2 = var(42) > 0 && animelemtime(3) > 0
trigger2 = animelemtime(3) + var(42) >= 4
trigger2 = var(42) := 0
value = 0
ctrl = 1


;===========<Medium Attack>==========
[Statedef 210]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
movehitpersist = (prevstateno = 6001)
hitcountpersist = (prevstateno = 6001)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim != 210
value = 210

[State 210, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 2
value = 4, ifelse(random < 500, 1, 2)
channel = 4

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && var(45) != 3
value = 1, 1
channel = 1

[State 210, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x > 1.0, -1.0, ifelse(vel x < -1.0, 1.0, -vel x))

[State 210, Vel]
type = velset
trigger1 = animelem = 3
x = 6.0

[State 210, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !movecontact && !movereversed
ID = 200
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 80, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 14
ground.slidetime = 14
guard.hittime = 14
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -9.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -9.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, floor(const(size.yscale) * -140)

[State 210, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

[State 210, End]
type = changestate
trigger1 = !animtime
trigger2 = var(42) > 0 && animelemtime(4) > 0
trigger2 = animelemtime(4) + var(42) >= 8
trigger2 = var(42) := 0
value = 0
ctrl = 1


;===========<Strong Attack>==========
[Statedef 220]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
movehitpersist = (prevstateno = 6001)
hitcountpersist = (prevstateno = 6001)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim != 220
value = 220

[State 220, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 2
value = 4, ifelse(random < 500, 3, 4)
channel = 4

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && var(45) != 3
value = 1, 2
channel = 1

[State 220, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x > 1.0, -1.0, ifelse(vel x < -1.0, 1.0, -vel x))

[State 220, Vel]
type = velset
trigger1 = animelem = 3
x = 12.0

[State 220, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !movecontact && !movereversed
ID = 200
attr = S, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 120, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -12.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 3
guard.sparkno = 40
sparkxy = -10, floor(const(size.yscale) * -140)

[State 220, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
trigger2 = var(42) > 0 && animelemtime(4) > 0
trigger2 = animelemtime(4) + var(42) >= 16
trigger2 = var(42) := 0
value = 0
ctrl = 1


;===========<Running Attack>==========
[Statedef 230]
type = S
physics = N
movetype = A
ctrl = 0
velset = vel x * (prevstateno = 6001), vel y * (prevstateno = 6001)
sprpriority = 1
poweradd = 0
facep2 = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 230, Anim]
type = changeanim
trigger1 = anim != 230
value = 230

[State 230, Snd]
type = playsnd
trigger1 = animelem = 1 && var(45) != 1
value = 5, 0
channel = 4

[State 230, Snd]
type = playsnd
trigger1 = animelem = 1 && var(45) != 1
value = 1, 4
channel = 1

[State 230, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x > 1.0, -1.0, ifelse(vel x < -1.0, 1.0, -vel x))

[State 230, Vel]
type = velset
trigger1 = !time && prevstateno != 6001
x = 16.0

[State 230, Dust]
type = explod
trigger1 = !time && prevstateno = 102
anim = 6203
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 230, Dust]
type = explod
trigger1 = (gametime % 4) = 0 && vel x > 1
anim = 6201
sprpriority = 2
postype = p1
pos = 0, 4
random = 16, 8
vel = -1 - (random / 500.0), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 230, Dust]
type = explod
trigger1 = (gametime % 4) = 2 && vel x > 1
anim = 6201
sprpriority = -2
postype = p1
pos = 0, -4
random = 16, 8
vel = -1 - (random / 500.0), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 230, Hit]
type = hitdef
trigger1 = !(time % 4) && animelemtime(2) < 0
attr = S, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 40, 10
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
ground.velocity = -6.0, -8.0
ground.cornerpush.veloff = 0
guard.velocity = -9.0
guard.cornerpush.veloff = 0
air.velocity = -6.0, -8.0 + cond(!numenemy, 0, enemynear, gethitvar(hitcount) * 0.25)
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ceil(const(size.yscale) * -146)

[State 230, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I

[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===========<Jumping Light Attack>==========
[Statedef 600]
type = A
physics = N
movetype = A
ctrl = 0
movehitpersist = (prevstateno = 6001)
hitcountpersist = (prevstateno = 6001)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 600, Anim]
type = changeanim
trigger1 = anim != 600
value = 600

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 3
value = 4, ifelse(random < 500, 0, 1)
channel = 4

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 3
value = 1, 0
channel = 1

[State 600, Accel]
type = gravity
trigger1 = time

[State 600, Hit]
type = hitdef
trigger1 = animelemtime(2) >= 0
trigger1 = !movecontact && !movereversed
ID = 600
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 40, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10
ground.slidetime = 10
guard.hittime = 10
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -6.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -6.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 1
guard.sparkno = 40
sparkxy = -10, floor(const(size.yscale) * -180)
p1sprpriority = 1

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 600, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52



;===========<Jumping Medium Attack>==========
[Statedef 610]
type = A
physics = N
movetype = A
ctrl = 0
movehitpersist = (prevstateno = 6101)
hitcountpersist = (prevstateno = 6101)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 610, Anim]
type = changeanim
trigger1 = anim != 610
value = 610

[State 610, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 3
value = 4, ifelse(random < 500, 1, 2)
channel = 4

[State 610, Snd]
type = playsnd
trigger1 = animelem = 2 && var(45) != 3
value = 1, 0
channel = 1

[State 610, Accel]
type = gravity
trigger1 = time

[State 610, Hit]
type = hitdef
trigger1 = animelemtime(2) >= 0
trigger1 = !movecontact && !movereversed
ID = 610
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 80, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 10
ground.slidetime = 10
guard.hittime = 14
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = -6.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -9.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, floor(const(size.yscale) * -200)
p1sprpriority = 1

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 610, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;===========<Jumping Hard Attack>==========
[Statedef 620]
type = A
physics = N
movetype = A
ctrl = 0
movehitpersist = (prevstateno = 6201)
hitcountpersist = (prevstateno = 6201)
sprpriority = 1
poweradd = 0

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 620, Anim]
type = changeanim
trigger1 = anim != 620
value = 620

[State 620, Snd]
type = playsnd
trigger1 = animelem = 3 && var(45) != 3
value = 4, 7
channel = 4

[State 620, Snd]
type = playsnd
trigger1 = animelem = 3 && var(45) != 3
value = 1, 5
channel = 1

[State 620, Push]
type = playerpush
trigger1 = 1
value = 0

[State 620, Accel]
type = veladd
trigger1 = 1
y = 1.0

[State 620, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x > 0.125, -0.125, ifelse(vel x < -0.125, 0.125, -vel x))

[State 620, Vel]
type = velset
trigger1 = !time
trigger1 = prevstateno != 6201
y = -9.0

[State 620, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !movecontact && !movereversed
ID = 620
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 70, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
airguard.ctrltime = 16
ground.velocity = 0, 8.0
ground.cornerpush.veloff = 0
guard.velocity = -12.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 3
guard.sparkno = 40
sparkxy = -10, 0
p1sprpriority = 1
p2sprpriority = 0

[State 620, P2 State]
type = targetstate
trigger1 = movehit && numtarget(620)
trigger1 = !(target(620), time)
trigger1 = (target(620), stateno = 5000) || (target(620), stateno = 5010)
value = 5980
ID = 620
ignorehitpause = 1

[State 620, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 621


;--- Land ---
[Statedef 621]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = -1

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 621, Anim]
type = changeanim
trigger1 = anim != 621
value = 621

[State 621, Pos]
type = posset
trigger1 = 1
y = 0

[State 621, Shake FX]
type = envshake
trigger1 = !time && prevstateno != 6201
time = 12
ampl = -2
freq = 180

[State 621, Shake FX]
type = playsnd
trigger1 = !time && prevstateno != 6201
value = 7, 0

[State 621, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6201
anim = 6204
sprpriority = -3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 621, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6201
anim = 6205
sprpriority = 1
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 621, Hit]
type = hitdef
trigger1 = animelemtime(2) < 0
trigger1 = !movecontact && !movereversed
attr = S, NA
hitflag = FD
guardflag = MA
priority = 4, Hit
damage = 70, 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 20
airguard.ctrltime = 16
down.hittime = 20
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = -12.0
guard.cornerpush.veloff = 0
air.velocity = -8.0, -8.0
air.cornerpush.veloff = 0
airguard.velocity = -8.0, -1.0
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yaccel = 0.60
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = 3
guard.sparkno = 40
sparkxy = -10, -12
p1sprpriority = 1
p2sprpriority = 0

[State 621, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = I

[State 621, End]
type = changestate
trigger1 = !animtime
trigger2 = var(42) > 0 && animelemtime(4) > 0
trigger2 = animelemtime(4) + var(42) >= 2
trigger2 = var(42) := 0
value = 0
ctrl = 1


;--- Target Slammed Against Ground ---
[Statedef 5980]
type = A
movetype = H
physics = N
velset = 0, 0

[State 5980, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5980), 5980, 5012)

[State 5980, End]
type = selfstate
trigger1 = hitshakeover && pos y < 0
value = 5030

[State 5980, End]
type = changestate
trigger1 = hitshakeover && pos y >= 0
value = 5981


[Statedef 5981]
type = L
movetype = H
physics = N
velset = 0, 0

[State 5981, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 5981, Anim]
type = changeanim
trigger1 = (anim != [5170, 5171]) && !animtime
value = ifelse(selfanimexist(5171), 5171, 5170)

[State 5981, Pos]
type = posset
trigger1 = 1
y = 0

[State 5981, Damage]
type = hitfalldamage
trigger1 = !time

[State 5981, Shake]
type = envshake
trigger1 = !time
time = 14
ampl = -2
freq = 180

[State 5981, Snd]
type = playsnd
trigger1 = !time
value = f7, 1

[State 5981, FX]
type = explod
trigger1 = !time
anim = f61
postype = p1
pos = 0, 0
sprpriority = -3

[State 5981, Var]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 5981, End]
type = selfstate
trigger1 = !animtime || time >= 8
value = 5110


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
[Statedef 5900]
type = S

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

[State 5900, Intro]
type = changestate
trigger1 = !roundsexisted
value = ifelse(random < 500, 192, 190)

[State 5900, End]
type = changestate
trigger1 = 1
value = 0


;====================<INTRO JUMP>====================
[Statedef 190]
type = A
anim = 190
velset = 0, 0
sprpriority = -1
ctrl = 0

[State 190, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 190, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 190, Camera]
type = helper
trigger1 = !numhelper(8990)
helpertype = normal
stateno = 8990
ID = 8990
name = "Camera"
postype = p1

[State 190, Pos]
type = posset
trigger1 = !time
x = gamewidth * facing * (-0.75)

[State 190, Vel]
type = velset
trigger1 = !time
x = (helper(8990), rootdist x) / -40.0
y = -10.25

[State 190, Vel]
type = veladd
trigger1 = 1
y = 0.5

[State 190, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0 && (pos y > -vel y)
value = 191


;--- Land ---
[Statedef 191]
type = S
physics = S
anim = 191
velset = 0, 0
sprpriority = -1

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Pos]
type = posset
trigger1 = !time && numhelper(8990)
x = ceil(helper(8990), pos x)

[State 191, Pos]
type = posset
trigger1 = !time
y = 0

[State 191, Shake]
type = envshake
trigger1 = time < 24
trigger1 = !(time % 3)
time = 3
ampl = 6 - ceil(time * 0.2)
freq = 180

[State 191, Shake FX]
type = playsnd
trigger1 = !time
value = 0, 52

[State 191, Shake FX]
type = explod
trigger1 = !time
anim = 6200
sprpriority = -3
postype = p1
pos = ceil(const(size.xscale) * -54), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 191, Sound]
type = playsnd
trigger1 = animelem = 3 && var(45) != 3
value = 6, 0
channel = 4

[State 191, Steam]
type = playsnd
trigger1 = animelemtime(3) = 8
value = 7, 2

[State 191, Steam]
type = explod
trigger1 = animelemtime(3) = 8 && animelemtime(4) < 0
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 65), ceil(const(size.yscale) * -244)
vel = -2, 2
ownpal = 1

[State 191, Steam]
type = explod
trigger1 = animelemtime(3) = 8 && animelemtime(4) < 0
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 102), ceil(const(size.yscale) * -248)
vel = 2, 2
ownpal = 1

[State 191, Snd]
type = playsnd
trigger1 = animelem = 6
value = 6, ifelse(random < 500, 2, 0)
channel = 4

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO WALK>====================
[Statedef 192]
type = S
anim = 20
velset = 0, 0
sprpriority = -1
ctrl = 0

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Camera]
type = helper
trigger1 = !numhelper(8990)
helpertype = normal
stateno = 8990
ID = 8990
name = "Camera"
postype = p1

[State 192, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 192, Pos]
type = posadd
trigger1 = !time
x = -288

[State 192, Vel]
type = velset
trigger1 = 1
x = 4.0

[State 191, Sound]
type = playsnd
trigger1 = time = 8
value = 6, 4
channel = 4

[State 192, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 3
value = 0, 20

[State 192, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3
time = 3
ampl = -2
freq = 180

[State 192, End]
type = changestate
trigger1 = time >= 72
trigger2 = numhelper(8990)
trigger2 = (helper(8990), pos x - pos x) * facing <= 0
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S

[State 180, Win]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 183, ifelse(random < 500, 182, 181))


;====================<WIN GRASS>====================
[Statedef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 181, Chew]
type = playsnd
trigger1 = animelem = 5
value = 7, 3 + (random % 4)
channel = 1
freqmul = 0.9 + (random / 5000.0)

[State 181, Guile]
type = helper
trigger1 = !numhelper(6100)
trigger1 = time = 30 && random < 500
helpertype = normal
stateno = 6100
ID = 6100
name = "Guile"
postype = p1
size.xscale = 0.83
size.yscale = 1.00
ownpal = 1


;====================<WIN STARE>====================
[Statedef 182]
type = S
physics = S
anim = 182
ctrl = 0

[State 182, Assert]
type = assertspecial
trigger1 = time < 240
flag = roundnotover

[State 182, Sound]
type = playsnd
trigger1 = animelem = 2
value = 6, ifelse(random < 250, 3, 1)
channel = 4

[State 182, Steam]
type = playsnd
trigger1 = animelemtime(2) = 8
value = 7, 2

[State 182, Steam]
type = explod
trigger1 = animelemtime(2) = 8
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 65), ceil(const(size.yscale) * -244)
vel = -2, 2
ownpal = 1

[State 182, Steam]
type = explod
trigger1 = animelemtime(2) = 8
anim = 6202
sprpriority = 0
postype = p1
pos = ceil(const(size.xscale) * 102), ceil(const(size.yscale) * -248)
vel = 2, 2
ownpal = 1


;====================<WIN PUMMEL>====================
[Statedef 183]
type = A
anim = 183
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 183, Assert]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 183, Sound]
type = playsnd
trigger1 = !time
value = 6, 5
channel = 4

[State 183, Sound]
type = playsnd
trigger1 = time = 80
value = 6, 6
channel = 4

[State 183, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
y = 1.0

[State 183, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 183, Vel]
type = velset
trigger1 = animelem = 2 && numenemy
x = ((playerID(enemynear, ID), pos x - pos x + ceil(const(size.xscale) * 54)) * facing) / 19.0

[State 183, Vel]
type = velset
trigger1 = animelem = 2
y = -10.0

[State 183, Vel]
type = velset
trigger1 = animelem = 2 && numenemy
x = ((playerID(enemynear, ID), pos x - pos x + ceil(const(size.xscale) * 54)) * facing) / 20.0

[State 183, Vel]
type = velset
trigger1 = animelemtime(2) < 0
trigger2 = animelemtime(4) >= 0
x = 0
y = 0

[State 183, Pos]
type = posset
trigger1 = animelemtime(2) < 0
trigger2 = animelemtime(4) >= 0
y = 0

[State 183, Shake]
type = envshake
trigger1 = animelem = 4
time = 12
ampl = -2
freq = 180

[State 183, Shake FX]
type = playsnd
trigger1 = animelem = 4
value = 0, 52

[State 183, Shake FX]
type = explod
trigger1 = animelem = 4
anim = 6200
sprpriority = -3
postype = p1
pos = ceil(const(size.xscale) * -54), 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 183, Dust]
type = explod
trigger1 = time >= 24 && numexplod(6201) < 32
anim = 6201
ID = 6201
sprpriority = 2
postype = p1
pos = ceil(const(size.xscale) * -54), ceil(-pos y - 8)
random = 64, 16
vel = -1 + (random / 500.0), -1 + (random / 500.0)
ownpal = 1

[State 183, Dust]
type = explod
trigger1 = time >= 24 && numexplod(6201) < 32
anim = 6201
ID = 6201
sprpriority = 2
postype = p1
pos = ceil(const(size.xscale) * -54), ceil(-pos y - 8)
random = 128, 32
vel = -1 + (random / 500.0), -1 + (random / 500.0)
ownpal = 1


;====================<TAUNT>====================
[Statedef 195]
type = S
physics = S
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = -1

[State Var]
type = varset
trigger1 = 1
var(41) = stateno
ignorehitpause = 1

[State 195, Anim]
type = changeanim
trigger1 = anim != 195
value = 195

[State 195, Sound]
type = playsnd
trigger1 = animelem = 2 && var(45) != 2
value = 6, 2
channel = 4

[State 195, End]
type = changeanim
trigger1 = !AIlevel
trigger1 = !animtime
trigger1 = roundstate = 2
trigger1 = command = "holdstart"
value = 195
elem = 8 + 0 * (var(42) := 0)

[State 195, Chew]
type = playsnd
trigger1 = animelem = 5 || animelem = 9
value = 7, 3 + (random % 4)
channel = 1
freqmul = 0.9 + (random / 5000.0)

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<HIT STATES>====================
;--- Standing Hit Shake ---
[Statedef 5000]
type = S
physics = N
movetype = H
velset = 0, 0

[State 5000, 1]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3, 5]
value = ifelse((gethitvar(groundtype) = 1), 5000, 5010) + gethitvar(animtype)

[State 5000, 2]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3, 5]
value = 5030

[State 5000, 3]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4, 5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[State 5000, 4]
type = changeanim
trigger1 = time > 0
value = anim

[State 5000, 5]
type = Statetypeset
trigger1 = !time
trigger1 = gethitvar(yvel) != 0 || gethitvar(fall)
trigger2 = pos y != 0
statetype = A

[State 5000, 6]
type = selfstate
trigger1 = hitshakeover
trigger1 = gethitvar(yvel) = 0 && !gethitvar(fall)
value = 5001

[State 5000, 7]
type = selfstate
trigger1 = hitshakeover
value = 5030


;--- Standing Hit Slide ---
[Statedef 5001]
type = S
physics = S
movetype = H

[State 5001, 1]
type = hitvelset
trigger1 = !time
x = 1

[State 5001, 2]
type = changeanim
trigger1 = !animtime
value = 5005 + gethitvar(animtype) + (gethitvar(groundtype) = 2) * 10

[State 5001, 3]
type = velmul
trigger1 = time >= gethitvar(slidetime)
x = 0.6

[State 5001, 4]
type = velset
trigger1 = hitover
x = 0

[State 5001, 5]
type = defencemulset
trigger1 = hitover
value = 1

[State 5001, 6]
type = selfstate
trigger1 = hitover
value = 0
ctrl = 1

;--- Crouching Hit Slide ---
[Statedef 5010]
type = C
physics = N
movetype = H
velset = 0, 0

[State 5010, 1]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3, 5]
value = 5020 + gethitvar(animtype)

[State 5010, 2]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3, 5]
value = 5030

[State 5010, 3]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4, 5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[State 5010, 4]
type = changeanim
trigger1 = time > 0
value = anim

[State 5010, 5]
type = statetypeset
triggerall = !time
trigger1 = gethitvar(yvel) != 0 || gethitvar(fall)
trigger2 = pos y != 0
statetype = A

[State 5010, 6]
type = selfstate
trigger1 = hitshakeover
trigger1 = gethitvar(yvel) = 0 && !gethitvar(fall)
value = 5011

[State 5010, 7]
type = selfstate
trigger1 = hitshakeover
value = 5030


;--- Crouching Hit Slide ---
[Statedef 5011]
type = C
physics = C
movetype = H

[State 5011, 1]
type = hitvelset
trigger1 = !time
x = 1

[State 5011, 2]
type = changeanim
trigger1 = !animtime
value = 5025 + gethitvar(animtype)

[State 5011, 3]
type = velmul
trigger1 = time >= gethitvar(slidetime)
x = 0.6

[State 5011, 4]
type = velset
trigger1 = hitover
x = 0

[State 5011, 5]
type = defencemulset
trigger1 = hitover
value = 1

[State 5011, 6]
type = selfstate
trigger1 = hitover
value = 11
ctrl = 1


;--- Air Hit Shake ---
[Statedef 5020]
type = A
physics = N
movetype = H
velset = 0, 0

[State 5020, 1]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3, 5]
value = ifelse((gethitvar(airtype) = 1), 5000, 5010) + gethitvar(animtype)

[State 5020, 2]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3, 5]
value = 5030

[State 5020, 3]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4, 5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[State 5020, 4]
type = changeanim
trigger1 = time > 0
value = anim

[State 5020, 5]
type = selfstate
trigger1 = hitshakeover
value = 5030


;--- Air Hit Going Up ---
[Statedef 5030]
type = A
physics = N
movetype = H
ctrl = 0

[State 5030, 1]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5030, 2]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 5030, 3]
type = selfstate
triggerall = !hitfall
trigger1 = hitover
trigger2 = vel y > 0
trigger2 = pos y >= 10
value = 5040

[State 5030, 4]
type = selfstate
triggerall = hitfall
trigger1 = hitover
trigger2 = vel y > 0
trigger2 = pos y >= 10
value = 5050

[State 5030, 5]
type = selfstate
trigger1 = !animtime
value = 5035


;--- Air Hit Transition ---
[Statedef 5035]
type = A
physics = N
movetype = H

[State 5035, 1]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5035)
trigger1 = anim != [5051, 5059]
trigger1 = anim != 5090
value = 5035

[State 5035, 2]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5035, 3]
type = selfstate
triggerall = !hitfall
trigger1 = hitover
trigger2 = !animtime
trigger3 = vel y > 0
trigger3 = pos y >= 10
trigger4 = !time
trigger4 = anim != 5035
value = 5040

[State 5035, 4]
type = selfstate
triggerall = hitfall
trigger1 = hitover
trigger2 = !animtime
trigger3 = vel y > 0
trigger3 = pos y >= 10
trigger4 = !time
trigger4 = anim != 5035
value = 5050


;--- Air Hit Recovery ---
[Statedef 5040]
type = A
physics = N
movetype = H

[State 5040, 1]
type = selfstate
trigger1 = !alive
value = 5050

[State 5040, 2]
type = changeanim
trigger1 = !animtime
trigger1 = anim != 5040
trigger2 = !time
trigger2 = anim != 5035
value = 5040

[State 5040, 3]
type = Ctrlset
trigger1 = hitover
value = 1

[State 5040, 4]
type = Statetypeset
trigger1 = hitover
movetype = i

[State 5040, 5]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5040, 6]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 52


;--- Air Hit Falling ---
[Statedef 5050]
type = A
physics = N
movetype = H

[State 5050, 1]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
trigger2 = !time
trigger2 = anim != 5035
trigger2 = (anim != [5051, 5059]) && (anim != [5061, 5069])
trigger2 = anim != 5090
value = 5050

[State 5050, 2]
type = changeanim
trigger1 = anim = [5050, 5059]
trigger1 = vel y >= ifelse(anim = 5050, 1, -2)
trigger1 = selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 5050, 3]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5050, 4]
type = selfstate
triggerall = vel y > 0
triggerall = pos y >= -20
triggerall = alive
triggerall = canrecover
trigger1 = !AIlevel
trigger1 = command = "recovery"
trigger2 = AIlevel
trigger2 = random < (100 * (AIlevel ** 2 / 64.0))
value = 5200

[State 5050, 5]
type = selfstate
triggerall = vel y > -1
triggerall = alive
triggerall = canrecover
trigger1 = !AIlevel
trigger1 = command = "recovery"
trigger2 = AIlevel
trigger2 = random < (100 * (AIlevel ** 2 / 64.0))
value = 5210

[State 5050, 6]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= ifelse((anim = [5051, 5059]) || (anim = [5061, 5069]), 0, 25)
value = 5100


;--- Trip Shake ---
[Statedef 5070]
type = A
physics = N
movetype = H
velset = 0, 0

[State 5070, 1]
type = changeanim
trigger1 = 1
value = 5070

[State 5070, 2]
type = selfstate
trigger1 = hitshakeover
value = 5071


;--- Trip Falling ---
[Statedef 5071]
type = A
physics = N
movetype = H

[State 5071, 1]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 5071, 2]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5071, 3]
trigger1 = vel y > 0
trigger1 = pos y >= 15
type = selfstate
value = 5110


;--- Ground Hit Shake ---
[Statedef 5080]
type = L
physics = N
movetype = H
velset = 0, 0

[State 5080, 1]
type = varset
trigger1 = !time
sysvar(2) = ifelse (gethitvar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = varadd
trigger1 = !time
trigger1 = (anim = [5081, 5089]) || (anim = [5111, 5119])
trigger1 = selfanimexist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3]
type = varset
trigger1 = !time
trigger1 = sysvar(2) = 5090
trigger1 = !selfanimexist(5090)
sysvar(2) = 5030

[State 5080, 3]
type = changeanim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = selfstate
trigger1 = hitshakeover
trigger1 = gethitvar(yvel) = 0
value = 5081

[State 5080, 5]
type = selfstate
trigger1 = hitshakeover
trigger1 = gethitvar(yvel) != 0
value = 5030


;--- Ground Hit Slide ---
[Statedef 5081]
type = L
physics = C
movetype = H

[State 5081, 1]
type = hitvelset
trigger1 = !time
x = 1

[State 5081, 2]
type = velset
trigger1 = hitover
x = 0

[State 5081, 3]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 5081, 4]
type = selfstate
trigger1 = hitover
value = 5110


;--- Hit Ground ---
[Statedef 5100]
type = L
physics = N
movetype = H

[State 5100, 1]
type = velset
trigger1 = !time
trigger1 = gethitvar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, Var]
type = varset
trigger1 = !time
sysvar(1) = floor(vel y)

[State 5100, 2]
type = changeanim
triggerall = !time
trigger1 = (anim != [5051, 5059]) && (anim != [5061, 5069])
trigger2 = !selfanimexist(5100 + (anim % 10))
value = 5100

[State 5100, 3]
type = changeanim
trigger1 = !time
trigger1 = (anim = [5051, 5059]) || (anim = [5061, 5069])
trigger1 = selfanimexist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = posset
trigger1 = !time
y = 0

[State 5100, 5]
type = velset
trigger1 = !time
y = 0

[State 5100, 6]
type = velmul
trigger1 = !time
x = 0.75

[State 5100, Shake FX]
type = envshake
trigger1 = !time && prevstateno != 6001
time = 12
ampl = -2
freq = 180

[State 5100, Shake FX]
type = playsnd
trigger1 = !time && prevstateno != 6001
value = 7, 0

[State 5100, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6001
anim = 6204
sprpriority = -3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5100, Shake FX]
type = explod
trigger1 = !time && prevstateno != 6001
anim = 6205
sprpriority = 1
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5100, Hurt]
type = hitfalldamage
trigger1 = !time

[State 5100, 11]
type = posfreeze
trigger1 = 1

[State 5110, Var]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 5100, 12]
type = selfstate
trigger1 = !animtime
value = 5110


;--- Hit Ground Bounce ---
[Statedef 5101]
type = L
physics = N
movetype = H

[State 5101, 1]
type = changeanim
triggerall = !time
trigger1 = anim != [5101, 5109]
trigger2 = !selfanimexist(5160 + (anim % 10))
value = 5160

[State 5101, 2]
type = changeanim
triggerall = !time
trigger1 = anim = [5101, 5109]
trigger1 = selfanimexist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = hitfallvel
trigger1 = !time

[State 5101, 4]
type = posset
trigger1 = !time
y = 20

[State 5101, 5]
type = veladd
trigger1 = 1
y = 0.4

[State 5101, 6]
trigger1 = vel y > 0
trigger1 = pos y >= 12
type = selfstate
value = 5110


;--- Lie Down ---
[Statedef 5110]
type = L
physics = N
movetype = H

[State 5110, envshake]
type = fallenvshake
trigger1 = !time

[State 5110, 1]
type = changeanim
trigger1 = selfanimexist(5110 + (anim % 10))
trigger1 = anim = [5081, 5089]
value = 5110 + (anim % 10)
persistent = 0

[State 5110, 2]
type = changeanim
triggerall = !time
triggerall = anim != [5110, 5119]
trigger1 = anim != [5161, 5169]
trigger2 = !selfanimexist(5170 + (anim % 10))
value = 5170

[State 5110, 3]
type = changeanim
triggerall = !time
triggerall = anim != [5110, 5119]
trigger1 = anim = [5161, 5169]
trigger1 = selfanimexist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = hitfalldamage
trigger1 = !time

[State 5110, 5]
type = posset
trigger1 = !time
y = 0

[State 5110, Var]
type = varset
trigger1 = !time
trigger1 = gethitvar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, Shake FX]
type = envshake
trigger1 = !time && !sysvar(0) && prevstateno != 6001
time = 12
ampl = -2
freq = 180

[State 5110, Shake FX]
type = playsnd
trigger1 = !time && !sysvar(0) && prevstateno != 6001
value = 7, 0

[State 5110, Shake FX]
type = explod
trigger1 = !time && !sysvar(0) && prevstateno != 6001
anim = 6204
sprpriority = -3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5110, Shake FX]
type = explod
trigger1 = !time && !sysvar(0) && prevstateno != 6001
anim = 6205
sprpriority = 1
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5110, 8]
type = velset
trigger1 = !time
y = 0

[State 5110, 9]
type = changeanim
triggerall = anim = [5171, 5179]
triggerall = selfanimexist(5110 + (anim % 10))
trigger1 = !animtime
trigger2 = sysvar(0)
value = 5110 + (anim % 10)
persistent = 0

[State 5110, 10]
type = changeanim
triggerall = anim != [5111, 5119]
trigger1 = !animtime
trigger2 = sysvar(0)
value = 5110
persistent = 0

[State 5110, 11]
type = selfstate
triggerall = !alive
trigger1 = !animtime
trigger2 = sysvar(0)
trigger3 = anim = [5110, 5119]
value = 5150

[State 5110, 12]
type = varset
trigger1 = sysvar(0)
trigger1 = !time
sysvar(0) = 0

[State 5110, 13]
type = velmul
trigger1 = 1
x = 0.85


;--- Get Up ---
[Statedef 5120]
type = L
movetype = i
physics = N

[State 5120, 1a]
type = changeanim
triggerall = !time
trigger1 = anim != [5111, 5119]
trigger2 = !selfanimexist(5120 + (anim % 10))
value = 5120

[State 5120, 1b]
type = changeanim
triggerall = !time
trigger1 = anim = [5111, 5119]
trigger1 = selfanimexist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 5120, 2]
type = velset
trigger1 = !time
x = 0

[State 5120, 3]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5120, 4]
type = hitfallset
trigger1 = !animtime
value = 1

[State 5120, 5]
type = nothitby
trigger1 = !animtime
value = , NT, ST, HT
time = 12

[State 5120, 6]
type = nothitby
trigger1 = !animtime
value2 = SCA
time = 3

[State 5120, 7]
type = selfstate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Lie Dead ---
[Statedef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, 1]
type = changeanim
triggerall = !time
triggerall = selfanimexist(5140)
trigger1 = (anim != [5111, 5119]) && (anim != [5171, 5179])
trigger2 = !selfanimexist(5140 + (anim % 10))
value = 5140

[State 5150, 3]
type = changeanim
trigger1 = !time
trigger1 = (anim = [5111, 5119]) || (anim = [5171, 5179])
trigger1 = selfanimexist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4]
type = changeanim
trigger1 = matchover = 1
trigger1 = anim = [5140, 5149]
trigger1 = selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 5150, 5]
type = changeanim
trigger1 = !time
trigger1 = anim != [5140, 5159]
trigger1 = anim != [5110, 5119]
value = 5110

[State 5150, 6]
type = velmul
trigger1 = 1
x = 0.85

[State 5150, 7]
type = velset
trigger1 = vel x < 0.05
x = 0
persistent = 0

[State 5150, 8]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==========<FALL RECOVERY>==========
[Statedef 5200]
type = A
movetype = H
physics = N

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 5200, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 10
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
trigger1 = animelem = 1
x = -3.0
y = 0

[State 5201, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 5201, Flash]
type = palfx
trigger1 = !time && prevstateno != 6001
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

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


;--- AIR ---
[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time && prevstateno != 6001
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, Flash]
type = palfx
trigger1 = !time && prevstateno != 6001
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

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
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;==========<FORCED TARGET RECOVERY>==========
[Statedef 5025]
type = A
movetype = H
physics = N
velset = 0, 0
facep2 = 1

[State 5025, HFS]
type = hitfallset
trigger1 = 1
value = 0

[State 5025, End]
type = selfstate
trigger1 = 1
value = ifelse(pos y, 5020, 5000)


;==========<TARGET SAFE FALL>==========
[Statedef 5205]
type = A
physics = N
movetype = H

[State 5205, End]
type = selfstate
trigger1 = 1
value = ifelse(pos y < -20, 5210, 5200)


;====================<ARMOR STATE>====================
[Statedef 6000]
type = U
physics = U
movetype = H
movehitpersist = 1
hitcountpersist = 1

[State 6000, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 6000, Pos]
type = posset
trigger1 = statetype != A
y = 0

[State 6000, Vel]
type = velset
trigger1 = var(41) != 20 && var(41) != 50 && var(41) != 100 && var(41) != 105
trigger1 = var(41) != 210 && var(41) != 220 && var(41) != 230 && var(41) != 600
x = 0

[State 6000, Vel]
type = velset
trigger1 = var(41) != 50 && var(41) != 600
y = 0

[State 6000, Received Hits]
type = varadd
trigger1 = !time
var(43) = 1

[State 6000, Received Hits Cooldown]
type = varset
trigger1 = !time
var(44) = gethitvar(hittime) + 8

[State 6000, Anim Skip]
type = varadd
trigger1 = !time
var(42) = animelemtime(animelemno(0))

[State 6000, Freeze]
type = changeanim
trigger1 = 1
value = anim
elem = ifelse((animelem = 1), 1, animelemno(-1))

[State 6000, Frame]
type = varset
trigger1 = 1
var(45) = animelemno(0)

[State 6000, FX]
type = offset
trigger1 = !(gametime % 2)
x = ifelse(facing = 1, -4, 4)

[State 6000, FX]
type = palfx
trigger1 = !time
time = 4
add = 255, 255, 255
sinadd = -255, -255, -255, 16

[State 6000, End]
type = changestate
trigger1 = !alive
value = ifelse(pos y >= 0, 6010, 5020)
ctrl = 0

[State 6000, End]
type = changestate
triggerall = alive && time
trigger1 = hitshakeover
trigger2 = time >= 32
trigger3 = time >= 8 && numenemy
trigger3 = (enemynear, hitdefattr = SCA, AA) && !(enemynear, hitpausetime)
trigger4 = var(43) >= 2
trigger4 = (gethitvar(hitshaketime) - (var(43) -1) - time) <= 0
value = 6001


;--- Anim Skip ---
[Statedef 6001]
type = U
physics = U
movetype = H
movehitpersist = 1
hitcountpersist = 1

[State 6001, Anim Skip]
type = changeanim
trigger1 = var(42) > 0
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(animelemno(0) + 1) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(42)
trigger1 = 1 || var(42) := (var(42) + animelemtime(animelemno(0) + 1))
value = anim
elem = animelemno(0) + 1

[State 6001, Anim Skip Loops]
type = changeanim
triggerall = var(42) > 0
triggerall = animelemtime(animelemno(0) + 1) = 0
trigger1 = stateno = 20 && anim = 20
trigger1 = animelemtime(4) + var(42) >= 6
trigger2 = stateno = 20 && anim = 21
trigger2 = animelemtime(4) + var(42) >= 6
trigger3 = stateno = 100 && anim = 100
trigger3 = animelemtime(4) + var(42) >= 4
value = anim
elem = 1 + 0 * (var(42) := 0)

[State 6001, End]
type = changestate
trigger1 = 1
value = var(41)
ctrl = 1


;====================<K.O.>====================
[Statedef 6010]
type = S
physics = S
movetype = H
anim = 6010
velset = 0, 0
sprpriority = -1

[State 6010, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 6010, Pos]
type = posset
trigger1 = 1
y = 0

[State 6010, Shake FX]
type = envshake
trigger1 = animelem = 5 && var(45) != 5
time = 12
ampl = -2
freq = 180

[State 6010, Shake FX]
type = playsnd
trigger1 = animelem = 5 && var(45) != 5
value = 0, 52

[State 6010, Shake FX]
type = explod
trigger1 = animelem = 5 && var(45) != 5
anim = 6204
sprpriority = -3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6010, Shake FX]
type = explod
trigger1 = animelem = 5 && var(45) != 5
anim = 6205
sprpriority = 1
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6010, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;========================<GUILE>=============================
[Statedef 6100]
type = A
physics = N
movetype = I
anim = 6100
velset = 0, 0
sprpriority = 3

[State 6100, Assert]
type = assertspecial
trigger1 = 1
flag = roundnotover

[State 6100, Pos]
type = posset
trigger1 = !time
x = ifelse(root, pos x > 0, -240, 240)
y = -32

[State 6100, Turn]
type = turn
triggerall = !time
trigger1 = facing = 1 && pos x >= 0
trigger2 = facing = -1 && pos x < 0

[State 6100, Pos]
type = posadd
trigger1 = !time
trigger1 = rootdist x < 320
x = rootdist x -320

[State 6100, Vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 6100, End]
type = removeexplod
trigger1 = roundstate < 3

[State 6100, End]
type = destroyself
trigger1 = roundstate < 3

[State 6100, End]
type = changestate
trigger1 = time >= 16
value = 6101


;--- Slower ---
[Statedef 6101]
type = A
physics = N
movetype = I
anim = 6101
sprpriority = 3

[State 6101, Assert]
type = assertspecial
trigger1 = 1
flag = roundnotover

[State 6101, No Bars]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 6101, Sound]
type = playsnd
trigger1 = !time
value = 7, 1
channel = 0

[State 6101, Vel]
type = velset
trigger1 = 1
x = 2
y = 0

[State 6101, BG PalFX]
type = allpalfx
trigger1 = 1
time = 3
color = (256 - time * 8)
add = (256 - time * 8), (256 - time * 8), (256 - time * 8)

[State 6101, Pause]
type = pause
trigger1 = 1
time = 3
movetime = 3

[State 6101, Widescreen]
type = explod
trigger1 = !numexplod(6105)
anim = 6105
ID = 6105
ontop = 1
postype = left
pos = 160, 120
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6101, Widescreen]
type = modifyexplod
trigger1 = numexplod(6105)
ID = 6105
scale = 2 - (time * 0.03125), 2 - (time * 0.03125)

[State 6101, End]
type = removeexplod
trigger1 = roundstate < 3

[State 6101, End]
type = destroyself
trigger1 = roundstate < 3

[State 6101, End]
type = changestate
trigger1 = time >= 32
value = 6102


;--- Stop ---
[Statedef 6102]
type = A
physics = N
movetype = I
anim = 6102
velset = 0, 0
sprpriority = 3

[State 6102, Assert]
type = assertspecial
trigger1 = time < 60
flag = roundnotover

[State 6102, No Bars]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 6102, BG PalFX]
type = allpalfx
trigger1 = 1
time = 3
color = 0

[State 6102, Pause]
type = pause
trigger1 = 1
time = 3
movetime = 3

[State 6102, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 6102, Widescreen]
type = modifyexplod
trigger1 = numexplod(6105)
ID = 6105
scale = 1, 1

[State 6102, End]
type = removeexplod
trigger1 = roundstate < 3

[State 6102, End]
type = destroyself
trigger1 = roundstate < 3


;========================<CAMERA CONTROL>=============================
[Statedef 8990]
type = S
anim = 9999
velset = 0, 0

[State 8990, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 8990, End]
type = destroyself
trigger1 = roundstate = 2


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, HitOverride]
type = hitoverride
trigger1 = 1
attr = SCA, NA, SA, NP, SP, NT, ST
time = -1
stateno = 6000
ignorehitpause = 1

[State -2, HitOverride]
type = hitoverride
trigger1 = movetype = H && (stateno != [6000, 6001])
attr =
time = -1
stateno = 5000
ignorehitpause = 1

[State -2, HB]
type = hitby
trigger1 = 1
value = SCA, AA, AP, HT
time = -1
ignorehitpause = 1

[State -2, Width]
type = width
trigger1 = movetype = H
trigger1 = stateno != 6000 && (stateno != [5100, 5120])
player = -40, -40
ignorehitpause = 1

[State -2, Assert]
type = Assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = moveguarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignorehitpause = 1

[State -2, Hit Detection]
type = varset
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = varrangeset
trigger1 = movetype = I
trigger2 = movetype = H && time
first = 30
last = 36
value = -1
ignorehitpause = 1

[State -2, P2 Recovery]
type = targetstate
trigger1 = numtarget(200)
trigger1 = (target(200), stateno = 5020) && (target(200), alive) && (target(200), hitfall); Hit out of the air while alive and already falling
ID = 200
value = 5025
ignorehitpause = 1

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -20 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1

[State -2, Damage Dampener]
type = attackmulset
trigger1 = numenemy
value = ifelse(enemynear, gethitvar(hitcount) < 1, 16, ifelse(enemynear, gethitvar(hitcount) >= 15, 1, 16 - enemynear, gethitvar(hitcount))) / 16.0
ignorehitpause = 1

[State -2, Damage Dampener]
type = attackmulset
trigger1 = numenemy
trigger1 = enemynear, movetype != H || (enemynear, stateno = [120, 155])
value = 1.0
ignorehitpause = 1

[State -2, Reset Armor Frame]
type = varset
trigger1 = 1
var(45) = 0
ignorehitpause = 1

[State -2, Received Hits Cooldown]
type = varadd
trigger1 = var(44) > 0
var(44) = -1
ignorehitpause = 1

[State -2, Received Hits]
type = varset
trigger1 = var(44) <= 0
var(43) = 0
ignorehitpause = 1

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 4
channel = 4

[State -2, Get Hit Voice]
type = playsnd
trigger1 = alive
trigger1 = time <= 1
trigger1 = movetype = H
trigger1 = stateno != [120, 155]
trigger1 = stateno != [6000, 6001]
trigger1 = gethitvar(damage) = (0, life)
value = 5000, (random % 5)
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
triggerall = stateno != [6000, 6001]
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
triggerall = stateno != [6000, 6001]
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

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 4
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Armor State = %d Armor Frame Time = %d Received Hits = %d"
params = var(41), var(42), var(43)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nAnimation by Coelasquid, coding by PotS"
ignorehitpause = 1


;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, State Var]
type = varset
trigger1 = movetype != H
var(41) = stateno
ignorehitpause = 1

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1

[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = statetype != L && numtarget
triggerall = (target, statetype != L)
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1
