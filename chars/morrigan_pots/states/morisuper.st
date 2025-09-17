; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<SOUL PHOENIX>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
poweradd = -1000 + 0 * (map(superlevel) := 1)
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3000, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3000, Button AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-68 * const(size.xscale)), ceil(-63 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-68 * const(size.xscale)), ceil(-63 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(5) < -1
attr = SCA
slot = 0
time = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(5) < 1
attr = , AP
slot = 1
time = 1

[State 3000, Width]
type = width
trigger1 = animelemtime(2) >= -1
trigger1 = animelemtime(12) < 0
edge = 0, ceil(32 * const(size.xscale))

[State 3000, FX]
type = explod
trigger1 = animelem = 3
anim = 3004
ID = 3004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3000, Dust]
type = explod
trigger1 = animelem = 5
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = ceil(-15 * const(size.xscale)), 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3000, Soul Phoenix]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "Soul Phoenix"
postype = p1
pos = ceil(12 * const(size.xscale)), -50
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 3000, Dome]
type = explod
trigger1 = animelem = 5
anim = 3003
ID = 3003
sprpriority = 3
postype = p1
pos = -30 * const(size.xscale), 0
scale = 0.5, 0.5
bindtime = -1
removeongethit = 1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 17
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 13

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MID-AIR SOUL PHOENIX>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
poweradd = -1000 + 0 * (map(superlevel) := 1)
sprpriority = 2
facep2 = p2dist x <= -const(size.ground.back)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3050, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3050, Button AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 3050, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3050, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-16 * const(size.xscale)), ceil(-90 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-13 * const(size.xscale)), ceil(-85 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
attr = SCA
slot = 0
time = 1

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(6) < 1
attr = , AP
slot = 1
time = 1

[State 3050, Width]
type = width
trigger1 = animelem = 4
value = ceil(24 * const(size.xscale)), 0

[State 3050, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
pausemovetime = -1
supermovetime = -1
removeongethit = 1
ownpal = 1

[State 3050, Soul Phoenix]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 3055
ID = 3055
name = "Soul Phoenix"
postype = p1
pos = ceil(60 * const(size.xscale)), -48
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 3050, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.5

[State 3050, Vel]
type = velset
trigger1 = animelem = 6
x = -1.5
y = -7.5

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
physics = N

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 17
channel = 0

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 13

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1053


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


;======================<CARDINAL BLADE>=============================
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3100, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3100, Button AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 0
channel = 0

[State 3100, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-25 * const(size.xscale)), ceil(-35 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-25 * const(size.xscale)), ceil(-35 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100
trigger1 = animelemtime(3) < 0
value = SCA
time = 1

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
value = A
time = 1

[State 3100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 3100, Accel]
type = veladd
trigger1 = anim = 3100
trigger1 = animelemtime(8) >= 1
trigger2 = anim = 1101
y = 0.67

[State 3100, Vel]
type = velset
trigger1 = anim = 3100
trigger1 = animelemtime(8) = 1
x = ifelse(map(strength) = 2, 10.2, ifelse(map(strength) = 1, 7.65, 5.10))
y = -11.76

[State 3100, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 1110, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelem = 4
value = 1, 9
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelemtime(8) = 1
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = anim = 3100
trigger1 = animelemtime(8) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelem = 3
value = 4, 16
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, Hit]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 2 || animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Back
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 50), map(sparky) := ifelse((animelem = 2), -35, -60)
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -7.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -7.0
down.hittime = 20
down.velocity = 0, 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 1
fall.animtype = Medium
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850

[State 3100, Hit 2]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = ifelse((animelem = 11), 12, 4), ifelse((animelem = 11), 12, 4)
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 50), map(sparky) := -100
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4 * !numhelper(775), -7.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -4 * !numhelper(775), -7.0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3100
trigger1 = animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100
trigger1 = animelemtime(11) >= 2 && vel y > -1
value = 1101

[State 3100, Pos Fix]
type = posadd
trigger1 = anim = 1101
x = 24 * const(size.xscale)
y = -24
persistent = 0

[State 3100, Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1109


;======================<FINISHING SHOWER>=============================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
poweradd = -2000 + 0 * (map(superlevel) := 2)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 3300, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 0
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-43 * const(size.xscale)), ceil(-68 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-43 * const(size.xscale)), ceil(-68 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 3300, NHB]
type = nothitby
trigger1 = time <= 43
time = 1
value = SCA

[State 3300, Accel]
type = veladd
trigger1 = time >= 43
y = 0.004

[State 3300, Vel]
type = velset
trigger1 = time = 43
x = -0.35
y = -0.35

[State 3300, Sound]
type = playsnd
trigger1 = time = 43
value = 5, 10
channel = 5

[State 3300, Dust]
type = helper
trigger1 = time = 43
helpertype = normal
stateno = 3303
ID = 3303
name = "Finishing Shower Dust"
postype = p1
pos = 0, -pos y
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
persistent = 0
supermovetime = 9999

[State 3300, Sound]
type = playsnd
trigger1 = time = 60
value = 4, 3
channel = 0

[State 3300, Bullets]
type = helper
trigger1 = !(time % 6)
trigger1 = time >= 60
helpertype = normal; projectile
stateno = 3305
ID = 3305
name = "Bullet"
postype = p1
ownpal = 0

[State 3305, Sound]
type = playsnd
trigger1 = time >= 68
trigger1 = !((time - 68) % 11)
value = 5, 6
channel = 5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3301


;---Land---
[Statedef 3301]
type = S
physics = S
movetype = I
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3301, Pos]
type = posset
trigger1 = 1
y = 0

