; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<SOUL FIST>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 50 * !map(darkforce)
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1000, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1000, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1000, FX]
type = explod
trigger1 = !time
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1
bindtime = -1
removeongethit = 1
removeonchangestate = 1

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1000, Soul Fist]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Soul Fist"
postype = p1
pos = 6 * const(size.xscale), -50
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 13
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SOUL FIST>=============================
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1010, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1010, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1010, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = 5 * const(size.xscale), -51 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, FX]
type = explod
trigger1 = !time
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1
bindtime = -1
removeongethit = 1
removeonchangestate = 1

[State 1010, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1010, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 1015
ID = 1015
name = "EX Soul Fist"
postype = p1
pos = 6 * const(size.xscale), -50
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 13
channel = 0

[State 1010, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR SOUL FIST>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
poweradd = 50 * !map(darkforce)
sprpriority = 2
facep2 = p2dist x <= -const(size.ground.back)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1050, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1050, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1050, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(9) < 0
player = ceil(16 * const(size.xscale)), 0

[State 1050, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1
bindtime = -1
removeongethit = 1
removeonchangestate = 1

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1050, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 1055
ID = 1055
name = "Air Soul Fist"
postype = p1
pos = 60 * const(size.xscale), -48
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1050, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 1050, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.5

[State 1050, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = -1
y = -6

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 13
channel = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1053


;---Land---
[Statedef 1053]
type = S
physics = S
movetype = I
anim = 1053
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1053, Pos]
type = posset
trigger1 = 1
y = 0

[State 1053, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1053, Dust]
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

[State 1053, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX AIR SOUL FIST>=============================
[Statedef 1060]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 2
facep2 = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1060, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1060, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1060, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = -6 * const(size.xscale), -77 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1060, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(9) < 0
player = ceil(16 * const(size.xscale)), 0

[State 1060, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1
bindtime = -1
removeongethit = 1
removeonchangestate = 1

[State 1060, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1060, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 1065
ID = 1065
name = "EX Air Soul Fist"
postype = p1
pos = 60 * const(size.xscale), -48
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1060, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 1060, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.5

[State 1060, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = -1
y = -6

[State 1060, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 13
channel = 0

[State 1060, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1053


;======================<SHADOW BLADE>=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * !map(darkforce)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1100, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1100, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 1100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1100, HB]
type = hitby
trigger1 = anim = 1100
trigger1 = animelemtime(4) < 0
trigger1 = map(strength) = 0
value = SC, AA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = hitby
trigger1 = anim = 1100
trigger1 = animelemtime(4) < 0
trigger1 = map(strength) = 1
value = C, AA
time = 1
ignorehitpause = 1

[State 1100, NHB]
type = nothitby
trigger1 = anim = 1100
trigger1 = animelemtime(4) < 0
trigger1 = map(strength) = 2
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Pos]
type = posadd
trigger1 = anim = 1100
trigger1 = animelem = 1 || animelem = 2
x = ifelse(map(strength) = 2, 10, ifelse(map(strength) = 1, 5, 0)) * const(size.xscale)

[State 1100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 1
trigger2 = anim = 1101
y = ifelse(map(strength) = 2, 0.67, ifelse(map(strength) = 1, 0.63, 0.50))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = [0, 1]
x = ifelse(map(strength) = 2, 10.2, ifelse(map(strength) = 1, 8.1, 4.9))
y = ifelse(map(strength) = 2, -11.76, ifelse(map(strength) = 1, -9.15, -5.50))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 0
value = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 2
value = 1, 9
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 1
value = 0, ifelse(map(strength) = 0, 40, 41)

[State 1100, Dust]
type = helper
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 2
value = 4, 12
channel = 0

[State 1100, Hit]
type = hitdef
trigger1 = anim = 1100
trigger1 = animelem = 2 || animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = ifelse(map(strength) = 2, 120, ifelse(map(strength) = 1, 110, 100)), ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 28, 25))
dizzypoints = 200 * !map(darkforce)
animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 50), map(sparky) := ifelse((animelem = 2), -35, -60)
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.5, -3.0)) * !numhelper(775), ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
air.type = Low
air.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.5, -3.0)) * !numhelper(775), ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Hit 2]
type = hitdef
trigger1 = animelem = 4 && anim = 1100
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = 60, 15
dizzypoints = 100 * !map(darkforce)
animtype = Back
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 25), map(sparky) := -100
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.5, -3.0)) * !numhelper(775), ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
air.type = Low
air.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.5, -3.0)) * !numhelper(775), ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100
trigger1 = animelemtime(4) > 0 && vel y > -1
value = 1101

