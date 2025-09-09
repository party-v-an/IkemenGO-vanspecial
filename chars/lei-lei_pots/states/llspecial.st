; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<ANKIHOU>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 25
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
value = ifelse(p2bodydist x > 220 || p2dist y < -10, 1, 0)
ignorehitpause = 1

[State 1000, Strength AI]
type = mapset
triggerall = AIlevel
triggerall = time <= 0
triggerall = p2dist x < 100
trigger1 = p2statetype = A && p2, vel y >= 0
trigger2 = p2statetype = L
map = "strength"
value = 2
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
value = ifelse(map(strength) = 0, 1000, 1001)

[State 1000, Charge]
type = changeanim
triggerall = time < 60
triggerall = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger1 = !AIlevel
trigger1 = map(strength) = 0 && command = "/x"
trigger2 = !AIlevel
trigger2 = map(strength) = 1 && command = "/y"
trigger3 = !AIlevel
trigger3 = map(strength) = 2 && command = "/z"
trigger4 = AIlevel
trigger4 = p2movetype = I && !inguarddist
trigger4 = p2bodydist x > 80 || p2statetype = L
trigger4 = random < 950
value = anim
elem = 3

[State 1000, Ankihou Var]
type = mapset
trigger1 = !time
map = "ankihotype"
value = ifelse(map(ankihotype) >= 5, 1, map(ankihotype) + 1)
persistent = 0

[State 1000, No dizzy]
type = mapset
trigger1 = !time
trigger1 = map(strength) = 0
trigger1 = map(ankihotype) = 5
map = "ankihotype"
value = 0

[State 1000, Charge]
type = mapset
trigger1 = time = 30
trigger1 = map(ankihotype) < 3
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
map = "ankihotype"
value = 3

[State 1000, Charge]
type = mapset
trigger1 = time = 45
trigger1 = map(ankihotype) < 4
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
map = "ankihotype"
value = 4

[State 1000, Charge]
type = mapset
trigger1 = time = 60
trigger1 = map(ankihotype) < 5
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
map = "ankihotype"
value = 5

[State 1000, Width]
type = width
trigger1 = anim = 1000
trigger1 = animelem = 6
value = ceil(32 * const(size.xscale)), 0

[State 1000, Width]
type = width
trigger1 = anim = 1001
trigger1 = animelem = 5
value = ceil(30 * const(size.xscale)), 0

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = anim = 1000 && animelem = 7
trigger2 = anim = 1001 && animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1000, Weapon]
type = helper
trigger1 = map(strength) = 0
trigger1 = anim = 1000 && animelem = 7
trigger1 = 1 || map(posx) := 102 * const(size.xscale) || map(posy) := -26 * const(size.yscale)
trigger2 = map(strength) = 1
trigger2 = anim = 1001 && animelem = 7
trigger2 = 1 || map(posx) := 70 * const(size.xscale) || map(posy) := -91 * const(size.yscale)
trigger3 = map(strength) = 2
trigger3 = anim = 1001 && animelem = 7
trigger3 = 1 || map(posx) := 48 * const(size.xscale) || map(posy) := -97 * const(size.yscale)
helpertype = normal; projectile
stateno = 1005
ID = 1005
name = "Ankihou Weapon"
postype = p1
pos = map(posx), map(posy)
ownpal = 1

[State 1000, Sound]
type = playsnd
trigger1 = anim = 1000 && animelem = 4
trigger2 = anim = 1001 && animelem = 5
value = 3, 6
channel = 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX ANKIHOU>=============================
[Statedef 1050]
type = S
physics = S
movetype = A
anim = 1000
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

[State 1050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1050, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1050, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-12 * const(size.xscale)), ceil(-77 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, Width]
type = width
trigger1 = animelem = 6
value = ceil(28 * const(size.xscale)), 0

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 7
value2 = SCA, AA, AT
time = 1

[State 1050, Weapon]
type = helper
trigger1 = animelem = 7
helpertype = normal; projectile
stateno = 1055
ID = 1055
name = "Spiked Ball"
postype = p1
pos = ceil(92 * const(size.xscale)), 0
ownpal = 1

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 2
channel = 0