[State 3301, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3301, Dust]
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

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<VALKYRIE TURN>=============================
[Statedef 3400]
type = A
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
poweradd = -1000 + 0 * (map(superlevel) := 1)
sprpriority = 2
facep2 = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 3400, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-39 * const(size.xscale)), ceil(-70 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-39 * const(size.xscale)), ceil(-70 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3400, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3500, No point guarding]
type = attackdist
trigger1 = 1
value = 0

[State 3400, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3400, Bound]
type = screenbound
triggerall = time > 43
trigger1 = facing = 1
trigger1 = pos x > 0
trigger2 = facing = -1
trigger2 = pos x < 0
value = 0
movecamera = 0, 1

[State 3400, Pos]
type = posset
trigger1 = pos y >= 0
y = 0

[State 3400, Vel]
type = veladd
trigger1 = time >= 43
x = 2
y = 0

[State 3400, Vel]
type = velset
trigger1 = time = 43
x = 0
y = 0

[State 3400, Sound]
type = playsnd
trigger1 = time = 43
value = 4, 14
channel = 0

[State 3400, Jet]
type = helper
trigger1 = time = 43
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1
supermovetime = cond(numenemy, (p2, pausetime), 60)

[State 3400, Jet]
type = helper
trigger1 = time >= 43 && !numhelper(6028)
helpertype = normal
stateno = 6028
ID = 6028
name = "Jet Trail"
postype = p1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
supermovetime = cond(numenemy, (p2, pausetime), 60)

[State 3400, Particles]
type = explod
trigger1 = time >= 43
trigger1 = numhelper(6020)
vel = -1 + (random / 1000.0), 0
accel = 0, 0.05
anim = 3407
sprpriority = 3
postype = p1
pos = ceil(-45 * const(size.xscale)), -70
random = 20, 20
scale = 0.5, 0.5
supermovetime = -1

[State 3400, End]
type = changestate
trigger1 = time > 43
trigger1 = frontedgedist <= -60
trigger2 = time >= 120
value = 3401


;----- RETURN -----
[Statedef 3401]
type = A
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3401, Turn]
type = turn
trigger1 = !time

[State 3401, NHB]
type = nothitby
trigger1 = backedgedist < 0
time = 1
value = SCA

[State 3401, Push]
type = playerpush
trigger1 = anim = 3400
value = 0

[State 3401, Bound]
type = screenbound
trigger1 = facing = 1 && pos x < 0
trigger2 = facing = -1 && pos x > 0
value = 0
movecamera = 0, 1

[State 3401, Pos]
type = posset
trigger1 = !time
y = 0

State 3401, Pos]
type = posset
trigger1 = time <= 10
x = (-((gamewidth / 2.0) + 40) -50 * sin(time / 3.33)) * facing

[State 3401, Vel]
type = velset
trigger1 = !time
trigger1 = !AIlevel
y = ifelse(command = "holdup", -10, ifelse(command = "holddown", -2, -6))

