; ________________________________
;| Cammy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<SPIN DRIVE SMASHER>=============================
[Statedef 3000]
type = S
physics = N
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3000, Erase Inputs]
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

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
time = 1
value = SCA

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 2
channel = 0

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-18 * const(size.xscale)), ceil(-21 * const(size.yscale))
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
pos = ceil(-18 * const(size.xscale)), ceil(-21 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 40

[State 3000, Dust]
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

[State 3000, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 3000, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
x = -0.11055625

[State 3000, Vel]
type = velset
trigger1 = animelem = 6
x = 9.71
y = 0

[State 3000, Pos]
type = posset
trigger1 = animelem = 7
y = -16
persistent = 0

[State 3000, Camera]
type = screenbound
trigger1 = pos y
value = 1
movecamera = 1, 0

[State 3000, Accel]
type = veladd
trigger1 = animelemtime(7) >= 0
y = 0.5

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, Hit]
type = hitdef
trigger1 = animelemtime(7) >= 0
trigger1 = !((movecontact + movereversed) % 3) && hitcount < 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 24
ground.slidetime = 12
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.ctrltime = 1 + 10
guard.slidetime = 12
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; -14
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, End]
type = changestate
trigger1 = animelemtime(7) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3001


;----- Spike -----
[Statedef 3001]
type = S
physics = N
movetype = A
anim = 3001
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3001, Pos]
type = posset
trigger1 = !time
y = 0

[State 3001, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 3001, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3001, Accel]
type = veladd
trigger1 = vel x > 0 && animelemtime(8) < 0
x = -0.33166875

[State 3001, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3001, Vel]
type = velset
trigger1 = !time
x = 4.48
y = 0

[State 3001, Sound]
type = playsnd
trigger1 = animelem = 8
value = 0, 41

[State 3001, Dust]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3001, Type]
type = statetypeset
trigger1 = animelem = 9
statetype = A
physics = N

[State 3001, Accel]
type = veladd
trigger1 = animelemtime(8) >= 0
x = -0.33166875

[State 3001, Accel]
type = veladd
trigger1 = animelemtime(9) >= 1
y = 0.6633375

[State 3001, Vel]
type = velset
trigger1 = animelem = 8
x = 8.50

[State 3001, Vel]
type = velset
trigger1 = animelemtime(9) = 1
y = -10.56
persistent = 0

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
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
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 32), map(sparky) := -64
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3001, Hit]
type = hitdef
trigger1 = animelemtime(9) >= 0
trigger1 = !((movecontact + movereversed) % 3) && hitcount < 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 35, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
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
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 39), map(sparky) := -110
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3001, End]
type = changestate
trigger1 = animelemtime(9) >= 1 && time >= 19
trigger1 = movecontact = 1 || movereversed = 1
value = 3003

[State 3001, End]
type = changestate
trigger1 = animelemtime(9) >= 1 && time >= 28
value = 3002

[State 3001, End]
type = changestate
trigger1 = animelemtime(9) >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3004


;----- Recover -----
[Statedef 3002]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1105
sprpriority = 2
movehitpersist = 1

[State 3002, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 3002, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3002, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 3002, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3004


;----- Bounce -----
[Statedef 3003]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1106
sprpriority = 2
movehitpersist = 1

[State 3003, Accel]
type = veladd
trigger1 = 1
y = 0.88445

[State 3003, Vel]
type = velset
trigger1 = !time
x = -1.62
y = -13.20

[State 3003, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3004


;----- Land -----
[Statedef 3004]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3004
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3004, Pos]
type = posset
trigger1 = 1
y = 0

[State 3004, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3004, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3004, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<MAX SPIN DRIVE SMASHER>=============================
[Statedef 3050]
type = S
physics = N
movetype = A
anim = 3050
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3050, Erase Inputs]
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

[State 3050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3050, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 2
channel = 0

[State 3050, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-18 * const(size.xscale)), ceil(-21 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-18 * const(size.xscale)), ceil(-21 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3050, Dust]
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

[State 3050, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 3050, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
x = -0.11055625

[State 3050, Vel]
type = velset
trigger1 = animelem = 6
x = 12.24
y = 0

[State 3050, Pos]
type = posset
trigger1 = animelem = 7
y = -16
persistent = 0

[State 3050, Camera]
type = screenbound
trigger1 = pos y
value = 1
movecamera = 1, 0

[State 3050, Accel]
type = veladd
trigger1 = animelemtime(7) >= 0
y = 0.25

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 7
value = 7, 4

[State 3050, FX]
type = helper
trigger1 = animelem = 7 && !numhelper(1025)
helpertype = normal
stateno = 1025
ID = 1025
name = "EX Drill FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -6.00, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 56), map(sparky) := -38
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3050, Hit]
type = hitdef
trigger1 = animelemtime(7) >= 0
trigger1 = !((movecontact + movereversed) % 3) && hitcount < 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 24
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -6.00, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 92), map(sparky) := -30; -14
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3050, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3051


;----- Spike -----
[Statedef 3051]
type = S
physics = N
movetype = A
anim = 3051
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3051, Pos]
type = posset
trigger1 = !time
y = 0

[State 3051, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 3051, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3051, Accel]
type = veladd
trigger1 = vel x > 0 && animelemtime(8) < 0
x = -0.33166875

[State 3051, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3051, Vel]
type = velset
trigger1 = !time
x = 4.48
y = 0

[State 3051, Dust]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3051, Type]
type = statetypeset
trigger1 = animelem = 8
statetype = A
physics = N

