; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<HADOU KEN>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 50 * map(meterscaling)
sprpriority = 2
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
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1000, Faster]
type = changeanim
trigger1 = map(dark)
trigger1 = animelemtime(10) < 0
trigger1 = time = 7
value = 1000
elem = 10

[State 1000, Hadou Var]
type = mapset
trigger1 = animelemtime(4) < 0
trigger2 = map(dark)
map = "hadoucharge"
value = 0

[State 1000, Hadou Var]
type = mapadd
triggerall = map(hadoucharge) < 2
triggerall = animelemtime(2) >= 0 && animelemtime(10) < 0
trigger1 = map(strength) = 0 && command = "x"
trigger2 = map(strength) = 1 && command = "y"
trigger3 = map(strength) = 2 && command = "z"
map = "hadoucharge"
value = 1

[State 1000, Hadou Var]
type = mapset
triggerall = animelem = 4
trigger1 = map(strength) = 0 && command = "/x"
trigger2 = map(strength) = 1 && command = "/y"
trigger3 = map(strength) = 2 && command = "/z"
trigger4 = AIlevel
trigger4 = p2, vel y < 0 || random < 250
map = "hadoucharge"
value = 1

[State 1000, Hadou Var]
type = mapset
triggerall = animelem = 7
trigger1 = map(strength) = 0 && command = "/x"
trigger2 = map(strength) = 1 && command = "/y"
trigger3 = map(strength) = 2 && command = "/z"
trigger4 = AIlevel
trigger4 = p2, vel y < 0 || random < 250
map = "hadoucharge"
value = 2

[State 1000, Anim]
type = changeanim
trigger1 = map(dark)
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
value = 1000
elem = 10

[State 1000, Anim]
type = changeanim
trigger1 = !map(dark)
trigger1 = map(hadoucharge) = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
value = 1000
elem = 4

[State 1000, Anim]
type = changeanim
trigger1 = !map(dark)
trigger1 = map(hadoucharge) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
value = 1000
elem = 7

[State 1000, Anim]
type = changeanim
triggerall = !map(dark)
trigger1 = map(hadoucharge) != 1
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = map(hadoucharge) != 2
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0
trigger3 = AIlevel
trigger3 = inguarddist
trigger3 = animelemtime(2) >= 0 && animelemtime(10) < 0
value = 1000
elem = 10

[State 1000, Width]
type = width
trigger1 = animelemtime(11) = -1
value = ceil(26 * const(size.xscale))

[State 1000, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0 && !numhelper(1002)
helpertype = normal
stateno = 1002
ID = 1002
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 11
value2 = SCA, AA, AT
time = 1

[State 1000, Hadouken]
type = helper
trigger1 = animelem = 11
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = ceil(86 * const(size.xscale)), -54
size.xscale = 0.5;ifelse(map(dark), 0.38, ifelse(map(hadoucharge) = 2, 0.5, ifelse(map(hadoucharge) = 1, 0.44, 0.33)))
size.yscale = 0.5;ifelse(map(dark), 0.25, ifelse(map(hadoucharge) = 2, 0.5, ifelse(map(hadoucharge) = 1, 0.33, 0.17)))
ownpal = 1

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 10
value = 4, 0
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 1000, Sound]
type = playsnd
trigger1 = animelem = 11
value = 5, ifelse(map(dark), 0, 6)

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX HADOUKEN>=============================
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1010
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1010, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1010, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1010, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1010, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-19 * const(size.xscale)), ceil(-63 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, Width]
type = width
trigger1 = anim = 1010 && animelemtime(5) = -1
value = ceil(30 * const(size.xscale))

[State 1010, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0 && !numhelper(1002)
helpertype = normal
stateno = 1002
ID = 1002
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1010, Correct Projectile Trade]
type = hitby
trigger1 = anim = 1010 && animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1010, Hadoushou]
type = helper
trigger1 = anim = 1010 && animelem = 5
helpertype = normal; projectile
stateno = 1015
ID = 1015
name = "Hadoushou"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, Sound]
type = playsnd
trigger1 = anim = 1010 && animelem = 5
value = 3, 5
channel = 0
freqmul = 0.98 + (random / 25000.0)

[State 1010, Sound]
type = playsnd
trigger1 = anim = 1010
trigger1 = animelem = 5
value = 5, 1

[State 1010, End]
type = changeanim
triggerall = time >= 29
triggerall = anim = 1010 && animelemtime(5) >= 0
trigger1 = !numhelper(1015)
trigger2 = numhelper(1015)
trigger2 = helper(1015), animelemtime(13) >= 0
trigger3 = time >= 60
value = 1011