[State 1050, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 6

[State 1050, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SENPUUBU>=============================
;----- START -----
[Statedef 1100]
type = U
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 75
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1100, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype != A
statetype = S
physics = S

[State 1100, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
statetype = A
physics = N

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
trigger1 = 1
time = 1
value = , AP

[State 1100, Cloud]
type = explod
trigger1 = animelem = 3
trigger1 = statetype = A
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(16 * const(size.xscale)), 8
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1100, Cloud]
type = explod
trigger1 = animelem = 3
trigger1 = statetype = A
anim = 7107
ID = 7107
sprpriority = -2
postype = p1
pos = ceil(59 * const(size.xscale)), 2
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 17
value = 3, 0
channel = 0

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 0

[State 1100, Width]
type = width
trigger1 = anim = 1100
edge = ceil(60 * const(size.xscale)), 0

[State 1100, Push]
type = playerpush
trigger1 = animelemtime(7) >= 0 || statetype = A
value = 0

[State 1100, Type]
type = statetypeset
trigger1 = animelem = 12
statetype = A
physics = N

[State 1100, Sound]
type = playsnd
trigger1 = animelem = 12
value = 0, 40

[State 1100, Dust]
type = explod
trigger1 = animelem = 12
trigger1 = pos y = 0
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 8, 3
scale = 0.5, 0.5
ownpal = 1

[State 1100, pos12 - 15]
type = posadd
trigger1 = animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
x = ifelse((animelem = 12), 25, ifelse((animelem = 13), 5, 4)) * const(size.xscale)
y = ifelse((animelem = 12), -3, ifelse((animelem = 13), -1, ifelse((animelem = 14), -4, -3))) * const(size.yscale)

[State 1100, pos16 - 19]
type = posadd
trigger1 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19
x = ifelse((animelem = 16), 7, ifelse((animelem = 17), 4, ifelse((animelem = 18), -21, 3))) * const(size.xscale)
y = ifelse((animelem = 16), -4, ifelse((animelem = 17), -2, ifelse((animelem = 18), -29, -5))) * const(size.yscale)

[State 1100, End]
type = changestate
trigger1 = !animtime
value = 1101


;----- SWING -----
[Statedef 1101]
type = A
physics = N
movetype = A
anim = 1101
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1101, Senpubu Var]
type = mapadd
trigger1 = !time
map = "senpubucount"
value = 1

[State 1101, Push]
type = playerpush
trigger1 = anim = 1101
value = 0

[State 1101, screenbound]
type = screenbound
trigger1 = anim = 1101
value = 0
movecamera = 1, 1

[State 1101, claw]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1105
ID = 1105
name = "Senpuubu Claw"
postype = p1

[State 1101, pos 1-4]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4
x = ifelse((animelem = 1), -7, ifelse((animelem = 2), 0, ifelse((animelem = 3), 3, 4))) * const(size.xscale)
y = ifelse((animelem = 1), -3, ifelse((animelem = 2), 4, ifelse((animelem = 3), 4, 5))) * const(size.yscale)

[State 1101, pos 5-8]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
x = ifelse((animelem = 5), 3, ifelse((animelem = 6), 5, ifelse((animelem = 7), 7, 22))) * const(size.xscale)
y = ifelse((animelem = 5), 4, ifelse((animelem = 6), 5, ifelse((animelem = 7), 8, 11))) * const(size.yscale)

[State 1101, pos 9-12]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12
x = ifelse((animelem = 9), 4, ifelse((animelem = 10), 9, ifelse((animelem = 11), 5, 18))) * const(size.xscale)
y = ifelse((animelem = 9), 3, ifelse((animelem = 10), 5, ifelse((animelem = 11), 2, 8))) * const(size.yscale)

[State 1101, pos 13-16]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
x = ifelse((animelem = 13), 11, ifelse((animelem = 14), 8, ifelse((animelem = 15), 15, 37))) * const(size.xscale)
y = ifelse((animelem = 13), 5, ifelse((animelem = 14), 2, ifelse((animelem = 15), 3, 0))) * const(size.yscale)

[State 1101, pos 17-20]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20
x = ifelse((animelem = 17), 11, ifelse((animelem = 18), 12, ifelse((animelem = 19), 11, 14))) * const(size.xscale)
y = ifelse((animelem = 17), 0, ifelse((animelem = 18), -1, ifelse((animelem = 19), -1, -3))) * const(size.yscale)

[State 1101, pos 21-24]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24
x = ifelse((animelem = 21), 21, ifelse((animelem = 22), 7, ifelse((animelem = 23), 25, 5))) * const(size.xscale)
y = ifelse((animelem = 21), -4, ifelse((animelem = 22), -4, ifelse((animelem = 23), -3, -2))) * const(size.yscale)

[State 1101, pos 25-28]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 25 || animelem = 26 || animelem = 27 || animelem = 28
x = ifelse((animelem = 25), 2, ifelse((animelem = 26), 12, ifelse((animelem = 27), 5, 3))) * const(size.xscale)
y = ifelse((animelem = 25), -1, ifelse((animelem = 26), -9, ifelse((animelem = 27), -2, -4))) * const(size.yscale)

[State 1101, pos 29-32]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32
x = ifelse((animelem = 29), 2, ifelse((animelem = 30), 5, ifelse((animelem = 31), 4, 3))) * const(size.xscale)
y = ifelse((animelem = 29), -2, ifelse((animelem = 30), -5, ifelse((animelem = 31), -5, -6))) * const(size.yscale)

[State 1101, pos 33-36]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 33 || animelem = 34 || animelem = 35 || animelem = 36
x = ifelse((animelem = 33), 3, ifelse((animelem = 34), -3, ifelse((animelem = 35), -3, -4))) * const(size.xscale)
y = ifelse((animelem = 33), -4, ifelse((animelem = 34), 4, ifelse((animelem = 35), 6, 5))) * const(size.yscale)

[State 1101, pos 37-40]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 37 || animelem = 38 || animelem = 39 || animelem = 40
x = ifelse((animelem = 37), -5, ifelse((animelem = 38), -2, ifelse((animelem = 39), -3, -5))) * const(size.xscale)
y = ifelse((animelem = 37), 5, ifelse((animelem = 38), 2, ifelse((animelem = 39), 4, 2))) * const(size.yscale)

[State 1101, pos 41-44]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 41 || animelem = 42 || animelem = 43 || animelem = 44
x = ifelse((animelem = 41), -12, ifelse((animelem = 42), -2, ifelse((animelem = 43), -5, -25))) * const(size.xscale)
y = ifelse((animelem = 41), 9, ifelse((animelem = 42), 1, ifelse((animelem = 43), 2, 3))) * const(size.yscale)

[State 1101, pos 45-48]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 45 || animelem = 46 || animelem = 47 || animelem = 48
x = ifelse((animelem = 45), -7, ifelse((animelem = 46), -21, ifelse((animelem = 47), -14, -11))) * const(size.xscale)
y = ifelse((animelem = 45), 4, ifelse((animelem = 46), 4, ifelse((animelem = 47), 3, 1))) * const(size.yscale)

[State 1101, pos 49-52]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 49 || animelem = 50 || animelem = 51 || animelem = 52
x = ifelse((animelem = 49), -12, ifelse((animelem = 50), -11, ifelse((animelem = 51), -37, -15))) * const(size.xscale)
y = ifelse((animelem = 49), 1, ifelse((animelem = 50), 0, ifelse((animelem = 51), 0, -3))) * const(size.yscale)

[State 1101, pos 53-56]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 53 || animelem = 54 || animelem = 55 || animelem = 56
x = ifelse((animelem = 53), -8, ifelse((animelem = 54), -11, ifelse((animelem = 55), -18, -5))) * const(size.xscale)
y = ifelse((animelem = 53), -2, ifelse((animelem = 54), -5, ifelse((animelem = 55), -8, -2))) * const(size.yscale)

[State 1101, pos 57-60]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 57 || animelem = 58 || animelem = 59 || animelem = 60
x = ifelse((animelem = 57), -9, ifelse((animelem = 58), -4, ifelse((animelem = 59), -22, -7))) * const(size.xscale)
y = ifelse((animelem = 57), -5, ifelse((animelem = 58), -3, ifelse((animelem = 59), -11, -8))) * const(size.yscale)

[State 1101, pos 61-64]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 61 || animelem = 62 || animelem = 63 || animelem = 64
x = ifelse((animelem = 61), -5, ifelse((animelem = 62), -3, ifelse((animelem = 63), -4, -3))) * const(size.xscale)
y = ifelse((animelem = 61), -5, ifelse((animelem = 62), -4, ifelse((animelem = 63), -5, -4))) * const(size.yscale)

[State 1101, pos 65]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 65
y = -4 * const(size.yscale)

[State 1101, Sound]
type = playsnd
trigger1 = animelem = 9 || animelem = 42
value = 5, 14

[State 1101, Let go]
type = changestate
triggerall = anim = 1101
trigger1 = !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AIlevel && numhelper(1105)
trigger2 = helper(1105), movehit = 2 && random < 350
trigger3 = AIlevel
trigger3 = inguarddist && (p2stateno = [3000, 4999])
value = 1102

[State 1101, End]
type = changestate
triggerall = anim = 1101
trigger1 = !animtime
trigger2 = animelemtime(34) < 0
trigger2 = (pos x * facing) > (gamewidth / 2)
trigger3 = animelemtime(34) >= 0
trigger3 = (pos x * facing) < (gamewidth / -2)
trigger4 = map(strength) = 0
trigger4 = animelem = 34
trigger5 = map(strength) = 1
trigger5 = animelem = 49
value = 1102


;----- Let go -----
[Statedef 1102]
type = A
physics = N
movetype = I
anim = 1102
ctrl = 1
velset = 0, 0
sprpriority = 2

[State 1102, Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !time
value = 1
ignorehitpause = 1
persistent = 0

[State 1102, Accel]
type = veladd
trigger1 = 1
y = 0.456
;18432

[State 1102, Vel]
type = velset
trigger1 = !time
trigger1 = numhelper(1105)
x = helper(1105), fvar(5)
y = helper(1105), fvar(15)

[State 1102, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0
trigger1 = frontedgedist > 0 && backedgedist > 0

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;---Land---
[Statedef 1103]
type = S
physics = S
movetype = I
anim = 1103
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 1103, Pos]
type = posset
trigger1 = 1
y = 0

[State 1103, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1103, Dust]
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

[State 1103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX SENPUUBU>=============================
;----- START -----
[Statedef 1120]
type = U
movetype = A
anim = 1100
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

[State 1120, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1120, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(71 * const(size.xscale)), ceil(-69 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype != A
statetype = S
physics = S

[State 1120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
statetype = A
physics = N

[State 1120, Cloud]
type = explod
trigger1 = animelem = 3
trigger1 = statetype = A
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(16 * const(size.xscale)), 8
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1120, Cloud]
type = explod
trigger1 = animelem = 3
trigger1 = statetype = A
anim = 7107
ID = 7107
sprpriority = -2
postype = p1
pos = ceil(59 * const(size.xscale)), 2
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 17
value = 3, 0
channel = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 0

[State 1120, Width]
type = width
trigger1 = anim = 1100
edge = ceil(60 * const(size.xscale)), 0

[State 1120, Push]
type = playerpush
trigger1 = animelemtime(7) >= 0 || statetype = A
value = 0

[State 1120, Sound]
type = playsnd
trigger1 = animelem = 12
value = 0, 40

[State 1120, Dust]
type = explod
trigger1 = animelem = 12
trigger1 = pos y = 0
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 8, 3
scale = 0.5, 0.5
ownpal = 1

[State 1120, pos12 -15]
type = posadd
trigger1 = animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
x = ifelse((animelem = 12), 25, ifelse((animelem = 13), 5, 4)) * const(size.xscale)
y = ifelse((animelem = 12), -3, ifelse((animelem = 13), -1, ifelse((animelem = 14), -4, -3))) * const(size.yscale)

[State 1120, pos16 -19]
type = posadd
trigger1 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19
x = ifelse((animelem = 16), 7, ifelse((animelem = 17), 4, ifelse((animelem = 18), -21, 3))) * const(size.xscale)
y = ifelse((animelem = 16), -4, ifelse((animelem = 17), -2, ifelse((animelem = 18), -29, -5))) * const(size.yscale)

[State 1120, Type]
type = statetypeset
trigger1 = animelem = 12
statetype = A
physics = N

[State 1120, End]
type = changestate
trigger1 = !animtime
value = 1121


;----- SWING -----
[Statedef 1121]
type = A
physics = N
movetype = A
anim = 1101
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1121, Senpubu Var]
type = mapadd
trigger1 = !time
map = "senpubucount"
value = 1

[State 1121, Push]
type = playerpush
trigger1 = anim = 1101
value = 0

[State 1121, screenbound]
type = screenbound
trigger1 = anim = 1101
value = 0
movecamera = 1, 1

[State 1121, claw]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1105
ID = 1105
name = "Senpuubu Claw"
postype = p1

[State 1121, pos1 -4]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4)
x = ifelse((animelem = 1), -7, ifelse((animelem = 2), 0, ifelse((animelem = 3), 3, 4))) * const(size.xscale)
y = ifelse((animelem = 1), -3, ifelse((animelem = 2), 4, ifelse((animelem = 3), 4, 5))) * const(size.yscale)

[State 1121, pos5 -8]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8)
x = ifelse((animelem = 5), 3, ifelse((animelem = 6), 5, ifelse((animelem = 7), 7, 22))) * const(size.xscale)
y = ifelse((animelem = 5), 4, ifelse((animelem = 6), 5, ifelse((animelem = 7), 8, 11))) * const(size.yscale)

[State 1121, pos9 -12]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12)
x = ifelse((animelem = 9), 4, ifelse((animelem = 10), 9, ifelse((animelem = 11), 5, 18))) * const(size.xscale)
y = ifelse((animelem = 9), 3, ifelse((animelem = 10), 5, ifelse((animelem = 11), 2, 8))) * const(size.yscale)

[State 1121, pos13 -16]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16)
x = ifelse((animelem = 13), 11, ifelse((animelem = 14), 8, ifelse((animelem = 15), 15, 37))) * const(size.xscale)
y = ifelse((animelem = 13), 5, ifelse((animelem = 14), 2, ifelse((animelem = 15), 3, 0))) * const(size.yscale)

