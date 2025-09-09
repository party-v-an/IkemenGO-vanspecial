; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<SATELLITE BEAM>=============================
[Statedef 3250]
type = A
physics = N
movetype = A
anim = 3250
ctrl = 0
sprpriority = 5

[State 3250, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3250, Pos]
type = posset
trigger1 = 1
y = 0

[State 3250, Scale]
type = angledraw
trigger1 = 1
scale = 0.5 + (random / 1000.0), 1

[State 3250, Layering]
type = sprpriority
trigger1 = 1
value = ifelse((gametime % 2), -2, 5)

[State 3250, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128 + ceil(128 * random / 1000.0), 256
ignorehitpause = 1

[State 3250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
mul = 192, 0, 96

[State 3250, BG PalFX]
type = bgpalfx
trigger1 = !(time % 2)
time = 1
color = 0
invertall = 1

[State 3250, Shake]
type = envshake
trigger1 = !(time % 4)
time = 4
ampl = 3
freq = 180
mul = 0.667

[State 3250, Sound]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 3250, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, 0
scale = 1, 1
ownpal = 1

[State 3250, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 3255
ID = 3255
name = "Dooooon!!!"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

; Damage Scaling was here

[State 3250, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3203
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3250, Spark Position]
type = null
trigger1 = 1 || map(sparkx.min) := (-20 + (random / 25))
trigger1 = 1 || map(sparkx.max) := map(sparkx.min)
trigger1 = 1 || map(sparky) := (p2dist y + p2, const(size.mid.pos.y) - 20 + (random / 25))

[State 3250, Hit]
type = hitdef
trigger1 = !((movecontact + movereversed) % 4)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3250
attr = S, HP
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 7, 2
dizzypoints = 0
guard.dist = 320
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -9, -6
guard.velocity = -10.52
air.velocity = -9, -6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, 0
p1sprpriority = sprpriority
palfx.time = 30
palfx.color = -256
palfx.invertall = 1
palfx.sinadd = 255, 255, 255, 4
;no envshake

[State 3250, P2 State]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(3250) = 1
trigger1 = target(3250), selfanimexist(7696)
trigger1 = target(3250), stateno = 5000 || target(3250), stateno = 5010 || target(3250), stateno = 5020
ID = 3250
value = 3270
ignorehitpause = 1

[State 3250, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 2, 0)
channel = 2
ignorehitpause = 1

[State 3250, End]
type = changestate
trigger1 = time >= 60
value = 3251
ignorehitpause = 1


[Statedef 3251]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3250
velset = 0, 0
sprpriority = 5

[State 3251, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(time / 16.0), 1

[State 3250, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (time * 16), 256

[State 3251, End]
type = destroyself
trigger1 = time >= 16


;========================<SATELLITE ANIMATION>=============================
[Statedef 3260]
type = A
velset = 0, 0
anim = 9999

[State 3260, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 3260, Black]
type = envcolor
trigger1 = 1
value = 0, 0, 0

[State 3260, Pos]
type = pause
trigger1 = !time
time = 42
movetime = 42

[State 3260, Sound]
type = playsnd
trigger1 = !time
value = 7, 6
channel = 0

[State 3260, Space]
type = explod
trigger1 = !time
anim = 3260
ID = 3260
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 26, 56)
ontop = 1
scale = 0.833, 1
bindtime = -1
supermovetime = -1
pausemovetime = -1
removetime = 300

[State 3260, Satellite]
type = explod
trigger1 = !time
anim = 3261
ID = 3261
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 26, 56)
ontop = 1
scale = 0.833, 1
supermovetime = -1
pausemovetime = -1
removetime = 300

[State 3260, Satellite]
type = modifyexplod
trigger1 = numexplod(3261)
ID = 3261
postype = left
pos = ceil(165 - time * 0.2), ifelse((gamewidth / gameheight) > 1.55, 26, 56)

[State 3260, End]
type = removeexplod
trigger1 = time >= 42

[State 3260, End]
type = destroyself
trigger1 = !numexplod
value = 3250


;========================<IMPACT FX>=============================
[Statedef 3205]
type = A
velset = 0, 0
anim = 9999

[State 3205, Circle]
type = explod
trigger1 = !numexplod(3205)
anim = 8290
ID = 3205
sprpriority = -10
postype = p1
pausemovetime = -1
supermovetime = -1
vel = 0, 0.50
ownpal = 1

[State 3205, Scale]
type = modifyexplod
trigger1 = numexplod(3205)
ID = 3205
scale = 0.2 + (0.1 * time), 0.033 + (0.0167 * time)
trans = addalpha
alpha = ceil(256 -(12.8 * time)), 256

[State 3205, Safety]
type = removeexplod
trigger1 = time >= 20

[State 3205, End]
type = destroyself
trigger1 = time >= 20


;========================<LIGHTING FX>=============================
[Statedef 3206]
type = A
physics = N
movetype = I
anim = 3206
ctrl = 0
sprpriority = 2

[State 3206, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3206, Bind]
type = bindtoroot
trigger1 = 1

[State 3206, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3206, End]
type = destroyself
trigger1 = root, stateno != 3203
trigger2 = root, movetype = H


;========================<DON!>=============================
[Statedef 3255]
type = A
velset = 0, 0
anim = 3255
sprpriority = 5

[State 3255, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 3255, Turn]
type = turn
trigger1 = facing = -1

[State 3255, Pos]
type = posset
trigger1 = !time
y = -120

[State 3255, Scale]
type = angledraw
trigger1 = 1
scale = 0.5 + (0.05 * time), 0.5 + (0.05 * time)

[State 3255, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -8.53 * time), ceil(8.53 * time)

[State 3255, End]
type = destroyself
trigger1 = time >= 30


;====================<HELICOPTER>====================
[Statedef 6000]
type = A
physics = N
anim = 6000
velset = 0, 0
ctrl = 0
sprpriority = -5

[State 6000, Pos]
type = posset
trigger1 = 1
x = -168 * facing
y = ceil(pos y -screenpos y) + ceil(sin(time / 30.0 * pi) * 4) -8

[State 6000, Timer]
type = null
trigger1 = !time
trigger1 = map(introtime) := 0
trigger2 = time > 0
trigger2 = roundstate != 0
trigger2 = map(introtime) := (map(introtime) + 1)

[State 6000, Sound]
type = playsnd
trigger1 = 1
value = 7, 0
channel = 0
lowpriority = 1

[State 6000, Door Sound]
type = playsnd
trigger1 = map(introtime) = 30
trigger2 = map(introtime) = 150
value = 7, 7
channel = 1

[State 6000, Door]
type = modifyexplod
trigger1 = numexplod(6001)
trigger1 = roundstate = 0
ID = 6001
anim = 6001

[State 6000, Door]
type = explod
trigger1 = !time
anim = 6001
ID = 6001
sprpriority = -3
postype = p1
bindtime = -1
removetime = 600
scale = const(size.xscale), const(size.yscale)
ownpal = 1

[State 6000, Shake]
type = envshake
trigger1 = !(time % 4)
time = 4
ampl = 1
freq = 180

[State 6000, Dust]
type = explod
trigger1 = !(time % 9)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
ownpal = 1

[State 6000, Dust]
type = explod
trigger1 = !(time % 12)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 1, 1
ownpal = 1

[State 6000, Dust]
type = explod
trigger1 = !(time % 15)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 1.5, 1.5
ownpal = 1

[State 6000, End]
type = changestate
trigger1 = map(introtime) >= 240
value = 6001


;----- Fly Away -----
[Statedef 6001]
type = A
physics = N
velset = 0, 0
ctrl = 0
sprpriority = -5

[State 6001, Sound]
type = playsnd
trigger1 = !time
value = 7, 1
channel = 0

[State 6001, Sound];automatic in Ikemen
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 6001, Dust]
type = explod
trigger1 = !time || time = 12
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = ifelse(!time, 0.5, 1), ifelse(!time, 0.5, 1)
ownpal = 1

[State 6001, Accel]
type = veladd
trigger1 = vel x > -3
x = -0.2

[State 6001, Accel]
type = veladd
trigger1 = vel y > -10
y = -0.1

[State 6001, Safety]
type = removeexplod
trigger1 = frontedgedist < -160 || backedgedist < -160
trigger1 = screenpos y != [-212, 0]

[State 6001, End]
type = destroyself
trigger1 = frontedgedist < -160 || backedgedist < -160
trigger1 = screenpos y != [-212, 0]


;====================<ISHIZAKI>====================
;----- Intro -----
[Statedef 6010]
type = S
physics = N
anim = 6010
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 6010, End]
type = changestate
trigger1 = roundstate != [0, 1]
trigger2 = numhelper(6015)
trigger2 = helper(6015), stateno != 6015
trigger3 = root, stateno != 191
value = 6011


[Statedef 6011]
type = S
physics = N
anim = 6011
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 6011, Shake]
type = offset
trigger1 = time < 12
x = ifelse((gametime % 2), -1, 1)

