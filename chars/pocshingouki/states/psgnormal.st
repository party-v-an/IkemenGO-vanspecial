; ____________________________________________
;| Pocket Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=======================<Standing Light Punch>========================
[Statedef 200]
type = S
physics = N
movetype = A
juggle = 1
anim = 200
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 200, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 200, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -5.55, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Far Medium Punch>========================
[Statedef 210]
type = S
physics = N
movetype = A
juggle = 1
anim = 210
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 210, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -28
yaccel = 0.941
p1sprpriority = sprpriority

[State 210, Anim]
type = changeanim
trigger1 = anim = 210
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 210
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Close Medium Punch>========================
[Statedef 211]
type = S
physics = N
movetype = A
juggle = 1
anim = 211
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 211, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 211, Hit]
type = hitdef
trigger1 = animelem = 2
attr = S, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -24
yaccel = 0.941
p1sprpriority = sprpriority

[State 211, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2
x = 4 * const(size.xscale)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 211, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Zugai Hasatsu>========================
[Statedef 215]
type = S
physics = N
movetype = A
juggle = 1
anim = 215
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 215, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 215, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 4
channel = 0

[State 215, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 4
x = 6 * const(size.xscale)

[State 215, Hit1]
type = hitdef
trigger1 = animelem = 4
attr = S, NA
damage = 20, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -53
yaccel = 0.941
p1sprpriority = sprpriority

[State 215, Hit 2]
type = hitdef
trigger1 = animelem = 5
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -24
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Hard Punch>========================
[Statedef 220]
type = S
physics = N
movetype = A
juggle = 1
anim = 220
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 220, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NA
damage = 80, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.36, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -8.33, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -27
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Light Kick>========================
[Statedef 230]
type = S
physics = N
movetype = A
juggle = 1
anim = 230
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 230, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 230, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -5.55, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Medium Kick>========================
[Statedef 240]
type = S
physics = N
movetype = A
juggle = 1
anim = 240
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 240, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Hard Kick>========================
[Statedef 250]
type = S
physics = N
movetype = A
juggle = 1
anim = 250
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 250, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 250, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 21
channel = 0

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, NA
damage = 50, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 6, 6
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -1.5, 0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 250, Hit]
type = hitdef
trigger1 = animelem = 7
attr = S, NA
damage = 50, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.36, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -8.33, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<HEADBUTT>========================
[Statedef 290]
type = A
physics = N
movetype = A
juggle = 1
anim = 290
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0

[State 290, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 290, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 290, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 7
channel = 0

[State 290, Vel]
type = velset
trigger1 = animelem = 3
x = 8
y = -4

[State 290, Accel]
type = veladd
trigger1 = animelemtime(3) > 0
y = 0.5

[State 290, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 5 || animelem = 6
attr = A, NA
damage = 30, 0
animtype = Diagup
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = ifelse((animelem = 6), 12, 6), ifelse((animelem = 6), 12, 6)
hitsound = s2, ifelse((animelem = 6), 3, 2)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6.5, -4.5
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -6.5, -4 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = 24
givepower = 40, 40
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
fall = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 290, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 291


;---Land---
[Statedef 291]
type = S
physics = S
movetype = I
anim = 291
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 291, Pos]
type = posset
trigger1 = 1
y = 0

[State 291, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 291, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 291, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Crouching Light Punch>========================
[Statedef 400]
type = C
physics = N
movetype = A
juggle = 1
anim = 400
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 400, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -5.55, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -24
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Medium Punch>========================
[Statedef 410]
type = C
physics = N
movetype = A
juggle = 1
anim = 410
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 410, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 410, Anim]
type = changeanim
trigger1 = anim = 410
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 410
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Hard Punch>========================
[Statedef 420]
type = C
physics = N
movetype = A
juggle = 1
anim = 420
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 420, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 6 * const(size.xscale)

[State 420, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 420, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 1
channel = 0

[State 420, Hit]
type = hitdef
trigger1 = animelem = 4
attr = C, NA
damage = 80, 0
animtype = Up
air.animtype = Up
fall.animtype = Up
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 28
ground.slidetime = 18
ground.velocity = 0, -20.01 + map(juggledecay)
guard.velocity = -8.36
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = 0, -19.34 + map(juggledecay)
down.velocity = 0, -19.34 + map(juggledecay)
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 420, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !movecontact && !movereversed
attr = C, NA
damage = 80, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 28
ground.slidetime = 18
ground.velocity = 0, -19.34 + map(juggledecay)
guard.velocity = -8.36
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = 0, -19.34 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 420, Jump Cancel]
type = changestate
value = 40
triggerall = movecontact
triggerall = roundstate = 2
trigger1 = !AIlevel
trigger1 = command = "holdup"
trigger2 = AIlevel
trigger2 = p2statetype = A
ignorehitpause = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Light Kick>========================
[Statedef 430]
type = C
physics = N
movetype = A
juggle = 1
anim = 430
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 430, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 430, Hit]
type = hitdef
trigger1 = animelem = 3
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = LA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -5.55, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -8
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Medium Kick>========================
[Statedef 440]
type = C
physics = N
movetype = A
juggle = 1
anim = 440
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 440, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 440, Hit]
type = hitdef
trigger1 = animelem = 3
attr = C, NA
damage = 40, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = LA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 14
ground.velocity = -6.13, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = -6.95, -1 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
guard.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -8
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Hard Kick>========================
[Statedef 450]
type = C
physics = N
movetype = A
juggle = 1
anim = 450
velset = ifelse(prevstateno = [10, 12] || prevstateno = [100, 106] || prevstateno = [200, 499], vel x, 0), 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 450, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 450, Hit]
type = hitdef
trigger1 = animelem = 5
attr = C, NA
damage = 80, 0
animtype = Hard
guardflag = LA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -1.0, -8.0
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -1.0, -8.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
fall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -18
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Jumping Light Punch>========================
[Statedef 600]
type = A
physics = N
movetype = A
juggle = 0
anim = 600
poweradd = 0
sprpriority = 2
ctrl = 0

