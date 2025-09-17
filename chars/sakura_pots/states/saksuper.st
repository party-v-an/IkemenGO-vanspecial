; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<SHINKUU HADOU KEN>=============================
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

[State 3000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 13
channel = 0

[State 3000, focus]
type = helper
trigger1 = anim = 3000
trigger1 = animelem = 2
helpertype = normal
stateno = 3004
ID = 3004
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300

[State 3000, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -19 * const(size.xscale), -63 * const(size.yscale)
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
pos = -19 * const(size.xscale), -63 * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger2 = anim = 3001 && animelemtime(2) < -1
time = 1
value = SCA

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000
trigger1 = time >= 45
value = 3001

[State 3000, Width]
type = width
trigger1 = anim = 3001
trigger1 = animelemtime(2) = -1
value = 29 * const(size.xscale)

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = anim = 3001
trigger1 = animelem = 2
value2 = SCA, AA, AT
time = 1

[State 3000, Hadouken]
type = helper
trigger1 = anim = 3001
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "Shinku Hadouken"
postype = p1
pos = 86 * const(size.xscale), -54 * const(size.yscale)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = anim = 3001
trigger1 = animelem = 2
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 40 * const(size.xscale), 2
ownpal = 1
scale = 0.67, 0.33
pausemovetime = -1
supermovetime = -1

[State 3000, Sound]
type = playsnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 4, 1
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 5, 1

[State 3000, End]
type = changestate
trigger1 = anim = 3001
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHINKUU TENGYOU HADOU KEN>=============================
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3020
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

[State 3020, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3020, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 13
channel = 0

[State 3020, focus]
type = helper
trigger1 = anim = 3020
trigger1 = animelem = 2
helpertype = normal
stateno = 3024
ID = 3024
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300

[State 3020, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -9 * const(size.xscale), -57 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3020, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = -9 * const(size.xscale), -57 * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3020, NHB]
type = nothitby
trigger1 = anim = 3020
trigger2 = anim = 3021 && animelemtime(2) < -1
time = 1
value = SCA

[State 3020, Anim]
type = changeanim
trigger1 = anim = 3020
trigger1 = time >= 44
value = 3021

[State 3020, Correct Projectile Trade]
type = hitby
trigger1 = anim = 3021
trigger1 = animelem = 2
value2 = SCA, AA, AT
time = 1

[State 3020, Hadouken]
type = helper
trigger1 = anim = 3021
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 3005
ID = 3025
name = "Shinku Hadouken"
postype = p1
pos = 58 * const(size.xscale), -105 * const(size.yscale)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3020, Dust]
type = explod
trigger1 = anim = 3021
trigger1 = animelem = 2
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 20 * const(size.xscale), 2
ownpal = 1
scale = 0.67, 0.33
pausemovetime = -1
supermovetime = -1

[State 3020, Sound]
type = playsnd
trigger1 = anim = 3021
trigger1 = animelem = 2
value = 4, 1
channel = 0

[State 3020, Sound]
type = playsnd
trigger1 = anim = 3021
trigger1 = animelem = 2
value = 5, 1

[State 3020, End]
type = changestate
trigger1 = anim = 3021
trigger1 =!animtime
value = 0
ctrl = 1


;======================<MIDARE ZAKURA>=============================
[Statedef 3100]
type = S
physics = N
movetype = A
ctrl = 0
anim = 3100
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

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 17
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
pos = -18 * const(size.xscale), -68 * const(size.yscale)
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
pos = -18 * const(size.xscale), -68 * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.6304

[State 3100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(28) >= 1
y = 0.591

[State 3100, Vel]
type = velset
trigger1 = animelem = 2 || animelem = 14
x = 8.20

[State 3100, Vel]
type = velset
trigger1 = animelem = 25
x = 10.25

[State 3100, Vel]
type = velset
trigger1 = animelemtime(28) = 1
y = -10.344

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 28
statetype = A
physics = N

[State 3100, Dust]
type = explod
trigger1 = animelem = 4 || animelem = 15 || animelem = 26
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 24 * const(size.xscale), 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Sound]
type = playsnd
trigger1 = animelemtime(28) = 1
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = animelemtime(28) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 17
value = 1, 4
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 28
value = 1, 5
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 28
value = 3, 4
channel = 0

[State 3100, Hit Low]
type = hitdef
trigger1 = animelem = 4 || animelem = 15 || animelem = 26
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 20, 5
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 3, 3
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -30
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 24
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.5, -4.0
getpower = 0, 0
givepower = 40, 40
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850

[State 3100, Hit Mid]
type = hitdef
trigger1 = animelem = 5 || animelem = 16 || animelem = 27
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 3, 3
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -61
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 24
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.5, -4.0
getpower = 0, 0
givepower = 40, 40
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850

[State 3100, Hit High]
type = hitdef
trigger1 = animelem = 6 || animelem = 17
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 3, 3
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 24
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.5, -4.0
getpower = 0, 0
givepower = 40, 40
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850

[State 3100, Hit Final]
type = hitdef
trigger1 = animelem = 28
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 3, 3
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 70), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -8
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4, -8
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 3100, Blur FX]
type = explod
trigger1 = animelem = 6 || animelem = 17 || animelem = 28
ID = 1190
anim = 1190
postype = p1
pos = 40 * const(size.xscale), -60 * const(size.yscale)
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

