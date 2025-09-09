; _____________________________________
;| Rare Akuma by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<SPECIAL STATES>=======================================
;==============================================================================================

;========================<GOU HADOU KEN>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "236z", 3, ifelse(command = "236y", 2, 1))

[State 1000, Strength AI]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 500, 2, 1))

[State 1000, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(10) < 0
value = 30, 0

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 2
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 1000, charge]
type = palfx
triggerall = time < 60 && !ishelper
triggerall = animelemtime(4) >= 0 && animelemtime(4) < 1
trigger1 = !AIlevel && (command = "/x" || command = "/y" || command = "/z")
trigger2 = AIlevel && ((time = 7 && numhelper(1005) && random < 250) || time > 7)
add = 64, 64, 64
sinadd = -64, -64, -64, 12
time = 3

[State 1000, charge]
type = changeanim
triggerall = time < 60 && !ishelper
triggerall = animelemtime(4) >= 0 && animelemtime(4) < 1
trigger1 = !AIlevel && (command = "/x" || command = "/y" || command = "/z")
trigger2 = AIlevel && ((time = 7 && numhelper(1005) && random < 250) || time > 7)
value = 1000
elem = 3

[State 1000, Hadouken]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = ifelse(time >= 60, 1015, 1005)
ID = ifelse(time >= 60, 1015, 1005)
name = "Hadouken"
postype = p1
pos = ceil(78 * const(size.xscale)), ceil(-68 * const(size.xscale))
ownpal = 1
immortal = 1
size.height = ifelse(ishelper, 1, const(size.height))
size.xscale = ifelse(time >= 60, 2, 1) * ifelse(ishelper, 0.5, 1)
size.yscale = ifelse(time >= 60, 2, 1) * ifelse(ishelper, 0.5, 1)

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, ifelse(time >= 60, 6, 3)
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, ifelse(time >= 60, 2, 0)

[State 1000, Dust]
type = explod
trigger1 = animelem = 5 && time >= 60
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 42, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 1000, wait]
type = changeanim
trigger1 = numhelper(1015) && !var(20)
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger1 = helper(1015), stateno = 1015 && helper(1015), movetype != H
value = 1000
elem = 8

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<ZANKUU HADOU KEN>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
poweradd = 72
sprpriority = 1

[State 1050, moar]
type = changeanim
trigger1 = !AIlevel && (time = [0, 48])
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger1 = command = "x" || command = "y" || command = "z"
value = 1050

[State 1050, Strength]
type = varset
trigger1 = animelem = 1 && !AIlevel
var(10) = ifelse(command = "236z", 3, ifelse(command = "236y", 2, ifelse(command = "z", 3, ifelse(command = "y", 2, 1))))

[State 1050, Strength AI]
type = varset
trigger1 = animelem = 1 && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 500, 2, 1))

[State 1050, Width]
type = width
trigger1 = (animelemtime(2) >= 0 && animelemtime(4) < 0) || (animelemtime(5) >= 0 && animelemtime(6) < 0)
value = 27, 0

[State 1050, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 5
helpertype = normal
stateno = 1055
ID = 1005
name = "Hadouken"
postype = p1
pos = ceil(ifelse((animelem = 2), 54, 67) * const(size.xscale)), ceil(ifelse((animelem = 2), -48, -48) * const(size.xscale))
ownpal = 1
immortal = 1
size.height = ifelse(ishelper, 1, const(size.height))
size.xscale = 1 * ifelse(ishelper, 0.5, 1)
size.yscale = 1 * ifelse(ishelper, 0.5, 1)

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 3, 10
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 5, 0
channel = 1

[State 1050, Vel]
type = velset
trigger1 = animelemtime(8) < 0
x = ifelse(vel x > 1, 1, ifelse(vel x < -1, -1, vel x))
y = ifelse(vel y < -2, -2, ifelse(vel y > 0, 0, vel y))

[State 1050, Accel]
type = veladd
trigger1 = animelemtime(8) >= 0
y = const(movement.yaccel)

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;========================<GOU SHORYUU KEN>=============================
[Statedef 1100]
type = A
physics = N
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72
juggle = 0
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "623z", 3, ifelse(command = "623y", 2, 1))