[State 6011, Freeze]
type = assertspecial
trigger1 = time < 12
flag = animfreeze

[State 6011, End]
type = changestate
trigger1 = time >= 48
value = 6012


[Statedef 6012]
type = S
physics = N
anim = 6012
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 6012, Turn]
type = turn
trigger1 = !time
[State 6012, Vel]
type = velset
trigger1 = !time
x = 4

[State 6012, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


;----- Drink -----
[Statedef 6020]
type = S
physics = N
anim = 6020
velset = 4, 0
ctrl = 0
sprpriority = 1

[State 6020, End]
type = changestate
trigger1 = rootdist x <= 80
value = 6021


[Statedef 6021]
type = S
physics = N
anim = 6021
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 6021, Sound]
type = playsnd
trigger1 = !time
value = 7, 2

[State 6021, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;----- First Aid (Enemy) -----
[Statedef 6030]
type = S
physics = N
anim = 6030
velset = 4, 0
ctrl = 0
sprpriority = 1

[State 6030, End]
type = changestate
trigger1 = numenemy
trigger1 = abs(enemy, pos x -pos x) <= 80
value = 6031


[Statedef 6031]
type = S
physics = N
anim = 6031
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 6031, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;----- Running away -----
[Statedef 6040]
type = S
physics = N
anim = 6040
velset = 4, 0
ctrl = 0
sprpriority = -5

[State 6040, End]
type = destroyself
trigger1 = frontedgedist < -80


;----- First Aid (Karin) -----
[Statedef 6050]
type = S
physics = N
anim = 6030
velset = 4, 0
ctrl = 0
sprpriority = 1

[State 6050, End]
type = changestate
trigger1 = rootdist x <= 80
value = 6051


[Statedef 6051]
type = S
physics = N
anim = 6031
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 6051, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;========================<TRAY>=============================
[Statedef 6015]
type = A
physics = N
anim = 6015
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 6015, Vel]
type = posset
trigger1 = !time
y = -90