[State 3051, Accel]
type = veladd
trigger1 = animelemtime(8) >= 0
x = -0.33166875

[State 3051, Accel]
type = veladd
trigger1 = animelemtime(9) >= 1
y = 0.6633375

[State 3051, Vel]
type = velset
trigger1 = animelem = 8
x = 8.81

[State 3051, Vel]
type = velset
trigger1 = animelemtime(9) = 1
y = -13.48
persistent = 0

[State 3051, Sound]
type = playsnd
trigger1 = animelem = 8
value = 7, 4

[State 3051, FX]
type = helper
trigger1 = animelem = 8 && !numhelper(1025)
helpertype = normal
stateno = 1125
ID = 1125
name = "EX Spike FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 32), map(sparky) := -64
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3051, Hit]
type = hitdef
trigger1 = animelemtime(9) >= 0
trigger1 = !((movecontact + movereversed) % 4) && hitcount < 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
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
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 39), map(sparky) := -110
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
ID = 3051

[State 3051, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3051)
trigger1 = target(3051), hitfall
trigger1 = target(3051), selfanimexist(7697)
trigger1 = target(3051), stateno = 5000 || target(3051), stateno = 5010 || target(3051), stateno = 5020
value = 7697
ID = 3051
ignorehitpause = 1

[State 3051, End]
type = changestate
trigger1 = animelemtime(9) >= 1 && time >= 25
trigger1 = movecontact = 1 || movereversed = 1
value = 3053

[State 3051, End]
type = changestate
trigger1 = animelemtime(9) >= 1 && time >= 38
value = 3052

[State 3051, End]
type = changestate
trigger1 = animelemtime(9) >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3054


;----- Recover -----
[Statedef 3052]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1105
sprpriority = 2
movehitpersist = 1

[State 3052, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.33166875

[State 3052, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3052, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 3052, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3054


;----- Bounce -----
[Statedef 3053]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1106
sprpriority = 2
movehitpersist = 1

[State 3053, Accel]
type = veladd
trigger1 = 1
y = 0.88445

[State 3053, Vel]
type = velset
trigger1 = !time
x = -1.62
y = -13.20

[State 3053, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3054


;----- Land -----
[Statedef 3054]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3054
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3054, Pos]
type = posset
trigger1 = 1
y = 0

[State 3054, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3054, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3054, End]
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


;========================<REVERSE SHAFT BREAKER>=============================
[Statedef 3100]
type = S
physics = N
movetype = A
anim = 3100
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3100, Erase Inputs]
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

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 6, 1
channel = 0

[State 3100, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(18 * const(size.xscale)), ceil(-54 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(18 * const(size.xscale)), ceil(-54 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3100, Push]
type = playerpush
trigger1 = animelemtime(9) >= 0
trigger1 = p2statetype = A
value = 0
ignorehitpause = 1

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 12
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 5.41, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -24
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 12
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 5.41, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 36), map(sparky) := -72
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 9
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 18), map(sparky) := -90
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 8
value = 4, 2
channel = 0

[State 3100, Sound]
type = playsnd
trigger1 = !animtime
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3100, End]
type = changestate
trigger1 = !animtime
value = 3101


;----- Spinning -----
[Statedef 3101]
type = A
physics = N
movetype = A
anim = 3101
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3101, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3101, Accel]
type = veladd
trigger1 = 1
y = 0.60805938

[State 3101, Vel]
type = velset
trigger1 = !time
y = -9.23

[State 3101, Mashing]
type = varset
trigger1 = !time
var(12) = 0

[State 3101, Mashing]
type = varadd
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = !AIlevel
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel
trigger3 = random < 800
var(12) = 1

[State 3101, Anim Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(3) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 3101
elem = animelemno(0) + 1

[State 3101, Anim Skip]
type = changeanim
trigger1 = animelemtime(3) > 0
trigger1 = animelemtime(3) >= (5 -var(12))
trigger1 = 1 || var(12) := (var(12) + 5 - animelemtime(3))
value = 3101
elem = 1

[State 3101, Mashing]
type = varset
trigger1 = var(12) < 0
var(12) = 0

[State 3101, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 7)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(hitcount, 10, 50), ifelse(hitcount, 3, 12)
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 3
guard.pausetime = 4, 4
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 14), map(sparky) := -96
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3101, End]
type = changestate
trigger1 = time >= 17
value = 3102

[State 3101, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3103


;----- Recover -----
[Statedef 3102]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3102
sprpriority = 2
movehitpersist = 1

[State 3102, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3102, Accel]
type = veladd
trigger1 = time
y = 0.45

[State 3102, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3103


;----- Land -----
[Statedef 3103]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3103
velset = 0, 0
sprpriority = 2
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
value = 0
ctrl = 1


;========================<MAX REVERSE SHAFT BREAKER>=============================
[Statedef 3150]
type = S
physics = N
movetype = A
anim = 3150
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3150, Erase Inputs]
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

[State 3150, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3150, NHB]
type = nothitby
trigger1 = animelemtime(8) < 1
time = 1
value = SCA

[State 3150, Sound]
type = playsnd
trigger1 = time = 3
value = 6, 1
channel = 0

[State 3150, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(18 * const(size.xscale)), ceil(-54 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3150, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(18 * const(size.xscale)), ceil(-54 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3150, Push]
type = playerpush
trigger1 = animelemtime(9) >= 0
trigger1 = p2statetype = A
value = 0
ignorehitpause = 1

[State 3150, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 5.41, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -24
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3150, Hit]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 6, 6
guard.pausetime = 6, 6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 5.41, 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -8.96
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 36), map(sparky) := -72
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3150, Hit]
type = hitdef
trigger1 = animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 18), map(sparky) := -90
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3150, Sound]
type = playsnd
trigger1 = animelem = 8
value = 4, 2
channel = 0

