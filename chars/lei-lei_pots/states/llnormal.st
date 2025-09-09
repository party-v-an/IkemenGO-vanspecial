; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=======================<Standing Far Light Punch>========================
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

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 9, 10)
channel = 0

[State 200, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 7
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 200, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8020)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -53
hitsound = s2, 7
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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


;=======================<Standing Close Light Punch>========================
[Statedef 201]
type = S
movetype = A
physics = S
anim = 201
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

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 201
value = 3, ifelse(random < 500, 9, 10)
channel = 0

[State 201, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 7
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 201, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8020)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -53
hitsound = s2, 7
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Medium Punch>========================
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 210, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 8
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 76, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8021)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 108), map(sparky) := -66
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 210
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 210
elem = 4
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


;=======================<Standing Medium Punch 2>========================
[Statedef 215]
type = S
movetype = A
physics = S
anim = 215
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

[State Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 215, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 215, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 80, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 160), map(sparky) := -69
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I
persistent = 0

[State 215, End]
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 220, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 6 || animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 30, 0
dizzypoints = 67 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 195), map(sparky) := -27
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 220, Spark X]
type = null
trigger1 = animelem = 3
trigger1 = map(sparkx.max) := 145
trigger2 = animelem = 4
trigger2 = map(sparkx.max) := 195

[State Idle]
type = statetypeset
trigger1 = animelemtime(11) >= 0
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 221, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 221, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 105, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 130), map(sparky) := -30
hitsound = s2, 9
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
guard.slidetime = 18
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 221, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 221
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Hard Punch 2>========================
[Statedef 225]
type = S
movetype = A
physics = S
anim = 225
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

[State 225, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0

[State 225, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 225, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 225, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 100, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 230), map(sparky) := ifelse((animelem = 4), -30, ifelse((animelem = 5), -99, ifelse((animelem = 6), -122, ifelse((animelem = 7), -159, -178))))
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
air.type = Low
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
persistent = 0

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Light Kick>========================
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 9, 10)
channel = 0

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
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 35, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 118), map(sparky) := -61
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = ifelse((prevstateno = 430), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 430), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 430), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 230, Anim]
type = changeanim
trigger1 = anim = 230
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 230
elem = 4
ignorehitpause = 1

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

[State Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 240, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 240, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4
x = 8 * const(size.xscale)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 80, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 88), map(sparky) := -77
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1
forcestand = 1

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
value = 240
elem = 6
ignorehitpause = 1

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
value = 240
elem = 7
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
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
movetype = A
physics = S
anim = 250
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

[State 250, Width]
type = width
trigger1 = animelem = 3
player = ceil(48 * const(size.xscale)), 0
ignorehitpause = 1

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 250, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 95, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 147), map(sparky) := -61
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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


;=======================<Crouchin Light Punch>========================
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

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 9, 10)
channel = 0

[State 400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 7
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 400, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8020)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 110), map(sparky) := -36
hitsound = s2, 7
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 400 || prevstateno = 430), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 410, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 8
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 4
trigger2 = animelem = 5
trigger2 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 75, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8021)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 132), map(sparky) := ifelse((animelem = 4), -20, -78)
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1
forcestand = 1

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
physics = N
movetype = A
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

[State 420, Type]
type = statetypeset
trigger1 = animelemtime(13) >= 0
physics = C

[State 420, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
x = 4

[State 420, Vel]
type = velset
trigger1 = animelem = 13
x = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 11
channel = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 420, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 90, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -22
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -1.0, -8.0
air.type = Low
air.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.695
fall = 1
fall.recover = !map(counterhit_buffer)
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
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

[State Snd]
type = playsnd
trigger1 = animelem = 1 && random < 200
value = 3, ifelse(random < 500, 9, 10)
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
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 82), map(sparky) := -4
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 430), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 430), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 430), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 7, 11)
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
attr = S, NA
damage = 70, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 104), map(sparky) := -12
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 440
elem = 3
ignorehitpause = 1

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

[State 450, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 3
x = 16 * const(size.xscale)

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 450, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 450, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 100, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 55), map(sparky) := -93
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4, -7
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 9, 10)
channel = 0

[State 600, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 600, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 40, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8020)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -55
hitsound = s2, 7
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 610, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 75, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := -25) * (map(sparkx.max) := 88), map(sparky) := -57
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 610, Anim]
type = changeanim
trigger1 = anim = 610
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 610
elem = 4
ignorehitpause = 1