[State 1010, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 1011
value = 0
ctrl = 1


;======================<TENGYOU HADOU KEN>=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
poweradd = 50 * map(meterscaling)
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

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
value = ifelse((p2movetype = H || random < 500), 2, ifelse(random < 500, 1, 0))
ignorehitpause = 1

[State 1020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1020, Hadou Var]
type = mapset
trigger1 = animelemtime(4) < 0
trigger2 = map(dark)
map = "hadoucharge"
value = 0

[State 1020, Hadou Var]
type = mapadd
triggerall = map(hadoucharge) < 2
triggerall = animelemtime(2) >= 0 && animelemtime(10) < 0
trigger1 = map(strength) = 0 && command = "x"
trigger2 = map(strength) = 1 && command = "y"
trigger3 = map(strength) = 2 && command = "z"
map = "hadoucharge"
value = 1

[State 1020, Hadou Var]
type = mapset
triggerall = animelem = 4
trigger1 = map(strength) = 0 && command = "/x"
trigger2 = map(strength) = 1 && command = "/y"
trigger3 = map(strength) = 2 && command = "/z"
trigger4 = AIlevel
trigger4 = p2, vel y < 0 || random < 250
map = "hadoucharge"
value = 1

[State 1020, Hadou Var]
type = mapset
triggerall = animelem = 7
trigger1 = map(strength) = 0 && command = "/x"
trigger2 = map(strength) = 1 && command = "/y"
trigger3 = map(strength) = 2 && command = "/z"
trigger4 = AIlevel
trigger4 = p2, vel y < 0 || random < 250
map = "hadoucharge"
value = 2

[State 1020, Anim]
type = changeanim
trigger1 = map(dark)
trigger1 = animelemtime(4) >= 0 && animelemtime(10) < 0
value = 1020
elem = 10

[State 1020, Anim]
type = changeanim
trigger1 = !map(dark)
trigger1 = map(hadoucharge) = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(4) < 0
value = 1020
elem = 4

[State 1020, Anim]
type = changeanim
trigger1 = !map(dark)
trigger1 = map(hadoucharge) = 2
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
value = 1020
elem = 7

[State 1020, Anim]
type = changeanim
triggerall = !map(dark)
trigger1 = map(hadoucharge) != 1
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = map(hadoucharge) != 2
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0
trigger3 = AIlevel
trigger3 = inguarddist
trigger3 = animelemtime(2) >= 0 && animelemtime(10) < 0
value = 1020
elem = 10

[State 1020, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0 && !numhelper(1024)
helpertype = normal
stateno = 1024
ID = 1024
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 11
value2 = SCA, AA, AT
time = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 11
helpertype = normal; projectile
stateno = 1005
ID = 1025
name = "Hadouken"
postype = p1
pos = ceil(58 * const(size.xscale)), -105
size.xscale = 0.5;ifelse(map(dark), 0.38, ifelse(map(hadoucharge) = 2, 0.5, ifelse(map(hadoucharge) = 1, 0.44, 0.33)))
size.yscale = 0.5;ifelse(map(dark), 0.25, ifelse(map(hadoucharge) = 2, 0.5, ifelse(map(hadoucharge) = 1, 0.33, 0.17)))
ownpal = 1

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 10
value = 4, 0
channel = 0

[State 1020, Sound]
type = playsnd
trigger1 = animelem = 11
value = 5, ifelse(map(dark), 0, 6)

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX TENGYOU HADOUKEN>=============================
[Statedef 1030]
type = S
physics = S
movetype = A
anim = 1030
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 2
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

[State 1030, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1030, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1030, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-8 * const(size.xscale)), ceil(-57 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, focus]
type = helper
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0 && !numhelper(1024)
helpertype = normal
stateno = 1024
ID = 1024
name = "Hadouken Charge"
postype = p1
ownpal = 1

[State 1030, Correct Projectile Trade]
type = hitby
trigger1 = anim = 1030 && animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1030, Hadoushou]
type = helper
trigger1 = anim = 1030 && animelem = 5
helpertype = normal; projectile
stateno = 1015
ID = 1035
name = "Hadoushou"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1030, Sound]
type = playsnd
trigger1 = anim = 1030 && animelem = 5
value = 3, 5
channel = 0

[State 1030, Sound]
type = playsnd
trigger1 = anim = 1030
trigger1 = animelem = 5
value = 5, 1

[State 1030, End]
type = changeanim
triggerall = time >= 29
triggerall = anim = 1030 && animelemtime(5) >= 0
trigger1 = !numhelper(1035)
trigger2 = numhelper(1035)
trigger2 = helper(1035), animelemtime(13) >= 0
trigger3 = time >= 60
value = 1031

[State 1030, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 1031
value = 0
ctrl = 1


;======================<AIR HADOUKEN>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
poweradd = 50 * map(meterscaling)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

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

[State 1050, Faster]
type = changeanim
trigger1 = map(strength) = 0
trigger1 = animelemtime(2) = -2
trigger2 = map(strength) = 0
trigger2 = animelemtime(2) = -1
value = 1050
elem = 2

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 2
channel = 0

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 2
value2 = SCA, AA, AT
time = 1

[State 1050, Hadouken]
type = helper
trigger1 = animelem = 2
helpertype = normal; projectile
stateno = 1005
ID = 1055
name = "Hadouken"
postype = p1
pos = ceil(52 * const(size.xscale)), -39
size.xscale = 0.50
size.yscale = 0.50
ownpal = 1

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 6

[State 1050, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State 1050, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(map(strength) = 2, -2.0, ifelse(map(strength) = 1, -1.33, -0.67))
y = ifelse(map(strength) = 2, -5.00, ifelse(map(strength) = 1, -5.25, -5.50))

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1051


;---Land---
[Statedef 1051]
type = S
physics = S
movetype = I
anim = 1051
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1051, Pos]
type = posset
trigger1 = 1
y = 0

[State 1051, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1051, Dust]
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

[State 1051, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHOUOU KEN>=============================
[Statedef 1100]
type = S
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
sprpriority = 2

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
value = ifelse(map(customcombo) > 0, 2, ifelse(p2movetype = H, 2, ifelse(p2statetype = A, 0, 1)))
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

[State 1100, Vel Ground]
type = velset
trigger1 = animelem = 2
trigger1 = anim = [1100, 1102]
x = 6.15

[State 1100, Sound]
type = playsnd
trigger1 = anim = 1102 && animelem = 2
value = 0, 102

[State 1100, Dust]
type = helper
trigger1 = anim = 1102 && animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Sound]
type = playsnd
trigger1 = anim = [1100, 1101]
trigger1 = animelemtime(6) = 1
trigger2 = anim = 1102
trigger2 = animelemtime(8) = 1
value = 0, 40

[State 1100, Dust]
type = helper
trigger1 = anim = [1100, 1101]
trigger1 = animelemtime(6) = 1
trigger2 = anim = 1102
trigger2 = animelemtime(8) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Sound]
type = playsnd
trigger1 = (anim = [1100, 1101]) && animelem = 4
trigger2 = anim = 1102 && animelem = 6
value = 1, 3
;channel = 1
stopongethit = 1

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100
trigger1 = animelemtime(6) >= 1
trigger2 = anim = 1101 && animelemtime(6) >= 1
trigger3 = anim = 1102 && animelemtime(8) >= 1
trigger4 = anim = 1103
y = ifelse(map(strength) = 2, 0.509, ifelse(map(strength) = 1, 0.485, 0.529))

