; _____________________________________
;| Rare Akuma by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;====================<PARRY>====================
[Statedef 700]
type = U
physics = N
movetype = I
anim = ifelse(statetype = A, 702, ifelse(statetype = C, 701, 700))
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 700, Pause]
type = pause
trigger1 = !time
trigger1 = var(20) <= 0
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 700, Pause]
type = pause
trigger1 = !time
trigger1 = numenemy && var(20) <= 0
trigger1 = (p2, movehit = 1)
time = ifelse((p2, hitpausetime = [0, 15]), 15 -(p2, hitpausetime), 0)
movetime = ifelse((p2, hitpausetime = [0, 15]), 15 -(p2, hitpausetime), 0)
endcmdbuftime = ifelse((p2, hitpausetime = [0, 15]), 15 -(p2, hitpausetime), 0)
pausebg = 0

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
ontop = 1
postype = p1
pos = ifelse(anim = 702, 41, ifelse(anim = 701, 27, 36)), ifelse(anim = 701, -21, -65)
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 700, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 700, End]
type = changestate
trigger1 = !animtime
value = ifelse(statetype = A, 51, 0)
ctrl = 1


;====================<POWER CHARGE>====================
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = !AIlevel && (command = "/b" && command = "/y")
trigger2 = AIlevel
value = 50

[State 740, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 740, Shake]
type = envshake
trigger1 = anim = 740 && !(time % 4)
time = 4
freq = 80
ampl = 2

[State 740, Flash]
type = palfx
trigger1 = anim = 740 && !(time % 12)
add = 80, 20, 0
sinadd = 80, 20, 0, 12
time = 12

[State 740, Flash]
type = palfx
trigger1 = anim = 741
add = 0, 0, 0
time = 1
persistent = 0

[State 740, Snd]
type = playsnd
trigger1 = 1
value = 5, 12
channel = 4
lowpriority = 1

[State 740, FX]
type = helper
trigger1 = anim = 740 && !numhelper(7240) && !ishelper
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
ownpal = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535

[State 740, aura]
type = helper
trigger1 = !ishelper
trigger1 = anim = 740 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim = 740
trigger1 = !AIlevel && (command != "/b" || command != "/y")
trigger2 = roundstate != 2
trigger3 = AIlevel && (inguarddist || p2movetype = A || p2bodydist x < 160)
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)
persistent = 0

[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1


;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
trigger1 = !ishelper(1)

[State 0, Gone]
type = destroyself
trigger1 = ishelper
trigger1 = !ishelper(1)

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, dead]
type = changestate
trigger1 = !alive
value = 5050


;===================<JUMPING>================
[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40, Var]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((p2, movetype != A || backedgebodydist <= 10), 1, ifelse((p2, movetype = A), -1, 0))

[State 40, Var]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))

[State 40, Var]
type = varset
trigger1 = !time
var(3) = 0

[State 40, Var]
type = varset
trigger1 = !time
trigger1 = !AIlevel && command = "superjump"
trigger2 = prevstateno = 240
var(3) = 1

[State 40, Vel]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = ifelse(var(3) = 1, 1.33, 1) * const(velocity.jump.y)

[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1


;--- Airjump ---
[Statedef 45]
type = A
physics = N
ctrl = 0
velset = 0, 0

[State 45, Anim]
type = changeanim
trigger1 = selfanimexist(44)
value = 44

[State 45, 2]
type = changeanim
trigger1 = !selfanimexist(44)
value = 41

[State 45, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 45, Direction]
type = varset
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, Direction]
type = varset
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, Velocity]
type = velset
trigger1 = time = 1
x = ifelse(sysvar(1) = 0, const(velocity.airjump.neu.x), ifelse(sysvar(1) = 1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)

[State 45, FX]
type = explod
trigger1 = !time
anim = F 60
postype = p1
pos = 0, 0
sprpriority = -10

[State 45, End]
type = changestate
trigger1 = time = 1
value = 50
ctrl = 1


;--- Going up ---
[Statedef 50]
type = A
physics = A
anim = ifelse(!(vel x), 41, ifelse((vel x) > 0, 42, 43))

[State 50, Snd]
type = playsnd
trigger1 = !time
value = 0, ifelse(ishelper, 42, 40)

[State 50]
type = turn
trigger1 = var(3) = 1 && p2dist x < 0


;--- Coming down ---
[Statedef 51]
type = A
anim = 51
physics = A

[State 51, Vel]
type = velmul
trigger1 = !ctrl
x = 0.9

[State 51, Type]
type = statetypeset
trigger1 = 1
physics = A

[State 51, Type]
type = statetypeset
trigger1 = prevstateno = 1507
trigger1 = pos y < -32 && time <= 8
physics = N


;--- Landing ---
[Statedef 52]
type = S
physics = S
ctrl = 0
anim = 47
ctrl = 1
velset = 0, 0

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Ctrl]
type = ctrlset
trigger1 = 1
value = 1

[State 52, anim48]
type = changeanim
trigger1 = !time
trigger1 = (prevstateno = 222 || prevstateno = 1050 || (prevstateno = [1200, 1250]) || (prevstateno = [1301, 1310]) || prevstateno = 3050)
value = 48

[State 52, anim283]
type = changeanim
trigger1 = !time
trigger1 = prevstateno = 282
value = 283

[State 52, anim1102]
type = changeanim
trigger1 = !time
trigger1 = ((prevstateno = [1100, 1110]) || prevstateno = 3100)
value = 1102

[State 52, anim1103]
type = changeanim
trigger1 = !time
trigger1 = prevstateno = 4302
value = 1103

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5 * ifelse(ishelper, 0.5, 1), 0.5 * ifelse(ishelper, 0.5, 1)
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
anim = 100
ctrl = 1
sprpriority = 1

[State 100, as]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 100, Vel]
type = velset
trigger1 = anim = 100
x = const(velocity.run.fwd.x)

[State 100, steps]
type = playsnd
trigger1 = anim = 100
trigger1 = animelem = 3 || animelem = 6
value = 0, 100

[State 100, change]
type = changeanim
triggerall = time > 7 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && p2dist x < 60
value = 101
persistent = 0

[State 100, Snd]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0