[State 3150, Sound]
type = playsnd
trigger1 = !animtime
value = 7, 4

[State 3150, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3150, End]
type = changestate
trigger1 = !animtime
value = 3151


;----- Spinning -----
[Statedef 3151]
type = A
physics = N
movetype = A
anim = 3101
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3151, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3151, Accel]
type = veladd
trigger1 = 1
y = 0.60805938

[State 3151, Vel]
type = velset
trigger1 = !time
y = -11.89

[State 3151, Mashing]
type = varset
trigger1 = !time
var(12) = 0

[State 3151, Mashing]
type = varadd
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = !AIlevel
trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
trigger3 = AIlevel
trigger3 = random < 800
var(12) = 1

[State 3151, Anim Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) >= 0 && animelemtime(3) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 3101
elem = animelemno(0) + 1

[State 3151, Anim Skip]
type = changeanim
trigger1 = animelemtime(3) > 0
trigger1 = animelemtime(3) >= (5 -var(12))
trigger1 = 1 || var(12) := (var(12) + 5 - animelemtime(3))
value = 3101
elem = 1

[State 3151, Mashing]
type = varset
trigger1 = var(12) < 0
var(12) = 0

[State 3151, FX]
type = helper
trigger1 = !numhelper(3155)
helpertype = normal
stateno = 3155
ID = 3155
name = "Max Breaker FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 3151, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 15)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ifelse(hitcount, 10, 60), ifelse(hitcount, 3, 15)
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x < 0, -5.41, 5.41)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x < 0, -1.33, 1.33), -6.50
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 14), map(sparky) := -96
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
ID = 3151

[State 3151, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3151)
trigger1 = target(3151), hitfall
trigger1 = target(3151), selfanimexist(7697)
trigger1 = target(3151), stateno = 5000 || target(3151), stateno = 5010 || target(3151), stateno = 5020
value = 7697
ID = 3151
ignorehitpause = 1

[State 3151, End]
type = changestate
trigger1 = time >= 23
value = 3152

[State 3151, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3153


;----- Recover -----
[Statedef 3152]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3102
sprpriority = 2
movehitpersist = 1

[State 3152, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3152, Accel]
type = veladd
trigger1 = time
y = 0.36

[State 3152, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3153


;----- Land -----
[Statedef 3153]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3103
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3153, Pos]
type = posset
trigger1 = 1
y = 0

[State 3153, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3153, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3153, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<KILLER BEE ASSAULT>=============================
;----- Ceiling Hop -----
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 2
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3200, Push]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3200, Full screen guard]
type = attackdist
trigger1 = 1
value = 640

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 41

[State 3200, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3200, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 3200, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.60805938

[State 3200, Vel]
type = velset
trigger1 = animelem = 6
x = 0
y = -14

[State 3200, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
value = 3225

[State 3200, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3226

[State 3200, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = screenpos y <= 82
value = ifelse(power < 3000, 3225, 3201)


;----- Ceiling Pause -----
[Statedef 3201]
type = A
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -3000 + 0 * (map(superlevel) := 3)

[State 3201, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3201, Sound]
type = playsnd
trigger1 = time = 2
value = 6, 2
channel = 0

[State 3201, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 2
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-7 * const(size.xscale)), ceil(-75 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3201, Superpause]
type = superpause
trigger1 = time = 2
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(-7 * const(size.xscale)), ceil(-75 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3201, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3201, Push]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3201, Full screen guard]
type = attackdist
trigger1 = 1
value = 640

[State 3201, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 3201, Pos]
type = posset
trigger1 = 1
y = ceil(pos y - screenpos y) + 82

[State 3201, End]
type = changestate
trigger1 = !animtime
value = 3210


;----- Wall Hop -----
[Statedef 3205]
type = S
physics = N
movetype = A
anim = 3205
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3205, Erase Inputs]
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

[State 3205, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3205, Push]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 3205, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 3205, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3205, Full screen guard]
type = attackdist
trigger1 = 1
value = 640

[State 3205, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 41

[State 3205, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3205, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 3205, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.60805938

[State 3205, Vel]
type = velset
trigger1 = animelem = 6
x = (backedgebodydist) / -12.0
y = -12

[State 3205, Vel]
type = velset
trigger1 = animelemtime(6) >= 0
trigger1 = vel x >= -2
x = -2

[State 3205, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
value = 3225

[State 3205, End]
type = changestate
trigger1 = animelemtime(6) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3226

[State 3205, Wall]
type = changestate
trigger1 = animelemtime(6) >= 0 && time >= 26
trigger1 = vel x < 0 && backedgebodydist <= -vel x
value = ifelse(power < 3000, 3225, 3206)


;----- Wall Pause -----
[Statedef 3206]
type = A
physics = N
movetype = A
anim = 3206
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -3000 + 0 * (map(superlevel) := 3)

[State 3206, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3206, Sound]
type = playsnd
trigger1 = time = 2
value = 6, 2
channel = 0

[State 3206, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 2
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(44 * const(size.xscale)), ceil(-45 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3206, Superpause]
type = superpause
trigger1 = time = 2
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(44 * const(size.xscale)), ceil(-45 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3206, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3206, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3206, Full screen guard]
type = attackdist
trigger1 = 1
value = 640

[State 3206, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 3206, Pos]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 3206, Pos]
type = posset
trigger1 = !time
x = ceil(-0.5 * gamewidth) * facing

[State 3206, End]
type = changestate
trigger1 = !animtime
value = 3210


;----- Strikes -----
[Statedef 3210]
type = A
physics = N
movetype = A
anim = 3210
ctrl = 0
facep2 = 1
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3210, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3210, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3210, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3210, X]
type = mapset
trigger1 = !time
map = "killerx"
value = p2dist x

[State 3210, Y]
type = mapset
trigger1 = !time
map = "killery"
value = p2dist y

[State 3210, Hypotenuse]
type = mapset
trigger1 = !time
map = "killerhippo"
value = (map(killerx) ** 2 + map(killery) ** 2) ** 0.5

[State 3210, Vel]
type = velset
trigger1 = !time
trigger1 = !map(killerhippo)
x = 0
y = ifelse(pos y >= 0, -18, 18)

[State 3210, Vel]
type = velset
trigger1 = !time
trigger1 = map(killerhippo)
x = (map(killerx) / map(killerhippo)) * 18
y = (map(killery) / map(killerhippo)) * 18

[State 3210, Anim 0]
type = changeanim
trigger1 = !time
trigger1 = vel y < 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [0, 0.22]
value = 3210

[State 3210, Anim 1]
type = changeanim
trigger1 = !time
trigger1 = vel y < 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.22, 0.44]
value = 3211

[State 3210, Anim 2]
type = changeanim
trigger1 = !time
trigger1 = vel y < 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.44, 0.67]
value = 3212

[State 3210, Anim 3]
type = changeanim
trigger1 = !time
trigger1 = vel y < 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.67, 0.89]
value = 3213

