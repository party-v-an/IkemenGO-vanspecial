; _______________________________
;| Yuri by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<HAOU SHOUKOU KEN =============================
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
value = ifelse(random < 500, 2, ifelse(random < 666, 1, 0))
ignorehitpause = 1

[State 3000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(6) < -1
time = 1
value = SCA

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 3
channel = 0

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = 13, -65
supermovetime = 255
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = 13, -65
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 3004
ID = 3004
name = "Shoukou Ken FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
supermovetime = 255
ownpal = 1

[State 3000, Width]
type = width
trigger1 = animelem = 5
player = 16

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 3000, Haou Shoukou Ken]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "Haou Shoukou Ken"
postype = p1
pos = 70, -58
size.xscale = 0.4
size.yscale = 0.5
ownpal = 1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 6
value = 7, 2

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HIEN REKKOU>=============================
[Statedef 3100]
type = S
physics = S
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

[State 3100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(11) < 0
time = 1
value = SCA

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 9
channel = 0

[State 3100, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = -28, -66
supermovetime = 255
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = -28, -66
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
value = 5, ifelse((animelem = 28), 1, 2)
channel = 0

[State 3100, Vel]
type = velset
trigger1 = animelem = 8
x = 9

[State 3100, Vel]
type = velset
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
x = ifelse((animelem = 28), 16, 12)
y = ifelse((animelem = 28), -10, ifelse((animelem = 18), -6, -5))

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(12) >= 0 && animelemtime(15) < 0
trigger2 = animelemtime(19) >= 0 && animelemtime(23) < 0
trigger3 = animelemtime(28) >= 0
y = 0.4

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 12
trigger2 = animelem = 19
trigger3 = animelem = 28
statetype = A
physics = N

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 15
trigger2 = animelem = 23
statetype = S
physics = S

[State 3100, Vel]
type = velmul
trigger1 = statetype = A && vel y <= 0
x = 0.85

[State 3100, Vel]
type = velset
trigger1 = animelemtime(28) >= 0 && vel y > 0
x = 0

[State 3100, Freeze Frame]
type = changeanim
trigger1 = animelemtime(14) >= 0
trigger1 = animelemtime(15) < 0
trigger2 = animelemtime(22) >= 0
trigger2 = animelemtime(23) < 0
value = 3100
elem = animelemno(0)

[State 3100, Land]
type = changeanim
trigger1 = animelemtime(12) >= 0 && animelemtime(15) < 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3100
elem = 15

[State 3100, Land]
type = changeanim
trigger1 = animelemtime(19) >= 0 && animelemtime(23) < 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3100
elem = 23

[State 3100, Vel]
type = velset
trigger1 = animelem = 7 || animelem = 15 || animelem = 23
x = 0

[State 3100, Vel]
type = velset
trigger1 = animelemtime(12) < 0
trigger2 = animelemtime(15) >= 0 && animelemtime(19) < 0
trigger3 = animelemtime(23) >= 0 && animelemtime(28) < 0
y = 0

[State 3100, Pos]
type = posset
trigger1 = animelemtime(12) < 0
trigger2 = animelemtime(15) >= 0 && animelemtime(19) < 0
trigger3 = animelemtime(23) >= 0 && animelemtime(28) < 0
y = 0

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(12) < 0
trigger2 = animelemtime(15) >= 0 && animelemtime(19) < 0
trigger3 = animelemtime(23) >= 0 && animelemtime(28) < 0
statetype = S
physics = S

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 15 || animelem = 23
value = 0, 52

[State 3100, Dust]
type = explod
trigger1 = animelem = 15 || animelem = 23
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
value = 1, 1
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
value = 0, ifelse((animelem = 28), 41, 40)

[State 3100, Dust]
type = helper
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3100, Hit Low]
type = hitdef
trigger1 = animelem = 11 || animelem = 17 || animelem = 18 || animelem = 26 || animelem = 27
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse((animelem = 17 || animelem = 26), 2, 2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 40), map(sparky) := ifelse((animelem = 11), -42, ifelse((animelem = 17 || animelem = 26), -37, -65))
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -2.0, -6.3
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3100, Hit High]
type = hitdef
trigger1 = animelem = 12 || animelem = 19
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 10) * (map(sparkx.max) := 40), map(sparky) := -80
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 32
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -2.0, -6.3
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3100, Hit Final]
type = hitdef
trigger1 = animelem = 28
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 5) * (map(sparkx.max) := 20), map(sparky) := -100
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3.5, -11.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -3.5, -11.0
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 29
movetype = I