[State 1121, pos17 -20]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20)
x = ifelse((animelem = 17), 11, ifelse((animelem = 18), 12, ifelse((animelem = 19), 11, 14))) * const(size.xscale)
y = ifelse((animelem = 17), 0, ifelse((animelem = 18), -1, ifelse((animelem = 19), -1, -3))) * const(size.yscale)

[State 1121, pos21 -24]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24)
x = ifelse((animelem = 21), 21, ifelse((animelem = 22), 7, ifelse((animelem = 23), 25, 5))) * const(size.xscale)
y = ifelse((animelem = 21), -4, ifelse((animelem = 22), -4, ifelse((animelem = 23), -3, -2))) * const(size.yscale)

[State 1121, pos25 -28]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 25 || animelem = 26 || animelem = 27 || animelem = 28)
x = ifelse((animelem = 25), 2, ifelse((animelem = 26), 12, ifelse((animelem = 27), 5, 3))) * const(size.xscale)
y = ifelse((animelem = 25), -1, ifelse((animelem = 26), -9, ifelse((animelem = 27), -2, -4))) * const(size.yscale)

[State 1121, pos29 -32]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32)
x = ifelse((animelem = 29), 2, ifelse((animelem = 30), 5, ifelse((animelem = 31), 4, 3))) * const(size.xscale)
y = ifelse((animelem = 29), -2, ifelse((animelem = 30), -5, ifelse((animelem = 31), -5, -6))) * const(size.yscale)