[State 3210, Anim 4]
type = changeanim
trigger1 = !time
trigger1 = vel x || vel y
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.89, 1.0]
value = 3214

[State 3210, Anim 5]
type = changeanim
trigger1 = !time
trigger1 = vel y > 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.67, 0.89]
value = 3215

[State 3210, Anim 6]
type = changeanim
trigger1 = !time
trigger1 = vel y > 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.44, 0.67]
value = 3216

[State 3210, Anim 7]
type = changeanim
trigger1 = !time
trigger1 = vel y > 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [.22, 0.44]
value = 3217

[State 3210, Anim 8]
type = changeanim
trigger1 = !time
trigger1 = vel y > 0 && (vel x || vel y)
trigger1 = (vel x / ((vel x ** 2 + vel y ** 2) ** 0.5)) = [0, 0.22]
value = 3218

[State 3210, Sound]
type = playsnd
trigger1 = !time
value = 4, 1
channel = 0

[State 3210, Sound]
type = playsnd
trigger1 = !time
value = 7, 0
;channel = 1
stopongethit = 1

[State 3210, Spark XY]
type = null
triggerall = !time
trigger1 = anim = 3210
trigger1 = map(sparkx.max) := 12 || map(sparky) := -126
trigger2 = anim = 3211
trigger2 = map(sparkx.max) := 42 || map(sparky) := -116
trigger3 = anim = 3212
trigger3 = map(sparkx.max) := 62 || map(sparky) := -100
trigger4 = anim = 3213
trigger4 = map(sparkx.max) := 74 || map(sparky) := -83
trigger5 = anim = 3214
trigger5 = map(sparkx.max) := 78 || map(sparky) := -59
trigger6 = anim = 3215
trigger6 = map(sparkx.max) := 70 || map(sparky) := -31
trigger7 = anim = 3216
trigger7 = map(sparkx.max) := 54 || map(sparky) := -17
trigger8 = anim = 3217
trigger8 = map(sparkx.max) := 34 || map(sparky) := -4
trigger9 = anim = 3218
trigger9 = map(sparkx.max) := 0 || map(sparky) := 4

[State 3210, Bounces]
type = varadd
trigger1 = !time
var(52) = 1

[State 3210, Bounces]
type = varset
trigger1 = !time
trigger1 = prevstateno = [3200, 3209]
var(52) = 0

[State 3210, Hit Direction Check]
type = varset
trigger1 = !time
var(0) = 0

[State 3210, Hit Direction Check]
type = varset
triggerall = numenemy
trigger1 = facing = 1 && p2, pos x < 0
trigger2 = facing = -1 && p2, pos x > 0
var(0) = 1

[State 3210, Full screen guard]
type = attackdist
trigger1 = 1
value = 640

[State 3210, Hit]
type = hitdef
trigger1 = !time
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3200
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(var(0) = 1, -4, 4), -8.37
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(0) = 1, -4, 4), -8.37
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, map(sparky)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3210, Hit]
type = hitdef
trigger1 = !time
trigger1 = !(hitcount % 2)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3200
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = ifelse(var(0) = 1, -4, 4), -8.37
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(0) = 1, -4, 4), -8.37
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, map(sparky)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3210, Throw only one]
type = targetdrop
trigger1 = var(52) >= 5
trigger1 = movehit && numtarget(3200)
trigger1 = !(target(3200), hitshakeover)
excludeID = 3200
keepone = 1
ignorehitpause = 1

[State 3210, P1 State]
type = changestate
trigger1 = var(52) >= 5
trigger1 = movehit && numtarget(3200)
trigger1 = !(target(3200), hitshakeover)
value = 3230
ignorehitpause = 1