[State 1100, Vel]
type = velmul
trigger1 = anim = [1100, 1101]
trigger1 = animelemtime(6) >= 2
trigger2 = anim = 1102 && animelemtime(8) >= 1
x = 0.95

[State 1100, Vel Jump]
type = velset
trigger1 = anim = [1100, 1101]
trigger1 = animelemtime(6) = [0, 1]
trigger2 = anim = 1102
trigger2 = animelemtime(8) = [0, 1]
x = ifelse(map(strength) = 2, 2.60, ifelse(map(strength) = 1, 2.40, 1.80))
y = ifelse(map(strength) = 2, -8.68, ifelse(map(strength) = 1, -6.80, -5.85))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = anim = [1100, 1101]
trigger1 = animelemtime(6) = 0
trigger2 = anim = 1102
trigger2 = animelemtime(8) = 0
value = 1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 2
trigger1 = anim = [1100, 1102]
value = 4, 14
channel = 0

[State 1100, Hit Low]
type = hitdef
trigger1 = animelem = 4
trigger1 = anim = 1101 || anim = 1102
trigger2 = animelem = 6
trigger2 = anim = 1102
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = ifelse(anim = 1101, 40, 30), ifelse(anim = 1101, 10, 8)
dizzypoints = ifelse(map(strength) = 2, 38, ifelse(map(strength) = 1, 50, 100)) * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8)), ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8))
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 6), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Hit High]
type = hitdef
trigger1 = animelem = 5
trigger1 = anim = 1101 || anim = 1102
trigger2 = animelem = 7
trigger2 = anim = 1102
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, SA
damage = ifelse(anim = 1101, 40, 20), ifelse(anim = 1101, 10, 8)
dizzypoints = ifelse(map(strength) = 2, 38, ifelse(map(strength) = 1, 50, 100)) * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8)), ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8))
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 7), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Hit Low Final]
type = hitdef
trigger1 = animelem = 5 && anim = 1100
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SA
damage = 100, 25
dizzypoints = ifelse(map(strength) = 2, 38, ifelse(map(strength) = 1, 50, 100)) * !map(customcombo)
animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8)), ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8))
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 60), map(sparky) := -72
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -4, ifelse(map(strength) = 1, -3.5, -3)), ifelse(map(strength) = 2, -9.5, ifelse(map(strength) = 1, -7.75, -6))
air.type = Low
air.velocity = ifelse(map(strength) = 2, -4, ifelse(map(strength) = 1, -3.5, -3)), ifelse(map(strength) = 2, -9.5, ifelse(map(strength) = 1, -7.75, -6))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1100, Hit Midair]
type = hitdef
trigger1 = animelem = 6 && anim = 1100
trigger1 = !movecontact && !movereversed
trigger2 = (animelem = 6 && anim = 1101) || (animelem = 8 && anim = 1102)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, SA
damage = 40, 10
dizzypoints = 50 * !map(customcombo)
animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8)), ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 6, 8))
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -4, ifelse(map(strength) = 1, -3.5, -3)), ifelse(map(strength) = 2, -9.5, ifelse(map(strength) = 1, -7.75, -6))
air.type = High
air.velocity = ifelse(map(strength) = 2, -4, ifelse(map(strength) = 1, -3.5, -3)), ifelse(map(strength) = 2, -9.5, ifelse(map(strength) = 1, -7.75, -6))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Blur FX]
type = explod
trigger1 = anim = 1100 && animelem = 6
trigger2 = anim = 1101 && animelem = 6
trigger3 = anim = 1102 && animelem = 8
ID = 1190
anim = 1190
postype = p1
pos = 40 * const(size.xscale), -60 * const(size.yscale)
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 6, 4))
interpolation.time = ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 6, 4))
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100
trigger1 = animelemtime(6) >= 0
trigger2 = anim = 1101 && animelemtime(6) >= 0
trigger3 = anim = 1102 && animelemtime(8) >= 0
trigger4 = anim = 1103
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100
trigger1 = animelemtime(6) > 0 && vel y > -2
trigger2 = anim = 1101 && animelemtime(6) > 0 && vel y > -3
trigger3 = anim = 1102 && animelemtime(8) > 0 && vel y > -4
value = 1103

[State Idle]
type = statetypeset
trigger1 = anim = 1103
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1104


;---Land---
[Statedef 1104]
type = S
physics = S
movetype = I
anim = 1104
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1104, Pos]
type = posset
trigger1 = 1
y = 0

[State 1104, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1104, Dust]
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

[State 1104, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SHOUOUKEN>=============================
[Statedef 1110]
type = S
physics = N
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1110, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1110, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1110, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1110, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-17 * const(size.xscale)), ceil(-67 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 0, 100

[State 1110, Dust]
type = helper
trigger1 = anim = 1110 && animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1110, Vel]
type = velset
trigger1 = anim = 1110 && animelem = 2
x = 7.50

[State 1110, Steps]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1111 && animelem = 5
value = 1, 3
;channel = 1
stopongethit = 1

[State 1110, Blur FX]
type = explod
trigger1 = anim = 1111 && animelem = 5
ID = 1190
anim = 1190
postype = p1
pos = 60 * const(size.xscale), -60 * const(size.yscale)
angle = -10
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 4
interpolation.time = 4
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1110, Sound]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 4, 12
channel = 0

[State 1110, Hit Running]
type = hitdef
trigger1 = animelem = 2 && anim = 1110
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
guard.pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -55
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = 0, 0
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Anim]
type = changeanim
triggerall = anim = 1110
triggerall = animelemtime(2) >= 0
trigger1 = movecontact || movereversed
trigger2 = time >= 24
value = 1111