[State 3401, Vel]
type = velset
trigger1 = !time
trigger1 = AIlevel
y = ifelse(p2dist y <= -90, -10, ifelse(p2dist y <= -30, -6, -2))

[State 3401, Vel]
type = velset
trigger1 = time = 10
x = 6
y = -1.5

[State 3401, Accel]
type = veladd
trigger1 = time >= 10
y = 0.15

[State 3401, Anim]
type = changeanim
triggerall = time >= 10
triggerall = anim != 3402 && anim != 49
trigger1 = !AIlevel
trigger1 = command = "/x" || command = "/y" || command = "/z" || command = "/a" || command = "/b" || command = "/c"
trigger2 = AIlevel
trigger2 = p2bodydist x < 50
value = 3402

[State 3401, Drill FX]
type = helper
trigger1 = anim = 3402 && animelemtime(3) >= 0 && !numhelper(3405)
helpertype = normal
stateno = 3405
ID = 3405
name = "Drill FX"
postype = p1
pos = ceil(76 * const(size.xscale)), -43
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3401, Hit]
type = hitdef
trigger1 = anim = 3402
trigger1 = !((movecontact + movereversed) % 3)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 13)
attr = A, HA
damage = ifelse((movecontact || movereversed), 10, 120), ifelse((movecontact || movereversed), 3, 30)
dizzypoints = 0
animtype = Hard
air.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 6, 12
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 75), map(sparky) := -43
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2 * !numhelper(775), -3
air.fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3403


;---Land---
[Statedef 3403]
type = S
physics = S
movetype = I
anim = 3403
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3403, Pos]
type = posset
trigger1 = 1
y = 0

[State 3403, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3403, Dust]
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

[State 3403, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<DARKNESS ILLUSION>=============================
[Statedef 4000]
type = A
physics = N
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000 + 0 * (map(superlevel) := 3)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 4000, Erase Inputs]
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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 4000, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 10
channel = 0