[State 6015, Accel]
type = veladd
trigger1 = 1
y = 0.0625

[State 6015, Vel]
type = velset
trigger1 = !time
trigger1 = numhelper(6010)
x = facing * (helper(6010), pos x - pos x -(20 * facing)) / 16.0
y = -1

[State 6015, Sound]
type = playsnd
trigger1 = time = 16
value = 2, 2

;[State 6015, Spark]
;in ZSS

[State 6015, End]
type = changestate
trigger1 = time >= 16
value = 6016


[Statedef 6016]
type = A
physics = N
anim = 6015
ctrl = 0
sprpriority = 0

[State 6016, Accel]
type = veladd
trigger1 = 1
y = 0.25

[State 6016, Vel]
type = velset
trigger1 = !time
x = 1
y = -6.0

[State 6016, Trans]
type = trans
trigger1 = time >= 32
trans = addalpha
alpha = 256 - 16 * (time - 32), 16 * (time - 32)

[State 6016, End]
type = destroyself
trigger1 = time >= 48


;========================<DOG>=============================
[Statedef 6045]
type = S
physics = N
anim = 6045
velset = 8, 0
ctrl = 0
sprpriority = 2

[State 6045, Sound]
type = playsnd
trigger1 = screenpos x = [-160, 160]
value = 7, 3
channel = 0
persistent = 0

[State 6045, End]
type = destroyself
trigger1 = time >= 20
trigger1 = frontedgedist < -80


;====================<POWER CHARGE>====================
;----- MAIN FX -----
[Statedef 8330]
type = S
anim = 9999
velset = 0, 0
ctrl = 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0, 0

[State 8330, Sound]
type = playsnd
trigger1 = !time
value = 0, 730
channel = 0

[State 8330, Sound]
type = playsnd
trigger1 = 1
value = 0, 731
channel = 1
lowpriority = 1
volumescale = ifelse(time < 180, (time * 0.277), 50)

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330)
trigger1 = root, time <= 60
ID = 8330
scale = 0.5, 0.125

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330)
trigger1 = root, time = [61, 119]
ID = 8330
scale = 0.5, 0.1 + ((root, time - 60) * 0.00625)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330)
trigger1 = root, time >= 120
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
trigger2 = root, movetype = H
channel = 0

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
trigger2 = root, movetype = H
channel = 1

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730
trigger2 = root, movetype = H

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730
trigger2 = root, movetype = H


;----- PARTICLES -----
[Statedef 8332]
type = S
anim = 9999
velset = 0, 0
ctrl = 0

[State 8332, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-159 + (random / 3.125)), ceil(92 -(random / 3.125))

[State 8332, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 8332
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -1) / 32.0), ((rootdist y -73) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8332, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8332, End]
type = destroyself
trigger1 = root, stateno != 730


