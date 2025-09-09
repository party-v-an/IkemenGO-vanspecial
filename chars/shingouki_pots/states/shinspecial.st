; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<GOU HADOU KEN>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 50 * map(meterscaling)
sprpriority = 2
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

[State 1000, Width]
type = width
trigger1 = animelemtime(5) = -1
value = 20, 0

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1000, Hadouken]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 78, -67
size.xscale = 0.375
size.yscale = 0.375
ownpal = 1

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 3
channel = 0

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHAKUNETSU HADOU KEN>=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
poweradd = 50 * map(meterscaling)
sprpriority = 2
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

[State 1020, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1020, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(ai_combowindow) = [11, 16], 0, ifelse(map(ai_combowindow) = [17, 23] || random < 500, 1, 2))
ignorehitpause = 1

[State 1020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1020, Width]
type = width
trigger1 = animelemtime(10) = -1
value = 20, 0

[State 1020, Anim]
type = changeanim
trigger1 = map(strength) = 0 && animelem = 5
trigger2 = map(strength) = 1 && animelem = 7
value = 1020
elem = 9
persistent = 0

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 10
value2 = SCA, AA, AT
time = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 10
helpertype = normal; projectile
stateno = 1025
ID = 1025
name = "Hadouken"
postype = p1
pos = 78, -67
size.xscale = ifelse(map(strength) = 2, 0.50, ifelse(map(strength) = 1, 0.45, 0.40))
size.yscale = ifelse(map(strength) = 2, 0.50, ifelse(map(strength) = 1, 0.45, 0.40))
ownpal = 1

[State 1020, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
persistent = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 9
value = 3, 0
channel = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 10
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<BURNED>=============================
[Statedef 7697]
type = U
physics = N
movetype = H
velset = 0, 0

[State 7697, End]
type = selfstate
trigger1 = !selfanimexist(7697)
value = 5020

[State 7697, Type]
type = statetypeset
trigger1 = statetype != A
trigger1 = gethitvar(fall) || gethitvar(yvel) || pos y || vel y
statetype = A
persistent = 0

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3,5]
value = ifelse((gethitvar(airtype) = 1), 5000, 5010) + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3,5]
value = 5030

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4,5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !hitshakeover
value = anim

[State 7697, Anim]
type = changeanim
trigger1 = hitshakeover
trigger1 = anim != 7697
value = 7697

[State 7697, Accel]
type = veladd
trigger1 = hitshakeover
trigger1 = statetype = A
y = gethitvar(yaccel)