[State 100, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1


;========================<FORWARD DASH>==========================
[Statedef 102]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = -1.2 * const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 102, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 102, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

[State 102, End]
type = changestate
triggerall = (animelemtime(2) > 4) && (animelemtime(3) < 0)
trigger1 = !AIlevel && command = "holdfwd"
trigger2 = AIlevel && p2dist x >= 60
value = 100


;========================<BACK DASH>==========================
[Statedef 105]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -1, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 105, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<GUARD>====================
;--- START ---
[Statedef 120]
type = U
physics = U

[State 120, Vel]
type = velset
trigger1 = !time
trigger1 = statetype != A
x = 0
y = 0

[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2

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

[State 120, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 120, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
value = 140


;--- STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, Hi to Lo]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && (p2, movetype = A) && (p2, statetype = C)
value = 131

[State 130, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
value = 140


;--- CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Lo to Hi]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && (p2, movetype = A) && (p2, statetype != C)
value = 130

[State 131, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
value = 140


;--- AIR GUARD (guarding) ---
[Statedef 132]
type = A
physics = A

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
sysvar(0) = (pos y >= 0) && (vel y > 0)

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
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
value = 140


;--- GUARD (end) ---
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

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

[State 140, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 140, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

[State 140, 5]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

;--- SGUARDHIT (shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (p2, movetype = A) && (p2, statetype = C)))

[State 150, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 150, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

;--- SGUARDHIT2 (knocked back) ---
[Statedef 151]
type = S
movetype = H
physics = S
anim = 150

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

[State 151, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 151, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1

;--- CGUARDHIT (shaking) ---
[Statedef 152]
type = C
movetype = H
physics = N
velset = 0, 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (p2, movetype = A) && (p2, statetype = C)))

[State 152, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 152, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

;--- CGUARDHIT2 (knocked back) ---
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151

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

[State 153, Hi to Lo]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (p2, movetype = A) && (p2, statetype = C)
statetype = C
physics = C

[State 153, Lo to Hi]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (p2, movetype = A) && (p2, statetype != C)
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1

;--- AGUARDHIT (shaking) ---
[Statedef 154]
type = A
movetype = H
physics = N
velset = 0, 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155


;--- AGUARDHIT2 (knocked away) ---
[Statedef 155]
type = A
movetype = H
physics = N
anim = 152

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Vel]
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
sysvar(0) = (pos y >= 0) && (vel y > 0)

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
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;====================<TAUNT>====================
[Statedef 195]
type = S
movetype = A
physics = S
juggle = 0
anim = 195
velset = 0, 0
sprpriority = 1
poweradd = 500
ctrl = 0

[State 195, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, NA
damage = 35, 7
animtype = Up
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -34
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 9
ground.hittime = 12
ground.velocity = -4, -16
guard.velocity = -12
air.type = Low
air.velocity = -4, -16
getpower = ifelse(p2movetype = H, 96, 192), 48
givepower = 0
envshake.time = 9
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 110
fall = 1
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 195, rocks]
type = projectile
trigger1 = animelemtime(5) = [0, 7]
projID = 195
projanim = 6130 + (random % 5)
projhitanim = -1
projremove = 0
projscale = ifelse(random < 500, -1, 1) * (0.5 + (random / 2000.0)), ifelse(random < 500, -1, 1) * (0.5 + (random / 2000.0))
velocity = 0, 2
accel = 0, 0.25
projsprpriority = 4
projedgebound = 80
projheightbound = -9999, 0
postype = back
offset = ceil(random / 3.125), ceil(pos y -screenpos y) -40
ownpal = 1
attr = S, NP
damage = 14, 0
animtype = Hard
guardflag = MH
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 12
sparkno = 2
guard.sparkno = 40
sparkxy = -10, 0
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
ground.velocity = 0, 0
down.velocity = 0, 0
air.velocity = 0, -4
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 0
fall.recover = 1
pausemovetime = 1
supermovetime = 1
kill = var(20) <= 0

[State 195, flames]
type = helper
triggerall = movehit && numtarget && !numhelper(7181)
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
pausemovetime = var(20)
ignorehitpause = 1
persistent = 0

[State 195, aura]
type = helper
trigger1 = animelem = 5
trigger1 = !numhelper(6000) && !ishelper
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 195, Kanji]
type = helper
trigger1 = animelem = 5 && !ishelper
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -132
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 10
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 195, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 195, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
freq = 180
ampl = 3
ignorehitpause = 1

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<LOSE (Time over)>====================
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
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -6, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5

[State 170, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52


;====================<DRAWGAME (Time over)>====================
[Statedef 175]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 175, End]
type = changestate
trigger1 = 1
value = 170


;====================<INITIALIZE>====================
[Statedef 5900]
type = S

[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
trigger1 = command = "holdfwd" && command = "holdback"
value = 188

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
trigger1 = command = "holdup" && command = "holddown"
value = 191

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
trigger1 = command = "holdfwd" || command = "holdback"
value = 192

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
trigger1 = command = "holddown"
value = 194

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
trigger1 = command = "holdup"
value = 177

[State 5900, Turns Intro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = ifelse(random < 333, 177, ifelse(random < 500, 191, 192))

[State 5900, intro]
type = changestate
trigger1 = roundno = 1 || !roundsexisted
value = ifelse(random < 143, 177, ifelse(random < 167, 182, ifelse(random < 200, 187, ifelse(random < 250, 188, ifelse(random < 333, 191, ifelse(random < 500, 192, 194))))))

[State 5900, End]
type = changestate
trigger1 = 1
value = 0


;====================<PREINTRO>====================
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, intro]
type = changestate
trigger1 = 1
value = 0


;====================<INTRO 3>====================
[Statedef od181]
type = S
anim = 185

[State 185, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 185, Kanji]
type = explod
trigger1 = !time
trigger1 = !ishelper
anim = 6010
ID = 6010
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 185, Snd]
type = playsnd
trigger1 = time = 15
value = 4, 3
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 185, Snd]
type = playsnd
trigger1 = time = 5
value = 9, 11
channel = 9

[State 185, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 1>====================
[Statedef 182]
type = S
anim = 182

[State 182, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 182, aura]
type = helper
trigger1 = animelem = 7 && !ishelper
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 182, Kanji]
type = helper
trigger1 = animelem = 7 && !ishelper
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -132
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0

[State 182, Snd]
type = playsnd
trigger1 = animelem = 7
value = 3, 5
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 182, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 4

[State 182, Dust]
type = explod
trigger1 = animelem = 7
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
pausemovetime = -1
supermovetime = -1
scale = 0.75, 0.75
ownpal = 1

[State 182, Shake]
type = envshake
trigger1 = animelemtime(7) >= 0 && animelemtime(26) < 0 && !(animelemtime(7) % 12)
time = 12
freq = 60
ampl = 4

[State 182, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 2>====================
[Statedef 187]
type = S
anim = 187

[State 187, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 187, Snd]
type = playsnd
trigger1 = !time
value = 7, 0

[State 187, hadou]
type = explod
trigger1 = !time
trigger1 = !ishelper
anim = 6000
ID = 6020
sprpriority = 2
postype = p1
pos = 14, 0
removetime = 320
removeongethit = 1
ownpal = 1

[State 187, grow]
type = modifyexplod
trigger1 = time < 40
ID = 6020
scale = 2, 2
trans = addalpha
alpha = 256, 256

[State 187, normal]
type = modifyexplod
trigger1 = time >= 40 && time <= 240
ID = 6020
scale = 2 -(0.005 * (time -40)), 2 -(0.005 * (time -40))
trans = addalpha
alpha = 256, 256

[State 187, shrink]
type = modifyexplod
trigger1 = time > 240 && time <= 320
ID = 6020
scale = 1, 1
trans = addalpha
alpha = 256 -ceil(2.13 * (time -240)), 256

[State 187, Dust]
type = explod
trigger1 = time > 120 && time <= 240
trigger1 = ifelse(animelemtime(4) >= 0, !(time % 12), !(time % 9))
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = ifelse(animelemtime(4) >= 0, 16, 20), 0
ownpal = 1
pausemovetime = -1
supermovetime = -1
scale = 0.75, 0.75

[State 187, Snd]
type = playsnd
trigger1 = time = [60, 320]
value = 5, 12
channel = 4
lowpriority = 1

[State 187, Snd]
type = stopsnd
trigger1 = time = 320
channel = 4

[State 187, Snd]
type = playsnd
trigger1 = time = 200
value = 4, 7
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 187, Snd]
type = playsnd
trigger1 = animelem = 11
value = 5, 4

[State 182, Dust]
type = explod
trigger1 = animelem = 11
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 187, Shake]
type = envshake
trigger1 = animelem = 11
time = 8
freq = 60
ampl = 4

[State 187, Shake]
type = envshake
trigger1 = time > 120 && time <= 210 && !(time % 12)
time = 12
freq = 60
ampl = ifelse(animelemtime(4) >= 0, 3, 4)

[State 187, End]
type = changestate
trigger1 = !animtime
value = 0


;========================<INTRO FLYING>=============================
[Statedef 177]
type = A
physics = N
movetype = I
anim = 177
ctrl = 0
sprpriority = -1

[State 177, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 177, bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 177, Pos]
type = posset
trigger1 = !time
y = -360

[State 177, Snd]
type = playsnd
trigger1 = time = 5
value = 9, 17
channel = 9

[State 177]
type = assertspecial
trigger1 = time >= 5 && animelemtime(2) < 0
flag = nomusic

[State 177, Vel]
type = changeanim
trigger1 = pos y < 0
value = 177
elem = 1

[State 177, Vel]
type = changeanim
trigger1 = pos y >= 0 && animelemtime(2) < 0
value = 177
elem = 2

[State 177, Vel]
type = velset
trigger1 = animelemtime(2) < 0
y = 1

