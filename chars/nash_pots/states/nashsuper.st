; _______________________________
;| Nash by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<SONIC BREAK>========================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3000, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3000, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

[State 3000, Strength Shadow]
type = mapset
trigger1 = map(shadow)
trigger2 = AIlevel
trigger2 = time <= 0
map = "strength"
value = 1
ignorehitpause = 1

[State 3000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3000, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger1 = animelemtime(3) < -1
time = 1
value = SCA

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-52 * const(size.xscale)), ceil(-75 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-52 * const(size.xscale)), ceil(-75 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3000, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(6 * const(size.xscale)), ceil(-86 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3000, Shadow Anim]
type = changeanim
trigger1 = map(shadow)
trigger1 = anim = [3000, 3002]
trigger1 = animelemtime(4) >= 2 && animelemtime(6) < 0
value = anim + 1

[State 3000, Anim]
type = changeanim
triggerall = !map(shadow)
triggerall = anim = [3000, 3002]
triggerall = animelemtime(4) >= 0 && animelemtime(6) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger3 = isasserted(noinput); for active switch
value = anim + 1

[State 3000, Update Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = animelem = 1
trigger1 = anim = [3000, 3003]
trigger1 = command = "x" || command = "y" || command = "z"
map = "strength"
value = ifelse(command = "z", 2, ifelse(command = "y", 1, 0))

[State 3000, Update Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = animelem = 1
trigger1 = anim = [3000, 3003]
map = "strength"
value = 2

[State 3000, Pos]
type = posadd
trigger1 = anim = 3003
trigger1 = animelem = 1
x = 32 * const(size.xscale)

[State 3000, Width]
type = width
trigger1 = anim = 3000
trigger1 = animelemtime(3) = -1
trigger2 = anim = 3001
trigger2 = animelemtime(3) = -1
trigger3 = anim = 3002
trigger3 = animelemtime(3) = -1
trigger4 = anim = 3003
trigger4 = animelemtime(5) = -1
player = ceil(28 * const(size.xscale)), 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 2
trigger1 = anim = [3000, 3002]
trigger2 = animelem = 3
trigger2 = anim = 3003
value = ifelse(map(shadow), 15, 5), 1
channel = 0

[State 3000, FX]
type = helper
trigger1 = !numhelper(1010)
trigger1 = animelem = 2
trigger1 = anim = [3000, 3002]
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

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = anim = 3000 && animelem = 3
trigger2 = anim = 3001 && animelem = 3
trigger3 = anim = 3002 && animelem = 3
trigger4 = anim = 3003 && animelem = 5
value2 = SCA, AA, AT
time = 1

[State 3000, Sonic Boom]
type = helper
trigger1 = anim = 3000 && animelem = 3
trigger2 = anim = 3001 && animelem = 3
trigger3 = anim = 3002 && animelem = 3
trigger4 = anim = 3003 && animelem = 5
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "Sonic Boom"
postype = p1
pos = ceil(ifelse(anim = 3000, 47, ifelse(anim = 3001, 64, 101)) * const(size.xscale)), ceil(-68 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3
trigger1 = anim = [3000, 3002]
trigger2 = animelem = 5
trigger2 = anim = 3003
value = 7, 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 9
trigger1 = anim = 3003
value = 0, 52

[State 3000, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 3003, 11, 0)
ctrl = 1


;======================<SOMERSAULT JUSTICE>========================
[Statedef 3100]
type = S
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000 + 0 * (map(superlevel) := 2)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3100, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge2) := 0
trigger1 = 1 || map(ai_charge2) := 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
attr = SCA
slot = 0
time = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(9) < 0
attr = , AP
slot = 1
time = 1

[State 3100, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(20 * const(size.xscale)), ceil(-24 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(20 * const(size.xscale)), ceil(-24 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3100, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3100, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(-13 * const(size.xscale)), ceil(-51 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.667

[State 3100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(29) >= 1
y = 0.704

[State 3100, Vel]
type = velset
trigger1 = animelem = 5 || animelem = 17
x = 8.20;6.15

[State 3100, Vel]
type = velset
trigger1 = animelemtime(29) = 1
x = 12.30
y = -12.679

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 29
statetype = A

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
value = ifelse(map(shadow), 15, 5), ifelse((animelem = 28), 3, 2)
channel = 0

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
value = 7, 1
freqmul = ifelse((animelem = 28), 0.9, 1)

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 29
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = animelem = 29
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3100, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
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

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 5 || animelem = 16 || animelem = 17
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -3.22, -6.00
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := ifelse((animelem = 5 || animelem = 17), -70, -30)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 6 || animelem = 18
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -3.22, -6.00
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := -110
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 28
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -2.5, -6.00
guard.velocity = 0
air.velocity = -2.5, -6.00
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := -30
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 29 || animelem = 30
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -2.5, -6.00
guard.velocity = 0
air.velocity = -2.5, -6.00
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := ifelse((animelem = 29), -57, -84)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3100, Hit Final]
type = hitdef
trigger1 = animelem = 31
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -7, -6.00
guard.velocity = 0
air.velocity = -7, -6.00
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 120), map(sparky) := -110
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3100, Idle]
type = statetypeset
trigger1 = animelemtime(33) >= 0
movetype = I
persistent = 0

[State 3100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3103


;----- LAND -----
[Statedef 3103]
type = S
physics = S
ctrl = 0
anim = 3103
velset = 0, 0
movehitpersist = 1

[State 3103, Pos]
type = posset
trigger1 = 1
y = 0

[State 3103, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3103, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;======================<CROSSFIRE BLITZ>========================
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3200, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3200, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-29 * const(size.xscale)), ceil(-18 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-29 * const(size.xscale)), ceil(-18 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3200, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3200, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-82 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.7

[State 3100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
trigger2 = animelemtime(7) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(20) = 1
x = 7.0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 14
value = ifelse(map(shadow), 14, 4), 1
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 20
value = ifelse(map(shadow), 14, 4), 0
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 23
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 14
value = 1, 5
;channel = 1
stopongethit = 1

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 20 || animelem = 23
value = 1, 2
;channel = 1
stopongethit = 1

[State 3200, FX]
type = helper
trigger1 = !numhelper(1010)
trigger1 = animelem = 23
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

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 9 || animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.75, 0
guard.velocity = -5.75
air.velocity = -5.15, -6.7
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := ifelse((animelem = 15), -64, -86)
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 20
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.75, 0
guard.velocity = -5.75
air.velocity = -5.15, -6.7
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := ifelse((animelem = 20), -68, -32)
hitsound = s2, ifelse((animelem = 20), 1, 4)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3200, Hit Final]
type = hitdef
trigger1 = animelem = 24
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 4, 4
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -5.13, -5.83
guard.velocity = -5.75
air.velocity = -5.13, -5.83
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := -75
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3200, Idle]
type = statetypeset
trigger1 = animelemtime(25) >= 0
movetype = I
persistent = 0

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<CROSSFIRE BLITZ II>========================
[Statedef 3300]
type = S
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000 + 0 * (map(superlevel) := 2)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3300, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(4) < 2
time = 1
value = SCA

[State 3300, Sound]
type = playsnd
trigger1 = !map(shadow)
trigger1 = time = 3
value = ifelse(map(shadow), 14, 4), 3
channel = 0

[State 3300, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-29 * const(size.xscale)), ceil(-18 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-29 * const(size.xscale)), ceil(-18 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3300, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3300, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-82 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3300, Vel]
type = velmul
trigger1 = animelemtime(4) >= 0
x = 0.9

[State 3300, Vel]
type = velset
trigger1 = animelem = 4
x = 16

[State 3300, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 6

[State 3300, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 8
value = 0, 103

[State 3300, Dust]
type = explod
trigger1 = animelem = 8
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3300, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3300
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = -5.75
air.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 0
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -50
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 3300, p1state]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = movehit || movereversed
value = 3301

[State 3300, blocked]
type = changeanim
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger1 = moveguarded
value = 3300
elem = 7

[State 3300, Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I
persistent = 0

[State 3300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- CONNECTED -----
[Statedef 3301]
type = S
physics = N
movetype = A
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3301, P2 State]
type = targetstate
trigger1 = !time
trigger1 = numtarget(3300)
value = 3302
ID = 3300

[State 3301, Bind]
type = targetbind
trigger1 = !time
trigger1 = numtarget(3300)
pos = 64 * const(size.xscale), 0
ID = 3300

[State 3301, NHB]
type = nothitby
trigger1 = 1
time = 1
value = , AP

[State 3301, Vel]
type = velset
trigger1 = animelem = 1
x = 4

[State 3301, Vel]
type = velset
trigger1 = animelem = 27
x = 0

[State 3301, Vel]
type = velset
trigger1 = animelem = 31
x = 4.5
y = -6

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(31) >= 0
y = 0.5

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 31
statetype = A

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 7
trigger2 = animelem = 12 || animelem = 18 || animelem = 21
value = ifelse(map(shadow), 14, 4), (random % 4)
channel = 0

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 27
value = ifelse(map(shadow), 14, 4), 5
channel = 0

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 31
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 18 || animelem = 21 || animelem = 27
value = 1, 2
;channel = 1
stopongethit = 1

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 12 || animelem = 32
value = 1, 5
;channel = 1
stopongethit = 1

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 25
value = 0, 100

[State 3301, Dust]
type = explod
trigger1 = animelem = 25
anim = 8103
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 31
value = 0, 40

[State 3301, Dust]
type = helper
trigger1 = animelem = 31
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3301, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 5 || animelem = 18 || animelem = 22
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3301
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = -5.75
air.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 0
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 100), map(sparky) := -76
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3301, Hit]
type = hitdef
trigger1 = animelem = 8 || animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3301
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = -5.75
air.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 0
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 100), map(sparky) := ifelse((animelem = 8), -25, -58)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3301, Hit]
type = hitdef
trigger1 = animelem = 27
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3301
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -4, -7
guard.velocity = -10.52
air.velocity = -4, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 165
guard.cornerpush.veloff = 05
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 100), map(sparky) := -72
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3301, Hit]
type = hitdef
trigger1 = animelem = 32
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3301
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 55, 14
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -10, -5
guard.velocity = -10.52
air.velocity = -10, -2.5
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 100), map(sparky) := -70
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3301, Idle]
type = statetypeset
trigger1 = animelemtime(33) >= 0
movetype = I
persistent = 0