[State 1121, pos33 -36]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 33 || animelem = 34 || animelem = 35 || animelem = 36)
x = ifelse((animelem = 33), 3, ifelse((animelem = 34), -3, ifelse((animelem = 35), -3, -4))) * const(size.xscale)
y = ifelse((animelem = 33), -4, ifelse((animelem = 34), 4, ifelse((animelem = 35), 6, 5))) * const(size.yscale)

[State 1121, pos37 -40]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 37 || animelem = 38 || animelem = 39 || animelem = 40)
x = ifelse((animelem = 37), -5, ifelse((animelem = 38), -2, ifelse((animelem = 39), -3, -5))) * const(size.xscale)
y = ifelse((animelem = 37), 5, ifelse((animelem = 38), 2, ifelse((animelem = 39), 4, 2))) * const(size.yscale)

[State 1121, pos41 -44]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 41 || animelem = 42 || animelem = 43 || animelem = 44)
x = ifelse((animelem = 41), -12, ifelse((animelem = 42), -2, ifelse((animelem = 43), -5, -25))) * const(size.xscale)
y = ifelse((animelem = 41), 9, ifelse((animelem = 42), 1, ifelse((animelem = 43), 2, 3))) * const(size.yscale)

[State 1121, pos45 -48]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 45 || animelem = 46 || animelem = 47 || animelem = 48)
x = ifelse((animelem = 45), -7, ifelse((animelem = 46), -21, ifelse((animelem = 47), -14, -11))) * const(size.xscale)
y = ifelse((animelem = 45), 4, ifelse((animelem = 46), 4, ifelse((animelem = 47), 3, 1))) * const(size.yscale)

[State 1121, pos49 -52]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 49 || animelem = 50 || animelem = 51 || animelem = 52)
x = ifelse((animelem = 49), -12, ifelse((animelem = 50), -11, ifelse((animelem = 51), -37, -15))) * const(size.xscale)
y = ifelse((animelem = 49), 1, ifelse((animelem = 50), 0, ifelse((animelem = 51), 0, -3))) * const(size.yscale)

[State 1121, pos53 -56]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 53 || animelem = 54 || animelem = 55 || animelem = 56)
x = ifelse((animelem = 53), -8, ifelse((animelem = 54), -11, ifelse((animelem = 55), -18, -5))) * const(size.xscale)
y = ifelse((animelem = 53), -2, ifelse((animelem = 54), -5, ifelse((animelem = 55), -8, -2))) * const(size.yscale)

