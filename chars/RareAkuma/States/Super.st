; _____________________________________
;| Rare Akuma by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<FULL POWER MESSATSU GOU HADOU>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3000, Width]
type = width
trigger1 = anim = 3001
value = 30, 0

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3000, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -30, -54
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 3000, superchargepause]
type = superpause
trigger1 = !time
time = 45
anim = -1
sound = s7, 0
poweradd = -1000 * (var(20) <= 0)
p2defmul = 1
darken = 0
movetime = 45

[State 3000, NHB]
type = nothitby
trigger1 = time <= 80
time = 1
value = SCA

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 3000, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -38, 0
scale = 1, 1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3000, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
freq = 60
ampl = 4
ignorehitpause = 1

[State 3000, hadouken]
type = helper
trigger1 = animelem = 14
helpertype = normal
stateno = 3005
ID = 3005
name = "Hadouken"
postype = p1
size.xscale = 1
size.yscale = 1
ownpal = 1
pausemovetime = var(20)

[State 3000, Dust]
type = explod
trigger1 = animelem = 14
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 16, 0
ownpal = 1
scale = 1, 1
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 14
value = 3, 7
channel = 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 14
value = 5, 2

[State 3000, Vel]
type = velset
trigger1 = numhelper(3005) && frontedgedist < 160
x = -6

[State 3000]
type = screenbound
trigger1 = numhelper(3005)
trigger1 = helper(3005), var(0) && (helper(3005), stateno = [3005, 3006])
value = 0
movecamera = 0, 1

[State 3000, End]
type = changestate
triggerall = animelemtime(15) >= 0
trigger1 = !numhelper(3005)
trigger2 = numhelper(3005) = 1
trigger2 = helper(3005), stateno != 3005
value = ifelse((backedgebodydist < 0 || frontedgebodydist < 0), 3003, 3002)


[Statedef 3002]
type = S
physics = S
movetype = A
anim = 3002
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 3003]
type = S
physics = S
movetype = A
anim = 3002
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3003]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 3003, End]
type = changestate
trigger1 = !animtime
value = 3004


;--- wow ---
[Statedef 3004]
type = S
movetype = I
physics = N
juggle = 0
anim = 1505
velset = 0, 0
sprpriority = 1
poweradd = -500 * (var(20) <= 0)
ctrl = 0

[State 3004]
type = posset
trigger1 = !time
x = ifelse(facing = 1, -80, 80)
y = 0

[State 3004, Snd]
type = playsnd
trigger1 = !time
value = 5, 16

[State 3004, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8
value = 1, 6
channel = 1

[State 3004, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 52

[State 3004, Dust]
type = explod
trigger1 = animelem = 11
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3004, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<TENMA GOU ZANKUU>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3050, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State air raid]
type = playsnd
trigger1 = !time
trigger1 = random < 250
value = 5, 26
channel = 9

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 14
channel = 0

[State 3050, superchargehelper]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -8, -103
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 3050, superchargepause]
type = superpause
trigger1 = animelem = 2
time = 53
anim = -1
sound = s7, 0
poweradd = -2000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(16) < 0
time = 1
value = SCA

[State 3050, hadoukens]
type = projectile
trigger1 = !(animelemtime(5) % 2)
trigger1 = animelemtime(5) >= 0 && animelemtime(31) < 0
projID = 3055
projanim = 1005
projhitanim = 7170
projremanim = 1006
projscale = 0.75, 0.75
velocity = 7.5 + (random / 200.0), 7.5 + (random / 200.0)
projsprpriority = 4
projedgebound = 320
projheightbound = -9999, 0
postype = back
offset = (-160 + (random % 320)), ceil(pos y -screenpos y) -80
ownpal = 1
attr = A, HP
damage = 20, 4
animtype = Hard
guardflag = MH
hitflag = MAFD
priority = 7, Hit
pausetime = 4, 12
sparkno = 2
guard.sparkno = 40
sparkxy = -10, 0
hitsound = s5, 1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10, -2
air.velocity = -1, -2
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 3, 0
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 5, 0
channel = 1

[State 3050, Vel]
type = velset
trigger1 = animelemtime(5) >= 0 && animelemtime(29) < 0
x = ifelse(command = "holdback", -3, ifelse(command = "holdfwd", 3, 0))
y = ifelse((command = "holddown" && pos y <= -3), 3, ifelse(command = "holdup", -3, 0))

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(32) >= 0
physics = A


;========================<MESSATSU GOU SHORYUU>=============================
[Statedef 3100]
type = A
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
juggle = 0
sprpriority = 1
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3100, Snd]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0

[State 3100, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 12, -54
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 3100, superchargepause]
type = superpause
trigger1 = !time
time = 45
anim = -1
sound = s7, 0
poweradd = -1000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 3100, NHB]
type = nothitby
trigger1 = time < 16
time = 1
value = SCA
ignorehitpause = 1

[State 3100]
type = screenbound
trigger1 = animelemtime(4) >= 0
value = 0
movecamera = 0, 0

[State 3100, Vel]
type = playerpush
trigger1 = animelemtime(4) >= 0
value = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 6
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 40

[State 3100, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
x = 5
y = -20

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 3
attr = A, HA
damage = 20, 4
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 7, Hit
pausetime = 12, 11
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ifelse((animelem = 3), -80, -50)
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -4.0
air.type = Low
air.velocity = 0, -4.0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 3100, Hit]
type = hitdef
trigger1 = animelemtime(4) >= 0
trigger1 = !(animelemtime(4) % 4)
attr = A, HA
damage = 20, 4
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 7, Hit
pausetime = 4, 4
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -10
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -vel x, -1.75
air.type = Low
air.velocity = -vel x, -1.75
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 3100, End]
type = changestate
trigger1 = facing = 1 && pos x > 200
trigger2 = facing = -1 && pos x < -200
trigger3 = animelemtime(4) >= 0
trigger3 = screenpos y < 0 && time >= 180
value = 3101

[State 3100, Snd]
type = playsnd
trigger1 = animelemtime(4) >= 0
trigger1 = screenpos y < 0
value = 3, (random % 12)
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4
trigger2 = animelemtime(4) >= 0 && screenpos y < 0
value = 5, 27
channel = 1

[State 3100, Pos]
type = posset
trigger1 = animelemtime(4) >= 0
trigger1 = screenpos y < 0
y = ceil(pos y -screenpos y) + 400

[State 3100, noshadow]
type = assertspecial
trigger1 = pos y > 0
flag = noshadow


;--- Finish ---
[Statedef 3101]
type = A
physics = A
movetype = A
anim = 1101
velset = 0, 0
ctrl = 0

[State 3101, Snd]
type = posset
trigger1 = !time
x = 0
y = ceil(pos y -screenpos y) -80

[State 3101]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0


;========================<MESSATSU GOU RASEN>=============================
[Statedef 3200]
type = A
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
juggle = 0
sprpriority = 1
facep2 = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 2
value = 4, 4
channel = 0

[State 3200, superchargehelper]
type = helper
trigger1 = anim = 3200 && animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -32, -8
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 3200, superchargepause]
type = superpause
trigger1 = anim = 3200 && animelem = 2
time = 45
anim = -1
sound = s7, 0
poweradd = -1000 * (var(20) <= 0)
p2defmul = 1
darken = 0
movetime = 45

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && !animtime
value = 3201

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3201 && !animtime
value = 3202
persistent = 0

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200
trigger2 = anim = 3201 && animelemtime(14) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3202
statetype = A
physics = A

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 7
trigger2 = anim = 3201 && animelem = 55
value = 3, ifelse((anim = 3200), 6, 7)
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3201 && animelem = 1
value = 5, 13
persistent = 0

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 8
value = 0, 40

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 8
x = 0
y = -8

[State 3200, Vel]
type = velset
trigger1 = anim = 3201 && vel y > 0
y = 0

[State 3200, Vel]
type = veladd
trigger1 = anim = 3201 && vel y < 0
y = 0.14

[State 3200, ctrlvel]
type = velset
trigger1 = anim = 3201 && vel y < 0
x = sin(animelemtime(1) / 8.0 * pi) * 20

[State 3200, ctrlvel]
type = velset
trigger1 = anim = 3201 && vel y >= 0
x = 0