[State 7697, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1
persistent = 0

[State 7697, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = vel y > 0
trigger1 = !hitfall
value = 5040

[State 7697, Fall Recovery]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
value = 5200

[State 7697, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;======================<ZANKUU HADOU KEN>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
facep2 = 1
poweradd = 50 * map(meterscaling)
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
value = ifelse((p2movetype = H || random < 333), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1050, Accel]
type = gravity
trigger1 = 1

[State 1050, Width]
type = width
trigger1 = animelemtime(2) = -1 || animelemtime(5) = -1
player = 27, 0

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 2 || animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1050, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 5
helpertype = normal; projectile
stateno = 1055
ID = ifelse((animelem = 5), 1055, 1056)
name = "Hadouken"
postype = p1
pos = ifelse((animelem = 2), 54, 67), ifelse((animelem = 2), -48, -48)
size.xscale = 0.375
size.yscale = 0.375
ownpal = 1

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 3, 10
channel = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 5, 0
;channel = 1
stopongethit = 1

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


;======================<GOU SHORYUU KEN>=============================
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
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
value = ifelse((p2movetype = H && p2statetype = A), 2, 0)
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
trigger1 = anim = 1100
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.667

[State 1100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 1
trigger2 = anim = 1101
y = ifelse(map(strength) = 2, 0.672, ifelse(map(strength) = 1, 0.663, 0.647))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelem = 2
x = ifelse(map(strength) = 2, 10.0, ifelse(map(strength) = 1, 8.0, 6.0))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = [0, 1]
y = ifelse(map(strength) = 2, -13.784, ifelse(map(strength) = 1, -10.934, -8.083))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 0
value = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 1
value = 0, ifelse(map(strength) = 0, 40, 41)

[State 1100, Dust]
type = explod
trigger1 = anim = 1100
trigger1 = animelem = 2
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

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
trigger1 = animelem = 4
value = 3, 9
channel = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 1100
trigger2 = animelem = 3 && anim = 1100
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (ifelse(map(strength) = 2, 3, ifelse(map(strength) = 1, 2, 1)) + ifelse((animelem = 3), 1, 0)))
damage = ifelse(map(strength) = 2, 40, ifelse(map(strength) = 1, 35, 30)), ifelse(map(strength) = 2, 10, ifelse(map(strength) = 1, 9, 8))
attr = S, SA
dizzypoints = ifelse(map(strength) = 2, 50, ifelse(map(strength) = 1, 42, 34)) * !map(customcombo)
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := ifelse((animelem = 2), -52, -75)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.0, ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
air.type = Low
air.velocity = -3.0, ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 1100, Hit Midair]
type = hitdef
trigger1 = animelem = 4 && anim = 1100
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse(map(strength) = 2, 5, ifelse(map(strength) = 1, 4, 3)))
attr = A, SA
damage = 50, 13
dizzypoints = ifelse(map(strength) = 2, 50, ifelse(map(strength) = 1, 42, 34)) * !map(customcombo)
animtype = Up
air.animtype = Up
fall.animtype = Up
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 10) * (map(sparkx.max) := 30), map(sparky) := -100
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.0, ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
air.type = Low
air.velocity = -3.0, ifelse(map(strength) = 2, -9.0, ifelse(map(strength) = 1, -7.5, -6.0))
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Hit Midair Hard Anim]
redirectID = p2, ID
type = gethitvarset
trigger1 = movehit = 1
trigger1 = movehitvar(frame)
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 0
trigger1 = p2movetype = H
trigger1 = p2dist y <= -60
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID
animtype = 2
ignorehitpause = 1

[State 1100, Blur FX]
type = explod
trigger1 = anim = 1100
trigger1 = animelem = 4
ID = 1190
anim = 1190
postype = p1
pos = 32, -80
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 6, 4))
interpolation.time = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 6, 4))
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100
trigger1 = animelem = 4
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100
trigger1 = animelemtime(4) > 0
trigger1 = vel y > (ifelse(map(strength) = 2, -5.3, ifelse(map(strength) = 1, -4, -2.7)))
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


;======================<TATSUMAKI ZANKUU KYAKU>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
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
value = ifelse(p2bodydist x < 25, 0, 1)
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, Sound]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 3, 11
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7104
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 1200
value = 1201

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = N

[State 1200, Accel]
type = veladd
trigger1 = anim = 1200
trigger1 = animelemtime(1) >= 1
trigger2 = anim = 1205
y = 0.5

[State 1200, Vel]
type = velset
trigger1 = anim = 1200
trigger1 = animelemtime(1) >= 1
trigger2 = anim = 1201
x = 3.50

[State 1200, Vel]
type = velset
trigger1 = anim = 1200
trigger1 = animelemtime(1) = 1
y = -5.15

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
y = 0

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1201
trigger1 = ifelse(map(strength) = 2, !animtime, ifelse(map(strength) = 1, animelemtime(13) >= 0, animelemtime(7) >= 0))
value = 1205

[State 1200, Sound]
type = playsnd
trigger1 = anim = 1201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19
value = 1, 6
;channel = 1
stopongethit = 1

