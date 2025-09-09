; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<MESSATSU GOU HADOU>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000 + 0 * (map(superlevel) := 1)

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
pos = ceil(-21 * const(size.xscale)), ceil(-48 * const(size.yscale))
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
pos = ceil(-21 * const(size.xscale)), ceil(-48 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger2 = anim = 3001 && animelemtime(2) < 1
attr = SCA
slot = 0
time = 1

[State 3000, Width]
type = width
trigger1 = anim = 3001
trigger1 = animelemtime(2) = -1
value = 20, 0

[State 3000, Aura]
type = helper
trigger1 = anim = 3000
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
supermovetime = ifelse(time < 50, 50 - time, 0)
ownpal = 1
persistent = 0

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000
trigger1 = time = 44
value = 3001

[State 3000, Hadouken]
type = helper
trigger1 = anim = 3001
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "Hadouken"
postype = p1
pos = 80, -67
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = anim = 3001
trigger1 = animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 42, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Sound]
type = playsnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 3, 7
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = anim = 3001
trigger1 = animelem = 2
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = anim = 3001
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MESSATSU GOHADO AGYO>=============================
;----- STARTUP -----
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
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
value = 4, 5
channel = 0

[State 3020, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-21 * const(size.xscale)), ceil(-48 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3020, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-21 * const(size.xscale)), ceil(-48 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 3020, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3020, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
supermovetime = ifelse(time < 50, 50 - time, 0)
ownpal = 1
persistent = 0

[State 3020, End]
type = changestate
trigger1 = time >= 45
value = 3021


;----- FIRING -----
[Statedef 3021]
type = S
physics = S
movetype = A
anim = 3021
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3021, NHB]
type = nothitby
trigger1 = time < 6
attr = SCA
slot = 0
time = 1

[State 3000, NHB]
type = nothitby
trigger1 = time < 12
attr = , AP
slot = 1
time = 1

[State 3021, Correct Projectile Trade]
type = nothitby
trigger1 = animelem = 2 || animelem = 4
attr = , AP
slot = 1
time = 1

[State 3021, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 4
helpertype = normal; projectile
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 64, -85
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3021, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 4
helpertype = normal; projectile
stateno = 3025
ID = 3025
name = "Hadouken"
postype = p1
pos = 64, -65
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3021, Aura Particles]
type = explod
trigger1 = 1
ID = 6005
anim = 6005
postype = p1
pos = 40, -60
random = 60, 60
vel = -1, -1
accel = 0, -0.1
sprpriority = sprpriority + 1
removetime = 20
scale = 0.33, 0.33
angle = 15 * (random % 24)
supermovetime = cond(numenemy, (p2, pausetime), 60)

[State 3021, Dust]
type = explod
trigger1 = animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 32, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3021, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 0
channel = 0