[State 3200]
type = helper
triggerall = anim = 3201 && numenemy
triggerall = (var(31) := anim || var(32) := animelemno(0)) ** 0
trigger1 = animelem = 2 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49
helpertype = normal
stateno = 1511
name = "Afterimage"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 3200]
type = posset
trigger1 = anim = 3201 && numenemy
trigger1 = animelem = 2 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49
x = (p2, pos x) -70 + (random / 7.15)
y = (p2, pos y) + 35 -(random / 16.67)

[State 3200]
type = posadd
trigger1 = anim = 3201 && numenemy
trigger1 = animelem = 54
x = ceil(p2dist x -60)
y = ceil(p2dist y)

[State 3200]
type = posset
trigger1 = animelemtime(55) < 0 && pos y > 0
y = 0

[State snd]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 54
value = 5, 16
channel = 2

[State 3200, Snd]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55
value = 1, 5
channel = 1

[State 3200, 1sthit]
type = hitdef
trigger1 = anim = 3200 && animelem = 8
attr = S, HA
damage = 24, 5
animtype = Hard
guardflag = M
hitflag = MAFD
priority = 7, Hit
pausetime = 16, 16
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -62
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 2, 0), -6
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 2, 0), -5
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
p2facing = 1
kill = var(20) <= 0

[State 3200, mainhits]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger2 = animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50
attr = A, HA
damage = 24, 5
animtype = Up
guardflag = MA
hitflag = MAFD
priority = 7, Hit
pausetime = 2, 2
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -69
hitsound = s2, ifelse(random < 500, 6, 5)
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 1.5)
getpower = 91
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 3200, mainhitsb]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger2 = animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47 || animelem = 56
attr = A, HA
damage = 24, 5
animtype = Up
guardflag = MA
hitflag = MAFD
priority = 7, Hit
pausetime = 2, 2
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -69
hitsound = s2, ifelse(random < 500, 6, 5)
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2bodydist x > 15, 1.5, 0), -10
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 1.5, 0), (vel y - 1.5)
getpower = 91
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 3200, lasthit]
type = hitdef
trigger1 = anim = 3201 && animelem = 56
attr = S, HA
damage = 24, 5
animtype = Diagup
guardflag = MA
hitflag = MAFD
priority = 7, Hit
pausetime = 24, 24
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, -2
air.type = Low
air.velocity = -7, -2
getpower = 91
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -7, 7)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0


;========================<TENMA SHINZUI WARIO>=============================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
juggle = 0
sprpriority = 1
facep2 = 1

[State 3300, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3300, comboposition]
type = posadd
trigger1 = !time
trigger1 = (prevstateno = [200, 4999])
y = -30

[State 3300, Snd]
type = playsnd
trigger1 = !time
value = 4, 14
channel = 0

[State 3300, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 5, -45
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 3300, superchargepause]
type = SuperPause
trigger1 = !time
time = 45
anim = -1
sound = s7, 0
poweradd = -1000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 3300, NHB]
type = nothitby
trigger1 = anim = 3300 && time < 12
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3300, trail]
type = helper
trigger1 = anim = 3300 && animelem = 2
helpertype = normal
stateno = 3305
ID = 3305
name = "Tenma trail"
postype = p1
ownpal = 1
pausemovetime = var(20)
persistent = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3300 && animelem = 2
anim = 3306
ID = 3306
sprpriority = 2
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Vel]
type = velset
trigger1 = anim = 3300 && animelemtime(2) >= 0
x = 16
y = 16

[State 3300]
type = helper
trigger1 = anim = 3300
trigger1 = movehit = 1 && hitcount < 5
trigger1 = (var(31) := anim || var(32) := animelemno(0)) ** 0
helpertype = normal
stateno = 1511
name = "Afterimage"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 3300, Pos]
type = posadd
trigger1 = anim = 3300
trigger1 = movehit = 1 && hitcount < 5
x = -160
y = -160

[State snd]
type = playsnd
trigger1 = anim = 3300
trigger1 = movehit = 1 && hitcount < 5
value = 5, 16

[State 3100]
type = screenbound
trigger1 = hitcount >= 1 && pos y < 0
value = 0
movecamera = 0, 0

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 3, 7
channel = 0

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 1, 6
channel = 1

[State 3300, Hit]
type = hitdef
trigger1 = anim = 3300 && animelemtime(2) >= 0 && hitcount < 5
attr = A, HA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 7, Hit
pausetime = ifelse(hitcount = 4, 18, 0), ifelse(hitcount = 4, 30, 12)
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -15
hitsound = s2, 11
guardsound = s2, 0
ground.type = High
animtype = Diagup
fall.animtype = Diagup
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -6.85
air.velocity = 0, -6.85
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -6, 6)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 40
fall = 1
fall.recover = 0
sprpriority = 1
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3300 && animelemtime(2) > 0 && pos y >= -5
value = 3301

[State 3300, Hit]
type = hitdef
trigger1 = anim = 3301 && animelem = 1
attr = A, HA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MD
priority = 7, Hit
pausetime = 0, 0
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -15
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
animtype = Diagup
fall.animtype = Diagup
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -6.85
air.velocity = 0, -6.85
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -6, 6)
fall = 1
fall.recover = 0
sprpriority = 1
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 3300, explosion]
type = playsnd
trigger1 = anim = 3300 && hitcount = 5
trigger1 = movehit = 1 && numtarget
value = 5, 1
persistent = 0

[State 3300, explosion]
type = explod
trigger1 = anim = 3300 && hitcount = 5
trigger1 = movehit = 1 && numtarget
anim = 7170
postype = p2
pos = 0, target, const(size.mid.pos.y)
random = 20, 20
sprpriority = 3
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
persistent = 0

[State 3300, flames]
type = helper
triggerall = movehit && anim = 3300
trigger1 = numtarget && !numhelper(7181)
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
ignorehitpause = 1
pausemovetime = var(20)
persistent = 0

[State 3300, Type]
type = statetypeset
trigger1 = anim = 3301
statetype = S
physics = N

[State 3300, Type]
type = velmul
trigger1 = anim = 3301
x = 0.9

[State 3300, Vel]
type = velset
trigger1 = anim = 3301 && animelem = 1
x = 24

[State 3300, Stop]
type = posset
trigger1 = anim = 3301
y = 0

[State 3300, Stop]
type = velset
trigger1 = anim = 3301
y = 0

[State 3300, Stop]
type = velset
trigger1 = anim = 3301 && animelemtime(4) >= 0
x = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && vel x > 1 && !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 42, 0
vel = -1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 0, 52

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 5, 14

[State 3300, End]
type = changestate
trigger1 = anim = 3301 && !animtime
value = 0
ctrl = 1


;========================<CHARAMARI>=============================
[Statedef 3400]
type = S
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3400, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3400, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3400, mc]
type = screenbound
trigger1 = animelemtime(2) >= 0
value = 0
movecamera = 0, 1

[State 3400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 3400, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -3, 0
ownpal = 1
scale = 2, 2
pausemovetime = -1
supermovetime = -1

[State 3400, Push]
type = playerpush
trigger1 = animelemtime(2) >= 0
value = 0

[State 3400, Vel]
type = veladd
trigger1 = animelemtime(2) >= 0
x = -1
y = 0

[State 3400, Vel]
type = velset
trigger1 = animelem = 2
x = -6
y = 0

[State 3400, End]
type = changestate
triggerall = animelemtime(2) >= 0
trigger1 = facing = 1 && pos x <= -240
trigger2 = facing = -1 && pos x >= 240
trigger3 = time >= 120
value = 3401


;--- Rolling ---
[Statedef 3401]
type = S
physics = N
movetype = A
anim = 3401
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3401, Pos]
type = posset
trigger1 = !time
x = ifelse(facing = -1, 540, -540)
y = 0

[State 3401, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = back
pos = 0, -80
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 3401, superchargepause]
type = playsnd
trigger1 = !time
value = 7, 0
abspan = ifelse(facing = 1, -160, 160)

[State 3401, superchargepause]
type = superpause
trigger1 = !time
time = 53
anim = -1
sound = -1
poweradd = -2000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 3401, NHB]
type = nothitby
trigger1 = time <= 60
time = 1
value = SCA

[State 3401, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 3401, charamari]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 3410
ID = 3410
name = "Charamari"
postype = p1
pos = 200, 0
size.xscale = 1
size.yscale = 1
pausemovetime = var(20)
ownpal = 1

[State 3401]
type = assertspecial
trigger1 = time
flag = nomusic

