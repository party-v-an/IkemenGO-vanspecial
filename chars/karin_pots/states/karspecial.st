; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================<SPECIAL MOVES>=======================================
;============================================================================================

;======================<GUREN KEN>=============================
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
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1000, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x < 90, 0, ifelse(p2bodydist x < 100, 1, 2))
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

[State 1000, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -0.1628, ifelse(map(strength) = 1, -0.1221, -0.0814))

[State 1000, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1000, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.19, ifelse(map(strength) = 1, 4.15, 3.08))

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 7
channel = 0

[State 1000, Sound]
type = playsnd
trigger1 = !time
value = 0, 100

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1000, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1000, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 25, 20)), ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 6, 5))
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
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
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.39, -7
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -64
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1000, Anim]
type = changeanim
trigger1 = anim = [1000, 1002]
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 3
value = anim
elem = 4
ignorehitpause = 1

[State 1000, Guren Ressen Ha]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdup"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = p2stateno = 131 || p2stateno = 152 || p2stateno = 153 || p2dist x < 0
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1400
ignorehitpause = 1

[State 1000, Guren Kusabi]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = p2stateno = 130 || p2stateno = 150 || p2stateno = 151 || p2statetype = L
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1015
ignorehitpause = 1

[State 1000, Guren Hou Shou]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdfwd"
trigger1 = command = "x" || command = "y" || command = "z"
map = "gurenken"
value = 1010
ignorehitpause = 1

[State 1000, Guren Yasha Gedan]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = inguarddist && p2dist x >= 0 && p2statetype != C
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1025
ignorehitpause = 1

[State 1000, Guren Yasha Joudan]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = inguarddist && p2dist x >= 0 && p2statetype != C
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1020
ignorehitpause = 1

[State 1000, Guren Mujin Kyaku]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
map = "gurenken"
value = 1200
ignorehitpause = 1

[State 1000, Guren Ken]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = random < (200 * AIlevelF / 8.0)
map = "gurenken"
value = 1005
ignorehitpause = 1