[State 1121, pos57 -60]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 57 || animelem = 58 || animelem = 59 || animelem = 60)
x = ifelse((animelem = 57), -9, ifelse((animelem = 58), -4, ifelse((animelem = 59), -22, -7))) * const(size.xscale)
y = ifelse((animelem = 57), -5, ifelse((animelem = 58), -3, ifelse((animelem = 59), -11, -8))) * const(size.yscale)

[State 1121, pos61 -64]
type = posadd
trigger1 = anim = 1101
trigger1 = (animelem = 61 || animelem = 62 || animelem = 63 || animelem = 64)
x = ifelse((animelem = 61), -5, ifelse((animelem = 62), -3, ifelse((animelem = 63), -4, -3))) * const(size.xscale)
y = ifelse((animelem = 61), -5, ifelse((animelem = 62), -4, ifelse((animelem = 63), -5, -4))) * const(size.yscale)

[State 1121, pos65]
type = posadd
trigger1 = anim = 1101
trigger1 = animelem = 65
y = -4 * const(size.yscale)

[State 1121, Sound]
type = playsnd
trigger1 = animelem = 9 || animelem = 42
value = 5, 14

[State 1121, End]
type = changestate
triggerall = anim = 1101
trigger1 = !animtime && time > 120
trigger2 = !AIlevel
trigger2 = map(cmd_a) || map(cmd_b) || map(cmd_c)
trigger3 = AIlevel && numhelper(1125)
trigger3 = helper(1125), movehit = 2 && random < 350
trigger4 = animelemtime(34) < 0
trigger4 = (pos x * facing) > (gamewidth / 2)
trigger5 = animelemtime(34) >= 0
trigger5 = (pos x * facing) < (gamewidth / -2)
value = 1102

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1103


;======================<REITOU>=============================
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 50
facep2 = 1

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
value = ifelse(p2bodydist x < 80, 0, ifelse(p2bodydist x < 130, 1, 2))
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
trigger1 = animelem = 5
value = 3, 2
channel = 0