[State 3401, Snd]
type = playsnd
trigger1 = time = 1
value = 9, 13
channel = 9
freqmul = 1 + (random / 4000.0)

[State 3401, Pos]
type = posset
trigger1 = time && numhelper(3410)
trigger1 = (helper(3410), stateno = [3410, 3411])
x = ceil(helper(3410), pos x) - (200 * facing)
y = 0

[State 3401, Vel]
type = velset
trigger1 = time
x = 6
y = 0

[State 3401, Push]
type = playerpush
trigger1 = time
value = 0

[State 3404, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, 100

[State 3401, End]
type = changestate
trigger1 = time >= 60 && facing = 1 && pos x >= 240
trigger2 = time >= 60 && facing = -1 && pos x <= -240
trigger3 = time && !numhelper(3410) && (pos x != [-160, 160])
trigger4 = time && numhelper(3410)
trigger4 = (helper(3410), stateno != [3410, 3412])
value = 3402

[State 3401, End]
type = changestate
trigger1 = time && !numhelper(3410) && (pos x = [-160, 160])
trigger2 = time >= 600
value = 0
ctrl = 1


;--- End ---
[Statedef 3402]
type = S
physics = N
movetype = I
anim = 100
velset = 0, 0
ctrl = 0

[State 3402, Pos]
type = posset
trigger1 = !time
x = -240 * facing
y = 0

[State 3402, Vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 3402, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 3402, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3402, steps]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 0, 100

[State 3402, End]
type = changestate
trigger1 = time >= 60
trigger2 = (facing = 1 && pos x >= -80) || (facing = -1 && pos x <= 80)
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 3420]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3420, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 3420]
type = screenbound
trigger1 = !ishelper
value = 0
movecamera = 0, 1

[State 3420, Anim]
type = changeanim
trigger1 = ishelper
value = anim

[State 3420, Anim]
type = changeanim2
trigger1 = !ishelper && !time
value = 3420

[State 3420, Snd]
type = angleset
trigger1 = !time
value = 45 * (random % 8)

[State 3420, Snd]
type = angleadd
trigger1 = 1
value = 1

[State 3420, Snd]
type = angledraw
trigger1 = 1

[State 3420, Flash]
type = palfx
trigger1 = 1
time = 2
add = 64 + ceil(cos(time / 4.0 * pi) * 64), 64 + ceil(cos(time / 4.0 * pi) * 64), 64 + ceil(cos(time / 4.0 * pi) * 64)

[State 3420, End]
type = changestate
trigger1 = time >= 600
value = 3421


[Statedef 3421]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3421, End]
type = removeexplod
trigger1 = ishelper

[State 3421, End]
type = destroyself
trigger1 = ishelper

[State 3421, Snd]
type = angleset
trigger1 = 1
value = 0

[State 3421, End]
type = selfstate
trigger1 = prevstateno = [120, 155]
value = ifelse(statetype = A, 154, ifelse(statetype = C, 152, 150))

[State 3421, Anim]
type = changeanim2
trigger1 = !time
value = 3421

[State 3421, turn]
type = turn
trigger1 = !time

[State 3421, Pos]
type = posset
trigger1 = !time
x = 240 * facing
y = -180

[State 3421, Vel]
type = veladd
trigger1 = 1
y = 0.6

[State 3421, Vel]
type = velset
trigger1 = !time
x = -4
y = -16

[State 3421, Camera]
type = screenbound
trigger1 = 1
value = (time >= 32 || (facing = 1 && pos x <= 0) || (facing = -1 && pos x >= 0))
movecamera = (time >= 32 || (facing = 1 && pos x <= 0) || (facing = -1 && pos x >= 0)), 1

[State 3421, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= const(size.mid.pos.y)
value = 5100


;--- KO ---
[Statedef 3422]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3422, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 3422]
type = screenbound
trigger1 = !ishelper
value = 0
movecamera = 0, 1

[State 3422, Anim]
type = changeanim
trigger1 = ishelper
value = anim

[State 3422, Anim]
type = changeanim
trigger1 = !ishelper
value = 5012

[State 3422, Snd]
type = angleadd
trigger1 = 1
value = 3

[State 3422, Snd]
type = angledraw
trigger1 = 1
scale = 1 -(0.01 * time), 1 -(0.01 * time)

[State 3422, Snd]
type = angledraw
trigger1 = time >= 100
scale = 0, 0

[State 3422, Snd]
type = angledraw
trigger1 = time >= 1000
scale = 0, 0

[State 3422, End]
type = changestate
trigger1 = time >= 600
value = 3423


[Statedef 3423]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3423, End]
type = removeexplod
trigger1 = ishelper

[State 3423, End]
type = destroyself
trigger1 = ishelper

[State 3423, die]
type = lifeset
trigger1 = !ishelper
value = 0

[State 3423, Snd]
type = angleset
trigger1 = 1
value = 0

[State 3423, Pos]
type = posset
trigger1 = 1
y = 0

[State 3423, Finisher Flag]
type = mapset
trigger1 = 1
map = "_pots_rarefinisher"
value = 1

[State 3423, End]
type = changestate
trigger1 = 1
value = 5150


;========================<ZA WARUDO>=============================
[Statedef 3500]
type = S
physics = N
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3500, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 3500, timer]
type = varset
trigger1 = !time
var(20) = ceil(power / 16.6666667) + 90

[State 3500, Snd]
type = stopsnd
trigger1 = !time
channel = -1

[State 3500, Snd]
type = playsnd
trigger1 = !time
value = 3, 5
channel = 0

[State 3500, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -5, -67
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 3500, superchargepause]
type = superpause
trigger1 = !time
time = 60
movetime = 60
anim = -1
sound = s7, 0
poweradd = -powermax
p2defmul = 1
darken = 0

[State 3500, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3500, End]
type = changestate
trigger1 = time >= 90
value = 0
ctrl = 1



;--- Hit Pause ---
[Statedef 1113500]
type = A
movetype = H
physics = N
velset = 0, 0

[State 1113500, Anim]
type = changeanim
trigger1 = 1
value = 5002

[State 1113500, End]
type = changestate
trigger1 = time >= 1
value = 1113501


;--- Falling ---
[Statedef 1113501]
type = A
movetype = H
physics = N

[State 1113501, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel) * 0.67

[State 1113501, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1113501, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x < 0, -12, 12)
y = -5

[State 1113501, Turn]
type = turn
trigger1 = !time
trigger1 = vel x > 0