[State 1110, Hit High]
type = hitdef
triggerall = anim = 1111
trigger1 = animelem = 1
trigger2 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse((animelem = 1), 1 , 3))
attr = S, SA
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 5), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = 0, 0
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Hit Low]
type = hitdef
triggerall = anim = 1111
trigger1 = animelem = 2
trigger2 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := ifelse((animelem = 2), 1, 3))
attr = S, SA
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 4), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = 0, 0
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Hit Final]
type = hitdef
trigger1 = anim = 1111
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
ID = 1110
attr = S, SA
damage = 40, 10
dizzypoints = 25 * !map(customcombo)
animtype = Up
air.animtype = Up
fall.animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 70), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -2.5, -11.0
air.type = Low
air.velocity = -2.5, -11.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1110, Type]
type = statetypeset
trigger1 = anim = 1111
statetype = S
physics = S

[State Idle]
type = statetypeset
trigger1 = anim = 1111
trigger1 = animelem = 6
movetype = I

[State 1110, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 1111
value = 0
ctrl = 1


;======================<DARK SHOUOU KEN>=============================
[Statedef 1150]
type = S
physics = N
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1150, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_z), 2, ifelse(map(cmd_strength_y), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1150, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x < 50, 0, ifelse(p2bodydist x < 100, 1, 2))
ignorehitpause = 1

[State 1150, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1150, Vel]
type = velset
trigger1 = anim = 1110 && animelem = 2
x = 6.71

[State 1150, Sound]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 0, 100
persistent = 0

[State 1150, Dust]
type = helper
trigger1 = anim = 1110 && animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1
persistent = 0

[State 1150, Steps]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 3 || animelem = 6
value = 0, ifelse((animelem = 3), 103, 106)

[State 1150, Sound]
type = playsnd
trigger1 = anim = 1110
trigger1 = animelem = 2
value = 4, 14
channel = 0

[State 1150, Sound]
type = playsnd
trigger1 = anim = 1151 && animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1

[State 1150, Hit Running]
type = hitdef
trigger1 = anim = 1110
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
damage = 20, 5
dizzypoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
guard.pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -55
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2, -2
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1150, Anim]
type = changeanim
triggerall = anim = 1110
triggerall = animelemtime(2) >= 0
trigger1 = time >= ifelse(map(strength) = 2, 32, ifelse(map(strength) = 1, 20, 8))
trigger2 = movecontact || movereversed
value = 1151

[State 1150, Sound]
type = playsnd
trigger1 = anim = 1151
trigger1 = animelem = 6
value = 0, 41

[State 1150, Dust]
type = helper
trigger1 = anim = 1151
trigger1 = animelemtime(6) = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1150, Accel]
type = veladd
trigger1 = anim = 1151 && animelemtime(6) >= 1
y = 0.473

[State 1150, Vel]
type = velmul
trigger1 = anim = 1151 && animelemtime(6) >= 1
x = 0.95

[State 1150, Vel]
type = velset
trigger1 = anim = 1151 && animelemtime(6) = 1
x = 4
y = -9

[State 1150, Type]
type = statetypeset
trigger1 = anim = 1151
trigger1 = animelem = 6
statetype = A
physics = N

[State 1150, Hit Low]
type = hitdef
trigger1 = anim = 1151 && (animelem = 2 || animelem = 4)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 4), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -3
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1150, Hit High]
type = hitdef
trigger1 = anim = 1151 && (animelem = 3 || animelem = 5)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, SA
damage = 20, 5
dizzypoints = 25 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := ifelse((animelem = 5), -61, -30)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = 0, -3
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
p1sprpriority = sprpriority
forcestand = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1150, Hit Midair]
type = hitdef
trigger1 = anim = 1151
trigger1 = animelem = 6 || animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
damage = 20, 5
dizzypoints = 50 * !map(customcombo)
animtype = Diagup
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -92
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -5, -9.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
air.velocity = -5, -9.5
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1150, Blur FX]
type = explod
trigger1 = anim = 1151 && animelem = 6
ID = 1190
anim = 1190
postype = p1
pos = 40 * const(size.xscale), -60 * const(size.yscale)
bindtime = 60
trans = addalpha
alpha = 256, 256
removetime = 8
interpolation.time = 8
interpolation.alpha = 0, 256
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1151
trigger1 = animelem = 8
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1104


;======================<EX TAUNT>=============================
[Statedef 1195]
type = S
movetype = A
physics = S
anim = 1195
velset = 0, 0
sprpriority = 2
poweradd = -500
ctrl = 0
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1195, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1195, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1195, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1195, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(5 * const(size.xscale)), ceil(-67 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1195, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
attr = S, SA
damage = 20, 5
dizzypoints = 200 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8012)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 30), map(sparky) := -79
hitsound = s2, 11
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -8, -6
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 1195, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 4
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I
persistent = 0