[State 3021, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 4
value = 5, 0
channel = 5

[State 3021, End]
type = changestate
trigger1 = animelem = 3
trigger1 = time >= 50
value = 3022


;----- RECOVERY -----
[Statedef 3022]
type = S
physics = S
movetype = I
anim = 3022
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3022, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<TENMA GOU ZANKUU>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
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

[State 3050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

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

[State 3050, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 14
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
pos = ceil(61 * const(size.xscale)), ceil(-51 * const(size.yscale))
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
pos = ceil(61 * const(size.xscale)), ceil(-51 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(8) < 1
time = 1
value = SCA

[State 3050, Width]
type = width
trigger1 = animelem = 7
value = 16

[State 3050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 8
value2 = SCA, AA, AT
time = 1

[State 3050, Hadouken]
type = helper
trigger1 = animelem = 8
helpertype = normal; projectile
stateno = 3055
ID = 3055
name = "Hadouken"
postype = p1
pos = 73, -43
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 8
value = 4, 0
channel = 0

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 8
value = 5, 0

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 1
physics = N

[State 3050, Type]
type = veladd
trigger1 = animelemtime(8) >= 1
y = 0.5

[State 3050, Vel]
type = velset
trigger1 = animelemtime(8) = 1
x = ifelse(map(strength) = 2, -2.0, ifelse(map(strength) = 1, -1.5, -1.0))
y = ifelse(map(strength) = 2, -6.5, ifelse(map(strength) = 1, -7.0, -7.5))

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3053


;---Land---
[Statedef 3053]
type = S
physics = S
movetype = I
anim = 1053
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3053, Pos]
type = posset
trigger1 = 1
y = 0

[State 3053, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3053, Dust]
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

[State 3053, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MAX TENMA GOU ZANKUU>=============================
[Statedef 3070]
type = A
physics = N
movetype = A
anim = 3070
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

[State 3070, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3070, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3070, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 14
channel = 0

[State 3070, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-6 * const(size.xscale)), ceil(-99 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3070, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-6 * const(size.xscale)), ceil(-99 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 3070, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
attr = SCA
slot = 0
time = 1

[State 3070, Correct Projectile Trade]
type = nothitby
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
attr = , AP
slot = 1
time = 1

[State 3070, Hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal; projectile
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 64, -52
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3070, Hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal; projectile
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 56, -44
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3070, Hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal; projectile
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 54, -52
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3070, Hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal; projectile
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 46, -44
size.xscale = 0.30 + (random / 10000.0)
size.yscale = 0.30 + (random / 10000.0)
ownpal = 1

[State 3070, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 3, 0
channel = 0

[State 3070, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 5, 0
;channel = 1
stopongethit = 1

[State 3070, Vel]
type = velmul
trigger1 = animelemtime(5) >= 0 && animelemtime(29) < 0
x = 0.75
y = 0.75

[State 3070, Vel]
type = velset
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
x = -1.5
y = -1.8

[State 3070, Aura Particles]
type = explod
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(31) < 0
ID = 6005
anim = 6005
postype = p1
pos = 40, -60
random = 40, 40
vel = 1, -1
accel = 0, -0.1
sprpriority = sprpriority + 1
removetime = 20
scale = 0.33, 0.33
angle = 15 * (random % 24)
supermovetime = cond(numenemy, (p2, pausetime), 60)

[State 3070, Type]
type = statetypeset
trigger1 = animelemtime(31) >= 0
physics = N

[State 3070, Type]
type = veladd
trigger1 = animelemtime(32) >= 0
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3053


;======================<MESSATSU GOU SHORYUU>=============================
[Statedef 3100]
type = S
physics = N
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000 + 0 * (map(superlevel) := 1)

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

[State 3100, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
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

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 4
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
pos = ceil(14 * const(size.xscale)), ceil(-55 * const(size.yscale))
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
pos = ceil(14 * const(size.xscale)), ceil(-55 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100
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
trigger1 = anim = 3100
trigger1 = animelemtime(28) >= 1
y = 0.704

[State 3100, Vel]
type = velset
trigger1 = anim = 3100
trigger1 = animelem = 2 || animelem = 14 || animelem = 26
x = ifelse(map(strength) = 2, 11.0, ifelse(map(strength) = 1, 9.5, 8.0))

[State 3100, Vel]
type = velset
trigger1 = anim = 3100
trigger1 = animelemtime(28) = 1
y = ifelse(map(strength) = 2, -14.794, ifelse(map(strength) = 1, -13.737, -12.679))

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 16
value = 1, 5
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelem = 28
value = 1, 6
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
value = 3, ifelse((animelem = 4), 1, ifelse((animelem = 16), 9, 11))
channel = 0

[State 3100, Dust]
type = explod
trigger1 = anim = 3100
trigger1 = animelem = 2 || animelem = 14 || animelem = 26
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Blur FX]
type = explod
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
ID = 1190
anim = 1190
postype = p1
pos = 32, -80
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

[State 3100, Sound]
type = playsnd
trigger1 = anim = 3100
trigger1 = animelemtime(28) = 1
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = anim = 3100
trigger1 = animelemtime(28) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Width]
type = width
trigger1 = vel y < 0
edge = const(size.air.front)

[State 3100, Hit Low]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 14
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Medium
fall.animtype = Medium
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 50), map(sparky) := -50
hitsound = s2, 3
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
air.velocity = -0.5 * vel x, -3.0
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit Low 2]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 3 || animelem = 15
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 50), map(sparky) := -75
hitsound = s2, 3
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
air.velocity = -0.5 * vel x, -3.0
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit High]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 16
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
damage = 30, 8
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 50), map(sparky) := -100
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -0.5 * vel x, -3.0
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit Fall]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 26 || animelem = 27
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
damage = 40, 10
dizzypoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 18, 18
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 50), map(sparky) := ifelse((animelem = 27), -75, -50)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -2.0, -8.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -2.0, -8.5
yaccel = 0.4850
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
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit Final]
type = hitdef
trigger1 = animelem = 28 && anim = 3100
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
persistent = 0
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Up
air.animtype = Up
fall.animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 10) * (map(sparkx.max) := 30), map(sparky) := -100
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.0, -8.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4.0, -8.5
yaccel = 0.4850
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

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3100
trigger1 = animelemtime(28) >= 0
trigger1 = statetype != A
statetype = A
physics = N

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
value = 1109


;======================<MESSATSU GOU RASEN>=============================
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000 + 0 * (map(superlevel) := 1)

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

[State 3200, Button]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3200, Button AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

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
value = 4, 4
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
pos = ceil(-32 * const(size.xscale)), ceil(-8 * const(size.yscale))
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
pos = ceil(-32 * const(size.xscale)), ceil(-8 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200 && animelemtime(9) < 0
attr = SCA
slot = 0
time = 1
ignorehitpause = 1

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200 && animelemtime(9) >= 0
trigger2 = anim = 3201 && animelemtime(3) < 0
attr = A
slot = 0
time = 1
ignorehitpause = 1

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3200
trigger1 = animelem = 7
value = 3, 6
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3201 && animelem = 55
trigger1 = (movecontact + movereversed) = [1, 8]
value = 3, 7
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3201
value = 5, 13
persistent = 0

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3200
trigger1 = animelem = 8
value = 0, 41

[State 3200, Dust]
type = helper
trigger1 = anim = 3200
trigger1 = animelem = 8
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3200, Vel]
type = velset
trigger1 = anim = 3200
trigger1 = animelem = 10
x = ifelse(command = "holdfwd", 1.25, ifelse(command = "holdback", -1.25, 0))
y = ifelse(map(strength) = 2, -6.0, ifelse(map(strength) = 1, -4.5, -3.0))

[State 3200, Vel]
type = velset
trigger1 = anim = 3201 && vel y > 0
y = 0

[State 3200, Accel]
type = veladd
trigger1 = anim = 3201 && vel y < 0
y = ifelse(map(strength) = 2, 0.100, ifelse(map(strength) = 1, 0.075, 0.050))

[State 3200, Control Vel]
type = veladd
trigger1 = !AIlevel
trigger1 = vel y < 0
trigger1 = anim = 3201
trigger1 = command = "holdfwd" || command = "holdback"
x = ifelse(command = "holdfwd", 0.0625, ifelse(command = "holdback", -0.0625, 0))

[State 3200, Control Vel AI]
type = veladd
trigger1 = AIlevel
trigger1 = vel y < 0
trigger1 = anim = 3201
x = ifelse(movehit = [1, 12], 0.0625, -0.0625)

[State 3200, Control Vel Limit]
type = velset
trigger1 = anim = 3201 && vel y < 0
trigger1 = abs(vel x) > 1.25
x = ifelse(vel x < 0, -1.25, 1.25)

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3200
trigger1 = animelemtime(8) > 0
statetype = A
physics = N

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200
trigger1 = !animtime
value = 3201

[State 3200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 3201
value = 3205
persistent = 0

[State 3200, Blur FX]
type = explod
trigger1 = anim = 3201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 56
ID = 1290
anim = 1291
postype = p1
pos = 0, -80
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3200, Blur FX]
type = explod
trigger1 = anim = 3201
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28 || animelem = 34 || animelem = 40 || animelem = 46
ID = 1290
anim = 1290
postype = p1
pos = 0, -60
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = N

[State 3200, Type]
type = veladd
trigger1 = anim = 3205
y = 0.5

[State 3200, Sound]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55
value = 1, 5
;channel = 1
stopongethit = 1

[State 3200, Hit First]
type = hitdef
trigger1 = anim = 3200
trigger1 = animelem = 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 11)
attr = A, HA
damage = 50, 13
dizzypoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 16, 16
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 15) * (map(sparkx.max) := 35), map(sparky) := -62
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 15, 2, 0), -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = ifelse(p2bodydist x > 15, 2, 0), -7.5
yaccel = 0.4850
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
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3200, Hit Rising]
type = hitdef
trigger1 = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 11)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -69
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 24, 1.5, 0), -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = ifelse(p2bodydist x > 24, 1.5, 0), (vel y - 0.75)
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State 3200, Hit Behind]
type = hitdef
trigger1 = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 11)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -55) * (map(sparkx.max) := -20), map(sparky) := -69
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 6, -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 6, -7.5
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State 3200, Hit Final]
type = hitdef
trigger1 = anim = 3201
trigger1 = animelem = 56
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 40, 10
dizzypoints = 0
animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 24, 24
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -70
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -7.5, -3
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -7.5, -3
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259


