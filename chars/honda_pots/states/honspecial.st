; _______________________________________
;| Edmond Honda by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;========================<HYAKURETSU HARITE>=============================
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
trigger1 = numenemy
map = "strength"
value = ifelse((p2, gethitvar(hittime) <= 4), 0, ifelse((p2, gethitvar(hittime) <= 6), 1, 2))
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

[State 1010, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 5.00, ifelse(map(strength) = 1, 4.00, 3.00))

[State 1000, Sound]
type = playsnd
trigger1 = !time
value = 0, 102

[State 1000, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 1010


;----- Looping -----
[Statedef 1010]
type = S
physics = N
movetype = A
anim = 1010
ctrl = 0
sprpriority = 2

[State 1010, Strength]
type = mapset
trigger1 = !time
map = "strength_alt"
value = map(strength)
ignorehitpause = 1

[State 1010, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time > 0
trigger1 = map(cmd_x) || map(cmd_y) || map(cmd_z)
map = "strength_alt"
value = ifelse(map(cmd_z), 2, ifelse(map(cmd_y), 1, 0))
ignorehitpause = 1

[State 1010, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time > 0
trigger1 = animelem = 5
map = "strength_alt"
value = ifelse(random < 500, 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1010, AI Mash Punch Timer]
type = mapadd
map = "cmd_check_mashp_timer"
trigger1 = AIlevel
trigger1 = map(cmd_check_mashp_timer) > 0
value = -1
ignorehitpause = 1

[State 1010, AI Mash Punch Timer]
type = mapset
map = "cmd_check_mashp_timer"
trigger1 = AIlevel
trigger1 = numenemy
trigger1 = p2statetype != A && (p2bodydist x = [0, 75])
value = 12
ignorehitpause = 1

[State 1010, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1012, ifelse(map(strength) = 1, 1011, 1010))

[State 1010, Loop];enables animelem = 1 triggers to activate again
type = changeanim
trigger1 = !animtime
value = anim
elem = 1

[State 1010, Change Speed]
type = changeanim
triggerall = map(cmd_check_mashp_timer)
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
value = ifelse(map(strength_alt) = 2, 1012, ifelse(map(strength_alt) = 1, 1011, 1010))
elem = animelemno(0)

[State 1010, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.6667

[State 1010, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1010, Looping Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 4
trigger1 = map(strength) != 2 || time >= (48 - 12 * hitcount)
value = 4, 0
channel = 0
volumescale = ifelse(time <= 25, 100, ifelse(time >= 75, 75, 100 - (time - 25) * 0.5))

[State 1010, Sound]
type = playsnd
trigger1 = !time
trigger1 = map(strength) = 2
value = 4, 4
channel = 0

[State 1010, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 4
value = 7, ifelse(map(strength_alt) = 2, 10, ifelse(map(strength_alt) = 1, 9, 8))
;channel = 1
stopongethit = 1

[State 1010, Spark XY]
type = null
trigger1 = animelem = 1
trigger1 = map(sparkx.min) := 60 || map(sparkx.max) := 120 || map(sparky) := -55
trigger2 = animelem = 3
trigger2 = map(sparkx.min) := 60 || map(sparkx.max) := 113 || map(sparky) := -26
trigger3 = animelem = 5
trigger3 = map(sparkx.min) := 60 || map(sparkx.max) := 111 || map(sparky) := -84

[State 1010, Hit High]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 25, 6
dizzypoints = 20 * !map(customcombo)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + ifelse(map(strength_alt) = 2, 18, ifelse(map(strength_alt) = 1, 15, 12)); + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + ifelse(map(strength_alt) = 2, 18, ifelse(map(strength_alt) = 1, 15, 12))
guard.ctrltime = 1 + ifelse(map(strength_alt) = 2, 16, ifelse(map(strength_alt) = 1, 13, 10))
guard.slidetime = 12
air.hittime = 120
ground.velocity = ifelse(map(strength_alt) = 2, -6.66, ifelse(map(strength_alt) = 1, -5.00, -3.33)), 0; unique
ground.cornerpush.veloff = 0
guard.velocity = ifelse(map(strength_alt) = 2, -6.66, ifelse(map(strength_alt) = 1, -5.00, -3.33)); unique
guard.cornerpush.veloff = 0
air.velocity = -4.00, -6.00
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
sparkxy = -10, -55
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1010, Hit Low]
type = modifyhitdef
trigger1 = animelem = 3
ground.type = Low

[State 1010, End]
type = changestate
trigger1 = !map(cmd_check_mashp_timer) || roundstate != 2 || time >= 90
trigger1 = animelem = 2 || animelem = 4 || animelem = 6
trigger1 = time >= ifelse(map(strength) = 2, 12, ifelse(map(strength) = 1, 18, 24))
value = 1020


;----- Recover -----
[Statedef 1020]
type = S
physics = N
movetype = I
anim = ifelse(anim = 1012, 1022, ifelse(anim = 1011, 1021, 1020))
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 1020, Accel]
type = veladd
trigger1 = time
trigger1 = vel x > 0
x = -0.6667

[State 1020, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX HYAKURETSU HARITE>=============================
[Statedef 1030]
type = S
physics = N
movetype = A
anim = 1030
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

[State 1030, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1030, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1030, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(16 * const(size.xscale)), ceil(-48 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, Vel]
type = velset
trigger1 = !time
x = 6.00

[State 1030, Sound]
type = playsnd
trigger1 = !time
value = 0, 102

[State 1030, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1030, End]
type = changestate
trigger1 = !animtime
value = 1031


;----- Looping -----
[Statedef 1031]
type = S
physics = N
movetype = A
anim = 1031
ctrl = 0
sprpriority = 2

[State 1031, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.50

[State 1031, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1031, Sound]
type = playsnd
trigger1 = !time
value = 4, 4
channel = 0

[State 1030, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 4 || animelem = 7 || animelem = 10
value = 7, 11
;channel = 1
stopongethit = 1

[State 1031, Spark XY]
type = null
trigger1 = animelem = 1 || animelem = 7
trigger1 = map(sparkx.min) := 60 || map(sparkx.max) := 120 || map(sparky) := -55
trigger2 = animelem = 3 || animelem = 9
trigger2 = map(sparkx.min) := 60 || map(sparkx.max) := 113 || map(sparky) := -26
trigger3 = animelem = 5 || animelem = 11
trigger3 = map(sparkx.min) := 60 || map(sparkx.max) := 111 || map(sparky) := -84

[State 1031, Hit High]
type = hitdef
trigger1 = animelem = 1 || animelem = 5 || animelem = 9
trigger2 = animelem = 3 || animelem = 7 || animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 5
dizzypoints = 33 * !map(customcombo)
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 12
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -3.33, 0; unique
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -5.40, -5.25
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
sparkxy = -10, -55
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1031, Hit Low]
type = modifyhitdef
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
ground.type = Low

[State 1031, End]
type = changestate
trigger1 = !animtime
value = 1032


;----- Recover -----
[Statedef 1032]
type = S
physics = N
movetype = I
anim = 1032
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 1032, Accel]
type = veladd
trigger1 = time && vel x > 0
x = -0.50

[State 1032, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1032, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<SUPER ZUTSUKI>=============================
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
value = ifelse((p2bodydist x > 180 || p2movetype = H || map(customcombo)), 2, ifelse(p2bodydist x > 160, 1, 0))
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
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1102, ifelse(map(strength) = 1, 1101, 1100))

[State 1100, NHB]
type = nothitby
trigger1 = animelemtime(2) < 0
value = SCA
time = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1100, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 1100, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 8 * const(size.xscale)

[State 1100, Pos]
type = posadd
trigger1 = animelem = 5
x = 16 * const(size.xscale)

[State 1100, Vel]
type = velset
trigger1 = animelem = 5
x = ifelse(map(strength) = 2, 9.268, ifelse(map(strength) = 1, 6.858, 4.864))
y = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 2
channel = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(map(strength) = 2, 140, ifelse(map(strength) = 1, 130, 120)), ifelse(map(strength) = 2, 35, ifelse(map(strength) = 1, 33, 30))
dizzypoints = 200 * !map(customcombo)
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
ground.velocity = ifelse(map(strength) = 2, -4.00, ifelse(map(strength) = 1, -3.50, -3.00)), ifelse(map(strength) = 2, -4.50, ifelse(map(strength) = 1, -5.00, -5.50))
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = ifelse(map(strength) = 2, -4.00, ifelse(map(strength) = 1, -3.50, -3.00)), ifelse(map(strength) = 2, -4.50, ifelse(map(strength) = 1, -5.00, -5.50))
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 21), map(sparky) := -66
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 120, ifelse(map(strength) = 1, 110, 100)), ifelse(map(strength) = 2, 30, ifelse(map(strength) = 1, 28, 25))
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
ground.velocity = ifelse(map(strength) = 2, -4.00, ifelse(map(strength) = 1, -3.50, -3.00)), ifelse(map(strength) = 2, -4.50, ifelse(map(strength) = 1, -5.00, -5.50))
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = ifelse(map(strength) = 2, -4.00, ifelse(map(strength) = 1, -3.50, -3.00)), ifelse(map(strength) = 2, -4.50, ifelse(map(strength) = 1, -5.00, -5.50))
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1100, End]
type = changestate
trigger1 = !animtime
trigger2 = animelemtime(4) > 0
trigger2 = movecontact || movereversed
trigger3 = animelemtime(5) >= 11
trigger3 = frontedgebodydist <= 0
value = 1110

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 12

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

[State 1100, Wind]
type = explod
trigger1 = animelemtime(5) = 0
trigger2 = animelemtime(5) = 3 && map(strength) > 0
trigger3 = animelemtime(5) = 6 && map(strength) > 1
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Recover -----
[Statedef 1110]
type = A
physics = N
movetype = I
anim = 1110
ctrl = 0
velset = 0.5 * vel x, 0
sprpriority = 2
movehitpersist = 1

[State 1110, Accel]
type = veladd
trigger1 = vel x != 0
x = ifelse(vel x > 0, -0.167, ifelse(vel x < 0, 0.167, -vel x))

[State 1110, Vel]
type = velset
trigger1 = !time
trigger1 = (movecontact + movereversed) = [1, 4]
x = -3.00
y = 0

[State 1110, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = S
physics = S

[State 1110, Pos]
type = posset
trigger1 = animelem = 5
y = 0

[State 1110, Vel]
type = velset
trigger1 = animelem = 5
x = 0
y = 0

[State 1110, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 52

[State 1110, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX SUPER ZUTSUKI>=============================
[Statedef 1130]
type = S
physics = N
movetype = A
anim = 1130
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

[State 1130, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1130, Lose Charge]
type = mapset
map = "charge4"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 0
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
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[State 1130, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 1130, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 12

[State 1130, Dust]
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

[State 1130, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 1110, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 8 * const(size.xscale)

[State 1110, Pos]
type = posadd
trigger1 = animelem = 5
x = 16 * const(size.xscale)

[State 1130, Vel]
type = velset
trigger1 = animelem = 5
x = 12.357
y = 0

[State 1130, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 2
channel = 0

[State 1130, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
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
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -6.00
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1130, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
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
ground.velocity = -4.00, -6.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -6.00
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1130, End]
type = changestate
trigger1 = !animtime
trigger2 = animelemtime(5) > 0
trigger2 = movecontact = 1 || movereversed = 1
trigger3 = animelemtime(5) >= 11
trigger3 = frontedgebodydist <= 0
value = 1110

[State 1130, Wind]
type = explod
trigger1 = animelemtime(5) = 0
trigger2 = animelemtime(5) = 3
trigger3 = animelemtime(5) = 6
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;========================<SUPER HYAKKAN OTOSHI>=============================
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
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

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
value = ifelse(map(customcombo), 1, ifelse(p2bodydist x > 90, 2, ifelse(p2bodydist x > 60, 1, 0)))
ignorehitpause = 1

[State 1200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1200, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge2) := 0
trigger1 = 1 || map(ai_charge2) := 0
ignorehitpause = 1
persistent = 0

[State 1200, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1202, ifelse(map(strength) = 1, 1201, 1200))

[State 1200, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value2 = , AP
time = 1

[State 1200, Sound]
type = playsnd
trigger1 = animelemtime(2) = 1
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = animelemtime(2) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 1
statetype = A
physics = N

[State 1200, Accel]
type = veladd
trigger1 = vel x > 0
x = ifelse(map(strength) = 2, -1.00, ifelse(map(strength) = 1, -0.80, -0.60))

[State 1200, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1 && animelemtime(5) < 0
y = 0.100

[State 1200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = ifelse(map(strength) = 2, 20.00, ifelse(map(strength) = 1, 15.00, 10.00))
y = ifelse(map(strength) = 2, -12.00, ifelse(map(strength) = 1, -10.50, -9.00))

[State 1200, Vel]
type = velset
trigger1 = animelemtime(5) >= 0 && animelemtime(10) <= 0
x = 0
y = 0

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(10) >= 1
y = 0.500

[State 1200, Vel]
type = velset
trigger1 = animelemtime(10) = 1
x = 0
y = 5.00

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 10
value = 7, 12

[State 1200, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, SA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 100, ifelse(map(strength) = 1, 90, 80)), ifelse(map(strength) = 2, 25, ifelse(map(strength) = 1, 23, 20))
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
ground.velocity = -3.25, -7.40
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -3.25, -7.40
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1200, Hit]
type = hitdef
trigger1 = animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1200
attr = A, SA
hitflag = MAFD
guardflag = HA
priority = 4, Hit
damage = ifelse(map(strength) = 2, 120, ifelse(map(strength) = 1, 110, 100)), ifelse(map(strength) = 2, 28, ifelse(map(strength) = 1, 25, 19))
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
down.hittime = 20
ground.velocity = -5.40, -6.57
ground.cornerpush.veloff = 0
guard.velocity = -10.52 * ifelse(p2dist x < 0, -1, 1)
guard.cornerpush.veloff = 0
air.velocity = -5.40, -6.57
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
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 30), map(sparky) := -15
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1200, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1210

[State 1200, Wind]
type = explod
triggerall = (movecontact + movereversed) != [1, 3]
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(11) = 3 && map(strength) > 0
trigger3 = animelemtime(11) = 6 && map(strength) > 1
anim = 1290
ID = 1290
postype = p1
pos = ceil(10 * const(size.xscale)), ceil(0 * const(size.yscale))
sprpriority = 3
scale = 0.33, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Recover -----
[Statedef 1210]
type = S
physics = S
movetype = I
anim = 1210
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1210, Pos]
type = posset
trigger1 = 1
y = 0

[State 1210, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1210, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1210, End]
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
sprpriority = -10

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
trigger1 = 1
y = 0.5

[State 5982, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;========================<EX SUPER HYAKKAN OTOSHI>=============================
[Statedef 1230]
type = S
physics = S
movetype = A
anim = 1230
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -500
facep2 = 1
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1230, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1230, Lose Charge]
type = mapset
map = "charge2"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 0
ignorehitpause = 1
persistent = 0

[State 1230, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1230, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1230, EX FX]
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

[State 1230, NHB]
type = nothitby
trigger1 = animelemtime(4) < 1
value = , AA, AP
time = 1

[State 1230, Sound]
type = playsnd
trigger1 = animelemtime(2) = 1
value = 0, 40

[State 1230, Dust]
type = helper
trigger1 = animelemtime(2) = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1230, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 1
statetype = A
physics = N

[State 1230, Accel]
type = veladd
trigger1 = vel x > 0
x = -1.00

[State 1230, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1230, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1 && animelemtime(5) < 0
y = 0.100

[State 1230, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = 20.00
y = -12.00

[State 1230, Vel]
type = velset
trigger1 = animelemtime(6) >= 0 && animelemtime(11) < 0
x = 0
y = 0

[State 1230, Accel]
type = veladd
trigger1 = animelemtime(10) >= 1
y = 0.500

[State 1230, Vel]
type = velset
trigger1 = animelemtime(10) = 1
x = 0
y = 5.32

[State 1230, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1230, Sound]
type = playsnd
trigger1 = animelem = 10
value = 7, 12

[State 1230, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
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
ground.velocity = -2.16, -7.40
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -2.16, -7.40
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1230, Hit]
type = hitdef
trigger1 = animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
ID = 1230
attr = A, SA
hitflag = MAFD
guardflag = HA
priority = 4, Hit
damage = 80, 20
dizzypoints = 100 * !map(customcombo)
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
down.hittime = 20
ground.velocity = -3.25, -7.40
ground.cornerpush.veloff = 0
guard.velocity = -10.52 * ifelse(p2dist x < 0, -1, 1)
guard.cornerpush.veloff = 0
air.velocity = -3.25, -7.40
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
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 30), map(sparky) := -15
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1230, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1231

[State 1230, Wind]
type = explod
triggerall = (movecontact + movereversed) != [1, 3]
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(11) = 3
anim = 1290
ID = 1290
postype = p1
pos = ceil(10 * const(size.xscale)), ceil(0 * const(size.yscale))
sprpriority = 3
scale = 0.33, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Recover -----
[Statedef 1231]
type = S
physics = S
movetype = I
anim = 1231
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1231, Pos]
type = posset
trigger1 = 1
y = 0

[State 1231, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1231, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1231, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<OOICHOU NAGE>=============================
[Statedef 1300]
type = S
physics = S
movetype = A
anim = 1300
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
value = ifelse(p2bodydist x <= ceil(42 * const(size.xscale)), 2, ifelse(p2bodydist x <= ceil(46 * const(size.xscale)), 1, 0))
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

[State 1300, Hit]
type = hitdef
triggerall = animelem = 2
triggerall = !map(unthrowable) && !map(grabbehind)
trigger1 = map(strength) = 0 && map(truebodydistx) <= ceil(50 * const(size.xscale))
trigger2 = map(strength) = 1 && map(truebodydistx) <= ceil(46 * const(size.xscale))
trigger3 = map(strength) = 2 && map(truebodydistx) <= ceil(42 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
fall.xvelocity = 0
fall.yvelocity = 0
numhits = 0
p1stateno = 1310
p2stateno = 1315

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 800
channel = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
;channel = 1
stopongethit = 1

[State 1300, Type]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Throw -----
[Statedef 1310]
type = A
physics = N
movetype = A
anim = 1310
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1310, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1310, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1315

[State 1310, Throw]
type = targetfacing
trigger1 = time <= 3
value = 1

[State 1310, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 7
value = 1316

[State 1310, Width]
type = width
trigger1 = animelemtime(3) < 0
edge = ceil(18 * const(size.xscale)), 0

[State 1310, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = ceil(79 * const(size.xscale)), 0

[State 1310, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 2
edge = ceil(87 * const(size.xscale)), 0

[State 1310, Width]
type = width
trigger1 = animelemtime(7) >= 2
edge = ceil(56 * const(size.xscale)), 0

[State 1310, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 21 * const(size.xscale), -115 * const(size.yscale)

[State 1310, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 56 * const(size.xscale), -112 * const(size.yscale)

[State 1310, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 90 * const(size.xscale), -98 * const(size.yscale)

[State 1310, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
pos = 87 * const(size.xscale), -8 * const(size.yscale)

;[State 1310, Bind 7]
;type = targetbind
;trigger1 = numtarget
;trigger1 = animelemtime(7) = 0
;pos = 112 * const(size.xscale), 0

[State 1310, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-40 * map(damagescaling))
dizzy = 0
kill = 0

[State 1310, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 4
value = 40; givepower

[State 1310, Get Power]
type = poweradd
trigger1 = animelem = 4
value = 200 * map(meterscaling); getpower

[State 1310, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 4
value = 1

[State 1310, Accel]
type = veladd
trigger1 = animelemtime(7) >= 2
x = 0
y = 0.88445

[State 1310, Vel]
type = velset
trigger1 = animelemtime(7) = 2
x = 2.44; Moves 76 pixels, ends at 56.75 from P2
y = -10.51; 68

[State 1310, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 0
channel = 0

[State 1310, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1310, Sound]
type = playsnd
trigger1 = animelemtime(7) = 2
value = 0, 40

[State 1310, Dust]
type = helper
trigger1 = animelemtime(7) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1310, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 4
value = 7, 1

[State 1310, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 4
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1310, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 84 * const(size.xscale), 0
ownpal = 1

[State 1310, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
anim = F 62
postype = p1
pos = 84 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 1310, End]
type = changestate
trigger1 = animelemtime(7) >= 2
trigger1 = vel y > 0
trigger1 = pos y > (24 - vel y)
value = 1311


;----- Slam -----
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
trigger1 = animelemtime(4) < 0
y = -16

[State 1311, Pos]
type = posadd
trigger1 = animelem = 4
x = 32 * const(size.xscale)

[State 1311, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * ifelse(map(strength) = 2, -120, ifelse(map(strength) = 1, -110, -100)))
dizzy = 0
kill = 1

[State 1311, Stun Damage]
type = targetdizzypointsadd
trigger1 = !time
trigger1 = numtarget
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 1311, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 1311, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 1311, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 1318

[State 1310, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 1311, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

;[State 1311, Spark]
;in ZSS

[State 1311, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 1

[State 1311, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1311, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = !time
trigger1 = numtarget
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 47 * const(size.xscale), -pos y
ownpal = 1

[State 1311, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = !time
trigger1 = numtarget
anim = F 62
postype = p1
pos = 47 * const(size.xscale), -pos y
sprpriority = -10
ownpal = 1

[State 1311, Floor Cracks]
type = explod
trigger1 = !time
anim = 8115
ID = 8115
postype = p1
pos = 47 * const(size.xscale), -pos y
scale = ifelse(random < 500, -0.5, 0.5), 0.5
ownpal = 1
under = 1

[State 1311, Layering]
type = sprpriority
trigger1 = animelem = 4
value = -1

[State 1311, Pos]
type = posset
trigger1 = animelem = 4
y = 0

[State 1311, Vel]
type = velset
trigger1 = animelem = 4
x = -3.00

[State 1311, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 102

[State 1311, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1315]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 1

[State 1315, Anim]
type = changeanim2
trigger1 = !time
value = 1315

[State 1315, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1315, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1316]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1316, Anim]
type = changeanim2
trigger1 = !time
value = 1316

[State 1316, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1316, Pos]
type = posadd
trigger1 = !time
x = 21

[State 1316, Pos]
type = posset
trigger1 = !time
y = 0

[State 1316, Accel]
type = veladd
trigger1 = vel x
x = ifelse(vel x >= 1.326675, -1.326675, -vel x)

[State 1316, Accel]
type = veladd
trigger1 = 1
y = 1.326675

[State 1316, Vel]
type = velset
trigger1 = !time
x = 6.02; 16.8; 20, 125
y = -5.3067

[State 1316, End]
type = changestate
trigger1 = time >= 8
value = 1317


[Statedef 1317]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1317, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1317, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1317, Pos]
type = posset
trigger1 = 1
y = 0

[State 1317, Anim]
type = changeanim
trigger1 = !time
value = 5170

[State 1317, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim != 5110
value = 5110

[State 1317, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1317, End]
type = selfstate
trigger1 = time >= 60
value = ifelse(alive, 5120, 5150)


[Statedef 1318]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1318, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1318, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1318, Pos]
type = posset
trigger1 = 1
y = 0

[State 1318, Anim]
type = changeanim
trigger1 = !time
value = 5080

[State 1318, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1319, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1318, End]
type = changestate
trigger1 = time >= 32
value = 1319


[Statedef 1319]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1319, Pos]
type = posset
trigger1 = 1
y = 0

[State 1319, Anim]
type = changeanim
trigger1 = !time
value = 5110

[State 1319, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1319, End]
type = selfstate
trigger1 = time >= 12
value = ifelse(alive, 5120, 5150)


;========================<EX OOICHOU NAGE>=============================
[Statedef 1330]
type = S
physics = S
movetype = A
anim = 1330
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

[State 1330, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1330, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1330, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1330, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(43 * const(size.xscale)), ceil(-35 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1330, NHB]
type = nothitby
trigger1 = animelemtime(2) < 1
value = , NT
time = 1
ignorehitpause = 1

[State 1330, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1330, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(54 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
fall.xvelocity = 0
fall.yvelocity = 0
numhits = 0
p1stateno = 1340
p2stateno = 1315

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 800
channel = 0

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 0
;channel = 1
stopongethit = 1

[State 1330, Type]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[State 1330, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Throw -----
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
value = 1315

[State 1340, Throw]
type = targetfacing
trigger1 = time <= 3
value = 1

[State 1340, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 7
value = 1316

[State 1340, Width]
type = width
trigger1 = animelemtime(3) < 0
edge = ceil(18 * const(size.xscale)), 0

[State 1340, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = ceil(79 * const(size.xscale)), 0

[State 1340, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 2
edge = ceil(87 * const(size.xscale)), 0

[State 1340, Width]
type = width
trigger1 = animelemtime(7) >= 2
edge = ceil(56 * const(size.xscale)), 0

[State 1340, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 21 * const(size.xscale), -115 * const(size.yscale)

[State 1340, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 56 * const(size.xscale), -112 * const(size.yscale)

[State 1340, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 90 * const(size.xscale), -98 * const(size.yscale)

[State 1340, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
pos = 87 * const(size.xscale), -8 * const(size.yscale)

;[State 1340, Bind 7]
;type = targetbind
;trigger1 = numtarget
;trigger1 = animelemtime(7) = 0
;pos = 112 * const(size.xscale), 0

[State 1340, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(-40 * map(damagescaling))
dizzy = 0
kill = 0

[State 1340, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 4
value = 40; givepower

[State 1340, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 4
value = 1

[State 1340, Accel]
type = veladd
trigger1 = animelemtime(7) >= 2
x = 0
y = 1.326675

[State 1340, Vel]
type = velset
trigger1 = animelemtime(7) = 2
x = 2.72
y = -14.09


[State 1340, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 0
channel = 0

[State 1340, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1340, Sound]
type = playsnd
trigger1 = animelemtime(7) = 2
value = 0, 40

[State 1340, Dust]
type = helper
trigger1 = animelemtime(7) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1340, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 4
value = 7, 1

[State 1340, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 4
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1340, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 84 * const(size.xscale), 0
ownpal = 1

[State 1340, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
anim = F 62
postype = p1
pos = 84 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 1340, End]
type = changestate
trigger1 = animelemtime(7) >= 2
trigger1 = vel y > 0
trigger1 = pos y > (24 - vel y)
value = 1341


;----- Slam -----
[Statedef 1341]
type = A
physics = N
movetype = A
anim = 1311
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1341, Pos]
type = posset
trigger1 = animelemtime(4) < 0
y = -16

[State 1341, Pos]
type = posadd
trigger1 = animelem = 4
x = 32 * const(size.xscale)

[State 1341, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * -140)
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
value = 1318

[State 1340, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 1341, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

;[State 1341, Spark]
;in ZSS

[State 1341, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 1

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
trigger1 = !time
trigger1 = numtarget
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 47 * const(size.xscale), -pos y
ownpal = 1

[State 1341, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = !time
trigger1 = numtarget
anim = F 62
postype = p1
pos = 47 * const(size.xscale), -pos y
sprpriority = -10
ownpal = 1

[State 1341, Floor Cracks]
type = explod
trigger1 = !time
anim = 8115
ID = 8115
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-pos y)
scale = ifelse(random < 500, -0.5, 0.5), 0.5
ownpal = 1
under = 1

[State 1341, Layer]
type = sprpriority
trigger1 = animelem = 4
value = -1

[State 1341, Pos]
type = posset
trigger1 = animelem = 4
y = 0

[State 1341, Vel]
type = velset
trigger1 = animelem = 4
x = -3.00

[State 1341, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 102

[State 1341, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<IWATO BIRAKI>=============================
[Statedef 1400]
type = S
physics = N
movetype = A
anim = 1400
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
value = ifelse(p2bodydist x > 70, 2, ifelse(p2bodydist x > 55, 1, 0))
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(strength) = 2, 1402, ifelse(map(strength) = 1, 1401, 1400))

[State 1400, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.25

[State 1400, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1400, Vel]
type = velset
trigger1 = animelem = 4
x = 5.0

[State 1400, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 102

[State 1400, Dust]
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

[State 1400, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1400, Miss]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
attr = S, ST
hitflag =

[State 1400, Hit]
type = hitdef
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 1410
p2stateno = 1415

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 800
channel = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 103

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 0
;channel = 1
stopongethit = 1

[State 1400, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Carry -----
[Statedef 1410]
type = S
physics = N
movetype = A
anim = 1410
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1410, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1410, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1415

[State 1410, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 1410, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = (64 * const(size.xscale)) - target, const(size.ground.back), -62 * const(size.yscale)

[State 1410, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1410, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 20 * const(size.xscale), -85 * const(size.yscale)

[State 1410, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 20 * const(size.xscale), -89 * const(size.yscale)

[State 1410, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1410, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 20 * const(size.xscale), -85 * const(size.yscale)

[State 1410, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0
pos = 20 * const(size.xscale), -89 * const(size.yscale)

[State 1410, Bind Loop Fix]
type = targetbind
trigger1 = numtarget
trigger1 = animtime = 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1410, Sound]
type = playsnd
trigger1 = time = 10
value = 4, 5
channel = 0

[State 1410, Sound]
type = playsnd
trigger1 = time = 10
value = 7, 7

[State 1410, Sound]
type = playsnd
trigger1 = time = 10
value = 0, 100

[State 1410, Steps]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 0, ifelse((animelem = 4), 103, 106)

[State 1410, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
x = 5.0
y = 0

[State 1410, End]
type = changestate
triggerall = animelemtime(2) >= 0
trigger1 = frontedgedist <= 1; 0 is bugged
trigger2 = time >= ifelse(map(strength) = 0, 32, ifelse(map(strength) = 1, 40, 48))
value = 1420


;----- Target carried---
[Statedef 1415]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1415, Anim]
type = changeanim2
trigger1 = !time
value = 1415

[State 1415, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1415, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- Throw -----
[Statedef 1420]
type = S
physics = N
movetype = A
anim = 1420
ctrl = 0
sprpriority = 2

[State 1420, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1420, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1425

[State 1420, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 1420, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.333

[State 1420, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1420, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = ceil(32 * const(size.xscale)), 0

[State 1420, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = ceil(48 * const(size.xscale)), 0

[State 1420, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = ceil(121 * const(size.xscale)), 0

[State 1420, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 10 * const(size.xscale), -80 * const(size.yscale)

[State 1420, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 36 * const(size.xscale), -88 * const(size.yscale)

[State 1420, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 3
pos = 96 * const(size.xscale), -3 * const(size.yscale)

[State 1420, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 3
value = floor(-100 * map(damagescaling))
dizzy = 0

[State 1420, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 3
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 1420, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 3
value = 40; givepower

[State 1420, Get Power]
type = poweradd
trigger1 = numtarget
trigger1 = animelem = 3
value = 200 * map(meterscaling); getpower

[State 1420, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 3
value = 1

[State 1420, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 3
value = 1426

[State 1420, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1420, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 8, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1420, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 1420, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1425]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1425, Anim]
type = changeanim2
trigger1 = !time
value = 1425

[State 1425, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1425, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1426]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1426, Anim]
type = changeanim
trigger1 = !time
value = 5050

[State 1426, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1426, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 1426, Vel]
type = velset
trigger1 = !time
x = -8.00
y = 0

[State 1426, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1426, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1426, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = selfanimexist(5051)
value = 5051

[State 1426, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;========================<EX IWATO BIRAKI>=============================
[Statedef 1450]
type = S
physics = N
movetype = A
anim = 1450
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

[State 1450, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1450, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1450, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1450, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 8210
sprpriority = 3
postype = p1
pos = ceil(16 * const(size.xscale)), ceil(-40 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1450, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.25

[State 1450, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1450, Vel]
type = velset
trigger1 = animelem = 4
x = 5.0

[State 1450, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 1450, Sound]
type = playsnd
trigger1 = animelem = 4
value = 0, 102

[State 1450, Dust]
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

[State 1450, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1450, Miss]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
attr = S, ST
hitflag =

[State 1450, Hit]
type = hitdef
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(32 * const(size.xscale))
ID = 1450
attr = S, ST
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 1
numhits = 0
p1stateno = 1460
p2stateno = 1415

[State 1450, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 800
channel = 0

[State 1450, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 103

[State 1450, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 0
;channel = 1
stopongethit = 1

[State 1450, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 1450, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Carry -----
[Statedef 1460]
type = S
physics = N
movetype = A
anim = 1410
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1460, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1460, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1415

;[State 1460, Pick Corner]
;type = turn
;trigger1 = animelem = 2
;trigger1 = stagefrontedgedist > stagebackedgedist
;persistent = 0

[State 1460, Throw]
type = targetfacing
trigger1 = 1
ID = 1450
value = -1

[State 1460, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = (64 * const(size.xscale)) - target, const(size.ground.back), -62 * const(size.yscale)

[State 1460, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1460, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 20 * const(size.xscale), -85 * const(size.yscale)

[State 1460, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 20 * const(size.xscale), -89 * const(size.yscale)

[State 1460, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1460, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 20 * const(size.xscale), -85 * const(size.yscale)

[State 1460, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0
pos = 20 * const(size.xscale), -89 * const(size.yscale)

[State 1460, Bind Loop Fix]
type = targetbind
trigger1 = numtarget
trigger1 = animtime = 0
pos = 20 * const(size.xscale), -76 * const(size.yscale)

[State 1460, Sound]
type = playsnd
trigger1 = time = 10
value = 4, 5
channel = 0

[State 1460, Sound]
type = playsnd
trigger1 = time = 10
value = 7, 7

[State 1460, Sound]
type = playsnd
trigger1 = time = 10
value = 0, 100

[State 1460, Steps]
type = playsnd
trigger1 = animelem = 4 || animelem = 7
value = 0, ifelse((animelem = 4), 103, 106)

[State 1460, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
x = 5.0
y = 0

[State 1460, End]
type = changestate
triggerall = animelemtime(2) >= 0
trigger1 = frontedgedist <= 1; 0 is bugged
trigger2 = time >= 64
value = 1470


;----- Throw -----
[Statedef 1470]
type = S
physics = N
movetype = A
anim = 1420
ctrl = 0
sprpriority = 2

[State 1470, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 1470, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 1425

[State 1470, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 1470, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.333

[State 1470, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1470, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = ceil(32 * const(size.xscale)), 0

[State 1470, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = ceil(48 * const(size.xscale)), 0

[State 1470, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = ceil(121 * const(size.xscale)), 0

[State 1470, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 10 * const(size.xscale), -80 * const(size.yscale)

[State 1470, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 36 * const(size.xscale), -88 * const(size.yscale)

[State 1470, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 3
pos = 96 * const(size.xscale), -3 * const(size.yscale)

[State 1470, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 3
value = floor(-100 * map(damagescaling))
dizzy = 0

[State 1470, Stun Damage]
type = targetdizzypointsadd
trigger1 = numtarget
trigger1 = animelem = 3
value = floor(-100 * map(damagescaling)) * !map(customcombo)

[State 1470, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 3
value = 40; givepower

[State 1470, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 3
value = 1

[State 1470, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 3
value = 1476

[State 1470, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1470, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 8, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1470, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 0

[State 1470, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1
freqmul = 0.95 + (random / 10000.0)

[State 1470, Juggle Reset]
type = mapset
trigger1 = !map(jugglereset)
trigger1 = map(juggle_count)
trigger1 = numtarget(1450)
trigger1 = target(1450), stateno = [1477, 1478]
trigger1 = 1 || map(jugglereset) := 1
map = "juggle_count"
value = 0

[State 1470, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 1476]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 1476, Anim]
type = changeanim
trigger1 = !time
value = 5050

[State 1476, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1476, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 1476, Vel]
type = velset
trigger1 = !time
x = -8.00
y = 0

[State 1476, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1476, Wall Bounce]
type = changestate
trigger1 = time > 0
trigger1 = pos y < 0
trigger1 = backedgebodydist <= 0 || frontedgebodydist <= 0
value = 1477

[State 1476, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1476, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = selfanimexist(5051)
value = 5051

[State 1476, Vel]
type = velset
trigger1 = vel y > 0
trigger1 = pos y >= 25
x = -4.433

[State 1476, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;----- Target Hitting Wall -----
[Statedef 1477]
type = A
physics = N
movetype = H

[State 1477, Turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1477, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 1477, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1477, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1477, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1477, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1477, FX]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1477, FX]
type = explod
trigger1 = !time
anim = F 72
postype = p1
pos = -15, const(size.mid.pos.y)
sprpriority = -5
ownpal = 1

[State 1477, End]
type = changestate
trigger1 = time >= 4
value = 1478


;----- Target Falling -----
[Statedef 1478]
type = A
physics = N
movetype = H

[State 1478, Turn]
type = turn
trigger1 = !time

[State 1478, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 1478, Vel]
type = velset
trigger1 = !time
x = -1.0
y = -8.0

[State 1478, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1478, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = !animtime
value = 5050

[State 1478, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = vel y > -2
value = 5061

[State 1478, Push]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1478, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1478, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1478, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


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
value = 4, 3
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 95), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
kill = 0

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
value = 4, 3
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
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
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 102), map(sparky) := -48
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
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