[State 610, Idle]
type = statetypeset
trigger1 = animelemtime(11) >= 0
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 620, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 8 || animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 30, 0
dizzypoints = 67 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 108), map(sparky) := -62
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 620, Idle]
type = statetypeset
trigger1 = animelemtime(15) >= 0
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 9, 10)
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
damage = 40, 0
dizzypoints = 50 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 84), map(sparky) := -75
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 10
guard.slidetime = 12
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50), 25
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 630, Anim]
type = changeanim
trigger1 = anim = 630
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 630
elem = 3
ignorehitpause = 1

[State 630, Idle]
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 7, 11)
channel = 0

[State 640, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 640, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 80, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 86), map(sparky) := -64
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 15
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

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
trigger1 = animelemtime(5) >= 0
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

[State Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 2, 8)
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
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 100, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -27
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 13
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 18
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78, -5.33; air reset
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200), ifelse(moveguarded, 25, 100)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 650, Anim]
type = changeanim
trigger1 = anim = 650
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 650
elem = 4
ignorehitpause = 1

[State 650, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
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
physics = S
movetype = A
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
value = ifelse(map(strength), 12, 7)

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
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 800
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1stateno = 810
p2stateno = 815
guard.dist = 0
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = ifelse(map(strength), 1, 0); because of juggle
fall.recovertime = ifelse(map(strength), 120, 0)
fall.envshake.time = 10
fall.envshake.freq = 180
fall.envshake.ampl = ifelse((gametime % 2), -2, 2)
numhits = 0

[State 800, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 0
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


;=======================<THROW>=======================
;----- PLAYER -----
[Statedef 810]
type = S
physics = S
movetype = A
anim = 810
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 815

[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
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

[State 810, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 2
channel = 0

[State 810, Sound]
type = playsnd
trigger1 = animelem = 3
trigger2 = !map(strength)
trigger2 = animelemtime(3) = 12
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 810, Width]
type = width
trigger1 = !map(strength)
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = 40 * const(size.xscale), 0

[State 810, Width]
type = width
trigger1 = !map(strength)
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = 80 * const(size.xscale), 0

[State 810, Width]
type = width
trigger1 = map(strength)
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = 0, 40 * const(size.xscale)

[State 810, Width]
type = width
trigger1 = map(strength)
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
edge = 0, 80 * const(size.xscale)

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(3) < 0
pos = 65 * const(size.xscale), 0

[State 810, Bind 3 Punch]
type = targetbind
trigger1 = animelem = 3
trigger1 = !map(strength)
pos = 65 * const(size.xscale), 0

[State 810, Bind 3 Kick]
type = targetbind
trigger1 = map(strength)
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 48 * const(size.xscale), -103

[State 810, Bind 4 Kick]
type = targetbind
trigger1 = animelem = 4
trigger1 = map(strength)
pos = -8 * const(size.xscale), -140

[State 810, Damage]
type = hitadd
triggerall = numtarget
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = 1

[State 810, Damage]
type = targetlifeadd
triggerall = numtarget
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = floor(ifelse(map(strength), -50, -100) * map(damagescaling))
dizzy = 0

[State 810, Stun Damage]
type = targetdizzypointsadd
triggerall = numtarget
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = floor(ifelse(map(strength), -50, -100) * map(damagescaling))

[State 810, Give Power]
type = targetpoweradd
triggerall = numtarget
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = 40; givepower

[State 810, Get Power]
type = poweradd
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = 100 * map(meterscaling); getpower

[State 810, Throw]
type = targetstate
triggerall = numtarget
trigger1 = !map(strength)
trigger1 = animelem = 3
trigger2 = map(strength)
trigger2 = animelem = 4
value = ifelse(map(strength), 817, 816)

[State 810, End]
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

[State 815, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 1

[State 815, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- THROWN BY PUNCH THROW -----
[Statedef 816]
type = A
physics = N
movetype = H
velset = -3, -8
sprpriority = -1

[State 816, Anim]
type = changeanim2
trigger1 = !time
value = 816

[State 816, Accel]
type = veladd
trigger1 = time
y = 0.4850; yaccel

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
anim = 5050; offset fix

[State 816, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100

[State 816, Fix]
type = offset
trigger1 = anim = 816
y = const(size.mid.pos.y)


;----- THROWN BY KICK THROW -----
[Statedef 817]
type = A
physics = N
movetype = H
velset = 3, -11
sprpriority = -1

[State 817, Turn]
type = turn
trigger1 = !time

[State 817, Fix]
type = posadd
trigger1 = !time
y = -const(size.mid.pos.y)

[State 817, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 817, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 817, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = vel y > 0
value = 5061

[State 817, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = vel y > 0
value = ifelse(selfanimexist(5035), 5035, 5050)

[State 817, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 817, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 817, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 817, Hit Ground]
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

[State 850, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 850, Direction]
type = varset
trigger1 = !time
var(0) = 0

[State 850, Direction]
type = varset
triggerall = !time
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger2 = AIlevel
trigger2 = backedgedist < frontedgedist
var(0) = 1

[State 850, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= (44 - const(size.air.front))
trigger1 = p2dist y = [-42, 38]
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 850
attr = A, NT
hitflag = AF
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1stateno = 860
p2stateno = 865
guard.dist = 0
numhits = 0
fall = 1
fall.recover = 0
down.recover = 1

[State 850, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

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

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;=======================<HOUTEN>========================
[Statedef 860]
type = A
physics = N
movetype = A
anim = 860
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 860, Turn]
type = turn
trigger1 = animelem = 2
trigger1 = var(0) = 1

[State 860, Turn]
type = targetfacing
trigger1 = !time
trigger2 = animelem = 2
value = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 865

[State 860, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 860, Width]
type = width
trigger1 = 1
edge = ceil(40 * const(size.xscale)), ceil(40 * const(size.xscale))

[State 860, Throw]
type = targetstate
trigger1 = !time
value = 865

[State 860, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 860, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.75

[State 860, Vel]
type = velset
trigger1 = animelem = 2
x = 0
y = -6

[State 860, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 71 * const(size.xscale), -70

[State 860, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 15 * const(size.xscale), -67

[State 860, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0
pos = 0, 0

[State 860, Sound]
type = playsnd
trigger1 = time = 8
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 860, End]
type = changestate
trigger1 = animelemtime(2) > 0 && vel y > 0 && (pos y > -vel y)
value = 861


;----- HIT FLOOR -----
[Statedef 861]
type = A
physics = N
movetype = A
anim = 861
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 861, Throw]
type = targetstate
trigger1 = !time
value = 866

[State 861, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 861, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -6

[State 861, Sound]
type = playsnd
trigger1 = !time
value = 3, 8
channel = 0

[State 861, Sound]
type = playsnd
trigger1 = !time
value = 5, 22

[State 861, Sound]
type = playsnd
trigger1 = !time
value = 2, 9
channel = 2

[State 861, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 861, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 0, -pos y
ownpal = 1

[State 861, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = !time
anim = F 62
postype = p1
pos = 0, -pos y
sprpriority = -10
ownpal = 1

[State 861, Bind 1]
type = targetbind
trigger1 = animelem = 1
pos = 0, 0

[State 861, Damage]
type = hitadd
trigger1 = animelem = 1
value = 1

[State 861, Damage]
type = targetlifeadd
trigger1 = animelem = 1
value = floor(-140 * map(damagescaling))
dizzy = 0

[State 861, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 1
value = floor(-150 * map(damagescaling))

[State 861, Give Power]
type = targetpoweradd
trigger1 = animelem = 1
value = 40; givepower

[State 861, Get Power]
type = poweradd
trigger1 = animelem = 1
value = 100 * map(meterscaling); getpower

[State 861, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State Gravity]
type = gravity
trigger1 = animelemtime(2) >= 0

[State 861, Sprite Priority]
type = sprpriority
trigger1 = animelem = 2
value = -1

[State Land]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- TARGET -----
[Statedef 865]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 865, Anim]
type = changeanim2
trigger1 = !time
value = 865

[State 865, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 865, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 866]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
velset = 0, 0

[State 866, Anim]
type = changeanim2
trigger1 = !time
value = 866

[State 866, Vel]
type = posset
trigger1 = 1
y = 0

[State 866, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 866, End]
type = selfstate
trigger1 = time >= 39
value = 5120
ctrl = 1


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