[State 177, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
y = 0

[State 177, Stop]
type = posset
trigger1 = animelemtime(2) >= 0
y = 0

[State 177, Flash]
type = explod
trigger1 = animelemtime(2) < 0 && (time % 3) = 0
anim = 6104
sprpriority = -2
postype = p1
pos = 0, ceil(-screenpos y + 120)
facing = ifelse(random < 500, -1, 1)
random = 80, 240
scale = 0.25 + (random / 2000.0), 0.25 + (random / 2000.0)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 177, Flash]
type = explod
trigger1 = animelemtime(2) < 0 && (time % 3) = 1
anim = 6104
sprpriority = 3
postype = p1
pos = 0, ceil(-screenpos y + 120)
facing = ifelse(random < 500, -1, 1)
random = 40, 240
scale = 0.25 + (random / 2000.0), 0.25 + (random / 2000.0)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 177, Flash]
type = bgpalfx
trigger1 = animelemtime(2) < 0
time = 2
color = 0
mul = 256, 0, 256

[State 177, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 24>====================
[Statedef 188]
type = S
anim = 188

[State 188, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 188, I'll form the arms]
type = explod
trigger1 = animelemtime(2) = -40
anim = 6100
ID = 6100
sprpriority = 2
postype = p1
pos = -448, 0
vel = 16, 0
facing = -1
removetime = -animelemtime(2)
ownpal = 1

[State 188, I'll form the legs]
type = explod
trigger1 = animelemtime(2) = -40
anim = 6101
ID = 6101
sprpriority = 2
postype = p1
pos = 448, 0
vel = -16, 0
facing = 1
removetime = -animelemtime(2)
ownpal = 1

[State 188, Flash]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 4
add = 255, 255, 255
sinadd = -255, -255, -255, 16

[State 188, Flash]
type = bgpalfx
trigger1 = animelemtime(2) = [-16, -1]
time = 1
color = 0

[State 188]
type = modifyexplod
trigger1 = animelemtime(2) = [-16, 0]
ID = 6100
postype = p1
pos = (animelemtime(2) * 4)
facing = -1

[State 188]
type = modifyexplod
trigger1 = animelemtime(2) = [-16, 0]
ID = 6101
postype = p1
pos = -(animelemtime(2) * 4)
facing = 1

[State 188, Snd]
type = playsnd
trigger1 = animelemtime(2) = -40
value = 5, 11

[State 188, Snd]
type = playsnd
trigger1 = animelemtime(2) = -20
value = 5, 20

[State 188, Snd]
type = playsnd
trigger1 = animelemtime(2) = -20
value = 5, 21

[State 188, Snd]
type = playsnd
trigger1 = animelem = 2
value = 7, 0

[State 188, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 22
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 188, Flash]
type = allpalfx
trigger1 = animelemtime(2) = -1
time = 120
add = 255, 255, 255
sinadd = -255, -255, -255, 480

[State 188, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 43>====================
[Statedef 192]
type = S
anim = 192

[State 192, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, ball]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6110
postype = p1
ownpal = 1

[State 192, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 13
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 192, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 23

[State 192, Dust]
type = explod
trigger1 = animelem = 2
anim = 6111
sprpriority = 3
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO 356>====================
[Statedef 191]
type = S
anim = 191

[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Snd]
type = playsnd
trigger1 = time = 5
value = 9, 14
channel = 9

[State 191]
type = assertspecial
trigger1 = time >= 5 && animelemtime(2) < 0
flag = nomusic

[State 191, FX]
type = explod
trigger1 = time = 30 || time = 60 || time = 90 || time = 120 || time = 150 || time = 180 || time = 210 || time = 240
anim = ifelse(time = 30, 6140, ifelse(time = 60, 6141, ifelse(time = 90, 6142, ifelse(time = 120, 6143, ifelse(time = 150, 6144, ifelse(time = 180, 6145, ifelse(time = 210, 6146, 6147)))))))
ID = ifelse(time = 30, 6140, ifelse(time = 60, 6141, ifelse(time = 90, 6142, ifelse(time = 120, 6143, ifelse(time = 150, 6144, ifelse(time = 180, 6145, ifelse(time = 210, 6146, 6147)))))))
sprpriority = 0
postype = p1
pos = 0, -200
vel = 0, 20
shadow = -1
removetime = -1

[State 191, FX]
type = modifyexplod
trigger1 = time = 40 || time = 70 || time = 100 || time = 130 || time = 160 || time = 190 || time = 220 || time = 250
ID = ifelse(time = 40, 6140, ifelse(time = 70, 6141, ifelse(time = 100, 6142, ifelse(time = 130, 6143, ifelse(time = 160, 6144, ifelse(time = 190, 6145, ifelse(time = 220, 6146, 6147)))))))
postype = p1
pos = 0, 0
vel = 0, 0

[State 191, Snd]
type = playsnd
trigger1 = time = 40 || time = 70 || time = 100 || time = 130 || time = 160 || time = 190 || time = 220 || time = 250
value = 5, 8
channel = 1

[State 191, Shake]
type = envshake
trigger1 = time = 40 || time = 70 || time = 100 || time = 130 || time = 160 || time = 190 || time = 220 || time = 250
time = 8
freq = 60
ampl = -2

[State 191, Flash]
type = palfx
trigger1 = animelemtime(2) < 0
time = 2
color = 0

[State 191, Flash]
type = palfx
trigger1 = (time = [40, 41]) || (time = [70, 71]) || (time = [100, 101]) || (time = [130, 131])
trigger2 = (time = [160, 161]) || (time = [190, 191]) || (time = [220, 221]) || (time = [250, 251])
time = 2
color = 0
add = 255, 255, 255

[State 191, FX]
type = removeexplod
trigger1 = animelem = 2

[State 191, Snd]
type = playsnd
trigger1 = animelem = 2
value = 7, 0

[State 191, Flash]
type = allpalfx
trigger1 = animelemtime(2) = -1
time = 30
add = 255, 255, 255
sinadd = -255, -255, -255, 120

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO BECAUSE I GARA, BECAUSE I GARA -A>====================
[Statedef 194]
type = S
anim = 194

[State 194, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 194, Snd]
type = playsnd
trigger1 = time = 5
value = 9, 10
channel = 9

[State 194]
type = assertspecial
trigger1 = time >= 5 && animelemtime(2) < 0
flag = nomusic

[State 194]
type = bgpalfx
trigger1 = animelemtime(2) < 0
time = 1
mul = 192, 128 + ceil(cos(gametime / 16.0) * 128), 128 + ceil(sin(gametime / 16.0) * 128)
color = 0

[State 194, smoke]
type = explod
trigger1 = !time
anim = 6106
sprpriority = 1
postype = p1
removetime = -animelemtime(2)
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 194, Flash]
type = allpalfx
trigger1 = animelemtime(2) = -1
time = 120
add = 255, 255, 255
sinadd = -255, -255, -255, 480

[State 194, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000, 5
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 194, Snd]
type = playsnd
trigger1 = animelem = 2
value = 7, 0

[State 194, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S
velset = 0, 0

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = -1

[State 180, win]
type = changestate
trigger1 = prevstateno = 4021 || prevstateno = 4312
value = prevstateno

[State 180, win]
type = changestate
trigger1 = ishelper
value = ifelse(random < 250, 181, ifelse(random < 333, 186, ifelse(random < 500, 189, 193)))

[State 180, win]
type = changestate
trigger1 = command = "holdfwd"
value = 179

[State 180, win]
type = changestate
trigger1 = command = "holdback"
value = 9800

[State 180, win]
type = changestate
trigger1 = command = "holdup"
value = 178

[State 180, win]
type = changestate
trigger1 = command = "holddown"
value = 193

[State 180, win]
type = changestate
trigger1 = 1
value = ifelse(random < 143, 178, ifelse(random < 167, 179, ifelse(random < 200, 181, ifelse(random < 250, 186, ifelse(random < 333, 189, ifelse(random < 500, 193, 9800))))))


;====================<WIN 1>====================
[Statedef 181]
type = S
anim = 181
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 180 && !ishelper
flag = roundnotover

[State 181, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(random < 500, 2, 8)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 181, Kanji]
type = explod
trigger1 = animelem = 4 && !ishelper
anim = 6011
ID = 6011
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State Narrator]
type = helper
trigger1 = time = 60
trigger1 = !ishelper
trigger1 = !numhelper(7680)
trigger1 = random < 500 || (!AIlevel && command = "/s")
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = ifelse(random < 333, 3, ifelse(random < 333, 5, 6)); Narrator line


;====================<WIN 2>====================
[Statedef 186]
type = S
anim = 186
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 180 && !ishelper
flag = roundnotover

[State 186, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)
persistent = 0

[State Narrator]
type = helper
trigger1 = time = 60
trigger1 = !ishelper
trigger1 = !numhelper(7680)
trigger1 = random < 500 || (!AIlevel && command = "/s")
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = ifelse(random < 333, 3, ifelse(random < 333, 5, 6)); Narrator line


;====================<WIN 3>====================
[Statedef 189]
type = S
anim = 189
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 180 && !ishelper
flag = roundnotover

[State 189, aura]
type = helper
trigger1 = animelem = 5 && !ishelper
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 189, Kanji]
type = helper
trigger1 = animelem = 5 && !ishelper
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -132
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 189, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 189, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 13
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 189, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 189, Shake]
type = envshake
trigger1 = animelemtime(5) >= 0 && !(time % 12) && !ishelper
time = 12
freq = 60
ampl = 4

[State 189, Snd]
type = playsnd
trigger1 = animelem = 4 && !ishelper
value = 7, 0
persistent = 0

[State 189, Snd]
type = playsnd
trigger1 = animelemtime(5) >= 0 && !ishelper
value = 5, 12
channel = 4
lowpriority = 1
persistent = 0

[State 189, Narrator]
type = helper
trigger1 = time = 60
trigger1 = !ishelper
trigger1 = !numhelper(7680)
trigger1 = random < 500 || (!AIlevel && command = "/s")
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = ifelse(random < 333, 3, ifelse(random < 333, 5, 6)); Narrator line


;====================<WIN 370>====================
[Statedef 193]
type = S
anim = 193
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 180 && !ishelper
flag = roundnotover

[State 193]
type = assertspecial
trigger1 = !ishelper
flag = nomusic

[State 193, Snd]
type = playsnd
trigger1 = !time
trigger1 = !ishelper
value = 5, 28
channel = 9

[State 193, earth]
type = helper
trigger1 = animelem = 9 && !ishelper
helpertype = normal
stateno = 6120
ID = 6120
name = "Space"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 193, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 10
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 193, Snd]
type = playsnd
trigger1 = animelem = 9
value = 5, ifelse(ishelper, 4, 25)

[State 193, Shake]
type = envshake
trigger1 = animelem = 9
time = 32
freq = 60
ampl = 8


;====================<WIN RAINBOW>====================
[Statedef 179]
type = S
anim = 179
sprpriority = -1
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 240 && !ishelper
flag = roundnotover

[State 179]
type = playsnd
trigger1 = !time
value = 9, 15
channel = 9

[State 179, face]
type = explod
trigger1 = !numexplod(6179) && !ishelper
anim = 6179
ID = 6179
sprpriority = 1
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-100 * const(size.yscale))
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removetime = 600
removeongethit = 1

