; _______________________________
;| Yuri by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<KOUOU KEN>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
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

[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1002, ifelse(map(strength) = 1, 1001, 1000))

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 7
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 0

[State 1000, Pos]
type = posadd
trigger1 = animelem = 1
x = 16

[State 1000, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 4, 0))

[State 1000, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1004
ID = 1004
name = "Ko'ou Ken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1000, Kouou Ken]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Ko'ou Ken"
postype = p1
pos = 64, -68
size.xscale = 0.4
size.yscale = 0.4
ownpal = 1

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX KOUOU KEN>=============================
[Statedef 1020]
type = S
physics = S
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
anim = 8410
sprpriority = 3
postype = p1
pos = -38, -82
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 7
channel = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 0

[State 1020, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1004
ID = 1004
name = "Kouou Ken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1020, Pos]
type = posadd
trigger1 = animelem = 1
x = 16

[State 1020, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 8

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1020, Kouou Ken]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1025
ID = 1025
name = "EX Kouou Ken"
postype = p1
pos = 64, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<CHOU UPPER>=============================
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
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1100, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2movetype = H && map(ai_attackwindow) >= 6, 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1102, ifelse(map(strength) = 1, 1101, 1100))

[State 1100, Pos]
type = posadd
trigger1 = animelem = 2
x = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 2, 0))

[State 1100, Pos]
type = posadd
trigger1 = animelem = 4
x = ifelse(map(strength) = 2, 20, ifelse(map(strength) = 1, 10, 0))

[State 1100, Vel]
type = velmul
trigger1 = animelemtime(4) >= 0
x = 0.975

[State 1100, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = 0.6

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelem = 4
trigger2 = (anim = [1101, 1102]) && animelem = 2
x = ifelse(anim = 1102, 5, ifelse(anim = 1101, 4.5, 4))

[State 1100, Vel]
type = velset
trigger1 = animelemtime(4) = [0, 1]
y = ifelse(anim = 1102, -10, ifelse(anim = 1101, -8, -6))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(4) = 0
value = 1

[State 1100, Type]
type = statetypeset
trigger1 = animelem = 4
statetype = A

[State 1100, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 10
channel = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelemtime(4) = 1
value = 0, 40

[State 1100, Dust]
type = helper
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 50, ifelse(map(strength) = 1, 60, 90)), ifelse(map(strength) = 2, 13, ifelse(map(strength) = 1, 15, 23))
dizzypoints = 100 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -56
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -2.5, -4.5), ifelse(map(strength) = 2, -8.6, ifelse(map(strength) = 1, -7.4, -6.0))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = ifelse(map(strength) = 2, -2.5, -4.5), ifelse(map(strength) = 2, -8.6, ifelse(map(strength) = 1, -7.4, -6.0))
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Hit]
type = hitdef
trigger1 = anim = 1100
trigger1 = animelem = 4
trigger1 = !movecontact && !movereversed
trigger2 = anim = 1101 || anim = 1102
trigger2 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse((anim = 1101 || anim = 1102) && (animelem = 4), 2, 1))
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 40, 50)), ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 10, 13))
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -100
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -2.5, -4.5), ifelse(map(strength) = 2, -8.6, ifelse(map(strength) = 1, -7.4, -6.0))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = ifelse(map(strength) = 2, -2.5, -4.5), ifelse(map(strength) = 2, -8.6, ifelse(map(strength) = 1, -7.4, -6.0))
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Blur FX]
type = explod
trigger1 = animelem = 4
ID = 8190
anim = 8190
postype = p1
pos = 25, -115
scale = 0.67, 0.75
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

