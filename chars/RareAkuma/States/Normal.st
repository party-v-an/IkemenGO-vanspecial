; _____________________________________
;| Rare Akuma by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<NORMAL STATES>========================================
;==============================================================================================

;====================<Stand Light Punch>====================
[Statedef 200]
type = S
movetype = A
physics = S
juggle = 0
anim = ifelse(p2bodydist x < 25, 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = anim = 200 && animelem = 2
attr = S, NA
damage = 20, 7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -84
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State 200, Hit]
type = hitdef
trigger1 = anim = 201 && animelem = 2
attr = S, NA
damage = 23, 7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -20, -92
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Stand Medium Punch>====================
[Statedef 205]
type = S
movetype = A
physics = S
juggle = 0
anim = ifelse(p2bodydist x < 25, 206, 205)
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 205, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 205, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 205
attr = S, NA
damage = 43, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -81
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 205, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 206
attr = S, NA
damage = 40, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -20, -60
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Zugai Hasatsu>====================
[Statedef 207]
type = S
movetype = A
physics = S
juggle = 0
anim = 207
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 207, Width]
type = width
trigger1 = 1
value = 20, 0

[State 207, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 207, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 207, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, NA
damage = 25, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -85
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 207, Hit 2]
type = hitdef
trigger1 = animelem = 6
attr = S, NA
damage = 25, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -44
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0, 25
air.type = Low
air.hittime = 30
air.velocity = 0, 25
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
fall.xvelocity = 0
fall.yvelocity = -12
yaccel = 0.5
fall = 1
kill = var(20) <= 0

[State 207, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Stand Hard Punch>====================
[Statedef 210]
type = S
movetype = A
physics = S
juggle = 0
anim = ifelse((prevstateno = 710 || p2bodydist x >= 25), 210, 211)
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = animelem = 4 && anim = 210
attr = S, NA
damage = 65, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -68
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.5
kill = var(20) <= 0

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 211
attr = S, NA
damage = 60, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -75
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.5
kill = var(20) <= 0

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Stand Light Kick>====================
[Statedef 215]
type = S
movetype = A
physics = S
juggle = 0
anim = 215
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 215, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 215, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 215, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NA
damage = 20, 7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -35
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State 215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Stand Medium Kick>====================
[Statedef 220]
type = S
movetype = A
physics = S
juggle = 0
anim = ifelse((prevstateno = 710 || p2bodydist x < 25), 221, 220)
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 220
attr = S, NA
damage = 40, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -91
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 221
attr = S, NA
damage = 40, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -20, -74
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<SENPUU KYAKU>====================
[Statedef 222]
type = A
movetype = A
physics = N
juggle = 0
anim = 222
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 222, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 42

[State 222, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 222, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 11
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 222, Vel]
type = velset
trigger1 = animelem = 2
x = 12
y = -9

[State 222, Accel]
type = gravity
trigger1 = animelemtime(2) > 0

[State 222, Hit]
type = hitdef
trigger1 = animelem = 6
attr = A, NA
damage = 50, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -65
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 222, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52
ctrl = 1


;====================<Stand Hard Kick>====================
[Statedef 225]
type = S
movetype = A
physics = S
juggle = 0
anim = ifelse(p2bodydist x < 25, 226, 225)
velset = 0, 0
poweradd = 18
sprpriority = ifelse(p2bodydist x < 25, 1, -1)
ctrl = 0
facep2 = 1

[State 225, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 225, Snd]
type = playsnd
trigger1 = anim = 225 && animelem = 4
trigger2 = anim = 226 && animelem = 5
value = 1, 6
channel = 1

[State 225, Hit]
type = hitdef
trigger1 = animelem = 5 && anim = 225
attr = S, NA
damage = 60, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -87
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
sprpriority = -1
yaccel = 0.5
kill = var(20) <= 0

[State 225, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 226
attr = S, NA
damage = 33, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -97
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.5
kill = var(20) <= 0

[State 225, Hit]
type = hitdef
trigger1 = animelem = 5 && anim = 226
attr = S, NA
damage = 33, 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -69
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 12
ground.velocity = -7
air.type = Trip
air.hittime = 30
air.velocity = 0, -3
air.fall = 1
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.5
kill = var(20) <= 0

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<Crouch Light Punch>====================
[Statedef 230]
type = C
movetype = A
physics = C
juggle = 0
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C, NA
damage = 20, 7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -50
hitsound = s2, 1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State 230, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;====================<Crouch Medium Punch>====================
[Statedef 235]
type = C
movetype = A
physics = C
juggle = 0
anim = 235
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 235, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 235, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 235, Hit]
type = hitdef
trigger1 = animelem = 3
attr = C, NA
damage = 40, 7
animtype = Medium
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -46
hitsound = s2, 2
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 235, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;====================<Crouch Hard Punch>====================
[Statedef 240]
type = C
movetype = A
physics = C
juggle = 0
anim = 240
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 240, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = animelem = 5
attr = C, NA
damage = 60, 7
animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -73
hitsound = s2, 10
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 32
air.hittime = 32
guard.hittime = 20
ground.velocity = 0, -15
air.type = Low
air.velocity = 0, -15
air.cornerpush.veloff = 0
getpower = 0
yaccel = 0.5
fall = 1
fall.recover = 0
kill = var(20) <= 0

[State 240, Toasty]
type = helper
trigger1 = hitpausetime = 11 && random < 250
trigger1 = movehit = 1 && numtarget && !numhelper(6998) && !ishelper && var(20) <= 0
helpertype = normal
stateno = 6998
ID = 6998
name = "Dan"
postype = p1
facing = ifelse(frontedgedist > backedgedist, -1, 1)
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 240, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;====================<Crouch Light Kick>====================
[Statedef 245]
type = C
movetype = A
physics = C
juggle = 0
anim = 245
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 245, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C, NA
damage = 20, 7
animtype = Light
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -4
hitsound = s2, 4
guardsound = s2, 0
ground.type = Low
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State 245, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;====================<Crouch Medium Kick>====================
[Statedef 250]
type = C
movetype = A
physics = C
juggle = 0
anim = 250
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = animelem = 3
attr = C, NA
damage = 40, 7
animtype = Medium
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -6
hitsound = s2, 5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -3
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State 250, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;====================<Crouch Hard Kick>====================
[Statedef 255]
type = C
movetype = A
physics = C
juggle = 0
anim = 255
velset = 0, 0
poweradd = 18
sprpriority = 1
ctrl = 0
facep2 = 1

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 255, Hit]
type = hitdef
trigger1 = animelem = 3
attr = C, NA
damage = 60, 7
animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -6
hitsound = s2, 6
guardsound = s2, 0
ground.type = Trip
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -1.33, -6.85
air.type = Trip
air.velocity = -1.33, -6.85
down.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
fall = 0
fall.recover = 0
yaccel = 0.5
kill = var(20) <= 0

