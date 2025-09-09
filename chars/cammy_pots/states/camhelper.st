; ________________________________
;| Cammy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<EX DRILL FX>=============================
[Statedef 1025]
type = A
physics = N
movetype = I
anim = 1025
velset = 0, 0
sprpriority = 3

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1025, Bind]
type = bindtoparent
trigger1 = 1
pos = 96 * parent, const(size.xscale), -30; -14
facing = 1

[State 1025, Bind]
type = bindtoparent
trigger1 = parent, stateno = 1620
pos = 85 * parent, const(size.xscale), -62
facing = 1

[State 1025, Flames]
type = explod
;trigger1 = 1; Ikemen updates the Explod position and BindToRoot in a different way
trigger1 = time > 0
anim = 8150
sprpriority = 1
postype = p1
pos = -32, 0
random = 64, 32
vel = -(random / 250.0), 2 -(random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 1025, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1020 && parent, stateno != 1060 && parent, stateno != 1620 && parent, stateno != 3050
trigger3 = parent, stateno = 1020 && parent, animelemtime(4) < 0
trigger4 = parent, stateno = 1060 && parent, animelemtime(3) < 0
trigger5 = parent, stateno = 1620 && parent, animelemtime(6) < 0
trigger6 = parent, stateno = 3050 && parent, animelemtime(7) < 0


;========================<EX SPIKE FX>=============================
[Statedef 1125]
type = A
physics = N
movetype = I
anim = 1125
velset = 0, 0
sprpriority = 3

[State 1125, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1125, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, 0
facing = 1

[State 1125, Anim]
type = changeanim
trigger1 = parent, stateno = 1120
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 1
trigger2 = parent, stateno = 3051
trigger2 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 1
value = 1125
elem = 1

[State 1125, Anim]
type = changeanim
trigger1 = parent, stateno = 1120 && !(parent, hitpausetime)
trigger1 = animelemtime(2) < 0 && parent, animelemtime(6) >= 0
trigger2 = parent, stateno = 3051 && !(parent, hitpausetime)
trigger2 = animelemtime(2) < 0 && parent, animelemtime(9) >= 0
value = 1125
elem = 2

[State 1125, Flames]
type = explod
trigger1 = animelemtime(2) >= 0
anim = 8150
sprpriority = 1
postype = p1
pos = 36, -90
random = 8, 48
vel = -(random / 250.0), (random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 1125, End]
type = changestate
trigger1 = parent, stateno = 1121
trigger2 = parent, stateno = [3052, 3053]
value = 1126

[State 1125, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1120 && parent, stateno != 3051
trigger3 = parent, stateno = 1120 && parent, animelemtime(5) < 0
trigger5 = parent, stateno = 3051 && parent, animelemtime(8) < 0


;----- Over -----
[Statedef 1126]
type = A
physics = N
movetype = I
anim = 1126
velset = 0, 0
sprpriority = 3

[State 1126, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1126, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, 0
facing = 1

[State 1126, Anim]
type = changeanim
trigger1 = parent, animelemtime(2) < 0
value = 1126
elem = 1

[State 1126, Anim]
type = changeanim
trigger1 = parent, animelemtime(2) >= 0 && parent, animelemtime(3) < 0
value = 1126
elem = 2

[State 1126, Anim]
type = changeanim
trigger1 = animelemtime(3) < 0
trigger1 = parent, animelemtime(3) >= 0
value = 1126
elem = 3

[State 1126, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1121 && parent, stateno != [3052, 3053]
trigger3 = !animtime


;========================<EX KNUCKLE FX>=============================
[Statedef 1225]
type = A
physics = N
movetype = I
anim = 1225
velset = 0, 0
sprpriority = 3

[State 1225, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1225, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, 0
facing = 1

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(2) >= 0 && parent, animelemtime(2) < 1
value = 1225
elem = 1

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(2) >= 1 && parent, animelemtime(3) < 0
value = 1225
elem = 2

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
value = 1225
elem = 3

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(4) < 1
value = 1225
elem = 4

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(4) >= 1 && parent, animelemtime(5) < 0
value = 1225
elem = 5

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(5) < 1
value = 1225
elem = 6

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(5) >= 1 && parent, animelemtime(6) < 0
value = 1225
elem = 7

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
value = 1225
elem = 8

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
value = 1225
elem = 9

[State 1225, Anim]
type = changeanim
trigger1 = parent, stateno = 1221 && !(parent, hitpausetime)
trigger1 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 0
value = 1225
elem = 10

[State 1225, Anim]
type = changeanim
trigger1 = 1
value = 1225
elem = animelemno(0)

[State 1225, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1221
trigger3 = parent, stateno = 1221 && (parent, animelemtime(2) < 0 || parent, animelemtime(9) >= 0)


;========================<EX STRIKE FX>=============================
[Statedef 1425]
type = A
physics = N
movetype = I
anim = 1425
velset = 0, 0
sprpriority = 3

[State 1425, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1425, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, 0
facing = 1

[State 1425, Anim]
type = changeanim
trigger1 = parent, stateno = 1420
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 1
value = 1425
elem = 1

[State 1425, Anim]
type = changeanim
trigger1 = parent, stateno = 1420
trigger1 = animelemtime(2) < 0 && parent, animelemtime(4) >= 0
value = 1425
elem = 2

[State 1425, Flames]
type = explod
trigger1 = animelemtime(2) >= 0
anim = 8150
sprpriority = 1
postype = p1
pos = 20, -8
random = 48, 48
vel = -(random / 250.0), -(random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 1425, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1420
trigger3 = parent, stateno = 1420 && parent, animelemtime(3) < 0


;========================<MAX REVERSE SHAFT BREAKER FX>=============================
[Statedef 3155]
type = A
physics = N
movetype = I
anim = 1025
velset = 0, 0
sprpriority = 3

[State 3155, Angle]
type = angleset
trigger1 = 1
value = 90

[State 3155, Angle]
type = angledraw
trigger1 = 1

[State 3155, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 3155, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, -126
facing = 1

[State 3155, Flames]
type = explod
;trigger1 = 1; Ikemen updates the Explod position and BindToRoot in a different way
trigger1 = time > 0
anim = 8150
sprpriority = 1
postype = p1
pos = 0, 32
random = 32, 64
vel = 2 -(random / 250.0), (random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 3155, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 3151
trigger3 = parent, stateno = 3151 && parent, animelemtime(4) < 0


;========================<COAT>=============================
[Statedef 6000]
type = A
physics = N
movetype = I
anim = 6000
velset = 0, 0
sprpriority = 1

[State 6000, Accel]
type = veladd
trigger1 = time
y = 0.25

[State 6000, Vel]
type = velset
trigger1 = !time
x = -3
y = -5

[State 6000, Fade]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = 256 - (16 * (time -16)), 16 * (time -16)

[State 6000, End]
type = destroyself
trigger1 = time >= 32


;========================<VEGA FX>=============================
;----- Psycho Crusher -----
[Statedef 6105]
type = A
physics = N
movetype = I
anim = 6105
velset = 0, 0
sprpriority = -1

[State 6105, Fix Debug]
type = mapset
trigger1 = !time
map = "parentID"
value = parent, ID

[State 6105, Fix Debug]
type = destroyself
trigger1 = !playerIDexist(map(parentID))

[State 6105, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 6105, Bind]
type = bindtoparent
trigger1 = playerIDexist(parent, ID)
pos = 0, 0
facing = 1

[State 6105, Sprite Priority]
type = sprpriority
trigger1 = playerIDexist(parent, ID)
value = (parent, sprpriority) + 1

[State 6105, Anim]
type = changeanim
trigger1 = parent, stateno = 6100 || parent, stateno = 6110
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
value = 6105
elem = 1

[State 6105, Anim]
type = changeanim
trigger1 = parent, stateno = 6100 || parent, stateno = 6110
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
value = 6105
elem = 2

[State 6105, Anim]
type = changeanim
triggerall = animelemtime(3) < 0
trigger1 = parent, stateno = 6100 || parent, stateno = 6110
trigger1 = parent, animelemtime(5) >= 0
trigger2 = parent, stateno = 6101 || parent, stateno = 6111
value = 6105
elem = 3

[State 6105, Flames]
type = explod
trigger1 = animelemtime(3) >= 0
anim = 8151
sprpriority = -1
postype = p1
pos = 0, -60
random = 64, 48
vel = -(random / 250.0), 2 -(random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 6105, End]
type = destroyself
trigger1 = !playerIDexist(parent, ID)
trigger2 = parent, movetype = H
trigger2 = parent, time > 0; Ikemen fix
trigger3 = (parent, stateno != [6100, 6103]) && (parent, stateno != [6110, 6113])
trigger4 = parent, stateno = 6100 && parent, animelemtime(3) < 0
trigger5 = parent, stateno = 6110 && parent, animelemtime(3) < 0


;----- Warp FX In -----
[Statedef 6108]
type = A
physics = N
movetype = I
anim = 9999
sprpriority = -3

[State 6108, End]
type = destroyself
trigger1 = time >= 10 || !numhelper(6100)

[State 6108, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6108, Sprite Priority]
type = sprpriority
trigger1 = !time
value = ifelse(ishelper(6109), -3, -1)

[State 6108, Anim]
type = varset
trigger1 = !time
trigger1 = numhelper(6100)
var(1) = helper(6100), anim
[State 6108, Anim]
type = varset
trigger1 = !time
trigger1 = numhelper(6100)
var(2) = helper(6100), animelemno(0)

[State 6108, Anim]
type = changeanim
trigger1 = 1
value = var(1)
elem = var(2)

[State 6108, Pos]
type = posadd
trigger1 = !time
x = ceil(ifelse(ishelper(6109), 90, -90) * const(size.xscale))

[State 6108, Vel]
type = velset
trigger1 = 1
x = ifelse(ishelper(6109), -9, 9) * const(size.xscale)

[State 6108, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = (25 * time), (256 - 25 * time)


;----- Warp FX Out -----
[Statedef 6109]
type = A
physics = N
movetype = I
anim = 9999
sprpriority = -3

[State 6109, End]
type = destroyself
trigger1 = time >= 10 || !numhelper(6100)

[State 6109, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6109, Sprite Priority]
type = sprpriority
trigger1 = !time
value = ifelse(ishelper(6109), -3, -1)

[State 6109, Anim]
type = varset
trigger1 = !time
trigger1 = numhelper(6100)
var(1) = helper(6100), anim
[State 6109, Anim]
type = varset
trigger1 = !time
trigger1 = numhelper(6100)
var(2) = helper(6100), animelemno(0)

[State 6109, Anim]
type = changeanim
trigger1 = 1
value = var(1)
elem = var(2)

[State 6109, Vel]
type = velset
trigger1 = 1
x = ifelse(ishelper(6109), 9, -9) * const(size.xscale)

[State 6109, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = (256 - 25 * time), (25 * time)


;========================<PSYCHO STREAK>=============================
;----- Warp in -----
[Statedef 6100]
type = S
physics = N
movetype = A
ctrl = 0
anim = 6100
velset = 0, 0
sprpriority = -2

[State 6100, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6100, NumHit]
type = varset
trigger1 = !time
var(1) = 0

[State 6100, Trans]
type = trans
trigger1 = time <= 10
trigger1 = animelemtime(2) < 0
trans = addalpha
alpha = (25 * time), (256 - 25 * time)

[State 6100, Sound]
type = playsnd
trigger1 = !time
value = 8, 4
channel = 0

[State 6100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 8, 2
channel = 0

[State 6100, Sound]
type = playsnd
trigger1 = !time
value = 8, 0

[State 6100, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6108
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6100, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6109
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 8, 1

[State 6100, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6105
ID = 6105
name = "Psycho Crusher FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 6100, End]
type = changestate
trigger1 = parent, movetype = H
trigger1 = animelemtime(3) > 0
trigger1 = animelemtime(5) < 0
value = 6122

[State 6100, End]
type = changestate
trigger1 = !animtime
value = 6101


;----- Psycho Crusher -----
[Statedef 6101]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = -2
hitcountpersist = 1

[State 6101, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 6102
ignorehitpause = 1

[State 6101, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

; Damage Scaling was here

[State 6101, Anim]
type = changeanim
trigger1 = anim != 6101
value = 6101

[State 6101, Vel]
type = velset
trigger1 = 1
x = 9
y = 0

[State 6101, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, HA
hitflag = MAFP
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
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
ground.velocity = -13.3, -3.66
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -13.3, -3.66
air.cornerpush.veloff = 0
guard.dist = 320
yaccel = 0.46
fall = 1
fall.recover = 0
down.recover = 1
forcestand = 1
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 100), map(sparky) := -60
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx2_r), root, map(palfx2_g), root, map(palfx2_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
ID = 6101

[State 6101, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(6101)
trigger1 = target(6101), hitfall
trigger1 = target(6101), selfanimexist(7697)
trigger1 = target(6101), stateno = 5000 || target(6101), stateno = 5010 || target(6101), stateno = 5020
value = 7697
ID = 6101
ignorehitpause = 1

[State 6101, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 6102
ignorehitpause = 1

[State 6101, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -100


;----- Hitpause -----
[Statedef 6102]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = -2
movehitpersist = 1
hitcountpersist = 1

[State 6102, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 6102, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 6102, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 6102, NumHit]
type = varadd
trigger1 = !time
var(1) = 1

[State 6102, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3300
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 6102, End]
type = changestate
trigger1 = time >= ifelse(numtarget, 4, 0)
value = ifelse(var(1) < 3, 6101, 6103)


;----- Finished -----
[Statedef 6103]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = -2

[State 6103, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 6103, Anim]
type = changeanim
trigger1 = anim != 6101
value = 6101

[State 6103, Vel]
type = velset
trigger1 = 1
x = 12
y = 0

[State 6103, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -100


;========================<MAX PSYCHO STREAK>=============================
;----- Warp in -----
[Statedef 6110]
type = S
physics = N
movetype = A
ctrl = 0
anim = 6100
velset = 0, 0
sprpriority = -2

[State 6110, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6110, NumHit]
type = varset
trigger1 = !time
var(1) = 0

[State 6110, Trans]
type = trans
trigger1 = time <= 10
trigger1 = animelemtime(2) < 0
trans = addalpha
alpha = (25 * time), (256 - 25 * time)

[State 6110, Sound]
type = playsnd
trigger1 = !time
value = 8, 4
channel = 0

[State 6110, Sound]
type = playsnd
trigger1 = animelem = 5
value = 8, 2
channel = 0

[State 6110, Sound]
type = playsnd
trigger1 = !time
value = 8, 0

[State 6110, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6108
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6110, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6109
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6110, Sound]
type = playsnd
trigger1 = animelem = 5
value = 8, 1

[State 6110, FX]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6105
ID = 6105
name = "Psycho Crusher FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 6110, End]
type = changestate
trigger1 = root, movetype = H
trigger1 = animelemtime(3) > 0
trigger1 = animelemtime(5) < 0
value = 6122

[State 6110, End]
type = changestate
trigger1 = !animtime
value = 6111


;----- Psycho Crusher -----
[Statedef 6111]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = -2
hitcountpersist = 1

[State 6111, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 6112
ignorehitpause = 1

[State 6111, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

; Damage Scaling was here

[State 6111, Anim]
type = changeanim
trigger1 = anim != 6101
value = 6101

[State 6111, Vel]
type = velset
trigger1 = 1
x = 9
y = 0

[State 6111, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
attr = A, HA
hitflag = MAFP
guardflag = M
priority = 4, Hit
damage = 55, 14
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
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
ground.velocity = -13.3, -3.66
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.cornerpush.veloff = 0
air.velocity = -13.3, -3.66
air.cornerpush.veloff = 0
guard.dist = 320
yaccel = 0.46
fall = 1
fall.recover = 0
down.recover = 1
forcestand = 1
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := 100), map(sparky) := -60
palfx.time = 56
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx2_r), root, map(palfx2_g), root, map(palfx2_b)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
ID = 6110

[State 6111, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 6112
ignorehitpause = 1

[State 6111, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -100


;----- Hitpause -----
[Statedef 6112]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = -2
movehitpersist = 1
hitcountpersist = 1

[State 6112, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 6112, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 6112, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 6112, NumHit]
type = varadd
trigger1 = !time
var(1) = 1

[State 6112, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3350
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 6112, Throw only one]
type = targetdrop
trigger1 = var(1) >= 5
trigger1 = movehit && numtarget(6110)
trigger1 = !(target(6110), hitshakeover)
excludeID = 6110
keepone = 1
ignorehitpause = 1

[State 6112, P1 State]
type = changestate
trigger1 = var(1) >= 5
trigger1 = movehit && numtarget(6110)
trigger1 = !(target(6110), hitshakeover)
value = 6120
ignorehitpause = 1

[State 6112, End]
type = changestate
trigger1 = time >= ifelse(numtarget, 4, 0)
value = ifelse(var(1) < 5, 6111, 6113)


;----- Finished -----
[Statedef 6113]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = -2

[State 6113, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 6113, Anim]
type = changeanim
trigger1 = anim != 6101
value = 6101

[State 6113, Vel]
type = velset
trigger1 = 1
x = 12
y = 0

[State 6113, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -100


;----- Deadly Throw -----
[Statedef 6120]
type = S
physics = N
movetype = A
anim = 6120
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 6120, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 6121

[State 6120, Turn]
type = turn
trigger1 = !time

[State 6120, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 6125

[State 6120, Throw]
type = targetfacing
trigger1 = time <= 3
value = 1

[State 6120, Width]
type = screenbound
trigger1 = animelemtime(4) < 0
value = 1
movecamera = 1, 0

[State 6120, Width]
type = width
trigger1 = animelemtime(3) < 0
edge = 8 * const(size.xscale), 0

[State 6120, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
edge = 40 * const(size.xscale), 0

[State 6120, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 125 * const(size.xscale), 0

[State 6120, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = -64 * const(size.xscale), -60 * const(size.yscale)

[State 6120, Bind 2]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -36 * const(size.xscale), -108 * const(size.yscale)

[State 6120, Bind 3]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 32 * const(size.xscale), -100 * const(size.yscale)

[State 6120, Bind 4]
type = targetbind
trigger1 = numtarget
trigger1 = animelem = 4
;pos = 125, -35
pos = 80 * const(size.xscale), -64 * const(size.yscale)

[State 6120, Juggle Reset]
type = rootmapset
trigger1 = root, map(jugglereset) = 0
trigger1 = root, map(juggle_count)
trigger1 = numtarget
trigger1 = animelem = 4
trigger1 = 1 || root, map(jugglereset) := 1
map = "juggle_count"
value = 0

[State 6120, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 4
value = 6126

[State 6120, Sound]
type = playsnd
trigger1 = animelem = 4
value = 8, 3
channel = 0

[State 6120, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1

[State 6120, End]
type = changestate
trigger1 = !animtime
value = 6121


;----- Idle -----
[Statedef 6121]
type = S
physics = N
movetype = I
anim = 6121
velset = 0, 0
sprpriority = -2

[State 6121, Pos]
type = posadd
trigger1 = !time
trigger1 = prevstateno = 6120
x = ceil(18 * const(size.xscale))

[State 6121, End]
type = changestate
triggerall = roundstate = [0, 2]
trigger1 = time >= 60
trigger2 = !numtarget
trigger3 = numtarget
trigger3 = target, statetype != A || (target, stateno = [5100, 5210])
value = 6122

[State 6121, End]
type = changestate
trigger1 = roundstate = 4
value = 6123


;----- Warp out -----
[Statedef 6122]
type = A
physics = N
movetype = A
ctrl = 0
anim = 6122
velset = 0, 0
sprpriority = -2

[State 6122, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6122, Trans]
type = trans
trigger1 = time <= 10
trans = addalpha
alpha = (256 - 25 * time), (25 * time)

[State 6122, Sound]
type = playsnd
trigger1 = !time
value = 8, 0

[State 6122, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6109
ID = 6108
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6122, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6109
ID = 6109
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6122, End]
type = destroyself
trigger1 = time >= 10


;----- Pose -----
[Statedef 6123]
type = S
physics = N
movetype = I
anim = 6123
velset = 0, 0
sprpriority = -2

[State 6123, End]
type = changestate
trigger1 = roundstate = [2, 3]
value = 6122

[State 6123, Sound]
type = playsnd
trigger1 = animelem = 5
value = 8, 6
channel = 0

[State 6123, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 0
;channel = 1


;----- Target -----
[Statedef 6125]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = -3

[State 6125, Anim]
type = changeanim2
trigger1 = !time
value = 6125

[State 6125, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0


[Statedef 6126]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = -3

[State 6126, Anim]
type = changeanim2
trigger1 = !time
value = 6126

[State 6126, Push]
type = playerpush
trigger1 = 1
value = 0

[State 6126, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 6126, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 6126, Vel]
type = velset
trigger1 = !time
x = 1.33;5.32
y = -10;-7.55

[State 6126, Anim]
type = changeanim
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
trigger1 = selfanimexist(5051)
value = 5051

[State 6126, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100


;========================<VEGA WIN POSE>=============================
[Statedef 6130]
type = S
physics = N
movetype = A
ctrl = 0
anim = 6130
velset = 0, 0
sprpriority = -2

[State 6130, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1

[State 6130, Pos]
type = posset
trigger1 = !time
trigger1 = numenemy
x = ceil(p2, pos x) - (64 * facing)
y = -40

[State 6130, Trans]
type = trans
trigger1 = time <= 10
trans = addalpha
alpha = (25 * time), (256 - 25 * time)

[State 6130, Sound]
type = playsnd
trigger1 = time = 10
value = 8, 5
channel = 0

[State 6130, Sound]
type = playsnd
trigger1 = !time
value = 8, 0

[State 6130, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6108
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6130, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6108
ID = 6109
name = "Warp FX"
postype = p1
pausemovetime = 255
supermovetime = 255

[State 6130, Float]
type = velset
trigger1 = time >= 10
y = cos((time -10) / 32.0 * pi) * 1

[State 6130, End]
type = changestate
trigger1 = roundstate != 4
value = 6122


;========================<DUSTS>=============================
;----- Jump -----
[Statedef 8100]
type = S
anim = 9999
velset = 0, 0

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


;========================<FLAMES>=============================
;----- Cammy -----
[Statedef 8150]
type = A
velset = 0, 0
anim = 9999

[State 8150, Timer]
type = null
trigger1 = time
trigger1 = map(timer) := (map(timer) - 1)

[State 8150, End]
type = destroyself
trigger1 = map(timer) <= 0
trigger2 = !playerIDexist(map(target))
trigger3 = time > 0
trigger3 = playerID(map(target)), palfxvar(time) = 0

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(map(target))
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) + (playerID(map(target)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), statetype = L || (playerID(map(target)), anim = [5080, 5119])
trigger1 = playerID(map(target)), stateno != [5020, 5050]
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) - 20

[State 8150, Pos Custom States]
type = posset
triggerall = playerIDexist(map(target))
trigger1 = playerID(map(target)), animelemvar(group) = 5001 || playerID(map(target)), animelemvar(group) = 5011
trigger2 = playerID(map(target)), animelemvar(group) = 5031 || playerID(map(target)), animelemvar(group) = 5041
trigger3 = playerID(map(target)), animelemvar(group) = 5061 || playerID(map(target)), animelemvar(group) = 5071
x = playerID(map(target)), pos x
y = playerID(map(target)), pos y

[State 8150, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 8150, Sound]
type = playsnd
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), hitshakeover
value = 7, 5
persistent = 0

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(map(target))
anim = 8150
sprpriority = playerID(map(target)), sprpriority + 1
postype = p1
pos = 0, 0
random = 0.33 * (playerID(map(target)), const(size.head.pos.y)), 0.33 * (playerID(map(target)), const(size.head.pos.y))
vel = (random / 1000.0), -2.0 - (random / 500.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(map(target))
anim = 8150
sprpriority = playerID(map(target)), sprpriority - 1
postype = p1
pos = 0, 0
random = 0.66 * (playerID(map(target)), const(size.head.pos.y)), 0.66 * (playerID(map(target)), const(size.head.pos.y))
vel = (random / 1000.0), -2.0 - (random / 500.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1


;----- Vega -----
[Statedef 8151]
type = A
velset = 0, 0
anim = 9999

[State 8151, Timer]
type = null
trigger1 = time
trigger1 = map(timer) := (map(timer) - 1)

[State 8151, End]
type = destroyself
trigger1 = map(timer) <= 0
trigger2 = !playerIDexist(map(target))
trigger3 = time > 0
trigger3 = playerID(map(target)), palfxvar(time) = 0

[State 8151, Pos]
type = posset
trigger1 = playerIDexist(map(target))
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) + (playerID(map(target)), const(size.mid.pos.y))

[State 8151, Pos]
type = posset
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), statetype = L || (playerID(map(target)), anim = [5080, 5119])
trigger1 = playerID(map(target)), stateno != [5020, 5050]
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) - 20

[State 8151, Pos Custom States]
type = posset
triggerall = playerIDexist(map(target))
trigger1 = playerID(map(target)), animelemvar(group) = 5001 || playerID(map(target)), animelemvar(group) = 5011
trigger2 = playerID(map(target)), animelemvar(group) = 5031 || playerID(map(target)), animelemvar(group) = 5041
trigger3 = playerID(map(target)), animelemvar(group) = 5061 || playerID(map(target)), animelemvar(group) = 5071
x = playerID(map(target)), pos x
y = playerID(map(target)), pos y

[State 8151, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 8151, Sound]
type = playsnd
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), hitshakeover
value = 7, 5
persistent = 0

[State 8151, Flames]
type = explod
trigger1 = playerIDexist(map(target))
anim = 8151
sprpriority = playerID(map(target)), sprpriority + 1
postype = p1
pos = 0, 0
random = 0.33 * (playerID(map(target)), const(size.head.pos.y)), 0.33 * (playerID(map(target)), const(size.head.pos.y))
vel = (random / 1000.0), -2.0 - (random / 500.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1

[State 8151, Flames]
type = explod
trigger1 = playerIDexist(map(target))
anim = 8151
sprpriority = playerID(map(target)), sprpriority - 1
postype = p1
pos = 0, 0
random = 0.66 * (playerID(map(target)), const(size.head.pos.y)), 0.66 * (playerID(map(target)), const(size.head.pos.y))
vel = (random / 1000.0), -2.0 - (random / 500.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.5, 0.5
ownpal = 1


;====================<POWER CHARGE>====================
;----- MAIN FX -----
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = (4 * root, const(size.xscale)), 0

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


;----- Particles -----
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-153 + (random / 3.125)), ceil(82 -(random / 3.125))

[State 8331, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 8331
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -7) / 32.0), ((rootdist y -78) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;====================<ZERO COUNTER PAUSE>====================
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
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
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


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
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale]
type = removeexplod
trigger1 = numexplod(21) && time >= 16
ID = 21

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
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


;========================<SUPER FINISH>=============================
[Statedef 8600]
type = A
velset = 0, 0
anim = 9999

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
trigger1 = time < 16
trigger1 = !(time % 2)
time = 1
color = 0
mul = 192, 192, 192

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
trigger1 = (time % 2)
time = 1
color = 0
mul = 128, 32, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24]
time = 1
color = 32 * (time -16)
mul = 128 + 8 * (time - 16), 32 + 14 * (time - 16), 32 * (time - 16)

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 900
var(0) = 1

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3000, 3099]
var(0) = 2

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3100, 3199]
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3200, 3299]
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3300, 3399]
var(0) = 5

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3400, 3499]
var(0) = 6

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time
trigger1 = var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time
trigger1 = var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), (0.5 + (0.0625 * time)) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
sprpriority = -5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Stop Shake]
type = envshake
trigger1 = numexplod
time = 1
ampl = 0

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = numexplod
trigger1 = time >= 24
trigger1 = roundstate != 3

[State 8600, End]
type = destroyself
trigger1 = time >= 24
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
trigger1 = (root, stateno != [3205, 3206])