;======================<MESSATSU GOU SENPUU>=============================
[Statedef 3250]
type = A
physics = N
movetype = A
anim = 3250
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

[State 3250, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3250, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3250, Button AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

[State 3250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3250, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 4
channel = 0

[State 3250, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-34 * const(size.xscale)), ceil(-63 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3250, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-34 * const(size.xscale)), ceil(-63 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3250, NHB]
type = nothitby
trigger1 = anim = 3250
trigger2 = anim = 3251 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3250, Sound]
type = playsnd
trigger1 = anim = 3250 && animelem = 4
value = 3, 6
channel = 0

[State 3250, Sound]
type = playsnd
trigger1 = anim = 3251 && animelem = 61
trigger1 = (movecontact + movereversed) = [1, 8]
value = 3, 7
channel = 0

[State 3250, Sound]
type = playsnd
trigger1 = anim = 3251
value = 5, 13
persistent = 0

[State 3250, Vel]
type = velset
trigger1 = anim = 3250
x = 0
y = 0

[State 3250, Vel]
type = velset
trigger1 = anim = 3251
trigger1 = animelemtime(15) < 0
trigger1 = pos y < -10
y = ifelse(animelemtime(9) < 0, 0.33, 0.1)

[State 3250, Vel]
type = velset
trigger1 = anim = 3251 && animelem = 15
x = 0
y = ifelse(map(strength) = 2, -4, ifelse(map(strength) = 1, -3, -2))

[State 3250, Accel]
type = veladd
trigger1 = anim = 3251 && animelemtime(15) >= 0 && vel y < 0
y = ifelse(map(strength) = 2, 0.05, ifelse(map(strength) = 1, 0.0375, 0.025))

[State 3250, ctrlvel]
type = veladd
triggerall = !AIlevel
triggerall = anim = 3251 && vel y < 0
trigger1 = command = "holdfwd" && vel x < 1.25
trigger2 = command = "holdback" && vel x > -1.25
x = ifelse(command = "holdfwd", 0.0625, ifelse(command = "holdback", -0.0625, 0))

[State 3250, ctrlvelAI]
type = veladd
trigger1 = AIlevel
trigger1 = anim = 3251 && vel y < 0
trigger1 = p2bodydist x > 35 && vel x < 1.25
x = 0.0625

[State 3250, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 3250
value = 3251

[State 3250, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 3251
value = 3205

[State 3250, Blur FX]
type = explod
trigger1 = anim = 3251
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55 || animelem = 62
ID = 1290
anim = 1291
postype = p1
pos = 0, -80
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3250, Blur FX]
type = explod
trigger1 = anim = 3251
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28 || animelem = 34 || animelem = 40 || animelem = 46 || animelem = 52
ID = 1290
anim = 1290
postype = p1
pos = 0, -60
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 3250, Type]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = N

[State 3250, Type]
type = veladd
trigger1 = anim = 3205
y = 0.5

[State 3250, Sound]
type = playsnd
triggerall = anim = 3251
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
trigger2 = animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55 || animelem = 61
value = 1, 5
;channel = 1
stopongethit = 1

[State 3250, Hit Rising]
type = hitdef
trigger1 = anim = 3251
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50 || animelem = 56
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 19)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -69
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2bodydist x > 24, 1.5, 0), -6.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = ifelse(p2bodydist x > 24, 1.5, 0), (vel y - 1.25)
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State 3250, Hit Behind]
type = hitdef
trigger1 = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47 || animelem = 53
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 19)
attr = A, HA
damage = 20, 5
dizzypoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -55) * (map(sparkx.max) := -20), map(sparky) := -69
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 6, -6.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = 6, -6.5
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State 3250, Hit Final]
type = hitdef
trigger1 = anim = 3251
trigger1 = animelem = 62
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 30, 8
dizzypoints = 0
animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 24, 24
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 65), map(sparky) := -70
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -7.5, -3
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -7.5, -3
yaccel = 0.4850
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
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259


