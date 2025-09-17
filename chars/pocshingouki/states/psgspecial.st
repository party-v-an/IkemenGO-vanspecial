; ____________________________________________
;| Pocket Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
poweradd = 25
sprpriority = 2
facep2 = 1

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
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
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
player = ceil(20 * const(size.xscale)), 0

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
pos = ceil(68 * const(size.xscale)), -31
ownpal = 1

[State 1000, wave]
type = explod
trigger1 = animelem = 5
vel = -1.2, 0
anim = 3008
sprpriority = 5
pos = 70, -30
postype = p1
ownpal = 1
scale = 0.5, 0.5

[State 1000, Dust]
type = explod
trigger1 = animelemtime(5) = 1
vel = -1, 0
anim = 6022
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 0
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


;======================<SHAKUNETSU HADOUKEN>=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
poweradd = 50
sprpriority = 2
facep2 = 1

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
value = ifelse(p2movetype = H || random < 100, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 1020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1020, Anim Loop]
type = changeanim
trigger1 = animelem = 3
value = 1020
elem = 1

[State 1020, Anim Advance]
type = changeanim
triggerall = animelemtime(3) < 0
trigger1 = map(strength) = 0 && time = 9
trigger2 = map(strength) = 1 && time = 13
trigger3 = map(strength) = 2 && time = 17
value = 1020
elem = 3

[State 1020, Width]
type = width
trigger1 = animelemtime(6) = -1
value = ceil(20 * const(size.xscale)), 0

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 1025
ID = 1025
name = "Hadouken"
postype = p1
pos = ceil(68 * const(size.xscale)), -30
ownpal = 1
persistent = 0

[State 1020, Dust]
type = explod
trigger1 = animelemtime(6) = 1
vel = -1, 0
anim = 6022
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 1020, Aura]
type = explod
trigger1 = !time
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
removetime = 60
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1

[State 1020, Remove Aura]
type = removeexplod
trigger1 = animelem = 3
trigger1 = numexplod(6050)
ID = 6050

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 0
channel = 0

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 6
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

[State 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3,5]
value = ifelse((gethitvar(airtype) = 1), 5000, 5010) + gethitvar(animtype)

[State 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3,5]
value = 5030