[State 179, FX]
type = helper
trigger1 = !ishelper
trigger1 = time = 0 || time = 18 || time = 36 || time = 54 || time = 63 || time = 81 || time = 99 || time = 117
helpertype = normal
stateno = 6150
ID = 6150
name = "Rainbow"
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-100 * const(size.yscale))
ownpal = 1


;====================<WIN DISSOLVE>====================
[Statedef 178]
type = S
physics = N
anim = 178
sprpriority = 2
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 180 && !ishelper
flag = roundnotover

[State 178, Camera]
type = screenbound
trigger1 = animelemtime(4) >= 0
value = 0
movecamera = 0, 1

[State 178, Camera]
type = helper
trigger1 = !numhelper(7650) && !ishelper
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 178, FX]
type = helper
trigger1 = !ishelper
trigger1 = time < 100 && !(time % 5)
helpertype = normal
name = "Akuma Juniors"
stateno = 6976
postype = p1
pos = 0, ceil(-24 + (0.024 * time))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 178, Snd]
type = playsnd
trigger1 = !time
value = 5000, 3
channel = 0

[State 178, Snd]
type = playsnd
trigger1 = !ishelper
trigger1 = time < 100 && !(time % 5)
value = 5, 38
channel = 1

[State 178, steps]
type = playsnd
trigger1 = animelem = 8 || animelem = 11
trigger1 = abs(pos x) <= 960
trigger1 = roundstate = 4
value = 0, 100
volumescale = ifelse(abs(pos x) <= 320, 100, 100 - (abs(pos x) - 320) * 0.15625)

[State 178, Snd]
type = angleset
trigger1 = 1
value = 0

[State 178]
type = angledraw
trigger1 = time < 100
scale = 1 -(0.005 * time), 1 -(0.005 * time)

[State 178]
type = angledraw
trigger1 = time >= 100
scale = 0.5, 0.5

[State 178]
type = turn
trigger1 = animelem = 4
trigger1 = random < 500

[State 178]
type = velset
trigger1 = animelemtime(6) >= 0
x = 4


;====================<WIN BENNY HILL>====================
[Statedef 9800]
type = S
physics = N
anim = 9800
sprpriority = 1
velset = 0, 0
ctrl = 0

[State wait]
type = assertspecial
trigger1 = !ishelper
flag = roundnotover

[State 9800, Snd]
type = playsnd
trigger1 = !time
trigger1 = !ishelper
value = 9, 20
channel = 9

[State 9800]
type = changestate
trigger1 = time >= 45
value = 9801


[Statedef 9801]
type = S
physics = N
anim = 9801
sprpriority = 1
ctrl = 0

[State wait]
type = assertspecial
trigger1 = time < 255 && !ishelper
flag = roundnotover

[State 9800]
type = assertspecial
trigger1 = !ishelper
flag = nomusic

[State 9801, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 9801, Camera]
type = helper
trigger1 = !numhelper(7650) && !ishelper
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 9801, FX]
type = helper
trigger1 = !time
helpertype = normal
name = "Posse"
stateno = 6180
postype = p1
pos = -480, 0
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 9801, FX]
type = helper
trigger1 = !(time % 4)
trigger1 = time >= 180 && random < 750
helpertype = normal
name = "Posse"
stateno = 6181
postype = back
pos = -160, 0
size.xscale = 0.375 + (random / 2666.6)
size.yscale = 0.375 + (random / 2666.6)
ownpal = 1

[State 9801, steps]
type = playsnd
triggerall = roundstate = 4
trigger1 = time < 180 && !(time % 8)
trigger2 = time >= 180 && !(time % 4)
value = 0, 100
channel = 1

[State 9801]
type = turn
trigger1 = time = 120

[State 9801]
type = velset
trigger1 = 1
x = 8


;====================<CONTINUE?>====================
[Statedef 5500]
type = S
anim = 5500
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;====================<DEAD>===========
[Statedef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5150, Reset Finisher Flag]
type = mapset
trigger1 = alive
trigger2 = !incustomstate
map = "_pots_rarefinisher"
value = 0

[State 5150, Hide Body]
type = assertspecial
trigger1 = map(_pots_rarefinisher)
flag = invisible

[State 5150, Hide Body]
type = screenbound
trigger1 = map(_pots_rarefinisher)
value = 0
movecamera = 0, 0

[State 5150, Hide Body]
type = playerpush
trigger1 = map(_pots_rarefinisher)
value = 0

[State 5150, Hide Body]
type = posset
trigger1 = map(_pots_rarefinisher)
trigger1 = roundstate = 4
y = 0

[State 5150, Anim]
type = changeanim
triggerall = !time
triggerall = selfanimexist(5140)
trigger1 = (anim != [5111, 5119]) && (anim != [5171, 5179])
trigger2 = !selfanimexist(5140 + (anim % 10))
value = 5140