;========================<CUSTOM COMBO>=============================
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time <= 25
time = 1
mul = 128, 128, 128

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;========================<SUPERPAUSE FX>=============================
;----- Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8500, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 8500, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 8500, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 8500, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time <= 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = 1
scale = (0.0177 * time) ** 2, (0.0177 * time) ** 2

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;----- Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8510, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 8510, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 8510, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 8510, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time <= 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = 1
scale = (0.0177 * time) ** 2, (0.0177 * time) ** 2

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;----- Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 8520, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 8520, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 8520, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = 1
scale = (0.0177 * time) ** 2, (0.0177 * time) ** 2

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 20
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 21
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && (time = [16, 32])
ID = 21
scale = 0, 0

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160 + (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time >= 32
ID = 21
postype = back
pos = 160 - (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
bindtime = -1
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;========================<DUST>=============================
;----- Jump -----
[Statedef 8100]
type = S
velset = 0, 0
anim = 9999

[State 8100, Pos]
type = posset
trigger1 = !time
y = 0

[State 8100, Bind]
type = bindtoparent
trigger1 = time

[State 8100, Dust]
type = explod
trigger1 = !time
anim = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, End]
type = destroyself
trigger1 = !numexplod
trigger2 = time >= 60


;----- Dash -----
[Statedef 8103]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 8103, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8103, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8103
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 - (16 * (time -3)), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 - (16 * (time -6)), 256

[State 8103, End]
type = removeexplod
trigger1 = time >= 22

[State 8103, End]
type = destroyself
trigger1 = !numexplod


;----- Impact -----
[Statedef 8110]
type = A
anim = 9999
velset = 0, 0

[State 8110, Pos]
type = posset
trigger1 = !time
y = 0

[State 8110, FX Ground]
type = explod
trigger1 = !time
anim = 8110
ID = 1
postype = p1
removetime = 12
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8110, FX Back]
type = explod
trigger1 = !time
anim = 8111
ID = 2
postype = p1
removetime = 8
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 - (23 * time), 256

[State 8110, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 - (32 * time), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 12

[State 8110, End]
type = destroyself
trigger1 = !numexplod


;====================<GUARD CANCEL CHARGE>====================
[Statedef 8350]
type = S
anim = 9999
velset = 0, 0

[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8351
ID = 8351
sprpriority = 3
postype = p1
removetime = 15
supermovetime = -1
ownpal = 1

[State 8350, Circle]
type = modifyexplod
trigger1 = numexplod(8351)
ID = 8351
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8350
ID = 8350
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;========================<SUPER FINISH>=============================
[Statedef 8600]
type = A
velset = 0, 0
anim = 9999

[State 8600, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 0, 8600
channel = 1

[State 8600, Sound]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, Sound]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 10
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [10, 20]
time = 1
mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3000
var(0) = 1

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3100
var(0) = 2

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3200, 3203]
var(0) = 3

[State 8600, Text]
type = explod
trigger1 = !time
trigger1 = var(0)
anim = 8610 + var(0)
ID = 8610
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8610)
ID = 8610
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), ifelse(time < 10, 0, ceil((time -10) * 25.6))

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 0, 0
scale = 1, (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
sprpriority = -255
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 8600, Scale]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time <= 20
flag = nobardisplay

[State 8600, Stop Shake]
type = envshake
trigger1 = numexplod
time = 1
ampl = 0

[State 8600, End]
type = removeexplod
trigger1 = numexplod
trigger1 = time > 20
trigger1 = roundstate != 3

[State 8600, End]
type = destroyself
trigger1 = time > 20
trigger1 = roundstate != 3


;========================<EXCEL FINISH>=============================
[Statedef 8650]
type = A
velset = 0, 0
anim = 9999

[State 8650, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 8650, Sound]
type = playsnd
trigger1 = !time
value = 0, 8600
channel = 1

[State 8650, Sound]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8650, Sound]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 8650, BG PalFX]
type = bgpalfx
trigger1 = time < 10
time = 1
mul = 0, 0, 0

[State 8650, BG PalFX]
type = bgpalfx
trigger1 = time = [10, 20]
time = 1
mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 8650, MvC]
type = explod
trigger1 = !time
anim = 8650
ID = 8650
sprpriority = 5
postype = left
pos = 0, 0
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
ontop = 1
scale = 1, (1.3333333 * gameheight / gamewidth)

[State 8650, Fade]
type = modifyexplod
trigger1 = numexplod(8650)
ID = 8650
scale = 1, 1
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 8650, Circle]
type = explod
trigger1 = !time
anim = 8651
ID = 8651
sprpriority = -5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
sprpriority = -5

[State 8650, Shrink]
type = modifyexplod
trigger1 = numexplod(8651)
ID = 8651
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

[State 8650, Assert]
type = assertspecial
trigger1 = time <= 20
flag = nobardisplay
flag2 = noFG

[State 8650, Stop Shake]
type = envshake
trigger1 = numexplod
time = 1
ampl = 0

[State 8650, End]
type = removeexplod
trigger1 = numexplod
trigger1 = time > 20
trigger1 = roundstate != 3

[State 8650, End]
type = destroyself
trigger1 = time > 20
trigger1 = roundstate != 3


;========================<CAMERA CONTROL>=============================
[Statedef 8999]
type = S
velset = 0, 0
anim = 9999

[State 8999, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2