[State 3210, Blocked]
type = changestate
trigger1 = moveguarded = 1
value = 3225

[State 3210, Floor]
type = changestate
trigger1 = time
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = ifelse(!(movehit + movereversed) || var(52) >= 5, 3225, 3220)

[State 3210, Ceiling]
type = changestate
trigger1 = time
trigger1 = vel y < 0
trigger1 = screenpos y <= 83
trigger1 = prevstateno != 3221 && p2dist y > 0
value = ifelse(!(movehit + movereversed) || var(52) >= 5, 3225, 3221)

[State 3210, Wall]
type = changestate
trigger1 = time
trigger1 = vel x > 0
trigger1 = frontedgebodydist <= 0
trigger2 = time
trigger2 = vel x < 0
trigger2 = backedgebodydist <= 0
value = ifelse(!(movehit + movereversed) || var(52) >= 5, 3225, 3222)

[State 3210, Yawn]
type = changestate
trigger1 = time >= 24
value = 3225


;----- Wall Down -----
[Statedef 3220]
type = A
physics = N
movetype = A
anim = 3220
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3220, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3220, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3220, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3220, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 3220, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3220, Pos]
type = posset
trigger1 = 1
y = 0

[State 3220, End]
type = changestate
trigger1 = !animtime
value = 3210


;----- Wall Up -----
[Statedef 3221]
type = A
physics = N
movetype = A
anim = 3221
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3221, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3221, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3221, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3221, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 3221, Pos]
type = posset
trigger1 = 1
y = ceil(pos y -screenpos y) + 83

[State 3221, End]
type = changestate
trigger1 = !animtime
value = 3210


;----- Wall Side -----
[Statedef 3222]
type = A
physics = N
movetype = A
anim = 3222
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3222, NHB]
type = nothitby
trigger1 = 1
time = 1
value2 = , AP

[State 3222, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3222, Push]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3222, Sound]
type = playsnd
trigger1 = !time
value = 0, 103

[State 3222, Pos]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 3222, Pos]
type = posset
trigger1 = 1
x = -160 * facing / camerazoom

[State 3222, End]
type = changestate
trigger1 = !animtime
value = 3210


;----- Missed -----
[Statedef 3225]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3225
sprpriority = 2
movehitpersist = 1

[State 3225, Accel]
type = veladd
trigger1 = 1
y = 0.6633375

[State 3225, Vel]
type = velset
trigger1 = !time
x = -1
y = -10.56

[State 3225, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3226


;----- Land -----
[Statedef 3226]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3226
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3226, Pos]
type = posset
trigger1 = 1
y = 0