[State 1113501, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = (vel y < 0), 0

[State 1113501, Screen]
type = screenbound
triggerall = numenemy
trigger1 = pos x > -40 && enemy, pos x > -40
trigger2 = pos x < 40 && enemy, pos x < 40
value = 1
movecamera = 1, 0

[State 1113501, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1113501, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1113501, Bounce]
type = changestate
trigger1 = time >= 4
trigger1 = backedgebodydist <= 0 || frontedgebodydist <= 0
value = 1113502

[State 1113501, End]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


;--- Hitting Wall ---
[Statedef 1113502]
type = A
movetype = H
physics = N

[State 1113502, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1113502, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 1113502, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1113502, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1113502, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1113502, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1113502, Snd]
type = playsnd
trigger1 = !time
value = f7, 2

[State 1113502, FX]
type = explod
trigger1 = !time
anim = f72
postype = p1
pos = -const(size.air.back), const(size.mid.pos.y)
sprpriority = -5
ownpal = 1

[State 1113502, End]
type = changestate
trigger1 = time >= 4
value = 1113503


;--- Falling ---
[Statedef 1113503]
type = A
movetype = H
physics = N

[State 1113503, turn]
type = turn
trigger1 = !time

[State 1113503, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 1113503, Vel]
type = velset
trigger1 = !time
x = ((p2, pos x - pos x) * facing + 60) / 36.0
y = (pos y + 0.5 * 0.4850 * 36 ** 2) / -36.0

[State 1113503, Vel]
type = velset
trigger1 = !time
trigger1 = vel x != [-9, 0]
x = ifelse(vel x < -9, -9, 0)

[State 1113503, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1113503, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050

[State 1113503, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1113503, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1113503, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1113503, End]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


;========================<MISOGI>=============================
[Statedef 4100]
type = A
physics = N
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
juggle = 0
facep2 = 1

[State 4100, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State air raid]
type = playsnd
trigger1 = !time
trigger1 = random < 250
value = 5, 26
channel = 9

[State 4100, Snd]
type = playsnd
trigger1 = !time
value = 4, 3
channel = 0

[State 4100, superchargehelper]
type = helper
trigger1 = anim = 4100 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -5, -45
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 4100, superchargepause]
type = superpause
trigger1 = anim = 4100 && animelem = 3
persistent = 0
time = 60
anim = -1
sound = s7, 0
poweradd = -3000 * (var(20) <= 0)
p2defmul = 1
darken = 0
movetime = 60

[State 4100, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4100, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 4100, illusions]
type = helper
trigger1 = time = 61
helpertype = normal
stateno = 4104
ID = 4104
name = "Misogi Illusion"
postype = p1
ownpal = 1
persistent = 0
pausemovetime = 999
supermovetime = 999

[State 4100, End]
type = changestate
trigger1 = time >= 63
value = 4101


;--- Firing ---
[Statedef 4101]
type = A
physics = N
movetype = A
anim = 9999
ctrl = 0
velset = 0, 0

[State 4101, dist]
type = attackdist
trigger1 = 1
value = 640

[State 4101, Snd]
type = playsnd
trigger1 = !time
value = 5, 9

[State 4101, Snd]
type = playsnd
trigger1 = time >= 6 && random < 100
value = 4, 11

[State 4101, End]
type = changestate
trigger1 = time >= 40
value = 4120

[State 4101, comming down]
type = projectile
trigger1 = !(time % 2)
projID = 4101
projanim = 4101
projremanim = 4102
projremove = 0
projscale = 1, 1
velocity = 0, 20
projsprpriority = -1
projedgebound = 80
projheightbound = -9999, -19
postype = back
offset = ifelse(!(time % 4), 320 -8 * (time % 80), 8 * (time % 80)), ceil(pos y -screenpos y) - 80
ownpal = 1
attr = S, HP
damage = 32, 7
animtype = Hard
guardflag = MH
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 12
sparkno = 2
guard.sparkno = 40
sparkxy = -10, -52
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
air.velocity = 0, -6
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 0
air.fall = 1
fall.recover = 0
kill = var(20) <= 0

;--- Finish ---
[Statedef 4120]
type = A
physics = N
movetype = A
anim = 4120
ctrl = 0
velset = 0, 0
sprpriority = -1
juggle = 0

[State 4120, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4120, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 4120, Pos]
type = posadd
trigger1 = !time
x = p2dist x -10
y = p2dist y -240

[State 4120, Vel]
type = velset
trigger1 = 1
y = 20

[State 4120, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 11
channel = 0

[State 4120, Snd]
type = playsnd
trigger1 = !time
value = 5, 9

[State 4120, particles]
type = explod
trigger1 = 1
vel = 0, -4
anim = 4111
sprpriority = 3
postype = p1
pos = 3, -60
random = 40, 40
facing = -1 + (random < 500) * 2
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4120, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, HA
damage = 500, 50
animtype = Hard
guardflag =
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 30
sparkno = 2
guard.sparkno = 40
hitsound = s2, 9
guardsound = s2, 0
ground.type = High
air.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
guard.velocity = -10
air.velocity = 0, 20
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
sprpriority = -1
ID = 4120
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 4120, p2state]
type = targetstate
trigger1 = movehit && numtarget(4120)
trigger1 = (target(4120), stateno = 5000) || (target(4120), stateno = 5010)
value = 4150
ID = 4120
ignorehitpause = 1

[State 4120, p2state]
type = targetstate
trigger1 = movehit && numtarget(4120)
trigger1 = (target(4120), stateno = 5020)
value = 4155
ID = 4120
ignorehitpause = 1

[State 4120, Anim]
type = changestate
trigger1 = pos y >= -5
value = 4121


;--- Land ---
[Statedef 4121]
type = S
physics = S
movetype = A
anim = 4121
ctrl = 0
velset = 0, 0
sprpriority = -1
juggle = 0

[State 4121, Stop]
type = posset
trigger1 = 1
y = 0

[State 4121, Shake]
type = envshake
trigger1 = !time
time = 30
ampl = 12

[State 4121, Snd]
type = playsnd
trigger1 = !time
value = 5, 7

[State 4121, fire]
type = explod
trigger1 = !time
vel = 0, 0
anim = 4105
sprpriority = 4
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4121, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1

[State 4121, Dust]
type = explod
trigger1 = time = 13
vel = 0, 0
anim = 7107
ID = 7107
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4121, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET STANDING ---
[Statedef 4150]
type = S
physics = S
movetype = H
ctrl = 0
velset = gethitvar(xvel), 0
sprpriority = 1

[State 4150, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5950)
value = 5950

[State 4150, Anim]
type = changeanim2
trigger1 = !time
trigger1 = !selfanimexist(5950)
value = 4150

[State 4150, Stop]
type = posset
trigger1 = 1
y = 0

[State 4150, Stop]
type = velset
trigger1 = 1
y = 0

[State 4150, Dust]
type = explod
trigger1 = anim = 4150 && animelem = 7
anim = F60
postype = p1
pos = 0, 0
sprpriority = ifelse(sysvar(1) <= 14, -10, 10)
pausemovetime = -1
supermovetime = -1

[State 4150, Snd]
type = playsnd
trigger1 = anim = 4150 && animelem = 7
value = f7, 0

[State 4150, Anim]
type = changeanim
trigger1 = time >= 110 && selfanimexist(5111)
value = 5111

[State 4150, End]
type = selfstate
trigger1 = time >= 110
value = ifelse(alive, 5120, 5150)


;--- TARGET MID -AIR ---
[Statedef 4155]
type = A
physics = N
movetype = H
ctrl = 0
velset = gethitvar(xvel), gethitvar(yvel)
sprpriority = 1

[State 4155, Anim]
type = changeanim2
trigger1 = !time
value = 4155

[State 4155, Accel]
type = gravity
trigger1 = animelemtime(5) < 0

[State 4155, Stop]
type = posset
trigger1 = pos y >= 0
y = 0

[State 4155, Stop]
type = velset
trigger1 = pos y >= 0
y = 0

[State 4155, Type]
type = statetypeset
trigger1 = pos y >= 0
type = L
physics = C

[State 4155, Anim]
type = changeanim2
trigger1 = pos y >= 0
value = 4155
elem = 5
persistent = 0

[State 4155, Dust]
type = explod
trigger1 = animelem = 5
anim = F62
postype = p1
pos = 0, 0
sprpriority = ifelse(sysvar(1) <= 14, -10, 10)
pausemovetime = -1
supermovetime = -1

[State 4155, Snd]
type = playsnd
trigger1 = animelem = 5
value = f7, 2

[State 4155, End]
type = selfstate
trigger1 = animelemtime(7) >= 110
value = ifelse(alive, 5120, 5150)


;========================<KONGOU KOKURETSU ZAN>=============================
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 4200
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1

[State 4200, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State air raid]
type = playsnd
trigger1 = !time
trigger1 = random < 250
value = 5, 26
channel = 9

[State 4200, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -18, -126
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 4200, superchargepause]
type = superpause
trigger1 = !time
time = 53
anim = -1
sound = s7, 0
poweradd = -2000 * (var(20) <= 0)
p2defmul = 1
darken = 0
movetime = 53

[State 4200, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4200, End]
type = changestate
trigger1 = time >= 53
value = 4201


;--- Firing ---
[Statedef 4201]
type = S
physics = S
movetype = A
anim = 4201
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 4201, NHB]
type = nothitby
trigger1 = time < 120
time = 1
value = SCA

[State 4201, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 4201, Snd]
type = playsnd
trigger1 = time < 120 && !(time % 8)
value = 5, 0
channel = 1