[State 1200, Blur FX]
type = explod
trigger1 = anim = 1201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19
ID = 1290
anim = 1291
postype = p1
pos = 0, -80
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1200, Blur FX]
type = explod
trigger1 = anim = 1201
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22
ID = 1290
anim = 1290
postype = p1
pos = 0, -60
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1200, Hit First]
type = hitdef
trigger1 = anim = 1200 && animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse(map(strength) = 2, 3, ifelse(map(strength) = 1, 2, 1)))
attr = A, SA
damage = 30, 8
dizzypoints = 25 * !map(customcombo)
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 10) * (map(sparkx.max) := 30), map(sparky) := ifelse((anim = 1200), -62, -69)
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -3.5, ifelse(map(strength) = 1, -3.0, -2.5)), -6.8
air.type = Low
air.velocity = ifelse(map(strength) = 2, -3.5, ifelse(map(strength) = 1, -3.0, -2.5)), -6.8
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type = hitdef
trigger1 = anim = 1201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 3, 2)))
attr = A, SA
damage = 50, 13
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := ifelse((anim = 1200), -62, -69)
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -3.5, ifelse(map(strength) = 1, -3.0, -2.5)), -6.8
air.type = Low
air.velocity = ifelse(map(strength) = 2, -3.5, ifelse(map(strength) = 1, -3.0, -2.5)), -6.8
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit Behind]
type = hitdef
trigger1 = anim = 1201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SA
damage = 40, 10
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -55) * (map(sparkx.max) := -20), map(sparky) := -70
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, 3.5, ifelse(map(strength) = 1, 3.0, 2.5)), -6.8
air.type = Low
air.velocity = ifelse(map(strength) = 2, 3.5, ifelse(map(strength) = 1, 3.0, 2.5)), -6.8
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = 6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I

[State 1200, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1209


;---Land---
[Statedef 1209]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1209, Pos]
type = posset
trigger1 = 1
y = 0

[State 1209, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1209, Dust]
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

[State 1209, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR TATSUMAKI ZANKUU KYAKU>=============================
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
poweradd = 100 * map(meterscaling)
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

[State 1250, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1250, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

[State 1250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1250, Accel]
type = veladd
trigger1 = animelemtime(28) >= 0
y = const(movement.yaccel)

[State 1250, Accel]
type = veladd
trigger1 = animelemtime(28) < 0
y = ifelse(map(strength) = 2, 0.405, ifelse(map(strength) = 1, 0.355, 0.304))

[State 1250, Vel]
type = veladd
trigger1 = !time
trigger1 = abs(vel x) < 5
x = ifelse(vel x < 0, -1, 1) * ifelse(map(strength) = 2, 2.0, ifelse(map(strength) = 1, 1.5, 1.0))

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, 11
channel = 0

[State 1250, Sound]
type = playsnd
trigger1 = anim = 1250
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22
value = 1, 6
;channel = 1
stopongethit = 1

[State 1250, Blur FX]
type = explod
trigger1 = anim = 1250
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22
ID = 1290
anim = 1291
postype = p1
pos = 0, -80
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1250, Blur FX]
type = explod
trigger1 = anim = 1250
trigger1 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
ID = 1290
anim = 1290
postype = p1
pos = 0, -60
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1250, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, SA
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -69
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.0, -7.5
air.type = Low
air.velocity = -3.0, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, Hit Behind]
type = hitdef
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, SA
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -55) * (map(sparkx.max) := -20), map(sparky) := -70
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 3.0, -7.5
air.type = Low
air.velocity = 3.0, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259


;---Land---
[Statedef 1259]
type = S
physics = S
movetype = I
anim = 1259
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1259, Pos]
type = posset
trigger1 = 1
y = 0

[State 1259, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1259, Dust]
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

[State 1259, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKKI SHU>=============================
[Statedef 1300]
type = A
physics = N
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
sprpriority = 2
facep2 = 1

[State 1300, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1300, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2dist x - 20 * p2, vel x * 20) >= 120, 2, ifelse((p2dist x - 20 * p2, vel x * 20) >= 70, 1, 0))
ignorehitpause = 1

[State 1300, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
trigger1 = numenemy
trigger1 = p2, hitfall
map = "strength"
value = ifelse(p2dist x >= 120, 2, ifelse(p2dist x >= 75, 1, 0))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1300, Sound]
type = playsnd
trigger1 = !time
value = 3, 1
channel = 0

[State 1300, Sound]
type = playsnd
trigger1 = !time
value = 0, 40

