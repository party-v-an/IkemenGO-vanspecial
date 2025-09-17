; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=======================<Standing Light Punch>========================
[Statedef 200]
type = S
movetype = A
physics = S
anim = 200
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 25, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 67), map(sparky) := -71
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 200, Anim]
type = changeanim
trigger1 = anim = 200
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 200
elem = 3
ignorehitpause = 1

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
movetype = A
physics = S
anim = 210
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 210, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 75, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -67
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 210, Anim]
type = changeanim
trigger1 = anim = 210
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 210
elem = 4
ignorehitpause = 1

[State 210, Target Combo]
type = changestate
triggerall = time > 0
triggerall = !map(dark)
triggerall = !map(customcombo)
triggerall = prevstateno != 710
triggerall = (movecontact + movereversed) = [1, 2]
trigger1 = !AIlevel
trigger1 = map(cmd_b)
trigger1 = command = "/F"
trigger1 = command != "holddown"
trigger2 = AILevel
trigger2 = p2statetype != A
trigger2 = random < 500
value = 245

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
movetype = A
physics = S
anim = 211
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 211, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 211, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 65, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -66
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 211, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 211
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
movetype = A
physics = S
anim = 220
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 220, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 110, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 94), map(sparky) := -65
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = hitpausetime = [1, 10]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 220
elem = 4
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = hitpausetime = [1, 7]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 220
elem = 5
ignorehitpause = 1

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


;=======================<Standing Close Hard Punch>========================
[Statedef 221]
type = S
movetype = A
physics = S
anim = 221
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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

[State 221, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2
x = ifelse(p2statetype != A && p2bodydist x < (12 * const(size.xscale)), p2bodydist x, (12 * const(size.xscale)))

[State 221, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 221, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 221, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 85), map(sparky) := -58
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)
forcestand = 1

[State 221, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 80, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 70), map(sparky) := -101
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Far Light Kick>========================
[Statedef 230]
type = S
movetype = A
physics = S
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 230, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 230, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 98), map(sparky) := -54
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

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


;=======================<Standing Close Light Kick>========================
[Statedef 231]
type = S
movetype = A
physics = S
anim = 231
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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

[State 231, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 231, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 231, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 98), map(sparky) := -39
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 231, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Medium Kick>========================
[Statedef 240]
type = S
movetype = A
physics = S
anim = 240
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 240, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 75, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := -64
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = prevstateno = 710
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 75, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := -64
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = -5.30, -5.30
air.type = Low
air.velocity = -5.30, -5.30
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Flower Kick>========================
[Statedef 245]
type = S
movetype = A
physics = S
anim = 245
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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

[State 245, Pos]
type = posadd
trigger1 = animelemtime(4) > 0
trigger1 = animelemtime(7) < 0
x = 2

[State 245, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 245, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 245, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = ifelse(map(dark), 45, 80), 0
dizzypoints = ifelse(map(dark), 50, 100) * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = HAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 112), map(sparky) := -84
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 245, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = (!movecontact && !movereversed) || map(dark)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = ifelse(map(dark), 45, 80), 0
dizzypoints = ifelse(map(dark), 50, 100) * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = H
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 118), map(sparky) := -34
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
persistent = 0

[State 245, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Far Hard Kick>========================
[Statedef 250]
type = S
movetype = A
physics = S
anim = 250
velset = 0, 0
poweradd = 0
sprpriority = -1
ctrl = 0
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

[State 250, Sprite Priority]
type = sprpriority
trigger1 = animelem = 6
value = 2

[State 250, Sound]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 250, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 110, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 70) * (map(sparkx.max) := 123), map(sparky) := -72
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 9]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 250
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Close Hard Kick>========================
[Statedef 251]
type = S
movetype = A
physics = S
anim = 251
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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

[State 251, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 251, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 251, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 120, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 68), map(sparky) := -90
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)
forcestand = 1

