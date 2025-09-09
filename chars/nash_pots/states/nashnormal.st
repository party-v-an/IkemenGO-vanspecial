; _______________________________
;| Nash by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=======================<Standing Light Punch>========================
[Statedef 200]
type = S
physics = S
movetype = A
anim = 200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 200, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 200, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 200, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 0
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 200, Idle]
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
physics = S
movetype = A
anim = 210
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 210, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 210, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 100), map(sparky) := -74
hitsound = s2, 1
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 210, Idle]
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
physics = S
movetype = A
anim = 211
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 211, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 211, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 211, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 85), map(sparky) := -70
hitsound = s2, 1
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 210, Target Combo]
type = changestate
triggerall = time > 0
triggerall = !map(customcombo)
triggerall = map(shadow) != 2
triggerall = (movecontact + movereversed) = [1, 2]
trigger1 = !AIlevel
trigger1 = map(cmd_b)
trigger1 = command = "/F" || command = "/B"
trigger1 = command != "holddown"
trigger2 = AILevel && random < 500
value = 245

[State 211, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 211, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Far Hard Punch>========================
[Statedef 220]
type = S
physics = S
movetype = A
anim = 220
ctrl = 0
velset = 0, 0
sprpriority = -1
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 220, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 220, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 90) * (map(sparkx.max) := 145), map(sparky) := -76
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 220, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(5) >= 0
value = 0

[State 220, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Close Hard Punch>========================
[Statedef 221]
type = S
physics = S
movetype = A
anim = 221
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 221, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 221, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 221, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 100, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 80), map(sparky) := -70
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
forcestand = 1

[State 221, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -115
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 221, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Light Kick>========================
[Statedef 230]
type = S
physics = S
movetype = A
anim = 230
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 230, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 230, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 230, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 95), map(sparky) := -22
hitsound = s2, 3
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 230, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Knee Bazooka>========================
[Statedef 235]
type = S
physics = S
movetype = A
anim = 235
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 235, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 235, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 235, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 40

[State 235, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 235, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
x = 10 * const(size.xscale);20

[State 235, Vel]
type = velset
trigger1 = animelem = 3
x = 3;5
y = -7

[State 235, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 235, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.95

[State 235, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 65), map(sparky) := -68
hitsound = s2, 3
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 235, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 235, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 236


;----- LAND -----
[Statedef 236]
type = S
physics = S
ctrl = 0
anim = 236
velset = 0, 0
movehitpersist = 1

[State 236, Pos]
type = posset
trigger1 = 1
y = 0

[State 236, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 236, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 236, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Medium Kick>========================
[Statedef 240]
type = S
physics = S
movetype = A
anim = 240
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 240, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 240, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 110), map(sparky) := -88
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 240, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Jumping Sobat>========================
[Statedef 245]
type = S
physics = S
movetype = A
anim = 245
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 245, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 245, Accel]
type = veladd
trigger1 = animelemtime(5) >= 1
y = 0.7188

[State 245, Vel]
type = velset
trigger1 = animelemtime(5) = 1
x = 4.00
y = -5.45

[State 245, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), 7
channel = 0

[State 245, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 102

[State 245, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 245, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 245, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 112), map(sparky) := -62
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 245, Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
persistent = 0

[State 245, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 246


;----- LAND -----
[Statedef 246]
type = S
physics = S
ctrl = 0
anim = 246
velset = 0, 0
movehitpersist = 1

[State 246, Pos]
type = posset
trigger1 = 1
y = 0

[State 246, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 246, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 246, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Hard Kick>========================
[Statedef 250]
type = S
physics = S
movetype = A
anim = 250
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 250, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 250, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 60), map(sparky) := -58
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
forcestand = 1

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 110), map(sparky) := -86
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = prevstateno = 710
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -5.30, -5.30
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -5.30, -5.30
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 110), map(sparky) := -86
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 10]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 250
elem = 5
ignorehitpause = 1

[State 250, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Step Kick>========================
[Statedef 255]
type = S
physics = N
movetype = A
anim = 255
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 255, Vel]
type = velset
trigger1 = !time
x = 3.25

[State 255, Vel]
type = velset
trigger1 = animelem = 3
x = 0

[State 255, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 255, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 255, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := -56
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 255, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 255, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Crouching Light Punch>========================
[Statedef 400]
type = C
physics = C
movetype = A
anim = 400
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 400, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 400, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -47
hitsound = s2, 0
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 400, Idle]
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
physics = C
movetype = A
anim = 410
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 410, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 410, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 90), map(sparky) := -47
hitsound = s2, 1
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 410, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
physics = C
movetype = A
anim = 420
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 420, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
forcestand = 1