[State 1300, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.90
volumescale = 80

[State 1300, Accel]
type = veladd
trigger1 = 1
y = 0.623

[State 1300, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.00, ifelse(map(strength) = 1, 3.25, 1.50))
y = -10.590

[State 1300, Gou Shou]
type = changestate
triggerall = vel y > 0
triggerall = animelemtime(14) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = p2statetype = C || p2stateno = [120, 132]
trigger2 = p2dist x = [0, ifelse(p2stateno = [120, 132], 40, 80)]
trigger2 = p2dist y = [-40, 40]
trigger2 = random < (300 * (AIlevelF / 8.0))
trigger3 = AIlevel
trigger3 = p2, ctrl || p2dist x < 0 || p2stateno = 5120
trigger3 = random < (300 * (AIlevelF / 8.0))
value = 1320

[State 1300, Gou Jin]
type = changestate
triggerall = vel y > 0
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = p2statetype = S || p2statetype = C || p2statetype = A
trigger2 = p2dist x = [0, ifelse(p2stateno = [120, 132], 40, 80)]
trigger2 = p2dist y >= 0
trigger2 = random < (300 * (AIlevelF / 8.0))
value = 1330

[State 1300, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1310


;=========<HYAKKI GOU ZAN>==========
;--- SLIDE ---
[Statedef 1310]
type = S
physics = S
movetype = A
anim = 1310
poweradd = 0
velset = vel x, 0
sprpriority = 2
ctrl = 0
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State 1310, Width]
type = width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
value = 30

[State 1310, Pos]
type = posset
trigger1 = !time
y = 0

[State 1310, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1310, Dust]
type = explod
trigger1 = !time
anim = 7103
sprpriority = 3
postype = p1
pos = 25, 0
vel = 1, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1310, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 9
channel = 0

[State 1310, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
;channel = 1
stopongethit = 1

[State 1310, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1310
attr = S, SA
damage = 80, 20
dizzypoints = 100 * !map(customcombo)
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = L
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 100), map(sparky) := -18
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.slidetime = 12
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -1.66, -6.85
air.type = Trip
air.velocity = -1.66, -6.85
yaccel = 0.695
down.velocity = -1.66, -6.85
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1

[State 1310, Anim]
type = changeanim
trigger1 = anim = 1310
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 1310
elem = 3
ignorehitpause = 1

[State 1310, Blur FX]
type = explod
trigger1 = animelem = 2
ID = 1190
anim = 1190
postype = p1
pos = 50, -20
angle = -105
scale = 0.75, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 5
interpolation.time = 5
interpolation.alpha = 0, 256
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 1310, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<HYAKKI GOU SHOU>==========
;----- PALM -----
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
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

[State 1320, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1

[State 1320, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 0
channel = 0

[State 1320, Blur FX]
type = explod
trigger1 = animelem = 3
ID = 1190
anim = 1190
postype = p1
pos = 25, -90
angle = 200
scale = -0.75, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 4
interpolation.time = 4
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1320, Accel]
type = veladd
trigger1 = time
y = 0.623

[State 1320, Grab]
type = hitdef
trigger1 = animelem = 1
trigger1 = command = "holdfwd" || command = "holdback" || AIlevel
trigger1 = !map(unthrowable) && !map(grabbehind)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1340
attr = A, ST
hitflag = M
priority = 7, Miss
hitsound = s2, 800
hitsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 0)
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 1340
p2stateno = 1345
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 1320, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1320
attr = A, SA
damage = 100, 25
dizzypoints = 150 * !map(customcombo)
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 15) * (map(sparkx.max) := 45), map(sparky) := -55
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, 12.0
air.type = Low
air.velocity = -4.0, 12.0
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1321


;---Land---
[Statedef 1321]
type = S
physics = S
movetype = I
anim = 1321
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1321, Pos]
type = posset
trigger1 = 1
y = 0

[State 1321, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1321, Dust]
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