[State 1100, Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1109


;---Land---
[Statedef 1109]
type = S
physics = S
movetype = I
anim = 1109
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1109, Pos]
type = posset
trigger1 = 1
y = 0

[State 1109, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1109, Dust]
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

[State 1109, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SHADOW BLADE>=============================
[Statedef 1110]
type = S
physics = S
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1110, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1110, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1110, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = 18 * const(size.xscale), -38 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, NHB]
type = nothitby
trigger1 = anim = 1110
trigger1 = animelemtime(4) < 1
value = SCA
time = 1
ignorehitpause = 1

[State 1110, Pos]
type = posadd
trigger1 = anim = 1110
trigger1 = animelem = 1 || animelem = 2
x = 10 * const(size.xscale)

[State 1110, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 1110, Accel]
type = veladd
trigger1 = anim = 1110
trigger1 = animelemtime(4) >= 1
trigger2 = anim = 1101
y = 0.67

[State 1110, Vel]
type = velset
trigger1 = anim = 1110
trigger1 = animelemtime(4) = [0, 1]
x = 10.2
y = -11.76

[State 1110, Grounded Frame]
type = posfreeze
trigger1 = anim = 1110
trigger1 = animelemtime(4) = 0
value = 1

[State 1110, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 1, 9
;channel = 1
stopongethit = 1

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelemtime(4) = 1
value = 0, 41

[State 1110, Dust]
type = helper
trigger1 = anim = 1110
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 2
value = 4, 12
channel = 0

[State 1110, Hit]
type = hitdef
trigger1 = anim = 1110
trigger1 = animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, SA
damage = 40, 10
dizzypoints = 67 * !map(darkforce)
animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 50), map(sparky) := ifelse((animelem = 2), -35, -60)
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, -8.5
air.type = Low
air.velocity = 0, -8.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Hit 2]
type = hitdef
trigger1 = animelem = 4 && anim = 1110
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, SA
damage = 60, 15
dizzypoints = 67 * !map(darkforce)
animtype = Up
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 25), map(sparky) := -100
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0 * !numhelper(775), -8.5
air.type = Low
air.velocity = -4.0 * !numhelper(775), -8.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00 * !numhelper(775), -1.00
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Type]
type = statetypeset
trigger1 = anim = 1110 && animelemtime(4) >= 1
trigger2 = anim = 1101
statetype = A
physics = N

[State 1110, Anim]
type = changeanim
trigger1 = anim = 1110 && animelemtime(4) > 0 && vel y > -1
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1109


;======================<PARASITE ROLL>=============================
;---Startup---
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * !map(darkforce)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1200, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1200, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(ai_combowindow) >= 17, 2, ifelse(map(ai_combowindow) >= 15, 1, 0))
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, End]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1202, ifelse(map(strength) = 1, 1201, 1200))

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 20
channel = 0

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 1205


;---Active---
[Statedef 1205]
type = S
physics = N
movetype = A
anim = ifelse(map(strength) = 2, 1207, ifelse(map(strength) = 1, 1206, 1205))
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1205, Vel]
type = velmul
trigger1 = 1
x = 0.95

[State 1205, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 7, 6))

[State 1205, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 7 || animelem = 13
value = 1, 9
freqmul = ifelse(map(strength) = 2, 1.10, ifelse(map(strength) = 1, 1.05, 1.00))
;channel = 1
stopongethit = 1

[State 1205, Dust]
type = explod
trigger1 = !(time % 3) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = -8 * const(size.xscale), 0
scale = 0.5, 0.5
trans = addalpha
alpha = 96, 256
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1205, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 10 || animelem = 16
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = ifelse(map(strength) = 2, 34, ifelse(map(strength) = 1, 40, 60)), ifelse(map(strength) = 2, 9, ifelse(map(strength) = 1, 10, 15))
dizzypoints = ifelse(map(strength) = 2, 67, ifelse(map(strength) = 1, 75, 100)) * !map(darkforce)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 60), map(sparky) := -60
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49, 0
air.type = Low
air.velocity = -3.5, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1205, Hit High]
type = modifyhitdef
trigger1 = animelem = 4 || animelem = 10 || animelem = 16
trigger1 = p2, anim = [5010, 5019]
ground.type = High