[State 3301, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3303


;----- TARGET -----
[Statedef 3302]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 3302, Pos]
type = posset
trigger1 = 1
y = 0

[State 3302, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3302, End]
type = selfstate
trigger1 = 1
value = 5000


;----- LAND -----
[Statedef 3303]
type = S
physics = S
ctrl = 0
anim = 3303
velset = 0, 0
movehitpersist = 1

[State 3303, Pos]
type = posset
trigger1 = 1
y = 0

[State 3303, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3303, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3303, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<FINAL MISSION>========================
[Statedef 3400]
type = S
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -3000 + 0 * (map(superlevel) := 3)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3400, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3400, NHB]
type = nothitby
trigger1 = time < 54
time = 1
value = SCA

[State 3400, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-43 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(47 * const(size.xscale)), ceil(-43 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3400, Vel]
type = velmul
trigger1 = 1
x = 0.925

[State 3400, Vel]
type = velset
trigger1 = animelem = 4
x = 16

[State 3400, Vel]
type = velset
trigger1 = vel x
trigger1 = animelemtime(8) >= 0
x = 0

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 6

[State 3400, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3400, close]
type = changeanim
trigger1 = animelemtime(4) >= 1 && animelemtime(8) < 0
trigger1 = animelemtime(animelemno(0)) >= 1
trigger1 = p2bodydist x <= 5 && p2dist x >= 0
value = 3400
elem = animelemno(0) + 1

[State 420, Sound]
type = playsnd
trigger1 = animelem = 7
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 8
value = 1, 2
;channel = 1
stopongethit = 1

[State 3400, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3400
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 80), map(sparky) := -78
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -12.75, 0
guard.velocity = -10.52
air.velocity = -7.4, -5.2
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitonce = 1
kill = 0
guard.kill = 1

[State 3400, P2 State]
type = targetstate
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
trigger1 = movehit && numtarget(3400)
ID = 3400
value = 3420
ignorehitpause = 1

[State 3400, p1state]
type = changestate
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
trigger1 = movehit && numtarget(3400)
value = 3410
ignorehitpause = 1

[State 3400, Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I
persistent = 0

[State 3400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- JUMP -----
[Statedef 3410]
type = A
physics = N
movetype = A
anim = 3410
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3410, black]
type = palfx
trigger1 = !time
time = 10
sinadd = -255, -255, -255, 40

[State 3410, black]
type = palfx
trigger1 = time >= 10
time = 1
mul = 0, 0, 0

[State 3410, FX]
type = playsnd
trigger1 = animelem = 2
value = 7, 4

[State 3410, FX]
type = explod
trigger1 = animelem = 2
anim = 3416
postype = p1
sprpriority = 2
scale = const(size.xscale), const(size.yscale)
ownpal = 1

[State 3410, Vel]
type = velset
trigger1 = animelem = 2
y = -12

[State 3410, black]
type = allpalfx
trigger1 = animelem = 3
time = 10
sinadd = -255, -255, -255, 40

[State 3410, End]
type = changestate
trigger1 = !animtime
value = 3411


;----- SPARKS -----
[Statedef 3411]
type = A
physics = N
movetype = A
anim = 9999
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3411, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget(3400)
ID = 3400
value = 3421

[State 3411, Pos]
type = posset
trigger1 = 1
x = -const(size.ground.front) * facing
y = -240

[State 3411, Bind]
type = targetbind
trigger1 = numtarget(3400)
pos = (20 * const(size.xscale)) + (target(3400), const(size.ground.front) + const(size.ground.back)), 0
ID = 3400

[State 3411, Pause]
type = pause
trigger1 = time < 54
time = 2
movetime = 2

[State 3411, Pause]
type = pause
trigger1 = time = 54
time = 0

[State 3411, black]
type = envcolor
trigger1 = 1
time = 2
value = 0, 0, 0

[State 3411, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 3411, Hitadd]
type = hitadd
trigger1 = (time = [0, 48]) && !(time % 4)
value = 1

[State 3411, Juggle]
type = mapadd
trigger1 = !(time % 4)
trigger1 = time = [0, 48]
map = "juggle_count"
value = 1

[State 3411, Damage];472
type = targetlifeadd
trigger1 = numtarget(3400)
trigger1 = (time = [0, 48]) && !(time % 4)
ID = 3400
value = floor(-20 * map(damagescaling))
dizzy = 0
kill = 0

[State 3411, givepower]
type = targetpoweradd
trigger1 = numtarget(3400)
trigger1 = (time = [0, 48]) && !(time % 4)
ID = 3400
value = 26

[State 3411, HitSound]
type = playsnd
trigger1 = (time = [0, 48]) && !(time % 4)
value = 2, 2
channel = 2

;[State 3411, Sparks]
;in ZSS

[State 3411, Shake]
type = envshake
trigger1 = (time = [0, 48]) && !(time % 4)
time = 12
freq = 180
ampl = 2

[State 3411, End]
type = changestate
trigger1 = time >= 54
value = 3412


;----- TAUNT -----
[Statedef 3412]
type = S
physics = N
movetype = A
anim = 3412
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3412, Pos]
type = posset
trigger1 = !time
y = 0

[State 3412, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget(3400)
ID = 3400
value = 3422

[State 3412, Damage]
type = targetlifeadd
trigger1 = numtarget(3400)
trigger1 = (target(3400), stateno = 3423) && (target, time) = 1
ID = 3400
value = floor(-80 * map(damagescaling))
dizzy = 0
kill = 1

[State 3412, Shadow]
type = playsnd
trigger1 = animelem = 14
value = 7, 5

[State 3412, Shadow]
type = explod
trigger1 = animelem = 14
anim = 6005
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-93 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3412, Sound]
type = playsnd
trigger1 = numtarget(3400)
trigger1 = target(3400), time = 1
trigger1 = target(3400), stateno = 3423
value = 7, 8

[State 3412, Sxplosion]
type = explod
trigger1 = numtarget(3400)
trigger1 = target(3400), time = 1
trigger1 = target(3400), stateno = 3423
anim = 3415
sprpriority = 2
postype = p1
pos = 48, -40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3412, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget(3400)
trigger1 = target(3400), time = 1
trigger1 = target(3400), stateno = 3423
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 48, 0
ownpal = 1

[State 3412, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget(3400)
trigger1 = target(3400), time = 1
trigger1 = target(3400), stateno = 3423
anim = F 62
postype = p1
pos = 48, 0
sprpriority = -10
ownpal = 1

;[State 3412, Anim]
;type = changeanim
;trigger1 = numtarget(3400)
;trigger1 = animelemtime(14) >= 0 && animelemtime(15) < 0
;value = 3412
;elem = 14

[State 3412, Win]
type = changestate
trigger1 = winko
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
value = 3490

[State 3412, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 3420]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3420, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 3420, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3420, Anim]
type = changeanim
trigger1 = !hitshakeover
value = 5012

[State 3420, Anim]
type = changeanim
trigger1 = hitshakeover
value = ifelse(selfanimexist(5250), 5250, ifelse(selfanimexist(5051), 5051, 5030))
persistent = 0

[State 3420, fall]
type = hitfallset
trigger1 = !hitfall
value = 1

[State 3420, Accel]
type = veladd
trigger1 = hitshakeover
y = 0.5

[State 3420, Vel]
type = velset
trigger1 = hitshakeover
y = -16
persistent = 0

[State 3420, Safety]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


[Statedef 3421]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3421, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 3421, Anim]
type = changeanim2
trigger1 = !time
value = 9999