[State 1100, Strength AI]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ifelse(p2movetype = H, 3, ifelse(random < 333, 2, 1))

[State 1100, NHB]
type = nothitby
trigger1 = anim = 1100
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = !pos y
statetype = S
physics = N

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = pos y
statetype = A
physics = N

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 4
x = ifelse(var(10) = 3, 24, ifelse(var(10) = 2, 18, 12))
y = ifelse(var(10) = 3, -24, ifelse(var(10) = 2, -18, -12))

[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, ifelse(ishelper, 42, 40)

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 3, 9
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

ignorehitpause = 1
persistent = 0

[State 1100, Width]
type = width
trigger1 = vel y < 0
edge = const(size.air.front)

[State 1100, Hit]
type = hitdef
trigger1 = (animelem = 2) && anim = 1100
trigger2 = (animelem = 3) && anim = 1100
attr = S, SA
damage = ifelse(var(10) = 3, 73, ifelse(var(10) = 2, 66, 56)), 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = 1
guard.sparkno = 40
sparkxy = -10, ifelse((animelem = 2), -52, -75)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0.5, -6
air.type = Low
air.velocity = 0.5, -6
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
fall.animtype = Medium
kill = var(20) <= 0

[State 1100, Hit 2]
type = hitdef
trigger1 = (animelem = 4) && anim = 1100
attr = A, SA
damage = 28, 7
animtype = Up
fall.animtype = Up
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 16, 16
sparkno = 1
guard.sparkno = 40
sparkxy = -10, -100
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2 * var(10), -8 -4 * var(10)
air.type = Low
air.velocity = -2 * var(10), -8 -4 * var(10)
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
yaccel = 0.5
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
statetype = A
physics = A

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101


;========================<TATSUMAKI ZANKUU KYAKU>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72
juggle = 0
facep2 = 1

[State 1200, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "214c", 3, ifelse(command = "214b", 2, 1))

[State 1200, Strength AI]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ifelse(p2movetype = H, 3, 1)

[State 1200, NHB]
type = nothitby
trigger1 = anim = 1200
value = SCA
time = 1
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 3, 11
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, ifelse(ishelper, 42, 40)

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = A

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 7
y = -7

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 7
y = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1201
trigger1 = ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(18) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Hit]
type = hitdef
trigger1 = anim = 1200 && animelemtime(2) = -1
trigger2 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20)
attr = S, SA
damage = ifelse(var(10) = 1, 45, 37), 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 14, 14
sparkno = 1
guard.sparkno = 40
sparkxy = -10, ifelse((anim = 1200), -62, -69)
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.5, -8
air.type = Low
air.velocity = -2.5, -6.5
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0

[State 1200, Hit B]
type = hitdef
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23)
attr = S, SA
damage = ifelse(var(10) = 1, 45, 37), 7
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 14, 14
sparkno = 1
guard.sparkno = 40
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 3, -8
air.type = Low
air.velocity = 3, -6.5
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = var(20) <= 0


;========================<ASHURA SENKUU>=============================
[Statedef 1400]
type = S
physics = N
movetype = I
anim = 1400
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "623pp", 3, ifelse(command = "623kk", 2, ifelse(command = "421pp", -3, -2)))

[State 1400, Strength]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ifelse(random < 500, 1, -1) * ifelse(random < 750, 2, 3)

[State 1400, afterimage]
type = afterimage
trigger1 = animelem = 3
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 3 || var(10) = -3), 24, 18)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1400, aura]
type = helper
trigger1 = animelem = 3 && !ishelper
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
pausemovetime = var(20)
persistent = 0

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -6, ifelse(var(10) = -3, 12, 6))) * sin((time -2) / 2)

