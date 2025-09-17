; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<SOUL FIST>=============================
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

[State 1005, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 5.67, ifelse(map(strength) = 1, 4.72, 3.77))
y = 0

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 1005, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.8333, 1
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1005, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
pos = 0, 0
random = 20, 20
scale = 0.33, 0.33
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 10, 0)
channel = 2
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, SP
damage = 70, 18
dizzypoints = 100 * !(root, map(darkforce))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 20), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.00 * !numhelper(775), -8.15
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 1005, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = root, map(darkforce) <= 0
trigger1 = var(1) >= ifelse(map(strength) = 2, 80, ifelse(map(strength) = 1, 65, 50))
trigger2 = root, map(darkforce) > 0
trigger2 = var(1) >= ifelse(map(strength) = 2, 160, ifelse(map(strength) = 1, 130, 100))
trigger3 = frontedgedist < -20
trigger4 = backedgedist < -20
trigger4 = root, map(darkforce) <= 0
value = 1007
ignorehitpause = 1


;----- Contact -----
[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 1006, removebat]
type = removeexplod
trigger1 = numexplod(1008)
ID = 1008
ignorehitpause = 1

[State 1006, Bats]
type = helper
trigger1 = !numexplod(1008)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
size.xscale = 1
size.yscale = 1
persistent = 0
ownpal = 1

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 1006, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 1006, End]
type = destroyself
trigger1 = !animtime


;----- Fade -----
[Statedef 1007]
type = A
physics = N
movetype = I
anim = 1007
velset = 0.5 * vel x, 0.5 * vel y
ctrl = 0
sprpriority = 3

[State 1007, removebat]
type = removeexplod
trigger1 = numexplod(1008)
ID = 1008

[State 1007, Bats]
type = helper
trigger1 = !numexplod(1008)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
persistent = 0
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 1007, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) -time * (const(size.xscale) / 15), const(size.yscale) -time * (const(size.yscale) / 15)

[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1007, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 1007, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 1007, End]
type = destroyself
trigger1 = !numexplod(1008)
trigger1 = time >= 15


;========================<AIR SOUL FIST>=============================
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
stateno = 1006
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
trigger1 = root, stateno = 1050
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 4.6, ifelse(map(strength) = 1, 3.83, 2.88))
y = 4.8

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 1055, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1058
ID = 1008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.8333, 1
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1055, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), -0.5 + (random < 500)
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
pos = 0, 0
random = 20, 20
scale = 0.33, 0.33
ignorehitpause = 1

[State 1055, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 10, 0)
channel = 2
ignorehitpause = 1

[State 1055, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = A, SP
damage = 70, 18
dizzypoints = 100 * !(root, map(darkforce))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 10), map(sparky) := 10
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.00 * !numhelper(775), -8.15
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 1055, Hit Low]
type = modifyhitdef
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low
air.type = Low

[State 1055, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1055, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = pos y >= -20
trigger2 = frontedgedist < -20
trigger3 = backedgedist < -20
trigger3 = root, map(darkforce) <= 0
value = 1007
ignorehitpause = 1


;========================<EX SOUL FIST>=============================
[Statedef 1015]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
sprpriority = 3

[State 1015, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 1015, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1010
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1015, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1015, Vel]
type = velset
trigger1 = time < 8
x = 6
y = 0

[State 1015, Vel]
type = velset
trigger1 = vel y > 0
trigger1 = pos y >= -20
y = 0

[State 1015, Vel]
type = posset
trigger1 = vel y > 0
trigger1 = pos y >= -20
y = -20

[State 1015, Flip Bat]
type = removeexplod
trigger1 = time >= 8
trigger1 = vel x < 0
ID = 1008
persistent = 0

[State 1015, Turn]
type = turn
trigger1 = time >= 8
trigger1 = vel x < 0
persistent = 0

[State 1015, Accel]
type = veladd
trigger1 = vel x < 6
trigger1 = p2dist x >= 0
x = 0.2

[State 1015, Accel]
type = veladd
trigger1 = vel x > -6
trigger1 = p2dist x < 0
x = -0.2

[State 1015, Accel]
type = veladd
triggerall = vel y < 6
trigger1 = p2statetype = S || p2statetype = A
trigger1 = pos y < (p2, pos y + p2, const(size.mid.pos.y))
trigger2 = p2statetype = C
trigger2 = pos y < (p2, pos y + (p2, const(size.mid.pos.y) / 2.0))
trigger3 = p2statetype = L
trigger3 = pos y < -10
y = 0.2

[State 1015, Accel]
type = veladd
triggerall = vel y > -6
trigger1 = p2statetype = S || p2statetype = A
trigger1 = pos y > (p2, pos y + p2, const(size.mid.pos.y))
trigger2 = p2statetype = C
trigger2 = pos y > (p2, pos y + (p2, const(size.mid.pos.y) / 2))
trigger3 = p2statetype = L
trigger3 = pos y < -10
y = -0.2

[State 1015, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 1015, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.8333, 1
removeongethit = 1
ignorehitpause = 1

[State 1015, Rotate Bat]
type = modifyexplod
trigger1 = numexplod(1008)
trigger1 = root, const(size.xscale) < root, const(size.yscale)
ID = 1008
angle = atan(vel y / vel x) * (-180 / pi)

[State 1015, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
pos = 0, 0
random = 20, 20
scale = 0.33, 0.33
ignorehitpause = 1

[State 1015, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 10, 0)
channel = 2
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = S, SP
damage = 90, 23
dizzypoints = 100 * !(root, map(darkforce))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 20), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.00 * !numhelper(775), -8.15
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 1015, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = var(1) >= 90
trigger2 = root, movetype = H
value = 1007
ignorehitpause = 1


;========================<EX AIR SOUL FIST>=============================
[Statedef 1065]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1065, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1065, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 1065, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1060
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1065, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1065, Vel]
type = velset
trigger1 = time < 8
x = 4.24
y = 4.24

[State 1065, Vel]
type = velset
trigger1 = vel y > 0
trigger1 = pos y >= -20
y = 0

[State 1065, Vel]
type = posset
trigger1 = vel y > 0
trigger1 = pos y >= -20
y = -20

[State 1065, Flip Bat]
type = removeexplod
trigger1 = time >= 8
trigger1 = vel x < 0
ID = 1008
persistent = 0

[State 1065, Turn]
type = turn
trigger1 = time >= 8
trigger1 = vel x < 0
persistent = 0

[State 1065, Accel]
type = veladd
trigger1 = vel x < 6
trigger1 = p2dist x >= 0
x = 0.2

[State 1065, Accel]
type = veladd
trigger1 = vel x > -6
trigger1 = p2dist x < 0
x = -0.2

[State 1065, Accel]
type = veladd
triggerall = vel y < 6
trigger1 = p2statetype = S || p2statetype = A
trigger1 = pos y < (p2, pos y + p2, const(size.mid.pos.y))
trigger2 = p2statetype = C
trigger2 = pos y < (p2, pos y + (p2, const(size.mid.pos.y) / 2.0))
trigger3 = p2statetype = L
trigger3 = pos y < -10
y = 0.2

[State 1065, Accel]
type = veladd
triggerall = vel y > -6
trigger1 = p2statetype = S || p2statetype = A
trigger1 = pos y > (p2, pos y + p2, const(size.mid.pos.y))
trigger2 = p2statetype = C
trigger2 = pos y > (p2, pos y + (p2, const(size.mid.pos.y) / 2))
trigger3 = p2statetype = L
trigger3 = pos y < -10
y = -0.2

[State 1065, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 1065, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.8333, 1
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1065, Rotate Bat]
type = modifyexplod
trigger1 = numexplod(1008)
trigger1 = root, const(size.xscale) < root, const(size.yscale)
ID = 1008
angle = atan(vel y / vel x) * (-180 / pi)

[State 1065, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
pos = 0, 0
random = 20, 20
scale = 0.33, 0.33
ignorehitpause = 1

[State 1065, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 10, 0)
channel = 2
ignorehitpause = 1

[State 1065, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = A, SP
damage = 90, 23
dizzypoints = 100 * !(root, map(darkforce))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 20), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.00 * !numhelper(775), -8.15
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 1065, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1065, End]
type = changestate
trigger1 = var(1) >= 90
trigger2 = root, movetype = H
value = 1007
ignorehitpause = 1


;========================<SOUL PHOENIX>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3005, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3005, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 3005, 3006)
ignorehitpause = 1

