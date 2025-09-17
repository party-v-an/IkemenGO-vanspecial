; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
damage = 30, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 65), map(sparky) := -82
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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

[State 201, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 201
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 201, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
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
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 65), map(sparky) := -74
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 201 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 210, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 1;ifelse(anim = 210, 1, 8)
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 70, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 70) * (map(sparkx.max) := 115), map(sparky) := -54
hitsound = s2, 2
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer); + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 211, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 1;ifelse(anim = 211, 1, 8)
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 211, Hit]
type = hitdef
trigger1 = animelem = 4
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
sparkno = -1 + 0 * (map(sparkno) := 8021)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 110), map(sparky) := -62
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer); + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 211, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 211
elem = 5
ignorehitpause = 1

[State 211, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = hitpausetime = [1, 5]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
value = 211
elem = 6
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
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
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 220, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 5
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
sparkxy = -10 + 0 * (map(sparkx.min) := 70) * (map(sparkx.max) := 130), map(sparky) := -48
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
value = 220
elem = 6
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
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

[State 221, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 221, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 221, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
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
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := -36
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)
forcestand = 1

[State 221, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
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
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := -62
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 221, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 221
elem = 3
ignorehitpause = 1

[State 221, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = hitpausetime = [1, 5]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 221
elem = 4
ignorehitpause = 1

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
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 70), map(sparky) := -32
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = ifelse(prevstateno = 230, 15, 12)
ground.hittime = 1 + ifelse(prevstateno = 230, 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse(prevstateno = 230, -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
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

[State 240, Sound]
type = playsnd
trigger1 = animelem = 4 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 240, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 70, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 110), map(sparky) := -53
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = prevstateno = 710
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
damage = 70, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 110), map(sparky) := -53
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -5.30 * !numhelper(775), -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.velocity = -5.30 * !numhelper(775), -5.30; sidestep
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
guard.velocity = -10.52 * !numhelper(775)
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 240
elem = 5
ignorehitpause = 1

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

[State 250, Sound]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 250, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, NA
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
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 120), map(sparky) := -70
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)
forcestand = 1

[State 250, SparkXY]
type = mapset
trigger1 = animelem = 5
trigger1 = map(sparkx.min) := 50
trigger1 = map(sparkx.max) := 110
map = "sparky"
value = -110

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 250
elem = 5
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 6]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
value = 250
elem = 6
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 4]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
value = 250
elem = 7
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = hitpausetime = [1, 2]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
value = 250
elem = 8
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Standing Hard Kick 2>========================
[Statedef 255]
type = S
movetype = A
physics = S
anim = 255
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

[State 255, Width]
type = width
trigger1 = animelemtime(3) >= 0
player = ceil(30 * const(size.xscale)), 0

[State 255, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 255, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 255, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 255, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.5

[State 255, Vel]
type = velset
trigger1 = animelem = 3
x = 4
y = -5

[State 255, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 255, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 255, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = HAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 115), map(sparky) := ifelse((animelem = 3), -96, -72)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 255, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 100), map(sparky) := -48
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 255, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 30, 0
dizzypoints = 50 * !map(darkforce)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 100), map(sparky) := -24
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -6 * !numhelper(775), 9
air.fall = 1
fall.recover = 1
fall.recovertime = 120
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
forcenofall = !map(darkforce)

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 256


;---Land---
[Statedef 256]
type = S
physics = S
movetype = I
anim = 256
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 255, Pos]
type = posset
trigger1 = 1
y = 0

[State 255, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 255, Dust]
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

[State 255, End]
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
trigger1 = animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 20, 0
dizzypoints = 25 * !map(darkforce)
animtype = Light
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -36
hitsound = s2, 1
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 200 || prevstateno = 201 || prevstateno = 230 || prevstateno = 400), -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 410, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 8
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 410, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 60, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 75), map(sparky) := -29
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 420, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 420, Hit]
type = hitdef
trigger1 = animelem = 4
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
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 130), map(sparky) := -32
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=======================<Ecstatic Climb>========================
[Statedef 425]
type = C
movetype = A
physics = C
anim = 425
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

