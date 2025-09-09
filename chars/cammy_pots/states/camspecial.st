; ________________________________
;| Cammy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;========================<CANNON DRILL>=============================
[Statedef 1000]
type = S
physics = N
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
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
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1000, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2bodydist x > 180 || p2movetype = H || map(customcombo)), 2, ifelse(p2bodydist x > 160, 1, 0))
ignorehitpause = 1

[State 1000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1002, ifelse(map(strength) = 1, 1001, 1000))

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 41

[State 1000, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Type]
type = statetypeset
trigger1 = animelem = 4
statetype = A
physics = N

[State 1000, Pos]
type = posset
trigger1 = animelem = 4
y = -16
persistent = 0

[State 1000, Camera]
type = screenbound
trigger1 = pos y
value = 1
movecamera = 1, 0

[State 1000, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
x = -0.11055625
y = 0.165834375

[State 1000, Vel]
type = velset
trigger1 = animelem = 4
x = ifelse(map(strength) = 2, 9.47, ifelse(map(strength) = 1, 8.37, 7.27))
y = 0

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1000, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 90, ifelse(map(strength) = 1, 80, 70)), ifelse(map(strength) = 2, 23, ifelse(map(strength) = 1, 20, 18))
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.50, -6.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.50, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1000, Hit Midair]
type = modifyhitdef
trigger1 = animelem = 4
attr = A, SA
guardflag = MA
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; 14

[State 1000, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1005


;----- Land -----
[Statedef 1005]
type = S
physics = N
movetype = I
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 1005, Pos]
type = posset
trigger1 = 1
y = 0

[State 1005, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1007, ifelse(map(strength) = 1, 1006, 1005))

[State 1005, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 1005, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1005, Vel]
type = velset
trigger1 = !time
x = 3.95
y = 0

[State 1005, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1005, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX CANNON DRILL>=============================
[Statedef 1020]
type = S
physics = N
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1020, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1020, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1020, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(24 * const(size.xscale)), ceil(-50 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1020, Type]
type = statetypeset
trigger1 = animelem = 4
statetype = A
physics = N

[State 1020, Pos]
type = posset
trigger1 = animelem = 4
y = -16
persistent = 0

[State 1000, Camera]
type = screenbound
trigger1 = pos y
value = 1
movecamera = 1, 0

[State 1020, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
x = -0.11055625
y = 0.165834375

[State 1020, Vel]
type = velset
trigger1 = animelem = 4
x = 12.77
y = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 4

[State 1020, FX]
type = helper
trigger1 = animelem = 4 && !numhelper(1025)
helpertype = normal
stateno = 1025
ID = 1025
name = "EX Drill FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1020, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.50, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1020, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 100, 25
dizzypoints = 150 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.50, -7.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.50, -7.00
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; -14
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1020, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1021


;----- Land -----
[Statedef 1021]
type = S
physics = N
movetype = I
anim = 1021
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 1021, Pos]
type = posset
trigger1 = 1
y = 0

[State 1021, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 1021, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1021, Vel]
type = velset
trigger1 = !time
x = 3.95
y = 0

[State 1021, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1021, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1021, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<AIR CANNON DRILL>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)

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
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1050, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2bodydist x > 180 || p2movetype = H || map(customcombo)), 2, ifelse(p2bodydist x > 150, 1, 0))
ignorehitpause = 1

[State 1050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1050, Pos]
type = posadd
trigger1 = animelem = 3
y = -16
persistent = 0