[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = anim != 3005
value = 3005

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

[State 3005, Time Var]
type = varadd
trigger1 = time > 0
var(1) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
;x = 6.70
x = ifelse(map(strength) = 2, 6.70, ifelse(map(strength) = 1, 5.58, 4.47))

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 3005, Skull]
type = explod
trigger1 = !numexplod(3008)
anim = 3008
ID = 3008
sprpriority = 3
postype = p1
scale = 0.5, 0.5
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1

[State 3005, Particles]
type = explod
trigger1 = 1
anim = 8150
ID = 8150
sprpriority = 3
postype = p1
pos = -20, 0
random = 20, 20
vel = -2, -1 + (random / 500.0)
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 6, 0)
value = 1

[State 3005, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 6, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + var(2)))
priority = 4, Hit
attr = S, HP
damage = 67, 17
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 20), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.00 * !numhelper(775), -7.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.00 * !numhelper(775), -7.00
fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
ID = 3005

[State 3005, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3005)
trigger1 = target(3005), hitfall
trigger1 = target(3005), selfanimexist(7697)
trigger1 = target(3005), stateno = 5000 || target(3005), stateno = 5010 || target(3005), stateno = 5020
value = 7697
ID = 3005
ignorehitpause = 1

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(2) < 3, 3005, 3006)
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = var(1) > 80; Around 100 in VH Normal
trigger2 = frontedgedist < -80
trigger3 = backedgedist < -80
trigger3 = root, map(darkforce) <= 0
value = 3007
ignorehitpause = 1


[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 3006, Remove Skull]
type = removeexplod
trigger1 = numexplod(3008)
ID = 3008

[State 3006, Bats]
type = helper
trigger1 = time <= 2
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 3006, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 3006, End]
type = destroyself
trigger1 = !animtime


[Statedef 3007]
type = A
physics = N
movetype = I
anim = 3007
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 3007, Remove Skull]
type = removeexplod
trigger1 = numexplod(3008)
ID = 3008

[State 3007, Bats]
type = helper
trigger1 = time <= 2
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3007, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) - time * (const(size.xscale) / 15), const(size.yscale) - time * (const(size.yscale) / 15)

[State 3007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3007, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 3007, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 3007, End]
type = destroyself
trigger1 = time >= 15


;========================<MID-AIR SOUL PHOENIX>=============================
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3055, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3055, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 3055, 3006)
ignorehitpause = 1

[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Anim]
type = changeanim
trigger1 = anim != 3005
value = 3005

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

[State 3055, Vel]
type = velset
trigger1 = 1
;x = 5.83
;y = 2.33
x = ifelse(map(strength) = 2, 5.84, ifelse(map(strength) = 1, 5.26, 4.47))
y = ifelse(map(strength) = 2, 2.42, ifelse(map(strength) = 1, 3.52, 4.47))

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 6), 256
ignorehitpause = 1

[State 3055, Skull]
type = explod
trigger1 = !numexplod(3008)
anim = 3008; 3058
ID = 3008
sprpriority = 3
postype = p1
scale = 0.5, 0.5
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 3055, Rotate Skull]
type = modifyexplod
trigger1 = numexplod(3008)
ID = 3008
angle = atan(vel y / vel x) * (-180 / pi)

[State 3055, Particles]
type = explod
trigger1 = 1
anim = 8150
ID = 8150
sprpriority = 3
postype = p1
pos = -14, -14
random = 20, 20
vel = -2, -1 - (random / 500.0)
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 3055, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 6, 0)
value = 1

[State 3055, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 6, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + var(2)))
priority = 4, Hit
attr = A, HP
damage = 60, 15
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 10), map(sparky) := 10
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.00 * !numhelper(775), -7.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.00 * !numhelper(775), -7.00
down.velocity = 0, 0
down.hittime = 20
fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
ID = 3055

[State 3055, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3055)
trigger1 = target(3055), hitfall
trigger1 = target(3055), selfanimexist(7697)
trigger1 = target(3055), stateno = 5000 || target(3055), stateno = 5010 || target(3055), stateno = 5020
value = 7697
ID = 3055
ignorehitpause = 1

[State 3055, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(2) < 3, 3055, 3006)
ignorehitpause = 1

[State 3055, End]
type = changestate
trigger1 = pos y >= -20
trigger2 = frontedgedist < -80
trigger3 = backedgedist < -80
trigger3 = root, map(darkforce) <= 0
value = 3007
ignorehitpause = 1


;========================<FINISHING SHOWER>=============================
[Statedef 3305]
type = S
physics = N
movetype = A
anim = 3305
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3305, Pos]
type = varset
trigger1 = !time
fvar(24) = -36 - (random / 100.0)

[State 3305, Pos]
type = varset
trigger1 = !time
fvar(25) = -30 - 70 * ((fvar(24) + 36) / -10.0)

[State 3305, Bind]
type = bindtoroot
trigger1 = time < 16
pos = (fvar(24) * root, const(size.xscale)), fvar(25)
facing = 1
ignorehitpause = 1

[State 3305, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3306
ignorehitpause = 1

[State 3305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 3305, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3300
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3305, Fade]
type = trans
trigger1 = time < 7
trans = addalpha
alpha = 32 * (time + 1), 256 - (32 * (time + 1))

[State 3305, SprPriority Var]
type = mapset
trigger1 = !time
map = "layering"
value = ifelse(random < 667, 3, -1)
ignorehitpause = 1

[State 3305, SprPriority]
type = sprpriority
trigger1 = 1
value = map(layering)

[State 3305, Vel]
type = velset
trigger1 = time < 16
x = 0
y = 0

[State 3305, Decide Angle]
type = mapset
map = "direction"
triggerall = root, AIlevel = 0
trigger1 = !time
trigger2 = time < 16
trigger2 = root, stateno = 3300
value = ifelse(root, command = "holdup", -1, ifelse(root, command = "holddown", 1, 0))

[State 3305, Decide Angle]
type = mapset
map = "direction"
triggerall = root, AIlevel > 0
trigger1 = !time
trigger2 = time < 16
trigger2 = root, stateno = 3300
value = ifelse(p2dist y < 0, -1, ifelse(p2dist x < 120, 1, 0))

[State 3305, Vel]
type = velset
trigger1 = time >= 16
x = 16
y = map(direction) * 2.0

[State 3305, Jet]
type = explod
trigger1 = time >= 16 && !numexplod(3306)
anim = 3306
ID = 3306
sprpriority = map(layering) + 1
postype = p1
pos = -12, 0
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 3305, Shot]
type = explod
trigger1 = time = 14
anim = 3307
ID = 3307
sprpriority = map(layering) + 1
postype = p1
pos = -15, 0
scale = 0.5, 0.5
ownpal = 1

[State 3305, Trail]
type = explod
trigger1 = time >= 16
anim = 3308
ID = 3308
sprpriority = map(layering) + 1
postype = p1
pos = -16, 0
bindtime = 1; Ikemen fix?
scale = 0.25, 0.50
angle = atan(vel y / vel x) * (-180 / pi)
ownpal = 1

[State 3305, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 9, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3305, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = time >= 18
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 30)
priority = 4, Hit
attr = S, HP
damage = 10, 2
dizzypoints = 0
guard.dist = 320
animtype = Hard
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
pausetime = 0, 12
guard.pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4 * !numhelper(775), -6
down.velocity = -3 * !numhelper(775), -3
guard.velocity = -10.52 * !numhelper(775)
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 3305, Hit Low]
type = modifyhitdef
;trigger1 = random < 500
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low

;[State 3305, Blood]
;in ZSS

