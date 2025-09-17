; ____________________________________________
;| Pocket Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<GOU HADOU KEN>=============================
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1005, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

; Damage Scaling was here

[State 1005, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1000
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 5, ifelse(map(strength) = 1, 4, 3))
y = 0

[State 1005, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 1005, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1005, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = !prevstateno
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1005, trail]
type = explod
trigger1 = !(time % 3)
anim = 1007
sprpriority = 3
postype = p1
pos = -50, 0
random = 6, 30
ownpal = 1
scale = 1, 0.5

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = 70, 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.36, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -6, -6 + root, map(juggledecay)
fall = 0
forcenofall = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1

[State 1005, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit, 50, 25) * root, map(meterscaling)
ignorehitpause = 1

[State 1005, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 1006, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1006, Afterimage]
type = afterimage
trigger1 = !time
time = abs(animtime)
length = 12
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1006, particles]
type = explod
trigger1 = !(time % 2) && (time <= 10)
vel = ifelse(pos y < 0, (-500 + random) / 50.0, (-200 + random) / 100.0), ifelse(pos y < 0, (-500 + random) / 50.0, (200 -random) / 100.0)
anim = 1008
sprpriority = 3
postype = p1
pos = 0, 0
random = 32, 32
ownpal = 1

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1006, End]
type = destroyself
trigger1 = !animtime


;========================<SHAKUNETSU HADOUKEN>=============================
[Statedef 1025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1025, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1025, Anim]
type = changeanim
trigger1 = anim != 1025
value = 1025

[State 1025, Strength]
type = mapset
trigger1 = !time
trigger1 = prevstateno != 1025
map = "strength"
value = root, map(strength)
ignorehitpause = 1
persistent = 0

; Damage Scaling was here

[State 1025, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1020
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1025, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 1025, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 5.25, ifelse(map(strength) = 1, 4.50, 3.75))
y = 0

[State 1025, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = prevstateno != 1025
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0.50, 0
trans = add

[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < (map(strength) + 1), 1025, 1026)
ignorehitpause = 1

[State 1025, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 1025, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 1025, Hit Hard]
type = hitdef
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = map(strength) = 2
priority = 4, Hit
attr = S, SP
damage = 30, 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = -4, -6 + root, map(juggledecay)
getpower = 0, 0
givepower = 40, 40
fall = 1
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
ID = 1025

[State 1025, Hitmedium]
type = hitdef
trigger1 = map(strength) = 1
trigger1 = time >= (prevstateno = 1025) * 4
priority = 4, Hit
attr = S, SP
damage = 40, 10
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = -4, -6 + root, map(juggledecay)
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
fall.recovertime = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
ID = 1025

[State 1025, Hitlight]
type = hitdef
trigger1 = map(strength) = 0
trigger1 = time >= (prevstateno = 1025) * 4
priority = 4, Hit
attr = S, SP
damage = 70, 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = -4, -6 + root, map(juggledecay)
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
fall.recovertime = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
ID = 1025

[State 1025, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit && !prevstateno, 50, 25) * root, map(meterscaling)
ignorehitpause = 1

[State 1025, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1025)
trigger1 = target(1025), selfanimexist(7697)
trigger1 = target(1025), stateno = 5000 || target(1025), stateno = 5010 || target(1025), stateno = 5020
value = 7697
ID = 1025
ignorehitpause = 1

[State 1025, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1025, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(2) < (map(strength) + 1), 1025, 1026)
ignorehitpause = 1

[State 1025, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1026]
type = A
physics = S
movetype = I
anim = 1026
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1026, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1026, Afterimage]
type = afterimage
trigger1 = !time
time = abs(animtime)
length = 12
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1026, Sound]
type = playsnd
trigger1 = time = 1
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 1026, End]
type = destroyself
trigger1 = !animtime


;========================<ZANKUU HADOUKEN>=============================
[Statedef 1055]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1055, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1056
ignorehitpause = 1

[State 1055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

; Damage Scaling was here

[State 1055, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = (ishelper(1055) && root, stateno = 1050) || (ishelper(3065) && root, stateno = 3060)
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 1055, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = ishelper(1055)
x = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 3.35, 2.7))
y = ifelse(map(strength) = 2, 2.7, ifelse(map(strength) = 1, 2.25, 1.8))