[State 4000, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(20 * const(size.xscale)), ceil(-73 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4000, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(20 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4000, NHB]
type = nothitby
trigger1 = time <= 48
time = 1
value = SCA
ignorehitpause = 1

[State 4000, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = 7.5

[State 4000, Jet]
type = helper
trigger1 = animelemtime(4) >= 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 4000, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 20, 0

[State 4000, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 4000
attr = S, HA
damage = 0, 0
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 15) * (map(sparkx.max) := 30), map(sparky) := -60
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -7.51
air.type = Low
air.velocity = -5 * !numhelper(775), -5
getpower = 0, 0
givepower = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 0
air.fall = 1
p1sprpriority = sprpriority
forcestand = 1
kill = 0
yaccel = 0.4850

[State 4000, Super Pause Away]
type = superpause
trigger1 = movehit = 1
time = 0
anim = -1
p2defmul = 1

[State 4000, Drop Others]
type = targetdrop
trigger1 = movehit
trigger1 = numtarget > 1
trigger1 = numtarget(4000)
excludeID = 4000
ignorehitpause = 1

[State 4000, P2 State]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(4000)
trigger1 = target(4000), stateno = 5000 || target(4000), stateno = 5010 || target(4000), stateno = 5020
ID = 4000
value = 1114010

[State 4000, P1 State]
type = changestate
trigger1 = movehit
value = 4010

[State 4000, Guarded]
type = changestate
trigger1 = animelemtime(4) >= 1
trigger1 = moveguarded || movereversed
value = 4002

[State 4000, End]
type = changestate
trigger1 = time >= 83
value = 4001


;---Land---
[Statedef 4001]
type = S
physics = S
movetype = I
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 4001, Pos]
type = posset
trigger1 = 1
y = 0

[State 4001, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 52

[State 4001, Dust]
type = explod
trigger1 = animelem = 2
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 4010]
type = S
physics = N
movetype = A
anim = 4010
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4010 Snd]
type = playsnd
trigger1 = !time
value = 5, 11

[State 4010, Double]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4015
ID = 4015
name = "Darkness Illusion"
postype = p1
persistent = 0

[State 4010, Push]
type = playerpush
trigger1 = anim = 4010
trigger2 = anim = 4011 && animelemtime(32) < 0
value = 0

[State 4010, NHB]
type = nothitby
trigger1 = 1
value = , AP
time = 1
ignorehitpause = 1

[State 4010, Guarded]
type = changestate
trigger1 = time >= 36
trigger1 = (moveguarded = 1 || movereversed = 1) && movehit != 1
trigger2 = anim = 4011
trigger2 = animelemtime(4) > 0 && animelemtime(32) < 0
trigger2 = (movecontact + movereversed) != [1, 24]
value = 4002

[State 4010, Bind]
type = targetbind
trigger1 = anim = 4010
trigger1 = animelemtime(48) < 0
trigger1 = movehit >= (moveguarded + movereversed)
trigger1 = numtarget
trigger1 = target, stateno = [5000, 5050] || target, stateno = 1114010
pos = 80 * const(size.xscale), 0
ignorehitpause = 1

[State 4010, Bind]
type = targetbind
trigger1 = movehit = 1
trigger1 = anim = 4011
trigger1 = animelemtime(32) < 0
trigger1 = numtarget
trigger1 = target, stateno = [5000, 5050]
pos = 80 * const(size.xscale), -55 -(target, const(size.mid.pos.y))
ignorehitpause = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && animelem = 47
value = 3, 0

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4011 && animelem = 30
value = 4, 6

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && (animelem = 8 || animelem = 14)
trigger2 = anim = 4011 && animelem = 9
value = 1, 2
;channel = 1
stopongethit = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && animelem = 18
value = 1, 3
;channel = 1
stopongethit = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && animelem = 11
trigger2 = anim = 4011 && animelem = 4
value = 1, 5
;channel = 1
stopongethit = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && (animelem = 27 || animelem = 36)
trigger2 = anim = 4011 && (animelem = 15 || animelem = 24)
;channel = 1
stopongethit = 1
value = 1, 6

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4011 && animelem = 20
;channel = 1
stopongethit = 1
value = 1, 8

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4011 && animelem = 20
value = 5, 5
;channel = 1
stopongethit = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && (animelem = 47)
trigger2 = anim = 4011 && (animelem = 31)
value = 1, 9
;channel = 1
stopongethit = 1

[State 4010, Hit High Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 8 || animelem = 14 || animelem = 19 || animelem = 36 || animelem = 37
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 25, 6
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, ifelse((animelem = 8 || animelem = 14), 2, ifelse((animelem = 19), 3, 6))
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
kill = ifelse((animelem = 8), 0, (numtarget != numenemy))
yaccel = 0.4850

[State 4010, Hit Low Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 11 || animelem = 28 || animelem = 38 || animelem = 39
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 25, 6
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, ifelse((animelem = 11), 5, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, ifelse((animelem = 39), -3, -1.5)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
kill = (numtarget != numenemy)
yaccel = 0.4850

[State 4010, Hit Up Ground]
type = hitdef
trigger1 = anim = 4010 && animelem = 48
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 25, 6
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, -13.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -12
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 4010, Hit Midair]
type = hitdef
trigger1 = anim = 4011
trigger1 = animelem = 4 || animelem = 9 || animelem = 15 || animelem = 20 || animelem = 25
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = A, HA
damage = 25, 6
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, ifelse((animelem = 4), 5, ifelse((animelem = 9 || animelem = 20), 3, 6))
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, -5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, ifelse((animelem = 25), -4, -2.5)
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
kill = (numtarget != numenemy)
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 4010, Hit Final]
type = hitdef
trigger1 = anim = 4011 && animelem = 32
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = A, HA
damage = 45, 11
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, 4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Trip
air.velocity = 0, 9
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 4010, Vel]
type = velset
trigger1 = anim = 4010 && animelem = 56
y = -9

[State 4010, Jet]
type = helper
trigger1 = anim = 4010 && animelemtime(56) >= 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 4010, Sound]
type = playsnd
trigger1 = anim = 4010 && animelem = 56
value = 0, 41

[State 4010, Dust]
type = helper
trigger1 = anim = 4010 && animelem = 56
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4010, FX]
type = explod
trigger1 = anim = 4010 && animelem = 46
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-10 * const(size.xscale)), -60
scale = 0.75, 0.75
removeongethit = 1
ownpal = 1

[State 4010, FX]
type = explod
trigger1 = anim = 4011 && animelem = 31
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-10 * const(size.xscale)), -60
scale = 0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4010, Anim]
type = changeanim
triggerall = anim = 4010 && animelemtime(56) >= 0
trigger1 = numtarget
trigger1 = pos y <= -60 && (pos y -(target, pos y) = [-50, 50])
trigger2 = time > 180
value = 4011