[State 3100, Blur FX]
type = explod
trigger1 = animelem = 12 || animelem = 19 || animelem = 28
ID = 8190
anim = 8190
postype = p1
pos = 30, -120
scale = 0.67, 0.75
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = ifelse((animelem = 28), 8, 4)
interpolation.time = ifelse((animelem = 28), 8, 4)
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3100, End]
type = changestate
trigger1 = animelemtime(28) >= 0 && vel y > 0 && (pos y > -vel y)
value = 1105


;======================<HIEN HOUOU KYAKU>=============================
[Statedef 3200]
type = S
physics = S
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

[State 3200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(9) < 0
time = 1
value = SCA

[State 3200, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3200, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = 27, -68
supermovetime = 255
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = 27, -68
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3200, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
physics = N

[State 3200, Vel]
type = velset
trigger1 = animelemtime(9) >= 0
x = 8

[State 3200, Sound]
type = playsnd
trigger1 = animelemtime(9) = -1
value = 7, 7

[State 3200, Dust]
type = helper
trigger1 = animelemtime(9) = -1
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 40), map(sparky) := -48
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = 0, -3
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
ID = 3200
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 3200, Success]
type = changestate
trigger1 = time > 0
trigger1 = animelemtime(9) >= 0
trigger1 = movecontact || movereversed
value = 3210

[State 3200, End]
type = changestate
trigger1 = time >= 72;run 24
value = 3201


;----- MISS -----
[Statedef 3201]
type = S
physics = N
ctrl = 0
anim = 3201

[State 3201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 3201, Sound]
type = playsnd
trigger1 = animelem = 1
value = 0, 101

[State 3201, Dust]
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

[State 3201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- LAND -----
[Statedef 3211]
type = S
physics = S
ctrl = 0
anim = 3211
velset = 0, 0

[State 3211, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 3211, Pos]
type = posset
trigger1 = 1
y = 0

[State 3211, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3211, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3211, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- HIT -----
[Statedef 3210]
type = A
physics = N
movetype = A
anim = 3210
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3210, Width]
type = width
trigger1 = animelemtime(34) < 0
edge = 30

[State 3210, Push]
type = playerpush
trigger1 = animelemtime(34) < 0
value = 0

[State 3210, Pos]
type = posset
trigger1 = !time
trigger1 = numtarget(3200)
x = (target(3200), pos x) -(48 * facing)

[State 3210, Vel]
type = velset
trigger1 = animelem = 3
x = 0.50
y = (p2, const(size.head.pos.y) + (p2, pos y) -pos y + 45) / 56.0

[State 3210, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(33) < 0
trigger1 = vel y < -1.5 || pos y > 0
y = ifelse(pos y > 0, 0, -1.5)

[State 3210, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(33) < 0
trigger1 = p2bodydist x <= 0
x = 0

[State 3210, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 4
channel = 0

[State 3210, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16
trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
value = 1, ifelse(!(animelemno(0) % 2), 4, 3)
;channel = 1
stopongethit = 1

[State 3210, Hit]
type = hitdef
triggerall = (pos y - 35 -(p2, pos y)) > p2, const(size.mid.pos.y)
trigger1 = animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16
trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 12)
ID = 3210
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -35
hitsound = s2, ifelse(!(animelemno(0) % 2), 5, 4)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -4.5, -7.25
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3210, Hit]
type = hitdef
triggerall = (pos y -35 -(p2, pos y)) <= p2, const(size.mid.pos.y)
trigger1 = animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16
trigger2 = animelem = 19 || animelem = 22 || animelem = 25 || animelem = 28 || animelem = 31
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 12)
ID = 3210
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -35
hitsound = s2, ifelse(!(animelemno(0) % 2), 5, 4)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -4.5, -7.25
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3210, Hit Final]
type = hitdef
trigger1 = animelem = 33
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 12)
ID = 3210
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -35
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.5, -7.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -4.5, -7.25
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3210, Blocked]
type = changeanim
trigger1 = animelemtime(5) >= 0 && animelemtime(33) < 0
trigger1 = (moveguarded || movereversed)
trigger2 = animelemtime(7) >= 0 && animelemtime(33) < 0
trigger2 = movecontact >= 8
value = 3210
elem = 33
ignorehitpause = 1

