; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<ANKIHOU OBJECTS>=============================
[Statedef 1005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 2

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

[State 1005, Random Item]
type = changeanim
triggerall = !time
triggerall = !prevstateno
trigger1 = root, map(ankihotype) <= 2
value = 1005 + (random % 7)

[State 1005, Shuriken]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, map(ankihotype) = 3
value = 1015

[State 1005, Statue or Panda]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, map(ankihotype) = 4
value = ifelse(random < 500, 1016, 1017)

[State 1005, Dizzy Item]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, map(ankihotype) = 5
value = ifelse(random < 333, 1020, ifelse(random < 500, 1021, 1023))

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

[State 1005, Accel]
type = veladd
trigger1 = 1
y = ifelse(map(strength) = 2, 0.40, ifelse(map(strength) = 1, 0.35, 0.30))
;0.1875 0.21875 0.25

[State 1005, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 0.77, ifelse(map(strength) = 1, 6.66, 6.15))
y = ifelse(map(strength) = 2, -14.00, ifelse(map(strength) = 1, -7.50, -3.50))

[State 1005, Pos Fix]
type = posadd
trigger1 = !time
trigger1 = !prevstateno
x = -vel x
y = -vel y

[State 1005, Spin Snd]
type = playsnd
trigger1 = !(time % 12)
trigger1 = anim = 1005 || anim = 1006 || anim = 1011 || anim = 1015
value = 1, 7
;channel = 1

[State 1005, Spin Snd]
type = playsnd
trigger1 = !(time % 12)
trigger1 = anim = 1007 || anim = 1009 || anim = 1010 || anim = 1016
trigger2 = !(time % 9)
trigger2 = anim = 1008
value = 1, 1
;channel = 1

[State 1005, Spin Snd]
type = playsnd
trigger1 = !(time % 12)
trigger1 = anim = 1017 || anim = 1020 || anim = 1021 || anim = 1023
value = 1, 2
;channel = 1

[State 1005, Hit Normal]
type = hitdef
trigger1 = anim < 1020
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, SP
damage = 60, 15
dizzypoints = 100
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 10
sparkno = -1 + 0 * (map(sparkno) := ifelse(anim = 1006 || anim = 1007 || anim = 1009 || anim = 1011 || anim = 1015, 8023, 8013))
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3.0, -4.5
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1005, Hit Stun]
type = hitdef
trigger1 = anim >= 1020
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, SP
damage = 60, 15
dizzypoints = 1000
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 10
sparkno = -1 + 0 * (map(sparkno) := ifelse(anim = 1006 || anim = 1007 || anim = 1009 || anim = 1011 || anim = 1015, 8023, 8013))
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := 0
;0, 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.5, -3
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.5, -3
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1020
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1005, Hit Overhead]
type = modifyhitdef
trigger1 = map(strength) = 2
guardflag = HA
ground.type = High