[State 1195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHUNPUU KYAKU>=============================
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
sprpriority = 2

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
trigger1 = !map(dark)
map = "strength"
value = ifelse(p2bodydist x < 20, 0, ifelse(p2bodydist x < 50, 1, 2))
ignorehitpause = 1

[State 1200, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
trigger1 = map(dark)
map = "strength"
value = ifelse(p2bodydist x < 90, 0, ifelse(p2bodydist x < 150, 1, 2))
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

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 15
channel = 0

[State 1200, Sound]
type = playsnd
trigger1 = animelemtime(5) = 0
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = animelemtime(5) = 0
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 1200, Accel]
type = veladd
trigger1 = !map(dark)
trigger1 = animelemtime(5) >= 1
y = ifelse(map(strength) = 2, 0.54, ifelse(map(strength) = 1, 0.58, 0.66))

[State 1200, Accel]
type = veladd
trigger1 = map(dark)
trigger1 = animelemtime(5) >= 1
y = ifelse(map(strength) = 2, 0.80, ifelse(map(strength) = 1, 0.9, 1.0))

[State 1200, Vel Sakura]
type = velset
trigger1 = animelemtime(5) = 1
trigger1 = !map(dark)
x = 3.59
y = ifelse(map(strength) = 2, -7.85, ifelse(map(strength) = 1, -5.55, -3.35))

[State 1200, Vel Dark]
type = velset
trigger1 = animelemtime(5) = 1
trigger1 = map(dark)
x = ifelse(map(strength) = 2, 6, ifelse(map(strength) = 1, 5.25, 4.5))
y = ifelse(map(strength) = 2, -12, ifelse(map(strength) = 1, -9, -6))

[State 1200, NHB]
type = nothitby
triggerall = animelemtime(5) >= 0
trigger1 = map(strength) = 1
trigger1 = animelemtime(8) < 0
trigger2 = map(strength) = 2
trigger2 = animelemtime(12) < 0
value2 = , AP
time = 1

[State 1200, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 11 || animelem = 15
value = 1, 6
;channel = 1
stopongethit = 1

[State 1200, Blur FX]
type = explod
trigger1 = animelem = 8 || animelem = 12 || animelem = 16
ID = 1290
anim = 1291
postype = p1
pos = 15 * const(size.xscale), -50 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1200, Blur FX]
type = explod
trigger1 = animelem = 10 || animelem = 14
ID = 1290
anim = 1290
postype = p1
pos = 15 * const(size.xscale), -40 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1200, Hit Sakura]
type = hitdef
trigger1 = !map(dark)
trigger1 = animelem = 8 || animelem = 12 || animelem = 16
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = ifelse(map(strength) = 2, 40, ifelse(map(strength) = 1, 45, 60)), ifelse(map(strength) = 2, 10, ifelse(map(strength) = 1, 12, 15))
dizzypoints = ifelse(map(strength) = 2, 67, ifelse(map(strength) = 1, 75, 100)) * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 82), map(sparky) := -44
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 12
guard.velocity = -4.49
air.type = Low
air.velocity = -3, -7
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1200
nochainID = 1201
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit Dark]
type = hitdef
trigger1 = map(dark)
trigger1 = animelem = 8 || animelem = 12 || animelem = 16
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = ifelse(movehit, 20, ifelse(map(strength) = 2, 100, ifelse(map(strength) = 1, 80, 60))), ifelse(moveguarded, 5, ifelse(map(strength) = 2, 25, ifelse(map(strength) = 1, 20, 15)))
dizzypoints = ifelse(map(strength) = 2, 100, ifelse(map(strength) = 1, 75, 50)) * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 82), map(sparky) := -44
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.0, -2.0)), -7.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -4.49
air.type = Low
air.velocity = ifelse(map(strength) = 2, -4.0, ifelse(map(strength) = 1, -3.0, -2.0)), -7.0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1205


;---Land---
[Statedef 1205]
type = S
physics = S
movetype = I
anim = ifelse(prevstateno = 1210 || map(strength) = 1, 1206, ifelse(map(strength) = 2, 1207, 1205))
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
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SHUNPUUKYAKU>=============================
[Statedef 1210]
type = S
physics = S
movetype = A
anim = 1210
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1210, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1210, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1210, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1210, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-24 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1210, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 15
channel = 0

[State 1210, Sound]
type = playsnd
trigger1 = animelemtime(5) = 0
value = 0, 40
persistent = 0

[State 1210, Dust]
type = helper
trigger1 = animelemtime(5) = 0
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1210, Accel]
type = veladd
trigger1 = animelemtime(5) >= 1
y = 0.60

[State 1210, Vel]
type = velset
trigger1 = animelemtime(5) = 1
x = 4.5
y = -7.0

[State 1210, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
statetype = A
physics = N

[State 1210, NHB]
type = nothitby
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(12) < 0
value2 = , AP
time = 1

[State 1210, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19 || animelem = 23
value = 1, 4
;channel = 1
stopongethit = 1

[State 1210, Blur FX]
type = explod
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20
ID = 1290
anim = 1291
postype = p1
pos = 15 * const(size.xscale), -50 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1210, Blur FX]
type = explod
trigger1 = animelem = 10 || animelem = 14 || animelem = 18
ID = 1290
anim = 1290
postype = p1
pos = 15 * const(size.xscale), -40 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1210, Hit]
type = hitdef
trigger1 = animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20 || animelem = 24
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = A, SA
damage = 35, 9
dizzypoints = 50 * !map(customcombo)
animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 82), map(sparky) := -44
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
guard.velocity = -4.49
air.type = Low
air.velocity = -5, -5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1

[State 1210, End]
type = changestate
trigger1 = anim = 1210
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1205


;======================<AIR SHUNPUU KYAKU>=============================
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
velset = (vel x + 1.25), (vel y)
poweradd = 100 * map(meterscaling)
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1250, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_c), 2, ifelse(map(cmd_strength_b), 1, 0))
ignorehitpause = 1
persistent = 0

[State 1250, Strength AI]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = 2
ignorehitpause = 1

[State 1250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(vel y < 0, 4, 3), ifelse(vel y < 0, 15, 5)
channel = 0

[State 1250, Sound]
type = changeanim
triggerall = anim = 1250
triggerall= animelemtime(15) < 0
trigger1 = map(strength) = 0 && animelem = 7
trigger2 = map(strength) = 1 && animelem = 11
value = 1250
elem = 15

[State 1250, Accel]
type = veladd
trigger1 = 1
y = ifelse(animelemtime(11) >= 0 || vel y < 0, 0.50, 0.25)

[State 1250, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1, 6
;channel = 1
stopongethit = 1

[State 1250, Blur FX]
type = explod
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
ID = 1290
anim = 1291
postype = p1
pos = 15 * const(size.xscale), -50 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1250, Blur FX]
type = explod
trigger1 = animelem = 6 || animelem = 10
ID = 1290
anim = 1290
postype = p1
pos = 15 * const(size.xscale), -40 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1250, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = 60, 15
dizzypoints = 50 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 82), map(sparky) := -44
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4, -7.5
air.type = Low
air.velocity = -4, -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, Type]
type = statetypeset
trigger1 = animelem = 13
movetype = I

[State 1250, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259


;---Land---
[Statedef 1259]
type = S
physics = S
movetype = I
anim = 1259
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1259, Pos]
type = posset
trigger1 = 1
y = 0

[State 1259, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1259, Dust]
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