[State 251, Anim]
type = changeanim
trigger1 = anim = 251
trigger1 = hitpausetime = [1, 9]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 251
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Crouching Light Punch>========================
[Statedef 400]
type = C
movetype = A
physics = C
anim = 400
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 20, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 76), map(sparky) := -36
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 400, Anim]
type = changeanim
trigger1 = anim = 400
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 400
elem = 3
ignorehitpause = 1

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
movetype = A
physics = C
anim = 410
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 410, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 65, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 80), map(sparky) := -56
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 65, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 55) * (map(sparkx.max) := 80), map(sparky) := -5
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 410, Anim]
type = changeanim
trigger1 = anim = 410
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 410
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
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
movetype = A
physics = C
anim = 420
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 420, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -35
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)
forcestand = 1

[State 420, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 80, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -86
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(customcombo), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 420, Anim]
type = changeanim
trigger1 = anim = 420
trigger1 = hitpausetime = [1, 9]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 420
elem = 4
ignorehitpause = 1

[State Idle]
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
movetype = A
physics = C
anim = 430
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 430, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 430, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 20, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 85), map(sparky) := -5
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State Idle]
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
movetype = A
physics = C
anim = 440
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
value = 3, ifelse(random < 500, 2, 6)
channel = 0

[State 440, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 440, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 60, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 76), map(sparky) := -38
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = ifelse(map(customcombo), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = hitpausetime = [1, 7]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 440
elem = 3
ignorehitpause = 1

[State 440, Target Combo]
type = changestate
triggerall = time > 0
triggerall = !map(dark)
triggerall = !map(customcombo)
triggerall = (movecontact + movereversed) = [1, 2]
trigger1 = !AIlevel
trigger1 = map(cmd_b)
trigger1 = command != "holddown"
trigger2 = AILevel && random < 500
value = 240

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
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
movetype = A
physics = C
anim = 450
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
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
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 450, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 450, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 90, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 55) * (map(sparkx.max) := 110), map(sparky) := -10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -1.0, -8.0
air.type = Trip
air.velocity = -1.0, -8.0
down.velocity = -4, -4
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.695
fall = 1
fall.recover = !map(counterhit_buffer)
fall.recovertime = 120

[State Idle]
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
poweradd = 0
sprpriority = 2
ctrl = 0

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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 50, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 55), map(sparky) := -42
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 600, Anim]
type = changeanim
trigger1 = anim = 600
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 600
elem = 3
ignorehitpause = 1

[State 600, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
anim = 610
poweradd = 0
sprpriority = 2
ctrl = 0

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
value = 3, ifelse(random < 500, 2, 6)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 80, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 75), map(sparky) := -85
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 610, Anim]
type = changeanim
trigger1 = anim = 610
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 610
elem = 3
ignorehitpause = 1

[State 610, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
anim = 620
poweradd = 0
sprpriority = 2
ctrl = 0

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
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 620, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 100, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 75), map(sparky) := -64
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 620, Update Spark XY]
type = null
trigger1 = animelem = 4
trigger1 = map(sparkx.min) := 30 || map(sparkx.max) := 55 || map(sparky) := -32

[State 620, Anim]
type = changeanim
trigger1 = anim = 620
trigger1 = hitpausetime = [1, 9]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 620
elem = 5
ignorehitpause = 1

[State 620, Anim]
type = changeanim
trigger1 = anim = 620
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
value = 620
elem = 6
ignorehitpause = 1

[State 620, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
anim = 630
poweradd = 0
sprpriority = 2
ctrl = 0

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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 30, 0
dizzypoints = 50 * !map(customcombo)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -52
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = ifelse(map(customcombo), -2.66, -4.49)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * map(meterscaling), 25 * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 630, Anim]
type = changeanim
trigger1 = anim = 630
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 630
elem = 3
ignorehitpause = 1

[State 630, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
anim = 640
poweradd = 0
sprpriority = 2
ctrl = 0

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
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 6)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 70, 0
dizzypoints = 100 * !map(customcombo)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 85), map(sparky) := -34
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = ifelse(map(customcombo), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 640, Anim]
type = changeanim
trigger1 = anim = 640
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 640
elem = 4
ignorehitpause = 1