[State 3421, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3421, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3422]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3422, Anim]
type = changeanim2
trigger1 = !time
value = 3422

[State 3422, Pos]
type = posset
trigger1 = !time
y = -384

[State 3422, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3422, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 3422, Vel]
type = velset
trigger1 = !time
y = 4

[State 3422, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3423


;----- Target Hit Floor -----
[Statedef 3423]
type = L
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3423, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 3423, Pos]
type = posset
trigger1 = !time
y = 0

[State 3423, Shake]
type = envshake
trigger1 = !time
time = 12
freq = 180
ampl = 2

[State 3423, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = [5100, 5101]
trigger2 = time >= 12
value = 3424


;----- Target Bounce -----
[Statedef 3424]
type = L
physics = N
movetype = H

[State 3424, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3424, Anim]
type = changeanim
triggerall = !time
trigger1 = anim != [5101, 5109]
trigger2 = !selfanimexist(5160 + (anim % 10))
value = 5160

[State 3424, Anim]
type = changeanim
trigger1 = !time
trigger1 = (anim = [5101, 5109]) && selfanimexist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 3424, Vel]
type = hitfallvel
trigger1 = !time

[State 3424, Accel]
type = veladd
trigger1 = 1
y = 0.4

[State 3424, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 3424, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 3425


;----- Target Lie down -----
[Statedef 3425]
type = L
physics = N
movetype = H
velset = 0, 0

[State 3425, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3425, Pos]
type = posset
trigger1 = 1
y = 0

[State 3425, Anim]
type = changeanim
trigger1 = anim = [5081, 5089]
trigger1 = selfanimexist(5110 + (anim % 10))
value = 5110 + (anim % 10)

[State 3425, Anim]
type = changeanim
triggerall = !time
triggerall = anim != [5110, 5119]
trigger1 = anim != [5161, 5169]
trigger2 = !selfanimexist(5170 + (anim % 10))
value = 5170

[State 3425, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != [5110, 5119]
trigger1 = anim = [5161, 5169]
trigger1 = selfanimexist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 3425, FX]
type = fallenvshake
trigger1 = !time

[State 3425, FX]
type = playsnd
trigger1 = !time
value = F 7, 0

[State 3425, FX]
type = explod
trigger1 = !time
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 3425, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [5171, 5179]
trigger1 = selfanimexist(5110 + (anim % 10))
value = 5110 + (anim % 10)

[State 3425, Anim]
type = changeanim
trigger1 = anim != [5111, 5119]
trigger1 = !animtime
value = 5110

[State 3425, Anim]
type = changeanim
trigger1 = !alive
trigger1 = anim != 5150
trigger1 = !animtime || anim = [5110, 5119]
value = 5150

[State 3425, End]
type = selfstate
trigger1 = !alive
value = 5150

[State 3425, End]
type = selfstate
trigger1 = time >= 38
value = 5120


;----- Win pose -----
[Statedef 3490]
type = S
sprpriority = 2

[State 3490, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 3490, Anim]
type = changeanim
trigger1 = anim != 3490
value = 3490

[State 3490, Shadow]
type = playsnd
trigger1 = animelem = 6
value = 7, 5

[State 3490, Shadow]
type = explod
trigger1 = animelem = 6
anim = 6005
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-92 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3490, Allow Round End]
type = ctrlset
trigger1 = time >= 120
trigger1 = roundstate = [2, 3]
trigger1 = time > (fightscreenvar(round.over.hittime) + fightscreenvar(round.over.waittime) + fightscreenvar(round.over.wintime))
value = 1