[State 1050, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
x = -0.11055625
y = 0.165834375

[State 1050, Vel]
type = velset
trigger1 = animelem = 3
x = 9.47
y = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 1
channel = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 41
;channel = 1
stopongethit = 1

[State 1050, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.32, -6.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.91
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1050, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.32, -6.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.91
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; -14
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1050, End]
type = changestate
triggerall = animelemtime(3) >= 0
trigger1 = map(strength) = 0 && time >= 17
trigger2 = map(strength) = 1 && time >= 20
trigger3 = time >= 23
value = 1051

[State 1050, End]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1052


;----- Recover -----
[Statedef 1051]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1051
sprpriority = 2
movehitpersist = 1

[State 1051, Vel]
type = velset
trigger1 = !time
x = 2.66

[State 1051, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 1051, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1052


;----- Land -----
[Statedef 1052]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1052
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1052, Pos]
type = posset
trigger1 = 1
y = 0

[State 1052, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.442225

[State 1052, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1052, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1052, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1052, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX AIR CANNON DRILL>=============================
[Statedef 1060]
type = A
physics = N
movetype = A
anim = 1060
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500

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

[State 1060, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1060, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1060, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(44 * const(size.xscale)), ceil(-32 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1060, Pos]
type = posadd
trigger1 = animelem = 3
y = -16
persistent = 0

[State 1060, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
x = -0.11055625
y = 0.165834375

[State 1060, Vel]
type = velset
trigger1 = animelem = 3
x = 10.5
y = 0

[State 1060, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 1
channel = 0

[State 1060, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 41
;channel = 1
stopongethit = 1

[State 1060, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 4

[State 1060, FX]
type = helper
trigger1 = animelem = 3 && !numhelper(1025)
helpertype = normal
stateno = 1025
ID = 1025
name = "EX Drill FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1060, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.32, -6.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.91
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1060, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 15
dizzypoints = 150 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.32, -6.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.91
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; -14
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1060, End]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = time >= 26
value = 1051

[State 1060, End]
type = changestate
trigger1 = animelemtime(3) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1052


;========================<CANNON SPIKE>=============================
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

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
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1100, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2movetype = H || map(customcombo)), 2, 0)
ignorehitpause = 1

[State 1100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 41

[State 1100, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 1100, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
x = -0.33166875

[State 1100, Accel]
type = veladd
trigger1 = animelemtime(7) >= 0
y = 0.6633375

[State 1100, Vel]
type = velset
trigger1 = animelem = 5
x = ifelse(map(strength) = 2, 8.75, ifelse(map(strength) = 1, 8.50, 8.11))

[State 1100, Vel]
type = velset
trigger1 = animelem = 6
y = ifelse(map(strength) = 2, -13.22, ifelse(map(strength) = 1, -10.56, -7.91))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = animelem = 6
value = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0
channel = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 120, ifelse(map(strength) = 1, 110, 100)), ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 28, 25))
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -2.16, -8.81
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.81
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 32), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -2.16, -8.81
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.81
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 39), map(sparky) := -110
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1100, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = movecontact || movereversed
value = 1106

[State 1100, End]
type = changestate
triggerall = animelemtime(7) >= 0
trigger1 = map(strength) = 0 && time >= 22
trigger2 = map(strength) = 1 && time >= 25
trigger3 = time >= 28
value = 1105

[State 1100, End]
type = changestate
trigger1 = animelemtime(7) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1107


;----- Recover -----
[Statedef 1105]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1105
sprpriority = 2
movehitpersist = 1

[State 1105, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 1105, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1105, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 1105, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1107


;----- Bounce -----
[Statedef 1106]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1106
sprpriority = 2
movehitpersist = 1

[State 1106, Accel]
type = veladd
trigger1 = 1
y = 0.88445

[State 1106, Vel]
type = velset
trigger1 = !time
x = -1.62
y = -13.20

[State 1106, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1107


;----- Land -----
[Statedef 1107]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1107
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1107, Pos]
type = posset
trigger1 = 1
y = 0

[State 1107, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1107, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1107, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX CANNON SPIKE>=============================
[Statedef 1120]
type = S
physics = N
movetype = A
anim = 1120
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1120, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1120, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1120, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1120, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(27 * const(size.xscale)), ceil(-62 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
value = SCA
time = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 41

[State 1120, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1120, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 1120, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
x = -0.33166875

[State 1120, Accel]
type = veladd
trigger1 = animelemtime(7) >= 0
y = 0.6633375

[State 1120, Vel]
type = velset
trigger1 = animelem = 5
x = 9.75

[State 1120, Vel]
type = velset
trigger1 = animelem = 6
y = -13.22

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = animelem = 6
value = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0
channel = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 4

[State 1120, FX]
type = helper
trigger1 = animelem = 5 && !numhelper(1125)
helpertype = normal
stateno = 1125
ID = 1125
name = "EX Spike FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
dizzypoints = 100 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -2.16, -8.81
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.81
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 32), map(sparky) := -64
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.00, -12.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -12.00
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 39), map(sparky) := -110
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1120, End]
type = changestate
trigger1 = animelemtime(7) >= 0 && time >= 28
value = 1121

[State 1120, End]
type = changestate
trigger1 = animelemtime(7) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1123


;----- Recover -----
[Statedef 1121]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1105
sprpriority = 2
movehitpersist = 1

[State 1121, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 1121, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1121, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 1121, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1123


;----- Land -----
[Statedef 1123]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1107
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1123, Pos]
type = posset
trigger1 = 1
y = 0

[State 1123, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1123, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1123, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<AXLE SPIN KNUCKLE>=============================
[Statedef 1200]
type = S
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

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
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1200, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x > 152, 2, ifelse(p2bodydist x > 128, 1, 0))
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, NHB]
type = nothitby
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 1200, NHB]
type = nothitby
trigger1 = animelemtime(2) >= 0
value = , AP
time = 1

[State 1200, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = -1

[State 1200, Sound]
type = playsnd
trigger1 = animelemtime(3) = 1
value = 0, 102

[State 1200, Dust]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, Type]
type = statetypeset
trigger1 = animelemtime(3) = 1
statetype = A
physics = N

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
x = ifelse(map(strength) = 2, -0.2500, ifelse(map(strength) = 1, -0.1875, -0.1250))
y = 1.0
;x = ifelse(map(strength) = 2, -0.2211125, ifelse(map(strength) = 1, -0.1934734, -0.1243758))
;y = ifelse(map(strength) = 2, 0.9950063, ifelse(map(strength) = 1, 0.8291719, 0.7738938))

[State 1200, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = ifelse(map(strength) = 2, 9.50, ifelse(map(strength) = 1, 8.50, 7.50))
y = ifelse(map(strength) = 2, -7.50, ifelse(map(strength) = 1, -6.50, -5.50))
;x = ifelse(map(strength) = 2, 9.61, ifelse(map(strength) = 1, 9.10, 7.28))
;y = ifelse(map(strength) = 2, -7.53, ifelse(map(strength) = 1, -5.55, -5.22))

[State 1200, Push]
type = playerpush
trigger1 = statetype = A
trigger1 = vel y < 0 || pos y <= -24
trigger1 = map(strength) = 2
trigger1 = p2, backedgebodydist >= 8
value = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 0
channel = 0

[State 1200, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1201


;----- Punch -----
[Statedef 1201]
type = S
physics = S
movetype = A
anim = 1201
ctrl = 0
velset = 0, 0
facep2 = 1
sprpriority = 2

[State 1201, Pos]
type = posset
trigger1 = !time
y = 0

[State 1201, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1201, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1201, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 13
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.24
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 62), map(sparky) := -52
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1201, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 13
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.24
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1201, Anim]
type = assertspecial
trigger1 = anim = 1201
trigger1 = hitpausetime > 0
trigger1 = animelemtime(5) >= 1 && animelemtime(6) <= 0
flag = animatehitpause
ignorehitpause = 1

[State 1201, Type]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX AXLE SPIN KNUCKLE>=============================
[Statedef 1220]
type = S
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1220, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1220, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1220, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1220, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = 0 * const(size.xscale), -64 * const(size.yscale)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, NHB]
type = nothitby
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 1220, NHB]
type = nothitby
trigger1 = animelemtime(2) >= 0
value = , AP
time = 1