[State 1055, Vel]
type = velset
trigger1 = ishelper(3065) && !time
x = 4.5 + ceil(random / 333)
y = 2.5 + ceil(random / 333)

[State 1055, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = !prevstateno
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1055, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 1055, Hit]
type = hitdef
trigger1 = !ishelper(3065)
priority = 4, Hit
attr = A, SP
damage = 40, 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 4
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1; root
guardsound = -1; root
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -8.36, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
airguard.velocity = -6.00, -1.00
air.velocity = vel x * -1, -3 + root, map(juggledecay)
down.hittime = 20
down.velocity = 0, 0
fall = 0
forcenofall = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1

[State 1055, Getpower]
type = poweradd
trigger1 = !ishelper(3065)
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit, 50, 25) * root, map(meterscaling)
ignorehitpause = 1

[State 1055, Hit Super]
type = hitdef
trigger1 = ishelper(3065)
priority = 4, Hit
attr = A, HP
damage = 21, 5
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -3, -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + root, map(juggledecay)
fall = 1
fall.recover = 0
fall.recovertime = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
down.bounce = 1
fall.xvelocity = -6
fall.yvelocity = -6

[State 1055, Hit Low]
type = modifyhitdef
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low
air.type = Low

[State 1055, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1055, Connected]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = pos y >= 0
value = 1056
ignorehitpause = 1

[State 1055, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1056]
type = A
physics = N
movetype = I
anim = 1056
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1056, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1056, Afterimage]
type = afterimage
trigger1 = !time
time = abs(animtime)
length = 6
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1056, Sound]
type = playsnd
trigger1 = !time
trigger1 = pos y >= 0
value = 5, 3

[State 1056, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1056, Pos]
type = posset
trigger1 = pos y > 0
y = 0

[State 1056, Particles]
type = explod
trigger1 = (map(strength) = [1, 3]) && !(time % 2) && (time <= 10)
vel = ifelse(pos y < 0, (-500 + random) / 50.0, (-200 + random) / 100.0), ifelse(pos y < 0, (-500 + random) / 50.0, (200 -random) / 100.0)
anim = 1008
sprpriority = 3
postype = p1
pos = 0, 0
random = 32, 32
ownpal = 1

[State 1056, End]
type = destroyself
trigger1 = !animtime


;========================<MESSATSU GOU HADOU>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3
hitcountpersist = 1

[State 3005, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 3005
value = 3005

[State 3005, Vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 3005, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = prevstateno != 3005
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3005, trail]
type = explod
trigger1 = 1
anim = 1007
sprpriority = 3
postype = p1
pos = -70, 0
random = 10, 40
ownpal = 1
scale = 1, 0.5

[State 3005, Dust]
type = explod
trigger1 = !numexplod(6025)
anim = 6025
ID = 6025
sprpriority = -3
postype = p1
pos = -35, -pos y
bindtime = -1
removetime = 192
ownpal = 1

[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3005, 3006)
ignorehitpause = 1

; Damage Scaling was here

[State 3005, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3000
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3005, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 3005, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 2, 0)
value = 1

[State 3005, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 2, 0)
priority = 4, Hit
attr = S, HP
damage = 30, 4
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6, -16
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -6, -16 + root, map(juggledecay)
guard.velocity = -8.36
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
ID = 3005

[State 3005, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3005)
trigger1 = target(3005), selfanimexist(7697)
trigger1 = target(3005), stateno = 5000 || target(3005), stateno = 5010 || target(3005), stateno = 5020
value = 7697
ID = 3005
ignorehitpause = 1

[State 3005, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse((var(2) < 8), 3005, 3006)
ignorehitpause = 1

[State 3005, Dust]
type = removeexplod
trigger1 = frontedgedist < -120 || backedgedist < -120
ID = 6025
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3006]
type = A
physics = S
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3006, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3006, Afterimage]
type = afterimage
trigger1 = !time
time = abs(animtime)
length = 15
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3006, Dust]
type = removeexplod
trigger1 = 1
ID = 6025
ignorehitpause = 1

[State 3006, Particles]
type = explod
trigger1 = !(time % 2) && (time <= 16)
trigger1 = frontedgedist >= -60 || backedgedist >= -60
vel = ifelse(pos y < 0, (-500 + random) / 50.0, (-200 + random) / 100.0), ifelse(pos y < 0, (-500 + random) / 50.0, (200 -random) / 100.0)
anim = 1008
postype = p1
pos = 0, 0
random = 32, 32
sprpriority = 3
ownpal = 1