[State 640, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
anim = 650
poweradd = 0
sprpriority = 2
ctrl = 0

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
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 650, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 650, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 100, 0
dizzypoints = 200 * !map(customcombo)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -20
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = ifelse(map(customcombo), -2.66, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(map(customcombo), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * map(meterscaling), ifelse(moveguarded, 25, 100) * map(meterscaling)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(customcombo)

[State 650, Anim]
type = changeanim
trigger1 = anim = 650
trigger1 = hitpausetime = [1, 9]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 650
elem = 5
ignorehitpause = 1

[State 650, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

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
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 2
facep2 = 1
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
trigger1 = map(truebodydistx) <= ceil(31 * const(size.xscale))
ID = 800
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 810
p2stateno = 815
guard.dist = 0
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
ground.cornerpush.veloff = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(strength) = 1
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(31 * const(size.xscale))
ID = 800
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 820
p2stateno = 825
guard.dist = 0
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
ground.cornerpush.veloff = 0

[State 800, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 3
channel = 0

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
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<SAILOR SHOT>========================
;----- PLAYER -----
[Statedef 810]
type = A
physics = N
movetype = A
anim = 810
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 815

[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
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

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State 810, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 810, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
edge = ceil(45 * const(size.xscale)), 0

[State 810, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = ceil(75 * const(size.xscale)), 0

[State 810, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), 0

[State 810, Bind 2]
type = bindtotarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), ((target, const(size.head.pos.y) + target, const(size.mid.pos.y)) / 2.0 + 54 * const(size.yscale)) / 2.0; half point of next one

[State 810, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), (target, const(size.head.pos.y) + target, const(size.mid.pos.y)) / 2.0 + 54 * const(size.yscale)

[State 810, Get Power]
type = poweradd
trigger1 = animelem = 5
value = 100 * map(meterscaling); getpower

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 5
value = floor(-120 * map(damagescaling))
dizzy = 0

[State 810, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 5
value = floor(-120 * map(damagescaling)) * !map(customcombo)

[State 810, Give Power]
type = targetpoweradd
trigger1 = animelem = 5
value = 40; givepower

[State 810, Throw]
type = targetstate
trigger1 = animelem = 6
value = 816

[State 810, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State 810, HitSound]
type = playsnd
trigger1 = animelem = 5
value = 2, 6

;[State 810, Spark]
;in ZSS

[State 810, Vel]
type = velset
trigger1 = animelem = 6
x = -4
y = -6

[State 810, Turn]
type = turn
trigger1 = animelem = 9

[State 810, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 810, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.5

[State 810, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 811


;---Land---
[Statedef 811]
type = S
physics = S
movetype = I
anim = 811
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 811, Pos]
type = posset
trigger1 = 1
y = 0

[State 811, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 811, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 811, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 815]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 815, Anim]
type = changeanim2
trigger1 = !time
value = 815

[State 815, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 816]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 816, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5035)
value = 5035

[State 816, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(5035)
trigger2 = !animtime
trigger2 = anim != 5050
value = 5050

[State 816, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 816, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 816, Vel]
type = velset
trigger1 = !time
x = -6.0
y = -3.0

[State 816, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 816, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 816, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;=======================<SAKURA JIME>========================
;----- PLAYER -----
[Statedef 820]
type = A
physics = S
movetype = A
anim = 820
velset = 0, 0
sprpriority = 2
ctrl = 0

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

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State 820, Too Short]
type = changestate
trigger1 = numtarget
trigger1 = target, const(size.head.pos.y) > -70
value = 830

[State 820, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 820, Throw]
type = targetstate
trigger1 = !time
value = 825

[State 820, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 820
value = 821

[State 820, End]
type = changestate
trigger1 = !animtime
trigger1 = hitcount >= 2
value = 822

[State 820, Throw]
type = targetstate
trigger1 = anim = 821
value = ifelse(animelemtime(5) < 0, 826, ifelse(animelemtime(6) < 6, 827, 826))

[State 820, Pos]
type = posset
trigger1 = pos y > 0
trigger1 = anim = 820
trigger1 = animelemtime(5) >= 0
y = 0

[State 820, Pos]
type = posset
triggerall = pos y > 1
trigger1 = anim = 820
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = anim = 821
trigger2 = animelemtime(5) >= 0 && animelemtime(6) < 0
y = 1

[State 820, Pos]
type = posset
trigger1 = pos y > 2
trigger1 = anim = 820
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
y = 2

[State 820, Pos]
type = posset
triggerall = pos y > 7
triggerall = anim = 821
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger2 = animelemtime(3) >= 0 && animelemtime(4) < 0
y = 7

[State 820, Pos]
type = posset
triggerall = pos y > 9
triggerall = anim = 821
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(4) >= 0 && animelemtime(5) < 0
y = 9

[State 820, Sound]
type = playsnd
trigger1 = anim = 821 && animelem = 2
value = 3, 6
channel = 0

[State 820, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = anim = 821
trigger1 = animelem = 2
value = floor(-30 * map(damagescaling))
dizzy = 0
kill = 0

[State 820, HitSound]
type = playsnd
trigger1 = anim = 821 && animelem = 2
value = 2, 8

;[State 820, Spark]
;in ZSS

[State 820, Hit]
type = hitadd
trigger1 = anim = 821 && animelem = 2
value = 1

[State 820, Width]
type = width
trigger1 = anim = 820 && animelemtime(5) >= 0
edge = ceil(20 * const(size.xscale)), 0

[State 820, Bind Others]; 5000, 0 axis at neck
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 0, 10, head

[State 820]; 5000, 10
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
pos = -1.0 * target, const(size.ground.back), 10, head

[State 820]; 5000, 20
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
pos = -1.618 * target, const(size.ground.back), 10, head

[State 820, Bind Sakura]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = floor(-11 * target, const(size.xscale)), -75

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = floor(-24 * target, const(size.xscale)), -75

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Sakura Kasugano" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Pneophen's pissed off Sakura" && target, authorname = "Patrick Ching(Pneophen)"
pos = floor(-38 * target, const(size.xscale)), -76

[State 820, Bind Cammy]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-12 * target, const(size.xscale)), -76

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-26 * target, const(size.xscale)), -79

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Cammy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-36 * target, const(size.xscale)), -75

[State 820, Bind Chun-Li]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Chun-Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli"
trigger4 = target, name = "Chun-Li" && target, authorname = "Jmorphman"
pos = -2, -78

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Chun-Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli"
trigger4 = target, name = "Chun-Li" && target, authorname = "Jmorphman"
pos = -21, -77

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Chun-Li" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "Chun Li" && target, authorname = "Conversion World - J.Lee"
trigger3 = target, name = "cvschunli"
trigger4 = target, name = "Chun-Li" && target, authorname = "Jmorphman"
pos = -36, -71

[State 820, Bind Dan]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-10 * target, const(size.xscale)), floor(-151 * target, const(size.yscale))

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-38 * target, const(size.xscale)), floor(-158 * target, const(size.yscale))

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Dan Hibiki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-59 * target, const(size.xscale)), floor(-158 * target, const(size.yscale))

[State 820, Bind Geese]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese"
pos = -7, -93

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese"
pos = -17, -94

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Geese Howard" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsgeese"
pos = -37, -89

[State 820, Bind Guy]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-3 * target, const(size.xscale)), -81

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-16 * target, const(size.xscale)), -81

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Guy" && target, authorname = "Phantom.of.the.Server"
pos = floor(-24 * target, const(size.xscale)), -82

[State 820, Bind Honda]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvshonda"
pos = floor(-6 * target, const(size.xscale)), floor(-76 * target, const(size.yscale))

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvshonda"
pos = floor(-24 * target, const(size.xscale)), floor(-83 * target, const(size.yscale))

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Edmond Honda" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvshonda"
pos = floor(-42 * target, const(size.xscale)), floor(-82 * target, const(size.yscale))

[State 820, Bind Karin]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-11 * target, const(size.xscale)), -67

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-33 * target, const(size.xscale)), -68

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Karin Kanzuki" && target, authorname = "Phantom.of.the.Server"
pos = floor(-46 * target, const(size.xscale)), -66