[State 1205, End]
type = changestate
trigger1 = !animtime
value = 1210


;---Recovery---
[Statedef 1210]
type = S
physics = S
movetype = I
anim = 1210
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX PARASITE ROLL>=============================
;---Startup---
[Statedef 1250]
type = S
physics = S
movetype = A
anim = 1250
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1250, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1250, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = 19 * const(size.xscale), -51 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 20
channel = 0

[State 1250, End]
type = changestate
trigger1 = !animtime
value = 1251


;---Active---
[Statedef 1251]
type = S
physics = N
movetype = A
anim = 1251
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1251, Vel]
type = velmul
trigger1 = 1
x = 0.95

[State 1251, Vel]
type = velset
trigger1 = !time
x = 10

[State 1251, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19
value = 1, 9
freqmul = 1.10
;channel = 1
stopongethit = 1

[State 1251, Dust]
type = explod
trigger1 = !(time % 3) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = -8 * const(size.xscale), 0
scale = 0.5, 0.5
trans = addalpha
alpha = 96, 256
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1251, Hit]
type = hitdef
trigger1 = !((movecontact + movereversed) % 8)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = 20, 5
dizzypoints = 34 * !map(darkforce)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 60), map(sparky) := -60
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(animelemtime(21) > 0, -4.49, 0), 0
air.type = Low
air.velocity = -3.5, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(animelemtime(21) > 0, -4.49, 0)
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1251, Hit High]
type = modifyhitdef
trigger1 = !((movecontact + movereversed) % 8)
trigger1 = p2, anim = [5010, 5019]
ground.type = High

[State 1251, End]
type = changestate
trigger1 = !animtime
value = 1252


;---Recovery---
[Statedef 1252]
type = S
physics = S
movetype = I
anim = 1252
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1252, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<VECTOR DRAIN>=============================
[Statedef 1300]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1300
sprpriority = 2
poweradd = 50 * map(meterscaling)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1300, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1300, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x <= (25 * const(size.xscale)), 2, ifelse(p2bodydist x <= (30 * const(size.xscale)), 1, 0))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = ifelse((animelem = 3), 25, 15) * const(size.xscale)

[State 1300, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= (ifelse(map(strength) = 2, 25, ifelse(map(strength) = 1, 30, 35)) * const(size.xscale));25 CvS2; 29 MvC; 35 VH
attr = S, ST
hitflag = M
priority = 7, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 1310
p2stateno = 1320
fall = 1
fall.recover = 0
down.recover = 1
ID = 1300
yaccel = 0.4850
numhits = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 1310]
type = A
physics = N
movetype = A
anim = 1310
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetstate
trigger1 = !time
value = 1320

[State 1310, Throw]
type = targetstate
trigger1 = animelem = 4
value = 1321

[State 1310, Throw]
type = targetstate
trigger1 = animelem = 8
value = 1322

[State 1310, Width]
type = width
trigger1 = 1
edge = ceil(40 * const(size.xscale)), ceil(40 * const(size.xscale))

[State 1310, Vel]
type = velmul
trigger1 = vel x
x = 0.97

[State 1310, Jet]
type = helper
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(8) < 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6026
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1310, Dust]
type = explod
trigger1 = animelem = 4
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = -54 * const(size.xscale), -pos y
scale = 0.33, 0.33
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 1310, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = ifelse(map(strength) = 3, 3.5, ifelse(map(strength) = 2, 3.0, ifelse(map(strength) = 1, 2.5, 2.0)))
y = ifelse(map(strength) = 3, -10, ifelse(map(strength) = 2, -7.5, ifelse(map(strength) = 1, -6.0, -4.5)))