[State 1259, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX AIR SHUNPUUKYAKU>=============================
[Statedef 1260]
type = A
physics = N
movetype = A
anim = 1260
ctrl = 0
velset = (vel x + 2.0), (vel y)
poweradd = -500
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1260, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1260, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1260, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1260, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(8 * const(size.xscale)), ceil(-48 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1260, Sound]
type = playsnd
trigger1 = animelem = 1
value = ifelse(vel y < 0, 4, 3), ifelse(vel y < 0, 15, 5)
channel = 0

[State 1260, Accel]
type = veladd
trigger1 = 1
y = ifelse(animelemtime(15) >= 0 || vel y < 0, 0.50, 0.25)

[State 1260, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 7 || animelem = 11
value = 1, 4
;channel = 1
stopongethit = 1

[State 1260, Blur FX]
type = explod
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
ID = 1290
anim = 1291
postype = p1
pos = 15 * const(size.xscale), -50 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority - 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1260, Blur FX]
type = explod
trigger1 = animelem = 6 || animelem = 10
ID = 1290
anim = 1290
postype = p1
pos = 15 * const(size.xscale), -40 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1260, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SA
damage = ifelse(movehit, 35, 80), ifelse(moveguarded, 9, 20)
dizzypoints = 100 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 82), map(sparky) := -44
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4, -4
air.type = Low
air.velocity = -4, -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1

[State 1260, Pos Fix]
type = posadd
trigger1 = animelem = 15
x = 10 * const(size.xscale)
y = -5

[State 1260, Type]
type = statetypeset
trigger1 = animelem = 13
movetype = I

[State 1260, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1259


;======================<SAKURA OTOSHI>=============================
;----- Startup -----
[Statedef 1300]
type = S
physics = S
movetype = A
anim = 1300
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
facep2 = 1
sprpriority = 2

[State 1300, Strength]
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
value = ifelse(p2bodydist x < 60, 0, ifelse(p2bodydist x < 90, 1, 2))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1300, Otoshivar]
type = mapset
trigger1 = !time
map = "otoshicount"
value = 0

[State 1300, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 0.586

[State 1300, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = ifelse(map(strength) = 2, 3.08, ifelse(map(strength) = 1, 2.46, 1.85))
y = ifelse(map(strength) = 2, -10.0, ifelse(map(strength) = 1, -8.75, -7.50))

[State 1300, Sound]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0, 40

[State 1300, Dust]
type = helper
trigger1 = animelemtime(2) = 0
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1300, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 5
channel = 0

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 1301


;----- Ready -----
[Statedef 1301]
type = A
physics = N
movetype = A
anim = 1301
ctrl = 0
sprpriority = 2

[State 1301, Accel]
type = veladd
trigger1 = time
y = 0.586

[State 1301, Punch]
type = changestate
triggerall = time
trigger1 = !AIlevel
trigger1 = map(cmd_x) || map(cmd_y) || map(cmd_z)
trigger2 = AIlevel
trigger2 = p2bodydist x <= 40
trigger2 = p2dist y <= (-32 - ifelse(p2statetype = C, p2, const(size.mid.pos.y), p2, const(size.head.pos.y)))
trigger2 = random < (1000 * (AIlevelF / 8.0))
trigger3 = AIlevel
trigger3 = vel y >= 0 && inguarddist
trigger3 = random < (1000 * (AIlevelF / 8.0))
value = 1305

[State 1301, Cancel]
type = changestate
triggerall = map(otoshicount) < 3
triggerall = statetype = A
triggerall = vel y >= 0
triggerall = pos y <= -24
trigger1 = !AIlevel
trigger1 = map(cmd_a) || map(cmd_b) || map(cmd_c)
trigger2 = AIlevel
trigger2 = p2movetype != H && random < 50
value = 1304

[State 1301, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = ifelse(map(otoshicount), 1303, 1302)


;----- PUNCH -----
[Statedef 1305]
type = A
physics = N
movetype = A
anim = 1305
ctrl = 0
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1305, Accel]
type = veladd
trigger1 = time
y = 0.586

[State 1305, Otoshi Var]
type = mapadd
trigger1 = !time
map = "otoshicount"
value = 1

[State 1305, Sound]
type = playsnd
trigger1 = animelem = 2
value = ifelse(map(otoshicount) < 3, 3, 4), ifelse(map(otoshicount) = 1, 1, ifelse(map(otoshicount) = 2, 2, 12))
channel = 0

[State 1305, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1

[State 1305, FX]
type = explod
trigger1 = animelem = 2
ID = 1390
anim = 1390
postype = p1
pos = 50 * const(size.xscale), -70 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1305, Projectile Hitter]
type = helper
trigger1 = !time
trigger1 = !numhelper(1306)
helpertype = normal
stateno = 1306
ID = 1306
name = "Projectile Hitter"
postype = p1

[State 1305, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
value2 = , AP
time = 1
ignorehitpause = 1

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(otoshicount) < 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SA
damage = 50, 13
dizzypoints = 50 * !map(customcombo)
animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 73), map(sparky) := -64
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, -7.0
air.type = Low
air.velocity = -4.0, -7.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = map(otoshicount) >= 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SA
damage = 60, 15
dizzypoints = 100 * !map(customcombo)
animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 55), map(sparky) := -64
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -6, 3
air.type = Low
air.velocity = -6, 3
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
down.recover = 1
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1305, Spark Pos]
type = null
trigger1 = animelem = 3
trigger1 = 1 || map(sparkx.min) := 35
trigger1 = 1 || map(sparkx.max) := 55
trigger1 = 1 || map(sparky) := -30

[State 1305, Vel]
type = velset
trigger1 = movecontact = 1 || movereversed = 1
trigger2 = numhelper(1306)
trigger2 = helper(1306), stateno = 1307
x = ifelse(map(strength) = 2, 5.54, ifelse(map(strength) = 1, 4.92, 4.31)) * ifelse(map(otoshicount) >= 3, 0.6, ifelse(map(otoshicount) >= 2, 0.8, 1.0))
y = -7.73 * ifelse(map(otoshicount) >= 3, 0.8, ifelse(map(otoshicount) >= 2, 0.9, 1.0))
persistent = 0