[State 820, Bind Lei-Lei]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Lei-Lei" && target, authorname = "Phantom.of.the.Server"
pos = floor(-15 * target, const(size.xscale)), -60

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Lei-Lei" && target, authorname = "Phantom.of.the.Server"
pos = floor(-17 * target, const(size.xscale)), -59

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Lei-Lei" && target, authorname = "Phantom.of.the.Server"
pos = floor(-40 * target, const(size.xscale)), -50

[State 820, Bind Morrigan]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = -1, -76

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = floor(-11 * target, const(size.xscale)), -71

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Morrigan Aensland" && target, authorname = "Phantom.of.the.Server"
pos = floor(-41 * target, const(size.xscale)), -63

[State 820, Bind Nakoruru]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = floor(-5* target, const(size.xscale)), -69

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = floor(-16 * target, const(size.xscale)), -68

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Nakoruru" && target, authorname = "Phantom.of.the.Server"
pos = floor(-26 * target, const(size.xscale)), -64

[State 820, Bind Nash]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = floor(-15 * target, const(size.xscale)), -82

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = floor(-35 * target, const(size.xscale)), -81

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server"
pos = floor(-50 * target, const(size.xscale)), -74

[State 820, Bind Vega]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -6, -87

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -24, -90

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Vega" && target, authorname = "Phantom.of.the.Server"
pos = -34, -92