[State Idle]
type = statetypeset
trigger1 = animelemtime(29) >= 0
movetype = I
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3109


;---Land---
[Statedef 3109]
type = S
physics = S
movetype = I
anim = 3109
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3109, Pos]
type = posset
trigger1 = 1
y = 0

[State 3109, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3109, Dust]
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

[State 3109, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HARU ICHIBAN>=============================
[Statedef 3200]
type = S
physics = N
movetype = A
ctrl = 0
anim = 3200
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

[State 3200, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3200, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -16 * const(size.xscale), -12 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = -16 * const(size.xscale), -12 * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(8) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.3255

[State 3200, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3200, Vel]
type = velset
trigger1 = animelemtime(6) >= 0
trigger1 = animelemtime(24) < 0
x = 4

[State 3200, Dust]
type = explod
trigger1 = vel x > 2
trigger1 = !(time % 4)
trigger1 = animelemtime(6) >= 0 && animelemtime(24) < 0
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 20 * const(size.xscale), 0
vel = -1, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 7
value = 3, 0
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 25
value = 3, 4
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20
value = 1, 1
;channel = 1
stopongethit = 1

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 26
value = 1, 6
;channel = 1
stopongethit = 1

[State 3200, FX]
type = explod
trigger1 = animelem = 27
ID = 3290
anim = 3290
postype = p1
pos = 110 * const(size.xscale), -55 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3200, Type]
type = statetypeset
trigger1 = animelem = 23
statetype = S
physics = S

[State 3200, Width]
type = width
trigger1 = animelem = 27
value = 24

[State 3200, Hit Low]
type = hitdef
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = L
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -10
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3, -9.5
guard.velocity = -4.31
guard.cornerpush.veloff = 0
down.hittime = 30
down.velocity = -3, -9.5
getpower = 0, 0
givepower = 40, 40
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850

[State 3200, Hit Final]
type = hitdef
trigger1 = animelem = 27
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 3200
attr = S, SA
damage = 40, 10
dizzypoints = 0
animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 120), map(sparky) := -57
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -16.0, -3.00
air.type = Low
air.velocity = -16.0, -3.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
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
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
yaccel = 0.4850

[State 3200, Wall Bounce]
type = targetstate
trigger1 = !map(wallbounce)
trigger1 = movehit = 1
trigger1 = numtarget(3200)
trigger1 = target(3200), dizzy = 0
trigger1 = target(3200), dizzypoints > abs(target(3200), gethitvar(dizzypoints))
trigger1 = target(3200), stateno = 5000 || target(3200), stateno = 5010 || target(3200), stateno = 5020
trigger1 = 1 || map(wallbounce) := 1
value = 1111230
ID = 3200
ignorehitpause = 1

[State 3200, Juggle Reset]
type = mapset
trigger1 = numtarget(3200)
trigger1 = target(3200), stateno = 1111230
map = "juggle_count"
value = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(29) >= 0
movetype = I
persistent = 0

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<KICKED by EX SHUNPUU R.K.>=============================
;----- Hit Pause -----
[Statedef 1111230]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1111230, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 1111230, End]
type = changestate
trigger1 = hitshakeover
value = 1111231


;----- Falling -----
[Statedef 1111231]
type = A
physics = N
movetype = H

[State 1111231, Accel]
type = veladd
trigger1 = 1
y = ifelse(vel y < 0, 0.5, 1.0) * gethitvar(yaccel)