[State 3226, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3226, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3226, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;---Throw -----
[Statedef 3230]
type = A
physics = N
movetype = A
anim = 3230
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3230, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 3230, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 3235

[State 3230, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 3230, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = ceil(26 * const(size.xscale)), 0

[State 3230, Width]
type = width
trigger1 = animelemtime(6) >= 0
edge = ceil(50 * const(size.xscale)), 0

[State 3230, Bind 1]
type = bindtotarget
trigger1 = numtarget = 1
trigger1 = animelemtime(2) < 0
pos = (24 * const(size.xscale)), 38, Mid

[State 3230, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 12 * const(size.xscale), -36 * const(size.yscale)

[State 3230, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -10 * const(size.xscale), -54 * const(size.yscale)

[State 3230, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 4 * const(size.xscale), -74 * const(size.yscale)

[State 3230, Bind 5]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 24 * const(size.xscale), -38 * const(size.yscale)

[State 3230, Bind 6]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(6) >= 0
pos = 54 * const(size.xscale), -6 * const(size.yscale)

[State 3230, Bind Fix]
type = posset
trigger1 = pos y > 0 && animelemtime(2) < 0
y = 0

[State 3230, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.608059375

[State 3230, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0 && vel x > 0
x = -0.055278125

[State 3230, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3230, Vel]
type = velset
trigger1 = animelem = 2
x = 5.45
y = -11.24

[State 3230, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 0
channel = 0

[State 3230, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3231


;----- Slam -----
[Statedef 3231]
type = A
physics = N
movetype = A
anim = 3231
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3231, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = ceil(50 * const(size.xscale)), 0

[State 3231, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0

[State 3231, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 52 * const(size.xscale), 0

[State 3231, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(-100 * map(damagescaling))
dizzy = 0
kill = 1

[State 3231, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 3231, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 3231, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 3236

[State 3231, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2
value = 3237

[State 3231, Sound]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0

[State 3231, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 3231, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3231, Dust]
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

[State 3231, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 52 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 3231, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.41458598

[State 3231, Vel]
type = velset
trigger1 = animelem = 2
x = -2.66
y = -6.59

[State 3231, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3232


;----- Land -----
[Statedef 3232]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3232
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3232, Pos]
type = posset
trigger1 = 1
y = 0

[State 3232, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3232, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3232, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 3235]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 3235, Anim]
type = changeanim2
trigger1 = !time
value = 3235

[State 3235, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3235, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3236]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3236, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3236, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 3236, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3236, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3236, End]
type = selfstate
trigger1 = time >= 60
value = 5040


[Statedef 3237]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3237, Anim]
type = changeanim
trigger1 = !time
value = 5160

[State 3237, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3237, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel
[State 3237, Vel]
type = velset
trigger1 = !time
x = -5.32
y = -6.91

[State 3237, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;========================<PSYCHO STREAK>=============================
[Statedef 3300]
type = S
physics = N
movetype = A
anim = 3300
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3300, Erase Inputs]
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

[State 3300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3300, NHB]
type = nothitby
trigger1 = time <= 47
time = 1
value = SCA

[State 3300, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 4
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -82 * const(size.xscale), -70 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = time = 4
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = -82 * const(size.xscale), -70 * const(size.yscale)
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3300, Vega]
type = helper
trigger1 = time = 4
trigger1 = !numhelper(6100)
helpertype = normal; projectile?
stateno = 6100
ID = 6100
name = "Vega"
postype = p1
pos = ceil(-40 * const(size.xscale)), 0; 80
supermovetime = 43
ownpal = 1

[State 3300, No proximity block]
type = attackdist
trigger1 = time >= 5
value = 0

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 103
;channel = 1
stopongethit = 1

[State 3300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<MAX PSYCHO STREAK>=============================
[Statedef 3350]
type = S
physics = N
movetype = A
anim = 3350
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3350, Erase Inputs]
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

[State 3350, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3350, NHB]
type = nothitby
trigger1 = time <= 50
time = 1
value = SCA

[State 3350, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = -82 * const(size.xscale), -70 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3350, Superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = -82 * const(size.xscale), -70 * const(size.yscale)
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3350, Vega]
type = helper
trigger1 = time = 4
trigger1 = !numhelper(6100)
helpertype = normal; projectile?
stateno = 6110
ID = 6100
name = "Vega"
postype = p1
pos = ceil(-40 * const(size.xscale)), 0
supermovetime = 45
ownpal = 1

[State 3350, No proximity block]
type = attackdist
trigger1 = time >= 5
value = 0

[State 3350, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 103
;channel = 1
stopongethit = 1

[State 3350, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<SNIPING HEEL>=============================
[Statedef 3400]
type = S
physics = S
movetype = A
anim = 3400
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

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

[State 3400, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3400, NHB]
type = nothitby
trigger1 = 1
time = 4
value = SCA

[State 3400, Sound]
type = playsnd
trigger1 = time = 4
value = 6, 3
channel = 0

[State 3400, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 4
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-34 * const(size.xscale)), ceil(-73 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Superpause]
type = superpause
trigger1 = time = 4
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-34 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3400, End]
type = changestate
trigger1 = !animtime
value = 3401


;----- Dashing -----
[Statedef 3401]
type = S
physics = N
movetype = A
anim = 3401
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3401, Vel]
type = velset
trigger1 = 1
x = 8.25

[State 3401, Sound]
type = playsnd
trigger1 = !time
value = 0, 100

[State 3401, Steps]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 3401, Dust]
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

[State 3401, Hop]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "/x" || command = "/y" || command = "/z"
trigger2 = AIlevel
trigger2 = numenemy && p2bodydist x <= 104
trigger2 = p2stateno != [120, 155] || p2statetype != S
value = 3410

[State 3401, Slide]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "/a" || command = "/b" || command = "/c"
trigger2 = AIlevel
trigger2 = p2bodydist x <= 160
trigger2 = p2stateno = [120, 155] && p2statetype = S
value = 3420

[State 3401, End]
type = changestate
trigger1 = time >= 36
trigger2 = time >= 8
trigger2 = frontedgebodydist <= 0
value = 3402


;----- Miss -----
[Statedef 3402]
type = S
physics = N
movetype = I
anim = 3402
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3402, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 3402, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3402, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Hop -----
[Statedef 3410]
type = S
physics = N
movetype = A
anim = 3410
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3410, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 3410, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.33

[State 3410, Vel]
type = velset
trigger1 = animelem = 2
x = 6
y = -4

[State 3410, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 4
channel = 0

[State 3410, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 3
channel = 0

[State 3410, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 9
value = 1, 5
;channel = 1
stopongethit = 1

[State 3410, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 3410, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3410, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 73), map(sparky) := -46
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
guard.kill = 1

[State 3410, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
ID = 3400
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 67), map(sparky) := -73
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
guard.kill = 1

[State 3410, Juggle Reset]
type = mapset
trigger1 = !map(jugglereset)
trigger1 = map(juggle_count)
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = animelemtime(10) >= 0
trigger1 = 1 || map(jugglereset) := 1
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 3410, P1 State]
type = changestate
trigger1 = animelemtime(10) >= 0
trigger1 = movehit = 1 && numtarget(3400)
trigger1 = (target(3400), statetype = S || target(3400), statetype = C) && !(target(3400), hitshakeover)
value = 3412
ignorehitpause = 1

[State 3410, Idle]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I
persistent = 0

[State 3410, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3411


;----- Land -----
[Statedef 3411]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3411
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3411, Pos]
type = posset
trigger1 = 1
y = 0

[State 3411, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3411, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3411, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Grab -----
[Statedef 3412]
type = A
physics = N
movetype = A
anim = 3412
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3412, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 3430

[State 3412, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 3412, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3412, Bind 1]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = (-8 * const(size.xscale)), 56, Head

[State 3412, Pos]
type = posadd
trigger1 = animelem = 3
x = -56 * const(size.xscale)
y = -16 * const(size.yscale)

[State 3412, Bind Fix]
type = posset
trigger1 = pos y > 40 && animelemtime(2) < 0
y = 40

[State 3412, Bind Fix]
type = posset
trigger1 = pos y > 40 && animelemtime(3) = 0
y = 40

[State 3412, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.75

[State 3412, Accel]
type = veladd
trigger1 = vel x < 0
trigger1 = animelemtime(4) >= 0
x = 0.1

[State 3412, Vel]
type = velset
trigger1 = vel x > 0
x = 0

[State 3412, Vel]
type = velset
trigger1 = animelem = 4
x = -4
y = -9

[State 3412, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 0
channel = 0

[State 3412, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 3412, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 3412
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
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
ground.hittime = 1 + 48
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -3, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -3, -12
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 42), map(sparky) := -26
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3412, P2 State]
type = targetstate
trigger1 = movehit && numtarget(3412)
trigger1 = (target(3412), stateno = 5000) || (target(3412), stateno = 5010) || (target(3412), stateno = 5020)
value = 3435
ID = 3412
ignorehitpause = 1

[State 3412, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3413


;----- Land -----
[Statedef 3413]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3413
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3413, Pos]
type = posset
trigger1 = 1
y = 0

[State 3413, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3413, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3413, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Slide -----
[Statedef 3420]
type = S
physics = N
movetype = A
anim = 3420
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3420, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 101

[State 3420, Dust]
type = explod
trigger1 = animelem = 6
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3420, Sound]
type = playsnd
trigger1 = animelem = 6
value = 4, 2
channel = 0

[State 3420, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = C
physics = N

[State 3420, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0 && vel x > 0
x = -0.33

[State 3420, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3420, Vel]
type = velset
trigger1 = !time
x = 6

[State 3420, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, HA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 90, 23
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -3.0, -5.66
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -3.0, -5.66
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 76), map(sparky) := -6
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3420, Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State 3420, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Bound -----
[Statedef 3430]
type = S
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 3430, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 3430, Pos]
type = posset
trigger1 = !time
y = 0

[State 3430, End]
type = selfstate
trigger1 = time >= 60
value = 0
ctrl = 1


;----- Target Slammed -----
[Statedef 3435]
type = A
physics = N
movetype = H
velset = 0, 0

[State 3435, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 3435, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = pos y < 0
value = 5030

[State 3435, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 3436


[Statedef 3436]
type = L
physics = N
movetype = H
velset = 0, 0

[State 3436, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 3436, Pos]
type = posset
trigger1 = 1
y = 0

[State 3436, FX]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3436, FX]
type = playsnd
trigger1 = !time
value = F 7, 1

[State 3436, FX]
type = explod
trigger1 = !time
anim = F 61
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -3

[State 3436, End]
type = changestate
trigger1 = !animtime
value = 3437


[Statedef 3437]
type = L
physics = N
movetype = H

[State 3437, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)

[State 3437, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 3437, Vel]
type = velset
trigger1 = !time
x = -4.5
y = -4.5

[State 3437, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 3437, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;========================<MAX SNIPING HEEL>=============================
[Statedef 3450]
type = S
physics = S
movetype = A
anim = 3450
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

[State Pos Y]
type = posset
trigger1 = !time
y = 0

[State 3450, Erase Inputs]
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

[State 3450, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3450, NHB]
type = nothitby
trigger1 = 1
time = 8
value = SCA

[State 3450, Sound]
type = playsnd
trigger1 = time = 4
value = 6, 3
channel = 0

[State 3450, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 4
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-34 * const(size.xscale)), ceil(-73 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3450, Superpause]
type = superpause
trigger1 = time = 4
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-34 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3450, End]
type = changestate
trigger1 = !animtime
value = 3451


;----- Dashing -----
[Statedef 3451]
type = S
physics = N
movetype = A
anim = 3451
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3451, Vel]
type = velset
trigger1 = 1
x = 8.25

[State 3451, Sound]
type = playsnd
trigger1 = !time
value = 0, 100

[State 3451, Steps]
type = playsnd
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 3451, Dust]
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

[State 3451, Hop]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "/x" || command = "/y" || command = "/z"
trigger2 = AIlevel
trigger2 = p2bodydist x <= 104
trigger2 = p2stateno != [120, 155] || p2statetype != S
value = 3460

[State 3451, Slide]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "/a" || command = "/b" || command = "/c"
trigger2 = AIlevel
trigger2 = numenemy && p2bodydist x <= 160
trigger2 = p2stateno = [120, 155] && p2statetype = S
value = 3470

[State 3451, End]
type = changestate
trigger1 = time >= 48
trigger2 = time >= 8
trigger2 = frontedgebodydist <= 0
value = 3452


;----- Miss -----
[Statedef 3452]
type = S
physics = N
movetype = I
anim = 3452
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3452, Sound]
type = playsnd
trigger1 = !time
value = 0, 101

[State 3452, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3452, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Hop -----
[Statedef 3460]
type = S
physics = N
movetype = A
anim = 3410
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3460, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 3460, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.33

[State 3460, Vel]
type = velset
trigger1 = animelem = 2
x = 6
y = -4

[State 3460, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 4
channel = 0

[State 3460, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 3
channel = 0

[State 3460, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 9
value = 1, 5
;channel = 1
stopongethit = 1

[State 3460, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 41

[State 3460, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3460, Hit]
type = hitdef
trigger1 = animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 73), map(sparky) := -46
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
guard.kill = 1

[State 3460, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
ID = 3450
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 67), map(sparky) := -73
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
guard.kill = 1

[State 3460, Juggle Reset]
type = mapset
trigger1 = !map(jugglereset)
trigger1 = map(juggle_count)
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = animelemtime(10) >= 0
trigger1 = 1 || map(jugglereset) := 1
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 3460, P1 State]
type = changestate
trigger1 = animelemtime(10) >= 0
trigger1 = movehit = 1 && numtarget(3450)
trigger1 = (target(3450), statetype = S || target(3450), statetype = C) && !(target(3450), hitshakeover)
value = 3462
ignorehitpause = 1

[State 3460, Idle]
type = statetypeset
trigger1 = animelemtime(11) >= 0
movetype = I
persistent = 0

[State 3460, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3411


;----- Grab -----
[Statedef 3462]
type = A
physics = N
movetype = A
anim = 3462
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3462, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 3430

[State 3462, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 3462, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3462, Bind 1]
type = bindtotarget
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = (-8 * const(size.xscale)), 56, Head

[State 3462, Pos]
type = posadd
trigger1 = animelem = 3
x = -56 * const(size.xscale)
y = -16 * const(size.yscale)

[State 3462, Bind Fix]
type = posset
trigger1 = pos y > 40 && animelemtime(2) < 0
y = 40

[State 3462, Bind Fix]
type = posset
trigger1 = pos y > 40 && animelemtime(3) = 0
y = 40

[State 3462, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.75

[State 3462, Accel]
type = velmul
trigger1 = vel x
x = 0.92

[State 3462, Vel]
type = velset
trigger1 = animelem = 4
x = 3
y = -12

[State 3462, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 0
channel = 0

[State 3462, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 7
channel = 0

[State 3462, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 3462, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 3450
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
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
ground.hittime = 1 + 48
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -3, -12
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 42), map(sparky) := -26
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
guard.kill = 1

[State 3462, End]
type = changestate
trigger1 = !animtime
value = 3463

[State 3462, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3464


;----- Spinning -----
[Statedef 3463]
type = A
physics = N
movetype = A
anim = 3463
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3463, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3463, Accel]
type = veladd
trigger1 = 1
y = 0.75

[State 3463, Accel]
type = veladd
trigger1 = vel x > 0 && time
x = -0.125

[State 3463, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3463, Sound]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0

[State 3463, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 5
;channel = 1
stopongethit = 1

[State 3463, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 6)
ID = 3463
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 10, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 3, 8
guard.pausetime = 3, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -1.33, -6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 10), map(sparky) := -8
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3463, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = ifelse(numtarget(3463), 3465, 3464)


;----- Land -----
[Statedef 3464]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3413
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3464, Pos]
type = posset
trigger1 = 1
y = 0

[State 3464, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3464, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3464, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Slam -----
[Statedef 3465]
type = A
physics = N
movetype = A
anim = 3465
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3465, Pos]
type = posset
trigger1 = 1
y = 0

[State 3465, Throw only one]
type = targetdrop
trigger1 = !time
trigger1 = numtarget >= 2
excludeID = 3463
keepone = 1

[State 3465, Throw]
type = targetfacing
trigger1 = time <= 3
value = -1

[State 3465, Bind 1]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 0, 0

[State 3465, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(-40 * map(damagescaling))
dizzy = 0
kill = 1

[State 3465, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 40; givepower

[State 3465, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 3465, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 3480

[State 3465, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

;[State 3465, Spark]
;in ZSS

[State 3465, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 0, 5100

[State 3465, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

freq = 120

[State 3465, Dust]
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

[State 3465, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
sprpriority = -10
ownpal = 1

[State 3465, Sound]
type = playsnd
trigger1 = !numtarget && !time
value = 0, 52

[State 3465, Dust]
type = explod
trigger1 = !numtarget && !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3465, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 3465, Vel]
type = velset
trigger1 = animelem = 2
x = -6

[State 3465, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 3465, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Slide -----
[Statedef 3470]
type = S
physics = N
movetype = A
anim = 3470
ctrl = 0
sprpriority = 2
movehitpersist = 1

[State 3470, Sound]
type = playsnd
trigger1 = animelem = 6
value = 0, 101

[State 3470, Dust]
type = explod
trigger1 = animelem = 6
anim = 8104
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3470, Sound]
type = playsnd
trigger1 = animelem = 6
value = 4, 2
channel = 0

[State 3470, Sound]
type = playsnd
trigger1 = animelem = 11
value = 4, 1
channel = 0

[State 3470, Sound]
type = playsnd
trigger1 = animelem = 12
value = 1, 2
;channel = 1
stopongethit = 1

[State 3470, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = C
physics = N

[State 3470, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0 && vel x > 0
x = -0.33

[State 3470, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3470, Vel]
type = velset
trigger1 = !time
x = 6

[State 3470, Hit]
type = hitdef
trigger1 = animelemtime(8) < 1
trigger1 = animelemtime(7) = 0 || animelemtime(7) = 3 || animelemtime(7) = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, HA
hitflag = MAF
guardflag = L
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
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -4.0, -7.49
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 76), map(sparky) := -6
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3470, Hit]
type = hitdef
trigger1 = animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.50, -7.50
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.32, -7.24
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -80
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3470, Idle]
type = statetypeset
trigger1 = animelemtime(15) >= 0
movetype = I
persistent = 0

[State 3470, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Stomped -----
[Statedef 3480]
type = L
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 3480, Anim]
type = changeanim
trigger1 = !time
value = 5080

[State 3480, Pos]
type = posset
trigger1 = 1
y = 0

[State 3480, End]
type = changestate
trigger1 = time >= 20
value = 3481


[Statedef 3481]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3481, Anim]
type = changeanim
trigger1 = !time
value = 5110

[State 3481, End]
type = selfstate
trigger1 = time >= 30
value = ifelse(!alive, 5150, 5120)