[State 820, Bind Yuri]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri"
pos = -5, -73

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri"
pos = -19, -76

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Yuri Sakazaki" && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsyuri"
pos = -31, -76

[State 820, Bind CvSShotos]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki"
pos = 0, -85

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki"
pos = -22, -86

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = (target, name = "Ryu" || target, name = "Ken Masters" || target, name = "Shin Gouki") && target, authorname = "Phantom.of.the.Server"
trigger2 = target, name = "cvsryu" || target, name = "cvsken" || target, name = "cvsgouki"
pos = -38, -83

[State 820, Bind KFM]
type = bindtotarget
trigger1 = numtarget
trigger1 = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -10, -82

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -19, -79

[State 820]
type = bindtotarget
trigger1 = numtarget
trigger1 = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Kung Fu Man" && target, authorname = "Elecbyte"
pos = -36, -80

[State 820, Bind SFA Shotos]
type = bindtotarget
triggerall = numtarget
triggerall = anim = 820 && animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Evil Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
trigger5 = target, name = "Evil Dan by Nocturnis" && target, authorname = "Nocturnis"
pos = floor(-6 * target, const(size.xscale)), -74

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 820 && animelemtime(3) >= 0) || (anim = 821 && animelemtime(5) >= 0)
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Evil Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
trigger5 = target, name = "Evil Dan by Nocturnis" && target, authorname = "Nocturnis"
pos = floor(-20 * target, const(size.xscale)), -75

[State 820]
type = bindtotarget
triggerall = numtarget
triggerall = (anim = 821 && animelemtime(5) < 0) || (anim = 821 && animelemtime(6) >= 6)
trigger1 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger2 = target, name = "Evil Ryu" && target, authorname = "Reu and Kingtigre"
trigger3 = target, name = "Evil Ken" && target, authorname = "Reu"
trigger4 = target, name = "Evil Dan" && target, authorname = "ilcane87"
trigger5 = target, name = "Evil Dan by Nocturnis" && target, authorname = "Nocturnis"
pos = floor(-32 * target, const(size.xscale)), -75


;----- FINISH -----
[Statedef 822]
type = A
physics = S
movetype = A
anim = 822
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 822, Camera]
type = screenbound
trigger1 = animelemtime(4) < 0
value = 1
movecamera = 0, 0

[State 822, Throw]
type = targetstate
trigger1 = !time
value = 828

[State 822, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 822, fixpos]
type = posadd
trigger1 = animelem = 4
x = -2
y = 79

[State 822, Damage]
type = targetlifeadd
trigger1 = animelem = 4
value = floor(-ifelse(45 * map(damagescaling) < 45, 7, 45 * map(damagescaling)))
dizzy = 0