[State 3305, End]
type = changestate
trigger1 = time > 120
trigger1 = frontedgedist < -120 || backedgedist < -120
trigger2 = time < 16
trigger2 = root, movetype = H
value = 3306
ignorehitpause = 1


;----- Disappear -----
[Statedef 3306]
type = A
physics = N
movetype = I
anim = 3305
ctrl = 0
sprpriority = 3

[State 3306, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3306, removejet]
type = removeexplod
trigger1 = numexplod(3306)
ID = 3306
ignorehitpause = 1

[State 3306, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = (256 - 16 * time), (16 * time)

[State 3306, End]
type = destroyself
trigger1 = time >= 16


;===================<DARKNESS ILLUSION DOUBLE>===================
[Statedef 4015]
type = A
physics = N
movetype = A
anim = 4010
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4015, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4015, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4015
ignorehitpause = 1

[State 4015, Assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 4015, Fade In]
type = trans
trigger1 = time < 32
trans = addalpha
alpha = (8 * time), 256 - (8 * time)

[State 4015, Anim]
type = changeanim
triggerall = (root, stateno = 4010) && (root, anim = [4010, 4011])
trigger1 = anim != (root, anim)
trigger2 = animelemno(0) != (root, animelemno(0))
value = root, anim
elem = root, animelemno(0)

[State 4015, Pos]
type = posset
trigger1 = 1
y = root, pos y

[State 4015, Bind]
type = bindtoroot
trigger1 = 1
pos = 160 * const(size.xscale), 0
facing = -1
time = 1

[State 4015, Lv3 Super Afterimage]
type = afterimage
trigger1 = time = 30
time = 300
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 4015, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 4015, Spark Properties]
type = null
trigger1 = 1 || map(sparkno) := root, map(sparkno)
trigger1 = 1 || map(guard.sparkno) := root, map(guard.sparkno)
trigger1 = 1 || map(sparkx.min) := root, map(sparkx.min)
trigger1 = 1 || map(sparkx.max) := root, map(sparkx.max)
trigger1 = 1 || map(sparky) := (0.5 * root, map(sparky))

[State 4015, Hit High Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 8 || animelem = 14 || animelem = 19 || animelem = 36 || animelem = 37
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 0, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
forcestand = 1
p2facing = ifelse(p2, facing = facing && random < 666, 1, -1)

[State 4015, Hit Low Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 11 || animelem = 28 || animelem = 38 || animelem = 39
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, ifelse((animelem = 39), -3, -1.5)
getpower = 0, 0
givepower = 0, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
forcestand = 1
p2facing = ifelse(p2, facing = facing && random < 666, 1, -1)

[State 4015, Hit Up Ground]
type = hitdef
trigger1 = anim = 4010 && animelem = 42
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = S, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, -12
guard.velocity = 0
air.type = Low
air.velocity = 0, -12
getpower = 0, 0
givepower = 0, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
forcestand = 1
p2facing = -1

[State 4015, Hit Midair]
type = hitdef
trigger1 = anim = 4011
trigger1 = animelem = 4 || animelem = 9 || animelem = 15 || animelem = 20 || animelem = 25
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = A, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, -5
guard.velocity = 0
air.type = Low
air.velocity = 0, ifelse((animelem = 25), -4, -1.5)
getpower = 0, 0
givepower = 0, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
forcestand = 1
p2facing = ifelse(p2, facing = facing && random < 666, 1, -1)

[State 4015, Hit Final]
type = hitdef
trigger1 = anim = 4011 && animelem = 32
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4010
attr = A, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, 4
guard.velocity = 0
air.type = Trip
air.velocity = 0, 9
getpower = 0, 0
givepower = 0, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
forcestand = 1
p2facing = -1

[State 4015, FX]
type = explod
trigger1 = anim = 4010 && animelem = 46
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = 0.75, 0.75
removeongethit = 1
ownpal = 1

[State 4015, FX]
type = explod
trigger1 = anim = 4011 && animelem = 31
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = 0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4015, End]
type = changestate
trigger1 = root, anim = 4011
trigger1 = root, animelemtime(33) >= 0
trigger2 = root, stateno = 4002
value = 4016

[State 4015, End]
type = destroyself
trigger1 = !ishelper(4015) || root, stateno != 4010


;----- Fade out -----
[Statedef 4016]
type = A
physics = N
sprpriority = 2

[State 4016, Afterimage]
type = afterimagetime
trigger1 = !time
time = 0

[State 4016, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 - 12.8 * time), ceil(12.8 * time)

[State 4016, Bats]
type = helper
trigger1 = time && !(time % 6)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
pos = 0, -55

[State 4016, Accel]
type = veladd
trigger1 = 1
y = root, const(movement.yaccel)

[State 4016, Vel]
type = velset
trigger1 = !time
x = root, vel x
y = root, vel y

[State 4016, End]
type = destroyself
trigger1 = time >= 20 || pos y >= 0


;===================<AIR DARKNESS ILLUSION DOUBLE>===================
[Statedef 4065]
type = A
physics = N
movetype = A
anim = 4060
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 4065, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4065, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4065
ignorehitpause = 1

[State 4065, Assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 4065, Fade In]
type = trans
trigger1 = time < 32
trans = addalpha
alpha = (8 * time), 256 - (8 * time)

[State 4065, Anim]
type = changeanim
triggerall = (root, stateno = 4060) && (root, anim = 4060)
trigger1 = anim != (root, anim)
trigger2 = animelemno(0) != (root, animelemno(0))
value = 4060
elem = root, animelemno(0)

[State 4065, Bind]
type = bindtoroot
trigger1 = 1
pos = 128 * const(size.xscale), 0
facing = -1
time = 1

[State 4065, Lv3 Super Afterimage]
type = afterimage
trigger1 = time = 30
time = 300
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 128, 0, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 4065, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 4065, FX]
type = explod
trigger1 = anim = 4060 && animelem = 29
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = 0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4065, Spark Properties]
type = null
trigger1 = 1 || map(sparkno) := root, map(sparkno)
trigger1 = 1 || map(guard.sparkno) := root, map(guard.sparkno)
trigger1 = 1 || map(sparkx.min) := root, map(sparkx.min)
trigger1 = 1 || map(sparkx.max) := root, map(sparkx.max)
trigger1 = 1 || map(sparky) := (0.5 * root, map(sparky))

[State 4065, Hit High]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 20 || animelem = 22
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = S, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, -1.5
guard.velocity = -10.52
air.type = High
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850
p2facing = ifelse(p2, facing = facing && random < 666, 1, -1)

[State 4065, Hit Low]
type = hitdef
trigger1 = animelem = 3 || animelem = 10 || animelem = 17 || animelem = 21 || animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = S, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, -1.5
guard.velocity = -10.52
air.type = Low
air.velocity = 0, -1.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850
p2facing = ifelse(p2, facing = facing && random < 666, 1, -1)

[State 4065, Hit Final]
type = hitdef
trigger1 = animelem = 30
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 4060
attr = A, HA
damage = 0, 0
dizzypoints = 0
guardpoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 12, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, map(sparky)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 32
ground.slidetime = 18
ground.velocity = 0, 10
air.type = Low
air.velocity = 0, 10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
guard.velocity = -10.52
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
forcestand = 1
fall.xvelocity = 0
fall.yvelocity = -4
p2facing = -1

[State 4065, End]
type = changestate
trigger1 = root, anim = 4060
trigger1 = root, animelemtime(33) >= 0
trigger2 = root, stateno = 4002
value = 4016

[State 4065, End]
type = destroyself
trigger1 = !ishelper(4065) || root, stateno != 4060


;========================<ETERNAL SLUMBER>=============================
;----- PROJECTILE -----
[Statedef 4105]
type = S
physics = N
movetype = A
anim = 4105
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4105, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4106
ignorehitpause = 1