[State 3210, Vel]
type = velset
trigger1 = animelem = 33
x = -2.5
y = -8

[State 3210, Accel]
type = veladd
trigger1 = animelemtime(33) > 0
y = 0.5

[State 3210, Type]
type = statetypeset
trigger1 = animelem = 34
movetype = I

[State 3210, End]
type = changestate
trigger1 = animelemtime(33) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3211


;======================<SHIN HIEN HOUOU KYAKU>=============================
[Statedef 3220]
type = S
physics = S
movetype = A
anim = 3220
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

[State 3220, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3220, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3220, NHB]
type = nothitby
trigger1 = animelemtime(10) < 6
time = 1
value = SCA

[State 3220, Sound]
type = playsnd
trigger1 = time = 3
value = 6, 13
channel = 0

[State 3220, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = 27, -68
supermovetime = 255
ownpal = 1

[State 3220, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = 27, -68
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3220, Type]
type = statetypeset
trigger1 = animelem = 10
statetype = A
physics = N

[State 3220, Vel]
type = velset
trigger1 = animelem = 10
x = 12;15
y = -3

[State 3220, Accel]
type = veladd
trigger1 = animelemtime(10) >= 0
y = 0.25;.35

[State 3220, Sound]
type = playsnd
trigger1 = animelem = 10
value = 7, 7

[State 3220, Dust]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 8105
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3220, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 15) * (map(sparkx.max) := 30), map(sparky) := -48
hitsound = s2, 4
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = 0, -3
air.cornerpush.veloff = 0
guard.velocity = -10.52
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
ID = 3220
kill = 0
p1sprpriority = sprpriority
forcestand = 1

[State 3220, Success]
type = changestate
trigger1 = time > 0
trigger1 = movehit
trigger1 = animelemtime(10) >= 0
value = 3230

[State 3220, Blocked]
type = changestate
trigger1 = moveguarded || movereversed
trigger1 = animelemtime(10) >= 0
value = 3222

[State 3220, End]
type = changestate
trigger1 = animelemtime(10) >= 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3221


;----- MISS -----
[Statedef 3221]
type = S
physics = S
ctrl = 0
anim = 3221

[State 3221, Pos]
type = posset
trigger1 = 1
y = 0

[State 3221, Vel]
type = velset
trigger1 = 1
y = 0

[State 3221, Sound]
type = playsnd
trigger1 = animelem = 1
value = 0, 101

[State 3221, Dust]
type = explod
trigger1 = animelem = 1
anim = 8103
sprpriority = 3
postype = p1
pos = 27, 0
vel = 6, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- BLOCKED -----
[Statedef 3222]
type = S
physics = S
ctrl = 0
anim = 3222
velset = 0, 0
movehitpersist = 1

[State 3222, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 3222, Pos]
type = posset
trigger1 = 1
y = 0

[State 3222, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3222, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3222, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- HIT -----
[Statedef 3230]
type = A
physics = N
movetype = A
anim = 3230
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3230, Width]
type = width
trigger1 = animelemtime(34) < 0
edge = 30

[State 3230, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3230, Pos]
type = posset
trigger1 = !time
trigger1 = numtarget(3220)
x = (target(3220), pos x) -(64 * facing)

[State 3230, Miss]
type = changeanim
triggerall = (movecontact + movereversed) != [1, 12]
trigger1 = animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animelem = 32 || animelem = 34 || animelem = 36 || animelem = 38 || animelem = 40 || animelem = 42 || animelem = 44
value = 3230
elem = 46

[State 3230, Vel]
type = velset
trigger1 = animelem = 3
trigger1 = numenemy
x = 0.25
y = (p2, const(size.head.pos.y) + (p2, pos y) - pos y + 40) / 140.0