[State 4201, going up]
type = explod
trigger1 = time < 120 && (time % 6) = 0
anim = 1005
sprpriority = 3
postype = p1
pos = -18, -136
random = 40, 40
vel = -0.5 + (random / 1000.0), -6 -(random / 250.0)
removetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 4201, going up]
type = projectile
trigger1 = time < 120 && (time % 6) = 3
projID = 4205
projanim = 1005
projhitanim = 7170
projremanim = 1006
projscale = 0.5, 0.5
velocity = -0.5 + (random / 1000.0), -6 -(random / 250.0)
projsprpriority = 4
projedgebound = 80
projheightbound = -720, 0
postype = p1
offset = ceil(-38 + (random / 25.0)), ceil(-156 + (random / 25.0))
ownpal = 1
attr = S, HP
damage = 20, 4
animtype = Hard
guardflag = MH
hitflag = MAFD
priority = 7, Hit
pausetime = 4, 12
sparkno = 2
guard.sparkno = 40
sparkxy = -10, 0
hitsound = s5, 1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -4
air.velocity = 0, -4
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 4201, comming down]
type = projectile
trigger1 = time >= 60 && !(time % 4)
projID = 4205
projanim = 1005
projhitanim = 7170
projremanim = 1006
projscale = 0.75, 0.75
velocity = -10 + (random / 50.0), 7.5 + (random / 200.0)
ownpal = 1
accel = 0, 0.25
velmul = 0.9, 1
projsprpriority = 4
projedgebound = 80
projheightbound = -9999, 0
postype = p1
offset = ceil(p2dist x -100 + (random / 5.0)), ceil(pos y -screenpos y) -80
attr = S, HP
damage = 30, 6
animtype = Hard
guardflag = MH
hitflag = MAFD
priority = 7, Hit
pausetime = 4, 12
sparkno = 2
guard.sparkno = 40
sparkxy = -10, 0
hitsound = s5, 1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -4
air.velocity = 0, -4
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 4201, End]
type = changestate
trigger1 = time >= 180
value = 4202


;--- Over ---
[Statedef 4202]
type = S
physics = S
movetype = A
anim = 4202
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 4202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<DESS SUTARU DA!>=============================
[Statedef 4300]
type = A
physics = N
movetype = A
anim = 4300
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 4300, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4300, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4300, Vel]
type = velset
trigger1 = time
x = 0
y = -12

[State 4300, End]
type = changestate
trigger1 = time >= 8 && screenpos y <= -60
value = 4301


;--- Falling ---
[Statedef 4301]
type = A
physics = N
movetype = A
anim = 4301
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4301, Pos]
type = posadd
trigger1 = !time
x = ceil(p2dist x -8)

[State 4301, Pos]
type = posset
trigger1 = !time
y = ceil(pos y -screenpos y) -240

[State 4301, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 0, 240
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 4301, superchargepause]
type = superpause
trigger1 = !time
time = 53
anim = -1
sound = s7, 0
poweradd = -2000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 4301, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4301, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4301, moon]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 4305
ID = 4305
name = "Moon"
postype = p1
size.xscale = 1
size.yscale = 1
ownpal = 1
pausemovetime = var(20)

[State 4301, Vel]
type = velset
trigger1 = time
x = 0
y = 16

[State 4301, Snd]
type = playsnd
trigger1 = time = 1
value = 5, 11
channel = 1

[State 4301, Hit]
type = hitdef
trigger1 = time && !movecontact
ID = 4300
attr = A, HA
damage = 150, 20
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 12
sparkno = 3
guard.sparkno = 40
sparkxy = -10, ceil(p2dist y -48)
hitsound = s2, 10
guardsound = s2, 0
ground.type = High
ground.slidetime = 120
ground.hittime = 120
down.hittime = 120
guard.hittime = 20
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
p1sprpriority = 3
kill = 0
kill = var(20) <= 0

[State 4301, p2state]
type = targetstate
trigger1 = movehit && numtarget(4300)
trigger1 = !(target(4300), hitshakeover)
value = 4330
ID = 4300
ignorehitpause = 1

[State 4301, land]
type = changestate
trigger1 = time && (pos y + 230) > -vel y
value = ifelse(movehit, 4310, 4302)


;--- End ---
[Statedef 4302]
type = A
physics = A
movetype = I
anim = 4300
ctrl = 0
velset = -2, -12
movehitpersist = 1
sprpriority = 3

[State 4302, Ctrl]
type = posset
trigger1 = !time
y = -230

[State 4302, mc]
type = screenbound
trigger1 = prevstateno = 4311
value = 1
movecamera = 1, 0

[State 4302, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 4301
value = 5, 10
channel = 1

[State 4302, Ctrl]
type = ctrlset
trigger1 = time >= 8
value = 1


;--- Combo ---
[Statedef 4310]
type = A
physics = N
movetype = A
anim = 4310
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4310, NHB]
type = nothitby
trigger1 = time < 94
time = 1
value = SCA
ignorehitpause = 1

[State 4310, mc]
type = width
trigger1 = time < 24
edge = 320, 320
ignorehitpause = 1