[State 4105, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AA, AP
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

[State 4105, Vel]
type = velset
trigger1 = 1
x = 3.33
y = 2 * sin(time / 8.0)

[State 4105, pulse]
type = angledraw
trigger1 = 1
scale = ((0.75 + 0.25 * cos(time / 5.0)) * const(size.xscale)), ((0.75 + 0.25 * cos(time / 5.0)) * const(size.yscale))

[State 4105, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 4105, sprpriority]
type = sprpriority
trigger1 = 1
value = 4

[State 4105, Particles]
type = explod
trigger1 = 1
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 4109
sprpriority = 4
postype = p1
pos = 0, 0
random = 20, 20
scale = 0.5, 0.5
ignorehitpause = 1

[State 4105, Miss]
type = hitdef
trigger1 = 1
attr = S, HT
hitflag =
sparkxy = -10, 0

[State 4105, Hit]
type = hitdef
trigger1 = numenemy
trigger1 = !(root, map(unthrowable))
trigger1 = p2bodydist x = [-(const(size.ground.front) + const(size.ground.back) + p2, const(size.ground.front) + p2, const(size.ground.back)), 0]
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 4105
attr = S, HT
hitflag = M
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := -1)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := -1)
sparkxy = -10, 0
hitsound = s2, 800
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
fall.xvelocity = 0
fall.yvelocity = 0
numhits = 0
p1stateno = 4107
p2stateno = 4120

[State 4105, Miss]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = frontedgedist < -40 || backedgedist < -40
trigger3 = root, stateno != 4100
trigger4 = root, movetype = H
value = 4106
ignorehitpause = 1


;----- Miss -----
[Statedef 4106]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 4106, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4106, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4106, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) -time * (const(size.xscale) / 20), const(size.yscale) -time * (const(size.yscale) / 20)

[State 4106, Trans]
type = trans
trigger1 = 1
trans = add1

[State 4106, End]
type = destroyself
trigger1 = time >= 20
trigger2 = frontedgedist < -40 || backedgedist < -200


;----- BINDING -----
[Statedef 4107]
type = S
physics = N
movetype = A
anim = 4105
sprpriority = 3
velset = 0, 0
ctrl = 0

[State 4107, Send Target]
redirectID = root, ID
type = targetadd
trigger1 = numtarget(4105)
trigger1 = target(4105), ishelper = 0
playerID = target(4105), ID

[State 4107, Anim]
type = changeanim
trigger1 = 1
value = ifelse(time < 16, 4107, 9999)

[State 4107, Scale]
type = angledraw
trigger1 = time < 16
scale = (time + 1) * 0.5, (time + 1) * 0.5

[State 4107, Fade]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256 - (16 * time), 128 + (8 * time)

[State 4107, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 4107, End]
type = destroyself
trigger1 = time >= 16


;========================<CURTAIN>=============================
[Statedef 4190]
physics = N
anim = 4190
sprpriority = 10

; Doing this would break the silhouette effect
;[State 4190, Layering]
;type = sprpriority
;trigger1 = !time
;value = 10
;layerno = 1

[State 4190, Pos Var]
type = angledraw
trigger1 = 1
scale = gamewidth / 320.0, gamewidth / 320.0

[State 4190, Pos Var]
type = mapset
trigger1 = !time
map = "posx"
value = -160

[State 4190, Pos Var]
type = mapset
trigger1 = anim = 4190 && animelemtime(2) >= 0
trigger1 = anim = 4191 && animelemtime(2) < 0
map = "posx"
value = 0

[State 4190, Pos Var]
type = mapadd
trigger1 = anim = 4190
trigger1 = animelemtime(2) < 0
map = "posx"
value = 5.33

[State 4190, Pos Var]
type = mapadd
trigger1 = anim = 4191
trigger1 = animelemtime(2) >= 0
map = "posx"
value = -5.33

[State 4190, Bind]
type = posset
trigger1 = 1
x = map(posx) * facing
y = pos y - screenpos y

[State 4190, Anim]
type = changeanim
trigger1 = anim = 4190 && animelemtime(3) > 4 && (root, stateno != 4110)
value = 4191

[State 4190, Palfx]
type = bgpalfx
trigger1 = anim = 4191
trigger1 = animelemtime(1) < 30
time = 2
mul = ceil(animelemtime(1) * 8.53), ceil(animelemtime(1) * 8.53), ceil(animelemtime(1) * 8.53)

[State 4190, Sound]
type = playsnd
trigger1 = anim = 4190
value = 5, 7
channel = 3
persistent = 0

[State 4190, Sound]
type = playsnd
trigger1 = anim = 4191
value = 5, 7
channel = 3
persistent = 0

; Moved to ZSS
;[State 4190, Palfx]
;type = bgpalfx
;trigger1 = anim = 4190
;trigger1 = animelemtime(1) >= 30
;time = 2
;mul = 0, 0, 0

; Moved to ZSS
;[State 4190, Palfx]
;type = bgpalfx
;triggerall = root, stateno = 4110 && root, anim = 4110
;trigger1 = root, animelemtime(3) = [0, 4]
;trigger2 = root, animelemtime(5) = [0, 4]
;trigger3 = root, animelemtime(7) = [0, 4]
;trigger4 = root, animelemtime(9) = [0, 4]
;trigger5 = root, animelemtime(11) = [0, 4]
;trigger6 = root, animelemtime(13) = [0, 4]
;trigger7 = root, animelemtime(15) = [0, 4]
;trigger8 = root, animelemtime(17) = [0, 4]
;time = 1
;add = 255, 255, 255

; Moved to ZSS
;[State 4190, Palfx]
;type = palfx
;triggerall = root, stateno = 4110 && root, anim = 4110
;trigger1 = root, animelemtime(3) = [0, 4]
;trigger2 = root, animelemtime(5) = [0, 4]
;trigger3 = root, animelemtime(7) = [0, 4]
;trigger4 = root, animelemtime(9) = [0, 4]
;trigger5 = root, animelemtime(11) = [0, 4]
;trigger6 = root, animelemtime(13) = [0, 4]
;trigger7 = root, animelemtime(15) = [0, 4]
;trigger8 = root, animelemtime(17) = [0, 4]
;time = 1
;add = 255, 255, 255

[State 4190, Assert]
type = assertspecial
trigger1 = root, stateno = 4110 && root, anim = 4110
trigger1 = root, animelemtime(3) >= 0
trigger1 = root, animelemtime(17) <= 4
flag = nobardisplay
flag2 = noFG

[State 4190, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 4190, End]
type = destroyself
trigger1 = anim = 4191
trigger1 = backedgedist < -25 || frontedgedist < -25


;========================<KICK THROW CLAW>=============================
[Statedef 825]
physics = N
velset = 0, 0
anim = 825
sprpriority = 2

[State 825, Bind to Target]
type = posset
trigger1 = root, numtarget(800)
x = root, target(800), pos x
y = -65

[State 825, Vel]
type = velset
trigger1 = root, numtarget(800)
x = ifelse(root, numtarget(800), 0, 12)

[State 825, Bind]
type = bindtoroot
trigger1 = root, stateno = 820
trigger1 = root, anim = 820
trigger1 = root, animelemtime(9) < 0
pos = 105 * root, const(size.xscale), -65

[State 825, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 825, Pos]
type = posset
trigger1 = 1
y = -65

[State 825, Jet]
type = explod
trigger1 = !time
anim = 3306
ID = 3306
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 825, Jet]
type = removeexplod
trigger1 = root, numtarget(800) = 0
trigger2 = root, numtarget(800)
trigger2 = root, target(800), stateno != [821, 823]
trigger3 = time >= 180
ID = 3306

[State 825, End]
type = changestate
trigger1 = root, numtarget(800) = 0
trigger2 = root, numtarget(800)
trigger2 = root, target(800), stateno != [821, 823]
trigger3 = time >= 180
value = 6110


;========================<FINISHING SHOWER DUST>=============================
[Statedef 3303]
physics = N
anim = 6010
sprpriority = 3

[State 3303, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time < 16, 16 * time, 256), 256
ignorehitpause = 1

[State 3303, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 3303, Bind]
type = posset
trigger1 = 1
x = root, pos x
y = 0

