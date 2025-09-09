; _______________________________
;| Nash by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<SONIC BOOM>=============================
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
value = ifelse(p2statetype = L, 0, ifelse((p2movetype = H || random < 333), 2, ifelse(random < 500, 1, 0)))
ignorehitpause = 1

[State 1000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1000, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State 1000, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1002, ifelse(map(strength) = 1, 1001, 1000))

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 15, 5), 0
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 0

[State 1000, FX]
type = helper
trigger1 = animelem = 3
trigger1 = !numhelper(1010)
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1000, Sonic Boom]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Sonic Boom"
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-68 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SONIC BOOM>=============================
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

[State 1020, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
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
pos = ceil(-52 * const(size.xscale)), ceil(-75 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 15, 5), 0
channel = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 0

[State 1020, FX]
type = helper
trigger1 = animelem = 3
trigger1 = !numhelper(1010)
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1020, Sonic Boom]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1025
ID = 1025
name = "Sonic Boom"
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-68 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SOMERSAULT SHELL>=============================
[Statedef 1100]
type = A
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
value = ifelse((map(customcombo) || p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1100, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge2) := 0
trigger1 = 1 || map(ai_charge2) := 0
ignorehitpause = 1
persistent = 0

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1102, ifelse(map(strength) = 1, 1101, 1100))

[State 1100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = A
time = 1
ignorehitpause = 1

[State 1100, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
value2 = , AP
time = 1
ignorehitpause = 1

[State 1100, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = ifelse(anim = 1102, 0.761, ifelse(anim = 1101, 0.790, 0.830))

[State 1100, Vel]
type = velset
trigger1 = animelemtime(4) = [0, 1]
x = 1.538
y = ifelse(anim = 1102, -11.799, ifelse(anim = 1101, -10.668, -9.546))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(4) = 0
value = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 15, 5), 2
channel = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 1
freqmul = ifelse(anim = 1102, 1.0, ifelse(anim = 1101, 1.05, 1.1))

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

[State 1100, FX]
type = helper
trigger1 = animelem = 3
trigger1 = !numhelper(1105)
helpertype = normal
stateno = 1105
ID = 1105
name = "Somersault FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (map(strength) + 1))
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 100, ifelse(map(strength) = 1, 120, 100)), ifelse(map(strength) = 2, 25, ifelse(map(strength) = 1, 30, 25))
dizzypoints = 200 * !map(customcombo)
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
guard.velocity = -10.52
air.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -32
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 1100, Hit]
type = hitdef
trigger1 = map(strength) < 2
trigger1 = animelem = 4
trigger1 = !movecontact && !movereversed
trigger2 = map(strength) = 2
trigger2 = animelem = 4
trigger2 = !movehit
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (map(strength) + 1))
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
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
guard.velocity = -10.52
air.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -64
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 1100, Hit]
type = hitdef
trigger1 = anim = 1102
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (map(strength) + 1))
attr = A, SA
hitflag = MAF
guardflag = MA
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
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
guard.velocity = -10.52
air.velocity = -4.17, ifelse(map(strength) = 0, -6.0, -7.0)
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -96
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 1100, Idle]
type = statetypeset
trigger1 = anim = [1100, 1101]
trigger1 = animelem = 6
trigger2 = anim = 1102
trigger2 = animelem = 8
movetype = I