[State 4010, Vel]
type = velmul
trigger1 = anim = 4011
trigger1 = animelemtime(3) < 0
y = 0.75

[State 4010, Vel]
type = velset
trigger1 = anim = 4011
trigger1 = animelemtime(3) >= 0 && animelemtime(33) < 0
y = ifelse(pos y <= -20, 0.1, 0)

[State 4010, Type]
type = statetypeset
trigger1 = anim = 4010
trigger1 = animelemtime(56) < 0
statetype = S
physics = S

[State 4010, Type]
type = statetypeset
trigger1 = anim = 4010
trigger1 = animelemtime(56) >= 0
trigger2 = anim = 4011
trigger2 = animelemtime(33) < 0
statetype = A
physics = N

[State 4010, Vel]
type = velset
trigger1 = anim = 4011
trigger1 = animelem = 33
x = -2

[State 4010, Type]
type = statetypeset
trigger1 = anim = 4011
trigger1 = animelem = 33
statetype = A
physics = A


;----- DIZZY TARGET -----
[Statedef 1114010]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1114010, Anim]
type = changeanim
trigger1 = !time
value = 5300

[State 1114010, Pos]
type = posset
trigger1 = !time
y = 0

[State 1114010, fall]
type = hitfallset
trigger1 = 1
value = 0

[State Safety]
type = selfstate
trigger1 = time >= 60
value = 0
ctrl = 1


;----- Target dropped -----
[Statedef 4012]
type = A
physics = N
movetype = I
anim = 4012
ctrl = 0

[State 4012, Vel]
type = velmul
trigger1 = 1
x = 0.92

[State 4012, Accel]
type = veladd
trigger1 = time
y = 0.512

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4003


;----- JUMP BACK -----
[Statedef 4002]
type = A
physics = N
movetype = I
anim = 43
ctrl = 0
velset = 0, 0

[State 4002, Accel]
type = veladd
trigger1 = 1
y = 0.512

[State 4002, Vel]
type = velset
trigger1 = !time
x = -1.61
y = -8.45

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4003


;---Land---
[Statedef 4003]
type = S
physics = S
movetype = I
anim = 4003
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 4003, Pos]
type = posset
trigger1 = 1
y = 0

[State 4003, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4003, Dust]
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

[State 4003, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR DARKNESS ILLUSION>=============================
[Statedef 4050]
type = A
physics = N
movetype = A
anim = 4050
ctrl = 0
velset = 0, 0
poweradd = -2000 + 0 * (map(superlevel) := 2)
facep2 = 0
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 4050, Erase Inputs]
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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 4050, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 10
channel = 0