;======================<TENMA SHINZUI WARI>=============================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
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

[State 3300, Combo Position]
type = posadd
trigger1 = !time
trigger1 = (prevstateno = [1200, 1250]) || (prevstateno = [3200, 3250])
y = -24

[State 3300, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 14
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(5 * const(size.xscale)), ceil(-45 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(5 * const(size.xscale)), ceil(-45 * const(size.yscale))
sound = s0, 8500
p2defmul = 1
darken = !map(cfg_superfx)

[State 3300, NHB]
type = nothitby
trigger1 = anim = 3300 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3300, Trail]
type = helper
trigger1 = anim = 3300
trigger1 = animelem = 2
helpertype = normal
stateno = 3305
ID = 33050
name = "Tenma trail"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3300
trigger1 = animelem = 2
anim = 3306
ID = 3306
sprpriority = sprpriority + 1
postype = p1
ownpal = 1

[State 3300, Vel]
type = velset
trigger1 = anim = 3300 && animelem = 2
x = 12
y = 12

[State 3300, Sound]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 3, 7
channel = 0

[State 3300, Sound]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 5, 22

[State 3300, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 3300
attr = A, HA
damage = 140, 35
dizzypoints = 0
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 50), map(sparky) := -15
hitsound = s2, 11
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
animtype = Diagup
fall.animtype = Diagup
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = 0, -10
yaccel = 0.4850
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = map(palfx1_r), map(palfx1_g), map(palfx1_b)
fall = 1
fall.recover = 0
down.recover = 1
airguard.ctrltime = 1 + 16
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3300
trigger1 = animelemtime(2) > 0
trigger1 = pos y > -vel y
value = 3301
persistent = 0

[State 3300, Type]
type = statetypeset
trigger1 = anim = 3301
statetype = S
physics = N

[State 3300, Type]
type = velmul
trigger1 = anim = 3301
x = 0.8

[State 3300, Stop]
type = posset
trigger1 = anim = 3301
y = 0

[State 3300, Stop]
type = velset
trigger1 = anim = 3301
y = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && vel x > 1 && !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 42, 0
vel = -1, 0
ownpal = 1
scale = 0.5, 0.5
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Sound]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 0, 52