[State 1400, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 25, ifelse(var(10) = 2, 12, ifelse(var(10) = -3, -25, -12)))

[State 1400, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 8, 5)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 6
persistent = 0

[State 1400, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 1400, Camera]
type = screenbound
trigger1 = animelemtime(6) >= 0
value = 0
movecamera = 0, 0

[State 1400, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1400, move]
type = posadd
trigger1 = frontedgedist < -32
x = -384

[State 1400, move]
type = posadd
trigger1 = backedgedist < -32
x = 384

[State 1400, turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changestate
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 20, 12)
value = 0
ctrl = 1


;========================<ZENPOU TENSHIN>=============================
[Statedef 1450]
type = S
physics = N
movetype = I
anim = 1450
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1

[State 1450, Strength]
type = varset
trigger1 = !time
trigger1 = !AIlevel
var(10) = ifelse(command = "214z", 3, ifelse(command = "214y", 2, 1))

[State 1450, Strength AI]
type = varset
trigger1 = !time
trigger1 = AIlevel
var(10) = ifelse(random < 500, 1, ifelse(random < 500, 2, 3))

[State 1450, Type]
type = statetypeset
trigger1 = anim = 1450 && animelemtime(3) >= 0
statetype = C

[State 1450, Type]
type = statetypeset
trigger1 = anim = 1451 && animelemtime(3) >= 0
statetype = S
physics = S

[State 1450, Vel]
type = velset
trigger1 = anim = 1450 && animelemtime(2) >= 0
x = 6

[State 1400, Snd]
type = playsnd
trigger1 = anim = 1450 && animelem = 2
value = 0, 105
persistent = 0

[State 1450, Dust]
type = explod
trigger1 = anim = 1450 && animelemtime(4) >= 0 && !(animelemtime(4) % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = -1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1450, Push]
type = playerpush
trigger1 = anim = 1450
trigger2 = anim = 1451 && animelemtime(3) < 0
value = 0

[State 1450, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = 1

[State 1450, Hadouken]
type = helper
trigger1 = !(time % 4)
trigger1 = anim = 1450
trigger1 = numhelper(1025) < 8
helpertype = normal
stateno = 1025
ID = 1025
name = "Hadouken"
postype = p1
pos = 0, ceil(-20 * const(size.xscale))
immortal = 1
ownpal = 1
size.height = ifelse(ishelper, 1, const(size.height))
size.xscale = 0.5 * ifelse(ishelper, 0.5, 1)
size.yscale = 0.5 * ifelse(ishelper, 0.5, 1)

[State 1450, Anim]
type = changeanim
trigger1 = anim = 1450
trigger1 = ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(8) >= 0, animelemtime(4) >= 0))
value = 1451

[State 1450, Dust]
type = explod
trigger1 = anim = 1451 && animelem = 3
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 25, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1400, Snd]
type = playsnd
trigger1 = anim = 1451 && animelem = 3
value = 0, 100
persistent = 0

[State 1450, End]
type = changestate
trigger1 = anim = 1451 && !animtime
value = 0
ctrl = 1


;========================<TENMA SHURETTOU>=============================
;--- POSE ---
[Statedef 1500]
type = S
physics = S
movetype = I
anim = 1500
ctrl = 0
velset = 0, 0
facep2 = 1

[State 1500, reversal]
type = reversaldef
trigger1 = animelem = 3
reversal.attr = SCA, AA, AP, AT
p1stateno = 1505
pausetime = 0, 12
hitsound = -1
sparkno = -1
sparkxy = 0, 0
numhits = 0

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- wow ---
[Statedef 1505]
type = S
movetype = I
physics = N
juggle = 0
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 1505]
type = pause
trigger1 = var(20) <= 0
time = 2
movetime = 2

[State 1505, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1505]
type = helper
trigger1 = !time
trigger1 = (var(31) := anim || var(32) := animelemno(0)) ** 0
helpertype = normal
stateno = 1511
name = "Afterimage"
postype = p1
pausemovetime = 999
supermovetime = 999