[State 1310, Vel]
type = velmul
trigger1 = animelemtime(8) < 0
y = 0.95

[State 1310, Accel]
type = veladd
trigger1 = animelemtime(12) >= 0
y = 0.75

[State 1310, Vel Circle]
type = velset
trigger1 = animelemtime(7) >= 0
trigger1 = animelemtime(12) < 0
x = ifelse(map(strength) = 3, 10, ifelse(map(strength) = 2, 7.5, ifelse(map(strength) = 1, 6.0, 4.5))) * cos((animelemtime(7) + 5) / 20.0 * pi)
y = ifelse(map(strength) = 3, -10, ifelse(map(strength) = 2, -7.5, ifelse(map(strength) = 1, -6.0, -4.5))) * sin((animelemtime(7) + 5) / 20.0 * pi)

[State 1310, Vel]
type = velset
trigger1 = animelem = 12
x = 0

[State 1310, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = map(strength) = 3
value = 4, 3
channel = 0
persistent = 0

[State 1310, Sound]
type = playsnd
trigger1 = map(strength) != 3
trigger1 = animelem = 8
trigger2 = map(strength) = 3
trigger2 = animelem = 10
value = 4, 11
channel = 0
persistent = 0

[State 1310, Sound]
type = playsnd
trigger1 = animelemtime(13) >= 0
trigger1 = !(time % 9)
value = 1, 6
;channel = 1
stopongethit = 1

[State 1310, Spiral]
type = explod
trigger1 = vel y > 0
trigger1 = pos y >= -160; stay visible
trigger1 = animelemtime(12) >= 0
anim = 1315
ID = 1315
sprpriority = 4
postype = p1
facing = -1
vel = 0, vel y
friction = 0.66, 0.66
scale = 0.5, 0.5
ownpal = 1
persistent = 0

[State 1310, Loop Anim]
type = changeanim
trigger1 = !animtime
value = anim
elem = 12

[State 1310, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 59 * const(size.xscale), -71

[State 1310, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 64 * const(size.xscale), -76

[State 1310, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 60 * const(size.xscale), -76

[State 1310, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(8) < 0
pos = 42 * const(size.xscale), -81

[State 1310, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 25 * const(size.xscale), -95

[State 1310, Bind 9]
type = targetbind
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = 2 * const(size.xscale), -98

[State 1310, Bind 10]
type = targetbind
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = -23 * const(size.xscale), -90

[State 1310, Bind 11]
type = targetbind
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = -37 * const(size.xscale), -74

[State 1310, Bind 12]
type = targetbind
trigger1 = animelemtime(12) >= 0 && animelemtime(13) < 0
trigger2 = !animtime
pos = -46 * const(size.xscale), -41

[State 1310, Bind 13]
type = targetbind
trigger1 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = 2 * const(size.xscale), -38

[State 1310, Bind 14]
type = targetbind
trigger1 = animelemtime(14) >= 0 && animelemtime(15) < 0
pos = 48 * const(size.xscale), -41

[State 1310, Bind 15]
type = targetbind
trigger1 = animelemtime(15) >= 0
pos = 2 * const(size.xscale), -44

[State 1310, End]
type = changestate
trigger1 = animelemtime(8) >= 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1311


;----- HIT FLOOR -----
[Statedef 1311]
type = A
physics = N
movetype = A
anim = 1311
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1311, Pos]
type = posset
trigger1 = !time
y = 0

[State 1311, Throw]
type = targetstate
trigger1 = !time
value = 1323

[State 1311, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1311, Damage]
type = targetlifeadd
trigger1 = !time
value = floor(ifelse(map(strength) = 3, -160, ifelse(map(strength) = 2, -150, ifelse(map(strength) = 1, -140, -130))) * map(damagescaling))
dizzy = 0

[State 1311, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(ifelse(map(strength) = 3, -150, -100) * map(damagescaling)) * !map(darkforce)

[State 1311, Give Power]
type = targetpoweradd
trigger1 = !time
value = 40; givepower

[State 1311, Get Power]
type = poweradd
trigger1 = !time
trigger1 = !map(darkforce)
trigger1 = map(strength) != 3
value = 200 * map(meterscaling); getpower

[State 1311, Bind]
type = targetfacing
trigger1 = !time
value = 1

[State 1311, Bind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 40 * const(size.xscale), 0

[State 1311, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1311, Sound]
type = playsnd
trigger1 = !time
value = 5, 2

[State 1311, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = 48 * const(size.xscale), 0
ownpal = 1

[State 1311, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = !time
anim = F 62
postype = p1
pos = 48 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 1311, Vel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 0.55

[State 1311, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = -2.5
y = -8.0

[State 1311, End]
type = changestate
trigger1 = animelemtime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1312


;----- Land -----
[Statedef 1312]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1312
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1312, Pos]
type = posset
trigger1 = 1
y = 0

[State 1312, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1312, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1312, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1320]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1320, Anim]
type = changeanim2
trigger1 = !time
value = 1320

[State 1320, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1320, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1321]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1321, Anim]
type = changeanim2
trigger1 = !time
value = 1321

[State 1321, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1321, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1322]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1322, Anim]
type = changeanim2
trigger1 = !time
value = 1322

[State 1322, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1322, Sprite Priority]
type = sprpriority
trigger1 = 1
value = 1

[State 1322, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
value = 3

[State 1322, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- TARGET HIT FLOOR -----
[Statedef 1323]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1323, Anim]
type = changeanim2
trigger1 = !time
value = 1323

[State 1323, Anim]
type = changeanim
trigger1 = time = 16
value = 5160

[State 1323, Accel]
type = veladd
trigger1 = time >= 16
y = 0.4850; yaccel

[State 1323, Vel]
type = velset
trigger1 = time = 16
x = 3
y = -6

[State 1323, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1323, Fall Recovery]
type = selfstate
trigger1 = time >= 16
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1323, End]
type = selfstate
trigger1 = time >= 16
trigger1 = vel y > 0 && pos y > 0
value = 5110


;======================<EX VECTOR DRAIN>=============================
[Statedef 1330]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1300
poweradd = -500
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1330, Strength]
type = mapset
trigger1 = time <= 0
map = "strength"
value = 3; ex
ignorehitpause = 1
persistent = 0

[State 1330, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1330, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1330, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = 33 * const(size.xscale), -69 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1330, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = ifelse((animelem = 3), 25, 15) * const(size.xscale)

[State 1330, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1330, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= (30 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 1310
p2stateno = 1320
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
ID = 1330
yaccel = 0.4850
numhits = 0

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 1330, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<PURSUIT>=============================
[Statedef 1900]
type = S
physics = N
movetype = A
anim = 1900
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 50 * !map(darkforce)
facep2 = 1
juggle = 8 * (p2statetype = L)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1900, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1900, Jet]
type = helper
trigger1 = animelemtime(2) >= 1
trigger1 = animelemtime(9) < 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1900, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 1900, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1900, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1900, Turn]
type = turn
trigger1 = animelemtime(2) = 1
trigger1 = p2dist x < 0

[State 1900, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = min(p2dist x, 290) / float(-animelemtime(9)); where 290 is the maximum p2dist x without zoom
y = -4.06

[State 1900, Vel Correction]
type = veladd
trigger1 = numenemy
trigger1 = animelemtime(2) = 1
trigger1 = p2movetype = H
trigger1 = p2statetype = A || p2statetype = L
x = p2, vel x * (p2, facing) * facing

[State 1900, Vel]
type = velset
trigger1 = animelemtime(9) >= 0
trigger1 = animelemtime(12) < 0
x = 0
y = 0

[State 1900, Vel]
type = velset
trigger1 = animelemtime(12) >= 0
y = 15.31

[State 1900, Push]
type = playerpush
trigger1 = p2statetype = L
value = 0
ignorehitpause = 1

[State 1900, Sound]
type = playsnd
trigger1 = animelem = 12
value = 1, 9
;channel = 1
stopongethit = 1

[State 1900, Sound]
type = playsnd
trigger1 = animelem = 12
value = 3, 5
channel = 0

[State 1900, Hit]
type = hitdef
trigger1 = animelemtime(12) >= 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1900
attr = A, SA
hitflag = FD
guardflag = HA
priority = 4, Hit
damage = 20, 5
redlife = 20, 5
dizzypoints = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.hittime = 18
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 10), map(sparky) := 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1900, Lock On]
type = posfreeze
trigger1 = movehit = [1, 2]
value = 1

[State 1900, Lock On]
type = posset
trigger1 = movehit = 1
trigger1 = hitcount = 1
trigger1 = numtarget(1900) = 1
trigger1 = target(1900), statetype = L
x = target(1900), pos x
y = -(target(1900), const(size.ground.front))
ignorehitpause = 1

[State 1900, Jump Back]
type = changestate
trigger1 = time >= 48
trigger2 = hitcount >= 3
value = 1910

[State 1900, Land]
type = changestate
trigger1 = movehit != [1, 2]
trigger1 = animelemtime(12) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- Recover -----
[Statedef 1910]
type = A
physics = N
movetype = I
ctrl = 0
anim = 43
sprpriority = 2
movehitpersist = 1

[State 1910, Accel]
type = veladd
trigger1 = 1
y = 0.97

[State 1910, Accel]
type = velset
trigger1 = !time
x = -6.40
y = -12.13

[State 1910, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1911


;----- Land -----
[Statedef 1911]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1911
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1911, Pos]
type = posset
trigger1 = 1
y = 0

[State 1911, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1911, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1911, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX PURSUIT>=============================
[Statedef 1930]
type = S
physics = N
movetype = A
anim = 1900
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1
juggle = 8 * (p2statetype = L)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1930, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1930, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1930, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = 5 * const(size.xscale), -55 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1930, Jet]
type = helper
trigger1 = animelemtime(2) >= 1
trigger1 = animelemtime(9) < 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1930, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 1930, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1930, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1930, Turn]
type = velset
trigger1 = animelemtime(2) = 1
trigger1 = p2dist x < 0

[State 1930, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = min(p2dist x, 290) / float(-animelemtime(9)); where 290 is the maximum p2dist x without zoom
y = -4.06

[State 1930, Vel Correction]
type = veladd
trigger1 = numenemy
trigger1 = animelemtime(2) = 1
trigger1 = p2movetype = H
trigger1 = p2statetype = A || p2statetype = L
x = p2, vel x * (p2, facing) * facing

[State 1930, Vel]
type = velset
trigger1 = animelemtime(9) >= 0
trigger1 = animelemtime(12) < 0
x = 0
y = 0

[State 1930, Vel]
type = velset
trigger1 = animelemtime(12) >= 0
y = 15.31

[State 1930, Push]
type = playerpush
trigger1 = p2statetype = L
value = 0
ignorehitpause = 1

[State 1930, Sound]
type = playsnd
trigger1 = animelem = 12
value = 1, 9
;channel = 1
stopongethit = 1

[State 1930, Sound]
type = playsnd
trigger1 = animelem = 12
value = 4, 3
channel = 0

[State 1930, Hit]
type = hitdef
trigger1 = animelemtime(12) >= 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1930
attr = A, SA
hitflag = FD
guardflag = HA
priority = 4, Hit
damage = 13, 3
redlife = 13, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.hittime = 18
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 10), map(sparky) := 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1930, Lock On]
type = posfreeze
trigger1 = movehit = [1, 2]
value = 1

[State 1930, Lock On]
type = posset
trigger1 = movehit = 1
trigger1 = hitcount = 1
trigger1 = numtarget(1930) = 1
trigger1 = target(1930), statetype = L
x = target(1930), pos x
y = -(target(1930), const(size.ground.front))
ignorehitpause = 1

[State 1930, Jump Back]
type = changestate
trigger1 = time >= 66
trigger2 = hitcount >= 6
value = 1910

[State 1930, Land]
type = changestate
trigger1 = movehit != [1, 2]
trigger1 = animelemtime(12) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;========================<PUNCH ZERO COUNTER>=============================
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1

[State 2900, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = s2, 9
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 110), map(sparky) := -62
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2900, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<KICK ZERO COUNTER>=============================
[Statedef 2910]
type = S
physics = N
movetype = A
anim = 2910
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1

[State 2910, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = s2, 9
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 65) * (map(sparkx.max) := 130), map(sparky) := -32
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