[State 600, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 600, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, NA
damage = 20, 0
animtype = Light
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
guard.velocity = -3.91
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = 0, -6.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
air.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 600, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Medium Punch>========================
[Statedef 610]
type = A
physics = N
movetype = A
juggle = 0
anim = 610
poweradd = 0
sprpriority = 2
ctrl = 0

[State 610, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 610, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, NA
damage = 40, 0
animtype = Medium
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
guard.velocity = -6.13
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = 0, -6.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
air.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 610, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Hard Punch>========================
[Statedef 620]
type = A
physics = N
movetype = A
juggle = 0
anim = 620
poweradd = 0
sprpriority = 2
ctrl = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 620, Hit]
type = hitdef
trigger1 = animelem = 3
ID = 620
attr = A, NA
damage = 60, 0
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -8.34, 9.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
fall = 0
fall.recover = 1
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority
fall.yvelocity = 0

[State 620, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Light Kick>========================
[Statedef 630]
type = A
physics = N
movetype = A
juggle = 0
anim = 630
poweradd = 0
sprpriority = 2
ctrl = 0

[State 630, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 630, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, NA
damage = 20, 0
animtype = Light
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
guard.velocity = -3.91
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 16
airguard.velocity = -6.00, -1.00
air.velocity = 0, -6.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
air.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6001 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 630, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Medium Kick>========================
[Statedef 640]
type = A
physics = N
movetype = A
juggle = 0
anim = 640
poweradd = 0
sprpriority = 2
ctrl = 0

[State 640, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 640, Hit]
type = hitdef
trigger1 = animelem = 2
attr = A, NA
damage = 40, 0
animtype = Medium
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
guard.velocity = -6.13
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 24
airguard.velocity = -6.00, -1.00
air.velocity = 0, -6.0 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
air.cornerpush.veloff = 0
forcenofall = 1
sparkno = s6003 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority

[State 640, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Hard Kick>========================
[Statedef 650]
type = A
physics = N
movetype = A
juggle = 0
anim = 650
poweradd = 0
sprpriority = 2
ctrl = 0

[State 650, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 650, Hit]
type = hitdef
trigger1 = animelem = 2
ID = 650
attr = A, NA
damage = 60, 0
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 28
airguard.velocity = -6.00, -1.00
air.velocity = -7.50, 7.15 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
fall = 0
fall.recover = 1
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -29
yaccel = 0.941
p1sprpriority = sprpriority
fall.yvelocity = 0

[State 650, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Throw Attempt>========================
[Statedef 800]
type = S
movetype = A
physics = S
juggle = 15
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 2
facep2 = 1

[State 800, Strength]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
map = "strength"
value = ifelse(map(cmd_kk), 1, 0)

[State 800, Strength]
type = mapset
trigger1 = !time
trigger1 = AIlevel
map = "strength"
value = ifelse(random < 500, 1, 0)

[State 800, Tech Hit]
type = mapset
trigger1 = 1
map = "techhit_timer"
value = 0

[State 800, Tech Hit]
type = mapset
trigger1 = numenemy
trigger1 = p2statetype = S
trigger1 = p2stateno = [0, 999] && p2stateno != [100, 119] && p2stateno != [200, 799] && p2, anim != 5300
map = "techhit_timer"
value = 7

[State 800, Tech Hit Facing]
type = mapset
trigger1 = !time
map = "techhit_facing"
value = facing

[State 800, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(30 * const(size.xscale))
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && (backedgedist > frontedgedist)), 803, 801)
p2stateno = 802
fall = 1
fall.recover = 1
;fall.recovertime = ?
numhits = 0

[State 800, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 801

[State 800, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 800, End]
type = changestate
trigger1 = !Animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
velset = 0, 0
ctrl = 0
sprpriority = 2

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State Tech Hit]
type = changestate
triggerall = numtarget
triggerall = map(techhit_timer)
triggerall = target, command != "holdup" && target, command != "holddown"
trigger1 = ((target, command = "a") + (target, command = "b") + (target, command = "c") + (target, command = "x") + (target, command = "y") + (target, command = "z")) >= 2
trigger2 = target, command = "holdfwd" || target, command = "holdback"
trigger2 = target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z"
trigger3 = target, AIlevel > 0
trigger3 = random < (100 * (target, AIlevelF / 8.0))
value = 890

[State Throw]
type = targetstate
trigger1 = !time
value = 802

[State Width]
type = width
trigger1 = 1
edge = ceil(40 * const(size.xscale)), 0

[State 801, Bind 1]
type = targetbind
trigger1 = 1
pos = 44 * const(size.xscale), 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse(map(strength) = 1, 815, 805)
ctrl = 0


;----- PLAYER TURNS -----
[Statedef 803]
type = S
physics = S
movetype = A
anim = 803
velset = 0, 0
ctrl = 0
sprpriority = 2

[State 803, Turn]
type = turn
trigger1 = !time
[State 803, P2 Turn]
type = targetfacing
trigger1 = !time
value = -1

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State Tech Hit]
type = changestate
triggerall = numtarget
triggerall = map(techhit_timer)
triggerall = target, command != "holdup" && target, command != "holddown"
trigger1 = ((target, command = "a") + (target, command = "b") + (target, command = "c") + (target, command = "x") + (target, command = "y") + (target, command = "z")) >= 2
trigger2 = target, command = "holdfwd" || target, command = "holdback"
trigger2 = target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z"
trigger3 = target, AIlevel > 0
trigger3 = random < (100 * (target, AIlevelF / 8.0))
value = 890

[State Throw]
type = targetstate
trigger1 = !time
value = 804

[State Width]
type = width
trigger1 = 1
edge = ceil(40 * const(size.xscale)), ceil(40 * const(size.xscale))

[State 803, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -30 * const(size.xscale), 0

[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -7 * const(size.xscale), 0

[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0
pos = 44 * const(size.xscale), 0

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(map(strength) = 1, 815, 805)
ctrl = 0


;----- TARGET -----
[Statedef 802]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 1

[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


[Statedef 804]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 3

[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804

[State 804, Sprite Priority]
type = sprpriority
trigger1 = 1
value = ifelse((time = [3, 5]), 3, 1)

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;=======================<SEOI NAGE>========================
;----- PLAYER -----
[Statedef 805]
type = S
physics = S
movetype = A
velset = 0, 0
anim = 805
poweradd = 80

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State Tech Hit]
type = changestate
triggerall = numtarget
triggerall = map(techhit_timer)
triggerall = target, command != "holdup" && target, command != "holddown"
trigger1 = ((target, command = "a") + (target, command = "b") + (target, command = "c") + (target, command = "x") + (target, command = "y") + (target, command = "z")) >= 2
trigger2 = target, command = "holdfwd" || target, command = "holdback"
trigger2 = target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z"
trigger3 = target, AIlevel > 0
trigger3 = random < (100 * (target, AIlevelF / 8.0))
value = 890

[State 805, Throw]
type = targetstate
trigger1 = !time
value = 806

[State 805, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 805, Width]
type = width
trigger1 = 1
edge = 0, ceil(60 * const(size.xscale))

[State 805, throw snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 1
channel = 0

[State 805, throw snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 805, Bind1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 44 * const(size.xscale), 0

[State 805, Bind2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 20 * const(size.xscale), 0

[State 805, Bind3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 5 * const(size.xscale), -55

[State 805, Bind4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -35* const(size.xscale), -53

[State 805, Damage]
type = targetlifeadd
trigger1 = animelem = 5
value = floor(-100 * map(damagescaling))
dizzy = 1

[State 805, Damage]
type = hitadd
trigger1 = animelem = 5
value = 1

[State 805, Give Power]
type = targetpoweradd
trigger1 = animelem = 5
value = 40; givepower

[State 805, Get Power]
type = poweradd
trigger1 = animelem = 5
value = 100 * map(meterscaling); getpower

[State 805, Throw]
type = targetstate
trigger1 = animelem = 5
value = 807

[State 805, Turn]
type = turn
trigger1 = !animtime

[State 805, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 806]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 2

[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806

[State 806, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 806, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 806, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 807]
type = A
physics = N
movetype = H
velset = 8, -8

[State 807, Accel]
type = veladd
trigger1 = 1
y = 0.941; yaccel

[State 807, Fall Recovery]
type = selfstate
trigger1 = vel y > 0
trigger1 = canrecover
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
value = ifelse(pos y >= const(movement.air.gethit.groundrecover.ground.threshold), 5200, 5210)

[State 807, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 807, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;=======================<TOMOE NAGE>========================
;----- PLAYER -----
[Statedef 815]
type = S
movetype = A
physics = S
anim = 815
velset = 0, 0
sprpriority = 2
poweradd = 80

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State Tech Hit]
type = changestate
triggerall = numtarget
triggerall = map(techhit_timer)
triggerall = target, command != "holdup" && target, command != "holddown"
trigger1 = ((target, command = "a") + (target, command = "b") + (target, command = "c") + (target, command = "x") + (target, command = "y") + (target, command = "z")) >= 2
trigger2 = target, command = "holdfwd" || target, command = "holdback"
trigger2 = target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z"
trigger3 = target, AIlevel > 0
trigger3 = random < (100 * (target, AIlevelF / 8.0))
value = 890

[State 815, Throw]
type = targetstate
trigger1 = !time
value = 816

[State 815, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 815, Width]
type = width
trigger1 = 1
edge = 0, ceil(70 * const(size.xscale))

[State 815, throw snd]
type = playsnd
trigger1 = animelem = 6
value = 3, 13
channel = 0

[State 815, throw snd]
type = playsnd
trigger1 = animelem = 8
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 815, Bind]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 40 * const(size.xscale), 0

[State 815, Bind2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 37 * const(size.xscale), 0

[State 815, Bind3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 35 * const(size.xscale), 0

[State 815, Bind4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 32 * const(size.xscale), 0

[State 815, Bind5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 16 * const(size.xscale), 0

[State 815, Bind6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 17 * const(size.xscale), -40

[State 815, Bind7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = -19 * const(size.xscale), -39

[State 815, Bind8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = -50 * const(size.xscale), -41

[State 815, Bind9]
type = targetbind
trigger1 = animelem = 9
pos = -86 * const(size.xscale), -55

[State 815, Damage]
type = targetlifeadd
trigger1 = animelem = 9
value = floor(-100 * map(damagescaling))
dizzy = 1

[State 815, Damage]
type = hitadd
trigger1 = animelem = 9
value = 1

[State 815, Give Power]
type = targetpoweradd
trigger1 = animelem = 9
value = 40; givepower

[State 815, Get Power]
type = poweradd
trigger1 = animelem = 9
value = 100 * map(meterscaling); getpower

[State 815, Throw]
type = targetstate
trigger1 = animelem = 9
value = 817

[State 815, Pos]
type = posadd
trigger1 = !animtime
x = -52 * const(size.xscale)

[State 815, Turn]
type = turn
trigger1 = !animtime

[State 815, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 816]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 1

[State 816, Anim]
type = changeanim2
trigger1 = !time
value = 816

[State 816, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 816, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 816, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 817]
type = A
physics = N
movetype = H
velset = 9, -12
poweradd = 0
sprpriority = 1

[State 817, Accel]
type = veladd
trigger1 = 1
y = 0.941; yaccel

[State 817, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 817, Fall Recovery]
type = selfstate
trigger1 = vel y > 0
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
value = ifelse(pos y >= const(movement.air.gethit.groundrecover.ground.threshold), 5200, 5210)

[State 817, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;=======================<Air Throw Attempt>========================
[Statedef 850]
type = A
physics = N
movetype = A
juggle = 8
ctrl = 0
anim = 850
sprpriority = 2

[State 850, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil((44 * const(size.xscale)) - const(size.air.front))
trigger1 = p2dist y = [-32, 60]
attr = A, NT
hitflag = AF
priority = 1, Miss
sparkno = -1
hitsound = s2, 800
hitsound.channel = 2
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && stagefrontedgedist < stagebackedgedist), -1, 1)
p2facing = 1
p1stateno = 860
p2stateno = 865
fall = 1
fall.recover = 1
;fall.recovertime = ?
numhits = 0

[State 850, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 801

[State 850, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 850, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<KUUCHUU SEOI NAGE>========================
;----- PLAYER -----
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
poweradd = 80

[State Throw]
type = targetstate
trigger1 = !time
value = 865

[State 860, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = ifelse(pos y < -40, 1, 0)

[State 860, Accel]
type = veladd
trigger1 = animelem = 6
x = 1

[State 860, Width]
type = width
trigger1 = animelemtime(5) >= 0
trigger1 = animtime
edge = 0, ceil(60 * const(size.xscale))

[State 860, throw snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 1
channel = 0

[State 860, throw snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 860, Bind 1]
type = targetBind
trigger1 = animelemtime(2) < 0
pos = 44 * const(size.xscale), -45

[State 860, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
pos = 44 * const(size.xscale), -39

[State 860, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
pos = 15 * const(size.xscale), -67

[State 860, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
pos = -10 * const(size.xscale), -72

[State 860, Bind 5]
type = targetbind
trigger1 = animelem = 5
pos = -14 * const(size.xscale), -49

[State 860, Damage]
type = targetlifeadd
trigger1 = animelem = 6
value = floor(-140 * map(damagescaling))
dizzy = 1

[State 860, Damage]
type = hitadd
trigger1 = animelem = 6
value = 1

[State 860, Throw]
type = targetstate
trigger1 = animelem = 6
value = 866

[State 860, Give Power]
type = targetpoweradd
trigger1 = animelem = 6
value = 40; givepower

[State 860, Get Power]
type = poweradd
trigger1 = animelem = 6
value = 100 * map(meterscaling); getpower

[State 860, Turn]
type = turn
trigger1 = !animtime

[State 860, End]
type = changestate
trigger1 = !animtime
value = 51


;----- TARGET -----
[Statedef 865]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 2

[State 865, Anim]
type = changeanim2
trigger1 = !time
value = 865

[State 865, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 865, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(5) >= 0
value = 0

[State 865, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 866]
type = A
physics = N
movetype = H
velset = 8, -8
poweradd = 0

[State 866, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 866, Accel]
type = veladd
trigger1 = 1
y = 0.941; yaccel

[State 866, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 866, Fall Recovery]
type = selfstate
trigger1 = vel y > 0
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
value = ifelse(pos y >= const(movement.air.gethit.groundrecover.ground.threshold), 5200, 5210)

[State 866, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;=======================<Target Escaped>========================
[Statedef 890]
type = S
physics = N
movetype = I
anim = 890
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 890, Tech Hit Facing]
type = turn
trigger1 = !time
trigger1 = facing != map(techhit_facing)

[State 890, Bind]
type = targetbind
trigger1 = !time
trigger1 = numtarget = 1
pos = (const(size.ground.front) + target, const(size.ground.front)), 0

[State 890, Width]
type = width
trigger1 = !time
trigger1 = numtarget = 1
edge = (target, const(size.ground.front) + target, const(size.ground.back)), 0

[State 890, P2 State]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 895

[State 890, Throw]
type = targetfacing
trigger1 = !time
trigger1 = numtarget
value = -1

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0

[State 890, Vel]
type = velset
trigger1 = 1
x = -1.281
y = 0

[State 890, Vel Corner]
type = velset
trigger1 = numenemy
trigger1 = p2, vel x < 0
trigger1 = p2, backedgedist <= 0
x = -2.562
y = 0

[State 890, Sound]
type = playsnd
trigger1 = time = 2
value = 4, 0
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 0, 890

[State 890, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = const(size.ground.front), -32
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 890, End]
type = changestate
trigger1 = time >= 26
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5940), 5940, ifelse(selfanimexist(200), 200, 130))

[State 895, Anim]
type = changeanim
trigger1 = anim = 130
trigger1 = time >= 20
value = 140

[State 895, Anim]
type = changeanim
trigger1 = anim = 200
trigger1 = animtime = -1
value = 200
elem = animelemno(-1)

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 895, Push]
type = playerpush
trigger1 = 1
value = 0

[State 895, Pos]
type = posset
trigger1 = !time
y = 0

[State 895, Vel]
type = velset
trigger1 = 1
x = -1.281
y = 0

[State 895, Vel Corner]
type = velset
trigger1 = numenemy
trigger1 = stateowner, vel x < 0
trigger1 = stateowner, backedgedist <= 0
x = -2.562
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 26
value = 0
ctrl = 1