[State 1205, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 5
;channel = 1
stopongethit = 1

[State 1200, Blade]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1205
ID = 1205
name = "Blade"
postype = p1
pos = ifelse(map(strength) = 2, 160, ifelse(map(strength) = 1, 110, 60)), 0
ownpal = 1
size.xscale = const(size.xscale)
size.shadowoffset = -5

[State 1200, Loop]
type = changeanim
trigger1 = animelem = 9
trigger1 = time < 35
value = 1200
elem = 7

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<EX REITOU>=============================
[Statedef 1220]
type = S
physics = S
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

[State 1220, Strength]
type = mapset
trigger1 = time <= 0
map = "strength"
value = 3
ignorehitpause = 1
persistent = 0

[State 1220, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1220, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1220, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-46 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1220, NHB]
type = nothitby
trigger1 = time = [6, 14]
time = 1
value = , AA

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 2
channel = 0

[State 1220, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
;channel = 1
stopongethit = 1

[State 1220, Sound]
type = playsnd
trigger1= time = 10 || time = 14
value = 5, 5
channel = 5

[State 1220, Blade]
type = helper
trigger1 = time = 10
helpertype = normal
stateno = 1205
ID = 1225
name = "Blade"
postype = p1
pos = ceil(40 * const(size.xscale)), 0
facing = 1
ownpal = 1
size.xscale = const(size.xscale)
size.shadowoffset = -5

[State 1220, Blade]
type = helper
trigger1 = time = 10
helpertype = normal
stateno = 1205
ID = 1225
name = "Blade"
postype = p1
pos = ceil(-45 * const(size.xscale)), 0
facing = -1
ownpal = 1
size.xscale = const(size.xscale)
size.shadowoffset = -5

[State 1220, Loop]
type = changeanim
trigger1 = animelem = 9
trigger1 = time < 35
value = 1200
elem = 7

[State 1220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HENKYOUKI>=============================
[Statedef 1300]
type = U
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 75
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1300, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype != A
statetype = S
physics = S

[State 1300, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
statetype = A
physics = N

[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse((statetype != A), 1300, 1301)

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
value = ifelse(p2bodydist x > 45, 2, ifelse(p2bodydist x > 30, 1, 0))
ignorehitpause = 1

[State 1300, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1300, Width]
type = width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(5) < 0
value = ceil(24 * const(size.xscale)), 0

[State 1300, Cloud]
type = explod
trigger1 = anim = 1301
trigger1 = animelem = 2
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(-16 * const(size.xscale)), -12
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1300, Cloud]
type = explod
trigger1 = anim = 1301
trigger1 = animelem = 2
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(70 * const(size.xscale)), -10
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1300, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1300, Soundwave]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1305
ID = 1305
name = "Soundwave"
postype = p1
pos = ceil(67 * const(size.xscale)), ifelse((anim = 1300), -41, -56)
ownpal = 1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 11
channel = 0

[State 1300, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 2
freqmul = ifelse(map(strength) = 2, 0.90, ifelse(map(strength) = 1, 0.95, 1.00))

[State 1300, Shake]
type = envshake
trigger1 = animelem = 5
time = 10
freq = 180
ampl = 2

[State 1300, Dust]
type = explod
trigger1 = animelemtime(5) = 1
trigger1 = pos y >= -25
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ceil(63 * const(size.xscale)), 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1300, Accel]
type = veladd
trigger1 = anim = 1301
trigger1 = animelemtime(10) >= 0
y = const(movement.yaccel); 24576

[State 1300, Startup Fix]
type = changeanim
triggerall = anim = [1300, 1301]
triggerall = animelemtime(3) > 0 && animelemtime(4) < 0
trigger1 = map(strength) = 0 && animelemtime(3) = 2
trigger2 = map(strength) = 0 && animelemtime(3) = 2
value = anim
elem = 4

[State 1300, Recovery]
type = changeanim
triggerall = animelem = 8
triggerall = anim = [1300, 1301]
trigger1 = map(strength) = 0 && time < 31
trigger2 = map(strength) = 1 && time < 36
trigger3 = map(strength) = 2 && time < 40
value = anim
elem = 6

[State 1300, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 1300
value = 0
ctrl = 1

[State 1300, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;========================<EX HENKYOUKI>=============================
[Statedef 1330]
type = U
movetype = A
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
pos = ceil(-10 * const(size.xscale)), ceil(-65 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1330, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype != A
statetype = S
physics = S

[State 1330, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
statetype = A
physics = N

[State 1330, Anim]
type = changeanim
trigger1 = !time
value = ifelse((statetype != A), 1300, 1301)

[State 1330, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1330, Width]
type = width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(5) < 0
value = ceil(24 * const(size.xscale)), 0

[State 1330, Cloud]
type = explod
trigger1 = anim = 1301 && animelem = 2
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(-16 * const(size.xscale)), -12
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1330, Cloud]
type = explod
trigger1 = anim = 1301 && animelem = 2
anim = 7107
ID = 7107
sprpriority = 2
postype = p1
pos = ceil(70 * const(size.xscale)), -10
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 2
channel = 0

[State 1330, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 12

[State 1330, Shake]
type = envshake
trigger1 = animelem = 5
time = 10
freq = 180
ampl = 2

[State 1330, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1330, Soundwave]
type = helper
trigger1 = animelem = 5
helpertype = normal; projectile
stateno = 1335
ID = 1335
name = "Soundwave"
postype = p1
pos = ceil(67 * const(size.xscale)), ifelse((anim = 1300), -41, -56)
ownpal = 1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)

[State 1330, Dust]
type = explod
trigger1 = animelemtime(5) = 1
trigger1 = pos y >= -25
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ceil(63 * const(size.xscale)), 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1330, Accel]
type = veladd
trigger1 = anim = 1301
trigger1 = animelemtime(10) >= 0
y = const(movement.yaccel); 24576

[State 1330, Recovery]
type = changeanim
trigger1 = animelem = 8
trigger1 = anim = [1300, 1301]
trigger1 = time < 41
value = anim
elem = 6

[State 1330, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 1300
value = 0
ctrl = 1

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;======================<HOUTENGEKI>=============================
[Statedef 1400]
type = S
physics = S
movetype = A
velset = 0, 0
ctrl = 0
anim = 1400
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
value = ifelse(p2bodydist x <= (25 * const(size.xscale)), 2, ifelse(p2bodydist x <= (30 * const(size.xscale)), 1, 0))
ignorehitpause = 1

[State 1400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1400, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 1400, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= (ifelse(map(strength) = 2, 25, ifelse(map(strength) = 1, 30, 35)) * const(size.xscale))
ID = 1400
attr = S, ST
hitflag = M
priority = 7, Miss
sparkno = -1 + 0 * (map(sparkno) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1420
guard.dist = 0
fall.recover = 1
fall.recovertime = 120
numhits = 0
hitsound = s2, 800
hitsound.channel = 2

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0

[State 1400, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 1
;channel = 1
stopongethit = 1

[State 1400, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 1410]
type = S
movetype = A
physics = S
anim = 1410
ctrl = 0

[State 1410, Throw]
type = targetstate
trigger1 = !time
value = 1420

[State 1410, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0

[State 1410, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
;channel = 1
stopongethit = 1

[State 1410, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 65 * const(size.xscale), 0

[State 1410, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 48 * const(size.xscale), -103

[State 1410, Bind 3]
type = targetbind
trigger1 = animelem = 3
pos = -8 * const(size.xscale), -140

[State 1410, Throw]
type = targetstate
trigger1 = animelem = 3
value = 1421

[State 1410, End]
type = changestate
trigger1 = !animtime
value = 1411


;----- SPINNING -----
[Statedef 1411]
type = C
movetype = A
physics = C
anim = 1411
ctrl = 0

[State 1411, Sound]
type = playsnd
trigger1 = !(time % 9)
trigger1 = animelemtime(3) >= 0
value = 1, 9
;channel = 1
stopongethit = 1

[State 1411, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 16
freqmul = 1.25
volumescale = 75

[State 1411, Claws]
type = explod
trigger1 = animelem = 3
anim = 1405
ID = 1400
sprpriority = sprpriority + 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1411, Claws]
type = explod
trigger1 = animelem = 3
anim = 1406
ID = 1400
sprpriority = sprpriority - 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1411, Damage]
type = targetlifeadd
trigger1 = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1421
trigger1 = target, pos y >= -(target, const(size.air.front) + 38)
value = floor(-70 * map(damagescaling))
dizzy = 0
persistent = 0

[State 1411, Damage]
type = targetlifeadd
triggerall = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1422
trigger1 = target, pos y >= -(target, const(size.air.front) + 38)
trigger2 = target, stateno = 1423 && !(time % 6)
value = floor(-10 * map(damagescaling))
dizzy = 0

[State 1411, Stun Damage]
type = targetdizzypointsadd
trigger1 = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1421
trigger1 = target, pos y >= -(target, const(size.air.front) + 38)
value = floor(-150 * map(damagescaling))
persistent = 0

[State 1411, Give Power]
type = targetpoweradd
triggerall = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1421 && target, pos y >= -(target, const(size.air.front) + 38)
trigger2 = target, vel y > 0 && target, stateno = 1422 && target, pos y >= -(target, const(size.air.front) + 38)
trigger3 = target, stateno = 1423 && !(time % 6)
value = 10

[State 1411, Get Power]
type = poweradd
trigger1 = time = 26
trigger1 = !map(darkforce)
value = 200 * map(meterscaling); getpower

[State 1411, Hit]
type = hitadd
triggerall = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1421 && target, pos y >= -(target, const(size.air.front) + 38)
trigger2 = target, vel y > 0 && target, stateno = 1422 && target, pos y >= -(target, const(size.air.front) + 38)
trigger3 = target, stateno = 1423 && !(time % 6)
value = 1

[State 1411, HitSound]
type = playsnd
triggerall = animelemtime(3) >= 0 && numtarget
trigger1 = target, vel y > 0 && target, stateno = 1421 && target, pos y >= -(target, const(size.air.front) + 38)
trigger2 = target, vel y > 0 && target, stateno = 1422 && target, pos y >= -(target, const(size.air.front) + 38)
trigger3 = target, stateno = 1423 && !(time % 6)
value = 2, 9
channel = 2

;[State 1411, Spark]
;in ZSS

;[State 1411, Blood]
;in ZSS

[State 1411, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = target, vel y > 0
trigger1 = target, stateno = 1421 && target, pos y >= -(target, const(size.air.front) + 38)
value = 1422

[State 1411, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = target, time && target, vel y > 0
trigger1 = target, stateno = 1422 && target, pos y >= -(target, const(size.air.front) + 38)
value = 1423

[State 1411, Bind]
type = targetbind
trigger1 = numtarget
trigger1 = target, stateno = 1423
pos = -5 * const(size.xscale), -(target, const(size.air.front) + 50)

[State 1411, End]
type = changestate
trigger1 = hitcount >= ifelse(map(strength) = 2, 9, ifelse(map(strength) = 1, 8, 7))
trigger2 = !numtarget
trigger3 = time >= 120
value = 1412


;----- END -----
[Statedef 1412]
type = S
movetype = I
physics = S
anim = 1412
ctrl = 0

[State 1412, End]
type = targetstate
trigger1 = !time
value = 1425

[State 1412, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 1420]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1420, Anim]
type = changeanim2
trigger1 = !time
value = 1420

[State 1420, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1420, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1421]
type = A
physics = N
movetype = H
velset = 0, -10
sprpriority = 2

[State 1421, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1421, NHB]
type = playerpush
trigger1 = 1
value = 0

[State 1421, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)

[State 1421, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5030
value = 5050

[State 1421, Anim]
type = changeanim
trigger1 = anim = 5051
trigger1 = selfanimexist(5061)
trigger1 = vel y > -2
value = 5061

[State 1421, Accel]
type = veladd
trigger1 = 1
y = 0.4850

[State 1421, fix]
type = posadd
trigger1 = animelem = 3
y = -const(size.mid.pos.y)

[State 1421, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


[Statedef 1422]
type = A
physics = N
movetype = H
velset = 0, -6
sprpriority = 0

[State 1422, fix]
type = posadd
trigger1 = !time
y = const(size.mid.pos.y) / 2

[State 1422, Accel]
type = veladd
trigger1 = 1
y = 0.4850

[State 1422, Anim]
type = changeanim2
trigger1 = !time
value = 1422

[State 1422, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1422, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1423]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 1423, Anim]
type = changeanim2
trigger1 = !time
value = 1423

[State 1423, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1423, Shake]
type = offset
trigger1 = 1
x = ifelse(random < 500, -1, 1)
y = ifelse(random < 500, -1, 1)

[State 1423, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1425]
type = A
physics = N
movetype = H

[State 1425, Turn]
type = turn
trigger1 = !time

[State 1425, Accel]
type = veladd
trigger1 = time
y = 0.4850

[State 1425, Accel]
type = velset
trigger1 = !time
x = -3.50
y = -4.50

[State 1425, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5052), 5052, 5030)

[State 1425, Anim]
type = changeanim
trigger1 = anim = 5030
trigger1 = vel y > 0
value = ifelse(selfanimexist(5035), 5035, 5050)

[State 1425, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 1425, Anim]
type = changeanim
trigger1 = anim = 5052
trigger1 = selfanimexist(5062)
trigger1 = vel y >= const240p(2)
value = 5062

[State 1425, Stun]
type = selfstate
trigger1 = !time
trigger1 = alive
trigger1 = dizzypoints <= 0
value = const(statedizzyfalldown_air)

[State 1425, Fall Recovery]
type = selfstate
trigger1 = alive = 1 && dizzy = 0 && dizzypoints > 0
trigger1 = gethitvar(fall.recover)
trigger1 = command = "recovery"
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1425, Hit Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;====================================<PURSUIT>=====================================
[Statedef 1900]
type = S
physics = N
movetype = A
anim = 1900
ctrl = 0
velset = 0, 0
poweradd = 50
sprpriority = 2
facep2 = 1
juggle = 8 * (p2statetype = L)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1900, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1900, Push]
type = playerpush
trigger1 = p2statetype = L
value = 0
ignorehitpause = 1

[State 1900, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 1900, Turn]
type = turn
trigger1 = p2dist x < 0
trigger1 = animelemtime(2) = 1

[State 1900, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 1.152

[State 1900, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = min(p2dist x, 290) / 26.0
y = -13.824

[State 1900, Vel Correction]
type = veladd
trigger1 = numenemy
trigger1 = animelemtime(2) = 1
trigger1 = p2movetype = H
trigger1 = p2statetype = A || p2statetype = L
x = (p2, vel x) * (p2, facing) * facing

[State 1900, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0

[State 1900, Claws]
type = explod
trigger1 = animelem = 10
anim = 1905
ID = 1905
sprpriority = sprpriority + 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1900, Claws]
type = explod
trigger1 = animelem = 10
anim = 1906
ID = 1905
sprpriority = sprpriority - 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1900, Sound]
type = playsnd
trigger1 = !(gametime % 9)
trigger1 = animelemtime(10) >= 0
value = 1, 9
;channel = 1
stopongethit = 1
ignorehitpause = 1

[State 1900, Hit]
type = hitdef
trigger1 = !((movecontact + movereversed) % 8)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = 15, 4
redlife = 15, 4
dizzypoints = 0
animtype = Hard
guardflag = HA
hitflag = FD
priority = 4, Hit
pausetime = 0, 10
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -32) * (map(sparkx.max) := 44), map(sparky) := -25
hitsound = s2, 9
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
air.velocity = 0, 0
down.velocity = 0, 0
down.hittime = 18
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
p1sprpriority = sprpriority
forcestand = 1
ID = 1900

[State 1900, Lock On]
type = posfreeze
trigger1 = movehit = [1, 12]
value = 1

[State 1900, Lock On]
type = posset
trigger1 = movehit = 1
trigger1 = hitcount = 1
trigger1 = numtarget(1900) = 1
trigger1 = target(1900), statetype = L
x = target(1900), pos x
y = 0

[State 1900, Jump Back]
type = changestate
trigger1 = time >= 60
trigger2 = hitcount >= 4
value = 1910

[State 1900, End]
type = changestate
trigger1 = movehit != [1, 12]
trigger1 = vel y > 0
trigger1 = pos y >= 10
value = 52


;----- Recover -----
[Statedef 1910]
type = A
physics = N
movetype = I
ctrl = 0
anim = 43
sprpriority = 2
movehitpersist = 1

[State 1910, Remove Pursuit FX]
type = removeexplod
trigger1 = numexplod(1905)
ID = 1905

[State 1910, Accel]
type = veladd
trigger1 = 1
y = 0.92

[State 1910, Accel]
type = velset
trigger1 = !time
x = -5.33
y = -11.98

[State 1910, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1911


;----- Land -----
[Statedef 1911]
type = S
physics = N
movetype = I
ctrl = 0
anim = 1911
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 1911, Pos]
type = posset
trigger1 = 1
y = 0

[State 1911, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 1911, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1911, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=============================<EX PURSUIT>============================
[Statedef 1930]
type = A
physics = N
movetype = A
anim = 1900
velset = 0, 0
poweradd = -500
sprpriority = 2
ctrl = 0
facep2 = 1
juggle = 8 * (p2statetype = L)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 1930, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_special) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 1930, EX FX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1930, EX FX]
type = explod
trigger1 = !time
trigger1 = 1 || map(exflash) := 30
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(10 * const(size.xscale)), ceil(-80 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1930, Push]
type = playerpush
trigger1 = p2statetype = L
value = 0
ignorehitpause = 1

[State 1930, Turn]
type = turn
trigger1 = p2dist x < 0
trigger1 = animelemtime(2) = 1

[State 1930, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 1.152

[State 1930, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = min(p2dist x, 290) / 26.0
y = -13.824

[State 1930, Vel Correction]
type = veladd
trigger1 = numenemy
trigger1 = animelemtime(2) = 1
trigger1 = p2movetype = H
trigger1 = p2statetype = A || p2statetype = L
x = (p2, vel x) * (p2, facing) * facing

[State 1930, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0

[State 1930, Claws]
type = explod
trigger1 = animelem = 10
anim = 1905
ID = 1905
sprpriority = sprpriority + 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1930, Claws]
type = explod
trigger1 = animelem = 10
anim = 1906
ID = 1905
sprpriority = sprpriority - 1
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removetime = 180
removeongethit = 1
removeonchangestate = 1

[State 1930, Sound]
type = playsnd
trigger1 = !(gametime % 9)
trigger1 = animelemtime(10) >= 0
value = 1, 9
;channel = 1
stopongethit = 1
ignorehitpause = 1

[State 1930, Hit]
type = hitdef
trigger1 = !((movecontact + movereversed) % 6)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, SA
damage = 10, 3
redlife = 10, 3
dizzypoints = 0
animtype = Hard
guardflag = HA
hitflag = FD
priority = 4, Hit
pausetime = 0, 10
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -32) * (map(sparkx.max) := 44), map(sparky) := -25
hitsound = s2, 9
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
air.velocity = 0, 0
down.velocity = 0, 0
down.hittime = 18
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
p1sprpriority = sprpriority
forcestand = 1
ID = 1930

[State 1930, Lock On]
type = posfreeze
trigger1 = movehit = [1, 12]
value = 1

[State 1930, Lock On]
type = posset
trigger1 = movehit = 1
trigger1 = hitcount = 1
trigger1 = numtarget(1930) = 1
trigger1 = target(1930), statetype = L
x = target(1930), pos x
y = 0

[State 1930, Jump Back]
type = changestate
trigger1 = time >= 80
trigger2 = hitcount >= 8
value = 1910

[State 1930, End]
type = changestate
trigger1 = movehit != [1, 12]
trigger1 = vel y > 0
trigger1 = pos y >= 10
value = 52


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
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Width]
type = width
trigger1 = animelem = 3
player = ceil(50 * const(size.xscale)), 0
ignorehitpause = 1

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 2900, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
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
hitsound = s2, 9
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 145), map(sparky) := -64
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2900, Type]
type = statetypeset
trigger1 = animelem = 5
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
value = 3, ifelse(random < 500, 2, 8)
channel = 0

[State 2910, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 8
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
hitsound = s2, 9
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 124), map(sparky) := -16
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1