[State 1100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1105


;----- LAND -----
[Statedef 1105]
type = S
physics = S
ctrl = 0
anim = 1105
velset = 0, 0
movehitpersist = 1

[State 1105, Pos]
type = posset
trigger1 = 1
y = 0

[State 1105, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1105, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1105, EX Double Chou Upper]
type = changestate
value = 1130
triggerall = roundstate = 2
triggerall = power >= 500 && !map(customcombo); map(customcombo) <= 60
triggerall = (prevstateno = 1100 && map(strength) = 2) || prevstateno = 1120
trigger1 = !AIlevel
trigger1 = map(cmd_623pp)
trigger2 = AIlevel
trigger2 = numenemy && !isasserted(noinput)
trigger2 = p2statetype = A
trigger2 = p2movetype = H
trigger2 = p2, hitfall
trigger2 = p2bodydist x = [-10, 40] && p2dist y >= -60 && p2, vel y >= 0
trigger2 = map(ai_combowindow) >= 3
trigger2 = random < (500 * (AIlevelF / 8.0))

[State 1105, Double Chou Upper]
type = changestate
value = 1110
triggerall = roundstate = 2
triggerall = (prevstateno = 1100 && map(strength) = 2) || prevstateno = 1120
trigger1 = !AIlevel
trigger1 = map(cmd_623p)
trigger1 = map(cmd_z) || map(cmd_rlsz)
trigger2 = AIlevel
trigger2 = numenemy && !isasserted(noinput)
trigger2 = p2statetype = A
trigger2 = p2movetype = H
trigger2 = p2, hitfall
trigger2 = p2bodydist x = [-10, 40] && p2dist y >= -60 && p2, vel y >= 0
trigger2 = map(ai_combowindow) >= 3

[State 1105, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<DOUBLE CHOU UPPER>=============================
[Statedef 1110]
type = S
physics = N
movetype = A
anim = 1110
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

[State 1110, Strength]
type = mapset
trigger1 = map(strength) != 2
map = "strength"
value = 2
ignorehitpause = 1

[State 1110, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1110, Vel]
type = velmul
trigger1 = animelemtime(3) >= 0
x = 0.975

[State 1110, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 0.4

[State 1110, Vel]
type = velset
trigger1 = animelemtime(3) = [0, 1]
x = 3
y = -10

[State 1110, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(3) = 0
value = 1

[State 1110, Vel]
type = velset
trigger1 = vel y >= 0
x = 0

[State 1110, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A

[State 1110, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1110, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0

[State 1110, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 1110, Sound]
type = playsnd
trigger1 = animelemtime(3) = 1
value = 0, 41

[State 1110, Dust]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 5
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 30), map(sparky) := -46
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -98
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
air.recover = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Blur FX]
type = explod
trigger1 = animelem = 3
ID = 8190
anim = 8190
postype = p1
pos = 25, -115
scale = 0.67, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 8
interpolation.time = 8
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1110, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1112


;----- LAND -----
[Statedef 1112]
type = S
physics = S
ctrl = 0
anim = 1112
velset = 0, 0
movehitpersist = 1

[State 1112, Pos]
type = posset
trigger1 = 1
y = 0

[State 1112, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1112, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1112, Triple Chou Upper]
type = changestate
value = 1140
triggerall = roundstate = 2
triggerall = prevstateno = 1130
trigger1 = !AIlevel
trigger1 = map(cmd_623p)
trigger1 = map(cmd_z) || map(cmd_rlsz)
trigger2 = AIlevel
trigger2 = numenemy && !isasserted(noinput)
trigger2 = p2statetype = A
trigger2 = p2movetype = H
trigger2 = p2, hitfall
trigger2 = p2bodydist x = [-10, 40] && p2dist y >= -60 && p2, vel y >= 0
trigger2 = map(ai_combowindow) >= 3

[State 1112, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX CHOU UPPER>=============================
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
anim = 8410
sprpriority = 3
postype = p1
pos = -6, -54
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, Pos]
type = posadd
trigger1 = animelem = 6
x = 20

[State 1120, Vel]
type = velmul
trigger1 = animelemtime(6) < 0
x = 0.85

[State 1120, Vel]
type = velmul
trigger1 = animelemtime(6) >= 0
x = 0.975

[State 1120, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.6

[State 1120, Vel]
type = velset
trigger1 = animelem = 2
x = 12

[State 1120, Vel]
type = velset
trigger1 = animelemtime(6) = [0, 1]
x = 6
y = -10

[State 1120, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(6) = 0
value = 1

[State 1120, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A

[State 1120, Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
persistent = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 10
channel = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelemtime(6) = 1
value = 0, 40

[State 1120, Dust]
type = helper
trigger1 = animelemtime(6) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
dizzypoints = 100 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 30), map(sparky) := -56
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 40, 10
dizzypoints = 100 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -100
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1120, Blur FX]
type = explod
trigger1 = animelem = 6
ID = 8190
anim = 8190
postype = p1
pos = 25, -115
scale = 0.67, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 8
interpolation.time = 8
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1120, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1105


;======================<EX DOUBLE CHOU UPPER>=============================
[Statedef 1130]
type = S
physics = N
movetype = A
anim = 1130
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

[State 1130, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1130, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1130, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1130, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8410
sprpriority = 3
postype = p1
pos = 17, -42
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, Vel]
type = velset
trigger1 = animelem = 2
x = 5

[State 1130, Vel]
type = velmul
trigger1 = animelemtime(3) >= 0
x = 0.975

[State 1130, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 0.6

[State 1130, Vel]
type = velset
trigger1 = animelemtime(3) = [0, 1]
y = -10

[State 1130, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(3) = 0
value = 1

[State 1130, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A

[State 1130, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1130, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0

[State 1130, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 1130, Sound]
type = playsnd
trigger1 = animelemtime(3) = 1
value = 0, 41

[State 1130, Dust]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1130, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 7
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 30), map(sparky) := -46
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1130, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -98
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -8.6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -2.5, -8.6
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
air.recover = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1130, Blur FX]
type = explod
trigger1 = animelem = 3
ID = 8190
anim = 8190
postype = p1
pos = 25, -115
scale = 0.67, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 8
interpolation.time = 8
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1130, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1112


;======================<TRIPLE CHOU UPPER>=============================
[Statedef 1140]
type = S
physics = N
movetype = A
anim = 1140
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1140, Strength]
type = mapset
trigger1 = map(strength) != 2
map = "strength"
value = 2
ignorehitpause = 1

[State 1140, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1140, Vel]
type = velmul
trigger1 = animelemtime(3) >= 0
x = 0.975

[State 1140, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 0.4

[State 1140, Vel]
type = velset
trigger1 = vel y >= 0
x = 0

[State 1140, Vel]
type = velset
trigger1 = animelemtime(3) = [0, 1]
x = 3
y = -10

[State 1140, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(3) = 0
value = 1

[State 1140, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A

[State 1140, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1140, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 12
channel = 0

[State 1140, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 1140, Sound]
type = playsnd
trigger1 = animelemtime(3) = 1
value = 0, 41

[State 1140, Dust]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 7
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 40), map(sparky) := -56
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.5, -10.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -3.5, -10.5
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1140, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 6)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -100
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.5, -10.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -3.5, -10.5
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
air.recover = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1140, Blur FX]
type = explod
trigger1 = animelem = 3
ID = 8190
anim = 8190
postype = p1
pos = 25, -115
scale = 0.67, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 8
interpolation.time = 8
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1140, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1105


;======================<RAIOSHO>=============================
[Statedef 1200]
type = S
physics = S
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
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1200, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x > 140, 2, ifelse(p2bodydist x > 80, 1, 0))
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1202, ifelse(map(strength) = 1, 1201, 1200))

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = ifelse(anim = 1202, 0.50, ifelse(anim = 1201, 0.58, 0.66))

[State 1200, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(anim = 1202, 4.5, ifelse(anim = 1201, 3.25, 2.0))
y = -8.00

[State 1200, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1200, Sound]
type = playsnd
trigger1 = (anim = 1200 || anim = 1201) && animelem = 6
trigger2 = anim = 1202 && animelem = 14
value = 4, 6
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = (anim = 1200 || anim = 1201) && animelem = 6
trigger2 = anim = 1202 && animelem = 14
value = 7, 5

[State 1200, FX]
type = helper
triggerall = !numhelper(1204)
trigger1 = anim = 1200 || anim = 1201
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = anim = 1202
trigger2 = animelemtime(12) >= 0 && animelemtime(15) < 0
helpertype = normal
stateno = 1204
ID = 1204
name = "Raiouken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1200, Hit]
type = hitdef
trigger1 = (anim = 1200 || anim = 1201) && animelem = 7
trigger2 = anim = 1202 && animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = (80 + 10 * map(strength)), (20 + 5 * map(strength))
dizzypoints = ifelse(map(strength) = 2, 200, ifelse(map(strength) = 1, 150, 100)) * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -40
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -6, 8
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -6, 8
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p2facing = 1
down.bounce = 1
fall.xvelocity = -1.5
fall.yvelocity = -6;6.68
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ID = 1200
p1sprpriority = sprpriority
forcestand = 1

[State 1200, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1203


;----- LAND -----
[Statedef 1203]
type = S
physics = S
ctrl = 0
anim = 1203
velset = 0, 0
movehitpersist = 1

[State 1203, Pos]
type = posset
trigger1 = 1
y = 0

[State 1203, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1203, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1203, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Slammed Against Ground -----
[Statedef 1280]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1280, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 1280, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1

[State 1280, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 1281


[Statedef 1281]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1281, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5102), 5102, 5100)

[State 1281, Damage]
type = hitfalldamage
trigger1 = !time

[State 1281, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1281, Pos]
type = posset
trigger1 = 1
y = 0

[State 1281, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1281, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = 10

[State 1281, End]
type = changestate
trigger1 = !animtime
value = 1282


[Statedef 1282]
type = L
physics = N
movetype = H

[State 1282, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5162), 5162, 5160)

[State 1282, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 1282, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 1282, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 1282, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;======================<EX RAIOSHO>=============================
[Statedef 1220]
type = S
physics = S
movetype = A
anim = 1220
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
anim = 8410
sprpriority = 3
postype = p1
pos = 0, -60
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 1220, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1220, NHB]
type = nothitby
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(10) < 0
value2 = , AP
time = 1

[State 1220, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.58

[State 1220, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(p2bodydist x >= 180, 6, ifelse(p2bodydist x <= 0, 0, p2bodydist x / 30.0))
y = -8.00

[State 1220, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 14
value = 4, 6
channel = 0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 14
value = 7, 5

[State 1220, FX]
type = helper
trigger1 = !numhelper(1204)
trigger1 = animelemtime(12) >= 0 && animelemtime(15) < 0
helpertype = normal
stateno = 1204
ID = 1204
name = "Raiouken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1220, Hit]
type = hitdef
trigger1 = animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 80, 20
dizzypoints = 150 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -40
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -6, 8
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -6, 8
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
p2facing = 1
down.bounce = 1
fall.xvelocity = -1.5
fall.yvelocity = -6;6.68
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ID = 1220
p1sprpriority = sprpriority
forcestand = 1

[State 1220, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1203


;======================<RAIOU KEN (FIREBALL)>=============================
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 50 * map(meterscaling)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1250, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1250, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 8
channel = 0

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 0

[State 1250, FX]
type = helper
trigger1 = !time
trigger1 = !numhelper(1254)
helpertype = normal
stateno = 1254
ID = 1254
name = "Raiouken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1250, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 4
value2 = SCA, AA, AT
time = 1

[State 1250, Raiou Ken]
type = helper
trigger1 = animelem = 4
helpertype = normal; projectile
stateno = 1255
ID = 1255
name = "Raiou Ken"
postype = p1
pos = 38, -44
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1250, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = 0.6

[State 1250, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = ifelse(map(strength) = 2, -2, ifelse(map(strength) = 1, -1.5, -1))
y = -6

[State 1250, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1253


;----- LAND -----
[Statedef 1253]
type = S
physics = S
ctrl = 0
anim = 1253
velset = 0, 0
movehitpersist = 1

[State 1253, Pos]
type = posset
trigger1 = 1
y = 0

[State 1253, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1253, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1253, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX RAIOU KEN (FIREBALL)>=============================
[Statedef 1270]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
sprpriority = 2
poweradd = -500

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1270, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1270, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1270, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1270, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8410
sprpriority = 3
postype = p1
pos = -12, -106
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1270, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 8
channel = 0

[State 1270, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 0

[State 1270, FX]
type = helper
trigger1 = !time
trigger1 = !numhelper(1254)
helpertype = normal
stateno = 1254
ID = 1254
name = "Raiouken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1270, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 4
value2 = SCA, AA, AT
time = 1

[State 1270, Raiou Ken]
type = helper
trigger1 = animelem = 4
helpertype = normal; projectile
stateno = 1275
ID = 1275
name = "Raiou Ken"
postype = p1
pos = 38, -44
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1270, Freeze]
type = posfreeze
trigger1 = animelemtime(4) < 1
value = 1

[State 1270, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = const(movement.yaccel)

[State 1270, End]
type = changestate
trigger1 = animelemtime(4) >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1253


;----- Target Slammed Against Ground -----
[Statedef 1280]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1280, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 1280, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1

[State 1280, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 1281


[Statedef 1281]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1281, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5102), 5102, 5100)

[State 1281, Damage]
type = hitfalldamage
trigger1 = !time

[State 1281, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1281, Pos]
type = posset
trigger1 = 1
y = 0

[State 1281, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1281, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = 10

[State 1281, End]
type = changestate
trigger1 = !animtime
value = 1282


[Statedef 1282]
type = L
physics = N
movetype = H

[State 1282, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5162), 5162, 5160)

[State 1282, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 1282, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 1282, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 1282, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;======================<SAIFA>=============================
[Statedef 1300]
type = S
physics = S
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
value = ifelse(map(ai_combowindow) >= 15, 2, ifelse(map(ai_combowindow) >= 13, 1, 0))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1302, ifelse(map(strength) = 1, 1301, 1300))

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 6
channel = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 1

[State 1300, Pos]
type = posadd
trigger1 = map(strength) = 1 || map(strength) = 2
trigger1 = animelem = 4 || animelem = 5
x = ifelse(map(strength) = 2, 8, 4)

[State 1300, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1300, Saifa]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1305
ID = 1305
name = "Saifa"
postype = p1
pos = 64, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1300, Anim]
type = changeanim
triggerall = animelemtime(9) >= 0
triggerall = animelemtime(10) < 0
trigger1 = !numhelper(1305)
trigger2 = numhelper(1305)
trigger2 = helper(1305), stateno != 1305
value = anim
elem = 10

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SAIFA>=============================
[Statedef 1320]
type = S
physics = S
movetype = A
anim = 1320
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

[State 1320, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1320, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1320, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1320, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8410
sprpriority = 3
postype = p1
pos = 0, -60
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1320, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 6
channel = 0

[State 1320, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 1

[State 1320, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1320, Saifa]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1325
ID = 1325
name = "Saifa"
postype = p1
pos = 64, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1320, Anim]
type = changeanim
triggerall = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger1 = !numhelper(1325)
trigger2 = numhelper(1325)
trigger2 = helper(1325), stateno != 1325
value = anim
elem = 10

[State 1320, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKU RETSU BINTA>=============================
[Statedef 1600]
type = S
physics = S
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
value = ifelse((p2movetype = H || random < 333), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1600, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1600, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1602, ifelse(map(strength) = 1, 1601, 1600))

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 5
channel = 0

[State 1600, Vel]
type = velset
trigger1 = animelem = 3
x = 6

[State 1600, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
physics = N

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 7

[State 1600, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1600, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
dizzypoints = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -55
hitsound = s2, 0
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -4, -4
air.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -4, -4
yaccel = 0.4850
fall = 0
fall.recover = 1
fall.recovertime = 120
hitonce = 1
ID = 1600
p1sprpriority = sprpriority
forcestand = 1

[State 1600, P2 State]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1600)
trigger1 = animelemtime(3) >= 0
ID = 1600
value = 1615

[State 1600, p1state]
type = changestate
trigger1 = movehit
trigger1 = numtarget(1600)
trigger1 = animelemtime(3) >= 0
value = 1610

[State 1600, blocked]
type = changestate
trigger1 = movehit
trigger1 = !numtarget(1600)
trigger1 = animelemtime(3) >= 0
trigger2 = animelemtime(3) >= 0
trigger2 = moveguarded || movereversed
value = 1606

[State 1600, End]
type = changestate
trigger1 = time >= (16 + map(strength) * 9)
trigger2 = frontedgebodydist <= 0
trigger2 = time >= (6 + map(strength) * 2)
value = 1605


;----- MISS -----
[Statedef 1605]
type = S
physics = N
ctrl = 0
anim = 1605

[State 1605, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 1605, Sound]
type = playsnd
trigger1 = animelem = 1
value = 0, 101

[State 1605, Dust]
type = explod
trigger1 = animelem = 1
anim = 8103
sprpriority = 3
postype = p1
pos = 27, 0
vel = 3, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1605, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
x = 0

[State 1600, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
physics = S

[State 1605, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- BLOCKED -----
[Statedef 1606]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 1606
ctrl = 0
sprpriority = 2

[State 1606, Accel]
type = veladd
trigger1 = 1
y = 0.708

[State 1606, Vel]
type = velset
trigger1 = !time
x = -1.61
y = -8.15

[State 1606, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1607


[Statedef 1607]
type = S
physics = S
ctrl = 0
anim = 1607
velset = 0, 0

[State 1607, Pos]
type = posset
trigger1 = 1
y = 0

[State 1607, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1607, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1607, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- HIT -----
[Statedef 1610]
type = S
physics = S
movetype = A
anim = 1610
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1610, Anim]
type = changeanim
triggerall = animelemtime(18) < 0
trigger1 = map(strength) = 0
trigger1 = animelemtime(10) >= 0
trigger2 = map(strength) = 1
trigger2 = animelemtime(14) >= 0
value = 1610
elem = 18

[State 1610, target]
type = targetfacing
trigger1 = 1
value = -1

[State 1610, target]
type = targetstate
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
ID = 1600
value = 1616

[State 1610, target]
type = targetstate
trigger1 = numtarget(1600) && animelem = 18
ID = 1600
value = 1617

[State 1610, Bind]
type = targetbind
trigger1 = numtarget(1600) && animelemtime(21) < 0
ID = 1600
pos = 16, 0

[State 1610, Bind]
type = targetbind
trigger1 = numtarget(1600) && animelemtime(21) < 0
trigger1 = target(1600), anim = [1631, 1634]
ID = 1600
pos = 28, -78

[State 1610, Bind]
type = targetbind
trigger1 = numtarget(1600) && animelem = 21
ID = 1600
pos = 38, -16

[State 1610, Bind]
type = targetbind
trigger1 = numtarget(1600) && animelem = 21
trigger1 = target(1600), anim = [1631, 1634]
ID = 1600
pos = 38, -78 -(target(1600), const(size.head.pos.y))

[State 1610, Damage]
type = targetlifeadd
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17 || animelem = 21
ID = 1600
value = floor(-10 * map(damagescaling))
dizzy = 0
kill = 0

[State 1610, Damage]
type = targetlifeadd
trigger1 = numtarget(1600) && animelem = 21
ID = 1600
value = ceil(ifelse(map(strength) = 2, -40, ifelse(map(strength) = 1, -50, -60)) * map(damagescaling))
dizzy = 0
kill = 1

[State 1610, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 21
value = floor(-ifelse(map(strength) = 2, 200, ifelse(map(strength) = 1, 150, 100)) * map(damagescaling)) * !map(customcombo)

[State 1610, Juggle]
type = mapadd
trigger1 = animelem = 3
map = "juggle_count"
value = 1

[State 1610, givepower]
type = targetpoweradd
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 21
ID = 1600
value = 40; givepower

[State 1610, Hit]
type = hitadd
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17 || animelem = 21
value = 1

[State 1610, Sound]
type = playsnd
trigger1 = animelem = 20
value = 4, 3
channel = 0

[State 1610, Slap]
type = playsnd
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15
value = 7, 3

[State 1610, Slap]
type = playsnd
trigger1 = numtarget(1600)
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17
value = 7, 4

[State 1610, Slap]
type = playsnd
trigger1 = numtarget(1600)
trigger1 = animelem = 21
value = 7, 8

[State 1610, Slap]
type = playsnd
triggerall = !numtarget(1600)
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 21
trigger2 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17
value = 1, 0
;channel = 1
stopongethit = 1

[State 1610, Shake]
type = envshake
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
time = 10
ampl = 1
freq = 180

[State 1610, Shake]
type = envshake
trigger1 = numtarget(1600) && animelem = 22
time = 10
ampl = 1
freq = 180

[State 1610, Bishi]
type = explod
trigger1 = numtarget(1600)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
ID = 1613
anim = 1613
postype = p1
pos = 30 * const(size.xscale), -78 * const(size.yscale)
facing = facing
random = 80, 80
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

;[State 1610, Spark]
;in ZSS

[State 1610, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1615]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1615, fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1615, Anim]
type = changeanim2
trigger1 = !time
value = ifelse(const(size.head.pos.y) >= -60, 1631, 1615)

[State 1615, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 0

[State 1615, Safety]
type = selfstate
trigger1 = time >= 180
value = 0
ctrl = 1


[Statedef 1616]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1616, Anim]
type = changeanim2
trigger1 = !time
value = ifelse(const(size.head.pos.y) >= -60, 1632, 1616)

[State 1616, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 0

[State 1616, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1617]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1617, Anim]
type = changeanim2
trigger1 = !time
value = ifelse(const(size.head.pos.y) >= -60, 1633, 1617)

[State 1617, Camera]
type = screenbound
trigger1 = animelemtime(3) < 0
value = 0
movecamera = 1, 0

[State 1617, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 1617, End]
type = changestate
trigger1 = !animtime
value = 1618


[Statedef 1618]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1618, Vel]
type = velset
trigger1 = !time
x = -3.5
y = -9.0

[State 1618, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 1618, fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1618, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5050)

[State 1618, Anim]
type = changeanim
trigger1 = (anim = [5050, 5051])
trigger1 = vel y >= ifelse(anim = 5050, 1, -2) && selfanimexist(anim + 10)
value = anim + 10

[State 1618, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1618, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5200

[State 1618, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;======================<EX HYAKU RETSU BINTA>=============================
[Statedef 1620]
type = S
physics = S
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
anim = 8410
sprpriority = 3
postype = p1
pos = 14, -62
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 5
channel = 0

[State 1620, Vel]
type = velset
trigger1 = animelem = 3
x = 8

[State 1620, Type]
type = statetypeset
trigger1 = animelemtime(3) >= 0
physics = N

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 7

[State 1620, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1620, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -55
hitsound = s2, 0
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 13
ground.slidetime = 13
ground.velocity = -8, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -4, -4
air.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -4, -4
yaccel = 0.4850
fall = 0
fall.recover = 1
hitonce = 1
ID = 1620
p1sprpriority = sprpriority
forcestand = 1

[State 1620, P2 State]
type = targetstate
trigger1 = animelemtime(3) >= 0 && movehit && numtarget(1620)
ID = 1620
value = 1615

[State 1620, p1state]
type = changestate
trigger1 = animelemtime(3) >= 0 && movehit && numtarget(1620)
value = 1630

[State 1620, blocked]
type = changestate
trigger1 = animelemtime(3) >= 0 && movehit && !numtarget(1620)
trigger2 = animelemtime(3) >= 0 && (moveguarded || movereversed)
value = 1606

[State 1620, End]
type = changestate
trigger1 = time >= 30
trigger2 = frontedgebodydist <= 0
trigger2 = time >= 6
value = 1605


;----- HIT -----
[Statedef 1630]
type = S
physics = S
movetype = A
anim = 1630
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1630, target]
type = targetfacing
trigger1 = 1
value = -1

[State 1630, target]
type = targetstate
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15
trigger2 = animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25
nimelem = 17
ID = 1620
value = 1616

[State 1630, target]
type = targetstate
trigger1 = numtarget(1620) && animelem = 26
ID = 1620
value = 1637

[State 1630, Bind]
type = targetbind
trigger1 = numtarget(1620) && animelemtime(34) < 0
ID = 1620
pos = 16, 0

[State 1630, Bind]
type = targetbind
trigger1 = numtarget(1620) && animelemtime(34) < 0
trigger1 = target(1620), anim = [1631, 1634]
ID = 1620
pos = 28, -78

[State 1630, Bind]
type = targetbind
trigger1 = numtarget(1620) && animelem = 34
ID = 1620
pos = 38, -16

[State 1630, Bind]
type = targetbind
trigger1 = numtarget(1620) && animelem = 34
trigger1 = target(1620), anim = [1631, 1634]
ID = 1620
pos = 38, -78 -(target(1600), const(size.head.pos.y))

[State 1630, Damage]
type = targetlifeadd
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15
trigger2 = animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25
ID = 1620
value = floor(-10 * map(damagescaling))
dizzy = 0
kill = 0

[State 1630, Damage]
type = targetlifeadd
trigger1 = numtarget(1620) && animelem = 33
ID = 1620
value = floor(-40 * map(damagescaling))
dizzy = 0
kill = 1

[State 1630, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 33
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 1630, Juggle]
type = mapadd
trigger1 = animelem = 3
map = "juggle_count"
value = 1

[State 1630, givepower]
type = targetpoweradd
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 33
ID = 1620
value = 40; givepower

[State 1630, Hit]
type = hitadd
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15
trigger2 = animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25 || animelem = 33
value = 1

[State 1630, Sound]
type = playsnd
trigger1 = animelem = 32
value = 4, 1
channel = 0

[State 1630, Slap]
type = playsnd
trigger1 = numtarget(1620)
trigger1 = animelem = 3 || animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19 || animelem = 23
value = 7, 3

[State 1630, Slap]
type = playsnd
trigger1 = numtarget(1620)
trigger1 = animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21 || animelem = 25
value = 7, 4

[State 1630, Slap]
type = playsnd
trigger1 = numtarget(1620)
trigger1 = animelem = 33
value = 2, 2
volumescale = 80

[State 1610, Slap]
type = playsnd
trigger1 = numtarget(1620)
trigger1 = animelem = 33
value = 7, 8
volumescale = 80

[State 1630, Slap]
type = playsnd
triggerall = !numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15
trigger2 = animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25 || animelem = 33
value = 1, 0
;channel = 1
stopongethit = 1

[State 1630, Shake]
type = envshake
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13 || animelem = 15
trigger2 = animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25
time = 10
ampl = 1
freq = 180

[State 1630, Shake]
type = envshake
trigger1 = numtarget(1620) && animelem = 33
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1630, Bishi]
type = explod
triggerall = numtarget(1620)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21 || animelem = 23 || animelem = 25
ID = 1613
anim = 1613
postype = p1
pos = 30 * const(size.xscale), -78 * const(size.yscale)
facing = facing
random = 80, 80
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

;[State 1630, Spark]
;in ZSS

[State 1630, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1637]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1637, Anim]
type = changeanim2
trigger1 = !time
value = ifelse(const(size.head.pos.y) >= -60, 1634, 1637)

[State 1637, Camera]
type = screenbound
trigger1 = animelemtime(3) < 0
value = 0
movecamera = 1, 0

[State 1637, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 1637, End]
type = changestate
trigger1 = !animtime
value = 1638


[Statedef 1638]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1638, Vel]
type = velset
trigger1 = !time
x = -3.5
y = -10

[State 1638, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 1638, fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1638, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5050)

[State 1638, Anim]
type = changeanim
trigger1 = (anim = [5050, 5051])
trigger1 = vel y >= ifelse(anim = 5050, 1, -2) && selfanimexist(anim + 10)
value = anim + 10

[State 1638, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1638, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5200

[State 1638, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;======================<PUNCH ZERO COUNTER>=============================
[Statedef 2900]
type = S
physics = S
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 2900, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 3
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 2900, Pos]
type = posadd
trigger1 = animelem = 1
x = 12 * const(size.xscale)

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 10) * (map(sparkx.max) := 50), map(sparky) := -77
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
guard.velocity = -10.52
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 2900, Anim]
type = changeanim
trigger1 = anim = 2900
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 2900
elem = 5
ignorehitpause = 1

[State 2900, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<KICK ZERO COUNTER>=============================
[Statedef 2910]
type = C
physics = C
movetype = A
anim = 2910
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 2910, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 3
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -29
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
guard.velocity = -10.52
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 2910, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