[State 1321, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Slammed Against Ground -----
[Statedef 1390]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1390, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 1390, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = pos y < 0
value = 5030

[State 1390, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 1391


[Statedef 1391]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1391, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 1391, Pos]
type = posset
trigger1 = 1
y = 0

[State 1391, Damage]
type = hitfalldamage
trigger1 = !time

[State 1391, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1391, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1391, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -3

[State 1391, End]
type = changestate
trigger1 = !animtime
value = 1392


[Statedef 1392]
type = L
physics = N
movetype = H

[State 1392, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)

[State 1392, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 1392, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 1392, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 1392, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;=========<HYAKKI GOU JIN>==========
;----- DIVE -----
[Statedef 1330]
type = A
physics = N
movetype = A
anim = 1330
velset = 0, 0
ctrl = 0
poweradd = 0
sprpriority = 2
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

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

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0

[State 1330, Vel]
type = velset
trigger1 = animelemtime(4) > 0
x = 6.67
y = 10.0

[State 1330, Grab]
type = hitdef
trigger1 = animelem = 1
trigger1 = command = "holdfwd" || command = "holdback" || AIlevel
trigger1 = !map(unthrowable) && !map(grabbehind)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1350
attr = A, ST
hitflag = MAF
priority = 7, Miss
hitsound = s2, 800
hitsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 0)
sprpriority = 2
p1facing = -1
p2facing = 1
p1stateno = 1350
p2stateno = 1355
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
numhits = 0

[State 1330, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1330
attr = A, SA
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -7
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -8, 8
yaccel = 0.4850
down.hittime = 30
down.velocity = 0, 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1330, Blur FX]
type = explod
trigger1 = animelem = 4
ID = 1190
anim = 1190
postype = p1
pos = 0, -35
angle = -120
scale = 0.75, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 5
interpolation.time = 5
interpolation.alpha = 0, 256
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1331


;---Land---
[Statedef 1331]
type = S
physics = S
movetype = I
anim = 1331
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1331, Pos]
type = posset
trigger1 = 1
y = 0

[State 1331, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1331, Dust]
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

[State 1331, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKKI GOU SAI>=============================
;----- PUNCH THROW -----
[Statedef 1340]
type = A
physics = N
movetype = A
anim = 1340
ctrl = 0
velset = 0, 0

[State Throw]
type = targetstate
trigger1 = !time
value = 1345

[State 1340, Sound]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 1340, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1
stopongethit = 1

[State 1340, Vel]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0

[State 1340, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 1.0

[State 1340, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = 2
y = -10

[State 1340, Width]
type = width
trigger1 = animelemtime(5) >= 0
edge = 32, 0

[State 1340, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
trigger1 = numtarget
pos = 0, 40 + (target, const(size.head.pos.y))

[State 1340, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -12, -50

[State 1340, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -28, -64

[State 1340, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 4, -96

[State 1340, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 14, -100

[State 1340, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0
pos = 12, -112

[State 1340, Spr 1]
type = sprpriority
trigger1 = animelemtime(1) >= 0 && animelemtime(5) < 0
value = 1

[State 1340, Spr 2]
type = sprpriority
trigger1 = animelemtime(5) >= 0
value = -1

[State 1340, End]
type = changestate
trigger1 = animelemtime(3) > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1341


;----- HIT FLOOR -----
[Statedef 1341]
type = C
physics = C
movetype = A
anim = 1341
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1341, Pos]
type = posadd
trigger1 = !time
x = 13

[State 1341, Throw]
type = targetstate
trigger1 = !time
value = 1346

[State 1341, Pos]
type = posset
trigger1 = 1
y = 0

[State 1341, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 12, -68

[State 1341, Bind 2]
type = targetbind
trigger1 = animelem = 2
pos = 16, -36

[State 1341, Damage]
type = hitadd
trigger1 = animelem = 2
value = 1

[State 1341, Damage]
type = targetlifeadd
trigger1 = animelem = 2
value = floor(-100 * map(damagescaling))
dizzy = 0

[State 1341, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 2
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 1341, Give Power]
type = targetpoweradd
trigger1 = animelem = 2
value = 40; givepower

[State 1341, Get Power]
type = poweradd
trigger1 = animelem = 2
value = 200 * map(meterscaling); getpower

[State 1341, Sound]
type = playsnd
trigger1 = !time
value = 3, 11
channel = 0

[State 1341, Dust]
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

[State 1341, Sound]
type = playsnd
trigger1 = animelem = 2
value = 2, 3
channel = 2

[State 1341, Shake]
type = envshake
trigger1 = animelem = 2
time = 18
freq = 180
ampl = 2

;[State 1341, Spark]
;in ZSS

[State 1341, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- TARGET -----
[Statedef 1345]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1345, Anim]
type = changeanim2
trigger1 = !time
value = 1345

[State 1345, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1345, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- TARGET HIT FLOOR -----
[Statedef 1346]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 1

[State 1346, Anim]
type = changeanim2
trigger1 = !time
value = 1346

[State 1345, Camera]
type = screenbound
trigger1 = animelemtime(3) < 0
value = 1
movecamera = 1, 0

[State 1345, Pos]
type = posset
trigger1 = animelem = 3
y = 0

[State 1346, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 0.4850; yaccel

[State 1346, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = -3.5
y = -5.0

[State 1346, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1346, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = animelemtime(3) > 1
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5200

[State 1346, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = animelemtime(3) > 1
trigger1 = pos y >= 25
value = 5100


;======================<HYAKKI GOU TSUI>=============================
;----- KICK THROW -----
[Statedef 1350]
type = A
physics = N
movetype = A
anim = 1350
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetstate
trigger1 = !time
value = 1355

[State 1350, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 6
channel = 0

[State 1350, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
value = 1, 6
;channel = 1
stopongethit = 1

[State 1350, Width]
type = width
trigger1 = 1
edge = 20, 20

[State 1350, Vel]
type = velset
trigger1 = animelemtime(4) < 0
x = 0
y = 0

[State 1350, Vel]
type = velset
trigger1 = animelem = 4
x = -3.5
y = -12

[State 1350, Accel]
type = veladd
trigger1 = animelemtime(4) > 0
y = 0.5

[State 1350, Accel]
type = velmul
trigger1 = animelemtime(4) > 0 && (vel y = [1, 20])
y = 1.1

[State 1350, Accel]
type = velmul
trigger1 = vel y > 0
x = 0.95

[State 1350, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))
;-23

[State 1350, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 8 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))

[State 1350, Bind 4]
type = bindtotarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 18 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))

[State 1350, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 12, -62

[State 1350, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger3 = animelemtime(14) >= 0 && animelemtime(15) < 0
pos = 2, -55

[State 1350, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger3 = animelemtime(15) >= 0
pos = -14, -36

[State 1350, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = 9, 0

[State 1350, Bind 9]
type = targetbind
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger2 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = 20, -52

[State 1350, Pos Y Threshold]
type = offset
trigger1 = pos y > 0
trigger1 = animelemtime(5) < 0
y = -pos y

[State 1350, End]
type = changestate
trigger1 = animelemtime(4) > 0
trigger1 = vel y > 0
trigger1 = pos y > -15
value = 1351


;----- HIT FLOOR -----
[Statedef 1351]
type = A
physics = N
movetype = A
anim = 1351
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1351, Pos]
type = posadd
trigger1 = !time
x = 32

[State 1351, Pos]
type = posset
trigger1 = !time
y = 0

[State 1351, Throw]
type = targetstate
trigger1 = !time
value = 1356

[State 1351, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1351, Damage]
type = targetlifeadd
trigger1 = !time
value = floor(-160 * map(damagescaling))
dizzy = 0

[State 1351, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 1351, Give Power]
type = targetpoweradd
trigger1 = !time
value = 40; givepower

[State 1351, Get Power]
type = poweradd
trigger1 = !time
value = 200 * map(meterscaling); getpower

[State 1351, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = -32, 0

[State 1351, Sound]
type = playsnd
trigger1 = !time
value = 3, 7
channel = 0

[State 1351, Sound]
type = playsnd
trigger1 = !time
value = 5, 5

[State 1351, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = -24, 0
ownpal = 1

[State 1351, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = !time
anim = F 62
postype = p1
pos = -24, 0
sprpriority = -10
ownpal = 1

[State 1351, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 180
ampl = -4
mul = 0.8

[State 1351, Type]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 1351, Vel]
type = velset
trigger1 = animelem = 2
x = -3
y = -6

[State 1351, Spr]
type = sprpriority
trigger1 = animelem = 4
value = -1

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1352


;---Land---
[Statedef 1352]
type = S
physics = S
movetype = I
anim = 1352
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1352, Pos]
type = posset
trigger1 = 1
y = 0

[State 1352, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1352, Dust]
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

[State 1352, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1355]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1355, Anim]
type = changeanim2
trigger1 = !time
value = 1355

[State 1355, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1355, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- TARGET HIT FLOOR -----
[Statedef 1356]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 1

[State 1356, Anim]
type = changeanim2
trigger1 = !time
value = 1356

[State 1356, Anim]
type = changeanim
trigger1 = time = 16
value = 5160

[State 1356, Accel]
type = veladd
trigger1 = time >= 16
y = 0.4850; yaccel

[State 1356, Vel]
type = velset
trigger1 = time = 16
x = -1.5
y = -7.5

[State 1356, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1356, Fall Recovery]
type = selfstate
trigger1 = time > 16
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1356, End]
type = selfstate
trigger1 = time > 16
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100

[State 1356, Bounce Offset Fix]
type = offset
trigger1 = time >= 16
y = const(movement.down.bounce.offset.y)


;======================<ASHURA SENKUU>=============================
[Statedef 1400]
type = S
physics = N
movetype = I
anim = 1400
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_623kk), 1, ifelse(map(cmd_623pp), 2, ifelse(map(cmd_421kk), -1, -2)))
ignorehitpause = 1
persistent = 0

[State 1400, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(life > p2, life && random < 333, 1, 2)
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
ownpal = 1
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
persistent = 0

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(7) < 0
x = ifelse(map(strength) = 2, -6, ifelse(map(strength) = 1, -4, ifelse(map(strength) = -2, 6, 4))) * sin(animelemtime(2) / 8.0 * pi)

[State 1400, Vel]
type = velmul
trigger1 = animelemtime(7) > ifelse(map(strength) = 2 || map(strength) = -2, 15, 8)
x = 0.9

[State 1400, Vel]
type = velset
trigger1 = animelem = 7
x = ifelse(map(strength) = 2, 12.0, ifelse(map(strength) = 1, 8.33, ifelse(map(strength) = -2, -12.0, -8.33)))

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 6
persistent = 0

[State 1400, Darken]
type = palfx
trigger1 = animelemtime(6) >= 0
time = 1
mul = 128, 128, 128

[State 1400, Afterimage]
type = explod
trigger1 = animelemtime(7) >= 0
ID = 1400
postype = p1
pos = 0, 2 * cos(time / 8.0 * pi)
sprpriority = sprpriority - 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 16
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
palfx.time = 16
palfx.mul = 128, 128, 128
interpolation.time = 16
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 1400, Eye]
type = explod
trigger1 = animelemtime(7) >= 0
ID = 1400
anim = 8060
postype = p1
pos = 10 * const(size.xscale) - 0.5 * vel x, -98 * const(size.yscale)
sprpriority = sprpriority + 1
removetime = 16
trans = addalpha
alpha = 256, 256
scale = 0.02 * abs(vel x), 0.02
palfx.time = 16
palfx.color = 0
palfx.mul = 256, 0, 0
interpolation.time = 16
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 1400, Turn]
type = turn
trigger1 = animelemtime(7) > 0
trigger1 = p2dist x < 0

[State 1400, End]
type = changestate
triggerall = animelemtime(7) > 0
trigger1 = time >= ifelse(map(strength) = 2 || map(strength) = -2, 49, 44)
trigger2 = vel x < 0 && backedgebodydist <= 0
trigger3 = vel x > 0 && frontedgebodydist <= 0
value = 1401

[State 1400, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = 1

[State 1400, Push]
type = playerpush
trigger1 = time > 0
trigger1 = animelemtime(3) >= 0
value = 0


;---Recovery---
[Statedef 1401]
type = S
physics = N
movetype = I
anim = 1401
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 1401, Darken]
type = palfx
trigger1 = !time
time = 3
mul = 128, 128, 128
sinmul = 128, 128, 128, 12

[State 1401, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<GOUHA KEN>=============================
;----- POSE -----
[Statedef 1500]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
facep2 = 1
sprpriority = 2
poweradd = 50 * map(meterscaling)

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

[State 1500, Anim]
type = changeanim
triggerall = time <= 0
trigger1 = !AIlevel
trigger1 = map(cmd_22k)
trigger2 = AIlevel
trigger2 = p2statetype = C
value = 1501

[State 1500, Type]
type = statetypeset
trigger1 = anim = 1501
statetype = C
physics = C

[State 1500, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 1500, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1500
trigger1 = animelem = 3
reversal.attr = SCA, AA
p1stateno = 1510
pausetime = 12, 36
hitsound = s2, 0
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
numhits = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1501
trigger1 = animelem = 3
reversal.attr = SC, AA
p1stateno = 1510
pausetime = 12, 36
hitsound = s2, 0
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
numhits = 0

[State 1500, Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1500, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 1501, 11, 0)
ctrl = 1


;----- PUNCH -----
[Statedef 1510]
type = S
physics = S
movetype = A
anim = 1510
velset = 0, 0
poweradd = 50 * map(meterscaling)
sprpriority = 2
ctrl = 0

[State 1510, Cancel Flag Fix]
type = movehitreset
trigger1 = time <= 0
ignorehitpause = 1

[State 1510, Spark]
type = explod
trigger1 = !time
trigger1 = map(cfg_sparks)
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = 20 + ifelse(p2bodydist x >= 20, 20, p2bodydist x), ifelse(anim = 1501, -20, -60)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 3
;channel = 1
stopongethit = 1

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 13
channel = 0

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 5

[State 1510, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = 44, 0
ownpal = 1

[State 1510, Shake]
type = envshake
trigger1 = animelem = 5
time = 12
freq = 180
ampl = -2
mul = 0.9

[State 1510, Width]
type = width
trigger1 = animelem = 4
value = 24, 0

[State 1510, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1510
attr = S, SA
damage = 100, 25
dizzypoints = 100 * !map(customcombo)
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -74
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = -6, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 1
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 1510, P2 Crumple]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(1510) = 1
trigger1 = target(1510), alive
trigger1 = target(1510), dizzy = 0
trigger1 = target(1510), dizzypoints > abs(target(1510), gethitvar(dizzypoints))
trigger1 = target(1510), hitshakeover = 0
trigger1 = target(1510), stateno = 5000 || target(1510), stateno = 5010
ID = 1510
value = 1520
ignorehitpause = 1

[State 1510, Blur FX]
type = explod
trigger1 = animelem = 7
ID = 1190
anim = 1190
postype = p1
pos = 30, -70
scale = 0.80, 0.80
angle = -90
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 6
interpolation.time = 6
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1510, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Crumple Hitshake -----
[Statedef 1520]
type = S
physics = S
movetype = H
velset = 0, 0

[State 1520, Stop]
type = posset
trigger1 = 1
y = 0

[State 1520, Anim]
type = changeanim
trigger1 = 1
value = ifelse(const(size.mid.pos.y) <= -80, 5012, 5002)

[State 1520, Hitfall]
type = hitfallset
trigger1 = 1
value = 0

[State 1520, Shake]
type = offset
trigger1 = 1
x = ifelse((time % 2), -1, 1)

[State 1520, End]
type = changestate
trigger1 = hitshakeover
value = 1521


;----- Crumple Falling -----
[Statedef 1521]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 1521, Anim]
type = changeanim2
trigger1 = !time
value = 1521

[State 1521, Stop]
type = posset
trigger1 = 1
y = 0

[State 1521, Type]
type = statetypeset
trigger1 = animelem = 4
statetype = A
physics = C

[State 1521, Hitfall]
type = hitfallset
trigger1 = statetype = A
trigger2 = statetype = L
value = 1

[State 1521, Pos]
type = posadd
trigger1 = !animtime
x = -const(size.ground.back)

[State 1521, End]
type = selfstate
trigger1 = !animtime
value = 5110


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
value = 3, ifelse(random < 500, 9, 11)
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
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
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -76
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2900, Anim]
type = changeanim
trigger1 = anim = 2900
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 9
value = 2900
elem = 4
ignorehitpause = 1

[State 2900, Type]
type = statetypeset
trigger1 = animelem = 4
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
value = 3, ifelse(random < 500, 9, 11)
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
;channel = 1
stopongethit = 1

[State 2910, Hit]
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
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 55) * (map(sparkx.max) := 85), map(sparky) := -43
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
value = 0
ctrl = 1