[State 3303, End]
type = changestate
trigger1 = root, stateno != 3300
trigger2 = root, anim != 3300
trigger3 = root, movetype = H
value = 3304


;----- Fade out -----
[Statedef 3304]
physics = N
velset = 0, 0
sprpriority = 3

[State 3304, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (16 * time), 256
ignorehitpause = 1

[State 3304, End]
type = destroyself
trigger1 = time >= 16


;========================<DRILL>=============================
[Statedef 3405]
physics = N
velset = 0, 0
anim = 3405
sprpriority = 3

[State 3405, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3405, Pos]
type = bindtoroot
trigger1 = 1
pos = (76 * root, const(size.xscale)), -43

[State 3405, Turn]
type = turn
trigger1 = facing != root, facing

[State 3405, Sound]
type = playsnd
trigger1 = !time
value = 5, 12
channel = 0

[State 3405, Sound]
type = stopsnd
trigger1 = (root, stateno != 3401) || (root, anim != 3402)
trigger2 = (root, anim = 3402) && (root, animelemtime(3) < 0)
channel = 0

[State 3405, End]
type = destroyself
trigger1 = (root, stateno != 3401) || (root, anim != 3402)
trigger2 = (root, anim = 3402) && (root, animelemtime(3) < 0)


;========================<HOLE>=============================
[Statedef 6005]
physics = N
velset = 0, 0
anim = 6005
sprpriority = -10

[State 6005, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6005, Fade]
type = trans
trigger1 = root, animelemtime(13) >= 0
trans = addalpha
alpha = ceil(256 -10.2 * root, animelemtime(13)), ceil(10.2 * root, animelemtime(13))

[State 6005, End]
type = destroyself
trigger1 = root, stateno != 191
trigger2 = root, stateno = 191 && root, animelemtime(13) >= 25


;========================<WALKING EFFECTS>=============================
[Statedef 6010]
physics = N
velset = 0, 0
anim = 6010
sprpriority = 1

[State 6010, Bat 1 - Top Left]
type = explod
trigger1 = !numexplod(1)
anim = 6100
ID = 1
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
ownpal = 1
removeongethit = 1

[State 6010, Bat 2 - Top Right]
type = explod
trigger1 = !numexplod(2)
anim = 6100
ID = 2
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 0
removetime = -1
ownpal = 1
removeongethit = 1

[State 6010, Bat 3 - Circling]
type = explod
trigger1 = !numexplod(3)
anim = 6100
ID = 3
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
ownpal = 1
removeongethit = 1

[State 6010, Bat 4 - Circling]
type = explod
trigger1 = !numexplod(4)
anim = 6100
ID = 4
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
ownpal = 1
removeongethit = 1

[State 6010, Bat 1 - Top Left]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = (-24 + 8 * cos(gametime / 16.0)) * root, const(size.xscale), (-92 + 2 * sin(gametime / 16.0)) * root, const(size.yscale)
sprpriority = 2

[State 6010, Bat 1 - Top Left]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = (16 - 6 * cos(gametime / 16.0)) * root, const(size.xscale), (-96 + 2 * sin(gametime / 16.0)) * root, const(size.yscale)
sprpriority = 0

[State 6010, Bat 3 - Circling]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = (-5 + 25 * cos(gametime / 5.0)) * root, const(size.xscale), (-50 + 35 * cos(gametime / 17.5)) * root, const(size.yscale)
sprpriority = ifelse(sin(gametime / 5.0) > 0, 2, 0)

[State 6010, Bat 4 - Circling]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = (-5 - 25 * cos(gametime / 5.0)) * root, const(size.xscale), (-50 - 35 * cos(gametime / 17.5)) * root, const(size.yscale)
sprpriority = ifelse(sin(gametime / 5.0) < 0, 2, 0)

[State 6010, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time < 15, 16 * (time + 1), 256), 256
ignorehitpause = 1

[State 6010, Pos]
type = bindtoroot
trigger1 = 1

[State 6010, Turn]
type = turn
trigger1 = facing != root, facing

[State 6010, Anim]
type = changeanim
trigger1 = anim != 6010 && root, anim = 20
value = 6010

[State 6010, Anim]
type = changeanim
trigger1 = anim != 6011 && root, anim = 21
value = 6011

[State 6010, Transition]
type = changestate
trigger1 = root, stateno = 0
trigger1 = root, anim = 2
value = 6011

[State 6010, End]
type = destroyself
trigger1 = root, stateno != 20
trigger2 = root, anim != [20, 21]
removeexplods = 1
recursive = 1


;----- Transition to standing -----
[Statedef 6011]
physics = N
velset = 0, 0
sprpriority = -1

[State 6011, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ifelse(time < 8, 256 - 32 * (time + 1), 0), 256
ignorehitpause = 1

[State 6011, Bat 1]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = -18 * root, const(size.xscale), -48 * root, const(size.yscale)
sprpriority = -1
anim = 6100

[State 6011, Bat 2]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = -22 * root, const(size.xscale), -40 * root, const(size.yscale)
sprpriority = -1
anim = 6100

[State 6011, Bat 3]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = -26 * root, const(size.xscale), -32 * root, const(size.yscale)
sprpriority = -1
anim = 6100

[State 6011, Bat 4]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = -30 * root, const(size.xscale), -24 * root, const(size.yscale)
sprpriority = -1
anim = 6100

[State 6011, Pos]
type = bindtoroot
trigger1 = 1

[State 6011, Turn]
type = turn
trigger1 = facing != root, facing

[State 6011, Anim]
type = changeanim
trigger1 = anim != 6011 && root, anim = 20
value = 6011

[State 6011, Anim]
type = changeanim
trigger1 = anim != 6011 && root, anim = 21
value = 6011

[State 6011, Back]
type = changestate
trigger1 = time
trigger1 = root, stateno = 20
value = 6010

[State 6011, End]
type = removeexplod
trigger1 = time >= 8
trigger2 = root, anim != 2

[State 6011, End]
type = destroyself
trigger1 = time >= 8


;========================<JETS>=============================
;----- Dash -----
[Statedef 6020]
physics = N
velset = 0, 0
anim = 6020
sprpriority = 2

[State 6020, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6020, Pos]
type = bindtoroot
trigger1 = 1

[State 6020, Turn]
type = turn
trigger1 = facing != root, facing

[State 6020, Sound]
type = playsnd
trigger1 = !time
value = 0, 110
channel = 0

[State 6020, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6020
trigger1 = root, anim = 100 || root, anim = 1900
value = 6020

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6021
trigger1 = root, anim = 105
value = 6021

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6022
trigger1 = root, anim = 110 || root, anim = 4010
value = 6022

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6023
trigger1 = root, anim = 115
value = 6023

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6025
trigger1 = root, anim = 3400 || root, anim = 4000 || root, anim = 4050
value = 6025

[State 6020, Fake Afterimage]
type = explod
trigger1 = 1
ID = 6020
anim = anim
animfreeze = 1
animelem = animelemno(0)
postype = p1
vel = root, vel x, root, vel y
friction = 0.5, 0.5
sprpriority = sprpriority - 1
removetime = 8
trans = addalpha
alpha = 128, 256
scale = const(size.xscale), const(size.yscale)
interpolation.time = 8
interpolation.alpha = 0, 256
ownpal = 0

[State 6020, End]
type = changestate
trigger1 = root, stateno != [100, 105]
trigger1 = root, stateno != 1900 && root, stateno != 1930
trigger1 = root, stateno != [3400, 3401]
trigger1 = root, stateno != [4000, 4010]
trigger1 = root, stateno != [4050, 4051]
trigger2 = root, anim != 100 && root, anim != 105 && root, anim != 110 && root, anim != 115
trigger2 = root, anim != 1900 && root, anim != 3400 && (root, anim != [4000, 4010]) && (root, anim != [4050, 4051])
trigger3 = root, anim = 1900
trigger3 = root, animelemtime(2) < 0 || root, animelemtime(9) >= 0
trigger4 = root, anim = 4010
trigger4 = root, animelemtime(56) < 0
trigger5 = root, movetype = H
value = 6029


;----- VECTOR DRAIN -----
[Statedef 6026]
physics = N
velset = 0, 0
anim = 6026
sprpriority = 3

[State 6026, Pos]
type = bindtoroot
trigger1 = 1

[State 6026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6026, Fake Afterimage]
type = explod
trigger1 = 1
ID = 6020
anim = anim
animfreeze = 1
animelem = animelemno(0)
postype = p1
sprpriority = sprpriority - 1
removetime = 8
trans = addalpha
alpha = 128, 256
scale = const(size.xscale), const(size.yscale)
interpolation.time = 8
interpolation.alpha = 0, 256
ownpal = 0

[State 6026, Anim]
type = changeanim
trigger1 = anim != 6026
trigger1 = root, animelemtime(7) < 0
value = 6026

[State 6026, Anim]
type = changeanim
trigger1 = anim != 6027
trigger1 = root, animelemtime(7) >= 0
value = 6027

[State 6026, Sound]
type = playsnd
trigger1 = !time
value = 0, 110
channel = 0

[State 6026, Sound]
type = playsnd
trigger1 = anim = 6027
trigger1 = animelem = 1
value = 0, 110
channel = 0
freqmul = 1.2

[State 6026, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 6026, End]
type = changestate
trigger1 = root, stateno != 1310
value = 6029


;----- VALKYRIE TURN -----
[Statedef 6028]
physics = N
velset = 0, 0
anim = 6028
sprpriority = 3

[State 6028, Pos]
type = bindtoroot
trigger1 = !time
trigger2 = root, stateno = 3400
pos = (-40 * root, const(size.xscale)), -70

[State 6028, Anim]
type = changeanim
trigger1 = root, stateno = 3400
value = 6028
elem = 1

[State 6028, Sound]
type = playsnd
trigger1 = !time
value = 5, 14
channel = 0

[State 6028, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 6028, Scale]
type = angledraw
trigger1 = 1
scale = (backedgedist + 160) / 32.0, ifelse(time < 7, (0.125 * (time + 1)), 1)

[State 6028, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6028, End]
type = changestate
trigger1 = !animtime
value = 6029


;----- FADE OUT -----
[Statedef 6029]
physics = N
velset = 0, 0
anim = 9999
sprpriority = 3

[State 6029, Clear ID]
type = modifyplayer
trigger1 = !time
helperID = 0

[State 6029, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 6029, End]
type = destroyself
trigger1 = !numexplod


;========================<BATS>=============================
;----- LOSE by TIME -----
[Statedef 6104]
physics = N
anim = 6100
sprpriority = 2
ctrl = 0

[State 6104, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6104, Vel]
type = velset
trigger1 = 1
x = ifelse(var(0) = 1, -0.25, 0.25)
y = -0.5

[State 6104, End]
type = destroyself
trigger1 = root, stateno != 170


;----- LIE DOWN -----
[Statedef 6105]
physics = N
anim = 6101
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 6105, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6105, Turn]
type = turn
triggerall = var(0) = 2
triggerall = facing != root, facing
trigger1 = root, stateno = [5110, 5120]

[State 6105, Turn]
type = turn
triggerall = root, stateno = 5230 && root, animelemtime(2) < 0
trigger1 = root, vel x < 0
trigger1 = facing = root, facing
trigger2 = root, vel x > 0
trigger2 = facing != root, facing

[State 6105, Wake Up Binding]
type = null
triggerall = root, stateno = 5120
trigger1 = var(0) = 1
trigger1 = (fvar(1) := (fvar(1) - 1.47)) + (fvar(2) := (fvar(2) - 1.16))
trigger2 = var(0) = 2
trigger2 = (fvar(1) := (fvar(1) + 5)) + (fvar(2) := (fvar(2) - 6.33))
trigger3 = var(0) = 3
trigger3 = (fvar(1) := (fvar(1) + 0.4)) + (fvar(2) := (fvar(2) - 0.5))
trigger4 = var(0) = 4
trigger4 = (fvar(1) := (fvar(1) - 0.6)) + (fvar(2) := (fvar(2) - 0.73))

[State 6105, Retreat Binding]
type = null
triggerall = root, stateno = 5230
trigger1 = var(0) = 1
trigger1 = (fvar(1) := (fvar(1) + 1.0)) + (fvar(2) := (fvar(2) - 1.5))
trigger2 = var(0) = 2
trigger2 = (fvar(1) := (fvar(1) + 0.5)) + (fvar(2) := (fvar(2) - 5.5))
trigger3 = var(0) = 3
trigger3 = (fvar(1) := (fvar(1) - 1.0)) + (fvar(2) := (fvar(2) - 2.2))
trigger4 = var(0) = 4
trigger4 = (fvar(1) := (fvar(1) - 2.5)) + (fvar(2) := (fvar(2) - 2.0))

[State 6105, Var X]
type = varset
trigger1 = root, stateno != 5120 && root, stateno != 5230
trigger2 = root, stateno = 5230 && root, animelemtime(2) < 0
fvar(1) = 0

[State 6105, Var Y]
type = varset
trigger1 = root, stateno != 5120 && root, stateno != 5230
trigger2 = root, stateno = 5230 && root, animelemtime(2) < 0
fvar(2) = 0

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ((2 + fvar(1)) * root, const(size.xscale)), -16 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = (-64 + fvar(1) * root, const(size.xscale)), -18 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 3
pos = (-24 + fvar(1) * root, const(size.xscale)), -36 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 4
pos = (-7 + fvar(1) * root, const(size.xscale)), -43 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 1
pos = ((-48 + fvar(1)) * root, const(size.xscale)), -2 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 2
pos = ((-20 + fvar(1)) * root, const(size.xscale)), -14 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 3
pos = ((-14 + fvar(1)) * root, const(size.xscale)), -2 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 4
pos = ((16 + fvar(1)) * root, const(size.xscale)), -14 + fvar(2)

[State 6105, Hide]
type = assertspecial
triggerall = var(0) = 2
trigger1 = root, stateno = 5120 && root, animelemtime(5) >= 0
trigger2 = root, stateno = 5230 && root, animelemtime(6) >= 0
flag = invisible

[State 6105, End]
type = destroyself
trigger1 = root, stateno != 5110 && root, stateno != 5115 && root, stateno != 5150
trigger1 = root, stateno != 5120 && root, stateno != 5230


;----- INTRO 1 -----
[Statedef 6106]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 6106, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6100, varx]
type = varset
trigger1 = root, animelemtime(13) < 0
fvar(1) = 0

[State 6100, vary]
type = varset
trigger1 = root, animelemtime(13) < 0
fvar(2) = 0

[State 6106, varx]
type = varadd
trigger1 = var(0) = 1 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.16

[State 6106, vary]
type = varadd
trigger1 = var(0) = 1 && (root, animelemtime(13) = [0, 25])
fvar(2) = -2.04

[State 6106, varx]
type = varadd
trigger1 = var(0) = 2 && (root, animelemtime(13) = [0, 25])
fvar(1) = -1.08

[State 6106, vary]
type = varadd
trigger1 = var(0) = 2 && (root, animelemtime(13) = [0, 25])
fvar(2) = -1.4

[State 6106, varx]
type = varadd
trigger1 = var(0) = 3 && (root, animelemtime(13) = [0, 25])
fvar(1) = -1.32

[State 6106, vary]
type = varadd
trigger1 = var(0) = 3 && (root, animelemtime(13) = [0, 25])
fvar(2) = -3.7

[State 6106, varx]
type = varadd
trigger1 = var(0) = 4 && (root, animelemtime(13) = [0, 25])
fvar(1) = 0.84

[State 6106, vary]
type = varadd
trigger1 = var(0) = 4 && (root, animelemtime(13) = [0, 25])
fvar(2) = -1.72

[State 6106, varx]
type = varadd
trigger1 = var(0) = 5 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.04

[State 6106, vary]
type = varadd
trigger1 = var(0) = 5 && (root, animelemtime(13) = [0, 25])
fvar(2) = -0.8

[State 6106, varx]
type = varadd
trigger1 = var(0) = 6 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.56

[State 6106, vary]
type = varadd
trigger1 = var(0) = 6 && (root, animelemtime(13) = [0, 25])
fvar(2) = -3.4

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ((-23 + fvar(1)) * root, const(size.xscale)), 1 + fvar(2)

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = ((0 + fvar(1)) * root, const(size.xscale)), 4 + fvar(2)

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 3
pos = ((23 + fvar(1)) * root, const(size.xscale)), 1 + fvar(2)

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 4
pos = ((-19 + fvar(1)) * root, const(size.xscale)), -7 + fvar(2)

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 5
pos = ((0 + fvar(1)) * root, const(size.xscale)), -10 + fvar(2)

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 6
pos = ((19 + fvar(1)) * root, const(size.xscale)), -7 + fvar(2)

[State 6106, Sprite Priority]
type = sprpriority
trigger1 = 1
value = ifelse(var(0) >= 4, -1, 1)
pos = 2 + fvar(1), -16 + fvar(2)

[State 6106, End]
type = destroyself
trigger1 = root, stateno != 191 || root, movetype = H
trigger2 = root, stateno = 191 && root, animelemtime(14) >= 0


;----- WIN 1 -----
[Statedef 6107]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 6107, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6107, Vel]
type = velset
trigger1 = !time
trigger1 = (var(0) % 2) = 1
x = ifelse(var(0) = 1, -0.75, ifelse(var(0) = 3, -1.25, ifelse(var(0) = 5, -1.25, -0.5)))
y = ifelse(var(0) = 1, -0.75, ifelse(var(0) = 3, -1, ifelse(var(0) = 5, -1.25, -1.5)))