[State 1100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;----- LAND -----
[Statedef 1103]
type = S
physics = S
ctrl = 0
anim = 1103
velset = 0, 0
movehitpersist = 1

[State 1103, Pos]
type = posset
trigger1 = 1
y = 0

[State 1103, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SOMERSAULT SHELL>=============================
[Statedef 1120]
type = A
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

[State 1120, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge2) := 0
trigger1 = 1 || map(ai_charge2) := 0
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
pos = ceil(16 * const(size.xscale)), ceil(-63 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
attr = SCA
slot = 0
time = 1
ignorehitpause = 1

[State 1120, NHB]
type = nothitby
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
attr = A
slot = 0
time = 1
ignorehitpause = 1

[State 1120, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
attr = , AP
slot = 1
time = 1
ignorehitpause = 1

[State 1120, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = 0.761

[State 1120, Vel]
type = velset
trigger1 = animelemtime(4) = [0, 1]
x = 1.538
y = -11.799

[State 1120, Grounded Frame]
type = posfreeze
trigger1 = animelemtime(4) = 0
value = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 3
value = ifelse(map(shadow), 15, 5), 2
channel = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 3
value = 7, 1

[State 1120, Sound]
type = playsnd
trigger1 = animelemtime(4) = 1
value = 0, 40

[State 1120, Dust]
type = helper
trigger1 = animelemtime(4) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1120, Somersault Shell]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 1125
ID = 1125
name = "Somersault Shell"
postype = p1
pos = ceil(86 * const(size.xscale)), ceil(-115 * const(size.yscale))
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 1120, FX]
type = helper
trigger1 = animelem = 3
trigger1 = !numhelper(1105)
helpertype = normal
stateno = 1105
ID = 1105
name = "Somersault FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 70, 18
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.0, -7.0
guard.velocity = -10.52
air.velocity = -4.0, -7.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -32
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 35, 9
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.0, -7.0
guard.velocity = -10.52
air.velocity = -4.0, -7.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -64
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 30, 8
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.0, -7.0
guard.velocity = -10.52
air.velocity = -4.0, -7.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -96
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1120, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State 1120, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;======================<MOONSAULT SLASH>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
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
value = ifelse(map(customcombo) || random < 500, 2, ifelse(random < 500, 1, 0))
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

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = ifelse(vel y >= 10, 0.5, 1)

[State 1200, Vel]
type = velset
trigger1 = animelem = 4
x = ifelse(anim = 1202, 8, ifelse(anim = 1201, 6, 4))
y = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 4
value = ifelse(map(shadow), 14, 4), 2
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 1

[State 1200, FX]
type = helper
trigger1 = animelem = 5
trigger1 = !numhelper(1205)
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1200, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1200
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = (80 + map(strength) * 10), (20 + map(strength) * 2)
dizzypoints = 100 * !map(customcombo)
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.67 / ((map(customcombo) > 0) + 1.0), -6.67
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -30
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 1200, Spark Y]
type = null
trigger1 = animelemtime(5) >= 0
trigger1 = map(sparky) := (-72 + p2dist y)

[State 1200, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

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


;======================<EX MOONSAULT SLASH>=============================
[Statedef 1220]
type = A
physics = N
movetype = A
anim = 1220
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
pos = ceil(2 * const(size.xscale)), ceil(-78 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = ifelse(vel y >= 10, 0.5, 1)

[State 1220, Vel]
type = velset
trigger1 = animelem = 4
x = 8
y = 0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 4
value = ifelse(map(shadow), 14, 4), 2
channel = 0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 1

[State 1220, FX]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 1220, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1220
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 110, 28
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -6, 8
guard.velocity = -10.52
air.velocity = -5.67, -6.67
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -30
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 1220, Spark Y]
type = null
trigger1 = animelemtime(5) >= 0
trigger1 = map(sparky) := (-72 + p2dist y)

[State 1220, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State 1220, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1203


;----- Target Slammed Against Ground -----
[Statedef 7070]
type = A
physics = N
movetype = H
velset = 0, 0

[State 7070, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 7070, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1

[State 7070, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 7071


[Statedef 7071]
type = L
physics = N
movetype = H
velset = 0, 0

[State 7071, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 7071, Damage]
type = hitfalldamage
trigger1 = !time

[State 7071, Shake]
type = envshake
trigger1 = !time
time = 12
freq = 180
ampl = 2

[State 7071, Pos]
type = posset
trigger1 = 1
y = 0

[State 7071, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 7071, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
ownpal = 1
sprpriority = 10

[State 7071, End]
type = changestate
trigger1 = !animtime
value = 7072


[Statedef 7072]
type = L
physics = N
movetype = H

[State 7072, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)

[State 7072, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 7072, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 7072, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 7072, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;======================<SHADOW WARP>=============================
[Statedef 1300]
type = S
physics = N
movetype = I
anim = 1300
ctrl = 0
velset = 0, 0
sprpriority = -2
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
value = ifelse(p2bodydist x > 140, 2, ifelse(p2bodydist x > 90, 1, 0))
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

[State 1300, Push]
type = playerpush
trigger1 = animelemtime(4) < 0
value = 0

[State 1300, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = , AP
time = 1

[State 1300, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA, AA, AP, AT
time = 1

[State 1300, Vel]
type = velset
trigger1 = animelem = 2
x = 10

[State 1300, Vel]
type = velset
trigger1 = animelem = 4
x = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 2
value = 7, 4
freqmul = ifelse(map(strength) = 0, 1.10, ifelse(map(strength) = 1, 1.05, 1.0))

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 103

[State 1300, FX]
type = helper
trigger1 = animelem = 2
trigger1 = !numhelper(1305)
helpertype = normal
stateno = 1305
ID = 1305
name = "Warp FX"
postype = p1
ownpal = 1

[State 1300, Palfx]
type = palfx
trigger1 = animelemtime(2) >= -1 && animelemtime(3) <= -1
time = 10
add = -255, -255, -255
sinadd = 255, 255, 255, 40

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<PUNCH ZERO COUNTER>=============================
[Statedef 2900]
type = S
physics = S
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), 2
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

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
ground.type = High
air.type = Low
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 80) * (map(sparkx.max) := 140), map(sparky) := -75
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
guard.velocity = -10.52
air.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 2900, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 1
value = ifelse(map(shadow), 14, 4), 2
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Hit]
type = hitdef
trigger1 = animelem = 5
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
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 125), map(sparky) := -18
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
guard.velocity = -10.52
air.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
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