[State 3300, Sound]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 5, 14

[State 3300, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 3301
value = 0
ctrl = 1


;======================<SHUN GOKU SATSU>=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
facep2 = 1
poweradd = -3000 + 0 * (map(superlevel) := 3)
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
value = 4, 13
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
pos = ceil(14 * const(size.xscale)), ceil(-104 * const(size.yscale))
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
pos = ceil(14 * const(size.xscale)), ceil(-104 * const(size.yscale))
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4000, NHB]
type = nothitby
trigger1 = animelemtime(2) < 8
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
x = 8

[State 4000, Vel]
type = velset
trigger1 = animelem = 3
x = 0

[State 4000, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 6
persistent = 0

[State 4000, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
attr = S, HT
hitflag =

[State 4000, Hit]
type = hitdef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 17
ID = 4000
attr = S, HT
hitflag = M
priority = 7, Miss
numhits = 0
sparkno = -1 + 0 * (map(sparkno) := 0)
hitsound = s2, 800
hitsound.channel = 2
p1facing = 1
p1stateno = 4010
p2stateno = 4020
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30

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
sprpriority = 2

[State 4010, Throw]
type = targetstate
trigger1 = !time
value = 4020

[State 4010, Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4010, Sound]
type = playsnd
trigger1 = time = 10
value = 4, 10
channel = 0

[State 4010, Sound]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4010, SFV Snd]
type = playsnd
trigger1 = time = 130
value = 5, 19

[State 4010, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(34) < 0
time = 2
movetime = 2

[State 4010, Pause]
type = pause
trigger1 = animelemtime(34) = 0
time = 0

[State 4010, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4010, NHB]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1

[State 4010, Image Off]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4010, Fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120

[State 4010, Black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < -1
time = 2
value = 0, 0, 0

[State 4010, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 4010, Zoom]
type = zoom
trigger1 = animelemtime(35) < 0
trigger1 = numtarget(4000)
scale = 1.20 / camerazoom
pos = (pos x + target(4000), pos x) / 2.0 * camerazoom, 0
camerabound = 0
stagebound = 1
lag = 0.90

[State 4010, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1

[State 4010, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 4010, Hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 1

[State 4010, Damage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = floor(-17 * map(damagescaling))
dizzy = 0
kill = animelem = 34

[State 4010, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 11

[State 4010, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 2, ifelse((animelem = 34), 10, 3)
channel = 2

;[State 4010, Spark]
;in ZSS

[State 4010, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
time = 6
freq = 180
ampl = 2

[State 4010, Kanji]
type = explod
trigger1 = animelem = 35
anim = 6013
ID = 6013
sprpriority = 2
postype = p1
facing = ifelse(facing = -1, -1, 1)
pos = ifelse(facing = -1, 34, 0)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4010, Sound]
type = playsnd
trigger1 = animelemtime(35) = 10
value = 4, 9
channel = 0

[State 4010, Throw]
type = targetstate
trigger1 = animelemtime(34) >= 0
trigger1 = numtarget(4000)
ID = 4000
value = 4021
persistent = 0

[State 4010, Assert]
type = assertspecial
trigger1 = animelemtime(34) >= 0 && animelemtime(35) <= 0
flag = nokoslow

[State 4010, Sound]
type = playsnd
trigger1 = animelem = 35 && !winko
value = 5, 5

[State 4010, Shake]
type = envshake
trigger1 = !winko
trigger1 = animelemtime(35) = 0 || animelemtime(35) = 8 || animelemtime(35) = 16
time = 8
freq = 180
ampl = ifelse(animelemtime(35) = 16, 1, ifelse(animelemtime(35) = 8, 2, 3))

[State 4010, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = animelem = 35
trigger1 = !winko
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = 45, 0
ownpal = 1

[State 1351, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = animelem = 35
trigger1 = !winko
anim = F 62
postype = p1
pos = 45, 0
sprpriority = -10
ownpal = 1

[State 4010, End]
type = changestate
trigger1 = animelemtime(35) >= 0 && animelemtime(36) < 0 && winko
value = 4090

[State 4010, End]
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

[State 4020, Anim]
type = changeanim2
trigger1 = !time
value = 4020

[State 4020, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 4021]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 4021, Anim]
type = changeanim2
trigger1 = !time
value = 4021

[State 4021, End]
type = selfstate
trigger1 = !alive
value = 5150

[State 4021, End]
type = selfstate
trigger1 = alive
trigger1 = time >= 120
value = 5120


;======================<MISOGI>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
facep2 = 1
poweradd = -3000 + 0 * (map(superlevel) := 3)
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
value = 4, 3
channel = 0

[State 4100, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-45 * const(size.yscale))
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
pos = ceil(-5 * const(size.xscale)), ceil(-45 * const(size.yscale))
sound = s0, 8520
p2defmul = 1
darken = !map(cfg_superfx)

[State 4100, NHB]
type = nothitby
trigger1 = anim = 4100
time = 1
value = SCA

[State 4100, Illusion Fade]
type = explod
trigger1 = anim = 4100
trigger1 = time = 42
anim = 4112
ID = 4112
sprpriority = 2
postype = p1
pos = 0, 0
ownpal = 1
removetime = 30
pausemovetime = 300
supermovetime = 300
trans = addalpha
alpha = 256, 0
interpolation.time = 30
interpolation.alpha = 0, 256

[State 4100, Illusion Purple]
type = explod
trigger1 = anim = 4100
trigger1 = time = 42
anim = 4110
ID = 4110
sprpriority = 1
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 300
supermovetime = 300

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4100
trigger1 = time = 43
value = 4101

[State 4100, Type]
type = statetypeset
trigger1 = anim != 4101
statetype = S
physics = S

[State 4100, Type]
type = statetypeset
trigger1 = anim = 4101
statetype = A
physics = N

[State 4100, Push]
type = playerpush
trigger1 = anim = 4101
trigger2 = movehit
trigger2 = numtarget
value = 0
ignorehitpause = 1

[State 4100, Sprpriority]
type = sprpriority
trigger1 = anim != 4100
value = -1

[State 4100, Teleport]
type = posadd
trigger1 = anim = 4101
trigger1 = animelem = 1
x = p2dist x - 10
y = p2dist y - 180

[State 4100, Sound]
type = playsnd
trigger1 = anim = 4101
trigger1 = animelem = 1
value = 5, 9
persistent = 0

[State 4100, Vel]
type = velset
trigger1 = anim = 4101
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 4100, Accel]
type = veladd
trigger1 = anim = 4101
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 4100, Vel]
type = velset
trigger1 = anim = 4101
trigger1 = animelem = 2
y = 15

[State 4100, Hit when Close]
type = changeanim
triggerall = anim = 4101
triggerall = animelemtime(3) < 0
trigger1 = p2dist y < (p2, const(size.height) + 20)
trigger1 = animelemtime(2) > 2
trigger2 = pos y >= -32
trigger2 = animelemtime(1) > 0
value = 4101
elem = 3

[State 4100, Eye]
type = explod
trigger1 = anim = 4101
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
ID = 4111
anim = 8060
postype = p1
pos = -13 * const(size.xscale), -78 * const(size.yscale) - vel y
sprpriority = sprpriority + 1
removetime = 16
trans = addalpha
alpha = 256, 256
scale = 0.025, 0.025 * abs(vel y)
palfx.time = 4
palfx.color = 0
palfx.mul = 256, 0, 0
interpolation.time = 4
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 4100, Particles]
type = explod
trigger1 = anim = 4101
trigger1 = animelemtime(2) >= 0
ID = 4111
anim = 4111
sprpriority = -2
postype = p1
pos = 0, -60
vel = 0, -4
random = 40, 20
facing = -1 + (random < 500) * 2
scale = 0.25, 0.25
ownpal = 1

[State 4100, Hit]
type = hitdef
trigger1 = anim = 4101
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
attr = A, HA
damage = 420, 70
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = H
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 30
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 15), map(sparky) := -30
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
air.type = High
ground.slidetime = 12
ground.hittime = 1 + 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 10
air.velocity = 0, 20
yaccel = 0.4850
guard.velocity = -4.49
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 30; unique
envshake.freq = 180
envshake.ampl = 8
envshake.mul = 0.8
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sprpriority = -1
ID = 4100
airguard.ctrltime = 1 + 16
airguard.velocity = ifelse(map(customcombo), -4, -8), -1.5
p1sprpriority = sprpriority
forcestand = 1
palfx.mul = 256, 256, 256
palfx.time = 1

[State 4100, P2 State]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(4100)
trigger1 = target(4100), stateno = 5000 || target(4100), stateno = 5010
value = 4120
ID = 4100
ignorehitpause = 1

[State 4100, P2 State]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(4100)
trigger1 = target(4100), stateno = 5020
value = 4125
ID = 4100
ignorehitpause = 1

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4101
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = ifelse(movehit, 4102, 4103)

[State 4100, Stop]
type = posset
trigger1 = anim = [4102, 4103]
y = 0

[State 4100, Stop]
type = velset
trigger1 = anim = [4102, 4103]
y = 0

[State 4100, Shake]
type = envshake
trigger1 = animelem = 1
trigger1 = anim = 4102 || anim = 4103
trigger1 = envshakevar(time) = 0
time = 12
freq = 180
ampl = 4
mul = 0.8

[State 4100, Sound]
type = playsnd
trigger1 = anim = 4102
trigger1 = animelem = 1
value = 5, 7

[State 4100, fire]
type = explod
trigger1 = anim = 4102
trigger1 = animelem = 1
anim = 4105
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Sound]
type = playsnd
trigger1 = anim = 4103
trigger1 = animelem = 1
value = 5, 10

[State 4100, Fire]
type = explod
trigger1 = anim = 4103
trigger1 = animelem = 1
anim = 4106
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Small Dust]
type = explod
trigger1 = animelem = 1
trigger1 = anim = 4102 || anim = 4103
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4100, Large Dust Back]
type = explod
trigger1 = anim = 4102
trigger1 = animelemtime(1) = 13
anim = 7107
ID = 7107
sprpriority = -5
trans = addalpha
alpha = 64, 256
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Large Dust Front]
type = explod
trigger1 = anim = 4102
trigger1 = animelemtime(1) = 13
anim = 7107
ID = 7107
sprpriority = 5
trans = addalpha
alpha = 192, 256
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Particles]
type = explod
trigger1 = anim = 4102
trigger1 = animelemtime(1) >= 5 && animelemtime(1) < 17
vel = 5 + (random / 100.0), 2 + (random / 500.0)
accel = -0.4, -0.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 20
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.05
angle = 30 * (random % 12)