[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = (anim = [5111, 5119]) || (anim = [5171, 5179])
trigger1 = selfanimexist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, Anim]
type = changeanim
trigger1 = matchover
trigger1 = (anim = [5140, 5149]) && selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 5150, Anim]
type = changeanim
trigger1 = !time
trigger1 = (anim != [5140, 5159]) && (anim != [5110, 5119])
value = 5110

[State 5150, Vel]
type = velmul
trigger1 = 1
x = 0.85

[State 5150, Vel]
type = velset
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
x = 0
persistent = 0

[State 5150, Narrator]
type = helper
trigger1 = time = 60
trigger1 = !ishelper
trigger1 = !numhelper(7680)
trigger1 = !incustomstate
trigger1 = matchover && loseko
trigger1 = !map(_pots_rarefinisher)
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = 1; Narrator line


;====================<FALL RECOVERY>====================
[Statedef 5040]
type = A
movetype = I
physics = A
anim = 5040
ctrl = 1

[State 5040, 1]
type = changestate
trigger1 = !alive
value = 5050


[Statedef 5200]
type = A
movetype = I
physics = N

[State 5200, End]
type = changestate
trigger1 = 1
value = 5040
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N

[State 5210, End]
type = changestate
trigger1 = 1
value = 5040
ctrl = 1


;====================<RESURRECTION>====================
[Statedef 6990]
type = A
physics = N
movetype = I
anim = 6990
sprpriority = -1
velset = 0, -2
ctrl = 0

[State 6990]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = 1

[State 6990]
type = varset
trigger1 = 1
var(38) = 1

[State 6990]
type = mapset
trigger1 = 1
map = "life"
value = lifemax / 2
ignorehitpause = 1

[State 6990]
type = playsnd
trigger1 = animelem = 10
value = 3, 2
channel = 0

[State 6990]
type = playsnd
trigger1 = !time
value = 7, 1

[State 6990]
type = playsnd
trigger1 = animelem = 10
value = 5, 17

[State 6990]
type = bgpalfx
trigger1 = random < 50
time = 10
add = 128, 128, 128
sinadd = -128, -128, -128, 40

[State 6990, End]
type = changestate
trigger1 = time >= 60
value = 51
ctrl = 1


;====================<DEFLECTED FIREBALL>====================
[Statedef 6994]
type = A
physics = N
movetype = H
sprpriority = 3
ctrl = 0

[State 6994]
type = changestate
trigger1 = !ishelper
value = 6996

[State 6994, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 6994]
type = removeexplod
trigger1 = !time

[State 6994]
type = veladd
trigger1 = 1
y = 0.5

[State 6994]
type = velset
trigger1 = !time
x = -0.5 * vel x
y = -6 -(random / 166.7)

[State 6994, noshadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6994]
type = destroyself
trigger1 = ishelper
trigger1 = time >= 180 || (pos x != [-200, 200]) || (screenpos y >= 360)


;====================<DEFLECTED TARGET>====================
[Statedef 6995]
type = A
physics = N
movetype = H
ctrl = 0
facep2 = 1

[State 6995]
type = destroyself
trigger1 = ishelper

[State 6995]
type = lifeadd
trigger1 = !time
value = -250
absolute = 1

[State 6995]
type = veladd
trigger1 = 1
y = 0.6

[State 6995]
type = velset
trigger1 = !time
x = -20
y = -12

[State 6995]
type = changeanim
trigger1 = vel y <= 0
value = 5030

[State 6995]
type = changeanim
trigger1 = anim != 5050 && vel Y > 0
value = 5050

[State 6995, End]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


;====================<DEFLECTED TARGET>====================
[Statedef 6996]
type = A
physics = N
movetype = H
ctrl = 0
facep2 = 1

[State 6996]
type = destroyself
trigger1 = ishelper

[State 6996]
type = veladd
trigger1 = 1
y = 0.6

[State 6996]
type = velset
trigger1 = !time
x = -20
y = -12

[State 6996]
type = changeanim
trigger1 = 1
value = 5030

[State 6996, End]
type = selfstate
trigger1 = vel y > 0
value = 5040
ctrl = 1


;====================<DEFLECTED TARGET>====================
[Statedef 6997]
type = A
physics = N
movetype = H
ctrl = 0

[State 6997]
type = destroyself
trigger1 = ishelper

[State 6997]
type = lifeset
trigger1 = 1
value = 0

[State 6997]
type = changeanim
trigger1 = selfanimexist(anim)
value = anim
elem = animelemno(0)

[State 6997]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 6997]
type = velset
trigger1 = !time
x = (10 + (random / 100.0)) * ifelse(random < 500, -1, 1)
y = (10 + (random / 100.0)) * ifelse(random < 500, -1, 1)

[State 6997, End]
type = selfstate
trigger1 = time >= 120
trigger1 = vel y > 0 && vel y > 0 && (pos y > -vel y)
trigger2 = time >= 240
value = 5100

[State 6997]
type = playerpush
trigger1 = 1
value = 0

[State 6997]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 6997]
type = playsnd
trigger1 = vel x > 0 && frontedgebodydist <= 0
trigger2 = vel x < 0 && backedgebodydist <= 0
trigger3 = vel y > 0 && vel y > 0 && (pos y > -vel y)
trigger4 = vel y < 0 && screenpos y <= 40
value = f7, (random % 3)
channel = 2

[State 6997]
type = velmul
trigger1 = vel x > 0 && frontedgebodydist <= 0
trigger2 = vel x < 0 && backedgebodydist <= 0
x = -1

[State 6997]
type = velmul
trigger1 = vel y > 0 && vel y > 0 && (pos y > -vel y)
trigger2 = vel y < 0 && screenpos y <= 40
y = -1


;====================<MIGHTY STANCE>====================
[Statedef 9666]
type = S
physics = N
movetype = I
sprpriority = -2
velset = 0, 0
ctrl = 0

[State 9666, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = 1

[State 9666, Var]
type = mapset
trigger1 = 1
map = "useless"
value = -1

[State 9666, Anim]
type = changeanim
trigger1 = anim != 9666
value = 9666

[State 9666]
type = posset
trigger1 = !time
y = 0

[State 9666]
type = playsnd
trigger1 = animelem = 4
trigger2 = animelemtime(4) >= 60 && random < 10
value = 4, 16
channel = 0

[State 9666, reversal]
type = reversaldef
trigger1 = 1
reversal.attr = SCA, AA, AP, AT
p2stateno = 6997
pausetime = 0, 12
hitsound = -1
sparkno = 41
sparkxy = 0, 0
numhits = 999
p1sprpriority = -2

[State 9666, drop]
type = targetdrop
trigger1 = numtarget

[State 9666, Regen]
type = mapadd
trigger1 = 1
map = "life"
value = 10

[State 9666, Ctrl]
type = ctrlset
trigger1 = time >= 90
trigger1 = !AIlevel || random < 2
value = 1

[State 9666, Poison]
redirectID = p2, ID
type = lifeadd
trigger1 = 1
value = -time
ignorehitpause = 1

[State 9666, Poison]
redirectID = p2, ID
type = palfx
trigger1 = 1
time = 60
mul = 256, ifelse(time >= 256, 0, 256 - time), ifelse(time >= 256, 0, 256 - time)
ignorehitpause = 1

[State 9666, End]
type = changestate
trigger1 = time >= 30
trigger1 = roundstate != [2, 3]
value = 0
ctrl = 1


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, HB]
type = hitby
trigger1 = 1
value = SCA, AA
time = -1
ignorehitpause = 1

[State -2, HB]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 5000
slot = 1
time = -1

[State -2, Blink]
type = null
trigger1 = movereversed
trigger1 = incustomstate
trigger1 = 1 || map(useless) := 9999
trigger1 = 1 || map(blinktimer) := 180
ignorehitpause = 1