;======================<REVERSED SOMERSAULT>========================
[Statedef 3500]
type = S
physics = N
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3500, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3500, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge2) := 0
trigger1 = 1 || map(ai_charge2) := 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(7) < 0
time = 1
value = A

[State 3500, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-29 * const(size.xscale)), ceil(-14 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3500, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-29 * const(size.xscale)), ceil(-14 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3500, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3500, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(27 * const(size.xscale)), ceil(-85 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3500, Accel]
type = velmul
trigger1 = animelemtime(18) < 0
x = 0.9
y = 0.9

[State 3500, Accel]
type = veladd
trigger1 = animelemtime(18) >= 0
y = 0.5

[State 3500, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A

[State 3500, Vel]
type = velset
trigger1 = animelem = 6
x = 12
y = -12

[State 3500, Vel]
type = velset
trigger1 = vel y > 0
x = 0

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = ifelse(map(shadow), 14, 4), ifelse((animelem = 12), 2, 0)
channel = 0

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = 7, 1
freqmul = ifelse((animelem = 5), 1.1, 1)

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 41

[State 3500, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3500, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 5 || animelem = 12
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

[State 3500, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -3.0, -6.0
guard.velocity = 0
air.velocity = -3.0, -6.0
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := ifelse((animelem = 6 || animelem = 14), -60, -30)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3500, Hit]
type = hitdef
trigger1 = animelem = 6 || animelem = 12 || animelem = 14
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -3.0, -6.0
guard.velocity = 0
air.velocity = -3.0, -6.0
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := ifelse((animelem = 6 || animelem = 14), -60, -30)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3500, Hit]
type = hitdef
trigger1 = animelem = 7 || animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -3.0, -6.0
guard.velocity = 0
air.velocity = -3.0, -6.0
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -90
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3500, Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I
persistent = 0

[State 3500, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3503


;----- LAND -----
[Statedef 3503]
type = S
physics = S
ctrl = 0
anim = 3503
velset = 0, 0
movehitpersist = 1

[State 3503, Pos]
type = posset
trigger1 = 1
y = 0

[State 3503, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3503, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3503, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;======================<SONIC BLADE>========================
[Statedef 3600]
type = S
physics = S
movetype = A
anim = 3600
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -3000 + 0 * (map(superlevel) := 3)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3600, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3600, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3600, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3600, NHB]
type = nothitby
trigger1 = time <= 54
time = 1
value = SCA

[State 3600, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-24 * const(size.xscale)), ceil(-76 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3600, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(-24 * const(size.xscale)), ceil(-76 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3600, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3600, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(65 * const(size.xscale)), ceil(-85 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3600, Faster]
type = changeanim
trigger1 = animelemtime(17) < 0
trigger1 = time = 40
value = 3600
elem = 17

[State 3600, Width]
type = width
trigger1 = animelemtime(22) = -1
player = ceil(28 * const(size.yscale))

[State 3600, Pos]
type = posadd
trigger1 = animelem = 18 || animelem = 19 || animelem = 20
x = ifelse((animelem = 18), 40, ifelse((animelem = 19), 20, 2)) * const(size.xscale)

[State 3600, Sprite Priority]
type = sprpriority
trigger1 = animelem = 17
value = -1

[State 3600, Sprite Priority]
type = sprpriority
trigger1 = animelem = 20
value = 2

[State 3600, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(shadow), 14, 4), 3
channel = 0

[State 3600, Sound]
type = playsnd
trigger1 = animelem = 17
value = ifelse(map(shadow), 14, 4), 4
channel = 0

[State 3600, FX]
type = helper
trigger1 = animelem = 21
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

[State 3600, Sound]
type = playsnd
trigger1 = animelem = 21
value = 7, 2

[State 3600, Sonic Blade]
type = helper
trigger1 = animelem = 19
helpertype = normal; projectile
stateno = 3605
ID = 3605
name = "Sonic Blade"
postype = p1
pos = 0, -75
size.xscale = 0.5
size.yscale = 0.5
supermovetime = cond(numenemy, (p2, pausetime), 60)
ownpal = 1

[State 3600, Anim]
type = changeanim
triggerall = animelemtime(26) >= 0 && animelemtime(27) < 0
trigger1 = numhelper(3605)
trigger1 = helper(3605), stateno = 3605
value = 3600
elem = 24

[State 3600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MOONSAULT STRIKE>========================
[Statedef 3700]
type = A
physics = N
movetype = A
anim = 3700
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3700, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3700, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3700, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3700, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-4 * const(size.xscale)), ceil(-48 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3700, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-6 * const(size.xscale)), ceil(-94 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3700, Shadow]
type = playsnd
trigger1 = !time
trigger1 = map(shadow)
value = 7, 5

[State 3700, Shadow]
type = explod
trigger1 = !time
trigger1 = map(shadow)
anim = 6005
postype = p1
pos = ceil(-6 * const(size.xscale)), ceil(-94 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
bindtime = -1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3700, Vel]
type = velset
trigger1 = animelemtime(14) < 0
x = 0
y = 0

[State 3700, Accel]
type = veladd
trigger1 = animelemtime(14) >= 0
y = ifelse(vel y >= 10, 0.5, 1)

[State 3700, Vel]
type = velset
trigger1 = animelem = 14
x = 6

[State 3700, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 13
value = ifelse(map(shadow), 14, 4), ifelse((animelem = 13), 4, 6)
channel = 0

[State 3700, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 15
value = 7, 1
freqmul = ifelse((animelem = 15), 1.1, 1)

[State 3700, Somersault Shell]
type = helper
trigger1 = animelem = 7
helpertype = normal; projectile
stateno = 3705
ID = 3705
name = "Somersault Shell"
postype = p1
pos = ceil(64 * const(size.xscale)), ceil(-24 * const(size.yscale))
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 3700, FX]
type = helper
trigger1 = !numhelper(1205)
trigger1 = animelem = 7 || animelem = 15
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

[State 3700, Hit]
type = hitdef
trigger1 = animelem = 7 || animelem = 9 || animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 12
guard.pausetime = 4, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 20
ground.slidetime = 18
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -4.0, 4.0
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := ifelse((animelem = 9), -20, -60)
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3700, Hit]
type = hitdef
trigger1 = animelem = 17
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
ID = 3700
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 20
ground.slidetime = 18
air.hittime = 120
ground.velocity = -12.75, 0
guard.velocity = -10.52
air.velocity = -6.0, 6.0
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
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 120), map(sparky) := -20
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)

[State 3700, P2 State]
type = targetstate
trigger1 = movehit && numtarget(3700)
trigger1 = !(target, time) && (target(3700), stateno = [5000, 5010])
value = 7070
ID = 3700
ignorehitpause = 1

[State 3700, Idle]
type = statetypeset
trigger1 = animelemtime(18) >= 0
movetype = I
persistent = 0

[State 3700, End]
type = changestate
trigger1 = animelemtime(16) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3701


;----- LAND -----
[Statedef 3701]
type = S
physics = S
ctrl = 0
anim = 3701
velset = 0, 0
movehitpersist = 1

[State 3701, Pos]
type = posset
trigger1 = 1
y = 0

[State 3701, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3701, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3701, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