[State 4100, Particles]
type = explod
trigger1 = anim = 4102
trigger1 = animelemtime(1) >= 5 && animelemtime(1) < 17
vel = -5 - (random / 100.0), 2 + (random / 500.0)
accel = 0.4, -0.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 20
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.05
angle = 30 * (random % 12)

[State 4100, Sound]
type = playsnd
trigger1 = anim = 4102
trigger1 = animelem = 1
value = 4, 11
channel = 0

[State Idle]
type = statetypeset
trigger1 = anim = 4102 
trigger2 = anim = 4103
movetype = I

[State 4100, End]
type = changestate
trigger1 = winko
trigger1 = anim = 4102
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
value = 4190

[State 4100, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = [4102, 4103]
value = 0
ctrl = 1


;----- TARGET STANDING -----
[Statedef 4120]
type = S
physics = C
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4120, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4120, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5950)
value = 5950

[State 4120, Anim]
type = changeanim2
trigger1 = !time
trigger1 = !selfanimexist(5950)
value = 4120

[State 4120, Stop]
type = posset
trigger1 = 1
y = 0

[State 4120, Dust]
type = explod
trigger1 = anim = 4120 && animelem = 7
trigger2 = anim = 5950 && animtime = -4
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 4120, Sound]
type = playsnd
trigger1 = anim = 4120 && animelem = 7
trigger2 = anim = 5950 && animtime = -4
value = F 7, 0