[State 425, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 425, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 425, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 90, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 90), map(sparky) := -120
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 4 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -1 * !numhelper(775), -9
ground.cornerpush.veloff = 0
guard.velocity = -10.52 * !numhelper(775)
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -1 * !numhelper(775), -9
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !map(darkforce), 36 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcestand = 1
fall = 1

[State 425, Anim]
type = changeanim
trigger1 = anim = 425
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 425
elem = 4
ignorehitpause = 1

[State 425, Anim]
type = changeanim
trigger1 = anim = 425
trigger1 = hitpausetime = [1, 5]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
value = 425
elem = 5
ignorehitpause = 1

[State 425, Jump Cancel]
type = changestate
value = 40
triggerall = movehit = 1
triggerall = roundstate = 2
trigger1 = !AIlevel
trigger1 = command = "holdup"
trigger2 = AIlevel
trigger2 = p2statetype = A
trigger2 = p2dist y >= -60
trigger2 = random < 500
ignorehitpause = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 425, End]
type = changestate
trigger1 = !animtime
value = 0
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
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 430, Hit]
type = hitdef
trigger1 = animelem = 3
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
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 85), map(sparky) := -16
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse(prevstateno = 230, 15, 12)
ground.hittime = 1 + ifelse(prevstateno = 230, 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse(prevstateno = 230, -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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


;=======================<Crouching Light Kick (MvC)>========================
[Statedef 431]
type = C
movetype = A
physics = C
anim = 431
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

[State 431, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 431, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 431, Hit]
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
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 85), map(sparky) := -4
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse(prevstateno = 230, 15, 12)
ground.hittime = 1 + ifelse(prevstateno = 230, 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse(prevstateno = 230, -7.51, -4.49) * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 431, Anim]
type = changeanim
trigger1 = anim = 431
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 431
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 431, End]
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
value = 3, ifelse(random < 500, 0, 2)
channel = 0

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
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 85), map(sparky) := -32
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
value = 440
elem = 4
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


;=======================<Crouching Medium Kick (MvC)>========================
[Statedef 445]
type = C
movetype = A
physics = C
anim = 445
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

[State 445, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 445, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 445, Hit]
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
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 90), map(sparky) := -14
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 14
ground.hittime = 1 + 15; + 3 * map(counterhit_buffer)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 445, Anim]
type = changeanim
trigger1 = anim = 445
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 445
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 445, End]
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
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 450, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 450, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, NA
damage = 80, 0
dizzypoints = 200 * !map(darkforce)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 120), map(sparky) := -30
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
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.695
fall = 1
fall.recover = !map(counterhit_buffer)
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
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -43
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = -4.49 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 600, Anim]
type = changeanim
trigger1 = anim = 600
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 600
elem = 3
ignorehitpause = 1

[State 600, Idle]
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


;=======================<Jumping Medium Punch>========================
[Statedef 610]
type = A
physics = N
movetype = A
anim = 610
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 8
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 610, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 70, 0
dizzypoints = 100 * !map(darkforce)
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8021)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 75), map(sparky) := -48
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = -7.51 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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


;=======================<Jumping Hard Punch>========================
[Statedef 620]
type = A
physics = N
movetype = A
anim = 620
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
trigger1 = animelem = 5 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 620, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 620, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, NA
damage = 90, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 85), map(sparky) := -66
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 620, Anim]
type = changeanim
trigger1 = anim = 620
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
value = 620
elem = 7
ignorehitpause = 1

[State 620, Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
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


;=======================<Diagonal Jumping Light Kick>========================
[Statedef 630]
type = A
physics = N
movetype = A
anim = 630
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -42
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = -4.49 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
trigger1 = animelemtime(7) >= 0
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


;=======================<Neutral Jumping Light Kick>========================
[Statedef 631]
type = A
physics = N
movetype = A
anim = 631
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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

[State 631, Sound]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 631, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 631, Hit]
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -62
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = -4.49 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !map(darkforce), 25 * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