[State 1220, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = -1

[State 1220, Sound]
type = playsnd
trigger1 = animelemtime(3) = 1
value = 0, 102

[State 1220, Dust]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1220, Type]
type = statetypeset
trigger1 = animelemtime(3) = 1
statetype = A
physics = N

[State 1220, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
x = -0.25
y = 1.0

[State 1220, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = 12.5
y = -6.0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 0
channel = 0

[State 1220, End]
type = changestate
trigger1 = animelemtime(3) >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1221


;----- Punch -----
[Statedef 1221]
type = S
physics = S
movetype = A
anim = 1201
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1221, Pos]
type = posset
trigger1 = !time
y = 0

[State 1221, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1221, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1221, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1221, Sound]
type = playsnd
trigger1 = animelem = 2
value = 7, 4

[State 1221, FX]
type = helper
trigger1 = animelem = 2 && !numhelper(1225)
helpertype = normal
stateno = 1225
ID = 1225
name = "EX Knuckle FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1221, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.24
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 62), map(sparky) := -52
palfx.time = 30
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1221, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1221
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.24
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -64
palfx.time = 30
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1221, Anim]
type = assertspecial
trigger1 = anim = 1201
trigger1 = hitpausetime > 0
trigger1 = animelemtime(5) >= 1 && animelemtime(6) <= 0
flag = animatehitpause
ignorehitpause = 1

[State 1221, Pos]
type = posadd
trigger1 = animelem = 10
x = 24 * const(size.xscale)

[State 1221, Idle]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<HOOLIGAN COMBINATION>=============================
[Statedef 1300]
type = S
physics = N
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
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
value = ifelse(p2bodydist x < 40, 0, ifelse(p2bodydist x < 72, 1, 2))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 40

[State 1300, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1300, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1300, Pos]
type = posadd
trigger1 = animelem = 6
y = -40
persistent = 0