[State 6107, Vel]
type = velset
trigger1 = !time
trigger1 = !(var(0) % 2)
x = ifelse(var(0) = 2, -0.75, ifelse(var(0) = 4, -1.25, ifelse(var(0) = 6, -1.25, -0.5)))
y = ifelse(var(0) = 2, 0.75, ifelse(var(0) = 4, 1, ifelse(var(0) = 6, 1.25, 1.5)))

[State 6107, Accel]
type = veladd
trigger1 = root, animelemtime(2) < 0 && (var(0) % 2) = 1 && vel y < 1.5
y = 0.033

[State 6107, Accel]
type = veladd
trigger1 = root, animelemtime(2) < 0 && !(var(0) % 2) && vel y > -1.5
y = -0.033

[State 6107, Vel]
type = velset
trigger1 = root, animelemtime(2) >= 0
trigger1 = (var(0) = 1 || var(0) = 2 || var(0) = 5 || var(0) = 6)
x = cos(time / 20.0)
y = -cos((time + 10) / 20.0)

[State 6107, Vel]
type = velset
trigger1 = root, animelemtime(2) >= 0
trigger1 = (var(0) = 3 || var(0) = 4 || var(0) = 7 || var(0) = 8)
x = -cos(time / 20.0)
y = cos((time + 10) / 20.0)