[State 420, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 75), map(sparky) := -128
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 420, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
physics = C
movetype = A
anim = 430
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 430, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 430, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 430, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 20, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 95), map(sparky) := -11
hitsound = s2, 3
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 430, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
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
physics = C
movetype = A
anim = 440
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 440, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 440, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 440, Hit]
type = hitdef
trigger1 = animelemtime(3) = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 50, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 130), map(sparky) := -12
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 440, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Crouching Far Hard Kick>========================
[Statedef 450]
type = C
physics = C
movetype = A
anim = 450
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 450, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 450, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 450, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = C, NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -1.0, -8.0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.695
fall = 1
fall.recover = !map(counterhit_buffer)
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 125), map(sparky) := -18
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 450, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
anim = 600
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 600, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 600
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 600, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 600, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 40, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 75), map(sparky) := -50
hitsound = s2, 0
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 600, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 600, Accel]
type = gravity
trigger1 = 1

[State 600, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Medium Punch>========================
[Statedef 610]
type = A
physics = N
movetype = A
anim = 610
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 610, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 610, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 3 * map(counterhit_buffer)
ground.slidetime = 10
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 75), map(sparky) := -108
hitsound = s2, 1
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 610, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 610, Accel]
type = gravity
trigger1 = 1

[State 610, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Hard Punch>========================
[Statedef 620]
type = A
physics = N
movetype = A
anim = 620
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 620, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 4 * map(counterhit_buffer)
ground.slidetime = 10
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 85), map(sparky) := -64
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 620, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 620, Accel]
type = gravity
trigger1 = 1

[State 620, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Light Kick>========================
[Statedef 630]
type = A
physics = N
movetype = A
anim = 630
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 630, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 630
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 1, 6)
channel = 0

[State 630, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 630, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 40, 0
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 100), map(sparky) := -90
hitsound = s2, 3
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 630, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 630, Accel]
type = gravity
trigger1 = 1

[State 630, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Medium Kick>========================
[Statedef 640]
type = A
physics = N
movetype = A
anim = 640
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 640, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 350
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 0, 5)
channel = 0

[State 640, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 640, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 60, 0
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 3 * map(counterhit_buffer)
ground.slidetime = 10
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 100), map(sparky) := -52
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 640, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 640, Accel]
type = gravity
trigger1 = 1

[State 640, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Jumping Hard Kick>========================
[Statedef 650]
type = A
physics = N
movetype = A
anim = 650
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 650, Sound]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = ifelse(map(shadow), 14, 4), ifelse(random < 500, 2, 4)
channel = 0

[State 650, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 650, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
forcenofall = !map(customcombo)
attr = A, NA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 80, 0
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 4 * map(counterhit_buffer)
ground.slidetime = 10
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
air.velocity = -2.78, -5.33; air reset
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 0
air.fall = 0
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 95), map(sparky) := -36
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 650, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 650, Accel]
type = gravity
trigger1 = 1