[State 631, Anim]
type = changeanim
trigger1 = anim = 631
trigger1 = hitpausetime = [1, 8]
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
value = 631
elem = 3
ignorehitpause = 1

[State 631, Idle]
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


;=======================<Jumping Medium Kick>========================
[Statedef 640]
type = A
physics = N
movetype = A
anim = 640
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
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
damage = 70, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := -25) * (map(sparkx.max) := 75), map(sparky) := -42
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = -7.51 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

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
value = 3, ifelse(random < 500, 0, 2)
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
damage = 90, 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 75), map(sparky) := -54
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -2.78 * !numhelper(775), -5.33
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !map(darkforce), ifelse(moveguarded, 25, 100) * !map(darkforce)
givepower = 40, 40
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !map(darkforce)

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
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
ID = 800
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = ifelse(map(strength), 810, 820)
p2stateno = ifelse(map(strength), 815, 825)
guard.dist = 0
animtype = Back
fall = 1
fall.recover = 0
down.recover = 1
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


;=======================<MOON TRACER>========================
;----- PLAYER -----
[Statedef 810]
type = S
physics = S
movetype = A
anim = 810
ctrl = 0
velset = 0, 0
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

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 815

[State 810, Fix]
type = turn
trigger1 = animelem = 3

[State 810, Fix]
type = posadd
trigger1 = animelem = 3
x = -16