[State 1505]
type = changeanim
trigger1 = !time
value = 1505

[State 1505]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1510
name = "Log"
postype = p1
pos = 0, -32
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 999
supermovetime = 999

[State 1505]
type = posadd
trigger1 = !time
x = ceil(p2dist x + 64)

[State 1505]
type = posset
trigger1 = !time
y = 0

[State 1505]
type = posset
trigger1 = !time
trigger1 = numenemy && (prevstateno = [5000, 5120])
x = ifelse((p2, pos x) > 0, -140, 140)

[State 1505]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 1505, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 1505, Snd]
type = playsnd
trigger1 = !time
value = 5, 16

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8
value = 1, 6
channel = 1

[State 1505, Snd]
type = bgpalfx
trigger1 = 1
time = 2
mul = 128, 128, 128

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 11
value = 0, 52

[State 1505, Dust]
type = explod
trigger1 = animelem = 11
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1505, Narrator]
type = helper
trigger1 = animelem = 12
trigger1 = !ishelper
trigger1 = !numhelper(7680)
trigger1 = prevstateno = [5000, 5120]
trigger1 = p2life <= life
trigger1 = random < 125 || (!AIlevel && command = "/s")
helpertype = normal
stateno = 7680
ID = 7680
name = "Narrator"
postype = left
ownpal = 1
pausemovetime = 999
supermovetime = 999
size.height = ifelse(random < 500, 7, 4); Narrator line

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- wow ---
[Statedef 1507]
type = A
movetype = I
physics = N
juggle = 0
velset = 0, 0
sprpriority = 1
poweradd = -500
ctrl = 0

[State 1507, Camera]
type = screenbound
trigger1 = time < 8 && numenemy
trigger1 = enemy, frontedgebodydist > 0 && enemy, backedgebodydist > 0
value = 0
movecamera = 1, 1

[State 1507]
type = pause
trigger1 = var(20) <= 0
time = 2
movetime = 2

[State 1507, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 1507]
type = helper
trigger1 = !time
trigger1 = ((var(31) := anim) || (var(32) := animelemno(0))) ** 0
helpertype = normal
stateno = 1511
name = "Afterimage"
postype = p1
pausemovetime = 999
supermovetime = 999

[State 1507]
type = changeanim
trigger1 = !time
value = 1507

[State 1507]
type = helper
trigger1 = !time
trigger1 = (prevstateno = [5000, 5120])
helpertype = normal
stateno = 1510
name = "Log"
postype = p1
pos = 0, -32
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 999
supermovetime = 999

[State 1507]
type = posadd
trigger1 = !time
trigger1 = !AIlevel
trigger1 = (command = "holdfwd" + command = "holdback") = 1
trigger1 = (command = "holdfwd" + command = "holdback" + command = "holdup" + command = "holddown") = [1, 2]
x = ifelse(command = "holdfwd", 320, -320)

[State 1507]
type = posadd
trigger1 = !time
trigger1 = !AIlevel
trigger1 = (command = "holdup" + command = "holddown") = 1
trigger1 = (command = "holdfwd" + command = "holdback" + command = "holdup" + command = "holddown") = [1, 2]
y = ifelse(command = "holdup", -320, 320)

[State 1507]
type = posadd
trigger1 = !time
trigger1 = (command = "holdfwd" + command = "holdback" + command = "holdup" + command = "holddown") != [1, 2]
x = ceil(p2dist x + 48)
y = ifelse(p2statetype = A, ceil(p2dist y -32), ceil(p2dist y))

[State 1507]
type = posset
trigger1 = pos y > 0
y = 0

[State 1507]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 1507, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 1507, Snd]
type = playsnd
trigger1 = !time
value = 5, 16