[State 1300, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.608059375

[State 1300, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = ifelse(map(strength) = 2, 7.315, ifelse(map(strength) = 1, 4.99, 2.66))
y = ifelse(map(strength) = 2, -7.24, ifelse(map(strength) = 1, -8.20, -9.24))

[State 1300, Kick]
type = changestate
triggerall = animelemtime(6) >= 1
triggerall = vel y >= 0 && pos y <= -48
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = p2statetype = C
trigger2 = p2bodydist x = [-8, 50]
value = 1315

[State 1300, Throw]
type = changestate
triggerall = animelemtime(6) >= 1
triggerall = vel y >= 0 && pos y <= -18
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = p2stateno = [120, 142] && p2bodydist x = [-20, 24]
trigger3 = AIlevel
trigger3 = p2bodydist x = [-20, 24] && random < 50
value = 1320

[State 1300, End]
type = changestate
trigger1 = animelemtime(6) >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1310


;----- Razor Edge Slicer -----
[Statedef 1310]
type = C
physics = N
movetype = A
ctrl = 0
sprpriority = 2

[State 1310, Pos]
type = posset
trigger1 = 1
y = 0

[State 1310, Vel]
type = velset
trigger1 = !time
y = 0

[State 1310, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1312, ifelse(map(strength) = 1, 1311, 1310))

[State 1310, Accel]
type = veladd
trigger1 = vel x > 0 && time
x = ifelse(map(strength) = 2, -0.60805938, ifelse(map(strength) = 1, -0.49750313, -0.38694688))

[State 1310, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1310, Sound]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0

[State 1310, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1310, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1310, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, SA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = ifelse(map(strength) = 2, 90, ifelse(map(strength) = 1, 83, 76)), ifelse(map(strength) = 2, 23, ifelse(map(strength) = 1, 21, 19))
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -1.0, -8.0
air.cornerpush.veloff = 0
yaccel = 0.695
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 78), map(sparky) := -6
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1310, Idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[State 1310, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Kick -----
[Statedef 1315]
type = A
physics = N
movetype = A
anim = 1315
ctrl = 0
velset = (vel x * 0.5), -3
sprpriority = 2
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State 1315, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 1
channel = 0

[State 1315, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1315, Pos]
type = posadd
trigger1 = !time
y = 40

[State 1315, Accel]
type = veladd
trigger1 = time
y = 0.608059375

[State 1315, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1315
attr = A, SA
hitflag = MAFD
guardflag = HA
priority = 4, Hit
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
down.hittime = 20
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.00, -4.00
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 66), map(sparky) := -30
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1315, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1316


;----- Land -----
[Statedef 1316]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1316
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1316, Pos]
type = posset
trigger1 = 1
y = 0

[State 1316, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1316, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1316, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Slammed Against Ground -----
[Statedef 5980]
type = A
physics = N
movetype = H
velset = 0, 0

[State 5980, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 5980, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = pos y < 0
value = 5030

[State 5980, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 5981


[Statedef 5981]
type = L
physics = N
movetype = H
velset = 0, 0

[State 5981, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

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
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 5981, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 5981, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -3

[State 5981, End]
type = changestate
trigger1 = !animtime
value = 5982


[Statedef 5982]
type = L
physics = N
movetype = H

[State 5982, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)

[State 5982, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 5982, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 5982, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 5982, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;----- Throw Attempt -----
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
sprpriority = 2

[State 1320, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1320, Grab High]
type = hitdef
triggerall = animelem = 1
triggerall = !map(unthrowable) && !map(grabbehind)
trigger1 = !AIlevel
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, ST
hitflag = M
priority = 7, Miss
getpower = 100 * map(meterscaling), 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -16
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 1
fall.xvelocity = 3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 1330
p2stateno = 1335

[State 1320, Grab Low]
type = hitdef
triggerall = animelem = 1
triggerall = p2statetype = A || p2dist y < -p2, const(size.mid.pos.y)
triggerall = !map(unthrowable) && !map(grabbehind)
trigger1 = !AIlevel
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, ST
hitflag = MAF
priority = 7, Miss
getpower = 100 * map(meterscaling), 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -16
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 1340
p2stateno = 1345

[State 1320, Accel]
type = veladd
trigger1 = 1
y = 0.608059375

[State 1320, Idle]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[State 1320, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1321


;----- Land -----
[Statedef 1321]
type = S
physics = S
movetype = I
anim = 1321
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1321, Pos]
type = posset
trigger1 = 1
y = 0

[State 1321, Ctrl]
type = ctrlset
trigger1 = time >= 3
value = 1

[State 1321, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1321, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1321, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1321, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<FATAL LEG TWISTER>=============================
[Statedef 1330]
type = A
physics = N
movetype = A
anim = 1330
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1330, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1330, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1335

[State 1330, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 1330, Width]
type = width
trigger1 = animelemtime(7) >= 0
edge = ceil(33 * const(size.xscale)), 0

[State 1330, Sprite Priority]
type = sprpriority
trigger1 = 1
value = 1

[State 1330, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
value = -1

[State 1330, Bind 1]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(2) < 0
pos = -12 * const(size.xscale), 70, Head

[State 1330, Bind 2]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 0, 64, Head

[State 1330, Bind 3]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = (32 * const(size.xscale)), 72, Head

[State 1330, Bind 1]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = (24 * const(size.xscale)), 86, Head

[State 1330, Bind 5]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = (18 * const(size.xscale)), 90, Head

[State 1330, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 24 * const(size.xscale), -68 * const(size.yscale)

[State 1330, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0
pos = -32 * const(size.yscale), 0

[State 1330, Bind Fix]
type = posset
trigger1 = pos y > 65 && animelemtime(6) < 0
y = 65

[State 1330, Bind Fix]
type = posset
trigger1 = pos y > 0
trigger1 = animelemtime(6) = 0
y = 0

[State 1330, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.77389375

[State 1330, Vel]
type = velset
trigger1 = animelem = 6
x = 1.579375
y = -5.25

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 0
channel = 0

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 2
value = 7, 3

[State 1330, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1331


;----- Slam -----
[Statedef 1331]
type = A
physics = N
movetype = A
anim = 1331
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1331, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = ceil(33 * const(size.xscale)), 0

[State 1331, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 1331, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = -32 * const(size.xscale), 0

[State 1331, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(-130 * map(damagescaling))
dizzy = 0
kill = 1

[State 1331, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-140 * map(damagescaling)) * !map(customcombo)

[State 1331, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 1331, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 1331, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 1336

[State 1331, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1337

[State 1331, Sound]
type = playsnd
trigger1 = !time
value = 4, 1
channel = 0

[State 1331, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 1331, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1331, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = -40 * const(size.xscale), 0
ownpal = 1

[State 1331, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = -40 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 1331, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 1.21611875

[State 1331, Vel]
type = velset
trigger1 = animelem = 2
x = 1.579375
y = -6.91

[State 1331, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1332


;----- Land -----
[Statedef 1332]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1332
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1332, Pos]
type = posset
trigger1 = 1
y = 0

[State 1332, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1332, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1332, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1335]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1335, Anim]
type = changeanim2
trigger1 = !time
value = 1335

[State 1335, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1335, Pos]
type = posset
trigger1 = !time
y = 0

[State 1335, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1336]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1336, Anim]
type = changeanim2
trigger1 = !time
value = 1336

[State 1336, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1336, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 1337]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1337, Anim]
type = changeanim2
trigger1 = !time
value = 1337

[State 1337, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1337, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel
[State 1337, Vel]
type = velset
trigger1 = !time
x = 5.32
y = -6.91

[State 1337, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1337, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1337, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;========================<CROSS SCISSOR PRESSURE>=============================
[Statedef 1340]
type = A
physics = N
movetype = A
anim = 1340
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1340, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1340, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1345

[State 1340, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 1340, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = ceil(26 * const(size.xscale)), 0

[State 1340, Width]
type = width
trigger1 = animelemtime(6) >= 0
edge = ceil(50 * const(size.xscale)), 0

[State 1340, Bind 1]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(2) < 0
pos = (24 * const(size.xscale)), 38, Mid

[State 1340, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 12 * const(size.xscale), -36 * const(size.yscale)

[State 1340, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -10 * const(size.xscale), -54 * const(size.yscale)

[State 1340, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 4 * const(size.xscale), -74 * const(size.yscale)

[State 1340, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 24 * const(size.xscale), -38 * const(size.yscale)

[State 1340, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0
pos = 54 * const(size.xscale), -6 * const(size.yscale)


[State 1340, Bind Fix]
type = posset
trigger1 = pos y > 0 && animelemtime(2) < 0
y = 0

[State 1340, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.386946875

[State 1340, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0 && vel x > 0
x = -0.055278125

[State 1340, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1340, Vel]
type = velset
trigger1 = animelem = 2
x = 4.53
y = -5.94

[State 1340, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 0
channel = 0

[State 1340, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1341


;----- Slam -----
[Statedef 1341]
type = A
physics = N
movetype = A
anim = 1341
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1341, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = ceil(50 * const(size.xscale)), 0

[State 1341, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 1341, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 52 * const(size.xscale), 0

[State 1341, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(-140 * map(damagescaling))
dizzy = 0
kill = 1

[State 1341, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 1341, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 1341, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 1341, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 1346

[State 1341, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1347

[State 1341, Sound]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0

[State 1341, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 1341, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1341, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 52 * const(size.xscale), 0
ownpal = 1

[State 1341, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 52 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 1341, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.41458598

[State 1341, Vel]
type = velset
trigger1 = animelem = 2
x = -2.66
y = -6.59

[State 1341, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1342


;----- Land -----
[Statedef 1342]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1342
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1342, Pos]
type = posset
trigger1 = 1
y = 0

[State 1342, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1342, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1342, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1345]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1345, Anim]
type = changeanim2
trigger1 = !time
value = 1345

[State 1345, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1345, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1346]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1346, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1346, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 1346, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1346, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1346, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 1347]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1347, Anim]
type = changeanim
trigger1 = !time
value = 5160

[State 1347, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1347, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel
[State 1347, Vel]
type = velset
trigger1 = !time
x = -5.32
y = -6.91

[State 1347, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1347, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1347, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;========================<CANNON STRIKE>=============================
[Statedef 1400]
type = A
physics = N
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1400, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1400, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0 && vel x > 0
x = -0.033166875

[State 1400, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.6633375

[State 1400, Vel]
type = velset
trigger1 = animelem = 4
x = ifelse(map(strength) = 2, 6.65, ifelse(map(strength) = 1, 5.49, 4.32))
y = 4

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1400
attr = A, SA
hitflag = MAFD
guardflag = HA
priority = 4, Hit
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
air.hittime = 120
airguard.ctrltime = 1 + 16
down.hittime = 20
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.25
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 36), map(sparky) := 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1400, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1403


;----- Land -----
[Statedef 1403]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1403
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1403, Pos]
type = posset
trigger1 = 1
y = 0

[State 1403, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1403, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1403, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX CANNON STRIKE>=============================
[Statedef 1420]
type = A
physics = N
movetype = A
anim = 1420
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1420, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1420, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1420, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1420, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(14 * const(size.xscale)), ceil(-24 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1420, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0 && vel x > 0
x = -0.033166875

[State 1420, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1420, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.6633375

[State 1420, Vel]
type = velset
trigger1 = animelem = 4
x = 7.81
y = 4

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 4

[State 1420, FX]
type = helper
trigger1 = animelem = 3 && !numhelper(1425)
helpertype = normal
stateno = 1425
ID = 1425
name = "EX Strike FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1420, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1420
attr = A, SA
hitflag = MAFD
guardflag = HA
priority = 4, Hit
damage = 80, 20
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
down.hittime = 20
ground.velocity = -4.00, -7.50
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.0, -7.50
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 36), map(sparky) := 2
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1420, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1421


;----- Land -----
[Statedef 1421]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1421
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1421, Pos]
type = posset
trigger1 = 1
y = 0

[State 1421, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1421, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1421, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<CANNON REVENGE>=============================
;----- High -----
[Statedef 1500]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

[State 1500, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 0
channel = 0

[State 1500, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
;channel = 1
stopongethit = 1

[State 1500, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
attr =
reversal.attr = SC, NA
pausetime = 0, 16
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1505
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
persistent = 0

[State 1500, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1500, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- High Counter -----
[Statedef 1505]
type = S
physics = S
movetype = A
anim = 1505
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 0

[State 1505, Spark]
type = explod
trigger1 = !time
trigger1 = map(cfg_sparks)
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = 25 * const(size.xscale), -76 * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1505, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 11
value = 1, 2
;channel = 1
stopongethit = 1

[State 1505, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, -5.53
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = 0, -5.53
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 78), map(sparky) := -66
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1505, Hit]
type = hitdef
trigger1 = animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -8.0, -5.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -8.0, -5.0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1505, Anim]
type = changeanim
trigger1 = anim = 1505
trigger1 = movecontact = 1 && hitpausetime
trigger1 = anim = 1505 && animelemtime(13) >= 0 && animelemtime(14) <= 0
trigger1 = hitpausetime <= 6
value = 1505
elem = 14
ignorehitpause = 1

[State 1505, Idle]
type = statetypeset
trigger1 = animelem = 16
movetype = I

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Low -----
[Statedef 1510]
type = S
physics = S
movetype = A
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 0
channel = 0

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 0
;channel = 1
stopongethit = 1

[State 1510, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1510, Reversal]
type = reversaldef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
attr =
reversal.attr = SC, NA
pausetime = 0, 16
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1515
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0
persistent = 0

[State 1510, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1510, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Low Counter -----
[Statedef 1515]
type = S
physics = S
movetype = A
anim = 1515
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 0

[State 1515, Spark]
type = explod
trigger1 = !time
trigger1 = map(cfg_sparks)
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = 25 * const(size.xscale), -18 * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1515, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 9
value = 1, 5
;channel = 1
stopongethit = 1

[State 1515, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 1.50, -6
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = 1.50, -6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 107), map(sparky) := -13
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1515, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 200 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -1.0, -10.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -1.0, -10.0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 52), map(sparky) := -114
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1515, Juggle Reset]
type = mapset
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = animelemtime(10) >= 0
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 1515, Anim]
type = changeanim
trigger1 = anim = 1515
trigger1 = movecontact = 1 && hitpausetime
trigger1 = anim = 1515 && animelemtime(10) >= 0 && animelemtime(11) <= 0
trigger1 = hitpausetime <= 6
value = 1515
elem = 11
ignorehitpause = 1

[State 1515, Idle]
type = statetypeset
trigger1 = animelem = 12
movetype = I

[State 1515, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<SNIPING ARROW>=============================
[Statedef 1600]
type = S
physics = N
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1600, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1600, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x > 240, 2, ifelse(p2bodydist x > 206, 1, 0))
ignorehitpause = 1

[State 1600, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1600, Startup]
type = changeanim
trigger1 = map(strength) = 0
trigger1 = animelemtime(2) = -1 || animelemtime(3) = -1 || animelemtime(4) = -1 || animelemtime(5) = -1
trigger2 = map(strength) = 1
trigger2 = animelemtime(2) = -1 || animelemtime(4) = -1
value = 1600
elem = animelemno(0) + 1

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 41

[State 1600, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1600, Pos]
type = posadd
trigger1 = animelem = 5
x = ifelse((p2bodydist x = [0, 32]), p2bodydist x, 32) * const(size.xscale)

[State 1600, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 1600, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
x = 0.11055625
y = 0.6633375

[State 1600, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = ifelse(map(strength) = 2, 9.83, ifelse(map(strength) = 1, 7.68, 5.54))
y = -5.24

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 4
channel = 0

[State 1600, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 110, ifelse(map(strength) = 1, 100, 90)), ifelse(map(strength) = 2, 27, ifelse(map(strength) = 1, 25, 23))
dizzypoints = 150 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -5.32, -7.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.25
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 84), map(sparky) := -61
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1600, End]
type = changestate
trigger1 = animelemtime(6) >= 1
trigger1 = (pos y -8) > -vel y
value = 1603


;----- Land -----
[Statedef 1603]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1603
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1603, Pos]
type = posset
trigger1 = 1
y = 0

[State 1603, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 52

[State 1603, Dust]
type = explod
trigger1 = animelem = 2
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1603, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX SNIPING ARROW>=============================
[Statedef 1620]
type = S
physics = N
movetype = A
anim = 1620
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1620, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1620, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1620, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1620, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(24 * const(size.xscale)), ceil(-53 * const(size.xscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1620, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1620, Pos]
type = posadd
trigger1 = animelem = 5
x = ifelse((p2bodydist x = [0, 32]), p2bodydist x, 32) * const(size.xscale)

[State 1620, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 1620, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
x = 0.11055625
y = 0.6633375

[State 1620, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = 9.83
y = -5.24

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 5
channel = 0

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 6
value = 7, 4

[State 1620, FX]
type = helper
trigger1 = animelem = 6 && !numhelper(1025)
helpertype = normal
stateno = 1025
ID = 1025
name = "EX Drill FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1620, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 35, 9
dizzypoints = 50 * !map(customcombo)
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -52
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1620, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 90, 23
dizzypoints = 150 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -5.32, -10.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.32, -10.0
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 84), map(sparky) := -61
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1620, End]
type = changestate
trigger1 = animelemtime(6) >= 1
trigger1 = (pos y -8) > -vel y
value = 1603


;========================<EARTH DIRECT>=============================
[Statedef 1700]
type = S
physics = S
movetype = A
anim = 1700
ctrl = 0
velset = 0, 0
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

[State 1700, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1700, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x <= 24, 2, ifelse(p2bodydist x <= 28, 1, 0))
ignorehitpause = 1

[State 1700, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1700, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1700, Hit]
type = hitdef
triggerall = animelem = 3
triggerall = !map(unthrowable) && !map(grabbehind)
trigger1 = map(strength) = 0 && p2dist x >= 0 && map(truebodydistx) <= 32
trigger2 = map(strength) = 1 && p2dist x >= 0 && map(truebodydistx) <= 28
trigger3 = map(strength) = 2 && p2dist x >= 0 && map(truebodydistx) <= 24
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -50
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 1710
p2stateno = 1715

[State 1700, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 8
channel = 0

[State 1700, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
;channel = 1
stopongethit = 1

[State 1700, Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Throw -----
[Statedef 1710]
type = A
physics = N
movetype = A
anim = 1710
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1710, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1710, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1715

[State 1710, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 1710, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 0, 0

[State 1710, Bind 2]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger3 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = 18 * const(size.xscale), -40 * const(size.yscale)

[State 1710, Bind 3]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger3 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = -12 * const(size.xscale), -48 * const(size.yscale)

[State 1710, Bind 4]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger3 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = -24 * const(size.xscale), -21 * const(size.yscale)

[State 1710, Bind 5]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger3 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = 14 * const(size.xscale), -4 * const(size.yscale)

[State 1710, Bind 14]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(14) >= 0
pos = 12 * const(size.xscale), -20 * const(size.yscale)

[State 1710, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
x = 0
y = 0.88445

[State 1710, Vel]
type = velset
trigger1 = animelem = 2
x = -3.325
y = ifelse(map(strength) = 2, -18.52, ifelse(map(strength) = 1, -16.09, -15.44))

[State 1710, Sound]
type = playsnd
trigger1 = animelem = 10
value = 4, 6
channel = 0

[State 1710, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1, 5
;channel = 1
stopongethit = 1

[State 1710, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 1710, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1710, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1711


;----- Slam -----
[Statedef 1711]
type = A
physics = N
movetype = A
anim = 1711
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1711, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 1711, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 0, 0

[State 1711, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * ifelse(map(strength) = 2, -160, ifelse(map(strength) = 1, -150, -140)))
dizzy = 0
kill = 1

[State 1711, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 1711, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 1711, Get Power]
type = poweradd
trigger1 = !time
value = 200 * map(meterscaling); getpower

[State 1711, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 1711, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 1716

[State 1711, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1717

[State 1711, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

;[State 1711, Spark]
;in ZSS

[State 1711, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 1711, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1711, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 0, 0
ownpal = 1

[State 1711, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
sprpriority = -10
ownpal = 1

[State 1711, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.34375

[State 1711, Vel]
type = velset
trigger1 = animelem = 2
x = -2.66
y = -6.00

[State 1711, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1712


;----- Land -----
[Statedef 1712]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1712
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1712, Pos]
type = posset
trigger1 = 1
y = 0

[State 1712, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1712, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1712, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1715]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1715, Anim]
type = changeanim2
trigger1 = !time
value = 1715

[State 1715, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1715, Pos]
type = posset
trigger1 = !time
y = 0

[State 1715, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1716]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1716, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1716, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1716, Anim]
type = changeanim
trigger1 = !time
value = 5080

[State 1716, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1716, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 1717]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1717, Anim]
type = changeanim2
trigger1 = !time
value = 1717

[State 1717, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1717, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel
[State 1717, Vel]
type = velset
trigger1 = !time
x = -5.32
y = -6.91

[State 1717, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1717, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1717, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;========================<EX EARTH DIRECT>=============================
[Statedef 1730]
type = S
physics = S
movetype = A
anim = 1700
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1730, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1730, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1730, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1730, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(16 * const(size.xscale)), ceil(-58 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1730, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1730, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 32
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -50
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 1740
p2stateno = 1745

[State 1730, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 8
channel = 0

[State 1730, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
;channel = 1
stopongethit = 1

[State 1730, Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1730, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Throw -----
[Statedef 1740]
type = A
physics = N
movetype = A
anim = 1740
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1740, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1740, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1745

[State 1740, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 1740, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 0, 0

[State 1740, Bind 2]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger3 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger4 = animelemtime(14) >= 0 && animelemtime(15) < 0
pos = 18 * const(size.xscale), -40 * const(size.yscale)

[State 1740, Bind 3]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger3 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger4 = animelemtime(15) >= 0 && animelemtime(16) < 0
pos = -12 * const(size.xscale), -48 * const(size.yscale)

[State 1740, Bind 4]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger3 = animelemtime(12) >= 0 && animelemtime(13) < 0
trigger4 = animelemtime(16) >= 0 && animelemtime(17) < 0
pos = -24 * const(size.xscale), -21 * const(size.yscale)

[State 1740, Bind 5]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger3 = animelemtime(13) >= 0 && animelemtime(14) < 0
trigger4 = animelemtime(17) >= 0 && animelemtime(18) < 0
pos = 14 * const(size.xscale), -4 * const(size.yscale)

[State 1740, Bind 18]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(18) >= 0
pos = 12 * const(size.xscale), -20 * const(size.yscale)

[State 1740, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
x = 0
y = 0.88445

[State 1740, Vel]
type = velset
trigger1 = animelem = 2
x = -3.325
y = -21

[State 1740, Sound]
type = playsnd
trigger1 = animelem = 10
value = 4, 6
channel = 0

[State 1740, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15
value = 1, 5
;channel = 1
stopongethit = 1

[State 1740, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 1740, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1740, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1741


;----- Slam -----
[Statedef 1741]
type = A
physics = N
movetype = A
anim = 1741
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1741, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 1741, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 0, 0

[State 1741, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * -160)
dizzy = 0
kill = 1

[State 1741, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-200 * map(damagescaling)) * !map(customcombo)

[State 1741, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 1741, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 1741, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 1716

[State 1741, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 1717

[State 1741, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

[State 1741, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

;[State 1741, Spark]
;in ZSS

[State 1741, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 1741, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1741, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 0, 0
ownpal = 1

[State 1741, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
sprpriority = -10
ownpal = 1

[State 1741, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.34375

[State 1741, Vel]
type = velset
trigger1 = animelem = 2
x = -2.66
y = -6.00

[State 1741, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1712


;----- Target -----
[Statedef 1745]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1745, Anim]
type = changeanim2
trigger1 = !time
value = 1745

[State 1745, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1745, Pos]
type = posset
trigger1 = !time
y = 0


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
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
;channel = 1
stopongethit = 1

[State 2900, Hit]
type = hitdef
trigger1 = animelem = 4
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
kill = 0

[State 2900, Idle]
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
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 2910, Hit]
type = hitdef
trigger1 = animelem = 3
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -44
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
kill = 0

[State 2910, Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