[State 4310, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, (time >= 24)
ignorehitpause = 1

[State 4310]
type = assertspecial
trigger1 = 1
flag = nomusic
ignorehitpause = 1

[State 4310]
type = assertspecial
trigger1 = time >= 24
flag = nobardisplay
ignorehitpause = 1

[State 4310, Pos]
type = posset
trigger1 = 1
y = -230

[State 4310, Snd]
type = playsnd
trigger1 = time = 24
value = 9, 21
channel = 9

[State 4310, Snd]
type = playsnd
trigger1 = time = 24
trigger1 = numhelper(4305)
trigger1 = helper(4305), var(1)
value = 9, 12
channel = 9

[State 4310, Snd]
type = playsnd
trigger1 = !time
value = 5, 10
channel = 1

[State 4310, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 11
channel = 0

[State 4310, Snd]
type = playsnd
trigger1 = animelem = 16
value = 1, 6
channel = 1

[State 4310, Shake]
type = envshake
trigger1 = !time
time = 16
freq = 60
ampl = 6
ignorehitpause = 1

[State 4310, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 17
ID = 4300
attr = A, HA
damage = 20, 5
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 12
sparkno = 3
guard.sparkno = 40
sparkxy = 0, 0
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
down.hittime = 20
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
p1sprpriority = 3
kill = 0

[State 4310, p2state]
type = targetstate
trigger1 = movehit && numtarget(4300)
trigger1 = !(target(4300), hitshakeover)
value = 4330
ID = 4300
ignorehitpause = 1

[State 4310, p2state]
type = targetstate
trigger1 = animelemtime(5) < 0 && numtarget(4300)
trigger1 = target(4300), stateno = 4331
value = 4331
ID = 4300
ignorehitpause = 1

[State 4301, p2state]
type = targetbind
trigger1 = numtarget(4300)
ID = 4300
pos = 0, -ceil(pos y)
ignorehitpause = 1

[State 4310, End]
type = changestate
trigger1 = time >= 180 && !animtime
trigger2 = animelemtime(15) >= 0 && (roundstate != 2 || movecontact >= 64)
value = 4311


;--- Finish ---
[Statedef 4311]
type = A
physics = N
movetype = A
anim = 4311
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4311, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA
ignorehitpause = 1

[State 4311, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, (animelemtime(4) < 4)
ignorehitpause = 1

[State 4311]
type = assertspecial
trigger1 = animelemtime(4) < 4
flag = nomusic
flag2 = nobardisplay
ignorehitpause = 1

[State 4311, Pos]
type = posset
trigger1 = 1
y = -230
ignorehitpause = 1

[State 4311, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 4311, Hit]
type = hitdef
trigger1 = animelem = 4
ID = 4300
attr = A, HA
damage = 40, 7
guardflag = HA
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 24
sparkno = 3
guard.sparkno = 40
sparkxy = -30, 0
hitsound = s5, 7
guardsound = s2, 0
animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.slidetime = 20
ground.hittime = 20
down.hittime = 20
ground.velocity = -12, -12
air.velocity = -12, -12
down.velocity = -12, -12
air.velocity = 0, 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
p1sprpriority = 3
kill = var(20) <= 0

[State 4311, p2state]
type = targetstate
trigger1 = movehit && numtarget(4300)
trigger1 = (target(4300), life <= 1)
value = 4330
ID = 4300
ignorehitpause = 1

[State 4311, End]
type = changestate
trigger1 = animelemtime(5) >= 0 && winko
value = 4312

[State 4311, End]
type = changestate
trigger1 = !animtime
value = 4302


;--- Win ---
[Statedef 4312]
type = S
physics = N
movetype = I
sprpriority = 3

[State 4312, Anim]
type = changeanim
trigger1 = anim != 4312
value = 4312

[State 4312, mc]
type = width
trigger1 = 1
edge = 160, 160

[State 4312, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, (animelemtime(4) > -4)
ignorehitpause = 1

[State 4312, Snd]
type = playsnd
trigger1 = anim = 4312 && animelem = 6
value = 5, 30
channel = 0

[State 4312, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;----- TARGET -----
[Statedef 4330]
type = C
physics = C
movetype = H
ctrl = 0
velset = 0, 0

[State 4330, Pos]
type = posset
trigger1 = 1
y = 0

[State 4330, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 4330, End]
type = changestate
trigger1 = hitshakeover
value = 4331

[Statedef 4331]
type = C
physics = C
movetype = H
ctrl = 0
velset = 0, 0

[State 4331, Pos]
type = posset
trigger1 = 1
y = 0

[State 4331, End]
type = selfstate
trigger1 = !alive
value = 5150

[State 4331, End]
type = selfstate
trigger1 = time >= 60
value = 5120


;========================<SUICIDE>=============================
[Statedef 4900]
type = A
physics = N
movetype = I
anim = 4900
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 4900, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 4900, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4900]
type = assertspecial
trigger1 = 1
flag = nomusic

[State 4900, Snd]
type = playsnd
trigger1 = !time
value = 5, 34

[State 4900, Vel]
type = velset
trigger1 = 1
x = 0
y = -2

[State 4900, End]
type = changestate
trigger1 = time >= 8 && pos y <= -180
value = 4901


;--- Ready ---
[Statedef 4901]
type = A
physics = N
movetype = A
anim = 4901
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 4901, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4901, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 4901]
type = assertspecial
trigger1 = 1
flag = nomusic

[State 4901, Snd]
type = playsnd
trigger1 = !time
value = 9, 16
channel = 9

[State 4901, Vel]
type = velset
trigger1 = 1
y = -1 * sin(time / 30.0 * pi)

[State 4901, Snd]
type = playsnd
trigger1 = time = 60
value = 3, 2
channel = 0

[State 4901, Snd]
type = playsnd
trigger1 = time >= 60
value = 5, 12
channel = 1
lowpriority = 1

[State 4901, Snd]
type = playsnd
trigger1 = !time
value = 7, 0

[State 4901, Flash]
type = allpalfx
trigger1 = !time
time = 30
add = 255, 255, 255
sinadd = -255, -255, -255, 60

[State 4902, Palfx]
type = palfx
trigger1 = time >= 60
time = 2
add = ceil(2.83 * (time -60)), ceil(2.83 * (time -60)), ceil(2.83 * (time -60))

[State 4902, Palfx]
type = palfx
trigger1 = time >= 150
time = 2
add = 255, 255, 255

[State 4901, Snd]
type = playsnd
trigger1 = time = 180
value = 4, 10
channel = 0

[State 4901, superchargehelper]
type = helper
trigger1 = time = 180
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 0, -68
ownpal = 1
persistent = 0
pausemovetime = 255
supermovetime = 255

[State 4901, superchargepause]
type = superpause
trigger1 = time = 180
time = 60
anim = -1
sound = s5, 36
poweradd = -3000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 4901, End]
type = changestate
trigger1 = time > 180
value = 4902


;--- Blow up ---
[Statedef 4902]
type = A
physics = N
movetype = A
anim = 4902
ctrl = 0
facep2 = 1
velset = 0, 0
sprpriority = -1

[State 4902, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4902, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4902]
type = assertspecial
trigger1 = 1
flag = nomusic
flag2 = nobardisplay

[State 4902, Snd]
type = playsnd
trigger1 = !time
value = 5, 35

[State 4902, FX]
type = helper
trigger1 = !numhelper(4907)
helpertype = normal
stateno = 4907
ID = 4907
name = "Suicide"
postype = p1
ownpal = 1

[State 4902, bgpalfx]
type = bgpalfx
trigger1 = time < 128
time = 1
color = 0
mul = 192, 72, 0

[State 4902, bgpalfx]
type = bgpalfx
trigger1 = time >= 128
time = 1
color = 0
add = 255, 255, 255

[State 4902, Shake]
type = envshake
trigger1 = !(time % 4)
time = 4
ampl = 8
freq = 60

[State 4902, reversal]
type = reversaldef
trigger1 = 1
reversal.attr = SCA, AA, AP, AT
affectteam = B
p1stateno = 4903
p2stateno = 6997
pausetime = 0, 0
hitsound = 2, 7
sparkno = 2
sparkxy = 0, 0
numhits = random
p1sprpriority = -1

[State 4900, Hit]
type = hitdef
trigger1 = !movecontact && !(time % 4)
affectteam = B
ID = 4900
attr = A, HT
damage = 25, 25
animtype = Hard
fall.animtype = Hard
guardflag =
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 0
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -9, -9
air.velocity = -9, -9
getpower = 0, 0
numhits = 1 + (random % 3)
fall = 1
fall.recover = 0
pausemovetime = -1
supermovetime = -1
p2stateno = 4930
kill = 0

[State 4902, Hit]
type = projectile
trigger1 = movecontact && !(time % 2)
affectteam = B
ID = 4900
projID = 4900
projanim = 4906
velocity = 0, 0
projsprpriority = 4
projedgebound = 65535
projheightbound = -65535, 65535
projremovetime = 2
postype = p1
offset = 0, 0
ownpal = 1
attr = A, HP
damage = 25, 25
animtype = Hard
fall.animtype = Hard
guardflag =
hitflag = MAFD
priority = 7, Hit
pausetime = 0, 0
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -9, -9
air.velocity = -9, -9
getpower = 0, 0
numhits = 1 + (random % 3)
fall = 1
fall.recover = 0
pausemovetime = -1
supermovetime = -1
kill = 0

[State 4902, hitsnd]
type = playsnd
trigger1 = numprojID(4900)
trigger1 = projhit4900 = 1
value = 2, 7
channel = 2

[State 4902, sparks]
type = explod
trigger1 = numprojID(4900)
trigger1 = projhit4900 = 1
trigger1 = numtarget
anim = f2
ontop = 1
postype = left
pos = ceil(target, pos x + 160), ceil(target, screenpos y + target, const(size.mid.pos.y))
ownpal = 1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1

[State 4902, die]
type = powerset
trigger1 = 1
value = 0

[State 4902, End]
type = changestate
trigger1 = time >= 180
value = 4903


;--- End ---
[Statedef 4903]
type = A
physics = N
movetype = H
anim = 4903
ctrl = 0
velset = 0, 0
sprpriority = 3
movehitpersist = 1

[State 4903, die]
type = varset
trigger1 = 1
map = "life"
value = 0

[State 4903, die]
type = varset
trigger1 = 1
var(38) = 1

[State 4903, die]
type = powerset
trigger1 = 1
value = 0

[State 4903, Hurt]
type = targetlifeadd
trigger1 = 1
value = -65535
absolute = 1
kill = 1

[State 4903, die]
type = lifeset
trigger1 = 1
value = 0

[State 4903, Vel]
type = veladd
trigger1 = time >= 120
y = 0.1

[State 4903, bgpalfx]
type = allpalfx
trigger1 = !time
time = 60
add = 255, 255, 255
sinadd = -255, -255, -255, 240

[State 4903, Palfx]
type = palfx
trigger1 = 1
time = 2
color = 0

[State 4903, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


;--- Target ---
[Statedef 4930]
type = A
movetype = H
physics = N
velset = 0, 0

[State 4930, 1]
type = selfstate
trigger1 = 1
value = 5020


;========================<DISCO TRIP SATSU>=============================
[Statedef 4000]
type = A
physics = N
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
juggle = 0
facep2 = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 4000, superchargehelper]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 14, -104
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 4000, superchargepause]
type = superpause
trigger1 = !time
time = 60
anim = -1
sound = s7, 0
poweradd = -3000 * (var(20) <= 0)
p2defmul = 1
darken = 0

[State 4000, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4000]
type = helper
trigger1 = time = 1
trigger1 = (var(31) := anim || var(32) := animelemno(0)) ** 0
helpertype = normal
stateno = 1511
name = "Afterimage"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 4000, Vel]
type = velset
trigger1 = 1
x = 9
y = ifelse(p2dist y < 0, -9, ifelse(p2dist y > 0, 9, 0))

[State 4000, Vel]
type = posadd
trigger1 = time = 1
x = ceil(p2dist x + 24)
y = ceil(p2dist y)

[State 4000, Vel]
type = turn
trigger1 = p2dist x < 0

[State snd]
type = playsnd
trigger1 = time = 1
value = 5, 16

[State 4000, Snd]
type = playsnd
trigger1 = animelemtime(1) > 1
value = 5, 6
persistent = 0

[State 4000, reversal]
type = reversaldef
trigger1 = time
reversal.attr = SCA, AA, AT
p1stateno = 4001
p2stateno = 4002
pausetime = 0, 0
hitsound = -1
sparkno = -1
hitonce = 0
numhits = 0

[State 4000, Hit]
type = hitdef
trigger1 = time
trigger1 = time % 2
attr = A, HT
hitflag = MAFD
priority = 1, Miss
hitonce = 0
numhits = 0
sparkno = -1
p1facing = 1
p1stateno = 4001
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 4000, End]
type = changestate
trigger1 = !animtime
value = ifelse(pos y, 51, 0)
ctrl = 1