[State -2, Give him the moves]
type = hitby
triggerall = numenemy = 1
triggerall = enemy, movetype != H
trigger1 = p2name = "Catwalk" && p2, authorname = "Phantom.of.the.Server"
trigger2 = p2name = "Dan Hibiki" && p2, authorname = "Phantom.of.the.Server" && enemy, stateno = 4000
trigger3 = p2name = "Morrigan Aensland" && p2, authorname = "Phantom.of.the.Server" && enemy, stateno = 4100
trigger4 = p2name = "JAM KURADOBERI" && p2, authorname = "AOAO" && enemy, stateno = 6001
trigger5 = p2name = "MJJ" && p2, authorname = "RyuUi SinYongKwon" && enemy, stateno = 3000
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State -2, Give him the moves]
type = hitoverride
triggerall = numenemy = 1
triggerall = enemy, movetype != H
trigger1 = p2name = "Catwalk" && p2, authorname = "Phantom.of.the.Server"
trigger2 = p2name = "Dan Hibiki" && p2, authorname = "Phantom.of.the.Server" && enemy, stateno = 4000
trigger3 = p2name = "Morrigan Aensland" && p2, authorname = "Phantom.of.the.Server" && enemy, stateno = 4100
trigger4 = p2name = "JAM KURADOBERI" && p2, authorname = "AOAO" && enemy, stateno = 6001
trigger5 = p2name = "MJJ" && p2, authorname = "RyuUi SinYongKwon" && enemy, stateno = 3000
attr =
stateno = 5000
slot = 1
time = -1

[State -2, Calm down]
type = assertspecial
trigger1 = gethitvar(damage) >= map(life)
flag = noko
ignorehitpause = 1

[State -2, Regen]
type = mapadd
trigger1 = !(gametime % 10)
trigger1 = roundstate = 2
trigger1 = alive && movetype != H
trigger1 = stateno != 6990
map = "life"
value = 1
ignorehitpause = 1

[State -2, Fill power]
type = poweradd
trigger1 = alive
trigger1 = roundstate = 2
trigger1 = movetype != H
value = ifelse(map(useless), 15, 3)
ignorehitpause = 1

[State -2, Life Var Start]
type = mapset
trigger1 = roundstate = [0, 1]
trigger2 = map(life) > lifemax
map = "life"
value = lifemax
ignorehitpause = 1

[State -2, Life Var Limit]
type = mapset
trigger1 = map(life) < life
map = "life"
value = life
ignorehitpause = 1

[State -2, Life Var Limit]
type = mapset
trigger1 = !alive
trigger2 = map(life) < 0
map = "life"
value = 0
ignorehitpause = 1

[State -2, Life Var Decrease]
type = mapadd
trigger1 = map(checkdamage)
map = "life"
value = map(checkdamage)
ignorehitpause = 1

[State -2, Check Damage]
type = mapset
trigger1 = 1
map = "checkdamage"
value = 0
ignorehitpause = 1

[State -2, Check Damage]
type = mapadd
trigger1 = numenemy
trigger1 = gethitvar(damage)
trigger1 = stateno != 700
map = "checkdamage"
value = -gethitvar(damage) / ifelse(gethitvar(hitcount) <= 1, 1, gethitvar(hitcount))
ignorehitpause = 1

[State -2, Maximum Damage]
type = mapset
trigger1 = map(checkdamage) < -250
map = "checkdamage"
value = -250
ignorehitpause = 1

[State -2, Damage Limit]
type = varset
trigger1 = p2movetype = H
map = "damagelimit"
value = 0

[State -2, Damage Limit]
type = varadd
trigger1 = map(damagelimit)
trigger1 = hitshakeover
map = "damagelimit"
value = ifelse(map(damagelimit) > 0, -1, 1)

[State -2, Damage Limit]
type = varadd
trigger1 = map(checkdamage)
map = "damagelimit"
value = -map(checkdamage)
ignorehitpause = 1

[State -2, Damage Limit]
type = varset
trigger1 = movetype = A
trigger2 = map(damagelimit) < 0
trigger3 = map(damagelimit) > 500
map = "damagelimit"
value = ifelse(map(damagelimit) > 500, 500, 0)
ignorehitpause = 1

[State -2, Not rare!]
type = mapadd
trigger1 = 1
map = "life"
value = -2 * (!(name = "Rare Akuma") + !(authorname = "Phantom.of.the.Server"))

[State -2, Not rare!]
type = mapadd
trigger1 = numenemy
trigger1 = (p2name = "Rare Akuma") && (p2, authorname = "Phantom.of.the.Server")
map = "life"
value = -1

[State -2, RESURRECTION!]
type = varset
trigger1 = roundstate < 2
var(38) = 0
ignorehitpause = 1

[State -2, RESURRECTION!]
type = selfstate
trigger1 = !var(38)
trigger1 = gethitvar(damage) >= map(life)
trigger1 = roundstate = 2
trigger1 = stateno != 6990 || movetype = H
value = 6990
ignorehitpause = 1

[State -2, Life Set]
type = lifeset
trigger1 = 1
value = map(life)
ignorehitpause = 1

[State -2, Deflector Shields]
type = helper
trigger1 = !numhelper(75)
helpertype = normal
stateno = 75
ID = 75
name = "Deflector Shields"
postype = p1
immortal = 1
pausemovetime = 65535
supermovetime = 65535

[State -2, Cheap Effects]
type = helper
trigger1 = !numhelper(77)
helpertype = normal
stateno = 77
ID = 77
name = "Holiness"
postype = p1
immortal = 1
pausemovetime = 65535
supermovetime = 65535

[State -2, MvC accuracy]
type = posadd
trigger1 = time = 1
trigger1 = (prevstateno = [200, 259])
trigger1 = stateno = 205 || stateno = 220 || stateno = 235 || stateno = 250
x = 8

[State -2, MvC accuracy]
type = posadd
trigger1 = time = 1
trigger1 = (prevstateno = [200, 259])
trigger1 = stateno = 210 || stateno = 225 || stateno = 240 || stateno = 255
x = 12

[State -2, Za Warudo]
type = varset
triggerall = var(20) != 0
trigger1 = roundstate != 2 || movetype = H || var(20) < 0
trigger2 = stateno = 4001 && animelemtime(2) >= 0
trigger3 = numhelper(3410)
trigger3 = helper(3410), movecontact
var(20) = 0
ignorehitpause = 1

[State -2, Za Warudo]
type = varadd
trigger1 = var(20) > 0
trigger1 = stateno != 3500
var(20) = -1
ignorehitpause = 1

[State -2, Za Warudo]
type = pause
trigger1 = var(20) > 0
trigger1 = roundstate = 2
time = 2
movetime = 2
ignorehitpause = 1

[State -2, Za Warudo]
type = nothitby
trigger1 = var(20) > 0
trigger1 = roundstate = 2
value = SCA
time = 1

[State -2, Za Warudo]
type = bgpalfx
trigger1 = roundstate = 2 && var(20) > 0 && !numhelper(7500)
time = 2
color = 0
add = -16 -ceil(cos(gametime / 60.0 * pi) * 16), -16 -ceil(cos(gametime / 60.0 * pi) * 16), -16 -ceil(cos(gametime / 60.0 * pi) * 16)
ignorehitpause = 1

[State -2, Za Warudo]
type = assertspecial
trigger1 = roundstate = 2 && var(20) > 0
flag = timerfreeze
flag2 = nomusic
ignorehitpause = 1

[State -2, Za Warudo Wall Bounce]
type = targetstate
trigger1 = var(20) = 1
trigger1 = numtarget
trigger1 = target, receiveddamage > 100
trigger1 = target, gethitvar(isbound) = 0
trigger1 = (target, stateno = 5000) || (target, stateno = 5010) || (target, stateno = 5020)
value = 1113500
ignorehitpause = 1