[State 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4,5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[State 7697, Anim]
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
y = max(0.35, gethitvar(yaccel))

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


;======================<ZANKUU HADOUKEN>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
poweradd = 25
sprpriority = 2

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
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
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
trigger1 = animelem = 2 || animelem = 4
value = ceil(27 * const(size.xscale)), 0

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 2 || animelem = 4
value2 = SCA, AA, AT
time = 1

[State 1050, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 4
helpertype = normal; projectile
stateno = 1055
ID = 1055
name = "Hadouken"
postype = p1
pos = ceil(ifelse((animelem = 2), 66, 77) * const(size.xscale)), ifelse((animelem = 2), -14, -11)
ownpal = 1

[State 1050, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 0.5, 0.5, ifelse(vel x < -0.5, -0.5, vel x))
y = ifelse(vel y < -1, -1, ifelse(vel y > 1, 1, vel y))

[State 1050, Pos]
type = posset
trigger1 = pos y>0
y = 0

[State 1050, Vel]
type = velset
trigger1 = pos y>=0
y = 0

[State 1050, Freeze]
type = statetypeset
trigger1 = animelem = 5
physics = A

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4
value = 3, ifelse((animelem = 2), 11, 12)
channel = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4
value = 5, 0
volumescale = 75

[State 1050, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)


;======================<SHORYUKEN>=============================
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 75
juggle = 1
sprpriority = 2
facep2 = 1

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
value = ifelse(random < 500, 2, ifelse(random < 500, 1, 0))
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
triggerall = anim = 1100
trigger1 = map(strength) = 0
trigger1 = time < 6
trigger2 = map(strength) = 1
trigger2 = time < 8
trigger3 = map(strength) = 2
trigger3 = time < 10
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.67

[State 1100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 1
trigger2 = anim = 1101
y = ifelse(vel y > 0, 0.75, 0.50)

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(2) = 1
x = ifelse(map(strength) = 2, 10.00, ifelse(map(strength) = 1, 8.00, 6.00))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 1
y = ifelse(map(strength) = 2, -12.00, ifelse(map(strength) = 1, -9.50, -7.00))

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 4 && map(strength) = 0
value = 1, 3
;channel = 1
stopongethit = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 4 && map(strength) > 0
value = 5, 1
volumescale = ifelse(map(strength) = 2, 100, 80)

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 4
value = ifelse(map(strength) = 2, 4, 3), ifelse(map(strength) = 2, 31, ifelse(map(strength) = 1, 7, 6))
channel = 0

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1100
trigger1 = animelem = 4
value = 0, 40

[State 1100, Dust]
type = explod
trigger1 = !time
anim = 6026
sprpriority = 3
postype = p1
ownpal = 1

[State 1100, Dust]
type = explod
trigger1 = anim = 1100
trigger1 = animelem = 4
anim = 6026
sprpriority = 3
postype = p1
facing = -1
ownpal = 1

[State 1100, Push]
type = playerpush
trigger1 = vel y < 0
value = 0

[State 1100, Flames]
type = helper
trigger1 = anim = 1100
trigger1 = animelem = 1 && map(strength) > 0
helpertype = normal
stateno = 1105
ID = 1105
name = "Flames"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1
persistent = 0

[State 1100, Hit Ground]
type = hitdef
triggerall = anim = 1100
trigger1 = map(strength) = 1
trigger1 = animelem = 2 || (animelem = 3 && !movecontact && !movereversed)
trigger2 = map(strength) = 2
trigger2 = animelem = 2 || animelem = 3
attr = S, SA
damage = ifelse(map(strength) = 0, 100, ifelse(map(strength) = 1, 75, 50)), 7
animtype = Hard
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 12, 12
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.0, -24.0
air.type = Low
air.hittime = 30
air.velocity = -8.0, -24.0 + map(juggledecay)
airguard.velocity = -6.00, -1.00
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
down.velocity = -4, -6
down.cornerpush.veloff = -8
forcestand = 1
fall = 0
forcenofall = 1
fall.animtype = Medium
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = ifelse(map(strength) = 0, 0, 60)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, ifelse((animelem=3), -43, -23)
yaccel = 0.941
p1sprpriority = sprpriority

[State 1100, Hit Midair]
type = hitdef
triggerall = anim = 1100
trigger1 = map(strength) = 0
trigger1 = animelem = 3 && !movecontact && !movereversed
trigger2 = map(strength) = 1
trigger2 = animelem = 4
trigger3 = map(strength) = 2
trigger3 = animelem = 4
persistent = 0
attr = A, SA
damage = ifelse(map(strength) = 0, 40, ifelse(map(strength) = 1, 45, 50)), 7
animtype = Back
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 12, 12
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.0, -24.0
air.type = Low
air.hittime = 30
air.velocity = -8.0, -24.0 + map(juggledecay)
airguard.velocity = -6.00, -1.00
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = ifelse(map(strength) = 0, 0, 60)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -60
yaccel = 0.941
p1sprpriority = sprpriority

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100
trigger1 = animelem = 4
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 1
trigger1 = vel y > (ifelse(map(strength) = 2, -5, ifelse(map(strength) = 1, -4, -3)))
value = 1101

[State 1100, Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State 1100, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1102


;---Land---
[Statedef 1102]
type = S
physics = S
movetype = I
anim = 1102
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1102, Pos]
type = posset
trigger1 = 1
y = 0

[State 1102, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1102, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
postype = p1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<TATSUMAKI SENPUU KYAKU>=============================
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 75
juggle = 1
sprpriority = 2
facep2 = 1

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
value = ifelse(random < 500, 2, ifelse(random < 500, 1, 0))
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
trigger1 = !animtime
trigger1 = anim = 1200
value = 3, 2
channel = 0

[State 1200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 1200
value = ifelse(map(strength) = 2, 1203, ifelse(map(strength) = 1, 1202, 1201))

[State 1200, Vel]
type = velset
trigger1 = animelem = 3
trigger1 = anim = 1200
x = 4
y = -4

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 3
trigger1 = anim = 1200
value = 0, 40

[State 1200, Dust]
type = explod
trigger1 = animelem = 3
trigger1 = anim = 1200
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 1200, Accel]
type = statetypeset
trigger1 = animelem = 3
trigger1 = anim = 1200
type = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = [1201, 1203]
x = 4
y = 0

[State 1200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [1201, 1203]
value = 1204
persistent = 0

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(3) >= 0
trigger2 = (anim = [1201, 1203])
trigger3 = anim = 1204
statetype = A
physics = N

[State 1200, Type]
type = veladd
trigger1 = anim = 1204 && animelemtime(1) > 0
y = 0.5

[State 1200, Sound]
type = playsnd
triggerall = anim = [1201, 1203]
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
value = 1, 1
;channel = 1
stopongethit = 1

[State 1200, spin2]
type = playsnd
triggerall = anim = [1201, 1203]
trigger1 = animelem = 5 || animelem = 11 || animelem = 17
value = 1, 4
;channel = 1
stopongethit = 1

[State 1200, electricity]
type = helper
triggerall = anim = 1203
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger2 = animelem = 5 || animelem = 11 || animelem = 17
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 1200, electricity]
type = helper
triggerall = anim = 1202
trigger1 = animelem = 2 || animelem = 8 || animelem = 14
trigger2 = animelem = 5 || animelem = 11
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = ceil(ifelse((animelem = 2 || animelem = 8 || animelem = 14), 60, 25) * const(size.xscale)), -38
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 1200, Electricity]
type = playsnd
trigger1 = anim = 1202 || anim = 1203
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
value = 5, 7
channel = 5

[State 1200, Hit]
type = hitdef
triggerall = anim = [1201, 1203]
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
attr = S, SA
damage = 30, 7
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3, -6.33
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6.0 + map(juggledecay)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = ifelse(map(strength) > 0, 60, 0)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority

[State 1200, Hit Back]
type = hitdef
triggerall = anim = [1201, 1203]
trigger1 = animelem = 5 || animelem = 11 || animelem = 17
attr = S, SA
damage = 30, 7
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 3, -6.33
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = 3, -6.0 + map(juggledecay)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = ifelse(map(strength) > 0, 60, 0)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = anim = 1204
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1205


;---Land---
[Statedef 1205]
type = S
physics = S
movetype = I
anim = 1205
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1205, Pos]
type = posset
trigger1 = 1
y = 0

[State 1205, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1205, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR TATSUMAKI SENPUU KYAKU>=============================
[Statedef 1220]
type = A
physics = N
movetype = A
anim = 1220
ctrl = 0
velset = ifelse((vel x = [-1, 1]), vel x + 1, vel x), (vel y) -1
poweradd = 75
juggle = 1
sprpriority = 2

[State 1220, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1220, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 1220, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1220, Sound]
type = playsnd
trigger1 = !animtime
trigger1 = anim = 1220
value = 3, 2
channel = 0

[State 1220, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 1220
value = ifelse(map(strength) = 2, 1203, ifelse(map(strength) = 1, 1202, 1201))

[State 1220, Accel]
type = veladd
trigger1 = animelem = 1
trigger1 = anim = 1220
x = ifelse(vel x > 0, 1, ifelse(vel x < 0, -1, 1.5))

[State 1220, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [1201, 1203]
value = 1206
persistent = 0

[State 1220, Sound]
type = playsnd
triggerall = anim = [1201, 1203]
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
value = 1, 1
;channel = 1
stopongethit = 1

[State 1220, spin2]
type = playsnd
triggerall = anim = [1201, 1203]
trigger1 = animelem = 5 || animelem = 11 || animelem = 17
value = 1, 4
;channel = 1
stopongethit = 1

[State 1220, electricity]
type = helper
triggerall = anim = 1203
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger2 = animelem = 5 || animelem = 11 || animelem = 17
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 1220, electricity]
type = helper
triggerall = anim = 1202
trigger1 = animelem = 2 || animelem = 8 || animelem = 14
trigger2 = animelem = 5 || animelem = 11
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = ceil(ifelse((animelem = 2 || animelem = 8 || animelem = 14), 60, 25) * const(size.xscale)), -38
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 1220, Electricity]
type = playsnd
trigger1 = anim = 1202 || anim = 1203
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
value = 5, 7
channel = 5

[State 1220, Hit]
type = hitdef
triggerall = anim = [1201, 1203]
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
attr = A, SA
damage = 30, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 18
ground.velocity = -6.13, 0
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -4, -3 + map(juggledecay)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = ifelse(map(strength) > 0, 60, 0)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority

[State 1220, Hit 2]
type = hitdef
triggerall = anim = [1201, 1203]
trigger1 = animelem = 5 || animelem = 11 || animelem = 17
attr = A, SA
damage = 30, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 8, 8
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 14
ground.hittime = 1 + 18
ground.velocity = 6.13, 0
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = 4, -3 + map(juggledecay)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = ifelse(map(strength) > 0, 60, 0)
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = anim = 1206
movetype = I

[State 1220, End]
type = changestate
trigger1 = anim = 1206
trigger1 = animelem = 4
trigger1 = map(superjump)
value = 51
ctrl = (map(superjump) != 0)

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1205


;======================<ASHURA SENKUU>=============================
[Statedef 1350]
type = S
physics = N
movetype = I
anim = 1350
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1350, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_623kk), 1, ifelse(map(cmd_623pp), 2, ifelse(map(cmd_421kk), -1, -2)))
ignorehitpause = 1
persistent = 0

[State 1350, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 250, 1, 2)
ignorehitpause = 1

[State 1350, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1350, Afterimage]
type = afterimage
trigger1 = animelem = 2
time = 2
timegap = 1
framegap = 6
length = ifelse(map(strength) = 2 || map(strength) = -2, 19, 13)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1350, Aura]
type = explod
trigger1 = animelem = 1
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
removetime = 60
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1