[State 650, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Throw Attempt>========================
[Statedef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 800, Strength]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
map = "strength"
value = ifelse(map(cmd_kk), 1, 0)

[State 800, Strength AI]
type = mapset
trigger1 = !time
trigger1 = AIlevel
map = "strength"
value = (stagebackedgedist < stagefrontedgedist)

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
trigger1 = map(strength) = 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
attr = S, NT
hitflag = M
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
p1stateno = 820
p2stateno = 825

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(strength) = 1
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
attr = S, NT
hitflag = M
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
p1facing = -1
p2facing = 1
p1stateno = 810
p2stateno = 811

[State 800, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 14, 4), 8
channel = 0

[State 800, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 800, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Dragon Suplex>========================
[Statedef 810]
type = S
physics = S
movetype = A
anim = 810
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 810, Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State 810, Tech Hit]
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

[State 810, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 811

[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 810, Width]
type = width
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
edge = ceil(90 * const(size.xscale)), 0

[State 810, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = -24 * const(size.xscale), -58 * const(size.yscale)

[State 810, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -42 * const(size.xscale), -81 * const(size.yscale)

[State 810, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -38 * const(size.xscale), -81 * const(size.yscale)

[State 810, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
pos = 34 * const(size.xscale), -100 * const(size.yscale)

[State 810, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 82 * const(size.xscale), 0

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 6
value = floor(-120 * map(damagescaling))
dizzy = 0

[State 810, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 6
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 810, givepower]
type = targetpoweradd
trigger1 = animelem = 6
value = 40; givepower

[State 810, getpower]
type = poweradd
trigger1 = animelem = 6
value = 100 * map(meterscaling); getpower

[State 810, Throw]
type = targetstate
trigger1 = animelem = 7
value = 812

[State 810, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 810, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 810, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 6
value = 7, 9

[State 810, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 6
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 810, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 6
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 82 * const(size.xscale), 0
ownpal = 1

[State 810, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 6
anim = F 62
postype = p1
pos = 82 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 811]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811

[State 811, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 811, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 812]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 812, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 812, Vel]
type = velset
trigger1 = !time
x = -4
y = -7.5

[State 812, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 812, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 812, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 812, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= -10
value = 5100


;=======================<Knee Gatling>========================
[Statedef 820]
type = S
physics = S
movetype = A
anim = 820
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 820, Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State 820, Tech Hit]
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

[State 820, Width]
type = width
trigger1 = 1
edge = ceil(80 * const(size.xscale)), 0

[State 820, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 825

[State 820, Throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 820, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(11) < 0
pos = 65 * const(size.xscale), 0

[State 820, Bind]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 51 * const(size.xscale), -78 * const(size.yscale)

[State 820, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = floor(-45 * map(damagescaling))
kill = (animelem = 11)
dizzy = 0

[State 820, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 11
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 820, givepower]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 11
value = 40; givepower

[State 820, getpower]
type = poweradd
trigger1 = numtarget
trigger1 = animelem = 11
value = 100 * map(meterscaling); getpower

[State 820, Throw]
type = targetstate
trigger1 = animelem = 12
value = 829

[State 820, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
value = ifelse(map(shadow), 14, 4), ifelse((animelem = 10), 1, 2)
channel = 0

[State 820, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
value = 1, ifelse((animelem = 10), 5, 4)
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 820, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1

[State 820, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 2, ifelse((animelem = 11), 5, 4)

;[State 820, Sparks]
;in ZSS

[State 820, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 825]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 825, Anim]
type = changeanim2
trigger1 = !time
value = 825

[State 825, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 825, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 826]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 826, Anim]
type = changeanim2
trigger1 = !time
value = 826

[State 826, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 826, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 827]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 827, Anim]
type = changeanim2
trigger1 = !time
value = 827

[State 827, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 827, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 828]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 828, Anim]
type = changeanim2
trigger1 = !time
value = 828

[State 828, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 828, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 829]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 829, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 829, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 829, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = !animtime
trigger1 = selfanimexist(5035)
value = 5035

[State 829, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim != 5050
value = 5050

[State 829, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 829, Vel]
type = velset
trigger1 = !time
x = -5.0
y = -6.0

[State 829, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 829, Fall Recovery]
type = selfstate
trigger1 = time >= 2
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 829, End]
type = selfstate
trigger1 = time >= 2
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;=======================<Air Throw Attempt>========================
[Statedef 850]
type = A
physics = N
movetype = A
anim = 850
ctrl = 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 850, Strength]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
map = "strength"
value = ifelse(map(cmd_kk), 1, 0)

[State 850, Strength AI]
type = mapset
trigger1 = !time
trigger1 = AIlevel
map = "strength"
value = (stagebackedgedist < stagefrontedgedist)

[State 850, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(strength) = 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil((48 * const(size.xscale)) - const(size.air.front))
trigger1 = p2dist y = [-40, 32]
;(top + 28) (bottom + 92)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -88
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 1; because of juggle
fall.recovertime = 120
numhits = 0
p2facing = 1
p1stateno = 870
p2stateno = 872
p1facing = ifelse((!AIlevel && command = "holdback") || (AIlevel && stagebackedgedist < stagefrontedgedist), -1, 1)

[State 850, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(strength) = 1
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil((48 * const(size.xscale)) - const(size.air.front))
trigger1 = p2dist y = [-52, 20]
;(top + 28) (bottom + 92)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NT
hitflag = AF
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -88
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
p1stateno = 860
p2stateno = 862

[State 850, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 14, 4), 8
channel = 0

[State 850, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 850, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 850, Accel]
type = gravity
trigger1 = 1

[State 850, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<Flying Buster Drop>========================
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
ctrl = 0
velset = ifelse(vel x > 4, 4, ifelse(vel x < -4, -4, vel x)), 0
sprpriority = 2

[State 860, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 862

[State 860, Throw]
type = targetfacing
trigger1 = time <= 1
value = 1

[State 860, Width]
type = width
trigger1 = animelemtime(2) >= 0
edge = 0, 40 * const(size.xscale)

[State 860, Pos]
type = posset
trigger1 = pos y > 0 && animelemtime(2) < 0
y = 0

[State 860, Pos]
type = posfreeze
trigger1 = animelemtime(2) < 0
value = 1

[State 860, Vel]
type = velset
trigger1 = animelem = 2
y = -1

[State 860, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 860, Bind]
type = targetbind
trigger1 = numtarget
pos = 4 * const(size.xscale), -113 * const(size.yscale)

[State 860, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 860, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 861


[Statedef 861]
type = S
physics = N
movetype = A
anim = 861
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 861, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = 0, 40 * const(size.xscale)

[State 861, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 863

[State 861, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 864

[State 861, Pos]
type = posset
trigger1 = !time
y = 0

[State 861, Hit]
type = hitadd
trigger1 = !time
value = 1

[State 861, Sound]
type = playsnd
trigger1 = !time
value = 2, 2
channel = 2

;[State 861, Sparks]
;in ZSS

[State 861, Shake]
type = envshake
trigger1 = !time
time = 10
freq = 180
ampl = 1

[State 861, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 3 * const(size.xscale), -48 * const(size.yscale)

[State 861, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 2
pos = 3 * const(size.xscale), -16 * const(size.yscale)

[State 861, Damage]
type = targetlifeadd
trigger1 = !time
value = floor(-100 * map(damagescaling))
dizzy = 0

[State 810, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 861, givepower]
type = targetpoweradd
trigger1 = !time
value = 40; givepower

[State 861, getpower]
type = poweradd
trigger1 = !time
value = 100 * map(meterscaling); getpower

[State 861, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 861, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 861, End]
type = turn
trigger1 = animelem = 2

[State 861, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 862]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 862, Anim]
type = changeanim2
trigger1 = !time
value = 862

[State 862, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 862, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 863]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 863, Anim]
type = changeanim2
trigger1 = !time
value = 863

[State 863, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 863, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 864]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 864, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5035), 5035, 5030)

[State 864, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [5030, 5035]
value = 5050

[State 864, Vel]
type = velset
trigger1 = !time
x = -3.5
y = -7.5

[State 864, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 864, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 864, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 864, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;=======================<Airjack>========================
[Statedef 870]
type = A
physics = N
movetype = A
anim = 870
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 870, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 872

[State 870, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 870, Pos]
type = posset
trigger1 = pos y > 0 && animelemtime(5) < 0
y = 0

[State 870, Vel]
type = velset
trigger1 = animelem = 5
x = -2.6
y = -5.5

[State 870, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 0.5

[State 870, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) < 0
pos = 45 * const(size.xscale), -102 * const(size.yscale)

[State 870, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 4
pos = 81 * const(size.xscale), -29 * const(size.yscale)

[State 870, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 4
value = 873

[State 870, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 14, 4), 2
channel = 0

[State 870, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 870, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 4
value = 1

[State 870, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 4
value = 2, 5
channel = 2

;[State 870, Sparks]
;in ZSS

[State 870, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 4
time = 10
freq = 180
ampl = 1

[State 870, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-140 * map(damagescaling))
dizzy = 0

[State 870, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 870, givepower]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 4
value = 40; givepower

[State 870, getpower]
type = poweradd
trigger1 = numtarget
trigger1 = animelem = 4
value = 100 * map(meterscaling); getpower

[State 870, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 871


[Statedef 871]
type = S
physics = N
movetype = A
anim = 871
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 871, Pos]
type = posset
trigger1 = !time
y = 0

[State 871, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 871, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 871, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 872]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 872, Anim]
type = changeanim2
trigger1 = !time
value = 872

[State 872, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 872, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 873]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 873, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5035), 5035, 5030)

[State 873, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [5030, 5035]
value = 5050

[State 873, Vel]
type = velset
trigger1 = time = 2
x = -7
y = -5

[State 873, Accel]
type = veladd
trigger1 = time >= 2
y = 0.4850; yaccel

[State 873, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 873, Fall Recovery]
type = selfstate
trigger1 = time >= 2
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 873, End]
type = selfstate
trigger1 = time >= 2
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
trigger1 = animelem = 2
value = 5000, 2
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
pos = const(size.ground.front), -48
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