[State -2, Duckage]
type = helper
triggerall = numhelper(6160) < 3
triggerall = (roundstate = [2, 3]) && !numhelper(7500)
trigger1 = movetype = A && screenpos y < 0 && random < 25
trigger1 = (stateno != [4300, 4311])
trigger2 = stateno = 3050 && animelemtime(5) >= 0 && animelemtime(31) < 0 && random < 10
trigger3 = stateno = 3100 && animelemtime(4) >= 0 && screenpos y < 0 && random < 100
trigger4 = stateno = 4101 && random < 20
trigger5 = stateno = 4201 && time >= 30 && random < 10
trigger6 = stateno = 4902 && random < 10
helpertype = normal
stateno = 6160
ID = 6160
name = "Duck"
postype = p1
pos = ceil(p2dist x -40 + (random / 12.5)), 0
facing = ifelse(random < 500, 1, -1)
size.xscale = 1
size.yscale = 1
immortal = 1
ownpal = 1

[State -2, Damage Scaling Start]
type = mapset
trigger1 = 1
map = "damagescaling"
value = 1
ignorehitpause = 1

[State -2, Damage Scaling Update]
type = mapset
trigger1 = numenemy
trigger1 = p2movetype = H
map = "damagescaling"
value = ifelse((p2, receiveddamage) <= 0, 1.0, ifelse((p2, receiveddamage) >= 500, 0.1, 1 - ((p2, receiveddamage) * 0.0018)))
ignorehitpause = 1

[State -2, Attack Bonus]
type = mapset
trigger1 = numenemy
map = "damagescaling"
value = map(damagescaling) * ifelse((p2, lifemax <= 2000), 2000, (p2, lifemax)) / 2000.0
ignorehitpause = 1

[State -2, Attack Bonus]
type = mapset
trigger1 = numenemy
trigger1 = p2, defence > 100
map = "damagescaling"
value = map(damagescaling) * (p2, defence / 100.0)
ignorehitpause = 1

[State -2, Attack Set]
type = attackmulset
trigger1 = 1
value = map(damagescaling)
ignorehitpause = 1

[State -2, Juggle]
type = assertspecial
trigger1 = 1
flag = nojugglecheck
ignorehitpause = 1

[State -2, Awesome]
type = assertspecial
trigger1 = random < 100
trigger2 = var(20) > 0
flag = unguardable
ignorehitpause = 1

[State -2, Wha? On a rare char? O_o]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, No Dizzy >:)]
type = selfstate
trigger1 = anim = 5300
trigger1 = ((p2name = "Catwalk") + (p2, authorname = "Phantom.of.the.Server")) != 2
value = ifelse(pos y, 51, 0)
ctrl = 1

[State -2, Ultimate Mugen Feature - Rimshot]
type = varadd
trigger1 = winKO
var(8) = 1
ignorehitpause = 1

[State -2, Drum]
type = varset
trigger1 = !winKO
var(8) = 0
ignorehitpause = 1

[State -2, Drum]
type = playsnd
trigger1 = var(8) = 72
value = 5, ifelse(random<333, 29, ifelse(random<333, 42, 43))
channel = 13
abspan = 0
lowpriority = 1
ignorehitpause = 1

[State -2, Drum]
type = assertspecial
trigger1 = var(8) = [72, 114]
flag = nomusic

[State -2, Akumettes]
type = helper
trigger1 = !ishelper
trigger1 = numenemy = 1 && numhelper(6975) < 2
trigger1 = p2name = "Catwalk" && p2, authorname = "Phantom.of.the.Server"
trigger1 = movetype = H && stateno = 2000
helpertype = normal
ID = 6975
stateno = 6975
name = "Akumette"
postype = p1
pos = ifelse(numhelper(6975) = 1, -40, 40)
keyctrl = 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State lol]
type = playsnd
triggerall = movetype = H
triggerall = numenemy = 1
triggerall = p2name = "JAM KURADOBERI" && p2, authorname = "AOAO"
triggerall = enemy, movetype != H && (enemy, stateno = [6002, 6010])
trigger1 = stateno = 6304 && anim = 6304 && animelem = 2
trigger2 = stateno = 6305 && anim = 6305 && animelem = 2
trigger3 = stateno = 6307 && anim = 6306 && animelem = 2
value = 5000, ifelse(anim = 6304, 3, 2)
freqmul = ifelse(ishelper, 1.5, 1)
channel = 0

[State lol]
type = playsnd
trigger1 = movetype = H
trigger1 = numenemy = 1
trigger1 = p2name = "JAM KURADOBERI" && p2, authorname = "AOAO"
trigger1 = enemy, movetype != H && enemy, stateno = 6004
trigger1 = stateno = 6303 && time = 90
value = 4, 7
freqmul = ifelse(ishelper, 1.5, 1)
channel = 0

[State lol]
type = playsnd
trigger1 = movetype = H
trigger1 = numenemy = 1
trigger1 = p2name = "JAM KURADOBERI" && p2, authorname = "AOAO"
trigger1 = enemy, movetype != H && enemy, stateno = 6010
trigger1 = stateno = 6303 && time = 8
value = 4, 12
freqmul = ifelse(ishelper, 1.5, 1)
channel = 0

;[State -2, Voice Pos];obsolete in Ikemen
;type = sndpan
;trigger1 = 1
;channel = 0
;pan = 0
;ignorehitpause = 1

[State -2, Music Pos]
type = sndpan
trigger1 = 1
channel = 9
abspan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Attack = %.1f%%"
params = attack
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - https://network.mugenguild.com/pots/"
ignorehitpause = 1


;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[Statedef -3]

[State -3, Pos]
type = posset
trigger1 = pos y
trigger1 = roundstate = 2
trigger1 = statetype != A && movetype != H
y = 0

[State -3, Jump Steering]
type = veladd
trigger1 = pos y < 0
trigger1 = command = "holdfwd"
trigger1 = vel x < const(velocity.jump.fwd.x)
trigger1 = (stateno = [50,51]) || (stateno = [200,299])
x = 0.50

[State -3, Jump Steering]
type = veladd
trigger1 = pos y < 0
trigger1 = command = "holdback"
trigger1 = vel x > const(velocity.jump.back.x)
trigger1 = (stateno = [50,51]) || (stateno = [200,299])
x = -0.50

[State -3, Watch those stun times]
type = selfstate
trigger1 = time >= 24
trigger1 = stateno = 5000 || stateno = 5010 || stateno = 5020 || stateno = 5070 || stateno = 5080
value = ifelse(statetype = S, 5001, ifelse(statetype = C, 5011, 5030))

[State -3, Watch those stun times]
type = selfstate
trigger1 = time >= 24
trigger1 = stateno = 5001 || stateno = 5011
value = ifelse(statetype = C, 11, 0)
ctrl = 1

[State -3, C-C-C-Combo Breaker]
type = changestate
value = 1505 + 0 * map(blinktimer) := 180
triggerall = alive
triggerall = movetype = H
triggerall = time <= 1
trigger1 = gethitvar(hitcount) > 1
trigger1 = random < (25 * gethitvar(hitcount))
trigger2 = gethitvar(damage) >= lifemax

[State -3, Blink]
type = null
trigger1 = roundstate != 2
trigger1 = 1 || map(blinktimer) := 0
trigger2 = map(blinktimer) > 0
trigger2 = 1 || map(blinktimer) := (map(blinktimer) - 1)
ignorehitpause = 1

[State -3, Blink]
type = nothitby
trigger1 = map(blinktimer) > 0
trigger2 = roundstate = [3, 4]
value2 = SCA, AA, AP, AT
time = 3
ignorehitpause = 1

[State -3, Blink]
type = assertspecial
trigger1 = map(blinktimer) > 0
trigger1 = (map(blinktimer) % 12) < 6
flag = invisible
ignorehitpause = 1

[State -3, Blink]
redirectID = helper(77), ID
type = assertspecial
trigger1 = numhelper(77)
trigger1 = map(blinktimer) > 0
trigger1 = (map(blinktimer) % 12) < 6
flag = invisible
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < 250
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (p2, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, Auto Recover]
type = changestate
trigger1 = stateno = 5050
trigger1 = time && alive
value = 5040
ctrl = 1

[State -3, Allow Win Pose Selection]
type = assertspecial
trigger1 = !AIlevel
trigger1 = roundstate = [3, 4]
flag = postroundinput