[State 6107, Vel]
type = velmul
trigger1 = vel y > 0
trigger1 = pos y > -10
y = 0.8

[State 6107, End]
type = destroyself
trigger1 = root, stateno != 181 || root, movetype = H


;----- POWER CHARGE -----
[Statedef 6108]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0

[State 6108, Bat 1 - Top Left]
type = explod
trigger1 = !numexplod(1)
anim = 6100
ID = 1
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
removeongethit = 1

[State 6108, Bat 2 - Top Right]
type = explod
trigger1 = !numexplod(2)
anim = 6100
ID = 2
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 0
removetime = -1
removeongethit = 1

[State 6108, Bat 3 - Circling]
type = explod
trigger1 = !numexplod(3)
anim = 6100
ID = 3
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
removeongethit = 1

[State 6108, Bat 4 - Circling]
type = explod
trigger1 = !numexplod(4)
anim = 6100
ID = 4
postype = p1
pos = 0, 0
scale = (root, const(size.xscale)), (root, const(size.yscale))
sprpriority = 2
removetime = -1
removeongethit = 1

[State 6108, Bat 1 - Circling]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = (-5 + 25 * cos((gametime + 0) / 24.0 * pi)) * root, const(size.xscale), (-50 + 35 * sin((gametime + 0) / 60.0 * pi)) * root, const(size.yscale)
sprpriority = ifelse(sin((gametime + 0) / 24.0 * pi) > 0, 2, 0)

[State 6108, Bat 2 - Circling]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = (-5 + 25 * cos((gametime + 12) / 24.0 * pi)) * root, const(size.xscale), (-50 + 35 * sin((gametime + 12) / 60.0 * pi)) * root, const(size.yscale)
sprpriority = ifelse(sin((gametime + 12) / 24.0 * pi) > 0, 2, 0)

[State 6108, Bat 3 - Circling]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = (-5 + 25 * cos((gametime + 24) / 24.0 * pi)) * root, const(size.xscale), (-50 + 35 * sin((gametime + 24) / 60.0 * pi)) * root, const(size.yscale)
sprpriority = ifelse(sin((gametime + 24) / 24.0 * pi) > 0, 2, 0)

[State 6108, Bat 4 - Circling]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = (-5 + 25 * cos((gametime + 36) / 24.0 * pi)) * root, const(size.xscale), (-50 + 35 * sin((gametime + 36) / 60.0 * pi)) * root, const(size.yscale)
sprpriority = ifelse(sin((gametime + 36) / 24.0 * pi) > 0, 2, 0)

[State 6108, Pos]
type = bindtoroot
trigger1 = 1

[State 6108, Turn]
type = turn
trigger1 = facing != root, facing

[State 6108, End]
type = removeexplod
trigger1 = root, stateno != 740 || root, anim != 740 || root, movetype = H

[State 6108, End]
type = destroyself
trigger1 = root, stateno != 740 || root, anim != 740 || root, movetype = H


;----- WIN COSTUME -----
[Statedef 6109]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 6109, ID]
type = varset
trigger1 = !time
trigger1 = (ishelper(6101) || ishelper(6102) || ishelper(6103) || ishelper(6104))
var(0) = ifelse(ishelper(6101), 1, ifelse(ishelper(6102), 2, ifelse(ishelper(6103), 3, 4)))

[State 6109, Vel]
type = velset
trigger1 = !time
x = ifelse(var(0) = 1, -0.33, ifelse(var(0) = 2, -0.66, ifelse(var(0) = 3, -1, -0.5)))
y = ifelse(var(0) = 1, -0.4, ifelse(var(0) = 2, -0.1, ifelse(var(0) = 3, 0.2, 0.5)))

[State 6109, Accel]
type = veladd
trigger1 = time < 60 && vel y > -1
y = -0.025

[State 6109, Vel]
type = velset
trigger1 = time >= 60 && (var(0) = 1 || var(0) = 3)
x = cos(time / 20.0)
y = -cos((time + 10) / 20.0)

[State 6109, Vel]
type = velset
trigger1 = time >= 60 && (var(0) = 2 || var(0) = 4)
x = -cos(time / 20.0)
y = cos((time + 10) / 20.0)

[State 6109, Vel]
type = velmul
trigger1 = vel y > 0
trigger1 = pos y > -10
y = 0.8

[State 6109, End]
type = destroyself
trigger1 = root, stateno != 189 || root, movetype = H


;----- RETURN TO MORRIGAN -----
[Statedef 6110]
physics = N
anim = 6100
velset = -7.5 + (random / 66.7), -7.5 + (random / 66.7)
sprpriority = 1
ctrl = 0

[State 6110, Sound]
type = playsnd
trigger1 = time = 8
value = 6, (random < 500)
volumescale = cond(numhelper(6110) > 1, ifelse(helper(6110, 0), ID != ID, 50, 100), 100)

[State 6110, Vel]
type = velset
trigger1 = !time
trigger1 = prevstateno = 825
x = -1
y = -5