[State 1000, Follow-up Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = !map(gurenken_strength) && animelemtime(9) < 0
trigger1 = map(gurenken) = 1005 || map(gurenken) = 1010 || map(gurenken) = 1020 || map(gurenken) = 1300
map = "gurenken_strength"
value = ifelse(map(cmd_z), 2, ifelse(map(cmd_y), 1, 0))

[State 1000, Follow-up Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = !map(gurenken_strength) && animelemtime(9) < 0
trigger1 = map(gurenken) = 1015 || map(gurenken) = 1025 || map(gurenken) = 1200 || map(gurenken) = 1400
map = "gurenken_strength"
value = ifelse(map(cmd_c), 2, ifelse(map(cmd_b), 1, 0))

[State 1000, Follow-up Strength]
type = mapset
trigger1 = AIlevel
trigger1 = animelemtime(9) < 0
map = "gurenken_strength"
value = 2

[State 1000, Follow-up type]
type = mapset
trigger1 = time <= 1
map = "gurenken"
value = 0

[State 1000, Follow-up Strength]
type = mapset
trigger1 = time <= 1
map = "gurenken_strength"
value = 0

[State 1000, Follow-up]
type = changestate
trigger1 = map(gurenken) = [1000, 2999]
trigger1 = animelemtime(6) >= 0 && animelemtime(9) < 0
value = map(gurenken)

[State 1000, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Second -----
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1005, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = map(gurenken_strength)

[State 1005, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1005, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1007, ifelse(map(strength) = 1, 1006, 1005))

[State 1005, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -0.1628, ifelse(map(strength) = 1, -0.1221, -0.0814))

[State 1005, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1005, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.19, ifelse(map(strength) = 1, 4.15, 3.08))

[State 1005, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 5
channel = 0

[State 1005, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1005, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1005, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1005, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 25, 20)), ifelse(map(strength) = 2, 10, ifelse(map(strength) = 8, 7, 5))
dizzypoints = 50 * !map(customcombo)
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.39, -7
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -64
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1005, Anim]
type = changeanim
trigger1 = anim = [1005, 1007]
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 3
value = anim
elem = 4
ignorehitpause = 1

[State 1005, Guren Ressen Ha]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdup"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = p2stateno = 131 || p2stateno = 152 || p2stateno = 153 || p2dist x < 0
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1400
ignorehitpause = 1

[State 1005, Guren Kusabi]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = p2stateno = 130 || p2stateno = 150 || p2stateno = 151 || p2statetype = L
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1015
ignorehitpause = 1

[State 1005, Guren Yasha Gedan]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = inguarddist && p2dist x >= 0 && p2statetype != C
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1025
ignorehitpause = 1

[State 1005, Guren Yasha Joudan]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = inguarddist && p2dist x >= 0 && p2statetype != C
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1020
ignorehitpause = 1

[State 1005, Guren Mujin Kyaku]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel
trigger2 = power >= 500
trigger2 = animelemtime(4) >= 0
trigger2 = p2bodydist x = [0, 40]
trigger2 = random < (250 * AIlevelF / 8.0)
map = "gurenken"
value = 1200
ignorehitpause = 1

[State 1005, Guren Hou Shou]
type = mapset
triggerall = time > 0
triggerall = animelemtime(9) < 0
triggerall = !map(gurenken)
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = animelemtime(4) >= 0
trigger2 = movehit || p2life < 15
trigger2 = random < (100 * AIlevelF / 8.0)
map = "gurenken"
value = 1010
ignorehitpause = 1

[State 1005, Follow-up Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = !map(gurenken_strength) && animelemtime(9) < 0
trigger1 = map(gurenken) = 1010 || map(gurenken) = 1020 || map(gurenken) = 1300
map = "gurenken_strength"
value = ifelse(map(cmd_z), 2, ifelse(map(cmd_y), 1, 0))

[State 1005, Follow-up Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = !map(gurenken_strength) && animelemtime(9) < 0
trigger1 = map(gurenken) = 1015 || map(gurenken) = 1025 || map(gurenken) = 1200 || map(gurenken) = 1400
map = "gurenken_strength"
value = ifelse(map(cmd_c), 2, ifelse(map(cmd_b), 1, 0))

[State 1005, Follow-up Strength]
type = mapset
trigger1 = AIlevel
trigger1 = animelemtime(9) < 0
map = "gurenken_strength"
value = 2

[State 1005, Follow-up type]
type = mapset
trigger1 = time <= 1
map = "gurenken"
value = 0

[State 1005, Follow-up Strength]
type = mapset
trigger1 = time <= 1
map = "gurenken_strength"
value = 0

[State 1005, Follow-up]
type = changestate
trigger1 = map(gurenken) = [1000, 2999]
trigger1 = animelemtime(6) >= 0 && animelemtime(9) < 0
value = map(gurenken)

[State 1005, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 1005, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Guren Hou Shou -----
[Statedef 1010]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1010, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = map(gurenken_strength)

[State 1010, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1010, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1102, ifelse(map(strength) = 1, 1101, 1100))

[State 1010, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -0.1628, ifelse(map(strength) = 1, -0.1221, -0.0814))

[State 1010, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1010, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.19, ifelse(map(strength) = 1, 4.15, 3.08))

[State 1010, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0

[State 1010, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1010, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1010, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1010, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 90, ifelse(map(strength) = 1, 85, 80)), ifelse(map(strength) = 2, 22, ifelse(map(strength) = 8, 21, 20))
dizzypoints = 50 * !map(customcombo)
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
ground.velocity = -5.23, -6.5
guard.velocity = -10.52
air.velocity = -5.23, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 95), map(sparky) := -58
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1010, Type]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Guren Kusabi -----
[Statedef 1015]
type = C
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 2
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1015, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = map(gurenken_strength)

[State 1015, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1015, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -0.1628, ifelse(map(strength) = 1, -0.1221, -0.0814))

[State 1015, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1015, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.19, ifelse(map(strength) = 1, 4.15, 3.08))

[State 1015, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 6
channel = 0

[State 1015, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 101

[State 1015, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
trigger1 = animelemtime(8) < 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(32 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1015, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1015, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, SA
hitflag = MAFD
guardflag = L
priority = 4, Hit
damage = 80, 20
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Trip
air.type = Trip
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -1.0, -8.0
guard.velocity = -10.52
air.velocity = -1.0, -8.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.695
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -5
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
down.hittime = 18
down.velocity = 0, 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ID = 1015

[State 1015, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 1015, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- Guren Yasha Joudan -----
[Statedef 1020]
type = S
physics = N
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1020, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.083125

[State 1020, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1020, Vel]
type = velset
trigger1 = !time
x = 2

[State 1020, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-38 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1

[State 1020, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1020, Reversal]
type = reversaldef
trigger1 = !movecontact
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
reversal.attr = SA, NA, SA, HA
pausetime = 0, 20
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1510

[State 1020, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1020, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Guren Yasha Gedan -----
[Statedef 1025]
type = S
physics = N
movetype = A
anim = 1505
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1025, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.083125

[State 1025, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1025, Vel]
type = velset
trigger1 = !time
x = 2

[State 1025, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-38 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1025, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1

[State 1025, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1025, Reversal]
type = reversaldef
trigger1 = !movecontact
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
reversal.attr = C, NA, SA, HA
pausetime = 0, 20
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1510

[State 1025, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1025, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1025, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HOU SHOU>=============================
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
value = ifelse((p2movetype = H || random < 333), 0, ifelse(random < 500, 1, 2))
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

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 5100
volumescale = 75

[State 1100, Shake]
type = envshake
trigger1 = animelem = 6
time = 12
ampl = 1
freq = 180

[State 1100, Dust]
type = explod
trigger1 = animelem = 6
anim = 8105
sprpriority = -3
postype = p1
pos = ceil(57 * const(size.xscale)), 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1100, Autoguard]
type = reversaldef
trigger1 = animelem = 4
persistent = 0
reversal.attr = SCA, NA, SA
pausetime = 12, 12
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
numhits = 0

[State 1100, Spark]
type = explod
trigger1 = map(cfg_sparks)
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = animelemtime(6) < 0
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = p2dist x / 2.0, -74 * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = (100 + map(strength) * 10), (25 + map(strength) * 3)
dizzypoints = ifelse(map(strength) = 2, 200, ifelse(map(strength) = 1, 150, 100)) * !map(customcombo)
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
ground.velocity = -5.23, -6.5
guard.velocity = -10.52
air.velocity = -5.23, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 95), map(sparky) := -58
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1100, Type]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX HOU SHOU>=============================
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
pos = ceil(-15 * const(size.xscale)), ceil(-59 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, Vel]
type = velset
trigger1 = animelem = 5
x = 8

[State 1120, Vel]
type = velset
trigger1 = animelem = 7
x = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 8
channel = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 5100
volumescale = 100

[State 1120, Shake]
type = envshake
trigger1 = animelem = 6
time = 12
ampl = 1
freq = 180

[State 1120, Dust]
type = explod
trigger1 = animelem = 6
anim = 8105
sprpriority = -3
postype = p1
pos = ceil(57 * const(size.xscale)), 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, Autoguard]
type = reversaldef
trigger1 = animelem = 3
persistent = 0
reversal.attr = SCA, NA, SA
pausetime = 12, 12
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
numhits = 0

[State 1120, Spark]
type = explod
trigger1 = map(cfg_sparks)
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = animelemtime(6) < 0
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = p2dist x / 2.0, -74 * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1120, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1120
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 90, 23
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
airguard.ctrltime = 1 + 16
ground.velocity = -16.0, -3.00
guard.velocity = -10.52
air.velocity = -16.0, -3.00
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 95), map(sparky) := -58
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1120, Wall Bounce]
type = targetstate
trigger1 = !map(wallbounce)
trigger1 = movehit = 1
trigger1 = numtarget(1120)
trigger1 = target(1120), dizzy = 0
trigger1 = target(1120), dizzypoints > abs(target(1120), gethitvar(dizzypoints))
trigger1 = target(1120), stateno = 5000 || target(1120), stateno = 5010 || target(1120), stateno = 5020
trigger1 = 1 || map(wallbounce) := 1
value = 1125
ID = 1120
ignorehitpause = 1

[State 1120, Juggle Reset]
type = mapset
trigger1 = numtarget(1120)
trigger1 = target(1120), stateno = 1125
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 1120, Type]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1120, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<HIT by EX HOU SHOU>=============================
;----- Hit Pause -----
[Statedef 1125]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1125, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 1125, End]
type = changestate
trigger1 = hitshakeover
value = 1126


;----- Falling -----
[Statedef 1126]
type = A
physics = N
movetype = H

[State 1126, Accel]
type = veladd
trigger1 = 1
y = ifelse(vel y < 0, 0.5, 1.0) * gethitvar(yaccel)

[State 1126, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1126, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = abs(player(gethitvar(playerno)), pos x - pos x) < (320 - stagevar(camera.tension) * 2), 0

[State 1126, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1126, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1126, Bounce]
type = changestate
trigger1 = time >= 4
trigger1 = pos y < 0
trigger1 = backedgebodydist <= 0 || frontedgebodydist <= 0
value = 1127

[State 1126, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;----- Target Hitting Wall -----
[Statedef 1127]
type = A
physics = N
movetype = H

[State 1127, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1127, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 1127, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1127, Screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1127, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1127, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1127, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1127, FX]
type = explod
trigger1 = !time
anim = F 72
postype = back
pos = 0, ceil((240.0 / gameheight) * (screenpos y + const(size.mid.pos.y)))
scale = (320.0 / gamewidth), (320.0 / gamewidth)
sprpriority = -5
ownpal = 1

[State 1127, End]
type = changestate
trigger1 = time >= 4
value = 1128


;----- Falling -----
[Statedef 1128]
type = A
physics = N
movetype = H

[State 1128, turn]
type = turn
trigger1 = !time

[State 1128, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 1128, Track Nearest Player]
type = velset
trigger1 = !time
x = ((p2, pos x - pos x) * facing + 60) / 36.0
y = (pos y + 0.5 * 0.4850 * 36 ** 2) / -36.0

[State 1128, Track Exact Player]
type = velset
trigger1 = !time
trigger1 = gethitvar(playerno)
trigger1 = playerIDexist(player(gethitvar(playerno)), ID)
x = ((player(gethitvar(playerno)), pos x - pos x) * facing + 60) / 36.0

[State 1128, Vel]
type = velset
trigger1 = !time
trigger1 = vel x != [-8, 0]
x = ifelse(vel x <= -8, -8, 0)


[State 1128, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1128, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = !animtime
value = 5050

[State 1128, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = vel y > -2
value = 5061

[State 1128, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1128, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1128, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;======================<MUJIN KYAKU>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling) * (prevstateno != [1000, 1005])
facep2 = (prevstateno != [1000, 1005])

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
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, Follow-up Strength]
type = mapset
trigger1 = !time
trigger1 = (prevstateno = [1000, 1005])
map = "strength"
value = map(gurenken_strength)

[State 1200, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -0.1628, ifelse(map(strength) = 1, -0.1221, -0.0814))

[State 1200, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1200, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.19, ifelse(map(strength) = 1, 4.15, 3.08))

[State 1200, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 1, 5
channel = 1
stopongethit = 1

[State 1200, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(animelemtime(8) % 6) && animelemtime(8) >= 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1200, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 40, ifelse(map(strength) = 1, 45, 50)), ifelse(map(strength) = 2, 13, ifelse(map(strength) = 1, 14, 15))
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.23, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 65), map(sparky) := -34
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1200, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -1.35, -9.0
guard.velocity = -7.51
air.velocity = -1.35, -9.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 55), map(sparky) := -80
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(8) >= 0 && animelemtime(9) <= 0
trigger1 = hitpausetime <= 3
value = 1200
elem = 9
ignorehitpause = 1

[State 1200, Type]
type = statetypeset
trigger1 = animelem = 10
movetype = I

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX MUJIN KYAKU>=============================
[Statedef 1220]
type = A
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
pos = ceil(-1 * const(size.xscale)), ceil(-33 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.1628

[State 1220, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1220, Vel]
type = velset
trigger1 = !time
x = 5.19

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 1, 5
channel = 1
stopongethit = 1

[State 1220, Dust]
type = explod
trigger1 = !(time % 6) && vel x >= 1
trigger1 = animelemtime(8) >= 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
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
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.23, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 65), map(sparky) := -34
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1220, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -1.35, -9.0
guard.velocity = -7.51
air.velocity = -1.35, -9.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 55), map(sparky) := -80
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1220, Anim]
type = changeanim
trigger1 = anim = 1220
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(8) >= 0 && animelemtime(9) <= 0
trigger1 = hitpausetime <= 3
value = 1220
elem = 9
ignorehitpause = 1

[State 1220, Type]
type = statetypeset
trigger1 = animelem = 10
movetype = I

[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX GURENKEN (RESSEN CHOU)>=============================
[Statedef 1300]
type = S
physics = N
movetype = A
anim = 1300
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

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1300, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(36 * const(size.xscale)), ceil(-48 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1300, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.1628

[State 1300, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1300, Vel]
type = velset
trigger1 = !time
x = 5.19

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 6
channel = 0

[State 1300, Sound]
type = playsnd
trigger1 = !time
value = 0, 100

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1300, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
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
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.32, -7.62
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 70), map(sparky) := -64
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1300, Follow-up type]
type = mapset
triggerall = time > 0
triggerall = !map(gurenken)
triggerall = animelemtime(11) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
map = "gurenken"
value = 1305
ignorehitpause = 1

[State 1300, Follow-up type]
type = mapset
trigger1 = time <= 1
map = "gurenken"
value = 0

[State 1300, Follow-up]
type = changestate
trigger1 = map(gurenken) = 1305
trigger1 = animelemtime(8) >= 0 && animelemtime(11) < 0
value = 1305

[State 1300, Type]
type = statetypeset
trigger1 = animelem = 8
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Ressen Chuu -----
[Statedef 1305]
type = S
physics = N
movetype = A
anim = 1305
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

[State 1305, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1305, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.1628

[State 1305, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1305, Vel]
type = velset
trigger1 = !time
x = 5.19

[State 1305, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0

[State 1305, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1305, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
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
ground.velocity = -5.32, -7.62
guard.velocity = -10.52
air.velocity = -5.32, -7.62
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -64
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1305, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 1305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RESSEN HA>=============================
[Statedef 1400]
type = S
physics = N
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling) * (prevstateno != [1000, 1005])
facep2 = (prevstateno != [1000, 1005])

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
value = ifelse(p2dist x >= 160, 2, ifelse(p2dist x >= 80, 1, 0))
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, Follow-up Strength]
type = mapset
trigger1 = !time
trigger1 = (prevstateno = [1000, 1005])
map = "strength"
value = map(gurenken_strength)

[State 1400, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1402, ifelse(map(strength) = 1, 1401, 1400))

[State 1400, NHB]
type = nothitby
trigger1 = animelemtime(2) >= 0
trigger1 = vel y <= 0
value = , AP
time = 1
ignorehitpause = 1

[State 1400, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = ifelse(anim = 1402, 0.76, ifelse(anim = 1401, 0.71, 0.635))

[State 1400, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(anim = 1402, 7.92, ifelse(anim = 1401, 6.22, 5.60))
y = ifelse(anim = 1402, -8.77, ifelse(anim = 1401, -7.82, -6.67))

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 1400, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 40, 10
dizzypoints = 50 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -7.51, 0
guard.velocity = -7.51
air.velocity = -5.33, -6.46
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1400, End]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1405


;----- Land -----
[Statedef 1405]
type = S
physics = N
movetype = A
anim = 1405
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1405, Pos]
type = posset
trigger1 = 1
y = 0

[State 1405, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0

[State 1405, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 2
;channel = 1
stopongethit = 1

[State 1405, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1405, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 14, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1405, Hit]
type = hitdef
trigger1 = animelem = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
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
ground.velocity = -10.52
guard.velocity = -10.52
air.velocity = -5.33, -6.45
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 85), map(sparky) := -30
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1405, Anim]
type = changeanim
trigger1 = anim = 1405
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(1) >= 0 && animelemtime(2) <= 0
trigger1 = hitpausetime <= 9
value = 1405
elem = 2
ignorehitpause = 1

[State 1405, Anim]
type = changeanim
trigger1 = anim = 1405
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 7
value = 1405
elem = 3
ignorehitpause = 1

[State 1405, Anim]
type = changeanim
trigger1 = anim = 1405
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 1405
elem = 4
ignorehitpause = 1

[State 1405, Type]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[State 1405, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX RESSEN HA>=============================
[Statedef 1420]
type = S
physics = N
movetype = A
anim = 1420
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
pos = ceil(9 * const(size.xscale)), ceil(-52 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1420, NHB]
type = nothitby
trigger1 = vel y <= 0
value = , AP
time = 1
ignorehitpause = 1

[State 1420, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.76

[State 1400, Vel]
type = velset
trigger1 = animelem = 2
x = 6.22
y = -8.77

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 4
channel = 0

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
;channel = 1
stopongethit = 1

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 1420, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1420, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 20, 5
dizzypoints = 50 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 12; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = 0
air.velocity = -5.33, -6.46
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1420, End]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1425


;----- Land -----
[Statedef 1425]
type = S
physics = N
movetype = A
anim = 1425
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1425, Pos]
type = posset
trigger1 = 1
y = 0

[State 1425, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0

[State 1425, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 2
;channel = 1
stopongethit = 1

[State 1425, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1425, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 14, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1425, Hit]
type = hitdef
trigger1 = animelem = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 80, 20
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
ground.velocity = -10.52
guard.velocity = -10.52
air.velocity = -5.33, -6.45
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 85), map(sparky) := -30
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1425, Anim]
type = changeanim
trigger1 = anim = 1425
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(1) >= 0 && animelemtime(2) <= 0
trigger1 = hitpausetime <= 9
value = 1425
elem = 2
ignorehitpause = 1

[State 1425, Anim]
type = changeanim
trigger1 = anim = 1425
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 6
value = 1425
elem = 3
ignorehitpause = 1

[State 1425, Anim]
type = changeanim
trigger1 = anim = 1425
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 3
value = 1425
elem = 4
ignorehitpause = 1

[State 1425, Type]
type = statetypeset
trigger1 = animelem = 2
movetype = I

[State 1425, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<YASHA GAESHI>=============================
;----- Joudan -----
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
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1

[State 1500, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = !movecontact
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
reversal.attr = SA, NA, SA, HA
pausetime = 0, 20
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1510

[State 1500, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1500, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Gedan -----
[Statedef 1505]
type = S; C looks better but is less vulnerable
physics = S
movetype = A
anim = 1505
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 100 * map(meterscaling)
facep2 = 1

[State 1505, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1

[State 1505, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1505, Reversal]
type = reversaldef
trigger1 = !movecontact
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
reversal.attr = C, NA, SA, HA
pausetime = 0, 20
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1510

[State 1505, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1505, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Counter -----
[Statedef 1510]
type = S
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 0

[State 1510, Spark]
type = explod
trigger1 = map(cfg_sparks)
trigger1 = !time
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = ifelse(prevstateno = 1505, 14, 32) * const(size.xscale), ifelse(prevstateno = 1505, -20, -56) * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 6 + (random % 3)
channel = 0

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 1510, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 110, 28
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
ground.hittime = 1 + 15; + 2 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -5.23, -6.5
guard.velocity = -10.52
air.velocity = -5.23, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 70), map(sparky) := -55
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1510, Anim]
type = changeanim
trigger1 = anim = 1510
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 10
value = 1510
elem = 4
ignorehitpause = 1

[State 1510, Type]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1510, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX YASHA GAESHI>=============================
[Statedef 1520]
type = S
physics = S
movetype = A
anim = 1520
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1

[State 1520, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1520, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1520, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1520, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(15 * const(size.xscale)), ceil(-42 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1520, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1
stopongethit = 1

[State 1520, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1520, Reversal]
type = reversaldef
trigger1 = !movecontact
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
reversal.attr = SCA, NA, SA, HA
pausetime = 0, 20
sparkno = ifelse(map(cfg_sparks), -1, 40) + 0 * (map(sparkno) := -1)
sparkxy = 20, 0
hitsound = s3, 0
p1stateno = 1530

[State 1520, Reversal Miss]
type = reversaldef
trigger1 = numenemy = 1
trigger1 = reversaldefattr = SCA, AA, AP, AT
trigger1 = p2dist x < -const(size.ground.back)
attr =
reversal.attr =

[State 1520, Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 1520, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Counter -----
[Statedef 1530]
type = S
physics = N
movetype = A
anim = 1530
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 0

[State 1530, Spark]
type = explod
trigger1 = map(cfg_sparks)
trigger1 = !time
ID = 8000
anim = ifelse(p2, hitdefattr = SCA, NA, 8000, 8001)
postype = p1
pos = 35 * const(size.xscale), -57 * const(size.yscale)
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1
ignorehitpause = 1
persistent = 0

[State 1530, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 6 + (random % 3)
channel = 0

[State 1530, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1530, Hit]
type = hitdef
trigger1 = animelem = 4
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
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = Low
air.type = Low
ground.hittime = 1 + 15; + 2 * map(counterhit_buffer)
ground.slidetime = 15
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -1.25, -11
guard.velocity = -10.52
air.velocity = -1.25, -11
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 55), map(sparky) := -60
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1530, Juggle Reset]
type = mapset
trigger1 = time > 0
trigger1 = movehit = 1
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 1530, Jump Cancel]
type = changestate
value = 40
triggerall = movecontact
triggerall = roundstate = 2
trigger1 = !AIlevel
trigger1 = command = "holdup"
ignorehitpause = 0

[State 1530, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 1530, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<ARAKUMA INASHI>=============================
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
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
value = ifelse(p2bodydist x <= 31, 2, ifelse(p2bodydist x <= 33, 1, 0))
ignorehitpause = 1

[State 1600, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1600, EX Version]
type = mapset
trigger1 = !time
map = "exversion"
value = 0

[State 1600, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1600, Hit]
type = hitdef
triggerall = animelem = 3
triggerall = !map(unthrowable) && !map(grabbehind)
trigger1 = map(strength) = 0 && map(truebodydistx) <= ceil(35 * const(size.xscale))
trigger2 = map(strength) = 1 && map(truebodydistx) <= ceil(33 * const(size.xscale))
trigger3 = map(strength) = 2 && map(truebodydistx) <= ceil(31 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -50
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 1610
p2stateno = 1615

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 9
channel = 0

[State 1600, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
;channel = 1
stopongethit = 1

[State 1600, Type]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Player -----
[Statedef 1610]
type = S
physics = S
movetype = A
anim = 1610
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1610, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1610, Width]
type = width
trigger1 = 1
edge = ceil(48 * const(size.xscale)), 0

[State 1610, Timer Start]
type = varset
trigger1 = !time
var(51) = ifelse(map(exversion), 120, 60);135

[State 1610, Timer Round Over]
type = varset
trigger1 = roundstate != 2
var(51) = 0

[State 1610, Timer Decrease]
type = varadd
trigger1 = hitcount
var(51) = -1

[State 1610, Timer Decrease]; Should add -4, but that was designed for a stick
type = varadd
triggerall = numtarget
triggerall = hitcount
trigger1 = target, AIlevel = 0
trigger1 = target, command = "U" || target, command = "D" || target, command = "B" || target, command = "F"; no diagonals
trigger2 = target, AIlevel > 0
trigger2 = random < (200 * (target, AIlevelF / 8.0))
var(51) = -2

[State 1610, Timer Decrease]; Should add -1, but that was designed for a stick
type = varadd
triggerall = numtarget
triggerall = hitcount
trigger1 = target, AIlevel = 0
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger2 = target, command = "a" || target, command = "b" || target, command = "c"
trigger3 = target, AIlevel > 0
trigger3 = random < (200 * (target, AIlevelF / 8.0))
var(51) = -2

[State 1610, End]
type = changestate
triggerall = hitcount
triggerall = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger1 = var(51) <= 0
trigger2 = numtarget
trigger2 = !(target, alive)
value = 1620

[State 1610, P1 Mashing]
type = varset
trigger1 = !time
var(12) = 0

[State 1610, P1 Mashing]
type = varadd
triggerall = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel > 0
trigger3 = random < (750 * (AIlevelF / 8.0))
var(12) = 1

[State 1610, Anim Skip]
type = changeanim
triggerall = var(51) > 0
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(5) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 1610
elem = animelemno(0) + 1

[State 1610, Anim Skip]
type = changeanim
triggerall = var(51) > 0
trigger1 = animelemtime(5) > 0
trigger1 = animelemtime(5) >= (5 -var(12))
trigger1 = 1 || var(12) := (var(12) + 5 - animelemtime(5))
value = 1610
elem = 1

[State 1610, P1 Mashing]
type = varset
trigger1 = var(12) < 0
var(12) = 0

[State 1610, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel > 0
trigger3 = random < (750 * (AIlevelF / 8.0))
time = 1
add = 32, 32, 32

[State 1610, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
value = 1615

[State 1610, Throw]
type = targetstate
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(5) >= 0
value = 1616

[State 1610, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
value = 1617

[State 1610, Throw]
type = targetfacing
trigger1 = numtarget
value = -1

[State 1610, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0 || animelemtime(5) >= 0
pos = 45 * const(size.xscale), 0

[State 1610, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
pos = 50 * const(size.xscale), -66 * const(size.yscale)

[State 1610, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 3 && !hitcount
value = floor(-80 * map(damagescaling))
dizzy = 0

[State 1610, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 3 && hitcount
value = floor(-10 * map(damagescaling))
dizzy = 0

[State 1610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 6
channel = 0

[State 1610, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 1610, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 3
value = 1

[State 1610, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 3
value = 2, 4
channel = 2

;[State 1610, Spark]
;in ZSS

[State 1610, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 3
time = 10
freq = 180
ampl = 1


;----- TARGET -----
[Statedef 1615]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1615, Anim]
type = changeanim2
trigger1 = !time
value = 1615

[State 1615, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1615, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel > 0
trigger3 = random < (200 * (AIlevelF / 8.0))
time = 1
add = 96, 0, 0

[State 1615, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1616]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1616, Anim]
type = changeanim2
trigger1 = !time
value = 1616

[State 1616, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1616, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel > 0
trigger3 = random < (200 * (AIlevelF / 8.0))
time = 1
add = 96, 0, 0

[State 1616, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1617]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1617, Anim]
type = changeanim2
trigger1 = !time
value = 1617

[State 1617, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1617, Flash]
type = palfx
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel > 0
trigger3 = random < (200 * (AIlevelF / 8.0))
time = 1
add = 96, 0, 0

[State 1617, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- Flip -----
[Statedef 1620]
type = S
physics = S
movetype = A
anim = 1620
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1620, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1625

[State 1620, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4 || animelem = 6
x = 16 * const(size.xscale)

[State 1620, Pos]
type = posadd
trigger1 = animelem = 5
x = 6 * const(size.xscale)

[State 1620, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
pos = 45 * const(size.xscale), 0

[State 1620, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 19 * const(size.xscale), 0

[State 1620, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 13 * const(size.xscale), 0

[State 1620, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 12 * const(size.xscale), -60 * const(size.yscale)

[State 1620, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 12 * const(size.xscale), -60 * const(size.yscale)

[State 1620, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 0, -70 * const(size.yscale)

[State 1620, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 8
pos = -12 * const(size.xscale), -40 * const(size.yscale); -60

[State 1620, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 8
value = floor(-60 * map(damagescaling))
dizzy = 0

[State 1620, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 8
value = 1

[State 1620, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 8
value = floor(-150 * map(damagescaling)) * !map(customcombo)

[State 1620, givepower]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 8
value = 40; givepower

[State 1620, getpower]
type = poweradd
trigger1 = animelem = 8
trigger1 = !map(exversion)
value = 200 * map(meterscaling); getpower

[State 1620, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 8
value = 1626

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 9
channel = 0

[State 1620, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 5
;channel = 1
stopongethit = 1

[State 1620, Turn]
type = turn
trigger1 = !animtime

[State 1620, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1625]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1625, Anim]
type = changeanim2
trigger1 = !time
value = 1625

[State 1625, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1625, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1626]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1626, Anim]
type = changeanim2
trigger1 = !time
value = 1626

[State 1626, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1626, Accel]
type = veladd
trigger1 = 1
y = 0.75

[State 1626, Vel]
type = velset
trigger1 = !time
x = 3.33
y = -5

[State 1626, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1626, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1626, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;======================<EX ARAKUMA INASHI>=============================
[Statedef 1630]
type = S
physics = S
movetype = A
anim = 1600
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

[State 1630, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1630, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x <= 31, 2, ifelse(p2bodydist x <= 33, 1, 0))
ignorehitpause = 1

[State 1630, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1630, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1630, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1630, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(36 * const(size.xscale)), ceil(-48 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1630, EX Version]
type = mapset
trigger1 = !time
map = "exversion"
value = 1

[State 1630, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1630, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(35 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -50
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
fall = 1
fall.recover = 1
numhits = 0
p1stateno = 1610
p2stateno = 1615

[State 1630, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 9
channel = 0

[State 1630, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
;channel = 1
stopongethit = 1

[State 1630, Type]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 1630, End]
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
poweradd = 0

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Pos]
type = posadd
trigger1 = animelem = 2
trigger2 = animelem = 3
x = 16 * const(size.xscale)

[State 2900, Pos]
type = posadd
trigger1 = animelem = 9
trigger2 = animelem = 10
x = -16 * const(size.xscale)

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
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
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -5.54, -5.25
guard.velocity = -10.52
air.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -45) * (map(sparkx.max) := 65), map(sparky) := -77
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 2900, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

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

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 5
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

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
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -5.54, -5.25
guard.velocity = -10.52
air.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 120), map(sparky) := -8
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2

[State 2910, Type]
type = statetypeset
trigger1 = animelem = 6
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