[State -3, Allow Win Pose Selection]
type = assertspecial
trigger1 = !AIlevel
trigger1 = roundstate = [3, 4]
trigger1 = command = "/a" || command = "/b" || command = "/c" || command = "/x" || command = "/y" || command = "/z" || command = "/s"
trigger1 = command != "a" && command != "b" && command != "c" && command != "x" && command != "y" && command != "z" && command != "s"
flag = roundnotskip


;===========================================================================
;===============================<-4 STATES>=================================
;===========================================================================
[Statedef -4]

[State -4, Helper Damage Scaling]
type = attackmulset
trigger1 = ishelper
value = ifelse(const(size.height) = 1, 0.3333, 1) * (root, map(damagescaling))
ignorehitpause = 1

[State -4, Make vulnerable]
redirectID = p2, ID
type = hitby
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
value = SCA, AA, AP, AT
time = 2

[State -4, Make vulnerable]
redirectID = p2, ID
type = reversaldef
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = p2, reversaldefattr = SCA, AA, AP, AT
reversal.attr =
attr =

[State -4, Make vulnerable]
redirectID = p2, helper, ID
type = reversaldef
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = p2, numhelper
trigger1 = p2, helper, reversaldefattr = SCA, AA, AP, AT
reversal.attr =
attr =

[State -4, Make vulnerable]
redirectID = p2, ID
type = hitoverride
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
attr =
stateno = 5000
slot = 0
time = -1

[State -4, Make vulnerable]
redirectID = p2, ID
type = hitoverride
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
attr =
stateno = 5000
slot = 1
time = -1

[State -4, Make vulnerable]
redirectID = p2, ID
type = defencemulset
trigger1 = numenemy
trigger1 = ishelper(1) || ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
value = 1
onhit = 0
multype = 1
ignorehitpause = 1

[State -4, Force Damage]
redirectID = p2, ID
type = lifeset
trigger1 = numenemy
trigger1 = gamemode != "training"
trigger1 = ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = map(p2_ID) = p2, ID
trigger1 = map(p2nextlife)
trigger1 = p2life > map(p2nextlife)
value = map(p2nextlife) + (0 * map(p2nextlife) := 0)

[State -4, Force Damage Check]
redirectID = p2, ID
type = null
trigger1 = numenemy
trigger1 = gamemode != "training"
trigger1 = ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = map(p2_ID) = p2, ID
trigger1 = p2, pausetime = 0
trigger1 = p2, gethitvar(damage)
trigger1 = p2life > p2, gethitvar(damage)
trigger1 = map(p2nextlife) := (map(p2prevlife) - p2, gethitvar(damage))

[State -4, Force KO]
redirectID = p2, ID
type = lifeset
trigger1 = numenemy
trigger1 = gamemode != "training"
trigger1 = ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = map(p2_ID) = p2, ID
trigger1 = map(p2nextlife)
trigger1 = p2, pausetime = 0
trigger1 = p2, gethitvar(damage)
trigger1 = map(p2nextlife) < p2, gethitvar(damage)
value = 0

[State -4, Stop Regen]
redirectID = p2, ID
type = lifeset
trigger1 = numenemy
trigger1 = gamemode != "training"
trigger1 = ishelper(75) || ishelper(77)
trigger1 = root, alive = 1 && root, standby = 0
trigger1 = roundstate = 2
trigger1 = map(p2_ID) = p2, ID
trigger1 = map(p2prevlife) < p2life
value = map(p2prevlife)

[State -4, Check P2 Life]
type = null
trigger1 = numenemy
trigger1 = roundstate = 2
trigger1 = map(p2_ID) := p2, ID
trigger1 = map(p2prevlife) := p2life

[State -4, Get back here]
redirectID = p2, ID
type = selfstate
triggerall = numenemy
triggerall = !ishelper
triggerall = movetype = A
triggerall = p2movetype != H
triggerall = p2, time > 300
triggerall = random < 10
trigger1 = hitdefattr = SCA, AA, AP, AT
trigger1 = screenpos y < 0
trigger2 = stateno = 4200
value = 5040

[State -4, Useless]
type = mapadd
trigger1 = !pausetime
trigger1 = movetype = A
trigger1 = !movecontact
trigger1 = hitdefattr = SCA, AA, AP, AT
trigger1 = p2stateno != 5120
trigger1 = (p2dist y = [-30, 30]) && (p2bodydist x = [0, 60])
map = "useless"
value = 1

[State -4, Useless]
type = rootmapadd
trigger1 = ishelper
trigger1 = !pausetime
trigger1 = movetype = A
trigger1 = !movecontact
trigger1 = p2stateno != 5120
trigger1 = (p2dist y = [-30, 30]) && (p2dist x = [-30, 30])
trigger1 = random < ifelse(hitdefattr = SCA, AP, 100, 500)
map = "useless"
value = 1

[State -4, Useful]
type = mapset
triggerall = !ishelper
trigger1 = roundstate != 2
trigger2 = movecontact = 1
map = "useless"
value = 0
ignorehitpause = 1

[State -4, Useful]
type = rootmapset
trigger1 = ishelper
trigger1 = movecontact = 1
trigger1 = numtarget
map = "useless"
value = 0
ignorehitpause = 1

[State -4, Repair Mothership]
redirectID = root, ID
type = lifeset
trigger1 = ishelper
value = root, map(life)
ignorehitpause = 1

[State -4, Poison]
redirectID = p2, ID
type = lifeadd
trigger1 = ishelper
trigger1 = root, stateno = 9666
value = -(root, time)
ignorehitpause = 1

[State -4, Poison]
redirectID = p2, ID
type = lifeset
trigger1 = ishelper
trigger1 = p2, ishelper = 0
trigger1 = root, stateno = 9666
trigger1 = root, time >= 300 || root, pausetime > 0
trigger1 = random < 5
value = 0
ignorehitpause = 1

[State -4, Poison]
redirectID = p2, root, ID
type = lifeset
trigger1 = ishelper
trigger1 = p2, ishelper = 1
trigger1 = root, stateno = 9666
trigger1 = root, time >= 300 || root, pausetime > 0
trigger1 = random < 5
value = 0
ignorehitpause = 1

[State -4, Check Reversals]
type = rootmapadd
trigger1 = ishelper
trigger1 = movereversed
trigger1 = incustomstate
trigger1 = time <= 1
map = "useless"
value = 3
ignorehitpause = 1

[State -4, Remove dead helpers]
type = selfstate
triggerall = ishelper
triggerall = !ishelper(1)
triggerall = stateno != 1006
trigger1 = !alive
trigger2 = stateno = [5000, 5150]
value = 1006
ignorehitpause = 1

[State -4, Move during pause]
type = null
trigger1 = pausetime <= 0
trigger1 = 1 || map(pausetime) := 0
trigger2 = pausetime > 0
trigger2 = map(pausetime) = 0
trigger2 = map(pausetime) := pausetime
ignorehitpause = 1

[State -4, Move during pause]
type = superpause
trigger1 = !ishelper
trigger1 = pausetime > 0
trigger1 = map(pausetime) > 0
trigger1 = pausetime = (map(pausetime) - 5); some delay seems to be required
trigger1 = power >= 3000
trigger1 = ctrl
time = p2, pausetime
movetime = p2, pausetime
anim = -1
sound = -1
p2defmul = 1
darken = 0

[State -4, Just Let Go]
redirectID = enemy, ID
type = targetdrop
trigger1 = alive
trigger1 = !ishelper
trigger1 = movetype != H
trigger1 = movereversed = 0
trigger1 = numenemy
trigger1 = enemy, numtarget
trigger1 = ID = enemy, target, ID
ignorehitpause = 1

[State -4, Just Let Go]
redirectID = enemy, helper, ID
type = targetdrop
trigger1 = alive
trigger1 = !ishelper
trigger1 = movetype != H
trigger1 = movereversed = 0
trigger1 = numenemy
trigger1 = enemy, numhelper
trigger1 = enemy, helper, numtarget
trigger1 = ID = enemy, helper, target, ID
ignorehitpause = 1