[State 3006, End]
type = destroyself
trigger1 = !animtime


;========================<MESSATSU CHOU HADOU>=============================
[Statedef 3025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3
hitcountpersist = 1

[State 3025, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3025, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3025
ignorehitpause = 1

[State 3025, Bind]
type = bindtoroot
trigger1 = animelemtime(26) < 0

[State 3025, Anim]
type = changeanim
trigger1 = anim != 3025
value = 3025

[State 3025, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = !prevstateno
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3025, Flash]
type = bgpalfx
trigger1 = 1
mul = 192, 192, 192
time = 1

; Damage Scaling was here

[State 3025, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3020
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 3025, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3025, Go away]
type =velset
trigger1 = animelemtime(26) >= 0
x = 16

[State 3025, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 3025, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24
priority = 4, Hit
attr = S, HP
damage = 21, 5
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
sparkno = s6007 + (random % 2)
sparkxy = 0, -19 + (random % 21)
guard.sparkno = s6000
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6, -1
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = (root, const(size.xscale)) * -8, -1
down.velocity = (root, const(size.xscale)) * -8, -1
fall = 1
fall.recover = 0
fall.recovertime = 0
getpower = 0, 0
givepower = 40, 40
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
p1sprpriority = sprpriority
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.941
forcestand = 1

[State 3025, Hit Final]
type = hitdef
trigger1 = animelem = 25
priority = 4, Hit
attr = S, HP
damage = 21, 5
dizzypoints = 0
guard.dist = 320
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
guardflag = MA
pausetime = 0, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
sparkno = s6007 + (random % 2)
sparkxy = 0, -29
guard.sparkno = s6000
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -12, -12
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = -12, -12
down.velocity = -8, -6
fall = 1
fall.recover = 0
fall.recovertime = 0
getpower = 0, 0
givepower = 40, 40
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
p1sprpriority = sprpriority
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.941
forcestand = 1

[State 3025, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 3029
ID = 3029
ontop = 1
postype = p1
facing = 1
pos = ceil(p2dist x), -29
ownpal = 1
ignorehitpause = 1
pausemovetime = 100
supermovetime = 100

[State 3025, split]
type = explod
trigger1 = !(time % 2)
trigger1 = movecontact && (p2movetype = H)
vel = ceil((-250 + random) / 25.0), ceil((-500 + random) / 25.0)
anim = 1008
postype = p2
pos = 0, -32
random = 32, 32
sprpriority = 3
ownpal = 1

[State 3025, Bound]
type = screenbound
trigger1 = 1
value = 0

[State 3025, End]
type = destroyself
trigger1 = !animtime || root, stateno != 3020
ignorehitpause = 1


;========================<TENMA GOU ZANKUU>=============================
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3
hitcountpersist = 1

[State 3055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3055, Anim]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
value = 3055

[State 3055, Vel]
type = velset
trigger1 = 1
x = 7
y = 4.5

[State 3055, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = !prevstateno
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3055, 3056)
ignorehitpause = 1

; Damage Scaling was here

[State 3055, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3050
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 3055, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 3055, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 2, 0)
value = 1

[State 3055, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 2, 0)
priority = 4, Hit
attr = A, HP
damage = 30, 5
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Back
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4, -16
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -4, -16 + root, map(juggledecay)
guard.velocity = -8.36
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1
ID = 3055

[State 3055, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3055)
trigger1 = target(3055), selfanimexist(7697)
trigger1 = target(3055), stateno = 5000 || target(3055), stateno = 5010 || target(3055), stateno = 5020
value = 7697
ID = 3055
ignorehitpause = 1

[State 3055, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3055, Connected]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = pos y >= 0
value = ifelse((var(2) < 8), 3055, 3056)
ignorehitpause = 1

[State 3055, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3056]
type = A
physics = S
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3056, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3056, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3056, Afterimage]
type = afterimage
trigger1 = !time
time = abs(animtime)
length = 15
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3056, Pos]
type = posset
trigger1 = pos y > 0
y = 0

[State 3056, Sound]
type = playsnd
trigger1 = time = 1
value = 5, 3
ignorehitpause = 1
persistent = 0

[State 3056, Split]
type = explod
trigger1 = !(time % 2) && (time <= 16)
vel = ifelse(pos y < 0, (-500 + random) / 50.0, (-200 + random) / 100.0), ifelse(pos y < 0, (-500 + random) / 50.0, (200 -random) / 100.0)
anim = 1008
sprpriority = 3
postype = p1
pos = 0, 0
random = 32, 32
ownpal = 1

[State 3056, End]
type = destroyself
trigger1 = !animtime


;========================<KONGOU KOKURETSU ZAN>=============================
;----- PART 1 -----
[Statedef 4105]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 4105, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4105
ignorehitpause = 1

[State 4105, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

; Damage Scaling was here

[State 4105, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 4100
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 4105, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4105, Anim]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
value = 4105

[State 4105, Sound]
type = playsnd
trigger1 = !time
trigger1 = !prevstateno
value = 5, 12

[State 4105, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0, 0.5, 0.75
trans = add

[State 4105, Hit]
type = hitdef
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5
priority = 4, Hit
attr = S, HP
damage = 100, 7
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, ceil(p2dist y - 40)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x < 0, -3, 3), -10
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x < 0, -3, 3), -10 + root, map(juggledecay)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
fall.recovertime = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.add = 0, 16, 64
palfx.sinadd = 0, 16, 64, 6
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1

[State 4105, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 4105, Sound]
type = playsnd
trigger1 = animelemtime(9) > 0 && !(time % 12)
value = 5, ifelse(random < 500, 7, 8)
ignorehitpause = 1

[State 4105, End]
type = destroyself
trigger1 = !animtime
ignorehitpause = 1


;----- PART 2 -----
[Statedef 4106]
type = S
physics = N
movetype = A
ctrl = 0
velset = -4.5, 0
sprpriority = 4

[State 4106, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4106
ignorehitpause = 1

[State 4106, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

; Damage Scaling was here

[State 4106, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 4100
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 4106, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4106, Anim]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
value = 4106

[State 4106, Sound]
type = playsnd
trigger1 = animelem = 3 && !prevstateno
value = 5, 13

[State 4106, bgflash]
type = bgpalfx
trigger1 = animelemtime(16) < 0 && !(time % 4)
add = 50, 50, 100
sinadd = 50, 50, 100, 4
time = 4

[State 4106, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0, 0.5, 0.75
trans = add

[State 4106, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14
trigger3 = animelem = 15 || animelem = 16 || animelem = 17 || animelem = 18
priority = 4, Hit
attr = S, HP
damage = 50, 7
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, ceil(p2dist y - 40)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 10, -15
guard.velocity = -8.36
airguard.velocity = -6.00, -1.00
air.velocity = 10, -15 + root, map(juggledecay)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
fall.recovertime = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.add = 0, 16, 64
palfx.sinadd = 0, 16, 64, 6
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1

[State 4106, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 4106, End]
type = destroyself
trigger1 = !animtime
ignorehitpause = 1


;========================<SHORYUU FLAMES>=============================
[Statedef 1105]
physics = N
movetype = I
anim = 1105
sprpriority = 3

[State 1105, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

[State 1105, Bind]
type = bindtoroot
trigger1 = root, anim = 1100

[State 1105, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1105, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1105, Vel]
type = velset
trigger1 = root, anim != 1100
x = 2
y = -3

[State 1105, Anim]
type = changeanim
trigger1 = root, anim = 1100
trigger1 = root, animelemtime(4) < 0
value = 1105
elem = (root, animelemno(0))

[State 1105, Anim]
type = changeanim
trigger1 = root, anim = 1100
trigger1 = root, animelem = 4
trigger1 = anim != 1106 && anim != 1107
value = ifelse(map(strength) = 1, 1106, 1107)

[State 1105, Anim]
type = changeanim
trigger1 = root, anim = 1101
trigger1 = anim != 1108 && anim != 1109
value = ifelse(map(strength) = 1, 1108, 1109)

[State 1105, End]
type = destroyself
trigger1 = anim = 1108 && animelemtime(3) >= 3
trigger2 = anim = 1109 && animelemtime(5) >= 3
trigger3 = root, stateno != 1100
trigger4 = root, movetype = H
ignorehitpause = 1


;========================<M.G. SHORYUU FLAMES>=============================
[Statedef 3105]
physics = N
movetype = I
anim = 1105
sprpriority = 3

[State 3105, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

[State 3105, Bind]
type = bindtoroot
trigger1 = root, anim = 3100

[State 3105, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3105, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 3105, Vel]
type = velset
trigger1 = root, anim != 3100
x = 2
y = -3

[State 3105, Anim]
type = changeanim
trigger1 = root, anim = 3100
trigger1 = root, animelemtime(1) > 0 && root, animelemtime(13) < 0
value = 1105
elem = (root, animelemno(0)) - 9

[State 3105, Anim]
type = changeanim
trigger1 = root, anim = 3100
trigger1 = root, animelemtime(19) > 0 && root, animelemtime(22) < 0
value = 1105
elem = (root, animelemno(0)) -18

[State 3105, Anim]
type = changeanim
trigger1 = root, anim = 3100
trigger1 = root, animelem = 13
value = 1106
persistent = 0

[State 3105, Anim]
type = changeanim
trigger1 = root, anim = 3100
trigger1 = root, animelem = 22
value = 1107
persistent = 0

[State 3105, Anim]
type = changeanim
trigger1 = root, anim = 3100
trigger1 = root, animelem = 14
value = 1108
persistent = 0

[State 3105, Anim]
type = changeanim
trigger1 = anim != 1108
trigger1 = root, anim = 1101
value = 1108

[State 3105, End]
type = destroyself
trigger1 = anim = 1108 && animelemtime(3) >= 3
trigger2 = anim = 1109 && animelemtime(5) >= 3
trigger3 = root, anim = 3100
trigger3 = root, animelemtime(18) = 0
trigger4 = root, stateno != 3100
trigger5 = root, movetype = H
ignorehitpause = 1


;========================<MISOGI ILLUSION>=============================
[Statedef 4203]
physics = N
velset = 0, 0
anim = 4203
sprpriority = -1

[State 4203, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 8 * time, 8 * time

[State 4203, End]
type = destroyself
trigger1 = time >= 32
ignorehitpause = 1


;========================<MISOGI FX>=============================
[Statedef 4205]
physics = N
velset = 0, 0
sprpriority = 4

[State 4205, Bind]
type = bindtoroot
trigger1 = 1

[State 4205, Anim]
type = changeanim
trigger1 = anim != 4205
value = 4205

[State 4205, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 4205, End]
type = destroyself
trigger1 = !animtime
ignorehitpause = 1


;========================<TATSUMAKI ELECTRICITY>=============================
[Statedef 1210]
physics = N

[State 1210, Anim]
type = changeanim
triggerall = !time
triggerall = root, anim != 3220
triggerall = root, anim = 1202 || root, anim = 1203 || root, anim = 3201
trigger1 = root, animelem = 2 || root, animelem = 8 || root, animelem = 14 || root, animelem = 20 || root, animelem = 26
value = ifelse((root, stateno = 3200), 1215, ifelse(root, anim = 1203, 1210, 1212))

[State 1210, Anim]
type = changeanim
triggerall = !time
triggerall = root, anim != 3220
triggerall = root, anim = 1202 || root, anim = 1203 || root, anim = 3201
trigger1 = root, animelem = 5 || root, animelem = 11 || root, animelem = 17 || root, animelem = 23 || root, animelem = 29
value = ifelse((root, stateno = 3200), 1216, ifelse(root, anim = 1203, 1211, 1212))

[State 1210, Anim]
type = changeanim
trigger1 = !time
trigger1 = root, anim = 3220
trigger1 = root, animelem = 4 || root, animelem = 10 || root, animelem = 16 || root, animelem = 22 || root, animelem = 28
value = 1215

[State 1210, Anim]
type = changeanim
trigger1 = !time
trigger1 = root, anim = 3220
trigger1 = root, animelem = 7 || root, animelem = 13 || root, animelem = 19 || root, animelem = 25 || root, animelem = 31
value = 1216

[State 1210, Bind]
type = bindtoroot
trigger1 = anim != 1212

[State 1210, sprpriority]
type = sprpriority
trigger1 = 1
value = root, sprpriority + ifelse((anim = 1210), -1, 1)

[State 1210, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1210, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0, 0.5, 0.75
trans = add

[State 1210, End]
type = destroyself
trigger1 = !animtime
trigger2 = anim != [1210, 1219]
trigger3 = root, movetype = H
trigger4 = root, time <= 1
trigger5 = root, stateno != 1200
trigger5 = root, stateno != 1220
trigger5 = root, stateno != 3200
trigger5 = root, stateno != 3220
ignorehitpause = 1


;========================<T.K.K. ELECTRICITY>=============================
[Statedef 1405]
physics = N
anim = 1405
sprpriority = 3

[State 1405, Sound]
type = playsnd
trigger1 = !time
value = 5, 7

[State 1405, Bind]
type = bindtoroot
trigger1 = 1

[State 1405, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1405, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0, 0.5, 0.75
trans = add

[State 1405, End]
type = destroyself
trigger1 = root, movetype = H
trigger2 = root, time <= 1
trigger3 = root, stateno != 1400
trigger4 = root, anim != 1400
ignorehitpause = 1


;========================<PURPLE FLAMES>=============================
[Statedef 1110]
type = A
anim = 1110
velset = 0, 0
sprpriority = -2

[State 1110, Timer]
type = null
trigger1 = time
trigger1 = map(timer) := (map(timer) - 1)

[State 1110, Pos]
type = posset
trigger1 = playerIDexist(map(target))
x = ceil(playerID(map(target)), pos x) - (playerID(map(target)), const(size.ground.back)) * (playerID(map(target)), facing)
y = ceil(playerID(map(target)), pos y) + (playerID(map(target)), const(size.mid.pos.y))

[State 1110, Pos]
type = posset
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), statetype = L || (playerID(map(target)), anim = [5080, 5119])
trigger1 = playerID(map(target)), stateno != [5020, 5050]
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) - 20

[State 1110, Layering]
type = sprpriority
trigger1 = playerIDexist(map(target))
value = playerID(map(target)), sprpriority - 1

[State 1110, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 1110, Sound]
type = playsnd
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), hitshakeover
value = 5, 11
persistent = 0

[State 1110, Afterimage]
type = afterimage
trigger1 = !time
time = 600
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0, 0.75
trans = add

[State 1110, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1110, End]
type = changestate
trigger1 = map(timer) <= 0
trigger2 = !playerIDexist(map(target))
trigger3 = time > 0
trigger3 = playerID(map(target)), palfxvar(time) = 0
value = 1111


;--- DISAPPEAR ---
[Statedef 1111]
type = A
anim = 1111
velset = 0, 0

[State 1111, End]
type = destroyself
trigger1 = !animtime


;========================<RED FLAMES>=============================
[Statedef 1027]
type = A
velset = 0, 0
anim = 1027
sprpriority = -2

[State 1027, Timer]
type = null
trigger1 = time
trigger1 = map(timer) := (map(timer) - 1)

[State 1027, Pos]
type = posset
trigger1 = playerIDexist(map(target))
x = ceil(playerID(map(target)), pos x) - (playerID(map(target)), const(size.ground.back)) * (playerID(map(target)), facing)
y = ceil(playerID(map(target)), pos y) + (playerID(map(target)), const(size.mid.pos.y))

[State 1027, Pos]
type = posset
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), statetype = L || (playerID(map(target)), anim = [5080, 5119])
trigger1 = playerID(map(target)), stateno != [5020, 5050]
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) - 20

[State 1027, Layering]
type = sprpriority
trigger1 = playerIDexist(map(target))
value = playerID(map(target)), sprpriority - 1

[State 1027, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 1027, Afterimage]
type = afterimage
trigger1 = !time
time = 600
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0.50, 0
trans = add

[State 1027, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1027, End]
type = changestate
trigger1 = map(timer) <= 0
trigger2 = !playerIDexist(map(target))
trigger3 = time > 0
trigger3 = playerID(map(target)), palfxvar(time) = 0
value = 1028


;--- DISAPPEAR ---
[Statedef 1028]
type = A
anim = 1028
velset = 0, 0

[State 1028, End]
type = destroyself
trigger1 = !animtime


;========================<ELECTRICITY>=============================
[Statedef 1217]
type = A
velset = 0, 0
anim = 1217
sprpriority = 3

[State 1217, Timer]
type = null
trigger1 = time
trigger1 = map(timer) := (map(timer) - 1)

[State 1217, Pos]
type = posset
trigger1 = playerIDexist(map(target))
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) + (playerID(map(target)), const(size.mid.pos.y))

[State 1217, Pos]
type = posset
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), statetype = L || (playerID(map(target)), anim = [5080, 5119])
trigger1 = playerID(map(target)), stateno != [5020, 5050]
x = ceil(playerID(map(target)), pos x)
y = ceil(playerID(map(target)), pos y) - 20

[State 1217, Pos]
type = posadd
trigger1 = playerIDexist(map(target))
x = cos(time / 8.0 * pi) * 0.2 * playerID(map(target)), const(size.head.pos.y)
y = sin(time / 12.0 * pi) * 0.2 * playerID(map(target)), const(size.head.pos.y)

[State 1217, Layering]
type = sprpriority
trigger1 = playerIDexist(map(target))
value = playerID(map(target)), sprpriority + 1

[State 1217, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 1217, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0, 0.5, 0.75
trans = add

[State 1217, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1217, End]
type = destroyself
trigger1 = map(timer) <= 0
trigger2 = !playerIDexist(map(target))
trigger3 = time > 0
trigger3 = playerID(map(target)), palfxvar(time) = 0


;========================<POWER CHARGE>=============================
[Statedef 525]
type = A
physics = N
anim = 9999
sprpriority = 1
ctrl = 0

[State 525, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 525, noshadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 525, Sound]
type = playsnd
trigger1 = !time
value = 6, 2
channel = 0

[State 525, Sound]
type = playsnd
trigger1 = 1
value = 6, 6
channel = 1
lowpriority = 1
volumescale = ifelse(time < 180, (time * 0.277), 50)

[State 525, bind]
type = bindtoroot
trigger1 = 1
pos = -1 + (random % 2), ceil(0.3125 * (gametime % 16)) -1 + (random % 2)
facing = 1

[State 525, Red]
type = palfx
trigger1 = 1
color = 0
add = 64, 64, 64
mul = 256, 0, 0
time = 1

[State 525, Level]
type = varset
trigger1 = !time
var(0) = root, map(strength)

[State 525, trans]
type = angledraw
trigger1 = 1
scale = 1 + 0.03125 * (gametime % 16), 1 + 0.03125 * (gametime % 16)

[State 525, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 16 * (gametime % 16), 256
ignorehitpause = 1

[State 525, Anim]
type = changeanim
trigger1 = time
trigger1 = selfanimexist(root, anim)
value = (root, anim)
elem = (root, animelemno(0))

[State 525, End]
type = stopsnd
trigger1 = root, movetype = H
trigger2 = root, stateno != 520
channel = 0

[State 525, End]
type = stopsnd
trigger1 = root, movetype = H
trigger2 = root, stateno != 520
channel = 1

[State 525, End]
type = destroyself
trigger1 = root, movetype = H
trigger2 = root, stateno != 520


;========================<HADOUKEN FOCUS>=============================
[Statedef 3004]
physics = N
velset = 0, 0
anim = 3004
sprpriority = 3

[State 3004, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3004, Afterimage]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 6
palbright = 0, 10, 40
palmul = 0.6, 0.75, 0.9
palcontrast = 120, 140, 180
palpostbright = 0, 0, 0
trans = add

[State 3004, Bind]
type = bindtoroot
trigger1 = 1

[State 3004, End]
type = destroyself
trigger1 = !animtime
trigger2 = root, stateno != 3000 && root, stateno != 3020
ignorehitpause = 1


;========================<STATUE>=============================
[Statedef 1002]
type = A
physics = N
movetype = A
anim = 1002
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1002, Anim]
type = changeanim
trigger1 = (root, anim = 1001) && (root, animelemtime(3) < 1)
value = 1002
elem = 2

[State 1002, Bind]
type = bindtoroot
trigger1 = (root, anim = 1001) && (root, animelemtime(3) < 1)
pos = ifelse((root, animelemtime(3) < 0), -28, 55) * const(size.xscale), ifelse((root, animelemtime(3) < 0), -52, -44)

[State 1002, End]
type = destroyself
trigger1 = time < 5 && (root, movetype = H)

[State 1002, Vel]
type = velset
trigger1 = (root, anim = 1001) && (root, animelemtime(3) = 1)
x = 4 + ceil(random / 500)
y = -4 -ceil(random / 500)

[State 1002, Accel]
type = gravity
trigger1 = 1

[State 1002, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP, NA, SA, HA
time = -1
ignorehitpause = 1

[State 1002, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1003
ignorehitpause = 1

[State 1002, HitSound]
type = playsnd
trigger1 = movehit = 1
value = 2, ifelse(numtarget, 1, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1002, Hit]
type = hitdef
trigger1 = 1
priority = 1, Hit
attr = S, SP
damage = 7, 7
guard.dist = const(size.proj.attack.dist)
animtype = Light
air.animtype = Light
fall.animtype = Light
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = s6000
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 10
ground.hittime = 1 + 10
ground.velocity = -3.91, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 8
guard.ctrltime = 1 + 8
guard.slidetime = 8
airguard.velocity = -6.00, -1.00
air.velocity = (root, const(size.xscale)) * -1, -1 + root, map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
yaccel = 0.941
forcestand = 1

[State 1002, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit, 50, 25) * root, map(meterscaling)
ignorehitpause = 1

[State 1002, Spark]
type = explod
trigger1 = movehit && numtarget
trigger1 = movehitvar(frame)
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1002, Connected]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = vel y > 0
trigger2 = pos y > -vel y
value = 1003
ignorehitpause = 1


[Statedef 1003]
type = A
physics = S
movetype = I
anim = 1003
ctrl = 0
sprpriority = 3
velset = 0, 0

[State 1003, Sound]
type = playsnd
trigger1 = !time
value = 2, 0
volumescale = 50

[State 1003, Pos]
type = posset
trigger1 = !time
trigger1 = pos y > 0
y = 0

[State 1003, End]
type = destroyself
trigger1 = !animtime


;========================<INTRO THUNDER>=============================
[Statedef 358]
physics = N
anim = 358
velset = 0, 0
sprpriority = 4

[State 358, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 358, Afterimage]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 6
palbright = 0, 10, 40
palmul = 0.6, 0.75, 0.9
palcontrast = 120, 140, 180
palpostbright = 0, 0, 0
trans = add

[State 358, Sound]
type = playsnd
trigger1 = !time
trigger1 = !prevstateno
value = 5, 12

[State 358, End]
type = destroyself
trigger1 = !animtime


;========================<CYBER JET>=============================
[Statedef 6061]
physics = N
anim = 6061
sprpriority = -1

[State 6061, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = prevstateno != 6061
time = 999
timegap = 1
framegap = 1
length = 6
palbright = 0, 0, 0
palmul = 0.9, 0.7, 0.4
palcontrast = 180, 140, 80
palpostbright = 0, 0, 0
trans = add

[State 6061, Sound]
type = playsnd
trigger1 = roundstate != 0
value = 5, 14
persistent = 0

[State 6061, Bind]
type = bindtoroot
trigger1 = 1

[State 6061, End]
type = destroyself
trigger1 = roundstate != 0
trigger1 = root, vel y <= 0.4


;========================<NECKLACE>=============================
[Statedef 360]
physics = N
anim = 360
velset = 0, 0
sprpriority = ifelse(const(size.height) > 5, -1, 1)

[State 360, Vel]
type = velset
trigger1 = time = 1
x = (rootdist x + (9 * const(size.xscale))) / -1.2
y = (rootdist y - (39 * const(size.xscale))) / -1.0

[State 360, Randomize Vel]
type = velmul
trigger1 = time = 1
x = 0.9 + (random / 5000.0)
y = 0.9 + (random / 5000.0)

[State 360, Vel]
type = velset
trigger1 = time >= 1
trigger1 = pos y >= -2
trigger1 = abs(vel y) < 2
y = 0

[State 360, Pos]
type = posset
trigger1 = time >= 1
trigger1 = vel y = 0
trigger1 = pos y > 0
y = 0

[State 360, Pos]
type = velmul
trigger1 = time >= 1
trigger1 = !vel y && !pos y
x = 0.8

[State 360, Accel]
type = veladd
trigger1 = time >= 1
trigger1 = pos y < 0
y = 0.40

[State 360, Vel]
type = velmul
trigger1 = time >= 1
trigger1 = vel y > 0
trigger1 = pos y > -vel y
trigger1 = abs(vel y) >= 1
x = 0.75
y = -0.75

[State 360, Stop]
type = velset
trigger1 = time >= 1
trigger1 = abs(vel y) < 1
trigger1 = pos y >= 0
y = 0


;========================<RECOVER FX>=============================
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8200, End]
type = destroyself
trigger1 = time >= 16


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