[State 255, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;====================<Air Light Punch>====================
[Statedef 260]
type = A
movetype = A
physics = A
juggle = 0
anim = 260
poweradd = 0
sprpriority = 1
ctrl = 0

[State 260, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 260, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 260, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, NA
damage = 25, 7
animtype = Light
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -58
hitsound = s2, 1
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -2.5
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State combo]
type = velset
trigger1 = movehit = 1 && p2statetype = A
x = 0
y = -3.25
ignorehitpause = 1

[State 260, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I


;====================<Air Medium Punch>====================
[Statedef 265]
type = A
movetype = A
physics = A
juggle = 0
anim = 265
poweradd = 18
sprpriority = 1
ctrl = 0

[State 265, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 265, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 265, Hit]
type = hitdef
trigger1 = animelem = 4
attr = A, NA
damage = 40, 7
animtype = Medium
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -61
hitsound = s2, 2
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -2.5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State combo]
type = velset
trigger1 = movehit = 1 && p2statetype = A
x = 0
y = -4
ignorehitpause = 1

[State 265, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I


;====================<Air Hard Punch>====================
[Statedef 270]
type = A
movetype = A
physics = A
juggle = 0
anim = 270
poweradd = 18
sprpriority = 1
ctrl = 0

[State 270, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 270, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 270, Hit]
type = hitdef
trigger1 = animelem = 4
attr = A, NA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -61
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = -12, 12
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
fall.xvelocity = 6
fall.yvelocity = -12
kill = var(20) <= 0

[State 270, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I


;====================<Air Light Kick>====================
[Statedef 275]
type = A
movetype = A
physics = A
juggle = 0
anim = 275
poweradd = 0
sprpriority = 1
ctrl = 0

[State 275, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 9)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 275, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 275, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 275
attr = A, NA
damage = 25, 7
animtype = Light
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -41
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -2.5
air.cornerpush.veloff = 0
getpower = 72, 36
yaccel = 0.5
kill = var(20) <= 0

[State combo]
type = velset
trigger1 = movehit = 1 && p2statetype = A
x = 0
y = -3.25
ignorehitpause = 1

[State 275, Type]
type = statetypeset
trigger1 = anim = 275 && animelemtime(3) >= 0
movetype = I


;====================<Air Medium Kick>====================
[Statedef 280]
type = A
movetype = A
physics = A
juggle = 0
anim = 280
poweradd = 18
sprpriority = 1
ctrl = 0

[State 280, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 280, Snd]
type = playsnd
trigger1 = anim = 280 && animelem = 3
value = 1, 5
channel = 1

[State 280, Hit]
type = hitdef
trigger1 = anim = 280 && animelem = 3
attr = A, NA
damage = 40, 7
animtype = Medium
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -50
hitsound = s2, 5
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = 0, -2.5
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State combo]
type = velset
trigger1 = movehit = 1 && p2statetype = A
x = 0
y = -4
ignorehitpause = 1

[State 280, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I


;========================<TENMA KUUJIN KYAKU>=============================
[Statedef 282]
type = A
physics = N
movetype = A
anim = 282
velset = 0.3 * vel x, 0.3 * vel y
ctrl = 0
poweradd = 18
sprpriority = -1


[State 282, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 282, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 9
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)


[State 282, Vel]
type = velset
trigger1 = animelemtime(3) > 0
x = 8.4
y = 9.6

[State 282, Hit]
type = hitdef
trigger1 = !(time % 2)
attr = A, NA
damage = 20, 3
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -15
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 16
ground.slidetime = 16
ground.velocity = -1
air.type = Low
air.velocity = -5, 6
down.hittime = 24
down.velocity = 0, 0
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
yaccel = 0.5
kill = var(20) <= 0

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;====================<Air Hard Kick>====================
[Statedef 285]
type = A
movetype = A
physics = A
juggle = 0
anim = 285
poweradd = 18
sprpriority = 1
ctrl = 0

[State 285, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 9, 11)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 285, Snd]
type = playsnd
trigger1 = anim = 285 && animelem = 3
value = 1, 6
channel = 1

[State 285, Hit]
type = hitdef
trigger1 = anim = 285 && animelem = 3
attr = A, NA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 0
guard.sparkno = 40
sparkxy = -10, -50
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.hittime = 20
ground.slidetime = 20
ground.velocity = -1
air.type = Low
air.hittime = 30
air.velocity = -12, 12
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216), 36
yaccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
fall.xvelocity = 6
fall.yvelocity = -12
kill = var(20) <= 0

[State 285, Type]
type = statetypeset
trigger1 = anim = 285 && animelemtime(4) >= 0
trigger2 = anim = 285 && animelemtime(6) >= 0
movetype = I


;===========================================================================
;=================================<THROWS>==================================
;===========================================================================
;====================<THROW CONTROLLER>====================
[Statedef 800]
type = S
movetype = A
physics = S
juggle = 0
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1

[State 800, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "kk", 3, ifelse(command = "z", 2, 1))

[State 800, Strength]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ceil(random / 250)

[State 800, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NT
hitflag = MAFD
priority = 1, Miss
hitonce = 1
sparkno = -1
p1facing = ifelse(command = "holdfwd", -1, 1)
p2facing = 1
p1stateno = ifelse(command = "holdfwd", 803, 801)
p2stateno = ifelse(command = "holdfwd", 804, 802)
guard.dist = 0
fall = 1

[State 800, misssnd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 2
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 800, End]
type = changestate
trigger1 = !Animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
ctrl = 0
sprpriority = 1

[State 801, grab snd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 801, bind 1]
type = targetbind
trigger1 = 1
pos = 45, 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse((var(10) = 1 || var(10) = 2), 805, 810)
ctrl = 0

;--- PLAYER TURNS ---
[Statedef 803]
type = S
movetype = A
physics = S
anim = 803
ctrl = 0
sprpriority = 1

[State 803, grab snd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 803, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -45, 0

[State 803, bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -25, 0

[State 803, bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 0, 0

[State 803, bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 22, 0

[State 803, bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0
pos = 45, 0

[State 803, spr]
type = sprpriority
trigger1 = 1
value = 1 -2 * (animelemtime(2) >= 0 && animelemtime(5) < 0)

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse((var(10) = 1 || var(10) = 2), 805, 810)
ctrl = 0

;--- TARGET ---
[Statedef 802]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802

[Statedef 804]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804


;====================<SEOI NAGE>====================
;--- PLAYER ---
[Statedef 805]
type = S
movetype = A
physics = S
anim = 805
poweradd = 80
ctrl = 0

[State 805, Throw]
type = targetstate
trigger1 = !time
value = 806

[State 805, Width]
type = width
trigger1 = animelemtime(3) > 0 && animtime
edge = 0, 30

[State 805, throwsnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 3
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)


[State 805, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 15, -76

[State 805, bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -11, -105

[State 805, bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -40, -80

[State 805, bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -70, -45

[State 805, Hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -80

[State 805, Throw]
type = targetstate
trigger1 = animelem = 4
value = 807

[State 805, Pos]
type = posadd
trigger1 = !animtime
x = 3

[State 805, turn]
type = turn
trigger1 = !animtime

[State 805, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- TARGET ---
[Statedef 806]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806

[State 806, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 807]
type = A
movetype = H
physics = N
velset = 3, -15
poweradd = 40

[State 807, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 807, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;====================<TOMOE NAGE>====================
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
poweradd = 80
ctrl = 0

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 811

[State 810, Width]
type = width
trigger1 = animelemtime(3) > 0 && animtime
edge = 0, 55

[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 2
value = 3, 11
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)


[State 810, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 18, 0

[State 810, bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 12, -62

[State 810, bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -7, -54

[State 810, bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -74, -57

[State 810, Hurt]
type = targetlifeadd
trigger1 = animelem = 4
value = -85

[State 810, Throw]
type = targetstate
trigger1 = animelem = 4
value = 812

[State 810, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5
x = ifelse((animelem = 1), -17, ifelse((animelem = 2), -15, ifelse((animelem = 3), -5, ifelse((animelem = 4), -14, -3))))

[State 810, Pos]
type = posadd
trigger1 = !animtime
x = 4

[State 810, turn]
type = turn
trigger1 = !animtime

[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- TARGET ---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811

[State 811, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[Statedef 812]
type = A
movetype = H
physics = N
velset = 3, -15
poweradd = 40

[State 812, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 812, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100