[State 6110, Vel]
type = velset
trigger1 = !time
trigger1 = playerIDexist(parent, ID)
trigger1 = (parent, stateno = [1005, 1055])
x = 3 + (random / 500.0)
y = -3 + (random / 167.0)

[State 6110, Vel]
type = velset
trigger1 = !time
trigger1 = playerIDexist(parent, ID)
trigger1 = (parent, stateno = [3005, 3007])
x = 5 + (random / 333.0)
y = -5 + (random / 100.0)

[State 6110, Accel]
type = veladd
trigger1 = time > 10
trigger1 = rootdist x >= 0
trigger1 = vel x < ifelse(rootdist x < 25, 2.5, 5)
x = ifelse((rootdist y = [0, 160]), 0.5, 0.25)

[State 6110, Accel]
type = veladd
trigger1 = time > 10
trigger1 = rootdist x < 0
trigger1 = vel x > ifelse(rootdist x > -25, -2.5, -5)
x = ifelse((rootdist y = [0, 160]), -0.5, -0.25)

[State 6110, Accel]
type = veladd
triggerall = time > 10
trigger1 = root, statetype != C
trigger1 = rootdist y >= 65
trigger1 = vel y < ifelse((rootdist y < 80 && rootdist y > 40), 2.5, 5)
trigger2 = root, statetype = C
trigger2 = rootdist y >= 25
trigger2 = vel y < ifelse((rootdist y < 50 && rootdist y > 0), 2.5, 5)
y = ifelse((rootdist x = [-80, 80]), 0.5, 0.25)

[State 6110, Accel]
type = veladd
triggerall = time > 10
trigger1 = root, statetype != C
trigger1 = rootdist y < 65
trigger1 = vel y > ifelse((rootdist y < 80 && rootdist y > 40), -2.5, -5)
trigger2 = root, statetype = C
trigger2 = rootdist y < 25
trigger2 = vel y > ifelse((rootdist y < 50 && rootdist y > 0), -2.5, -5)
y = ifelse((rootdist x = [-80, 80]), -0.5, -0.25)

[State 6110, Vel]
type = velset
trigger1 = vel y > 0
trigger1 = pos y > -5
y = 0

[State 6110, Turn]
type = turn
trigger1 = vel x < 0

[State 6110, End]
type = destroyself
triggerall = root, alive
triggerall = rootdist x = [-10, 10]
trigger1 = root, statetype != C
trigger1 = rootdist y = [25, 75]
trigger2 = root, statetype = C
trigger2 = rootdist y = [0, 50]


;----- VIUDA NEGRA -----
[Statedef 6111]
physics = N
anim = 6100
velset = 0, 0
ctrl = 0

[State 6111, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6111, Bind]
type = posset
trigger1 = var(0) = 1
x = (p2, pos x) -31 * facing
y = (p2, pos y) -85

[State 6111, Bind]
type = posset
trigger1 = var(0) = 2
x = (p2, pos x) -32 * facing
y = (p2, pos y) -40

[State 6111, Bind]
type = posset
trigger1 = var(0) = 3
x = (p2, pos x) -18 * facing
y = (p2, pos y) -42

[State 6111, Bind]
type = posset
trigger1 = var(0) = 4
x = (p2, pos x) -5 * facing
y = (p2, pos y) -43

[State 6111, Bind]
type = posset
trigger1 = var(0) = 5
x = (p2, pos x) + 1 * facing
y = (p2, pos y) -45

[State 6111, Sprite Priority]
type = sprpriority
trigger1 = 1
value = ifelse(var(0) = 4, -1, 2)

[State 6111, End]
type = changestate
trigger1 = !numenemy || roundstate >= 2
trigger2 = numenemy
trigger2 = enemy, stateno = 1942 && enemy, anim != 1942
value = 6110


;========================<DUSTS>=============================
;----- Jump -----
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9999

[State 7100, Pos]
type = posset
trigger1 = !time
y = 0

[State 7100, Bind]
type = bindtoparent
trigger1 = time

[State 7100, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 7101
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, End]
type = destroyself
trigger1 = !numexplod
trigger2 = time >= 60


;----- Dash -----
[Statedef 7104]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 7104, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 7104, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 7104
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

[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 - (16 * (time -3)), 256

[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 - (16 * (time -6)), 256

[State 7104, End]
type = removeexplod
trigger1 = time >= 22

[State 7104, End]
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


;========================<FLAME PARTICLES>=============================
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

[State 8150, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 8150, Sound]
type = playsnd
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), hitshakeover
value = 5, 1
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


;====================<POWER CHARGE>====================
;----- MAIN FX -----
[Statedef 7240]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7240, Bind]
type = bindtoroot
trigger1 = root, stateno = 740
trigger1 = root, anim = 740
pos = -4, 0

[State 7240, Sound]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Sound]
type = playsnd
trigger1 = 1
value = 7, 8
channel = 1
lowpriority = 1
volumescale = ifelse(time < 180, (time * 0.277), 50)

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7240)
ID = 7240
anim = 7240
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7240, Dust]
type = explod
trigger1 = !(time % 6)
anim = 7105
sprpriority = -3
postype = p1
pos = 0, -pos y
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time <= 60
ID = 7240
scale = 0.5, 0.125

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time = [61, 119]
ID = 7240
scale = 0.5, 0.1 + ((root, time - 60) * 0.00625)

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time >= 120
ID = 7240
scale = 0.5, 0.5

[State 7240, End]
type = stopsnd
trigger1 = root, stateno != 740
trigger2 = root, movetype = H
channel = 0

[State 7240, End]
type = stopsnd
trigger1 = root, stateno != 740
trigger2 = root, movetype = H
channel = 1

[State 7240, End]
type = removeexplod
trigger1 = root, stateno != 740
trigger2 = root, movetype = H

[State 7240, End]
type = destroyself
trigger1 = root, stateno != 740
trigger2 = root, movetype = H


;----- Particles -----
[Statedef 7241]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7241, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-160 + (random / 3.125)), ceil(160 - (random / 3.125))

[State 7241, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 7241
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x - 2) / 32.0), ((rootdist y - 72) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7241, End]
type = removeexplod
trigger1 = root, stateno != 740

[State 7241, End]
type = destroyself
trigger1 = root, stateno != 740


;====================<ZERO COUNTER PAUSE>====================
[Statedef 7250]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7250
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 7250, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 7250, Lightning]
type = explod
trigger1 = !time
anim = 7251
ID = 2
sprpriority = -2
postype = p1
pos = 0, -pos y
supermovetime = -1
ownpal = 1

[State 7250, End]
type = destroyself
trigger1 = time >= 16


;========================<DARK FORCE PAUSE=============================
[Statedef 7270]
type = A
physics = N
movetype = I
anim = 7270
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 7270, End]
type = destroyself
trigger1 = time >= 26
removeexplods = 1

[State 7270, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7270, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 0
mul = 48, 16, 0

[State 7270, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 7270, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7270, Scale]
type = angledraw
trigger1 = time < 8
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)

[State 7270, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5

[State 7270, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256

[State 7270, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7270, Lines]
type = explod
trigger1 = !time
anim = 7271
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
removetime = 16
supermovetime = -1

[State 7270, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 7270, Circle]
type = explod
trigger1 = time = 16
anim = 7272
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 7270, Bat]
type = explod
trigger1 = !time
anim = 7273
ID = 3
sprpriority = -5
postype = left
pos = 160, 120
bindtime = -1
ownpal = 1

[State 7270, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256


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
value = 7, 7
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
trigger1 = root, map(superfinish) = 3000 || root, map(superfinish) = 3050
var(0) = 2

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3100
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3401
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4050 || root, map(superfinish) = 4060
var(0) = 5

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3300
var(0) = 6

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4000 || root, map(superfinish) = 4010
var(0) = 7

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4100
var(0) = 8

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
anim = 8609 + var(0)
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
anim = 8609 + var(0)
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

[State 8600, Stop Shake]
type = envshake
trigger1 = time <= 24
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
physics = N
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