[State 1350, Aura]
type = removeexplod
trigger1 = animelem = 7
trigger1 = numexplod(6050)
ID = 6050

[State 1350, Vel]
type = velset
trigger1 = animelemtime(1) > 0 && animelemtime(7) < 0
x = ifelse(map(strength) = 2, -6, ifelse(map(strength) = 1, -4, ifelse(map(strength) = -2, 6, 4))) * cos((time / 18.0) * pi)

[State 1350, Vel]
type = velmul
trigger1 = animelemtime(7) >= 0
x = 0.95

[State 1350, Vel]
type = velset
trigger1 = animelem = 7
x = ifelse(map(strength) = 2, 16, ifelse(map(strength) = 1, 12, ifelse(map(strength) = -2, -16, -12)))

[State 1350, Turn]
type = turn
trigger1 = p2dist x < 0
trigger1 = animelemtime(7) > 0

[State 1350, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 6
persistent = 0

[State 1350, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, 5
channel = 0
persistent = 0

[State 1350, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 5
persistent = 0

[State 1350, End]
type = changestate
triggerall = animelemtime(7) > 0
trigger1 = animelemtime(7) >= ifelse(map(strength) = 2 || map(strength) = -2, 28, 20)
trigger2 = vel x < 0 && backedgebodydist <= 0
trigger3 = vel x > 0 && frontedgebodydist <= 0
value = 1351

[State 1350, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 1350, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1350, Afterimage]
type = afterimagetime
trigger1 = 1
time = 2


;----- Recovery -----
[Statedef 1351]
type = S
physics = N
movetype = I
anim = 1351
velset = 0, 0
ctrl = 0

[State 1351, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<ZENPOU TENSHIN>=============================
[Statedef 1360]
type = A
physics = N
movetype = I
anim = 1360
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1

[State 1360, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1360, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 750, 0, ifelse(random < 666, 1, 2))
ignorehitpause = 1

[State 1360, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1360, Sound]
type = playsnd
trigger1 = !time
value = 0, 40

[State 1360, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(random < 500, 23, 26)
channel = 0
persistent = 0

[State 1360, Loop Anim]
type = changeanim
trigger1 = animelem = 7
value = 1360
elem = 3

[State 1360, Push]
type = playerpush
trigger1 = animelemtime(7) < 0
value = 0

[State 1360, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(7) < 0
x = 4

[State 1360, Anim]
type = changeanim
triggerall = animelemtime(7) < 0
trigger1 = map(strength) = 0 && time = 16
trigger2 = map(strength) = 1 && time = 28
trigger3 = map(strength) = 2 && time = 40
value = 1360
elem = 7

[State 1360, Type]
type = statetypeset
trigger1 = animelem = 7
statetype = C
physics = C

[State 1360, Dust]
type = explod
trigger1 = !(time % 6)
trigger1 = animelemtime(3) >= 0 && animelemtime(7) < 0
vel = -0.5, 0
anim = 6020
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 1360, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;======================<TENMA KUUJIN KYAKU>=============================
[Statedef 1400]
type = A
physics = N
movetype = A
anim = 1400
ctrl = 0
poweradd = 75
velset = 0, 0
sprpriority = 2

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
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, Action Limit]
type = mapset
trigger1 = !time
map = "tenmakujin"
value = 1

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 1400, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(map(strength) = 2, 7.2, ifelse(map(strength) = 1, 6.4, 5.6))
y = ifelse(map(strength) = 2, 9, ifelse(map(strength) = 1, 8, 7))

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 19
channel = 0

[State 1400, electricity]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1405
ID = 1405
name = "Electricity"
postype = p1
ownpal = 1
bindtime = -1
ignorehitpause = 0
size.xscale = ifelse(map(strength) = 2, 1, 0.75)
size.yscale = ifelse(map(strength) = 2, 1, 0.75)

[State 1400, Weak and Medium Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(strength) != 2
attr = A, SA
damage = 80, 7
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
forcestand = 1
fall = 0
forcenofall = 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, 0
yaccel = 0.941
p1sprpriority = sprpriority

[State 1400, Strong Hit]
type = hitdef
trigger1 = map(strength) = 2
trigger1 = animelemtime(2) >= 0
trigger1 = !((movecontact + movereversed) % 3)
attr = A, SA
damage = 50 / (hitcount + 1), 7
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 9, 12
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6, 0
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, 0
yaccel = 0.941
p1sprpriority = sprpriority

[State 1400, Hop back]
type = changestate
trigger1 = map(strength) != 2
trigger1 = movecontact = 1
value = 1410

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = ifelse(anim = 1400, 1401, 52)


;---Land---
[Statedef 1401]
type = S
physics = S
movetype = I
anim = 1401
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1401, Pos]
type = posset
trigger1 = 1
y = 0

[State 1401, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1401, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1401, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Bounce back -----
[Statedef 1410]
type = A
physics = N
movetype = I
anim = ifelse(map(strength) = 1, 41, 43)
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1410, back]
type = veladd
trigger1 = 1
y = 0.5

[State 1410, back]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 1, 1, -2)
y = -7

[State 1410, Ctrl]
type = ctrlset
trigger1 = time > 0
trigger1 = vel y > 0
value = 1

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;======================<HYAKKI SHU>=============================
[Statedef 1500]
type = A
physics = N
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
juggle = 1
sprpriority = 2
poweradd = 75
facep2 = 1

[State 1500, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1500, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 1500, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2dist x >= 100, 2, ifelse(p2dist x >= 60, 1, 0))
ignorehitpause = 1

[State 1500, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1500, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1500, Sound]
type = playsnd
trigger1 = !time
value = 0, 40

[State 1300, Accel]
type = veladd
trigger1 = 1
y = 0.623

[State 1300, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 4.5, ifelse(map(strength) = 1, 3.0, 1.5))
y = -10.590

[State 1500, Kick]
type = changestate
trigger1 = vel y > 0
trigger1 = command = "a" || command = "b" || command = "c"
value = 1503

[State 1500, Punch]
type = changestate
trigger1 = vel y > 0
trigger1 = command = "x" || command = "y" || command = "z"
value = 1501

[State 1500, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1502


;----- PALM -----
[Statedef 1501]
type = A
physics = N
movetype = A
juggle = 1
anim = 1501
poweradd = 0
sprpriority = 2
ctrl = 0

[State 1501, Accel]
type = veladd
trigger1 = time
y = 0.623

[State 1501, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 1501, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 19
channel = 0

[State 1501, Hit Grab]
type = hitdef
trigger1 = animelem = 1
trigger1 = command = "holdfwd" || command = "holdback" || AIlevel
trigger1 = p2dist y >= (p2, const(size.height))
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 28
attr = A, ST
hitflag = MAFD
priority = 7, Miss
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 1510
p2stateno = 1515
fall = 1
fall.recover = 0
fall.recovertime = 0
numhits = 0
sparkno = -1
hitsound = s2, 800
hitsound.channel = 2

[State 1501, Hitpunch]
type = hitdef
trigger1 = animelem = 3
attr = A, SA
damage = 80, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 9, 12
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, 5
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -4, 5 + map(juggledecay)
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
forcenofall = 0
fall.recover = 0
fall.recovertime = 0
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -24
yaccel = 0.941
p1sprpriority = sprpriority
p2facing = 1
down.bounce = 1
fall.xvelocity = -2
fall.yvelocity = -6

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1501, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1509


;----- HYAKKI GOUZAN -----
[Statedef 1502]
type = S
physics = N
movetype = A
juggle = 1
anim = 1502
velset = vel x, 0
ctrl = 0
poweradd = 0
sprpriority = 2

[State 1502, Pos]
type = posset
trigger1 = 1
y = 0

[State 1502, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
;channel = 1
stopongethit = 1

[State 1502, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 1
channel = 0

[State 1502, Vel]
type = velmul
trigger1 = time
x = 0.90

[State 1502, Dust]
type = explod
trigger1 = time = 0
trigger2 = time = 3
trigger3 = time = 6
anim = 6020
sprpriority = 3
postype = p1
pos = 8 * time * const(size.xscale), 0
ownpal = 1

[State 1502, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, SA
damage = 80, 0
animtype = Hard
guardflag = LA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3, -4.5
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -4 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -20, -5
yaccel = 0.941
p1sprpriority = sprpriority

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1502, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- HYAKKI GOU DAN -----
[Statedef 1503]
type = A
physics = N
movetype = A
juggle = 1
anim = 1503
poweradd = 0
sprpriority = 2
ctrl = 0

[State 1503, Accel]
type = veladd
trigger1 = time
y = 0.623

[State 1503, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 1503, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 22
channel = 0

[State 1503, Hit Grab]
type = hitdef
trigger1 = animelem = 1
trigger1 = command = "holdfwd" || command = "holdback" || AIlevel
trigger1 = p2dist y < (p2, const(size.height))
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 28
attr = A, ST
hitflag = MAFD
priority = 7, Miss
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 1520
p2stateno = 1525
fall = 1
fall.recover = 0
fall.recovertime = 0
numhits = 0
sparkno = -1
hitsound = s2, 800
hitsound.channel = 2

[State 1503, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, SA
damage = 100, 0
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -2
air.type = High
airguard.velocity = -6.00, -1.00
air.velocity = -4, -2 + map(juggledecay)
down.velocity = -4, -6
down.cornerpush.veloff = -8
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -21
yaccel = 0.941
p1sprpriority = sprpriority

[State 1503, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1509


;---Land---
[Statedef 1509]
type = S
physics = S
movetype = I
anim = 1509
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1509, Pos]
type = posset
trigger1 = 1
y = 0

[State 1509, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1509, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1509, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKKI GOUSAI>=============================
;----- PLAYER -----
[Statedef 1510]
type = A
physics = N
movetype = A
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 1515

[State 1510, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, 8
channel = 0

[State 1510, Pos]
type = posadd
trigger1 = !time
trigger1 = (target, statetype != A)
x = (p2dist x) + (target, const(size.mid.pos.x)) - 47
y = (p2dist y) + (target, const(size.mid.pos.y)) + 25

[State 1510, Vel]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 1510, Vel]
type = velset
trigger1 = animelem = 2
x = -0.5
y = -6

[State 1510, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.5

[State 1510, fall]
type = velmul
trigger1 = animelemtime(2) > 0 && vel y > 1
y = 1.06

[State 1510, Width]
type = width
trigger1 = 1
edge = ceil(30 * const(size.xscale)), 0

[State 1510, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 47 * const(size.xscale), -23

[State 1510, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 43 * const(size.xscale), -47

[State 1510, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 22 * const(size.xscale), -70

[State 1510, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
pos = -26 * const(size.xscale), -49

[State 1510, change]
type = changestate
trigger1 = animelemtime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y > -8
value = 1511


;----- HIT FLOOR -----
[Statedef 1511]
type = A
physics = N
movetype = A
anim = 1511
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1511, Throw]
type = targetstate
trigger1 = !time
value = 1516

[State 1511, Pos]
type = posset
trigger1 = !time
y = 0

[State 1511, Bind 1]
type = targetbind
trigger1 = !time;animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -40 * const(size.xscale), -14

[State 1511, Damage]
type = hitadd
trigger1 = animelem = 2
value = 1

[State 1511, Damage]
type = targetlifeadd
trigger1 = !time
value = floor(-120 * map(damagescaling))
dizzy = 1

[State 1511, Give Power]
type = targetpoweradd
trigger1 = !time
value = 40; givepower

[State 1511, Get Power]
type = poweradd
trigger1 = !time
value = 200 * map(meterscaling); getpower

[State 1511, Sound]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 1511, Sound]
type = playsnd
trigger1 = !time
value = 2, 3
channel = 2

[State 1511, Shake]
type = envshake
trigger1 = !time
time = 18
ampl = 2
freq = 180

[State 1511, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
postype = p1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1511, Spark]
type = explod
trigger1 = !time
anim = 6007 + (random % 2)
ID = 6000
postype = p1
pos = ceil(-25 * const(size.xscale)), ceil(-17 * const(size.yscale))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1511, Turn]
type = turn
trigger1 = !animtime

[State 1511, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- TARGET -----
[Statedef 1515]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 2

[State 1515, Anim]
type = changeanim2
trigger1 = !time
value = 1515

[State 1515, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1515, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- TARGET HIT FLOOR -----
[Statedef 1516]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 2

[State 1516, Turn]
type = turn
trigger1 = !time

[State 1516, Anim]
type = changeanim2
trigger1 = !time
value = 1516

[State 1516, Bound]
type = screenbound
trigger1 = animelemtime(2) < 0
value = 0
movecamera = 1, 0

[State 1516, Accel]
type = velset
trigger1 = animelem = 2
x = -4
y = -10

[State 1516, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.941; yaccel

[State 1516, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1516, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = animelemtime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1516, End]
type = selfstate
trigger1 = animelemtime(2) > 0 && vel y > 0 && (pos y > -vel y)
value = 5100
ctrl = 0


;======================<HYAKKI GOUTSUI>=============================
;----- PLAYER -----
[Statedef 1520]
type = A
physics = N
movetype = A
anim = 1520
ctrl = 0
velset = 0, 0
sprpriority = 0

[State Throw]
type = targetstate
trigger1 = !time
value = 1525

[State 1520, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 8
channel = 0

[State 1520, Pos]
type = posadd
trigger1 = !time
trigger1 = (target, statetype != A)
x = (p2dist x) + (target, const(size.mid.pos.x)) + 25
y = (p2dist y) + (target, const(size.mid.pos.y)) + 41

[State 1520, Vel]
type = velset
trigger1 = animelemtime(1) < 2
x = 0
y = 0

[State 1520, Vel]
type = velset
trigger1 = animelemtime(1) = 2
x = 0.66
y = -10.5

[State 1520, Accel]
type = veladd
trigger1 = animelemtime(1) > 2
y = 0.5

[State 1520, fall]
type = velmul
trigger1 = animelemtime(1) > 2 && vel y > 1
y = 1.06

[State 1520, Width]
type = width
trigger1 = 1
edge = ceil(30 * const(size.xscale)), 0

[State 1520, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(5) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(10) >= 0
value = 1

[State 1520, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
trigger2 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger3 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger4 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger5 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger6 = animelemtime(9) >= 0 && animelemtime(10) < 0
value = -1

[State 1520, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -18 * const(size.xscale), -43

[State 1520, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -14 * const(size.xscale), -45

[State 1520, Bind 3 / 8]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = -14 * const(size.xscale), -44

[State 1520, Bind 4 / 9]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = 0, -50

[State 1520, Bind 5 / 10]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(10) >= 0
pos = 12 * const(size.xscale), -35

[State 1520, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 11 * const(size.xscale), -24

[State 1520, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = -12 * const(size.xscale), -33

[State 1520, spinsnd]
type = playsnd
trigger1 = animelem = 4
trigger2 = animelem = 9
value = 1, 5
;channel = 1
stopongethit = 1

[State 1520, change]
type = changestate
trigger1 = animelemtime(1) > 2
trigger1 = vel y > 0
trigger1 = pos y > -8
value = 1521


;----- HIT FLOOR -----
[Statedef 1521]
type = A
physics = N
movetype = A
anim = 1521
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1521, Turn]
type = turn
trigger1 = !time

[State 1521, Throw]
type = targetstate
trigger1 = !time
value = 1526

[State 1521, Pos]
type = posset
trigger1 = !time
y = 0

[State 1521, Bind 1]
type = targetbind
trigger1 = !time
pos = -16 * const(size.xscale), 0

[State 1521, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1521, Damage]
type = targetlifeadd
trigger1 = !time
value = floor(-150 * map(damagescaling))
dizzy = 1

[State 1521, Give Power]
type = targetpoweradd
trigger1 = !time
value = 40; givepower

[State 1521, Get Power]
type = poweradd
trigger1 = !time
value = 200 * map(meterscaling); getpower

[State 1521, Sound]
type = playsnd
trigger1 = !time
value = 4, 22
channel = 0

[State 1521, Sound]
type = playsnd
trigger1 = !time
value = 5, 4

[State 1521, Shake]
type = envshake
trigger1 = !time
time = 18
ampl = 2
freq = 180

[State 1521, Dust]
type = explod
trigger1 = !time
anim = 6024
ID = 6024
sprpriority = -10
postype = p1
pos = ceil(-17 * const(size.xscale)), 0
scale = 1, 0.67
ownpal = 1

[State 1521, Accel]
type = veladd
trigger1 = animelemtime(1) = 12
x = 3
y = -6

[State 1521, Accel]
type = veladd
trigger1 = animelemtime(1) > 12
y = 0.5

[State 1521, End]
type = changestate
trigger1 = time > 3
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
ctrl = 1


;----- TARGET -----
[Statedef 1525]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1525, Anim]
type = changeanim2
trigger1 = !time
value = 1525

[State 1525, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1525, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;----- TARGET HIT FLOOR -----
[Statedef 1526]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1526, Turn]
type = turn
trigger1 = !time

[State 1526, Anim]
type = changeanim2
trigger1 = !time
value = 1526

[State 1526, Bound]
type = screenbound
trigger1 = animelemtime(2) < 0
value = 0
movecamera = 1, 0

[State 1526, Accel]
type = veladd
trigger1 = animelem = 2
x = 4
y = -10

[State 1526, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.941; yaccel

[State 1526, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 1526, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = animelemtime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1526, End]
type = selfstate
trigger1 = animelemtime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;======================<STATUE TAUNT>=============================
[Statedef 1001]
type = S
physics = S
movetype = A
anim = 1001
ctrl = 0
velset = 0, 0
poweradd = 0

[State 1001, Statue]
type = helper
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 1002
ID = 1002
name = "Statue"
postype = p1
pos = ceil(-28 * const(size.xscale)), -52
ownpal = 1

[State 1001, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0

[State 1001, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1

[State 1001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<GUARD CANCEL>==========
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 1

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
value = SCA
time = 1

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 18
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1

[State 2900, Hit]
type = hitdef
trigger1 = animelem = 5
attr = S, SA
damage = 50, 0
dizzypoints = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -12, -12
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -12, -12
down.velocity = -12, -12
down.cornerpush.veloff = -8
getpower = 0, 0
givepower = 30
guard.cornerpush.veloff = 0
forcestand = 1
forcenofall = 1
sparkno = s6005 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -40
yaccel = 0.941
p1sprpriority = sprpriority
kill = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