[State 3230, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(46) < 0
trigger1 = vel y < -1.5 || pos y > 0
y = ifelse(pos y > 0, 0, -1.5)

[State 3230, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(46) < 0
trigger1 = p2bodydist x <= 0
x = 0

[State 3230, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 13
channel = 0

[State 3230, Sound]
type = playsnd
trigger1 = animelem = 54
value = 5, 14
channel = 0

[State 3230, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animelem = 32 || animelem = 34 || animelem = 36 || animelem = 38 || animelem = 40 || animelem = 42 || animelem = 44
value = 1, 4
;channel = 1
stopongethit = 1

[State 3230, Sound]
type = playsnd
trigger1 = animelem = 55
value = 1, 5
;channel = 1
stopongethit = 1

[State 3230, Hit]
type = hitdef
triggerall = (pos y - 30 - (p2, pos y)) > p2, const(size.mid.pos.y)
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animelem = 32 || animelem = 34 || animelem = 36 || animelem = 38 || animelem = 40 || animelem = 42 || animelem = 44
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 15, 4
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -40
hitsound = s2, ifelse(!(animelemno(0) % 4), 5, 4)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -3, -3
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3230, Hit]
type = hitdef
triggerall = (pos y - 30 - (p2, pos y)) <= p2, const(size.mid.pos.y)
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animelem = 32 || animelem = 34 || animelem = 36 || animelem = 38 || animelem = 40 || animelem = 42 || animelem = 44
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3230
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 15, 4
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 45), map(sparky) := -40
hitsound = s2, ifelse(!(animelemno(0) % 4), 5, 4)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -3, -3
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3230, Hit Lift]
type = hitdef
trigger1 = animelem = 46
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3230
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 15, 4
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 40), map(sparky) := -45
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3, -10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -3, -10
air.cornerpush.veloff = 0
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
p1sprpriority = sprpriority
forcestand = 1

[State 3230, Hit Final]
type = hitdef
trigger1 = animelem = 55
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3230
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 24, 24
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -33
hitsound = s2, 7
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -14, 10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.hittime = 120
air.velocity = -14, 10
air.cornerpush.veloff = 0
p2facing = 1
down.bounce = 1
fall.xvelocity = -7
airguard.velocity = -6, -1
airguard.ctrltime = 1 + 16
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3230, Accel]
type = veladd
trigger1 = animelemtime(47) >= 0
y = 0.5

[State 3230, Vel]
type = velset
trigger1 = animelem = 47
x = 3
y = -9.0

[State 3230, Type]
type = statetypeset
trigger1 = animelem = 56
movetype = I

[State 3230, End]
type = changestate
trigger1 = animelemtime(47) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3211


;======================<YURI CHOU ENBU>=============================
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

[State 3300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(3) < 1
time = 1
value = SCA

[State 3300, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 16
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
pos = 22, -64
supermovetime = 255
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = 22, -64
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3300, Vel]
type = velset
trigger1 = animelem = 4
x = 6

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 7

[State 3300, Dust]
type = explod
trigger1 = animelem = 4
anim = 8103
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3300, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 3300, Miss]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !movecontact && !movereversed
attr = S, HT
hitflag =

[State 3300, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !movecontact && !movereversed
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 22
attr = S, HT
hitflag = M
priority = 7, Miss
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 0, 35
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
numhits = 0
p1stateno = 3301
p2stateno = 3302
p2facing = 1

[State 3300, Hit Full]
type = hitdef
trigger1 = animelemtime(3) = 0
trigger1 = prevstateno != [1000, 4999]
trigger1 = !movecontact && !movereversed
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 22
persistent = 0
attr = S, HT
hitflag = M
priority = 7, Miss
damage = 0, 0
dizzypoints = 0
getpower = 0, 0
givepower = 0, 35
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 0)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
numhits = 0
p1stateno = 3311
p2stateno = 3302
p2facing = 1

[State 3300, End]
type = changestate
trigger1 = !animtime
value = 3201


;----- HIT -----
[Statedef 3301]
type = S
physics = S
movetype = A
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 3302