[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
trigger2 = animelem = 3
value = -1

[State 810, Width]
type = width
trigger1 = animelemtime(5) < 0
edge = ceil(50 * const(size.xscale)), 0

[State 810, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = ceil(60 * const(size.xscale)), 0

[State 810, Width]
type = width
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
edge = ceil(75 * const(size.xscale)), 0

[State 810, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 2
channel = 0

[State 810, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 66 * const(size.xscale), -76

[State 810, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 60 * const(size.xscale), -77

[State 810, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -4 * const(size.xscale), -72

[State 810, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 52 * const(size.xscale), -70

[State 810, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 72* const(size.xscale), -38

[State 810, Bind 6]
type = targetbind
trigger1 = animelem = 6
pos = 82 * const(size.xscale), 0

[State 810, Damage]
type = hitadd
trigger1 = animelem = 6
value = 1

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 6
value = floor(-110 * map(damagescaling))
dizzy = 0

[State 810, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 6
value = floor(-140 * map(damagescaling)) * !map(darkforce)

[State 810, Give Power]
type = targetpoweradd
trigger1 = animelem = 6
value = 40; givepower

[State 810, Get Power]
type = poweradd
trigger1 = animelem = 6
trigger1 = !map(darkforce)
value = 100 * map(meterscaling); getpower

[State 810, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 6
value = 816

[State 810, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 6
value = 5, 2

[State 810, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 6
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p2
pos = 0, 0
ownpal = 1

[State 810, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 6
anim = F 62
postype = p2
pos = 0, 0
sprpriority = -10
ownpal = 1

[State 810, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 6
time = 24
freq = 180
ampl = -4
mul = 0.85

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
value = 0
movecamera = 0, 0

[State 815, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 816]
type = A
physics = N
movetype = H

[State 816, Anim]
type = changeanim2
trigger1 = !time
value = 816

[State 816, Pos]
type = posset
trigger1 = 1
y = 0

[State 816, End]
type = changestate
trigger1 = time >= 12
value = 817


[Statedef 817]
type = L
physics = N
movetype = H

[State 817, Anim]
type = changeanim
trigger1 = !time
value = 5160

[State 817, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 817, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 817, Vel]
type = velset
trigger1 = !time
x = -2.5
y = -5.5

[State 817, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 817, Fall Recovery]; Exception needed since this state is type L
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 817, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;=======================<BREAST ANGUISH>========================
;----- PLAYER -----
[Statedef 820]
type = S
physics = S
movetype = A
anim = 820
ctrl = 0
velset = 0, 0
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

[State 820, Throw]
type = targetstate
trigger1 = !time
value = 821

[State 820, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Width]
type = width
trigger1 = animelemtime(8) < 0
edge = ceil(50 * const(size.xscale)), 0

[State 820, Width]
type = width
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
edge = ceil(80 * const(size.xscale)), 0

[State 820, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0

[State 820, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 3
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 820, Sound]
type = playsnd
trigger1 = animelem = 9
value = 5, 3

[State 820, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 60 * const(size.xscale), -71

[State 820, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 66 * const(size.xscale), -75

[State 820, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(8) < 0
pos = 66 * const(size.xscale), -70

[State 820, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 112 * const(size.xscale), -66

[State 820, Claw]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 825
ID = 825
name = "Claw"
postype = p1
pos = 105 * const(size.xscale), -65
size.ground.front = (target, const(size.ground.back))

[State 820, HitSound]
type = playsnd
trigger1 = animelem = 8 && numtarget
value = 2, 9
channel = 2

;[State 820, Spark]
;in ZSS

;[State 820, Blood]
;in ZSS

[State 820, Damage]
type = hitadd
trigger1 = animelem = 8
value = 1

[State 820, Damage]
type = targetlifeadd
trigger1 = animelem = 8
value = floor(-120 * map(damagescaling))
dizzy = 0
kill = 0

[State 820, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 8
value = floor(-120 * map(damagescaling)) * !map(darkforce)

[State 820, Give Power]
type = targetpoweradd
trigger1 = animelem = 8
value = 40; givepower

[State 820, Get Power]
type = poweradd
trigger1 = animelem = 8
trigger1 = !map(darkforce)
value = 100 * map(meterscaling); getpower

[State 820, Throw]
type = targetstate
trigger1 = animelem = 9
value = 822

[State 820, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 821]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 821, Anim]
type = changeanim2
trigger1 = !time
value = 821

[State 821, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 821, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- Flying -----
[Statedef 822]
type = A
physics = N
movetype = H
velset = 0, 0

[State 822, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = abs(stateowner, pos x - pos x) < 200, 0

[State 822, Vel]
type = veladd
trigger1 = 1
x = -1

[State 822, Vel]
type = velset
trigger1 = !time
x = -6

[State 822, Hit Wall]
type = changestate
trigger1 = backedgebodydist <= 0
trigger2 = time >= 180
value = 823


;----- Hit wall -----
[Statedef 823]
type = A
physics = N
movetype = H
velset = 0, 0

[State 823, Damage]
type = lifeadd
trigger1 = !time
value = -1
dizzy = 0
kill = 1

[State 823, Anim]
type = changeanim2
trigger1 = 1
value = 823

[State 823, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = abs(stateowner, pos x - pos x) < 200, 0

[State 823, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 823, FX]
type = explod
trigger1 = !time
anim = F 72
postype = p1
pos = -15, 0
ownpal = 1
sprpriority = -5

[State 823, Horizontal Shake]
type = zoom
trigger1 = 1
scale = 1
pos = 3 * cos(pi * time), 0
lag = 0
stagebound = 1
camerabound = 0

[State 823, End]
type = changestate
trigger1 = time >= 8
value = 824


;----- Bouncing -----
[Statedef 824]
type = A
physics = N
movetype = H
velset = 0, 0

[State 824, Turn]
type = turn
trigger1 = !time

[State 824, Fix Pos]
type = posadd
trigger1 = !time
x = ifelse((frontedgebodydist > backedgebodydist), backedgebodydist, frontedgebodydist)
y = -const(size.mid.pos.y)

[State 824, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5052), 5052, 5030)

[State 824, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5030
value = ifelse(selfanimexist(5035), 5035, 5050)

[State 824, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 824, Anim]
type = changeanim
trigger1 = vel y >= const240p(2)
trigger1 = anim = 5052
trigger1 = selfanimexist(5062)
value = 5062

[State 824, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = abs(stateowner, pos x - pos x) < 200, 0

[State 824, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 824, Vel]
type = velset
trigger1 = !time
x = -3
y = -5

[State 824, Stun]
type = selfstate
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
value = const(statedizzyfalldown_air)

[State 824, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 824, Hit Ground]
type = velmul
trigger1 = vel y > 0
trigger1 = pos y >= 25
x = 0.5

[State 824, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
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