[State 4120, Type]
type = statetypeset
trigger1 = time = 60
statetype = L

[State 4120, Anim]
type = changeanim
trigger1 = time >= 110 && selfanimexist(5111)
value = 5111

[State 4120, End]
type = selfstate
trigger1 = time >= 110
value = ifelse(alive, 5120, 5150)


;----- TARGET MID-AIR -----
[Statedef 4125]
type = A
physics = N
movetype = H
ctrl = 0
velset = gethitvar(xvel), gethitvar(yvel)
sprpriority = 2

[State 4125, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4125, Anim]
type = changeanim2
trigger1 = !time
value = 4125

[State 4125, Accel]
type = veladd
trigger1 = animelemtime(5) < 0
y = 0.4850; yaccel

[State 4125, Stop]
type = posset
trigger1 = pos y > 0
y = 0

[State 4125, Stop]
type = velset
trigger1 = pos y >= 0
y = 0

[State 4125, Type]
type = statetypeset
trigger1 = pos y >= 0
statetype = L
physics = C

[State 4125, Anim]
type = changeanim2
trigger1 = pos y >= 0
value = 4125
elem = 5
persistent = 0

[State 4125, Dust]
type = explod
trigger1 = animelem = 5
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = 10

[State 4125, Sound]
type = playsnd
trigger1 = animelem = 5
value = F 7, 2

[State 4125, End]
type = selfstate
trigger1 = animelemtime(7) >= 110
value = ifelse(alive, 5120, 5150)


;======================<KONGOU KOKURETSU ZAN>=============================
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 4200
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1
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
value = 3, 5
channel = 0

[State 4200, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-18 * const(size.xscale)), ceil(-126 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4200, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-18 * const(size.xscale)), ceil(-126 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 4200, NHB]
type = nothitby
trigger1 = animelemtime(16) < 0
time = 1
value = SCA