[State 1507, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8
value = 1, 6
channel = 1

[State 1507, Snd]
type = bgpalfx
trigger1 = 1
time = 2
mul = 128, 128, 128

[State 1507, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = 1


;========================<CHOCOLATE>=============================
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
poweradd = 72
sprpriority = 1
facep2 = 1

[State 1600]
type = attackdist
trigger1 = animelemtime(5) < 0
value = 320

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 3
channel = 0
freqmul = ifelse(ishelper, 1.5, 1)

[State 1600, beam]
type = helper
trigger1 = animelem = 4 && !var(20)
helpertype = normal
stateno = 1605
ID = 1605
name = "Chocolate Beam"
postype = p1
ownpal = 1
immortal = 1
size.xscale = 1
size.yscale = 1

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 4 && !var(20)
value = 5, 0

[State 1600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target as chocolate ---
[Statedef 1650]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1650, End]
type = removeexplod
trigger1 = ishelper

[State 1650, End]
type = destroyself
trigger1 = ishelper

[State 1650, Anim]
type = changeanim2
trigger1 = 1
value = 1650

[State 1650, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 1650, Pos]
type = posset
trigger1 = 1
y = -1

[State 1650, turn]
type = turn
trigger1 = p2dist x < 0

[State 1650, jump]
type = changestate
trigger1 = command = "holdup"
value = 1652

[State 1650, walk]
type = changestate
trigger1 = (command = "holdfwd" + command = "holdback") = 1
value = 1651


;--- Walking ---
[Statedef 1651]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1651, Anim]
type = changeanim2
trigger1 = 1
value = 1650

[State 1651, Pos]
type = posset
trigger1 = 1
y = -1

[State 1651, turn]
type = turn
trigger1 = p2dist x < 0

[State 1651, Vel]
type = velset
trigger1 = command = "holdfwd"
x = 2

[State 1651, Vel]
type = velset
trigger1 = command = "holdback"
x = -2

[State 1651, jump]
type = changestate
trigger1 = command = "holdup"
value = 1652

[State 1651, Stop]
type = changestate
trigger1 = (command = "holdfwd" + command = "holdback") != 1
value = 1650


;--- Jumping ---
[Statedef 1652]
type = A
physics = N
movetype = H
ctrl = 0
facep2 = 1
velset = 0, 0
sprpriority = 1

[State 1652, Anim]
type = changeanim2
trigger1 = 1
value = 1650

[State 1652, Vel]
type = veladd
trigger1 = 1
y = 0.5

[State 1652, Vel]
type = velset
trigger1 = !time
trigger1 = command = "holdfwd" && command != "holdback"
x = 2

[State 1652, Vel]
type = velset
trigger1 = !time
trigger1 = command != "holdfwd" && command = "holdback"
x = -2

[State 1652, Vel]
type = velset
trigger1 = !time
y = -8

[State 1652, land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1650


;--- Recover ---
[Statedef 1655]
type = S
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 1655, Pos]
type = posset
trigger1 = 1
y = 0

[State 1655, End]
type = selfstate
trigger1 = 1
value = 5201


;========================<AKUMA JUNIORS>=============================
[Statedef 1900]
type = S
physics = S
movetype = I
anim = 1900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -500 * (var(20) <= 0)
facep2 = 1

[State 1900, Dust]
type = explod
triggerall = animelem = 5
trigger1 = numhelper(1) >= ifelse(var(20) > 0, 12, 3)
trigger2 = ishelper
anim = f120
sprpriority = 3
postype = p1
pos = ceil(-20 * const(size.xscale)), ceil(-48 * const(size.yscale))
vel = 2, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1900, FX]
type = helper
trigger1 = animelem = 5
trigger1 = !ishelper
trigger1 = numhelper(1) < ifelse(var(20) > 0, 12, 3)
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
pos = -20, -48
keyctrl = 1
size.xscale = 0.5
size.yscale = 0.5
size.height = 1
ownpal = 1
immortal = 1
pausemovetime = 8
supermovetime = 8

[State 1900, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 2
channel = 0

[State 1900, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 18
freqmul = 0.9 + (random / 5000.0)

[State 1900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