[State 4050, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(20 * const(size.xscale)), ceil(-73 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4050, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(20 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 4050, NHB]
type = nothitby
trigger1 = time <= 46
time = 1
value = SCA
ignorehitpause = 1

[State 4050, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = 6.75

[State 4050, Jet]
type = helper
trigger1 = animelemtime(4) >= 0
trigger1 = !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 4050, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 20, 0

[State 4050, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 4050
attr = A, HA
damage = 0, 0
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 15) * (map(sparkx.max) := 30), map(sparky) := -60
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -5 * !numhelper(775), -5
getpower = 0, 0
givepower = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 0
air.fall = 1
p1sprpriority = sprpriority
forcestand = 1
kill = 0
yaccel = 0.4850

[State 4050, Super Pause Away]
type = superpause
trigger1 = movehit = 1
time = 0
anim = -1
p2defmul = 1

[State 4050, Drop Others]
type = targetdrop
trigger1 = movehit
trigger1 = numtarget > 1
trigger1 = numtarget(4050)
excludeID = 4050
ignorehitpause = 1

[State 4050, P2 State]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(4050)
trigger1 = target(4050), stateno = 5000 || target(4050), stateno = 5010 || target(4050), stateno = 5020
value = 1114060

[State 4050, P1 State]
type = changestate
trigger1 = movehit
value = 4060

[State 4050, Guarded]
type = changestate
trigger1 = animelemtime(4) >= 1
trigger1 = moveguarded || movereversed
value = 4002
ignorehitpause = 1

[State 4050, End]
type = changestate
trigger1 = time >= 60
value = 4012


;----- PLAYER -----
[Statedef 4060]
type = A
physics = N
movetype = A
anim = 4060
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4060 Snd]
type = playsnd
trigger1 = !time
value = 5, 11

[State 4060, Double]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4065
ID = 4065
name = "Darkness Illusion"
postype = p1

[State 4060, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4060, NHB]
type = nothitby
trigger1 = 1
value = , AP
time = 1
ignorehitpause = 1

[State 4060, Guarded]
type = changestate
trigger1 = moveguarded
trigger2 = time >= 36
trigger2 = !(movehit + movereversed)
value = 4002

[State 4060, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) < 0
trigger1 = (moveguarded + movereversed) <= movehit
trigger1 = target, stateno = 1114060
pos = 64 * const(size.xscale), -75 - target, const(size.mid.pos.y)
ignorehitpause = 1

[State 4060, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(30) < 0
trigger1 = (moveguarded + movereversed) <= movehit
trigger1 = target, stateno = [5000, 5050]
pos = 64 * const(size.xscale), -75 - target, const(size.mid.pos.y)
ID = 4060
ignorehitpause = 1

[State 4060, Bind]
type = targetvelset
trigger1 = animelemtime(30) < 0
trigger1 = numtarget
trigger1 = target, stateno = [5000, 5050]
ID = 4060
x = 0
y = 0
ignorehitpause = 1

[State 4060, Sound]
type = playsnd
trigger1 = animelem = 10
value = 4, 3
channel = 0

[State 4060, Sound]
type = playsnd
trigger1 = anim = 4060 && animelem = 47
value = 3, 0

[State 4060, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 9 || animelem = 16
value = 1, 2
;channel = 1
stopongethit = 1

[State 4060, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 12 || animelem = 20
value = 1, 5
;channel = 1
stopongethit = 1

[State 4060, Sound]
type = playsnd
trigger1 = animelem = 29
value = 3, 5
channel = 0

[State 4060, Sound]
type = playsnd
trigger1 = animelem = 29
value = 1, 9
;channel = 1
stopongethit = 1

[State 4060, Hit High]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 20 || animelem = 22
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, ifelse((animelem = 7), 3, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, -1.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
kill = ifelse((animelem = 7), 0, (numtarget != numenemy))
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850

[State 4060, Hit Low]
type = hitdef
trigger1 = animelem = 3 || animelem = 10 || animelem = 17 || animelem = 21 || animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, ifelse((animelem = 10 || animelem = 17), 3, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, -1.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
kill = (numtarget != numenemy)
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850

[State 4060, Hit Final]
type = hitdef
trigger1 = animelem = 30
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -60
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, 10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, 10
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall.xvelocity = 0
fall.yvelocity = -4

[State 4060, Type]
type = veladd
trigger1 = animelemtime(33) >= 0
y = 0.5

[State 4060, Vel]
type = velset
trigger1 = animelem = 33
x = -2.0
y = -6

[State 4060, FX]
type = explod
trigger1 = animelem = 29
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-10 * const(size.xscale)), -60
scale = 0.75, -0.75
removeongethit = 1
ownpal = 1

[State 4060, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- Lock target -----
[Statedef 1114060]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1114060, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 1114060, fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1114060, Safety]
type = selfstate
trigger1 = time >= 40
value = 5030


;======================<ETERNAL SLUMBER>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
poweradd = -3000 + 0 * (map(superlevel) := 3)
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 4100, Erase Inputs]
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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
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

[State 4100, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-22 * const(size.xscale)), ceil(-82 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4100, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(-22 * const(size.xscale)), ceil(-82 * const(size.yscale))
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 1
time = 1
value = SCA

[State 4100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 8

[State 4100, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 4100, Heart]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 4105
ID = 4105
name = "Eternal Slumber"
postype = p1
pos = ceil(33 * const(size.xscale)), -74
size.xscale = 0.75
size.yscale = 0.75
size.ground.back = 8
size.ground.front = 8
ownpal = 1

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(20 * const(size.xscale)), -71
sprpriority = 0

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(28 * const(size.xscale)), -44
sprpriority = 0

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(-11 * const(size.xscale)), -18
sprpriority = 2

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = 1, -19
sprpriority = 2

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(11 * const(size.xscale)), -17
sprpriority = 2

[State 4100, Bat Explods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(-26 * const(size.xscale)), -37
sprpriority = 2

[State 4100, Bat Explods]
type = modifyexplod
trigger1 = numexplod(4100)
ID = 4100
bindtime = -1
removetime = -1
removeongethit = 1
supermovetime = 47

[State 4100, Wait]
type = changeanim
trigger1 = numhelper(4105)
trigger1 = animelemtime(8) >= 0
trigger1 = helper(4105), stateno = 4105
value = 4100
elem = 8

[State 4100, Drop Others]
type = targetdrop
trigger1 = numtarget > 1
trigger1 = numtarget(4105)
excludeID = 4105

[State 4100, Throw]
type = targetstate
trigger1 = numtarget(4105)
trigger1 = animelemtime(5) >= 0
value = 4120
ID = 4105
persistent = 0

[State 4100, Success]
type = changestate
trigger1 = numhelper(4105)
trigger1 = animelemtime(5) >= 0
trigger1 = numtarget(4105)
trigger1 = target(4105), stateno = 4120
value = 4110

[State 4100, Miss]
type = changestate
trigger1 = !animtime
value = 4103


;--- MISS ---
[Statedef 4103]
type = S
physics = S
movetype = I
anim = 4103
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4103, Pos]
type = posset
trigger1 = 1
y = 0

[State 4100, Bat Explods]
type = removeexplod
trigger1 = numexplod(4100)
ID = 4100

[State 4100, Sound]
type = playsnd
trigger1 = !time
value = 4, 9
channel = 0

[State 4103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 4110]
type = A
physics = N
movetype = A
anim = 4110
ctrl = 0
velset = 0, 0
sprpriority = 2

;[State 4110, zoom]
;type = zoom
;trigger1 = animelemtime(2) >= 0
;scale = gamewidth / 320.0
;pos = 0, 0
;stagebound = 1
;camerabound = 0
;ignorehitpause = 1

[State 4110, Bat Explods]
type = removeexplod
trigger1 = animelemtime(2) >= 0
trigger1 = numexplod(4100)
ID = 4100

[State 4110, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4110, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4110, Image Off]
type = afterimagetime
trigger1 = animelemtime(2) >= 0
time = 0

; Moved to ZSS
;[State 4110, Sprite Priority]
;type = sprpriority
;trigger1 = animelem = 2
;trigger1 = numhelper(4190)
;value = helper(4190), sprpriority + 1

[State 4110, Shadow]
type = assertspecial
trigger1 = animelemtime(2) >= 0
flag = globalnoshadow

[State 4110, Camera]
type = screenbound
trigger1 = animelemtime(12) >= 0 && animelemtime(14) < 0
value = 1
movecamera = 1, 0

[State 4110, Curtain]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4190
ID = 4190
name = "Curtain Back"
postype = p1
facing = 1
ownpal = 1

[State 4110, Curtain]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4190
ID = 4191
name = "Curtain Front"
postype = p1
facing = -1
ownpal = 1

[State 4111, Fade Out]
type = bgpalfx
trigger1 = !time
sinadd = -255, -255, -255, abs(animelemtime(3)) * 4
time = abs(animelemtime(3))

[State 4110, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 15
channel = 0

[State 4110, Sound Piano]
type = playsnd
trigger1 = animelem = 2
value = 5, 9
volumescale = 90

[State 4110, Pos]
type = posset
trigger1 = animelemtime(2) >= 0
x = 0; -20 * facing
y = 0

[State 4110, Pos]
type = posset
trigger1 = numtarget(4105)
trigger1 = animelemtime(12) >= 0 && animelemtime(14) < 0
y = target(4105), const(size.head.pos.y)

; Moved to ZSS
;[State 4110, Palfx]
;type = palfx
;trigger1 = animelemtime(2) >= 0
;time = 1
;add = 9000, 9000, 9000
;mul = 256, 0, 256

[State 4110, Throw]
type = targetfacing
trigger1 = animelem = 2
trigger1 = numtarget(4105)
ID = 4105
value = -1

[State 4107, Bind 2]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
pos = 40 * const(size.xscale), 0 * const(size.yscale)

[State 4107, Bind 4]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(4) >= 0 && animelemtime(6) < 0
pos = 6 * const(size.xscale), -72 * const(size.yscale)

[State 4107, Bind 6]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
pos = 45 * const(size.xscale), -70 * const(size.yscale)

[State 4107, Bind 8]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
pos = 40 * const(size.xscale), 0 * const(size.yscale)

[State 4107, Bind 10]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(10) >= 0 && animelemtime(12) < 0
pos = 11 * const(size.xscale), -44 * const(size.yscale)

[State 4107, Bind 12]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(12) >= 0 && animelemtime(14) < 0
pos = 0, 0

[State 4107, Bind 14]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(14) >= 0 && animelemtime(16) < 0
pos = 6 * const(size.xscale), -104 * const(size.yscale)

[State 4107, Pos Finish]
type = targetbind
trigger1 = numtarget(4105)
trigger1 = animelemtime(16) >= 0
x = 32
y = 0

[State 4107, Damage]
type = targetlifeadd
triggerall = numtarget(4105)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9
trigger2 = animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
value = floor(-25 * map(damagescaling))
dizzy = 0
kill = animelem = 17

[State 4107, Damage]
type = targetdizzypointsadd
trigger1 = numtarget(4105)
trigger1 = animelem = 17
ID = 4105
value = floor(-600 * map(damagescaling))

;[State 4107, Damage]
;type = targetpoweradd
;trigger1 = numtarget(4105)
;trigger1 = animelem = 17
;ID = 4105
;value = floor(-1000 * map(damagescaling))

[State 4107, givepower]
type = targetpoweradd
triggerall = numtarget(4105)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9
trigger2 = animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
ID = 4105
value = 40; givepower

[State 4107, Hit add]
type = hitadd
triggerall = numtarget(4105)
trigger1 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9
trigger2 = animelem = 11 || animelem = 13 || animelem = 15 || animelem = 17
ID = 4105
value = 1

[State 4110, End]
type = changestate
trigger1 = !animtime
value = 4111
ctrl = 1


;----- End -----
[Statedef 4111]
type = S
physics = N
movetype = I
anim = 4111
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4111, Target]
type = targetstate
trigger1 = !animtime
trigger1 = numtarget(4105)
ID = 4105
value = 4121

[State 4111, Sound]
type = playsnd
trigger1 = !time
value = 4, 20
channel = 0

[State 4111, Pos]
type = posset
trigger1 = !time
x = -32 * facing

[State 4111, Bind]
type = targetbind
trigger1 = !time
trigger1 = numtarget(4105)
ID = 4105
pos = 64, 0

[State 4111, Pos]
type = posset
trigger1 = 1
y = 0

[State 4111, Fade In]
type = bgpalfx
trigger1 = !time
add = -255, -255, -255
sinadd = 255, 255, 255, 120
time = 30

[State 4111, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 4120]
type = S
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 4120, Helper]
type = selfstate
trigger1 = ishelper
value = prevstateno

[State 4120, Anim]
type = changeanim2
trigger1 = !time
value = 4120

[State 4120, Camera]
type = screenbound
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(19) < 0
value = 0
movecamera = 0, 0

[State 4120, No Dust]
type = assertspecial
trigger1 = 1
flag = nomakedust

; Moved to ZSS
;[State 4120, Sprite Priority]
;type = sprpriority
;trigger1 = animelem = 2
;value = stateowner, sprpriority

; Moved to ZSS
;[State 4120, Sprite Priority]
;type = sprpriority
;trigger1 = animelem = 18
;value = 0

; Moved to ZSS
;[State 4120, Palfx]
;type = palfx
;trigger1 = animelemtime(2) >= 0
;trigger1 = animelemtime(18) < 0
;time = 2
;add = 9000, 9000, 9000
;mul = 256, 0, 256

[State 4120, Safety]
type = selfstate
trigger1 = time >= 300
value = 5040


[Statedef 4121]
type = L
physics = C
movetype = H
velset = 0, 0
sprpriority = 0

[State 4121, Pos]
type = posset
trigger1 = 1
y = 0

[State 4121, Dizzy Start]
type = dizzyset
trigger1 = alive
trigger1 = life > 0
trigger1 = dizzypoints <= 0
trigger1 = !gethitvar(isbound)
value = 1

[State 4121, End]
type = selfstate
trigger1 = 1
value = ifelse(alive, 5120, 5150)