;--- PLAYER ---
[Statedef 4001]
type = A
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4001, Throw]
type = targetstate
trigger1 = 1
value = 4002

[State 4001, Throw]
type = changestate
trigger1 = !numtarget
value = 51
ctrl = 1

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800

[State 4001, Snd]
type = playsnd
trigger1 = animelem = 2
value = 9, (random % 4)
channel = 9

[State 4001]
type = assertspecial
trigger1 = animelemtime(2) >= 0
flag = timerfreeze
flag2 = nomusic

[State 4001, Loop]
type = changeanim
trigger1 = time < 510
trigger1 = animelemtime(33) >= 0 && animelemtime(34) < 0
value = 4001
elem = 2 + (random % 30)

[State 4001, Loop end]
type = changeanim
triggerall = animelemtime(34) < 0
trigger1 = time >= 510
trigger2 = time >= 170
trigger2 = numtarget
trigger2 = target, ishelper
value = 4001
elem = 34

[State 4001, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120

[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0
time = 4
value = 0, 0, 0

[State 4001, assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0
flag = nobardisplay

[State 4001, bind]
type = targetbind
trigger1 = 1
pos = 45, 0

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
value = 10 + (random % 10)

[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
value = -9999
kill = 0
absolute = 1

[State 4001, hitsnd]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
value = 2, 3
channel = 2
freqmul = 0.75 + (random / 2000.0)
volumescale = ifelse(hitcount >= 200, 60, ifelse(hitcount >= 100, 80, 100))

[State 4001, sparks]
type = explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
anim = f(random % 4)
ontop = 1
postype = left
pos = 160, 120
random = 240, 160
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4001, sparks]
type = explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
anim = f(random % 4)
ontop = 1
postype = p1
pos = 0, -64
random = 80, 80
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
trigger5 = animelemtime(2) > 0
trigger5 = command = "x" || command = "y" || command = "y" || command = "a" || command = "b" || command = "c" || command = "start"
trigger6 = animelemtime(2) > 0
trigger6 = command = "$F" || command = "$B" || command = "$U" || command = "$D"
time = 2
freq = 90
ampl = -3

[State 4001, Vel]
type = velset
trigger1 = animelemtime(2) > 0
trigger1 = !(gametime % 20) && random < 500
x = -20 + (random / 25.0)
y = -20 + (random / 25.0)

[State 4001, Vel]
type = velmul
trigger1 = vel x > 0 && frontedgebodydist <= 0
trigger2 = vel x < 0 && backedgebodydist <= 0
x = -1

[State 4001, Vel]
type = velmul
trigger1 = vel y > 0 && (pos y > -vel y)
trigger2 = vel y < 0 && screenpos y <= 0
y = -1

[State 4001, Vel]
type = posset
trigger1 = animelemtime(2) >= 0 && pos y > 0
y = 0

[State 4001, Vel]
type = velset
trigger1 = numenemy
trigger1 = enemy, name = "Duck Hunt" && enemy, authorname = "Phantom.of.the.Server"
x = 0

[State 4001, interrupt]
type = changestate
trigger1 = hitcount >= 100
trigger1 = animelemtime(2) > 0 && numtarget = 1
trigger1 = target, name = "Rare Akuma" && target, authorname = "Phantom.of.the.Server" && !(target, ishelper)
value = 4090

[State 4001, End]
type = changestate
trigger1 = !animtime && numtarget
trigger1 = target, ishelper
value = 4005

[State 4001, End]
type = changestate
trigger1 = !animtime
trigger1 = command = "holdfwd" || command = "holdback"
value = 4020

[State 4001, End]
type = changestate
trigger1 = !animtime
trigger1 = command = "holdup"
value = 4030

[State 4001, End]
type = changestate
trigger1 = !animtime
trigger1 = command = "holddown"
value = 4010

[State 4001, End]
type = changestate
trigger1 = !animtime
value = ifelse(random < 333, 4010, ifelse(random < 500, 4020, 4030))


;--- TARGET ---
[Statedef 4002]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[State 4002, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4002, End]
type = selfstate
trigger1 = time >= 60
value = 5030


;====================<WRONG TARGET>====================
;--- PLAYER ---
[Statedef 4005]
type = S
movetype = A
physics = S
anim = 4005
ctrl = 0
velset = 0, 0

[State 4005, Pos]
type = posset
trigger1 = !time
x = 0
y = 0

[State 4005, Throw]
type = targetstate
trigger1 = !time
value = 4006

[State 4005, Width]
type = width
trigger1 = animelemtime(3) > 0 && animtime
edge = 0, 30

[State 4005, throwsnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 3
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 4005, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 15, -76

[State 4005, bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -11, -105

[State 4005, bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -40, -400

[State 4005, bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -70, -45

[State 4005, Hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -2147483648
kill = 1
absolute = 1

[State 4005, Throw]
type = targetstate
trigger1 = animelem = 4
value = 4007

[State 4005, Pos]
type = posadd
trigger1 = !animtime
x = 3

[State 4005, turn]
type = turn
trigger1 = !animtime

[State 4005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 4006]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 4006, Anim]
type = changeanim2
trigger1 = !time
value = 4006

[State 4006, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[Statedef 4007]
type = A
physics = N
movetype = H
velset = 6, -6

[State 4007, Camera]
type = screenbound
trigger1 = ishelper
value = 0
movecamera = 0, 0

[State 4007, End]
type = changestate
triggerall = ishelper
trigger1 = (pos x != [-320, 320]) || (screenpos y != [-120, 360])
trigger2 = time >= 120
value = 4008

[State 4007, Accel]
type = veladd
trigger1 = !ishelper
y = 0.6

[State 4007, End]
type = selfstate
trigger1 = !ishelper
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


[Statedef 4008]
type = A
physics = N
movetype = I
velset = 0, 0

[State 4008, End]
type = removeexplod
trigger1 = 1

[State 4008, End]
type = destroyself
trigger1 = ishelper

[State 4008, End]
type = selfstate
trigger1 = !ishelper
value = 5050


;====================<FOOTPRINTS>====================
;--- PLAYER ---
[Statedef 4010]
type = A
physics = N
movetype = A
anim = 4010
velset = 0, 0
ctrl = 0

[State 4010, Snd]
type = posset
trigger1 = !time
x = 0
y = 0

[State 4010, bind]
type = targetbind
trigger1 = !time
pos = 0, 0

[State 4010, Throw]
type = targetstate
trigger1 = !time
value = 4013

[State 4010, Throw]
type = targetstate
trigger1 = animelem = 3
value = 4014

[State 4010, damage]
type = targetlifeadd
trigger1 = animelem = 3
value = -2147483648
kill = 1
absolute = 1

[State 4010, Snd]
type = angleset
trigger1 = 1
value = 0

[State 4010]
type = angledraw
trigger1 = time < 20
scale = 1 + (0.15 * time), 1 + (0.15 * time)

[State 4010]
type = angledraw
trigger1 = time >= 20
scale = 4, 4

[State 4010]
type = bgpalfx
trigger1 = time < 20
time = 2
mul = ceil(12.8 * time), 0, 0

[State 4010]
type = bgpalfx
trigger1 = time >= 20
time = 2
mul = 256, 0, 0

[State 4010, assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 4010, Snd]
type = playsnd
trigger1 = !time
value = 5, 17

[State 4010, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(random < 500, 8, 9)
channel = 0

[State 4010, Narrator]
type = helper
trigger1 = time = 90
trigger1 = !numhelper(7680)
trigger1 = random < 333 || (!AIlevel && command = "/s")
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = 2; Narrator line

[State 4010, Snd]
type = playsnd
trigger1 = animelem = 3
value = 7, 7

[State 4010, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5

[State 4010, Dust]
type = explod
trigger1 = animelem = 3
anim = 7107
sprpriority = 3
postype = p1
scale = 1, 1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4010, Shake]
type = envshake
trigger1 = animelem = 3
time = 30
freq = 60
ampl = 6

[State 4010, End]
type = changestate
trigger1 = time >= 120
value = 4011


;--- Finish ---
[Statedef 4011]
type = A
physics = A
movetype = A
anim = 4011
velset = 0, 0
ctrl = 0

[State 4011, Snd]
type = posset
trigger1 = !time
x = ifelse(facing = -1, -40, 40)
y = ceil(pos y -screenpos y) -80

[State 4011]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 4011, Throw]
type = targetstate
trigger1 = !time
value = 4015

[State 4011]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0


;--- TARGET ---
[Statedef 4013]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 4013, Anim]
type = changeanim
trigger1 = !time
value = 5110

[State 4014, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA


[Statedef 4014]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 4014, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4014, damage]
type = lifeset
trigger1 = 1
value = 0

[State 4014, Anim]
type = changeanim
trigger1 = !time
value = 5080

[State 4014, End]
type = removeexplod
trigger1 = time >= 300 && ishelper

[State 4014, End]
type = destroyself
trigger1 = time >= 300 && ishelper

[State 4014, End]
type = selfstate
trigger1 = time >= 300
value = 5120


[Statedef 4015]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 4015, End]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 4015, End]
type = selfstate
trigger1 = 1
value = ifelse(alive, 5110, 5150)


;====================<NOOOOOO>====================
;--- PLAYER ---
[Statedef 4020]
type = A
physics = N
movetype = A
anim = 9999
velset = 0, 0
ctrl = 0

[State 4020, Throw]
type = targetstate
trigger1 = time < 120
value = 4002

[State 4020, Throw]
type = targetstate
trigger1 = time = 120
value = 4023

[State 4020, Pos]
type = posset
trigger1 = 1
x = 0
y = 0

[State 4020]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 4020, Snd]
type = playsnd
trigger1 = time = 30
value = 5, 44

[State 4020, Snd]
type = stopsnd
trigger1 = time = 120
channel = 9

[State 4020, Snd]
type = playsnd
trigger1 = time >= 120
value = 9, 18
channel = 9
lowpriority = 1

[State 4020, black]
type = envcolor
trigger1 = time < 120
time = 2
value = 0, 0, 0

[State 4020, space]
type = helper
trigger1 = time = 120
helpertype = normal
stateno = 6125
ID = 6125
name = "Space"
postype = left
ownpal = 1

[State 4020, hitadd]
type = hitadd
trigger1 = time < 8
value = -99999

[State 4020, End]
type = changestate
triggerall = time >= 180
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, stateno != 4023
value = ifelse(win, 4021, 4011)


;--- Win ---
[Statedef 4021]
type = S
physics = N
movetype = I
anim = 9999
sprpriority = 3

[State 4021, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4021]
type = assertspecial
trigger1 = 1
flag = nomusic

[State 4021, Snd]
type = playsnd
trigger1 = 1
value = 9, 18
channel = 9
lowpriority = 1

[State 4021, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;--- Target ---
[Statedef 4023]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4023, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4023, Anim]
type = turn
trigger1 = !time
trigger1 = facing != 1

[State 4023, Pos]
type = posset
trigger1 = time < 180
x = 0
y = ceil(pos y -screenpos y) + 216

[State 4023, walk]
type = posset
trigger1 = (time = [180, 480])
x = floor(-0.267 * (time -180))
y = ceil(pos y -screenpos y) + 216

[State 4023, Anim]
type = changeanim
trigger1 = !time
trigger2 = anim = 5 && !animtime
value = 0

[State 4023, Anim]
type = turn
trigger1 = time = 90 || time = 120

[State 4023, Anim]
type = changeanim
trigger1 = (time = 90 || time = 120) && selfanimexist(5)
value = 5

[State 4023, Anim]
type = changeanim
trigger1 = time = 180
value = 20

[State 4023, Anim]
type = changeanim
trigger1 = time = 480
value = 0

[State 4023, Anim]
type = changeanim
trigger1 = time = 540
value = 170

[State 4023, Anim]
type = changeanim
trigger1 = time = 660 && selfanimexist(5950)
value = 5950

[State 4023, Anim]
type = changeanim2
trigger1 = time = 660 && !selfanimexist(5950)
value = 4150

[State 4023, damage]
type = lifeset
trigger1 = time >= 660
value = 0

[State 4023, Dust]
type = explod
trigger1 = anim = 4150 && animelem = 7
anim = F60
postype = p1
pos = 0, 0
sprpriority = ifelse(sysvar(1) <= 14, -10, 10)
pausemovetime = -1
supermovetime = -1

[State 4023, Snd]
type = playsnd
trigger1 = anim = 4150 && animelem = 7
value = f7, 0

[State 4023]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 4023, Training mode fix]
type = posset
triggerall = roundstate = 2
trigger1 = (anim = 4150 || anim = 5950) && !animtime
trigger2 = time >= 780
y = 0

[State 4023, End]
type = selfstate
trigger1 = (anim = 4150 || anim = 5950) && !animtime
trigger2 = time >= 780
value = ifelse(alive, 5120, 5150)


;====================<SANSHIRO!>====================
;--- PLAYER ---
[Statedef 4030]
type = A
physics = N
movetype = A
anim = 4030
sprpriority = -1
velset = 0, 0
ctrl = 0

[State 4030, Throw]
type = targetstate
trigger1 = !time
value = 4033

[State 4030, Pos]
type = posset
trigger1 = !time
x = 40 * facing
y = 0

[State 4030]
type = assertspecial
trigger1 = 1
flag = nomusic
flag2 = nobardisplay

[State 4030, Snd]
type = playsnd
trigger1 = !time
value = 9, 19
channel = 9

[State 4030]
type = playsnd
trigger1 = time = 8
value = 5, 11

[State 4030]
type = playsnd
trigger1 = numtarget
trigger1 = target, stateno = 4034
value = 5, 1
persistent = 0

[State 4030]
type = explod
trigger1 = numtarget
trigger1 = target, stateno = 4034
anim = 7170
postype = left
pos = ceil(target, pos x) + 160, ceil(target, screenpos y) -40
sprpriority = 3
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
persistent = 0

[State 4030, End]
type = changeanim
trigger1 = numtarget
trigger1 = target, stateno = 4033
value = 4030
elem = 1

[State 4030, win]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target ---
[Statedef 4033]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4033, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4033, Anim]
type = changeanim2
trigger1 = 1
value = 4033

[State 4033, Pos]
type = posset
trigger1 = !time
x = 0
y = -1280

[State 4033, Vel]
type = velset
trigger1 = 1
x = 0
y = 20

[State 4033, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 4034


;--- Target hit ground ---
[Statedef 4034]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4034, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4034, Anim]
type = changeanim2
trigger1 = 1
value = 4034

[State 4034, Pos]
type = posset
trigger1 = 1
y = 0

[State 4034, damage]
type = lifeset
trigger1 = 1
value = 0

[State 4034, Snd]
type = playsnd
trigger1 = !time
value = f7, 2

[State 4034, Finisher Flag]
type = mapset
trigger1 = 1
map = "_pots_rarefinisher"
value = 1

[State 4034, End]
type = changestate
trigger1 = time >= 6
value = 5150


;====================<CLASH>====================
;--- PLAYER ---
[Statedef 4090]
type = S
physics = S
movetype = H
anim = 5910
velset = -10, 0
ctrl = 0

[State 4090, target]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 4091

[State 4090, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 4090, Pos]
type = posset
trigger1 = !time
x = 0
y = 0

[State 4090, Snd]
type = stopsnd
trigger1 = !time
channel = 9

[State 4090, Snd]
type = playsnd
trigger1 = !time
value = 5000, ifelse(random < 500, 4, 5)
channel = 0

[State 4090, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4095
ID = 4095
postype = p1
pos = 0, -60
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 4090, End]
type = changestate
trigger1 = anim = 5911 && !animtime
trigger2 = time >= 54
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 4091]
type = S
physics = S
movetype = H
anim = 0
velset = -10, 0
ctrl = 0

[State 4091, Pos]
type = posset
trigger1 = !time
x = 0
y = 0

[State 4091, End]
type = removeexplod
trigger1 = ishelper

[State 4091, End]
type = destroyself
trigger1 = ishelper

[State 4091, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(150)
value = 150

[State 4091, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140

[State 4091, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = time >= 54
value = 0
ctrl = 1