[State 3301, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animtime < -1
time = 2
movetime = 2

[State 3301, Pause]
type = pause
trigger1 = animtime = -1
time = 0

[State 3301, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3301, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3301, fadeout]
type = allpalfx
trigger1 = animelemtime(2) < 0
time = 1
add = -ceil(time * 8.53), -ceil(time * 8.53), -ceil(time * 8.53)

[State 3301, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animtime < 0
time = 2
value = 0, 0, 0

[State 3301, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 3301, Bind]
type = targetbind
trigger1 = numtarget
pos = 20 + (target, const(size.ground.front)), 0

[State 3301, Hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 1

[State 3301, Damage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = floor(-20 * map(damagescaling))
dizzy = 0
kill = 0

[State 3301, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animtime = -1
value = -1
dizzy = 0
kill = 1

[State 3301, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 19

[State 3301, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 2, 2
channel = 2

;[State 3301, Spark]
;in ZSS

[State 3301, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
time = 6
freq = 180
ampl = 2

[State 3301, Throw]
type = targetstate
trigger1 = !animtime && numtarget
value = 3303

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 3305


;----- POSE -----
[Statedef 3305]
type = S
physics = S
ctrl = 0
anim = ifelse((prevstateno = 3311), 3306, 3305)
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3305, BG]
type = bgpalfx
trigger1 = !time
time = 0

[State 3305, Sound]
type = playsnd
trigger1 = anim = 3305
trigger1 = animelem = 1
value = 6, 16
channel = 0

[State 3305, Sound]
type = playsnd
trigger1 = anim = 3306
trigger1 = animelem = 1
value = 7, 6

[State 3305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 3302]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3302, Anim]
type = changeanim2
trigger1 = 1
value = 3302
elem = ifelse(const(size.head.pos.y) >= -100, 1, 2)


[Statedef 3303]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3303, Anim]
type = changeanim
trigger1 = anim != 5110
value = 5110

[State 3303, End]
type = selfstate
trigger1 = !alive
trigger1 = time > 0
value = 5150

[State 3303, End]
type = selfstate
trigger1 = alive
trigger1 = time >= 40
value = 5120


[Statedef 3304]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3304, Anim]
type = changeanim
trigger1 = anim != 5110
value = 5110

[State 3304, End]
type = selfstate
trigger1 = !alive
trigger1 = time > 0
value = 5150

[State 3304, End]
type = selfstate
trigger1 = alive
trigger1 = time >= 60
value = 5120


;----- HIT -----
[Statedef 3311]
type = S
physics = S
movetype = A
anim = 3311
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 3302

[State 3311, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3311, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3311, fadeout]
type = allpalfx
trigger1 = animelemtime(2) < -1
time = 2
add = -ceil(time * 8.53), -ceil(time * 8.53), -ceil(time * 8.53)

[State 3311, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0
flag = nobardisplay
flag2 = noFG

[State 3311, White]
type = bgpalfx
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(4) >= 0 && animelemtime(5) < 0
trigger3 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger4 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger5 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger6 = animelemtime(12) >= 0 && animelemtime(13) < 0
trigger7 = animelemtime(14) >= 0 && animelemtime(15) < 0
trigger8 = animelemtime(16) >= 0 && animelemtime(17) < 0
trigger9 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger10 = animelemtime(20) >= 0 && animelemtime(21) < 0
trigger11 = animelemtime(22) >= 0 && animelemtime(23) < 0
trigger12 = animelemtime(24) >= 0 && animelemtime(25) < 0
trigger13 = animelemtime(26) >= 0 && animelemtime(27) < 0
trigger14 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger15 = animelemtime(30) >= 0 && animelemtime(31) < 0
mul = 128, 128, 128
color = 0
time = 2

[State 3311, Black]
type = bgpalfx
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger3 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger4 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger5 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger6 = animelemtime(13) >= 0 && animelemtime(14) < 0
trigger7 = animelemtime(15) >= 0 && animelemtime(16) < 0
trigger8 = animelemtime(17) >= 0 && animelemtime(18) < 0
trigger9 = animelemtime(19) >= 0 && animelemtime(20) < 0
trigger10 = animelemtime(21) >= 0 && animelemtime(22) < 0
trigger11 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger12 = animelemtime(25) >= 0 && animelemtime(26) < 0
trigger13 = animelemtime(27) >= 0 && animelemtime(28) < 0
trigger14 = animelemtime(29) >= 0 && animelemtime(30) < 0
trigger15 = animelemtime(31) >= 0
mul = 0, 0, 0
time = 2

[State 3311, Camera]
type = posadd
trigger1 = animelem = 2
trigger1 = frontedgedist < 120
x = frontedgedist - 120

[State 3311, Pos]
type = posadd
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animtime = 0
x = 80

[State 3311, Turn]
type = turn
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
trigger3 = animtime = 0

[State 3311, Afterimage]
type = explod
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
ID = 3311
postype = p1
pos = 0, 0
sprpriority = sprpriority - 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 20
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
interpolation.time = 20
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 3311, Bind]
type = targetbind
trigger1 = numtarget
pos = 40, 0

[State 3311, Bind]
type = targetfacing
trigger1 = numtarget
trigger1 = animelemtime(31) < 0
value = -1

[State 3311, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 10 || animelem = 12 || animelem = 16 || animelem = 18 || animelem = 20
value = 3313

[State 3311, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 8 || animelem = 14 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28
value = 3314

[State 3311, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 30
value = 3315

[State 3311, Hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
value = 1

[State 3311, Damage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
value = floor(-20 * map(damagescaling))
dizzy = 0
kill = 0

[State 3311, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animtime = -1
value = -1
dizzy = 0
kill = 1

[State 3311, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
value = 15

[State 3311, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 10 || animelem = 12 || animelem = 18 || animelem = 20 || animelem = 26 || animelem = 30
value = 2, 2
channel = 2

[State 3311, HitSound]
type = playsnd
trigger1 = animelem = 6 || animelem = 8 || animelem = 14 || animelem = 16 || animelem = 22 || animelem = 24 || animelem = 28
value = 2, 5
channel = 2

[State 3311, Spark Y]
type = null
trigger1 = animelem = 2
trigger1 = map(sparky) := -72
trigger2 = animelem = 4
trigger2 = map(sparky) := -75
trigger3 = animelem = 6
trigger3 = map(sparky) := -78
trigger4 = animelem = 8
trigger4 = map(sparky) := -30
trigger5 = animelem = 10
trigger5 = map(sparky) := -54
trigger6 = animelem = 12
trigger6 = map(sparky) := -71
trigger7 = animelem = 14
trigger7 = map(sparky) := -70
trigger8 = animelem = 16
trigger8 = map(sparky) := -64
trigger9 = animelem = 18
trigger9 = map(sparky) := -102
trigger10 = animelem = 20
trigger10 = map(sparky) := -70
trigger11 = animelem = 22
trigger11 = map(sparky) := -32
trigger12 = animelem = 24
trigger12 = map(sparky) := -32
trigger13 = animelem = 26
trigger13 = map(sparky) := -110
trigger14 = animelem = 28
trigger14 = map(sparky) := -80
trigger15 = animelem = 30
trigger15 = map(sparky) := -40

;[State 3311, Spark]
;in ZSS

[State 3311, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14 || animelem = 16
trigger2 = animelem = 18 || animelem = 20 || animelem = 22 || animelem = 24 || animelem = 26 || animelem = 28 || animelem = 30
time = 6
freq = 180
ampl = 2

[State 3311, Throw]
type = targetstate
trigger1 = !animtime && numtarget
value = 3316

[State 3311, End]
type = changestate
trigger1 = !animtime
value = 3305


;----- TARGET -----
[Statedef 3302]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3302, Anim]
type = changeanim2
trigger1 = !time
value = 3302


[Statedef 3313]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3313, Anim]
type = changeanim2
trigger1 = !time
value = 3313


[Statedef 3314]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3314, Anim]
type = changeanim2
trigger1 = !time
value = 3314


[Statedef 3315]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3315, Anim]
type = changeanim
trigger1 = 1
value = 5070


[Statedef 3316]
type = L
physics = N
movetype = H
velset = 0, 0

[State 3316, Anim]
type = changeanim
trigger1 = time = 0 || time = 6 || time = 12
value = 5080

[State 3316, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5080
value = 5110

[State 3316, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3316, Pos]
type = posset
trigger1 = 1
y = 0

[State 3316, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 3316, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = 10

[State 5081, Skip Hit Ground Frame]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 3316, End]
type = selfstate
trigger1 = time >= 40
value = ifelse(!alive, 5150, 5110)


;======================<HIEN SENPUKYAKU>========================
[Statedef 3400]
type = A
physics = N
movetype = A
anim = 3400
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
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3400, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 9
channel = 0

[State 3400, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-53 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(7 * const(size.xscale)), ceil(-53 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3400, Push]
type = playerpush
trigger1 = animelemtime(39) < 0
value = 0

[State 3400, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(35) < 0
x = 0
y = -0.5

[State 3400, Vel]
type = velset
trigger1 = animelemtime(35) >= 0
trigger1 = animelemtime(39) < 0
x = 0
y = 0

[State 3400, Accel]
type = veladd
trigger1 = animelemtime(39) >= 0
y = 0.6

[State 3400, Width]
type = width
trigger1 = movehit = [1, 10]
trigger1 = animelemtime(10) >= 0
trigger1 = animelemtime(37) < 0
edge = 50, 0
ignorehitpause = 1

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 15
channel = 0

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 36
value = 4, 3
channel = 0

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 11

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 12 || animelem = 20 || animelem = 28
value = 1, 4
;channel = 1
stopongethit = 1

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 36
value = 1, 5
;channel = 1
stopongethit = 1

[State 3400, Hit Front]
type = hitdef
trigger1 = animelem = 5 || animelem = 13 || animelem = 21 || animelem = 29
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
ID = 3400
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 0, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12
ground.slidetime = 12
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = ifelse(p2dist x > 32, 20, 12), ifelse(p2dist y < (-64 - p2, const(size.mid.pos.y)), 0, -4.0)
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
p2facing = 1
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -60
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3400, Hit]
type = hitdef
trigger1 = animelem = 9 || animelem = 17 || animelem = 25 || animelem = 33
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
ID = 3400
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 0, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 12
ground.slidetime = 12
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = ifelse(p2dist x < -32, -20, -12), ifelse(p2dist y < (-64 - p2, const(size.mid.pos.y)), 0, -4.0)
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
p2sprpriority = sprpriority + 1
p2facing = -1
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -60) * (map(sparkx.max) := -30), map(sparky) := -60
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3401, Hit Final]
type = hitdef
trigger1 = animelem = 37
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
ID = 3401
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 18, 18
guard.pausetime = 18, 18
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -9, -3
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
p2facing = 1
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -60
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3400, Anim]
type = changeanim
trigger1 = anim = 3400
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(37) >= 0 && animelemtime(38) <= 0
trigger1 = hitpausetime <= 14
value = 3400
elem = 38
ignorehitpause = 1

[State 340, Blur FX]
type = explod
trigger1 = animelem = 5 || animelem = 13 || animelem = 21 || animelem = 29
ID = 8191
anim = 8191
postype = p1
pos = 70, -65
scale = 1.00, 0.67
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

[State 340, Blur FX]
type = explod
trigger1 = animelem = 9 || animelem = 17 || animelem = 25 || animelem = 33
ID = 8191
anim = 8191
postype = p1
pos = -80, -75
scale = -1.00, -0.67
bindtime = 60
trans = addalpha
alpha = 192, 256
removetime = 6
interpolation.time = 6
interpolation.alpha = 0, 256
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 340, Blur FX]
type = explod
trigger1 = animelem = 37
ID = 8191
anim = 8191
postype = p1
pos = 70, -60
scale = 0.75, 0.75
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

[State 3400, Idle]
type = statetypeset
trigger1 = animelemtime(39) >= 0
movetype = I
persistent = 0

[State 3400, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3401


;----- Land -----
[Statedef 3401]
type = S
physics = S
movetype = I
anim = 3401
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3401, Pos]
type = posset
trigger1 = 1
y = 0

[State 3401, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3401, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3401, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RAIODAMA>=============================
[Statedef 3500]
type = A
physics = N
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000 + 0 * (map(superlevel) := 2)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

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

[State 3500, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3500, Sound]
type = playsnd
trigger1 = time = 3
value = 6, 15
channel = 0

[State 3500, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = ceil(-13 * const(size.xscale)), ceil(-107 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3500, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-13 * const(size.xscale)), ceil(-107 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3500, Width]
type = width
trigger1 = animelem = 3
value = 16

[State 3500, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 4
value2 = SCA, AA, AT
time = 1

[State 3500, Fireball]
type = helper
trigger1 = animelem = 4
helpertype = normal; projectile
stateno = 3505
ID = 3505
name = "Raiodama"
postype = p1
pos = 53, -50
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3500, FX]
type = helper
trigger1 = time = 43
helpertype = normal
stateno = 3504
ID = 3504
name = "Raiodama FX"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
supermovetime = cond(numenemy, (p2, pausetime), 60)
ownpal = 1

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 9

[State 3500, Accel]
type = veladd
trigger1 = animelemtime(4) >= 1
y = 0.5

[State 3500, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = -1
y = -5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3501


;---Land---
[Statedef 3501]
type = S
physics = S
movetype = I
anim = 3501
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3501, Pos]
type = posset
trigger1 = 1
y = 0

[State 3501, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3501, Dust]
type = explod
trigger1 = !time
anim = 8102
ID = 8100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3501, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