[State 1111231, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1111231, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = abs(player(gethitvar(playerno)), pos x - pos x) < (320 - stagevar(camera.tension) * 2), 0

[State 1111231, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111231, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111231, Bounce]
type = changestate
trigger1 = time >= 4
trigger1 = pos y < 0
trigger1 = backedgebodydist <= 0 || frontedgebodydist <= 0
value = 1111232

[State 1111231, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;----- Target Hitting Wall -----
[Statedef 1111232]
type = A
physics = N
movetype = H

[State 1111232, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111232, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 1111232, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111232, Screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1111232, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111232, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111232, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1111232, FX]
type = explod
trigger1 = !time
anim = F 72
postype = p1
pos = -15, const(size.mid.pos.y)
sprpriority = -5
ownpal = 1

[State 1111232, End]
type = changestate
trigger1 = time >= 4
value = 1111233


;----- Falling -----
[Statedef 1111233]
type = A
physics = N
movetype = H

[State 1111233, turn]
type = turn
trigger1 = !time

[State 1111233, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 1111233, Track Nearest Player]
type = velset
trigger1 = !time
x = ((p2, pos x - pos x) * facing + 40) / 36.0
y = (pos y + 0.5 * 0.4850 * 36 ** 2) / -36.0

[State 1111233, Track Exact Player]
type = velset
trigger1 = !time
trigger1 = gethitvar(playerno)
trigger1 = playerIDexist(player(gethitvar(playerno)), ID)
x = ((player(gethitvar(playerno)), pos x - pos x) * facing + 40) / 36.0

[State 1111233, Vel]
type = velset
trigger1 = !time
trigger1 = vel x != [-8, 0]
x = ifelse(vel x <= -8, -8, 0)

[State 1111233, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1111233, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = !animtime
value = 5050

[State 1111233, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = vel y > -2
value = 5061

[State 1111233, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1111233, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111233, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;======================<SHINKUU HADOU KEN MvC>=============================
[Statedef 3300]
type = S
physics = S
movetype = A
anim = 3020
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

[State 3300, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 13
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = -9 * const(size.xscale), -57 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(map(cfg_superfx), -1, 102)
pos = -9 * const(size.xscale), -57 * const(size.yscale)
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 3300, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3300, focus]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3024
ID = 3024
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300

[State 3300, End]
type = changestate
trigger1 = time >= 45
value = 3301


;----- Firing -----
[Statedef 3301]
type = S
physics = S
movetype = A
anim = 3021
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3301, NHB]
type = nothitby
trigger1 = time <= 7
time = 1
value = SCA

[State 3301, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(12) < 0
value = 18 * const(size.xscale)

[State 3301, Loop]
type = changeanim
trigger1 = animelemtime(3) = 10
trigger1 = time < 80
value = 3021
elem = 3

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(time < 70, 2, 3)
channel = 0

[State 3301, Hadouken]
type = helper
trigger1 = animelem = 3
helpertype = normal; projectile
stateno = 3305
ID = 3305
name = "Marvel Hadouken"
postype = p1
pos = ifelse((time % 30) < 10, 58, ifelse((time % 30) < 20, 74, 42)) * const(size.xscale), ifelse((time % 30) < 10, -105, ifelse((time % 30) < 20, -89, -121)) * const(size.yscale)
size.xscale = 0.4
size.yscale = 0.5
ownpal = 1

[State 3301, Dust]
type = explod
trigger1 = animelem = 3
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 20 * const(size.xscale), 2
ownpal = 1
scale = 0.75, 0.50
pausemovetime = -1
supermovetime = -1

[State 3301, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 1
channel = 5

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHUN GOKU SATSU>=============================
[Statedef 4000]
type = S
physics = N
movetype = A
anim = 4000
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

[State 4000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4000, Sound]
type = playsnd
trigger1 = time = 3
value = 3, 0
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
pos = -8 * const(size.xscale), -58 * const(size.yscale)
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
pos = -8 * const(size.xscale), -58 * const(size.yscale)
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4000, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = animelem = 3
x = 5

[State 4000, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 4000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 105

[State 4000, Dust]
type = explod
trigger1 = animelem = 3
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = -1, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 4000, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
attr = S, HT
hitflag =

[State 4000, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0 && animelemtime(5) < 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 25
ID = 4000
attr = S, HT
hitflag = M
priority = 7, Miss
numhits = 0
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p2facing = 1
p1stateno = 4010
p2stateno = 4020
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850

[State 4000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 7
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I
persistent = 0

[State 4000, End]
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
sprpriority = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 4020

[State 4010, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 3
channel = 0

[State 4010, Width]
type = width
trigger1 = animelemtime(2) < -1
edge = 80 * const(size.xscale), 0

[State 4010, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4010, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4010, Kei]
type = helper
trigger1 = !numhelper(6000)
trigger1 = animelemtime(2) < 0
helpertype = normal
stateno = 6010
ID = 6000
name = "Kei"
postype = p1
pos = 480, 0
facing = -1
ownpal = 1

[State 4010, Wait]
type = changeanim
trigger1 = animelemtime(2) < 0
trigger1 = numhelper(6000)
trigger1 = (helper(6000), stateno = 6010) && (helper(6000), anim = 6002)
value = 4010
elem = 1

[State 4010, Wait]
type = changeanim
trigger1 = animelemtime(2) < 0
trigger1 = numhelper(6000)
trigger1 = (helper(6000), stateno = 6010) && (helper(6000), anim = 6010)
value = 4010
elem = 2

[State 4010, Throw]
type = targetstate
trigger1 = animelem = 8
value = 4021

[State 4010, Image Off]
type = afterimagetime
trigger1 = animelemtime(7) >= 0
time = 0

[State 4010, Assert]
type = assertspecial
trigger1 = animelemtime(8) >= 0
flag = nobardisplay
flag2 = noFG

[State 4010, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = 1

[State 4010, Zoom]
type = zoom
trigger1 = numtarget(4000)
trigger1 = animelemtime(5) >= 0
scale = 1.20 / camerazoom
pos = (pos x + target(4000), pos x) / 2.0 * camerazoom, 0
camerabound = 0
stagebound = 1
lag = 0.90

[State 4010, Bind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = 40 * const(size.xscale), 0

[State 4010, Bind]
type = posadd
trigger1 = animelem = 8
x = -25 * const(size.xscale)

[State 4010, Bind]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(23) < 0
pos = 65 * const(size.xscale), 0

[State 4010, fadeout]
type = allpalfx
trigger1 = animelem = 7
time = 30
sinadd = -255, -255, -255, 120

[State 4010, black]
type = envcolor
trigger1 = animelemtime(8) >= 0 && animelemtime(10) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(14) < 0
trigger3 = animelemtime(16) >= 0 && animelemtime(18) < 0
trigger4 = animelemtime(20) >= 0
time = 1
value = 0, 0, 0

[State 4010, BG PalFX]
type = bgpalfx
trigger1 = animelem = 10
trigger2 = animelem = 14
trigger3 = animelem = 18
add = 255, 255, 255
sinadd = -1000, -1000, -1000, 80
mul = 256, 128, 256
color = 0
time = 20

[State 4010, Sakura Palfx]
type = palfx
trigger1 = animelem = 10
trigger2 = animelem = 14
trigger3 = animelem = 18
add = 0, 0, 0
sinadd = -255, -255, -255, 80
time = 20

[State 4010, Hitadd]
type = hitadd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 1

[State 4010, Damage]
type = targetlifeadd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = floor(-ifelse((animelem = 22), 42, 38) * map(damagescaling))
dizzy = 0
kill = animelem = 22

[State 4010, givepower]
type = targetpoweradd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 25

[State 4010, Spark Position]
type = null
trigger1 = animelem = 10
trigger1 = map(sparkx.max) := 83 || map(sparky) := -78
trigger2 = animelem = 14
trigger2 = map(sparkx.max) := 80 || map(sparky) := -35
trigger3 = animelem = 18
trigger3 = map(sparkx.max) := 66 || map(sparky) := -96
trigger4 = animelem = 8 || animelem = 9 || animelem = 12 || animelem = 13 || animelem = 16 || animelem = 17 || animelem = 20 || animelem = 21 || animelem = 22
trigger4 = map(sparkx.max) := (50 + 50 * cos(animelemtime(8) / 3.0)) || map(sparky) := (-50 + 50 * sin(animelemtime(8) / 3.0))
;trigger4 = map(sparkx.max) := (65 - 25 + (random / 20.0)) || map(sparky) := (-60 - 25 + (random / 20.0))

[State 4010, HitSound]
type = playsnd
trigger1 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 12 || animelem = 13 || animelem = 14
trigger2 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 20 || animelem = 21 || animelem = 22
value = 2, ifelse((animelem = 22), 10, 3)
channel = 2

[State 4010, Shake]
type = envshake
trigger1 = animelem = 10 || animelem = 14 || animelem = 18 || animelem = 22
time = 12
freq = 180
ampl = 2

;[State 4010, Spark]
;in ZSS

[State 4010, Palfx]
type = palfx
trigger1 = !animtime
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1

[State 4010, BG PalFX]
type = bgpalfx
trigger1 = !animtime
add = 0, 0, 0
sinadd = 0, 0, 0, 1
color = 256
time = 1

[State 4010, End]
type = changestate
trigger1 = !animtime
trigger2 = winko
value = 4011


;----- End -----
[Statedef 4011]
type = S
physics = N
movetype = I
anim = 4011
ctrl = 0
velset = 0, 0
sprpriority = -4

[State 4011, Sound]
type = playsnd
trigger1 = time = 8
trigger1 = !map(dark)
value = 4, 7
channel = 0

[State 4011, Flower Petals]
type = explod
trigger1 = animelemtime(2) < 0
trigger1 = numexplod(6090) < 12
anim = 6090
ID = 6090
postype = p1
pos = 25 * const(size.xscale), -110 * const(size.yscale)
vel = -(random / 2000.0), 0.5
accel = -0.0075, 0
random = 100, 50
sprpriority = 4
removetime = 210 + numexplod(6090)
scale = 0.25 * ifelse(random < 500, -1, 1), 0.25 * ifelse(random < 500, -1, 1)
ownpal = 1

[State 4011, Throw]
type = targetstate
trigger1 = !time
value = 4022

[State 4011, End]
type = changestate
trigger1 = winko
trigger1 = time > 8
value = 4012

[State 4011, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 4020]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 4020, Anim]
type = changeanim2
trigger1 = 1
value = 4020
elem = 1

[State 4020, Anim]
type = changeanim2
trigger1 = playerIDexist(stateowner, ID)
trigger1 = stateowner, stateno = 4010
trigger1 = stateowner, animelemtime(2) < 0
value = 4020
elem = 2

[State 4020, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 4021]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 4021, Anim]
type = changeanim2
trigger1 = !time
value = 4021

[State 4021, Palfx]
type = palfx
trigger1 = animelemtime(3) = -1
trigger2 = animelemtime(7) = -1
trigger3 = animelemtime(11) = -1
add = 0, 0, 0
sinadd = -255, -255, -255, 80
time = 20

[State 4021, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 4022]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 4022, Anim]
type = changeanim2
trigger1 = !time
value = 4022

[State 4022, Palfx]
type = palfx
trigger1 = !time
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1

[State 4022, End]
type = selfstate
trigger1 = !alive
trigger1 = time
value = 5150

[State 4022, End]
type = selfstate
trigger1 = alive
trigger1 = time >= 90
value = 5120


;======================<DARK SHUN GOKU SATSU>=============================
[Statedef 4050]
type = S
physics = S
movetype = A
anim = 4050
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

[State 4050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4050, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = 15 * const(size.xscale), -74 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4050, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(map(cfg_superfx), -1, 102)
pos = 15 * const(size.xscale), -74 * const(size.yscale)
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4050, NHB]
type = nothitby
trigger1 = time < 52
time = 1
value = SCA

[State 4050, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 8
persistent = 0

[State 4050, Vel]
type = velset
trigger1 = animelemtime(3) >= 0
x = 4

[State 4050, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 4050, Miss]
type = hitdef
trigger1 = animelemtime(3) >= 0
attr = S, HT
hitflag =

[State 4050, Hit]
type = hitdef
trigger1 = animelemtime(3) >= 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 12
attr = S, HT
hitflag = M
priority = 7, Miss
numhits = 0
sparkno = -1 + 0 * (map(sparkno) := 0)
p1facing = 1
p2facing = 1
p1stateno = 4060
p2stateno = 4020
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
hitsound = s2, 800
hitsound.channel = 2

[State 4050, End];33 active
type = changestate
trigger1 = time >= 77
trigger2 = animelemtime(3) > 0 && frontedgebodydist <= 0
value = 4051


;----- Miss -----
[Statedef 4051]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4051, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Grab -----
[Statedef 4060]
type = A
physics = N
movetype = A
anim = 4060
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4060, Bound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State Throw]
type = targetstate
trigger1 = !time
value = 4020

[State 4060, Fadeout]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 16
sinadd = -255, -255, -255, 64

[State 4060, Black]
type = envcolor
trigger1 = animelemtime(2) >= 0
trigger1 = animtime
time = 1
value = 0, 0, 0

[State 4060, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 4060, Width]
type = width
trigger1 = !time
edge = ceil(29 * const(size.xscale)), 0

[State 4060, Width]
type = width
trigger1 = animelem = 2
edge = 60 * const(size.xscale), 60 * const(size.xscale)

[State 4060, Bind]
type = targetbind
trigger1 = !time
pos = 0, 0

[State 4060, Bind]
type = bindtotarget
trigger1 = animelemtime(2) < 0
pos = 0, Min(-72, target, const(size.head.pos.y) + 8)

[State 4060, Bind]
type = targetbind
trigger1 = animelemtime(2) >= 0
pos = -8, 0

[State 4060, Pos]
type = posset
trigger1 = animelemtime(2) >= 0
y = 0

[State 4060, Hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 1

[State 4060, Damage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = floor(-ifelse((animelem = 13), 44, 36) * map(damagescaling))
dizzy = 0
kill = animelem = 13

[State 4060, Givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 25

[State 4060, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
value = 2, ifelse((animelem = 13), 10, 3)
channel = 2

;[State 4060, Spark]
;in ZSS

[State 4060, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13
time = 6
freq = 180
ampl = 2

[State 4060, End]
type = changestate
trigger1 = !animtime
value = 4011


;======================<HARU ISSEN>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 4100
velset = 0, 0
poweradd = -2000 + 0 * (map(superlevel) := 2)
sprpriority = 2
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

[State 4100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4100, Sound]
type = playsnd
trigger1 = time = 3
value = 3, 0
channel = 0

[State 4100, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = -11 * const(size.xscale), -56 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4100, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = -11 * const(size.xscale), -56 * const(size.yscale)
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 4100, NHB]
type = nothitby
trigger1 = time < 50
time = 1
value = SCA
ignorehitpause = 1

[State 4100, Shield]
type = hitby
trigger1 = numhelper(1115)
time = 1
value2 = SCA, AA, AT
ignorehitpause = 1

[State 4100, Shield]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 1115
ID = 1115
name = "Projectile Shield"
size.xscale = 0.75 * const(size.xscale)
size.yscale = 0.75 * const(size.yscale)
postype = p1
ownpal = 1

[State 4100, Vel]
type = velset
trigger1 = animelemtime(8) >= 0
x = 6.71

[State 4100, steps]
type = playsnd
trigger1 = animelem = 9 || animelem = 12
value = 0, ifelse((animelem = 9), 103, 106)

[State 4100, Hit Running]
type = hitdef
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 4100
attr = S, HA
damage = 0, 0
dizzypoints = 0
animtype = Light
air.animtype = Light
fall.animtype = Light
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
guard.pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -55
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 24
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -9
air.type = Low
air.velocity = 0, 0
getpower = 0, 0
givepower = 0, 0
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0
yaccel = 0.4850
air.cornerpush.veloff = 0

[State 4100, Type]
type = statetypeset
trigger1 = anim = 1111
statetype = S
physics = S

[State 4100, Success]
type = changestate
trigger1 = animelemtime(8) > 0
trigger1 = movehit || movereversed
value = 4110

[State 4100, Guarded]
type = changestate
trigger1 = animelemtime(8) > 0
trigger1 = moveguarded
value = 4108

[State 4100, Missed]
type = changestate
triggerall = animelemtime(8) > 0
trigger1 = time >= 88
trigger2 = frontedgedist <= 0
value = 4101


;----- BRAKE -----
[Statedef 4101]
type = S
physics = S
movetype = I
anim = 4101
ctrl = 0
sprpriority = 2

[State 4101, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 7
channel = 0

[State 4101, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 101

[State 4101, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 18 * const(size.xscale), 0
vel = 2, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 4101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- BLOCKED -----
[Statedef 4108]
type = A
physics = N
movetype = I
anim = 43
ctrl = 0
velset = -2, -9.5
sprpriority = 2

[State 4108, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4108, Sound]
type = playsnd
trigger1 = !time
value = 0, 40

[State 4108, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 4100
value = 3, 7
channel = 0

[State 4108, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4109


;---Land---
[Statedef 4109]
type = S
physics = S
movetype = I
anim = 4109
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 4109, Pos]
type = posset
trigger1 = 1
y = 0

[State 4109, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4109, Dust]
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

[State 4109, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- COMBO -----
[Statedef 4110]
type = S
physics = N
movetype = A
ctrl = 0
anim = 4110
velset = 0, 0
sprpriority = 2

[State 4110, P2 State]
type = targetstate
trigger1 = !time
trigger1 = numtarget(4100)
value = 4120
ID = 4100

[State 4110, Bind]
type = targetbind
trigger1 = !time
trigger1 = numtarget(4100)
pos = 64 * const(size.xscale), 0
ID = 4100

[State 4110, Shield]
type = hitby
trigger1 = numhelper(1115)
time = 1
value2 = SCA, AA, AT
ignorehitpause = 1

[State 4110, Vel]
type = velmul
trigger1 = animelemtime(56) < 0
x = 0.75

[State 4110, Accel]
type = veladd
trigger1 = animelemtime(62) >= 1
y = 0.5

[State 4110, Vel]
type = velset
trigger1 = animelem = 2 || animelem = 10 || animelem = 16 || animelem = 23
trigger2 = animelem = 31 || animelem = 38 || animelem = 45 || animelem = 49 || animelem = 56
x = 6

[State 4110, Vel]
type = velset
trigger1 = animelemtime(62) = 1
x = 6
y = -10

[State 4110, Vel]
type = velmul
trigger1 = animelemtime(62) > 1
x = 0.95

[State 4110, Type]
type = statetypeset
trigger1 = animelem = 62
statetype = A
physics = N

[State 4110, Sound]
type = playsnd
trigger1 = animelemtime(62) = 1
value = 0, 41

[State 4110, Dust]
type = helper
trigger1 = animelemtime(62) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4110, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 10 || animelem = 16 || animelem = 23
trigger2 = animelem = 31 || animelem = 38 || animelem = 45 || animelem = 49
value = 3, ifelse(random < 333, 1, ifelse(random < 500, 2, 6))
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 4110, Sound]
type = playsnd
trigger1 = animelem = 56
value = 3, 3
channel = 0

[State 4110, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 10 || animelem = 31 || animelem = 61
value = 1, 3
;channel = 1
stopongethit = 1

[State 4110, Sound]
type = playsnd
trigger1 = animelem = 16 || animelem = 23 || animelem = 38 || animelem = 45 || animelem = 49
value = 1, 6
;channel = 1
stopongethit = 1

[State 4110, Hit Low]
type = hitdef
trigger1 = animelem = 11 || animelem = 24 || animelem = 39 || animelem = 50
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4110
attr = S, HA
damage = 25, 6
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 100), map(sparky) := ifelse((animelem = 11), -66, ifelse((animelem = 24), -72, ifelse((animelem = 39), -54, -58)))
hitsound = s2, ifelse((animelem = 11), 3, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 12
ground.hittime = 1 + 24
ground.velocity = -4.49
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.cornerpush.veloff = 0
air.type = Low
air.velocity = -6, -4
getpower = 0, 0
givepower = 40, 40
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = (numtarget != numenemy)
yaccel = 0.4850

[State 4110, Hit High]
type = hitdef
trigger1 = animelem = 3 || animelem = 17 || animelem = 32 || animelem = 46
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4110
attr = S, HA
damage = 25, 6
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 100), map(sparky) := ifelse((animelem = 3), -66, ifelse((animelem = 17), -80, ifelse((animelem = 32), -58, -43)))
hitsound = s2, ifelse((animelem = 3), 3, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 24
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.cornerpush.veloff = 0
air.type = Low
air.velocity = -6, -4
getpower = 0, 0
givepower = 40, 40
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = ifelse((animelem = 3), 0, (numtarget != numenemy))
yaccel = 0.4850

[State 4110, Hit Low Shououken]
type = hitdef
trigger1 = animelem = 58 || animelem = 59
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4110
attr = S, HA
damage = 20, 5
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -30
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 1 + 24
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -6, -4
getpower = 0, 0
givepower = 40, 40
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
air.cornerpush.veloff = 0

[State 4110, Hit High Shououken]
type = hitdef
trigger1 = animelem = 60 || animelem = 61
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4110
attr = S, HA
damage = 20, 5
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -60
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
air.velocity = -4, -10
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
air.cornerpush.veloff = 0

[State 4110, Hit Final]
type = hitdef
trigger1 = animelem = 62 || animelem = 63 || animelem = 64
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4110
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 20) * (map(sparkx.max) := 40), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
air.velocity = -4, -10
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850

[State 4110, Flower Petals]
type = explod
trigger1 = movehit = 1
anim = 6090
ID = 6090
postype = p1
pos = map(sparkx.min) * const(size.xscale) - 10, map(sparky) * const(size.yscale) - 10
vel = -(random / 2000.0), -(random / 2000.0)
accel = -0.0075, 0.0075
random = 20, 20
sprpriority = 4
removetime = 210 + numexplod(6090)
scale = 0.25 * ifelse(random < 500, -1, 1), 0.25 * ifelse(random < 500, -1, 1)
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(65) >= 0
movetype = I
persistent = 0

[State 4110, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4111


;---Land---
[Statedef 4111]
type = S
physics = S
movetype = I
anim = 4111
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 4111, Pos]
type = posset
trigger1 = 1
y = 0

[State 4111, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4111, Dust]
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

[State 4111, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 4120]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 4120, Pos]
type = posset
trigger1 = 1
y = 0

[State 4120, Hitfall]
type = hitfallset
trigger1 = 1
value = 0

[State 4120, End]
type = selfstate
trigger1 = 1
value = 5000


;======================<SHUNPUU CHOU RASEN>=============================
[Statedef 4200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 4200
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

[State 4200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4200, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 4200, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -3 * const(size.xscale), -16 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4200, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = -3 * const(size.xscale), -16 * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 4200, NHB]
type = nothitby
trigger1 = anim = 4200
trigger2 = anim = 4201 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 4200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 4200
value = 4201

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4201 && animelem = 1
value = 0, 41

[State 4200, Dust]
type = helper
trigger1 = anim = 4201 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4200, Vel]
type = velset
trigger1 = anim = 4201 && animelem = 1
y = -7

[State 4200, slow]
type = veladd
trigger1 = anim = 4201 && animelemtime(21) < 0
y = -const(movement.yaccel) * 0.5

[State 4200, Anim]
type = changeanim
trigger1 = anim = 4201 && numtarget(4201)
trigger1 = animelemtime(21) >= 0 && animelemtime(22) < 0
value = 4202

[State 4200, Turn]
type = turn
trigger1 = anim = 4202 && animelem = 1
trigger1 = p2dist x < 0

[State 4200, Vel]
type = velset
trigger1 = anim = 4202 && animelemtime(23) < 0
y = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4201 && animelem = 1
value = 3, 0
channel = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4202 && (animelem = 2 || animelem = 6 || animelem = 11)
value = 3, ifelse((animelem = 2), 6, ifelse((animelem = 6), 1, 2))
channel = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4202 && animelem = 19
value = 4, 12
channel = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4201 && animelem = 21 && !numtarget(4201)
value = 3, 7
channel = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4202 && (animelem = 2 || animelem = 7 || animelem = 12 || animelem = 19)
value = 1, ifelse((animelem = 12), 6, 3)
;channel = 1
stopongethit = 1

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4201
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
value = 1, 5
;channel = 1
stopongethit = 1

[State 4200, Blur FX]
type = explod
trigger1 = anim = 4201
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
ID = 1290
anim = 1291
postype = p1
pos = 15 * const(size.xscale), -50 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 4200, Blur FX]
type = explod
trigger1 = anim = 4201
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16
ID = 1290
anim = 1290
postype = p1
pos = 15 * const(size.xscale), -40 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 4200, Hit Rising]
type = hitdef
trigger1 = anim = 4201
trigger1 = animelem = 2 || animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -44
hitsound = s2, ifelse(random < 500, 6, 5)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = ifelse(p2bodydist x > 30, 1, 0), (vel y - 0.5) * ifelse(p2dist y < -20, 0.5, 1.0)
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
ID = ifelse((animelem = 18), 4201, 4200)
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 4200, Hit Combo High]
type = hitdef
trigger1 = anim = 4202
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := -85
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
air.velocity = ifelse(p2bodydist x > 30, 1, 0), -3.0
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
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 4200, Hit Combo Low]
type = hitdef
trigger1 = anim = 4202
trigger1 = animelem = 7 || animelem = 12
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 80), map(sparky) := ifelse((animelem = 7), -43, -34)
hitsound = s2, ifelse((animelem = 7), 3, 6)
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 30, 1, 0), -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = ifelse(p2bodydist x > 30, 1, 0), -3.0
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
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 4200, Hit Final]
type = hitdef
trigger1 = anim = 4202
trigger1 = animelem = 21
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := -32
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8, 8
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -8, 8
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
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
p2facing = 1
down.bounce = 1
fall.xvelocity = -3
fall.yvelocity = -5

[State 4200, Pos Fix]
type = posadd
trigger1 = anim = 4201 && animelem = 21
x = 10 * const(size.xscale)
y = -5 * const(size.yscale)

[State 4200, Type]
type = statetypeset
trigger1 = anim = 4201 || anim = 4202
statetype = A
physics = N

[State 4200, Type]
type = veladd
trigger1 = anim = 4201
trigger2 = anim = 4202 && animelemtime(23) >= 0
y = 0.5

[State 4200, Type]
type = statetypeset
trigger1 = anim = 4201
trigger1 = animelem = 22
movetype = I

[State 4200, imageoff]
type = afterimagetime
trigger1 = anim = 4201
trigger1 = animelemtime(22) >= 0
time = 0

[State Idle]
type = statetypeset
trigger1 = anim = 4201
trigger1 = animelem = 21
trigger2 = anim = 4202
trigger2 = animelem = 23
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4209


;---Land---
[Statedef 4209]
type = S
physics = S
movetype = I
anim = 4209
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 4209, Pos]
type = posset
trigger1 = 1
y = 0

[State 4209, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4209, Dust]
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

[State 4209, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<NEKKETSU HADOU KEN>=============================
[Statedef 4300]
type = S
physics = S
movetype = A
anim = 4300
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

[State 4300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4300, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 21
channel = 0

[State 4300, focus]
type = helper
trigger1 = anim = 4300 && animelem = 2
helpertype = normal
stateno = 3004
ID = 3004
name = "Hadouken Charge"
postype = p1
ownpal = 1
supermovetime = 300

[State 4300, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = -19 * const(size.xscale), -63 * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4300, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(map(cfg_superfx), -1, 102)
pos = -19 * const(size.xscale), -63 * const(size.yscale)
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4300, NHB]
type = nothitby
trigger1 = anim = 4300
trigger1 = anim = 4301 && animelemtime(2) < 2
time = 1
value = SCA

[State 4300, Width]
type = width
trigger1 = anim = 4301
trigger1 = animelemtime(2) = -1
value = 29 * const(size.xscale)

[State 4300, Anim]
type = changeanim
trigger1 = anim = 4300
trigger1 = time >= 45
value = 4301

[State 4300, Hadouken]
type = helper
trigger1 = anim = 4301
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 4305
ID = 4305
name = "Nekketsu Hadouken"
postype = p1
pos = 86 * const(size.xscale), -54 * const(size.yscale)
size.xscale = 0.5
size.yscale = 0.5
pausemovetime = 1
supermovetime = cond(numenemy, (p2, pausetime), 60)
ownpal = 1

[State 4300, Dust]
type = explod
trigger1 = anim = 4301 && animelem = 2
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 40 * const(size.xscale), 0
scale = 1, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4300, Sound]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 4, 1
channel = 0

[State 4300, Sound]
type = playsnd
trigger1 = anim = 4301 && animelem = 2
value = 5, 1

[State 4300, End]
type = changestate
trigger1 = anim = 4301
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MODE CHANGE>=============================
[Statedef 4400]
type = S
physics = S
movetype = I
anim = ifelse(map(dark), 4401, 4400)
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

[State 4400, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 4400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4400, Sound]
type = playsnd
trigger1 = time = 3
value = ifelse(anim = 4401, 4, 3), ifelse(anim = 4401, 4, 0)
channel = 0

[State 4400, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ifelse(anim = 4401, 10, -20) * const(size.xscale), ifelse(anim = 4401, -102, -48) * const(size.yscale)
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4400, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ifelse(anim = 4401, 10, -20) * const(size.xscale), ifelse(anim = 4401, -102, -48) * const(size.yscale)
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 4400, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4400, Change Palette]
type = remappal
triggerall = time = 12
trigger1 = palno <= 6 && !map(dark)
trigger2 = palno >= 7 && map(dark)
source = 1, 1
dest = 1, (palno + 100)

[State 4400, Revert Palette]
type = remappal
triggerall = time = 12
trigger1 = palno <= 6 && map(dark)
trigger2 = palno >= 7 && !map(dark)
source = 1, 1
dest = 1, palno

[State 4400, Mode]
type = mapset
trigger1 = time = 12
map = "dark"
value = !map(dark)

[State 4400, Change Name]
type = modifyplayer
trigger1 = time = 12
trigger1 = map(dark)
displayname = "Dark Sakura"
lifebarname = "Dark Sakura"

[State 4400, Revert Name]
type = modifyplayer
trigger1 = time = 12
trigger1 = !map(dark)
displayname = "Sakura"
lifebarname = "Sakura"

[State 4400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