[State 4200, Push]
type = playerpush
trigger1 = animelemtime(17) < 0
value = 0
ignorehitpause = 1

[State 4200, Aura]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 4203
ID = 4203
name = "KKZ Aura"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
supermovetime = cond(numenemy, (p2, pausetime), 60)

[State 4200, Shake]
type = envshake
trigger1 = animelemtime(15) = 0
time = 32
freq = 180
ampl = 6
mul = 0.85

[State 4200, Sound]
type = playsnd
trigger1 = animelem = 12
value = 4, 6
channel = 0

[State 4200, Sound]
type = playsnd
trigger1 = animelem = 15
value = 5, 15

[State 4200, KKZ]
type = helper
trigger1 = animelemtime(15) = 0
helpertype = normal; projectile
stateno = 4205
ID = 4205
name = "KKZ Center"
postype = p1
pos = -4, 8
size.xscale = 0.5
size.yscale = ifelse((screenpos y / camerazoom) <= 456, 0.5, 0.5 + ((screenpos y / camerazoom) - 456) / 456.0)
ownpal = 1

[State 4200, KKZ]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal; projectile
stateno = 4206
ID = 4206
name = "KKZ Side"
postype = p1
pos = 0, 0
facing = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 4200, KKZ]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal; projectile
stateno = 4206
ID = 4206
name = "KKZ Side"
postype = p1
pos = 0, 0
facing = -1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 4200, Shockwave Back]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
postype = p1
sprpriority = -3
scale = 0.5, 0.5
trans = addalpha
alpha = 192, 256
ownpal = 1

[State 4200, Shockwave Back]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
postype = p1
facing = -1
sprpriority = -3
scale = 0.5, 0.5
trans = addalpha
alpha = 192, 256
ownpal = 1

[State 4200, Dust]
type = helper
trigger1 = animelemtime(15) = 1
helpertype = normal
stateno = 4210
ID = 4210
name = "Ground Impact"
postype = p1
pos = -8, 0
ownpal = 1

[State 4210, FX - Circle]
type = explod
trigger1 = animelem = 15
anim = 4211
ID = 4211
postype = p1
pos = -4, 8
xangle = 80
projection = perspective2
sprpriority = -10

[State 4210, FX - Ten]
type = explod
trigger1 = animelem = 15
anim = 4212
ID = 4212
postype = p1
pos = -4, 12
facing = facing
xangle = 75
projection = perspective2
sprpriority = -10

;[State 4200, Image Off]
;type = afterimagetime
;trigger1 = animelemtime(17) >= 0
;time = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I
persistent = 0

[State 4200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<TENSHOU KAIREKI JIN>=============================
[Statedef 4300]
type = S
physics = S
movetype = A
anim = 4300
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
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
value = 4, 4
channel = 0

[State 4300, Super Pause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-17 * const(size.xscale)), ceil(-5 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4300, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-17 * const(size.xscale)), ceil(-5 * const(size.yscale))
sound = s0, 8510
p2defmul = 1
darken = !map(cfg_superfx)

[State 4300, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 4300, Push]
type = playerpush
trigger1 = animelemtime(6) >= 0
trigger1 = animelemtime(7) < 0
value = 0

[State 4300, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 7
channel = 0

[State 4300, Vel]
type = posadd
trigger1 = animelemtime(6) = 1
x = 0
y = -180

[State 4300, Blur]
type = explod
trigger1 = animelemtime(6) >= 0
trigger1 = animelemtime(7) = -7
anim = 4303
ID = 4303
sprpriority = 3
postype = p1
pos = 0, 0
bindtime = 1
removeongethit = 1
ownpal = 1

[State 4300, Particles]
type = explod
trigger1 = animelemtime(6) >= 1
trigger1 = animelemtime(7) < 0
vel = 0, -4
anim = 4111
sprpriority = -2
postype = p1
pos = 15, abs(pos y / 2)
random = 80, abs(pos y)
facing = -1 + (random < 500) * 2
scale = 0.25, 0.25
ownpal = 1

[State 4300, Vel]
type = velset
trigger1 = animelem = 7
x = 0
y = -2

[State 4300, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 18

[State 4300, FX]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile
stateno = 4305
ID = 4305
name = "Tenshou Kaireki Jin"
postype = p1
pos = 40, -ceil(pos y)
supermovetime = cond(numenemy, (p2, pausetime), 60)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 4300, Dust]
type = explod
trigger1 = animelem = 6
anim = 7106
sprpriority = 3
postype = p1
pos = 0, -ceil(pos y)
facing = 1
ownpal = 1

[State 4300, Type]
type = statetypeset
trigger1 = animelem = 6
statetype = A
physics = N

[State 4300, Type]
type = veladd
trigger1 = animelemtime(8) >= 0
y = 0.5

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I
persistent = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259