[State 1005, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
trigger1 = anim = 1005 || anim = 1008 || anim = 1010 || anim = 1016
value = 2, ifelse(numtarget, 2, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
trigger1 = anim = 1020 || anim = 1023
value = 2, ifelse(numtarget, 3, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
trigger1 = anim = 1017
value = 2, ifelse(numtarget, 5, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
trigger1 = anim = 1021
value = 2, ifelse(numtarget, 6, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
trigger1 = anim = 1006 || anim = 1007 || anim = 1009 || anim = 1011 || anim = 1015
value = 2, ifelse(numtarget, 8, 0)
channel = 2
persistent = 0
ignorehitpause = 1

[State 1005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80

[State 1005, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= -16
value = 1006


;--- CONTACT ---
[Statedef 1006]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = 1

[State 1006, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1006, Anim]
type = changeanim
trigger1 = anim = 1021
value = 1022
persistent = 0

[State 1006, Ikemen Dizzy Disabled]
redirectID = target, ID
type = dizzyset
trigger1 = time <= 1
trigger1 = anim >= 1020; dizzying item
trigger1 = numtarget
trigger1 = roundstate = 2
trigger1 = target, dizzy = 0
trigger1 = target, movetype = H
trigger1 = target, gethitvar(guarded) = 0
trigger1 = target, gethitvar(dizzypoints) = 0; wait 1 frame to see if gethitvar had any effect
trigger1 = target, dizzypoints >= target, dizzypointsmax
trigger1 = target, const(default.enable.dizzy)
trigger1 = target, map(_iksys_dizzyLimit) = 0
value = 1
persistent = 0

[State 1006, Accel]
type = veladd
trigger1 = 1
y = 0.50

[State 1006, Vel Hit Floor]
type = velset
trigger1 = !time
trigger1 = pos y >= -16
x = 0.33 * vel x
y = -5.0

[State 1006, Vel Hit Something]
type = velset
trigger1 = !time
trigger1 = pos y < -16
x = ifelse(map(strength) = 2, 1.0, -0.5) * vel x
y = -5.0

[State 1006, Pos]
type = posset
trigger1 = !time
trigger1 = pos y >= -16
y = -16

[State 1006, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (8 * time), (8 * time)

[State 1006, End]
type = destroyself
trigger1 = time >= 32
trigger2 = vel y > 0
trigger2 = pos y >= -10
trigger2 = time || !numtarget


;========================<ANKIHOU SPIKED BALL>=============================
[Statedef 1055]
type = C
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1055, 1056)
ignorehitpause = 1

[State 1055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

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

[State 1055, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1055, Vel]
type = velset
trigger1 = 1
x = 5
y = 0

[State 1055, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 10, 0)
channel = 2
ignorehitpause = 1

[State 1055, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 6, 0)
value = 1

[State 1055, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 6, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = S, SP
damage = 34, 9
dizzypoints = 50
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = L
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := -16
;16, -16
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3, -3
down.hittime = 20
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
forcestand = 1

[State 1055, Hit Knockdown]
type = hitdef
trigger1 = time >= ifelse(numtarget, 6, 0)
trigger1 = var(2) = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = S, SP
damage = 34, 9
dizzypoints = 50
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = L
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := -16
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -3, -3
down.hittime = 20
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.695
forcestand = 1

[State 1055, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(2) < 3, 1055, 1056)
ignorehitpause = 1

[State 1055, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1056]
type = A
physics = N
movetype = I
anim = 1056
velset = -0.33 * vel x, 0
ctrl = 0
sprpriority = 1

[State 1056, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1056, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (8 * time), (8 * time)

[State 1056, End]
type = destroyself
trigger1 = time >= 32
value = 1057


;========================<SENPUUBU CLAW>=============================
[Statedef 1105]
type = A
physics = N
movetype = A
anim = 1105
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1105, No Reversals]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 5000
ignorehitpause = 1

[State 1105, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1105, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = ifelse((parent, stateno = [1120, 1121]), 3, (parent, map(strength)))

; Damage Scaling was here

[State 1105, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1101 || root, stateno = 1121
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1105, Bind]
type = bindtoparent
trigger1 = 1
pos = (2 * parent, const(size.xscale)), -65
ignorehitpause = 1

[State 1105, Mashing and EX Speed]
type = changeanim
triggerall = animelemtime(animelemno(0)) >= 1
trigger1 = map(strength) = 3
trigger2 = !AIlevel
trigger2 = root, command = "x" || root, command = "y" || root, command = "z"
trigger3 = AIlevel
trigger3 = random < 333
value = 1105
elem = ifelse(animelemtime(12) >= 0, 1, animelemno(0) + 1)

[State 1105, Damage]
type = mapadd
trigger1 = movecontact = 1 || movereversed = 1
map = "clawhits"
value = 1

[State 1105, Damage]
type = mapset
trigger1 = 1
map = "clawdamage"
value = ifelse(map(strength) = 3, (70.0 / (map(clawhits) + 1)), (60.0 / (map(clawhits) + 1)))
ignorehitpause = 1

[State 1105, Hit]
type = hitdef
trigger1 = map(strength) <= 2
trigger1 = animelemtime(animelemno(0)) = 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
priority = 4, Hit
attr = A, SA
damage = ceil(map(clawdamage)), ceil(map(clawdamage) * 0.25)
dizzypoints = 25
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -70) * (map(sparkx.max) := 70), map(sparky) := (p2dist y + p2, const(size.mid.pos.y))
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(p2dist x > 0, -10, 10), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = ifelse(p2dist x > 0, -5, 5), -5
down.velocity = 0, 0
getpower = ifelse(movehit, 25, 100), ifelse(moveguarded, 25, 50)
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1105, Hit EX]
type = hitdef
trigger1 = map(strength) = 3
trigger1 = animelemtime(animelemno(0)) = 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
priority = 4, Hit
attr = A, SA
damage = ceil(map(clawdamage)), ceil(map(clawdamage) * 0.25)
dizzypoints = 25
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -70) * (map(sparkx.max) := 70), map(sparky) := (p2dist y + p2, const(size.mid.pos.y))
;postype = p2; pos = (target, const(size.ground.front) -10), target, const(size.mid.pos.y)
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(p2dist x > 0, -10, 10), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = ifelse(p2dist x > 0, -5, 5), -5
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1


;----- Root velocity calculator -----
[State 1105, Pos X]
type = varset
trigger1 = 1
fvar(1) = ifelse((!time && !prevstateno), (root, pos x) + camerapos x, fvar(2))

[State 1105, Pos X]
type = varset
trigger1 = 1
fvar(2) = ifelse((!time && !prevstateno), (root, pos x) + camerapos x, fvar(3))

[State 1105, Pos X]
type = varset
trigger1 = 1
fvar(3) = ifelse((!time && !prevstateno), (root, pos x) + camerapos x, fvar(4))

[State 1105, Pos X]
type = varset
trigger1 = 1
fvar(4) = (root, pos x) + camerapos x

[State 1105, Vel X]
type = varset
trigger1 = 1
fvar(5) = (fvar(4) - fvar(1)) / 8.0 * facing

[State 1105, Pos Y]
type = varset
trigger1 = 1
fvar(10) = ifelse((!time && !prevstateno), (root, pos y) + camerapos y, fvar(10))

[State 1105, Pos Y]
type = varset
trigger1 = 1
fvar(10) = ifelse((!time && !prevstateno), (root, pos y) + camerapos y, fvar(13))

[State 1105, Pos Y]
type = varset
trigger1 = 1
fvar(13) = ifelse((!time && !prevstateno), (root, pos y) + camerapos y, fvar(14))

[State 1105, Pos Y]
type = varset
trigger1 = 1
fvar(14) = (root, pos y) + camerapos y

[State 1105, Vel Y]
type = varset
trigger1 = 1
fvar(15) = (fvar(14) - fvar(10)) / 8.0

[State 1105, End]
type = destroyself
trigger1 = map(strength) <= 2
trigger1 = parent, stateno != 1101 || parent, anim != 1101
trigger2 = map(strength) = 3
trigger2 = parent, stateno != 1121 || parent, anim != 1101


;========================<REITOU BLADE>=============================
[Statedef 1205]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1205, No Reversals]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 5000
ignorehitpause = 1

[State 1205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1205, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

[State 1205, Anim]
type = changeanim
trigger1 = anim != [1205, 1226]
value = ifelse(map(strength) = 3, 1225, 1205) + 1 * (facing = -1)

[State 1205, Sprite Priority]
type = sprpriority
trigger1 = 1
value = -1
ignorehitpause = 1

; Damage Scaling was here

[State 1205, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1200
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1205, Dust]
type = explod
trigger1 = !time
anim = 7105
sprpriority = -5
postype = p1
pos = 0, -3
scale = 0.33, 0.33
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1205, Hit]
type = hitdef
trigger1 = map(strength) != 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = S, SA
damage = 90, 23
dizzypoints = 100
guard.dist = const(size.proj.attack.dist)
animtype = Up
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := (p2dist y + p2, const(size.mid.pos.y))
hitsound = -1; root
guardsound = -1; root
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.0, -9.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -3.0, -9.0
down.velocity = 0, 0
getpower = ifelse(p2movetype = H, 25, 100), ifelse(p2movetype = H, 25, 50)
givepower = 40, 40
p1sprpriority = sprpriority
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00

[State 1205, Hit EX]
type = hitdef
trigger1 = map(strength) = 3
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, SA
damage = 110, 28
dizzypoints = 100
guard.dist = const(size.proj.attack.dist)
animtype = Up
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 4
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := (p2dist y + p2, const(size.mid.pos.y))
;postype = p2; pos = (target, const(size.ground.front) -10), target, const(size.mid.pos.y)
hitsound = -1; root
guardsound = -1; root
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.5, -9.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.5, -9.0
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
p1sprpriority = sprpriority
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00

[State 1205, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 9, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 1205, GuardSound Metal]
redirectID = root, ID
type = playsnd
trigger1 = moveguarded = 1
value = 5, 21
channel = 3
abspan = ceil(pos x)
freqmul = 0.9 + (random / 5000.0)
persistent = 0
ignorehitpause = 1

[State 1205, Idle]
type = statetypeset
trigger1 = animelem = 11
movetype = I

[State 1205, End]
type = destroyself
trigger1 = !animtime


;========================<SOUND WAVE>=============================
[Statedef 1305]
type = U
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 1305, Type]
type = statetypeset
trigger1 = !time
trigger1 = !prevstateno
statetype = S

[State 1305, Type]
type = statetypeset
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, statetype = A
statetype = A

[State 1305, Reflector]
type = null; helper
trigger1 = !time
trigger1 = !prevstateno
helpertype = normal
stateno = 1310
ID = 1310
name = "Projectile Reflector"
postype = p1
pos = 0, 0
ownpal = 1

[State 1305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, HP
ignorehitpause = 1

[State 1305, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1307
ignorehitpause = 1

[State 1305, Anim]
type = changeanim
trigger1 = anim != 1305
value = 1305

[State 1305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1305, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

[State 1305, Type]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "airversion"
value = ifelse(root, statetype = A, 1, 0)

; Damage Scaling was here

[State 1305, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1300
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1305, Time Var]
type = mapadd
trigger1 = time
map = "fireballtime"
value = 1

[State 1305, Vel]
type = velset
trigger1 = 1
x = 1.50
y = 0

[State 1305, Particles]
type = explod
trigger1 = !(time % 6)
anim = 1306
sprpriority = sprpriority
postype = p1
vel = (vel x / 2.0), 0
scale = 0.5, 0.5

[State 1305, Particles]
type = explod
trigger1 = 1
vel = -0.5 + (random < 500), 0
accel = 0, 0.05
anim = 1308
sprpriority = 3
postype = p1
pos = -15, 0
random = 30, 60
scale = 0.25, 0.25
ignorehitpause = 1

[State 1305, Type]
type = statetypeset
trigger1 = movecontact
movetype = I

[State 1305, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 1305, Hit]
type = hitdef
trigger1 = !map(projcontact)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1305
priority = 4, Hit
attr = S, SP
damage = 90, 23
dizzypoints = 150
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3, -3
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
;p2stateno = 1317
; P2stateno is a workaround that prevents the ReversalDef and this Hitdef from connecting in the same frame
; Alternatively this Hitdef could use a different attribute. However Lei-Lei needs to use this one
; The fact this reflector is itself also a fireball complicates things a bit

[State 1305, Air Version]; Only the attribute is different
type = modifyhitdef
trigger1 = map(airversion)
attr = A, SP

[State 1305, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1305, End]
type = changestate
trigger1 = map(fireballtime) >= ifelse(map(strength) = 2, 32, ifelse(map(strength) = 1, 26, 20))
value = 1307

[State 1305, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


;----- Disappear -----
[Statedef 1307]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 9999
ctrl = 0
sprpriority = 1

[State 1307, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1307, End]
type = destroyself
trigger1 = !numexplod
trigger2 = time >= 16


;----- Projectile Reflector -----
; This state is currently unused. Reflection moved to the soundwave itself
[Statedef 1310]
type = S
movetype = A
anim = 1310
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1310, Parent ID]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "parentID"
value = parent, ID

[State 1310, Strength]
type = mapset
map = "exversion"
trigger1 = !time
trigger1 = parent, ishelper(1335)
value = 1

[State 1310, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AP
time = -1
slot = 0
stateno = 1311
ignorehitpause = 1

[State 1310, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT
time = -1
slot = 1
stateno = 1313
ignorehitpause = 1

[State 1310, HB]
type = hitby
trigger1 = !map(exversion)
attr = SCA, NP, SP
slot = 0
time = -1
ignorehitpause = 1

[State 1310, HB]
type = hitby
trigger1 = map(exversion)
attr = SCA, NP, SP, HP
slot = 0
time = -1
ignorehitpause = 1

; Helper reflection now handled in the ZSS file

;[State 1310, Reversal]
;type = reversaldef
;trigger1 = 1
;ID = 1310
;attr =
;reversal.attr = SCA, NP, SP
;pausetime = 0, 0
;sparkno = -1
;hitsound = s2, 0
;hitsound.channel = 2
;p2clsncheck = clsn1
;p2clsnrequire = clsn2; avoids fireballs that do not normally trade
;p2stateno = 1317
;nochainID = 1310
; Using P2stateno has the drawback of making the helper state reset itself
; Reflection could also be handled directly in this state with RedirectID instead of P2stateno
; That might actually work better because one could decide which helpers to reflect without even changing their state number
; However that way the helper can still hit Lei-Lei before flipping

;[State 1310, EX Reversal]; adds HP attribute
;type = modifyreversaldef
;trigger1 = map(exversion)
;reversal.attr = SCA, NP, SP, HP

;[State 1310, Reflect]
;redirectID = movehitvar(ID)
;type = selfstate
;trigger1 = movehitvar(frame)
;trigger1 = playerIDexist(movehitvar(ID))
;trigger1 = playerID(movehitvar(ID)), movetype = A
;trigger1 = playerID(movehitvar(ID)), hitdefattr = SCA, AP
;trigger1 = playerID(movehitvar(ID)), vel x || playerID(movehitvar(ID)), vel y; Not stationary
;value = 1317
;readplayerID = ID

[State 1310, Bind]
type = bindtoparent
trigger1 = playerIDexist(map(parentID))
pos = 0, 0

[State 1310, End]
type = destroyself
trigger1 = movecontact || movereversed; after reflecting
trigger2 = !playerIDexist(map(parentID))
trigger3 = playerIDexist(map(parentID))
trigger3 = playerID(map(parentID)), ishelper(1305) = 0
trigger3 = playerID(map(parentID)), ishelper(1335) = 0
trigger4 = playerIDexist(map(parentID))
trigger4 = playerID(map(parentID)), stateno != 1305
trigger4 = playerID(map(parentID)), stateno != 1335
trigger5 = time >= 180
ignorehitpause = 1


;----- Hit by Projectile -----
[Statedef 1311]
type = A
movetype = H
ctrl = 0
anim = 1310
velset = 0, 0

[State 1311, Cancelled]
type = destroyself
trigger1 = root, time <= 1
trigger1 = root, movetype = H

[State 1311, Wait then Fire]
type = changestate
trigger1 = hitshakeover
trigger2 = inguarddist = 0
trigger2 = root, inguarddist = 0
trigger2 = parent, movecontact != 1
trigger3 = time >= 16
value = 1312

[State 1311, Protect Root]
redirectID = root, ID
type = nothitby
trigger1 = !map(exversion)
value = , NP, SP
time = 1

[State 1311, Protect Root]
redirectID = root, ID
type = nothitby
trigger1 = map(exversion)
value = , NP, SP, HP
time = 1


;----- Fire Back Projectile -----
[Statedef 1312]
type = A
physics = N
movetype = I
anim = 1310
ctrl = 0
velset = 0, 0

[State 1312, Reflected]
type = helper
trigger1 = !time
helpertype = normal; projectile
stateno = 1315
ID = 1315
name = "Reflected Projectile"
postype = p1
pos = 32, 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1312, End]
type = destroyself
trigger1 = 1


;----- Nullified -----
[Statedef 1313]
type = A
movetype = I
anim = 9999
ctrl = 0

[State 1313, End]
type = destroyself
trigger1 = 1


;--- Helper Reflection ---
[Statedef 1317]
type = U
physics = U
movetype = H
ctrl = 0

[State 1317, Not a Helper]
type = selfstate
trigger1 = !ishelper
value = ifelse(statetype = S, 5000, ifelse(statetype = C, 5010, 5020))

[State 1317, Stationary]
type = selfstate
trigger1 = vel x = 0
trigger1 = vel y = 0
value = prevstateno

; The original helper is cloned then destroyed
; This allows any character to fight the reflected fireball with another fireball of the same type
; This could be redirected to the root instead to mitigate "has no parent" errors
[State 1317, Clone Helper]
type = helper
trigger1 = !time
name = "Reflected Helper Clone"; Helper ID not used
stateno = prevstateno
postype = p1
pos = -32, 0; arbitrary offset
facing = -1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1317, Change Teamside]
redirectID = lastplayerID
type = modifyplayer
trigger1 = !time
trigger1 = teamside != 0
trigger1 = playerID(lastplayerID), stateno = prevstateno; just in case
teamside = ifelse(teamside = 2, 1, 2)

[State 1317, End]
type = destroyself
trigger1 = 1


;========================<EX SOUND WAVE>=============================
[Statedef 1335]
type = U
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 1335, Type]
type = statetypeset
trigger1 = !time
trigger1 = !prevstateno
statetype = S

[State 1335, Type]
type = statetypeset
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, statetype = A
statetype = A

[State 1335, Reflector]
type = null; helper
trigger1 = !time
trigger1 = !prevstateno
helpertype = normal
stateno = 1310
ID = 1310
name = "Projectile Reflector"
postype = p1
pos = 0, 0
ownpal = 1

[State 1335, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1335, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1335
ignorehitpause = 1

[State 1335, Type]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "airversion"
value = ifelse(root, statetype = A, 1, 0)

[State 1335, Anim]
type = changeanim
trigger1 = anim != 1305
value = 1305

[State 1335, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1335, Hitvar]
type = varadd
trigger1 = !time
var(2) = 1

; Damage Scaling was here

[State 1335, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1330
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1335, Time Var]
type = mapadd
trigger1 = time
map = "fireballtime"
value = 1

[State 1335, Vel]
type = velset
trigger1 = 1
x = 1.25

[State 1305, Particles]
type = explod
trigger1 = !(time % 6)
anim = 1306
sprpriority = sprpriority
postype = p1
vel = (vel x / 2.0), 0
scale = 0.5, 0.5

[State 1335, Particles]
type = explod
trigger1 = 1
vel = -0.5 + (random < 500), 0
accel = 0, 0.05
anim = 1308
sprpriority = 3
postype = p1
pos = -15, 0
random = 30, 60
scale = 0.25, 0.25
ignorehitpause = 1

[State 1335, Type]
type = statetypeset
trigger1 = movecontact
trigger1 = var(2) >= 4
movetype = I

[State 1335, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 1335, Hit]
type = hitdef
trigger1 = time >= (prevstateno = 1335) * 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + var(2)))
priority = 4, Hit
attr = S, SP
damage = 40, 10
dizzypoints = 67
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4, -4
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
;p2stateno = 1317; workaround. See state 1305

[State 1305, Air Version]; Only the attribute is different
type = modifyhitdef
trigger1 = map(airversion)
attr = A, SP

[State 1335, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(2) >= 3, 1307, 1335)
ignorehitpause = 1

[State 1335, End]
type = changestate
trigger1 = map(fireballtime) >= 72
value = 1307
ignorehitpause = 1

[State 1335, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


;========================<REFLECTED PROJECTILE>=============================
[Statedef 1315]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1315, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1316
ignorehitpause = 1

[State 1315, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1315, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1315, Anim]
type = changeanim
trigger1 = anim != 1315
value = 1315

[State 1315, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = parent, map(strength)

[State 1315, Projcontact]
type = mapset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
map = "projcontact"
value = 1
ignorehitpause = 1

[State 1315, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 3, 7, ifelse(map(strength) = 2, 6, ifelse(map(strength) = 1, 5, 4)))

[State 1315, particles]
type = explod
trigger1 = !(time % 2)
vel = -0.5 + (random < 500), 0
accel = 0, 0.05
anim = 1308
sprpriority = 3
postype = p1
pos = -30, 0
random = 10, 30
scale = 0.25, 0.25
ignorehitpause = 1

[State 1315, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 1315, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
priority = 4, Hit
attr = S, SP
damage = 80, 20
dizzypoints = 100
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 10
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4, -2
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
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1315, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1315, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1316
ignorehitpause = 1

[State 1315, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1316]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
anim = 1316
sprpriority = 3

[State 1316, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1316, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1316, End]
type = destroyself
trigger1 = !animtime


;========================<CHUUKADAN>=============================
;----- THROWN -----
[Statedef 3004]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3004, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = root, map(strength)

[State 3004, Colorvar]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "redbomb"
value = map(strength) = 2

[State 3004, Anim]
type = changeanim
trigger1 = !time
value = ifelse(map(redbomb), 3035, 3005)

[State 3004, Vel]
type = velset
trigger1 = !time
x = ifelse(map(strength) = 2, 4.5, ifelse(map(strength) = 1, 3.0, 1.5))
y = ifelse(map(strength) = 2, -6, ifelse(map(strength) = 1, -7.5, -9))

[State 3004, Ticking]
type = playsnd
trigger1 = ID = (helper(3005), ID)
value = 5, 13
channel = 5
lowpriority = 1

[State 3004, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, NP, SP, AT
stateno = 3015
slot = 0
ignorehitpause = 1

[State 3004, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, HP
stateno = 3020
slot = 1
ignorehitpause = 1

[State 3004, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AA, AP
ignorehitpause = 1

[State 3004, Timer Var]
type = varset
trigger1 = !time
var(0) = ifelse(map(strength) = 2, 40, ifelse(map(strength) = 1, 180, 300))

[State 3004, Timer Var]
type = varadd
trigger1 = time
var(0) = -1
ignorehitpause = 1

[State 3004, Timer]
type = helper
trigger1 = !time
trigger1 = !map(redbomb)
helpertype = normal
stateno = 3090
ID = 3090
name = "Timer"
postype = p1
ownpal = 1

[State 3004, Hit by Lei-Lei]
type = changestate
triggerall = time > 0
triggerall = root, movetype = A
trigger1 = root, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, root, ID, clsn1)
trigger2 = root, stateno = 1101 || root, stateno = 1121
trigger2 = (pos x - root, pos x) * (root, facing) = [-60, 60]
trigger2 = (pos y - root, pos y) = [-60, 60]
value = 3016

[State 3004, Hit by Chireitou]
type = changestate
triggerall = time > 0
triggerall = numhelper(1205) || numhelper(1225) || numhelper(3205)
trigger1 = numhelper(1205)
trigger1 = helper(1205), movetype = A
trigger1 = abs(pos x - (helper(1205), pos x)) < 33
trigger2 = numhelper(1225)
trigger2 = helper(1225), movetype = A
trigger2 = abs(pos x - (helper(1225), pos x)) < 33
trigger3 = numhelper(3204)
trigger3 = helper(3204), movetype = A
trigger3 = abs(pos x - (helper(3204), pos x)) < 33
value = 3016

[State 3004, Hit by Partner]
type = changestate
trigger1 = time > 0
trigger1 = numpartner
trigger1 = partner, movetype = A
trigger1 = partner, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, partner, ID, clsn1)
value = 3017

[State 3004, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 3004, Poing]
type = playsnd
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
value = 5, 7
channel = 0

[State 3004, Turn]
type = velmul
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
x = -1

[State 3004, bounce]
type = changestate
trigger1 = vel y >= 0
trigger1 = pos y >= -5
value = 3010

[State 3004, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- IDLE -----
[Statedef 3005]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3005, Timer Var]
type = varadd
trigger1 = time
var(0) = -1
ignorehitpause = 1

[State 3005, Ticking]
type = playsnd
trigger1 = ID = (helper(3005), ID)
value = 5, 13
channel = 5
lowpriority = 1

[State 3005, Hit by Lei-Lei]
type = changestate
triggerall = time > 0
triggerall = root, movetype = A
trigger1 = root, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, root, ID, clsn1)
trigger2 = root, stateno = 1101 || root, stateno = 1121
trigger2 = (pos x - root, pos x) * (root, facing) = [-60, 60]
trigger2 = (pos y - root, pos y) = [-60, 60]
value = 3016

[State 3005, Hit by Chireitou]
type = changestate
triggerall = time > 0
triggerall = numhelper(1205) || numhelper(1225) || numhelper(3205)
trigger1 = numhelper(1205)
trigger1 = helper(1205), movetype = A
trigger1 = abs(pos x - (helper(1205), pos x)) < 33
trigger2 = numhelper(1225)
trigger2 = helper(1225), movetype = A
trigger2 = abs(pos x - (helper(1225), pos x)) < 33
trigger3 = numhelper(3204)
trigger3 = helper(3204), movetype = A
trigger3 = abs(pos x - (helper(3204), pos x)) < 33
value = 3016

[State 3005, Hit by partner]
type = changestate
trigger1 = time > 0
trigger1 = numpartner
trigger1 = partner, movetype = A
trigger1 = partner, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, partner, ID, clsn1)
value = 3017

[State 3005, Pos]
type = posset
trigger1 = 1
y = 0

[State 3005, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) >= 420 && anim != 3005
value = 3005

[State 3005, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [180, 419] && anim != 3006
value = 3006

[State 3005, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [1, 179] && anim != 3007
value = 3007

[State 3005, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) >= 120 && anim != 3035
value = 3035

[State 3005, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) = [1, 119] && anim != 3036
value = 3036

[State 3005, Poing]
type = playsnd
trigger1 = !time
value = 5, 7

[State 3005, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -10
postype = p1
ownpal = 1
scale = 0.33, 0.33

[State 3005, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- BOUNCING -----
[Statedef 3010]
type = S
physics = N
movetype = I
ctrl = 0
sprpriority = 3

[State 3010, Timer Var]
type = varadd
trigger1 = time
var(0) = -1
ignorehitpause = 1

[State 3010, Hit by Lei-Lei]
type = changestate
triggerall = time > 0
triggerall = root, movetype = A
trigger1 = root, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, root, ID, clsn1)
trigger2 = root, stateno = 1101 || root, stateno = 1121
trigger2 = (pos x - root, pos x) * (root, facing) = [-60, 60]
trigger2 = (pos y - root, pos y) = [-60, 60]
value = 3016

[State 3010, Hit by Chireitou]
type = changestate
triggerall = time > 0
triggerall = numhelper(1205) || numhelper(1225) || numhelper(3205)
trigger1 = numhelper(1205)
trigger1 = helper(1205), movetype = A
trigger1 = abs(pos x - (helper(1205), pos x)) < 33
trigger2 = numhelper(1225)
trigger2 = helper(1225), movetype = A
trigger2 = abs(pos x - (helper(1225), pos x)) < 33
trigger3 = numhelper(3204)
trigger3 = helper(3204), movetype = A
trigger3 = abs(pos x - (helper(3204), pos x)) < 33
value = 3016

[State 3010, Hit by partner]
type = changestate
trigger1 = time > 0
trigger1 = numpartner
trigger1 = partner, movetype = A
trigger1 = partner, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, partner, ID, clsn1)
value = 3017

[State 3010, xvar]
type = varset
trigger1 = !time
fvar(1) = vel x

[State 3010, yvar]
type = varset
trigger1 = !time
fvar(2) = vel y

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) >= 420 && anim != 3010 && time < 6
value = 3010

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) = [180, 419] && anim != 3011 && time < 6
value = 3011

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) = [1, 179] && anim != 3012 && time < 6
value = 3012

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = var(0) >= 120 && anim != 3040 && time < 6
value = 3040

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = var(0) = [1, 119] && anim != 3041 && time < 6
value = 3041

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) >= 420 && anim != 3005 && time >= 6
value = 3005

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) = [180, 419] && anim != 3006 && time >= 6
value = 3006

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = var(0) = [1, 179] && anim != 3007 && time >= 6
value = 3007

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = var(0) >= 120 && anim != 3035 && time >= 6
value = 3035

[State 3010, Anim]
type = changeanim
trigger1 = var(1) = 2
trigger1 = var(0) = [1, 119] && anim != 3036 && time >= 6
value = 3036

[State 3010, Vel]
type = velset
trigger1 = time < 6
x = 0
y = 0

[State 3010, Pos]
type = posset
trigger1 = time < 6
y = 0

[State 3010, Accel]
type = veladd
trigger1 = time >= 6
y = 0.5

[State 3010, Vel]
type = velset
trigger1 = time = 6
x = 0.5 * fvar(1)
y = -0.5 * fvar(2)

[State 3010, Poing]
type = playsnd
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
value = 5, 7
channel = 0

[State 3010, Turn]
type = velmul
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
x = -1

[State 3010, poing]
type = playsnd
trigger1 = !time
value = 5, 7
channel = 0

[State 3010, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -10
postype = p1
ownpal = 1
scale = 0.33, 0.33

[State 3010, land]
type = changestate
trigger1 = vel y >= 0
trigger1 = pos y >= -5 && time > 6
value = 3005

[State 3010, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- HIT by Enemy -----
[Statedef 3015]
type = A
physics = N
movetype = I
anim = ifelse(map(redbomb), 3045, 3015)
ctrl = 0
sprpriority = 3

[State 3015, Timer Var]
type = varadd
trigger1 = 1
var(0) = -1
ignorehitpause = 1

[State 3015, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x >= 0

[State 3015, Hitvel]
type = velset
trigger1 = !time
x = 5
y = -5

[State 3015, Hit by Lei-Lei]
type = changestate
triggerall = time > 0
triggerall = root, movetype = A
trigger1 = root, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, root, ID, clsn1)
trigger2 = root, stateno = 1101 || root, stateno = 1121
trigger2 = (pos x - root, pos x) * (root, facing) = [-60, 60]
trigger2 = (pos y - root, pos y) = [-60, 60]
value = 3016

[State 3015, Hit by Chireitou]
type = changestate
triggerall = time > 0
triggerall = numhelper(1205) || numhelper(1225) || numhelper(3205)
trigger1 = numhelper(1205)
trigger1 = helper(1205), movetype = A
trigger1 = abs(pos x - (helper(1205), pos x)) < 33
trigger2 = numhelper(1225)
trigger2 = helper(1225), movetype = A
trigger2 = abs(pos x - (helper(1225), pos x)) < 33
trigger3 = numhelper(3204)
trigger3 = helper(3204), movetype = A
trigger3 = abs(pos x - (helper(3204), pos x)) < 33
value = 3016

[State 3015, Hit by partner]
type = changestate
trigger1 = time > 0
trigger1 = numpartner
trigger1 = partner, movetype = A
trigger1 = partner, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, partner, ID, clsn1)
value = 3017

[State 3015, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) >= 420 && anim != 3005 && vel y >= 0
value = 3005

[State 3015, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [180, 419] && anim != 3006 && vel y >= 0
value = 3006

[State 3015, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [1, 179] && anim != 3007 && vel y >= 0
value = 3007

[State 3015, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) >= 120 && anim != 3035 && vel y >= 0
value = 3035

[State 3015, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) = [1, 119] && anim != 3036 && vel y >= 0
value = 3036

[State 3015, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 3015, Poing]
type = playsnd
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
value = 5, 7
channel = 0

[State 3015, Turn]
type = velmul
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
x = -1

[State 3015, bounce]
type = changestate
trigger1 = vel y >= 0
trigger1 = pos y >= -5
value = 3010

[State 3015, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- HIT by Lei-Lei -----
[Statedef 3016]
type = A
physics = N
movetype = I
anim = ifelse(map(redbomb), 3045, 3015)
ctrl = 0
sprpriority = 3

[State 3016, Timer Var]
type = varadd
trigger1 = time
var(0) = -1
ignorehitpause = 1

[State 3016, Turn]
type = turn
trigger1 = !time
trigger1 = rootdist x >= 0

[State 3016, Hitvel]
type = velset
trigger1 = !time
x = 5
y = -5

[State 3016, Hit by partner]
type = changestate
trigger1 = time > 0
trigger1 = numpartner
trigger1 = partner, movetype = A
trigger1 = partner, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, partner, ID, clsn1)
value = 3017

;[State 3016, Spark]
;in ZSS

[State 3016, Sound]
type = playsnd
trigger1 = !time
value = 2, ifelse((root, stateno = [3000, 4999]), 3, ifelse((root, stateno = [1000, 1999]), 2, 1))
channel = 2

[State 3016, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) >= 420 && anim != 3005 && vel y >= 0
value = 3005

[State 3016, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [180, 419] && anim != 3006 && vel y >= 0
value = 3006

[State 3016, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [1, 179] && anim != 3007 && vel y >= 0
value = 3007

[State 3016, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) >= 120 && anim != 3035 && vel y >= 0
value = 3035

[State 3016, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) = [1, 119] && anim != 3036 && vel y >= 0
value = 3036

[State 3016, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 3016, Poing]
type = playsnd
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
value = 5, 7
channel = 0

[State 3016, Turn]
type = velmul
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
x = -1

[State 3016, bounce]
type = changestate
trigger1 = vel y >= 0
trigger1 = pos y >= -5
value = 3010

[State 3016, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- HIT by Partner -----
[Statedef 3017]
type = A
physics = N
movetype = I
anim = ifelse(map(redbomb), 3045, 3015)
ctrl = 0
sprpriority = 3

[State 3017, Timer Var]
type = varadd
trigger1 = time
var(0) = -1
ignorehitpause = 1

[State 3017, Turn]
type = turn
trigger1 = !time
trigger1 = ((partner, pos x) -pos x) >= 0

[State 3017, Hitvel]
type = velset
trigger1 = !time
x = 5
y = -5

[State 3017, Hit by Lei-Lei]
type = changestate
triggerall = time > 0
triggerall = root, movetype = A
trigger1 = root, hitdefattr = SCA, AA
trigger1 = clsnoverlap(clsn2, root, ID, clsn1)
trigger2 = root, stateno = 1101 || root, stateno = 1121
trigger2 = (pos x - root, pos x) * (root, facing) = [-60, 60]
trigger2 = (pos y - root, pos y) = [-60, 60]
value = 3016

[State 3017, Hit by Chireitou]
type = changestate
triggerall = time > 0
triggerall = numhelper(1205) || numhelper(1225) || numhelper(3205)
trigger1 = numhelper(1205)
trigger1 = helper(1205), movetype = A
trigger1 = abs(pos x - (helper(1205), pos x)) < 33
trigger2 = numhelper(1225)
trigger2 = helper(1225), movetype = A
trigger2 = abs(pos x - (helper(1225), pos x)) < 33
trigger3 = numhelper(3204)
trigger3 = helper(3204), movetype = A
trigger3 = abs(pos x - (helper(3204), pos x)) < 33
value = 3016

[State 3017, Spark]
type = explod
trigger1 = !time
anim = F 0 + ifelse((partner, hitdefattr = SCA, HA), 3, ifelse((partner, hitdefattr = SCA, SA), 2, 1))
ontop = 1
postype = p1
pos = 10, -22
ownpal = 1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3017, Sound]
type = playsnd
trigger1 = !time
value = F 5, ifelse((partner, hitdefattr = SCA, HA), 2, ifelse((partner, hitdefattr = SCA, SA), 1, 0))

[State 3017, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) >= 420 && anim != 3005 && vel y >= 0
value = 3005

[State 3017, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [180, 419] && anim != 3006 && vel y >= 0
value = 3006

[State 3017, Anim]
type = changeanim
trigger1 = !map(redbomb)
trigger1 = var(0) = [1, 179] && anim != 3007 && vel y >= 0
value = 3007

[State 3017, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) >= 120 && anim != 3035 && vel y >= 0
value = 3035

[State 3017, Anim]
type = changeanim
trigger1 = map(redbomb)
trigger1 = var(0) = [1, 119] && anim != 3036 && vel y >= 0
value = 3036

[State 3017, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 3017, Poing]
type = playsnd
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
value = 5, 7
channel = 0

[State 3017, Turn]
type = velmul
trigger1 = vel x > 0 && frontedgedist <= 0
trigger2 = vel x < 0 && backedgedist <= 0
x = -1

[State 3017, bounce]
type = changestate
trigger1 = vel y >= 0
trigger1 = pos y >= -5
value = 3010

[State 3017, Detonate]
type = changestate
trigger1 = var(0) <= 0
trigger2 = root, stateno = 3002
trigger2 = root, animelemtime(3) >= 10
value = ifelse(roundstate = 2, 3020, 3030)


;----- EXPLODE -----
[Statedef 3020]
type = U
physics = N
movetype = A
anim = ifelse(map(redbomb), 3050, 3020)
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3020, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 8
channel = 5

[State 3020, Explosion]
type = helper
trigger1 = animelem = 5
helpertype = normal
ID = 3025
stateno = 3025
name = "Bomb explosion"
postype = p1
pos = 0, 0
ownpal = 1

[State 3020, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
freq = 180
ampl = 4

[State 3020, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -10
postype = p1
pos = 0, -pos y
ownpal = 1
scale = 2, 1

[State 3020, End]
type = destroyself
trigger1 = !animtime


;----- ROUND OVER -----
[Statedef 3030]
type = S
physics = N
movetype = I
anim = ifelse(map(redbomb), 3060, 3030)
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3030, Pos]
type = posset
trigger1 = 1
y = 0

[State 3030, End]
type = destroyself
trigger1 = roundstate = 2


;----- TIMER -----
[Statedef 3090]
type = A
physics = N
movetype = I
anim = 3090
ctrl = 0
sprpriority = 4

[State 3090, Parent]
type = varset
trigger1 = !time
sysvar(0) = parent, ID

[State 3090, End]
type = destroyself
trigger1 = !playerIDexist(sysvar(0))
trigger2 = playerID(sysvar(0)), stateno = 3020
trigger2 = playerID(sysvar(0)), animelemtime(5) >= 0

[State 3090, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3090, Anim]
type = changeanim
trigger1 = anim != (3090 + ceil(parent, var(0) / 60.0))
value = 3090 + ceil(parent, var(0) / 60.0)

[State 3090, Turn]
type = turn
trigger1 = facing != 1

[State 3090, Bind]
type = posset
trigger1 = 1
x = parent, pos x - 6
y = parent, pos y - 70


;========================<BOMB EXPLOSION>=============================
[Statedef 3025]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 3025, Strength]
type = mapset
trigger1 = !time
map = "strength"
value = parent, map(strength)

[State 3025, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3025
ignorehitpause = 1

[State 3025, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3025, Anim]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
value = 3025

; Damage Scaling was here

[State 3025, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3002
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3025, Afterimage]
type = afterimage
trigger1 = !time
trigger1 = !prevstateno
time = 999
timegap = 1
framegap = 1
length = 2
palmul = 0.5, 0.5, 0.5
palcontrast = 90, 0, 0
trans = add

[State 3025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 3, 0)
channel = 2
ignorehitpause = 1

[State 3025, Hit]
type = hitdef
trigger1 = !time
trigger1 = !prevstateno
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3025
priority = 4, Hit
attr = S, HP
damage = 220, 55
dizzypoints = 0
guardpoints = ifelse(map(strength) = 2, 100, ifelse(map(strength) = 1, 250, 500))
guard.dist = 320
animtype = Up
hitflag = MAFD
guardflag = M
affectteam = B
pausetime = 0, 6
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -70) * (map(sparkx.max) := 70), map(sparky) := ((p2dist y + p2, const(size.mid.pos.y)) / 2)
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -12
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(p2dist x < 0, 10.52, -10.52)
air.velocity = 0, -12
fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
;no envshake
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 60
p1sprpriority = sprpriority
yaccel = 0.4850
forcestand = 1

[State 3025, Burn]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3025)
trigger1 = target(3025), ishelper = 0
trigger1 = target(3025), hitfall
trigger1 = target(3025), stateno != 7697 && target(3025), selfanimexist(7697)
value = 7697
ID = 3025
ignorehitpause = 1

[State 3025, Flame Particles Enemy]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit && numtarget && numenemy
trigger1 = enemynear(0), movetype = H
trigger1 = enemynear(0), gethitvar(frame)
trigger1 = enemynear(0), gethitvar(ID) = ID
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles (enemy 0)"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3025, Flame Particles Enemy]
type = helper
trigger1 = !numhelper(8151)
trigger1 = movehit && numtarget && numenemy >= 2
trigger1 = enemynear(1), movetype = H
trigger1 = enemynear(1), gethitvar(frame)
trigger1 = enemynear(1), gethitvar(ID) = ID
helpertype = normal
stateno = 8150
ID = 8151
name = "Flame Particles (enemy 1)"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3025, Flame Particles Root]
type = helper
trigger1 = !numhelper(8152)
trigger1 = movehit && numtarget
trigger1 = root, movetype = H
trigger1 = root, gethitvar(frame)
trigger1 = root, gethitvar(ID) = ID
helpertype = normal
stateno = 8150
ID = 8152
name = "Flame Particles (Lei-Lei)"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3025, Flame Particles Partner]
type = helper
trigger1 = !numhelper(8153)
trigger1 = movehit && numtarget && numpartner
trigger1 = partner, gethitvar(chainID) = 3025
trigger1 = (partner, time = 0) && (partner, movetype = H)
helpertype = normal
stateno = 8150
ID = 8153
name = "Flame Particles (partner)"
postype = p2
ownpal = 1
ignorehitpause = 1

;Actually it's funnier if I don't
;Seems like Ikemen already accounts for it anyway
;[State 3025, Fix Combo]
;type = hitadd
;trigger1 = movehitvar(frame)
;trigger1 = root, movetype = H
;trigger1 = root, gethitvar(frame)
;trigger1 = root, gethitvar(ID) = ID
;value = -1
;persistent = 0

[State 3025, End]
type = changestate
trigger1 = !animtime
value = 3026


;----- Wait -----
[Statedef 3026]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 9999
ctrl = 0
sprpriority = 1

[State 3026, End]
type = destroyself
trigger1 = !numtarget(3025)
trigger2 = time >= 120


;========================<CHIREITOU BLADE DISPENSER>=============================
[Statedef 3204]
type = S
physics = N
movetype = A
ctrl = 0
anim = 9999

[State 3204, Vel]
type = velset
trigger1 = 1
x = 4.6 * (root, const(size.xscale))

[State 3204, Vel]
type = velset
trigger1 = time = [25, 36]
x = 0

[State 3204, Pos]
type = posset
trigger1 = 1
y = 0

[State 3204, Sound]
type = playsnd
trigger1 = time = 0 || time = 12 || time = 24 || time = 48 || time = 60 || time = 72
value = 5, 5
channel = 1

[State 3204, Blade]
type = helper
trigger1 = time = 0 || time = 12 || time = 24 || time = 48 || time = 60 || time = 72
helpertype = normal
stateno = 3205
ID = 3205
name = "Blade"
postype = p1
pos = 0, 0
size.xscale = const(size.xscale)
size.shadowoffset = -5
ownpal = 1

[State 3204, End]
type = changestate
trigger1 = time >= 90
value = 3209


;----- Wait -----
[Statedef 3209]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 9999
ctrl = 0
sprpriority = 1

[State 3209, End]
type = destroyself
trigger1 = !numhelper(3205)
trigger2 = time >= 40


;========================<CHIREITOU BLADE>=============================
[Statedef 3205]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3205 + 1 * (facing = -1)
velset = 0, 0
sprpriority = -1

[State 3205, Sprite Priority]
type = sprpriority
trigger1 = 1
value = -1
ignorehitpause = 1

[State 3205, No Reversals]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 5000
ignorehitpause = 1

[State 3205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3205, Pos]
type = posset
trigger1 = 1
y = 0

; Damage Scaling was here

[State 3205, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3200
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3205, Parent ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = playerIDexist(parent, ID)
trigger1 = parent, map(projcontact) := 1
ignorehitpause = 1

[State 3205, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 6)
attr = S, HA
damage = 45, 11
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 4
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := (p2dist y + p2, const(size.mid.pos.y))
;0, ceil(target, pos y) + (target, const(size.mid.pos.y))
hitsound = -1; root
guardsound = -1; root
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.75 * (root, const(size.xscale)), -4.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.75 * (root, const(size.xscale)), -4.00
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
p1sprpriority = sprpriority
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
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00

[State 3205, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 9, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3205, GuardSound Metal]
redirectID = root, ID
type = playsnd
trigger1 = moveguarded = 1
value = 5, 21
channel = 3
abspan = ceil(pos x)
freqmul = 0.9 + (random / 5000.0)
persistent = 0
ignorehitpause = 1

[State 3205, Idle]
type = statetypeset
trigger1 = animelem = 11
movetype = I

[State 3205, End]
type = destroyself
trigger1 = !animtime
trigger2 = frontedgedist < -80 || backedgedist < -80


;========================<SHOCKWAVE>=============================
[Statedef 3405]
type = C
physics = N
movetype = A
ctrl = 0
anim = 3405
velset = 0, 0

[State 3405, No Reversals]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AT
stateno = 5000
ignorehitpause = 1

[State 3405, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3405, Spark Properties]
type = null
trigger1 = 1 || map(sparkno) := -1

[State 3405, Hit]
type = hitdef
trigger1 = !time
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
priority = 4, Hit
attr = C, HA
damage = 0, 0
dizzypoints = 0
guard.dist = 320
animtype = Hard
hitflag = MFD
guardflag = M
pausetime = 0, 2
sparkno = -1 + 0 * (map(sparkno) := -1)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := -1)
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
air.type = Trip
air.velocity = 0, -8
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.695
forcestand = 1
kill = 0
numhits = 0

[State 3405, End]
type = destroyself
triggerall = time
trigger1 = root, movetype = H
trigger2 = time >= 90
trigger2 = !numhelper(3410)


;========================<TENRAIHA SPIKED BALL>=============================
[Statedef 3410]
type = A
physics = N
movetype = A
anim = 3410
ctrl = 0
velset = 0, 2
sprpriority = 2

[State 3410, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3410
ignorehitpause = 1

[State 3410, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 3410, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3400
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3410, Pos]
type = posset
trigger1 = !time
y = -ceil(screenpos y)

[State 3410, Accel]
type = veladd
trigger1 = !(vel y > 0 && (pos y > -vel y))
y = 0.5

[State 3410, Bounce]
type = posfreeze
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1

[State 3410, Bounce]
type = posset
trigger1 = vel y > 0
trigger1 = pos y > -vel y
y = 0

[State 3410, Bounce]
type = playsnd
trigger1 = anim = 3410
trigger1 = vel y > 4
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5, 10
channel = 1
volumescale = ifelse(map(hasbounced), 50, 75)

[State 3410, Bounce]
type = explod
trigger1 = anim = 3410
trigger1 = vel y > 4
trigger1 = vel y > 0
trigger1 = pos y > -vel y
anim = 7102
ID = 7102
postype = p1
pos = 0, 0
scale = ifelse(map(hasbounced), 0.25, 0.33), ifelse(map(hasbounced), 0.25, 0.33)
sprpriority = -2
ownpal = 1

[State 3410, Bounce]
type = velset
trigger1 = !map(hasbounced)
trigger1 = vel y > 0
trigger1 = pos y > -vel y
trigger1 = map(hasbounced) := 1
x = 1.5 + (random / 333.3)
y = -0.5 * vel y

[State 3410, Bounce]
type = velmul
trigger1 = map(hasbounced)
trigger1 = vel y > 0
trigger1 = pos y > -vel y
x = 0.75
y = -0.75

[State 3410, Vel]
type = velmul
trigger1 = movecontact
x = ifelse(p2dist x >= 0, -1, 1) * (0.75 + random / 2000.0)
y = ifelse(vel y > 0 && p2dist y > 0, -0.5, 0.75)
persistent = 0

[State 3410, Hit]
type = hitdef
trigger1 = !movecontact
trigger1 = !map(hasbounced)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = A, HP
damage = 25, 6
dizzypoints = 0
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := -16
hitsound = -1; root
guardsound = -1; root
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = 0, -5
down.velocity = 0, 0
down.hittime = 18
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 3410, Hit]
type = hitdef
trigger1 = !movecontact
trigger1 = map(hasbounced)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, HP
damage = 25, 6
dizzypoints = 0
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := -16
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x > 0, -10.52, 10.52), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = ifelse(p2dist x > 0, -10.52, 10.52)
air.velocity = ifelse(p2dist x > 0, -3.0, 3.0), -5
down.velocity = 0, 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1; can mash
yaccel = 0.4850
forcestand = 1

[State 3410, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 3, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3410, Anim]
type = changeanim
triggerall = anim = 3410
trigger1 = time >= 90
trigger2 = movecontact
trigger2 = abs(vel x) < 1 && abs(vel y) < 1
value = 3411
elem = animelemno(0)

[State 3410, Fade Out]
type = trans
trigger1 = anim = 3411
trans = addalpha
alpha = ceil(256 - 16 * (animelemtime(1))), ceil(16 * animelemtime(1))

[State 3410, Idle]
type = statetypeset
trigger1 = root, movetype = H
trigger2 = movecontact || movereversed
movetype = I

[State 3410, End]
type = destroyself
triggerall = anim = 3411
trigger1 = !animtime
trigger2 = animelemtime(1) >= 16


;========================<BOWLING BALL>=============================
[Statedef 3510]
type = C
physics = N
movetype = I
velset = 12, 0
anim = 3510
sprpriority = 3

[State 3510, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3510, Pos]
type = posset
trigger1 = root, numtarget(3500)
x = root, target(3500), pos x

[State 3510, Hide]
type = assertspecial
trigger1 = root, numtarget(3500)
trigger1 = root, target(3500), selfanimexist(7688)
flag = invisible
flag2 = noshadow

[State 3510, Dust]
type = explod
trigger1 = !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -10, -ceil(pos y)
scale = 0.5, 0.5

[State 3510, End]
type = destroyself
trigger1 = root, numtarget(3500) = 0
trigger2 = root, numtarget(3500)
trigger2 = root, target(3500), stateno != 3507
trigger3 = frontedgedist < -60
trigger4 = backedgedist < -60
trigger5 = time >= 180


;========================<BOWLING PIN>=============================
[Statedef 3511]
physics = N
velset = 0, 0
anim = 3511
sprpriority = 2

[State 3511, Dan]
type = changeanim
trigger1 = !time
trigger1 = random < 100
trigger1 = ishelper(351101)
value = 3512

[State 3511, Offset]
type = offset
trigger1 = 1
y = ifelse((anim = 3512), -27, -24) + ifelse(time < 16, -32 + 2 * time, 0)

[State 3511, Fade In]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 16 * time, 256 - 16 * time

[State 3511, End]
type = changestate
triggerall = time >= 16
trigger1 = root, numtarget(3500) = 0
trigger2 = root, numtarget(3500)
trigger2 = root, target(3500), stateno = 3507
trigger2 = abs(root, target(3500), pos x - pos x) <= 32
value = 3512

[State 3511, End]
type = changestate
trigger1 = time >= 16
trigger1 = root, stateno != 3501
value = 3513


;----- Strike -----
[Statedef 3512]
physics = N
velset = -5 -(random % 5), -20
sprpriority = 3

[State 3512, Angle]
type = angleadd
trigger1 = 1
value = 15

[State 3512, Angle]
type = angledraw
trigger1 = 1

[State 3512, Fade Out]
type = trans
trigger1 = time >= 60
trans = addalpha
alpha = ceil(256 -4.25 * (time -60)), ceil(4.25 * (time -60))

[State 3512, Vel]
type = velmul
trigger1 = vel y > 0
trigger1 = pos y >= -24
x = 0.75
y = -0.75

[State 3512, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = !time
value = 2, 6
channel = 2
abspan = pos x

[State 3501, Strike Sound]
type = playsnd
trigger1 = !time
trigger1 = ishelper(351110)
value = 5, 18
channel = 5

;[State 3512, Spark]
;in ZSS

[State 3512, Vel]
type = velmul
trigger1 = vel x < 0 && backedgedist <= 12
trigger2 = vel x > 0 && frontedgedist <= 12
x = -1

[State 3512, Accel]
type = veladd
trigger1 = 1
y = 0.75

[State 3512, End]
type = destroyself
trigger1 = time >= 120


[Statedef 3513]
physics = N
velset = 0, 0
sprpriority = 3

[State 3513, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -4.25 * time), ceil(4.25 * time)

[State 3513, End]
type = destroyself
trigger1 = time >= 60


;========================<RED DUST>=============================
[Statedef 3406]
physics = N
anim = 9999

[State 3406, Dust]
type = explod
trigger1 = !time
anim = 8522
ID = 3406
sprpriority = -5
postype = p1
removetime = 16

[State 3406, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3406
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.05 + (0.01 * time) * const(size.yscale)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 3406, End]
type = removeexplod
trigger1 = time >= 16

[State 3406, End]
type = destroyself
trigger1 = !numexplod


;========================<RED FLAMES>=============================
[Statedef 8150]
type = A
velset = 0, 0
anim = 9999

[State 8150, Player]
type = mapset
trigger1 = !time
trigger1 = ishelper(8150)
trigger1 = numenemy
map = "target"
value = enemynear(0), ID

[State 8150, Player]
type = mapset
trigger1 = !time
trigger1 = ishelper(8151)
trigger1 = numenemy >= 2
map = "target"
value = enemynear(1), ID

[State 8150, Player]
type = mapset
trigger1 = !time
trigger1 = ishelper(8152)
map = "target"
value = root, ID

[State 8150, Player]
type = mapset
trigger1 = !time
trigger1 = ishelper(8153)
trigger1 = numpartner
map = "target"
value = partner, ID

[State 8150, End]
type = destroyself
trigger1 = time >= 60
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
value = 5, 11
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
pos = -8, 0

[State 7240, Sound]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Sound]
type = playsnd
trigger1 = 1
value = 7, 7
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
pos = 0, -ceil(pos y)
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
vel = ((rootdist x -12) / 32.0), ((rootdist y -48) / 32.0)
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
pos = 0, -ceil(pos y)
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

[State 7270, Safety]
type = removeexplod
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
value = 7, 5
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
trigger1 = root, map(superfinish) = 3000
var(0) = 2

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3500
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3200
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3400
var(0) = 5

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


;========================<LIN-LIN>=============================
;----- WIN 3 -----
[Statedef 6010]
type = A
physics = N
anim = 6000
sprpriority = -1

[State 6010, Vel]
type = velset
trigger1 = !time
trigger1 = anim = 6000
x = 3
y = -12

[State 6010, Accel]
type = veladd
trigger1 = anim = 6000
y = 0.75

[State 6010, Anim]
type = changeanim
trigger1 = anim = 6000 && animelemtime(8) < 0
trigger1 = vel y > 0
trigger1 = pos y >= -70
value = 6000
elem = 8

[State 6010, Sound]
type = playsnd
trigger1 = anim = 6000 && animelemtime(8) = 5
value = 5, 9

[State 6010, Flash]
type = explod
trigger1 = anim = 6000 && animelemtime(8) = 5
anim = 6005
ID = 6005
ontop = 1
postype = p1
pos = 0, 0
scale = 0.5, 0.5
ownpal = 1

[State 6010, Anim]
type = changeanim
trigger1 = anim = 6000 && animelemtime(8) >= 10
value = 6010

[State 6010, Pos]
type = posset
trigger1 = anim = 6010
y = 0

[State 6010, Vel]
type = velset
trigger1 = anim = 6000 && animelemtime(8) >= 0
trigger2 = anim = 6010
x = 0
y = 0

[State 6010, Type]
type = statetypeset
trigger1 = anim = 6010
type = S
physics = S

[State 6010, Sound]
type = playsnd
trigger1 = anim = 6010 && animelem = 9
value = 6, 1

[State 6010, Afterimage]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 8
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.5, 0.5, 0.5
trans = add

[State 6010, Afterimage]
type = afterimagetime
trigger1 = anim = 6010
persistent = 0
time = 0


;----- INTRO 1 - STANDING -----
[Statedef 6015]
type = A
physics = N
anim = 6015
sprpriority = -1

[State 6015, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6015, Sound]
type = playsnd
trigger1 = anim = 6015 && animelem = 2
value = 6, 2
channel = 0

[State 6015, Vel]
type = velset
trigger1 = anim = 6001
x = 1.7
y = -12
persistent = 0

[State 6015, Pos]
type = posadd
trigger1 = !animtime
trigger1 = anim = 6015
y = -65

[State 6015, Accel]
type = veladd
trigger1 = anim = 6001
y = 0.75

[State 6015, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 6015
value = 6001

[State 6015, Sound]
type = playsnd
trigger1 = anim = 6015 && animelem = 6
value = 5, 9

[State 6015, Flash]
type = explod
trigger1 = anim = 6015 && animelem = 6
anim = 6005
ID = 6005
ontop = 1
postype = p1
pos = 0, -64
scale = 0.5, 0.5
ownpal = 1

[State 6015, Afterimage]
type = afterimage
trigger1 = anim = 6001
persistent = 0
time = 999
timegap = 1
framegap = 1
length = 8
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.5, 0.5, 0.5
trans = add

[State 6015, Sprite Priority]
type = sprpriority
trigger1 = anim = 6001
value = 1
ignorehitpause = 1

[State 6015, End]
type = destroyself
triggerall = anim = 6001
trigger1 = roundstate != [0, 1]
trigger2 = root, stateno = 191
trigger2 = root, animelemtime(5) >= 0


;----- INTRO 3 - COFFIN -----
[Statedef 6027]
type = A
physics = N
anim = 6027
velset = 0, 0
sprpriority = -1

[State 6027, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6027, Sound]
type = playsnd
trigger1 = anim = 6027 && animelem = 2
value = 6, 0

[State 6027, Vel]
type = velset
trigger1 = anim = 6001
x = 1.0
y = -12
persistent = 0

[State 6027, Pos]
type = posadd
trigger1 = !animtime
trigger1 = anim = 6027
y = -65

[State 6027, Accel]
type = veladd
trigger1 = anim = 6001
y = 0.75

[State 6027, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 6027
value = 6001

[State 6027, Sound]
type = playsnd
trigger1 = anim = 6027 && animelem = 6
value = 5, 9

[State 6027, Flash]
type = explod
trigger1 = anim = 6027 && animelem = 6
anim = 6005
ID = 6005
ontop = 1
postype = p1
pos = 0, -64
scale = 0.5, 0.5
ownpal = 1

[State 6027, Afterimage]
type = afterimage
trigger1 = anim = 6001
persistent = 0
time = 999
timegap = 1
framegap = 1
length = 8
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.5, 0.5, 0.5
trans = add

[State 6027, Sprite Priority]
type = sprpriority
trigger1 = anim = 6001
value = 1
ignorehitpause = 1

[State 6027, End]
type = destroyself
trigger1 = root, stateno = 193
trigger1 = root, animelemtime(5) >= 0
trigger2 = root, stateno != 193


;----- Dark Force Start -----
[Statedef 6040]
type = S
physics = N
anim = 6040
sprpriority = 2

[State 6040, Accel]
type = veladd
trigger1 = time > 0
trigger1 = animelemtime(7) < 0
y = 0.75

[State 6040, Vel]
type = velset
trigger1 = time = 1
x = ifelse(pos x > 0, -2.75, 2.75) * facing
y = -11

[State 6040, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 9

[State 6040, Flash]
type = explod
trigger1 = animelem = 7
anim = 6005
ID = 6005
ontop = 1
postype = p1
pos = 0, 0
scale = 0.5, 0.5
ownpal = 1

[State 6040, Vel]
type = velset
trigger1 = animelemtime(7) >= 0
x = 0
y = 0

[State 6040, Pos]
type = posset
trigger1 = animelem = 7
y = -64

[State 6040, Pos]
type = posset
trigger1 = animelemtime(8) >= 0
y = 0

[State 6044, Offset]
type = offset
trigger1 = animelemtime(8) >= 0
y = -8

[State 6040, Afterimage]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 8
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.5, 0.5, 0.5
trans = add

[State 6040, Afterimage]
type = afterimagetime
trigger1 = animelem = 8
time = 0

[State 6040, Turn]
type = turn
trigger1 = animelem = 8
trigger1 = rootdist x < 0

[State 6040, Sprite Priority]
type = sprpriority
trigger1 = animelem = 4
value = -4

[State 6040, Anim]
type = changestate
trigger1 = !animtime
value = 6041


;----- Dark Force Active -----
[Statedef 6041]
type = S
physics = N
anim = 6041
velset = 0, 0
sprpriority = -4

[State 6041, Anim Var]
type = varset
trigger1 = !time
var(0) = 0

[State 6041, Anim Var]
type = varset
trigger1 = !time
var(1) = 0

[State 6041, Anim Var]
type = varset
trigger1 = root, stateno = [4010, 4012]
trigger1 = root, prevstateno != 4240
trigger1 = var(0) := 1
trigger2 = root, stateno = 4020
trigger2 = var(0) := 2
trigger3 = root, stateno = 4040
trigger3 = var(0) := 3
trigger4 = root, stateno = [4200, 4225]
trigger4 = var(0) := 4
trigger5 = root, stateno = 4240
trigger5 = var(0) := 5
trigger6 = root, stateno = 4260
trigger6 = var(0) := 6
var(0) = var(0)

[State 6041, Anim Cycle]
type = changeanim
trigger1 = !animtime
trigger1 = root, time = 1
trigger1 = var(1) != var(0)
trigger1 = 1 || var(1) := var(0)
value = ifelse(anim = 6041, 6042, ifelse(anim = 6042, 6043, 6041))

[State 6041, Turn]
type = turn
trigger1 = animelem = 1
trigger1 = rootdist x < 0

[State 6041, Offset]
type = offset
trigger1 = 1
y = -8

[State 6041, Sound]
type = playsnd
trigger1 = !time
value = 6, 2
channel = 0

[State 6041, End]
type = changestate
trigger1 = root, stateno = 4510
value = 6044

[State 6041, KO]
type = changestate
trigger1 = !(root, alive)
trigger2 = !(root, map(darkforce))
value = 6045


;----- Dark Force Ends -----
[Statedef 6044]
type = S
physics = N
anim = 6044
velset = 0, 0
sprpriority = -4

[State 6044, Sound]
type = playsnd
trigger1 = animelem = 6
value = 5, 9

[State 6044, Flash]
type = explod
trigger1 = animelem = 6
anim = 6005
ID = 6005
ontop = 1
postype = p1
pos = 0, -64
scale = 0.5, 0.5
ownpal = 1

[State 6044, Pos]
type = posset
trigger1 = animelem = 10
y = -64

[State 6044, Pos]
type = velset
trigger1 = animelemtime(11) >= 0
x = -5
y = -1

[State 6044, Pos]
type = velset
trigger1 = rootdist y >= 80
y = 0

[State 6044, Pos]
type = offset
trigger1 = animelemtime(11) >= 0
y = ceil(4 * sin((time / 8.0 ) * pi))

[State 6044, Afterimage]
type = afterimage
trigger1 = animelem = 10
time = 999
timegap = 1
framegap = 1
length = 8
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 256, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.5, 0.5, 0.5
trans = add

[State 6044, Turn]
type = turn
trigger1 = rootdist x < 0
trigger1 = !time

[State 6044, Turn]
type = turn
trigger1 = rootdist x >= 0
trigger1 = animelem = 10

[State 6044, Anim]
type = destroyself
trigger1 = rootdist x >= 0
trigger1 = animelemtime(11) >= 0


;----- Dark Force Interrupted -----
[Statedef 6045]
type = S
physics = N
velset = 0, 0
sprpriority = -4

[State 6045, Pos]
type = offset
trigger1 = 1
y = -8

[State 6045, Fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (8 * time), (8 * time)

[State 6045, Anim]
type = destroyself
trigger1 = time >= 32


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