[State 822, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-140 * map(damagescaling)) * !map(customcombo)

[State 822, Give Power]
type = targetpoweradd
trigger1 = animelem = 4
value = 40; givepower

[State 822, Get Power]
type = poweradd
trigger1 = animelem = 4
value = 100 * map(meterscaling); getpower

[State 822, Throw]
type = targetstate
trigger1 = animelem = 4
value = 829

[State 822, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0

[State 822, HitSound]
type = playsnd
trigger1 = animelem = 4
value = 2, 3
channel = 2

;[State 822, Spark]
;in ZSS

[State 822, Hit]
type = hitadd
trigger1 = animelem = 4
value = 1

[State 822, Shake]
type = envshake
trigger1 = animelem = 4
time = 10
freq = 180
ampl = 1

[State 822, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 0.5

[State 822, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 823


;---Land---
[Statedef 823]
type = S
physics = S
movetype = I
anim = 823
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 823, Turn]
type = turn
trigger1 = !time

[State 823, Pos]
type = posset
trigger1 = 1
y = 0

[State 823, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 823, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 823, End]
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

[State 825, Width]
type = width
trigger1 = time >= 4
edge = 0, abs(const(size.head.pos.y) / 2)

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

[State 826, Freeze]
type = posfreeze
trigger1 = 1
value = 1

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

[State 827, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 827, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 828]
type = A
physics = N
movetype = H
velset = 0, 0

[State 828, Anim]
type = changeanim2
trigger1 = !time
value = 828

[State 828, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 828, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 829]
type = A
physics = N
movetype = H
velset = 0, 0

[State 829, Pos]
type = posadd
trigger1 = animelem = 2
x = 24

[State 829, Vel]
type = velset
trigger1 = !animtime
x = 3
y = 20; For large hit ground effect

[State 829, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 829, End]
type = selfstate
trigger1 = !animtime
trigger2 = anim != [825, 829]
value = 5100


;=======================<RIVAL SCHOOLS THROW>========================
;----- PLAYER -----
[Statedef 830]
type = S
physics = S
movetype = A
anim = 830
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 830, Throw]
type = targetstate
trigger1 = !time
value = 835

[State 830, Throw]
type = targetfacing
trigger1 = time <= 1
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

[State Tech Hit]
type = mapadd
trigger1 = time
trigger1 = map(techhit_timer) > 0
map = "techhit_timer"
value = -1

[State 830, Width]
type = width
trigger1 = animtime
edge = ceil(50 * const(size.xscale)), 0

[State 830, Width]
type = width
trigger1 = animelemtime(16) < 0
edge = ceil(65 * const(size.xscale)), 0

[State 830, Width]
type = width
trigger1 = animelemtime(16) >= 0 && animelemtime(17) < 0
edge = ceil(65 * const(size.xscale)), 0

[State 830, throw snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 1
channel = 0

[State 830, throw snd]
type = playsnd
trigger1 = animelem = 14
value = 3, 6
channel = 0

[State 830, Bind 1]
type = targetbind
trigger1 = animelemtime(5) < 0
pos = 60 * const(size.xscale), 0

[State 830, Damage]
type = targetlifeadd
trigger1 = animelem = 5 || animelem = 16
value = floor(-60 * map(damagescaling))
dizzy = 0
kill = (animelem = 16)

[State 810, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 16
value = floor(-120 * map(damagescaling)) * !map(customcombo)

[State 830, Throw]
type = targetstate
trigger1 = animelem = 5
value = 836

[State 830, Get Power]
type = poweradd
trigger1 = animelem = 16
value = 100 * map(meterscaling); getpower

[State 830, Give Power]
type = targetpoweradd
trigger1 = animelem = 16
value = 40; givepower

[State 830, Throw]
type = targetstate
trigger1 = animelem = 16
value = 837

[State 830, HitSound]
type = playsnd
trigger1 = animelem = 5 || animelem = 16
value = 2, ifelse((animelem = 5), 3, 6)
channel = 2

;[State 830, Sparks]
;in ZSS

[State 830, Hit]
type = hitadd
trigger1 = animelem = 5 || animelem = 16
value = 1

[State 830, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 835]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 835, Anim]
type = changeanim2
trigger1 = !time
value = 835

[State 835, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0


[Statedef 836]
type = A
physics = N
movetype = H
velset = 0, -10
sprpriority = 0

[State 836, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 836, Anim]
type = changeanim2
trigger1 = !time
value = 836

[State 836, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 836, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


[Statedef 837]
type = A
physics = N
movetype = H
velset = 4, -8
sprpriority = 0

[State 837, Turn]
type = turn
trigger1 = !time

[State 837, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 837, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 826, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5030
value = ifelse(selfanimexist(5035), 5035, 5050)

[State 837, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 837, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = selfanimexist(5061)
trigger1 = vel y > -2
value = 5061

[State 837, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 837, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 837, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;=======================<Air Throw Attempt>========================
[Statedef 850]
type = A
physics = N
movetype = A
ctrl = 0
anim = 850
sprpriority = 2

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

[State 850, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 850, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil((48 * const(size.xscale)) - const(size.air.front))
trigger1 = p2dist y = [-48, 60]
;(top + 28) (bottom + 92)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NT
hitflag = AF
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 860
p2stateno = 861
animtype = Back
air.velocity = -6, 3
guard.dist = 0
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0

[State 850, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5000, 3
channel = 0

[State 850, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 850, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<SAILOR FLY>========================
[Statedef 860]
type = A
physics = N
movetype = A
anim = 810
sprpriority = 2
ctrl = 0

[State Throw]
type = targetstate
trigger1 = !time
value = 861

[State 860, Throw]
type = targetstate
trigger1 = !time
value = 861

[State 860, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, Vel]
type = velmul
trigger1 = animelemtime(6) < 0
x = 0.9

[State 860, Accel]
type = veladd
trigger1 = animelemtime(6) < 0
trigger1 = pos y < -60
y = ifelse(vel y <= 0, 0.5, 0.25)

[State 860, Vel]
type = velset
trigger1 = animelemtime(6) < 0
trigger1 = pos y >= -60 && vel y >= 0
x = 0
y = 0

[State 860, Pos]
type = posset
trigger1 = animelemtime(6) < 0
trigger1 = pos y >= -60
y = -60

[State 860, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), 0

[State 860, Bind 2]
type = bindtotarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), ((target, const(size.head.pos.y) + target, const(size.mid.pos.y)) / 2.0 + 54 * const(size.yscale)) / 2.0; half point of next one

[State 860, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(6) < 0
pos = target, const(size.ground.front) + 16 * const(size.xscale), (target, const(size.head.pos.y) + target, const(size.mid.pos.y)) / 2.0 + 54 * const(size.yscale)

[State 860, Get Power]
type = poweradd
trigger1 = animelem = 5
value = 100 * map(meterscaling); getpower

[State 860, Damage]
type = targetlifeadd
trigger1 = animelem = 5
value = floor(-140 * map(damagescaling))
dizzy = 0

[State 860, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 860, Give Power]
type = targetpoweradd
trigger1 = animelem = 5
value = 40; givepower

[State 860, Throw]
type = targetstate
trigger1 = animelem = 6
value = 862

[State 860, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State 860, HitSound]
type = playsnd
trigger1 = animelem = 5
value = 2, 6

;[State 860, Sparks]
;in ZSS

[State 860, Accel]
type = veladd
trigger1 = animelem = 6
x = -4
y = -6

[State 860, Turn]
type = turn
trigger1 = animelem = 9

[State 860, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 860, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.5

[State 860, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
trigger1 = pos y > 0
value = 811


;----- TARGET -----
[Statedef 861]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 861, Anim]
type = changeanim2
trigger1 = !time
value = 815

[State 861, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 862]
type = A
physics = N
movetype = H

[State 862, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 862, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 862, End]
type = selfstate
trigger1 = 1
value = 5020


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
value = 5000, 0
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