[State 1305, Ready]
type = changestate
triggerall = map(otoshicount) < 3
triggerall = animelemtime(8) >= 0
trigger1 = movecontact || movereversed
trigger2 = numhelper(1306)
trigger2 = helper(1306), stateno = 1307
value = 1301

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
trigger1 = map(otoshicount) >= 3
movetype = I

[State 1305, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1303


;----- Land miss -----
[Statedef 1302]
type = S
physics = S
ctrl = 0
anim = 1302
velset = ifelse(vel x <= 0, 3, 1.5 * vel x), 0

[State 1302, Sound]
type = playsnd
trigger1 = time = 1
value = 4, 11
channel = 0

[State 1302, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 101

[State 1302, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = ceil(32 * const(size.xscale)), 0
vel = 0.75 * vel x, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1302, Stop]
type = velset
trigger1 = 1
y = 0

[State 1302, Pos]
type = posset
trigger1 = 1
y = 0

[State 1302, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Land punch -----
[Statedef 1303]
type = S
physics = S
ctrl = 0
anim = 1303
velset = 0, 0

[State 1303, Pos]
type = posset
trigger1 = 1
y = 0

[State 1303, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1303, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1303, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- CANCEL -----
[Statedef 1304]
type = A
physics = N
ctrl = 0
anim = 1304
velset = 0, vel y

[State 1304, Erase Inputs]
type = mapset
map = "erase_normal"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 1304, Sound]
type = playsnd
trigger1 = time = 1
value = 3, 7
channel = 0

[State 1304, Accel]
type = veladd
trigger1 = time
y = 0.586

[State 1304, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;======================<EX SAKURA OTOSHI>=============================
;----- Startup -----
[Statedef 1330]
type = S
physics = S
movetype = A
anim = 1330
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 2

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1330, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 1330, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1330, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1330, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(6 * const(size.xscale)), ceil(-63 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1330, NHB]
type = nothitby
trigger1 = time < 16
value2 = , AP
time = 1

[State 1330, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1330, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 0.586

[State 1330, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = 3.08
y = -8.75

[State 1330, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = min(p2dist x, 160) / 30.0

[State 1330, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1330, Sound]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0, 40

[State 1330, Dust]
type = helper
trigger1 = animelemtime(2) = 0
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
persistent = 0

[State 1330, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 5
channel = 0

[State 1330, Punch]
type = changestate
triggerall = animelemtime(4) > 0
trigger1 = !AIlevel
trigger1 = map(cmd_x) || map(cmd_y) || map(cmd_z)
trigger2 = AIlevel
trigger2 = p2bodydist x <= 40
trigger2 = p2dist y <= (-32 - ifelse(p2statetype = C, p2, const(size.mid.pos.y), p2, const(size.head.pos.y)))
trigger2 = random < (1000 * (AIlevelF / 8.0))
value = 1335

[State 1330, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1302


;----- Land punch -----
[Statedef 1333]
type = S
physics = S
ctrl = 0
anim = 1333
velset = 0, 0

[State 1333, Pos]
type = posset
trigger1 = 1
y = 0

[State 1333, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1333, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1333, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PUNCH -----
[Statedef 1335]
type = A
physics = N
movetype = A
anim = 1305
ctrl = 0
sprpriority = 2

[State 1335, Accel]
type = veladd
trigger1 = time
y = 0.586

[State 1335, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 2
channel = 0

[State 1335, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 3
;channel = 1
stopongethit = 1

[State 1335, FX]
type = explod
trigger1 = animelem = 2
ID = 1390
anim = 1390
postype = p1
pos = 50 * const(size.xscale), -70 * const(size.yscale)
bindtime = 60
sprpriority = sprpriority + 1
removeongethit = 1
removeonchangestate = 1
ownpal = 1

[State 1335, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
ID = 1335
attr = A, SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = 120, 30
dizzypoints = 200 * !map(customcombo)
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
down.hittime = 20
ground.velocity = -4.0, 6.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.0, 6.0
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 35) * (map(sparkx.max) := 73), map(sparky) := -64
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 1335, Spark Pos]
type = null
trigger1 = animelem = 3
trigger1 = 1 || map(sparkx.min) := 35
trigger1 = 1 || map(sparkx.max) := 55
trigger1 = 1 || map(sparky) := -30

[State 1335, Bounce]
type = changestate
trigger1 = movecontact = 1 || movereversed = 1
value = 1336

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1335, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1333


;----- BOUNCE -----
[Statedef 1336]
type = A
physics = N
movetype = I
anim = 1336
ctrl = 0
velset = 2.5, -7.5
sprpriority = 2

[State 1336, Accel]
type = veladd
trigger1 = time
y = 0.586

[State 1336, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1303


;----- Target Slammed Against Ground -----
[Statedef 1390]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1390, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 1390, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = pos y < 0
value = 5030

[State 1390, End]
type = changestate
trigger1 = hitshakeover
trigger1 = pos y >= 0
value = 1391


[Statedef 1391]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1391, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5101), 5101, 5100)

[State 1391, Pos]
type = posset
trigger1 = 1
y = 0

[State 1391, Damage]
type = hitfalldamage
trigger1 = !time

[State 1391, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 1391, Sound]
type = playsnd
trigger1 = !time
value = F 7, 2

[State 1391, FX]
type = explod
trigger1 = !time
anim = F 62
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -3

[State 1391, End]
type = changestate
trigger1 = !animtime
value = 1392


[Statedef 1392]
type = L
physics = N
movetype = H

[State 1392, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5161), 5161, 5160)

[State 1392, Pos]
type = posset
trigger1 = !time
y = const(movement.down.bounce.offset.y)

[State 1392, Vel]
type = velset
trigger1 = !time
y = -3.5

[State 1392, Accel]
type = veladd
trigger1 = time > 0
y = 0.5

[State 1392, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;======================<OUKA KYAKU>=============================
[Statedef 1400]
type = A
physics = N
movetype = A
anim = 1400
ctrl = 0
velset = 0, 0
poweradd = 100 * map(meterscaling)
juggle = ifelse(p2statetype = L && !map(customcombo), 8, 0)

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

[State 1400, Startup]
type = changeanim
triggerall = animelemtime(3) < 0
trigger1 = map(strength) = 0
trigger1 = animelemtime(2) = -1 || animelemtime(3) = -1
trigger2 = map(strength) = 1
trigger2 = animelemtime(3) = -1
value = 1400
elem = animelemno(0) + 1

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 1
channel = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
;channel = 1
stopongethit = 1

[State 1400, Freeze]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0

[State 1400, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.5

[State 1400, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(map(strength) = 2, 5, ifelse(map(strength) = 1, 4, 3))
y = ifelse(map(strength) = 2, 3, ifelse(map(strength) = 1, 3.5, 4))

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1400
attr = A, SA
damage = 70, 18
dizzypoints = 100 * !map(customcombo)
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 63), map(sparky) := -16
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 12
guard.ctrltime = 1 + 12
guard.slidetime = 12
guard.velocity = -4.49
air.type = Low
air.velocity = -4, 2
down.velocity = 0, 0
getpower = ifelse(movehit, 25, 100) * map(meterscaling), ifelse(moveguarded, 25, 50) * map(meterscaling)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
airguard.cornerpush.veloff = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1405


;---Land---
[Statedef 1405]
type = S
physics = S
movetype = I
anim = 1405
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1405, Pos]
type = posset
trigger1 = 1
y = 0

[State 1405, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1405, Dust]
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

[State 1405, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SAKURA SENKUU>=============================
[Statedef 1500]
type = S
physics = N
movetype = I
anim = 1500
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1500, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_623kk), 1, ifelse(map(cmd_623pp), 2, ifelse(map(cmd_421kk), -1, -2)))
ignorehitpause = 1
persistent = 0

[State 1500, Strength]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(random < 333, 1, 2)
ignorehitpause = 1

[State 1500, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0


[State 1500, Anim]
type = changeanim
trigger1 = anim = 1500
trigger1 = !animtime
value = 1501

[State 1500, Vel]
type = velset
trigger1 = anim = 1500
x = ifelse(map(strength) = 2, -5, ifelse(map(strength) = 1, -3, ifelse(map(strength) = -2, 5, 3))) * sin(time / 11.0 * pi)

[State 1500, Vel]
type = velset
trigger1 = anim = 1501
x = ifelse(map(strength) = 2, 12, ifelse(map(strength) = 1, 7.5, ifelse(map(strength) = -2, -12, -7.5)))
persistent = 0

[State 1500, Vel]
type = velmul
trigger1 = anim = 1501
trigger1 = time > ifelse(map(strength) = 2 || map(strength) = -2, 37, 32)
x = 0.9

[State 1500, Sound]
type = playsnd
trigger1 = anim = 1500
trigger1 = animelem = 2
value = 3, 1
channel = 0

[State 1500, Sound]
type = playsnd
trigger1 = anim = 1501
value = 5, 8
persistent = 0

[State 1400, Darken]
type = palfx
trigger1 = !time
trigger1 = anim = 1500
time = abs(animtime)
mul = 256, 256, 256
sinmul = -128, -128, -128, 4 * abs(animtime)

[State 1400, Darken]
type = palfx
trigger1 = anim = 1501
time = 1
mul = 128, 128, 128

[State 1500, Afterimage]
type = explod
trigger1 = anim = 1501
ID = 1500
postype = p1
pos = 0, 2 * cos(time / 8.0 * pi)
sprpriority = sprpriority - 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 12
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
palfx.time = 12
palfx.mul = 128, 128, 128
interpolation.time = 12
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 1500, Eye]
type = explod
trigger1 = anim = 1501
ID = 1500
anim = 8060
postype = p1
pos = 1 * const(size.xscale) - 0.5 * vel x, -85 * const(size.yscale)
sprpriority = sprpriority + 1
removetime = 12
trans = addalpha
alpha = 256, 256
scale = 0.02 * abs(vel x), 0.02
palfx.time = 12
palfx.color = 0
palfx.mul = 256, 0, 128
interpolation.time = 12
interpolation.alpha = 0, 256
removeonchangestate = 1
ownpal = 1

[State 1500, Turn]
type = turn
trigger1 = anim = 1501
trigger1 = p2dist x < 0

[State 1500, End]
type = changestate
triggerall = anim = 1501
trigger1 = time >= ifelse(map(strength) = 2 || map(strength) = -2, 52, 42)
trigger2 = vel x < 0 && backedgebodydist <= 0
trigger3 = vel x > 0 && frontedgebodydist <= 0
value = 1502

[State 1500, NHB]
type = nothitby
trigger1 = 1
value = , AP, AT
time = 1

[State 1500, Push]
type = playerpush
trigger1 = anim = 1500
trigger2 = anim = 1501
value = 0

[State 1500, Afterimage]
type = afterimagetime
trigger1 = 1
time = 2


;---Recovery---
[Statedef 1502]
type = S
physics = N
movetype = I
anim = 1502
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 1502, Darken]
type = palfx
trigger1 = !time
time = 4
mul = 128, 128, 128
sinmul = 128, 128, 128, 16

[State 1502, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


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
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 2900, Vel]
type = velset
trigger1 = animelem = 3
x = 6

[State 2900, Vel]
type = velset
trigger1 = animelem = 4
x = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
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
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 25) * (map(sparkx.max) := 40), map(sparky) := -60
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
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
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 2, 5)
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
;channel = 1
stopongethit = 1

[State 2910, Vel]
type = velset
trigger1 = animelem = 3
x = 4

[State 2910, Vel]
type = velset
trigger1 = animelem = 4
x = 0

[State 2910, Hit]
type = hitdef
trigger1 = animelem = 3
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
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 45), map(sparky) := -35
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
