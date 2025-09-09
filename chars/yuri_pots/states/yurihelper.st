; _______________________________
;| Yuri by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<KOUOU KEN>=============================
[Statedef 1005]
type = S
movetype = A
ctrl = 0
sprpriority = 3

[State 1005, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1006
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 1005, Anim]
type = changeanim
trigger1 = anim != 1005
value = 1005

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 5.00, ifelse(map(strength) = 1, 3.75, 2.50))
y = 0

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

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 70, 18
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, -7.4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.hittime = 120
air.velocity = -4.0, -7.4
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
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
trigger1 = !animtime
value = 1007
ignorehitpause = 1


;----- Hit -----
[Statedef 1006]
type = S
movetype = I
ctrl = 0
anim = 1006
velset = 0, 0
sprpriority = 3

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 1006, Scale]
type = angledraw
trigger1 = 1
scale = 0.75, 0.75

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime


;----- Miss -----
[Statedef 1007]
type = S
movetype = I
ctrl = 0
anim = 1007
velset = 0, 0
sprpriority = 3

[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1007, End]
type = destroyself
trigger1 = !animtime


;========================<EX KOUOU KEN>=============================
[Statedef 1025]
type = S
movetype = A
ctrl = 0
sprpriority = 3

[State 1025, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1006
ignorehitpause = 1

[State 1025, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1025, Anim]
type = changeanim
trigger1 = anim != 1025
value = 1025

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = 7.5
y = 0

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

[State 1025, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 90, 23
dizzypoints = 200 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, -7.4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.hittime = 120
air.velocity = -4.0, -7.4
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1025, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1025, End]
type = changestate
trigger1 = !animtime
value = 1007
ignorehitpause = 1


;========================<RAIOU KEN>=============================
[Statedef 1255]
type = A
movetype = A
ctrl = 0
sprpriority = 3

[State 1255, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1256
ignorehitpause = 1

[State 1255, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1255, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 1255, Anim]
type = changeanim
trigger1 = anim != 1255
value = 1255

[State 1255, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1255, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 6, ifelse(map(strength) = 1, 4.5, 3))
y = ifelse(map(strength) = 2, 6, ifelse(map(strength) = 1, 4.5, 3))

; Damage Scaling was here

[State 1255, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1250
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1255, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1255, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1255
attr = A, SP
hitflag = MAFD
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -5, -5
air.cornerpush.veloff = 0
down.hittime = 18
down.velocity = 0, 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1255, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1255, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1256
ignorehitpause = 1

[State 1255, End]
type = changestate
trigger1 = pos y > -vel y
value = 1257
ignorehitpause = 1

[State 1255, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1256]
type = A
movetype = I
anim = 1006
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1256, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 1256, Scale]
type = angledraw
trigger1 = 1
value = -45
scale = 0.75, 0.75

[State 1256, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1256, End]
type = destroyself
trigger1 = !animtime


;----- HIT FLOOR -----
[Statedef 1257]
type = C
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1257, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1256
ignorehitpause = 1

[State 1257, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 1257, Anim]
type = changeanim
trigger1 = anim != 1257
value = 1257

[State 1257, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1257, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno != 1257
value = 3, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1257, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno != 1257
anim = 8104
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.25, 0.25
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1257, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 1257, Pos]
type = posset
trigger1 = 1
y = 0

; Damage Scaling was here

[State 1257, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1250
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1257, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1257, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1257
attr = S, SP
hitflag = MAFD
guardflag = MA
priority = 4, Hit
damage = 40, 10
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := -46
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -5, -5
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
down.hittime = 18
down.velocity = 0, 0
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1257, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1257, End]
type = destroyself
trigger1 = !animtime


;========================<EX RAIOU KEN>=============================
[Statedef 1275]
type = A
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1
hitcountpersist = 1

[State 1275, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1256
ignorehitpause = 1

[State 1275, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1275, Anim]
type = changeanim
trigger1 = anim != 1255
value = 1255

[State 1275, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1275, Vel]
type = velset
trigger1 = 1
x = 4.5
y = 4.5

; Damage Scaling was here

[State 1275, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1270
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1275, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1275, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
persistent = 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1275
attr = A, SP
hitflag = MAFD
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 8
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -5, -5
air.cornerpush.veloff = 0
down.hittime = 18
down.velocity = 0, 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

;[State 1275, Bound to Screen]
;type = posadd
;trigger1 = movehit
;trigger1 = frontedgedist = [-16, 0]
;x = frontedgedist

[State 1275, End]
type = changestate
trigger1 = pos y > -vel y
value = 1277
ignorehitpause = 1

[State 1275, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


;----- HIT FLOOR -----
[Statedef 1277]
type = C
movetype = A
ctrl = 0
sprpriority = 3

[State 1277, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1256
ignorehitpause = 1

[State 1277, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 1277, Anim]
type = changeanim
trigger1 = anim != 1257
value = 1257

[State 1277, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1277, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno != 1277
value = 3, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1277, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno != 1277
anim = 8104
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.25, 0.25
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1277, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 1277, Pos]
type = posset
trigger1 = 1
y = 0

; Damage Scaling was here

[State 1277, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1270
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1277, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1277, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
persistent = 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1277
attr = S, SP
hitflag = MAFD
guardflag = MA
priority = 4, Hit
damage = 40, 10
dizzypoints = 50 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := -46
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
air.velocity = -5, -5
air.cornerpush.veloff = 0
down.velocity = 0, 0
airguard.velocity = -6.00, -1.00
airguard.ctrltime = 1 + 16
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1277, End]
type = destroyself
trigger1 = !animtime


;========================<SAIFA>=============================
[Statedef 1305]
type = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1305, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT
time = -1
slot = 0
stateno = 1306
ignorehitpause = 1

[State 1305, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AP
time = -1
slot = 1
stateno = 1306
ignorehitpause = 1

[State 1305, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1305, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1305, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

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

[State 1305, Bind]
type = bindtoroot
trigger1 = root, stateno = 1300
trigger1 = root, movetype != H
pos = 62, -80

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

[State 1305, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 8, 0)
channel = 2
ignorehitpause = 1

[State 1305, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1305
attr = S, SP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = (80 + 10 * map(strength)), (20 + 5 * map(strength))
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3.0, ifelse(map(strength) = 2, -6.2, ifelse(map(strength) = 1, -5.6, -5.0))
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.hittime = 120
air.velocity = -3.0, ifelse(map(strength) = 2, -6.2, ifelse(map(strength) = 1, -5.6, -5.0))
air.cornerpush.veloff = 0
guard.velocity = -11
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1305, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1305, Connected]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = root, stateno != 1300 || (root, anim != [1300, 1302]) || root, movetype = H
trigger3 = (root, anim = [1300, 1302]) && (root, animelemtime(5) < 0 || root, animelemtime(10) >= 0)
value = 1306
ignorehitpause = 1


[Statedef 1306]
type = A
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1306, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 1306, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1306, Trans]
type = trans
trigger1 = time <= 8
trans = addalpha
alpha = 256 - (32 * time), 256
ignorehitpause = 1

[State 1306, End]
type = destroyself
trigger1 = time >= 8


;========================<EX SAIFA>=============================
[Statedef 1325]
type = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1325, numhit]
type = varadd
trigger1 = !time
var(0) = 1
ignorehitpause = 1

[State 1325, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT
time = -1
slot = 0
stateno = 1306
ignorehitpause = 1

[State 1325, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AP
time = -1
slot = 1
stateno = ifelse(var(0) < 2, 1325, 1306)
ignorehitpause = 1

[State 1325, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1325, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1325, Anim]
type = changeanim
trigger1 = anim != 1305
value = 1305

[State 1325, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1325, Bind]
type = bindtoroot
trigger1 = root, stateno = 1320
trigger1 = root, movetype != H
pos = 62, -80

; Damage Scaling was here

[State 1325, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1320
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1325, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 8, 0)
channel = 2
ignorehitpause = 1

[State 1325, Hit]
type = hitdef
trigger1 = time >= (prevstateno = 1325) * 8
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
ID = 1325
attr = S, SP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 55, 14
dizzypoints = 100 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, -7.4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.hittime = 120
air.velocity = -4.0, -7.4
air.cornerpush.veloff = 0
guard.velocity = -11
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1325, Connected]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = root, stateno != 1320 || root, anim != 1320 || root, movetype = H
trigger3 = root, anim = 1320 && (root, animelemtime(5) < 0 || root, animelemtime(10) >= 0)
value = ifelse(var(0) < 2, 1325, 1306)
ignorehitpause = 1


;========================<HAOU SHOUKOU KEN>=============================
[Statedef 3005]
type = S
movetype = A
ctrl = 0
sprpriority = 3

[State 3005, Hit Number]
type = varadd
trigger1 = 1
var(0) = 1
persistent = 0
ignorehitpause = 1

[State 3005, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
slot = 0
stateno = ifelse(var(0) < 3, 3005, 3006)
ignorehitpause = 1

[State 3005, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3005, Anim]
type = changeanim
trigger1 = anim != 3005
value = 3005

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 7.37, ifelse(map(strength) = 1, 5.79, 4.20))
y = 0

[State 3005, Time Var]
type = varadd
trigger1 = 1
var(1) = 1
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

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 6, 0)
value = 1

[State 3005, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 6, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = S, HP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -60) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.0, -7.4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.hittime = 120
air.velocity = -4.0, -7.4
air.cornerpush.veloff = 0
guard.velocity = -11
guard.dist = 320
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(0) < 3, 3005, 3006)
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -160 || backedgedist < -160


[Statedef 3006]
type = A
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, End]
type = destroyself
trigger1 = !animtime

;========================<RAIODAMA>=============================
[Statedef 3505]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3505
sprpriority = 3

[State 3505, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = ifelse(map(fireballhits) >= 6, 3507, 3505)
ignorehitpause = 1

[State 3505, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3505, Anim]
type = changeanim
trigger1 = anim != 3505
value = 3505

[State 3505, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

; Damage Scaling was here

[State 3505, Accel]
type = veladd
trigger1 = time
y = 0.25

[State 3505, Vel]
type = velset
trigger1 = 1
x = 2.0

[State 3505, Inital Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
y = 4.0

[State 3505, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 0.5 + (0.125 * time)

[State 3505, Rotate]
type = angleadd
trigger1 = 1
value = -5

[State 3505, Rotate]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 3505, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3505, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (map(fireballhits) + 2))
attr = A, HP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 45, 11
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
guard.dist = 320
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -25) * (map(sparkx.max) := 25), map(sparky) := 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority

[State 3505, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3506
ignorehitpause = 1

[State 3505, End]
type = destroyself
trigger1 = frontedgedist < -40 || backedgedist < -40

[State 3505, Bounce]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > (-vel y - 8)
value = 3508


;----- Hitpause -----
[Statedef 3506]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3506, Hit Count]
type = mapadd
map = "fireballhits"
trigger1 = !time
value = 1

[State 3506, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3506, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 3506, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3500
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3506, End]
type = changestate
trigger1 = time >= 4
value = ifelse(map(fireballhits) >= 6, 3507, 3505)


;----- Disappear -----
[Statedef 3507]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3
movehitpersist = 1

[State 3507, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 3507, Shrink]
type = angledraw
trigger1 = 1
scale = 1 - (0.0588 * time), 1 - (0.0588 * time)

[State 3507, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -floor(11.6 * time), 256
ignorehitpause = 1

[State 1261, End]
type = destroyself
trigger1 = time >= 16


;----- Bounce -----
[Statedef 3508]
type = A
physics = N
movetype = A
ctrl = 0
movehitpersist = 1

[State 3508, Bounce]
type = velmul
trigger1 = !time
y = -0.9

[State 3508, Minimum Bounce]
type = velset
trigger1 = vel y > -4
y = -4

[State 3508, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3508, Pos]
type = posset
trigger1 = 1
y = -8 + 4 * sin((time / 6.0) * pi)

[State 3508, Scale]
type = angledraw
trigger1 = 1
value = 0
scale = 1, 1 - 0.5 * sin((time / 6.0) * pi)

[State 3508, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3508, Sound]
type = playsnd
trigger1 = !time
value = 7, 10
channel = 1
freqmul = 0.90 + (random / 5000.0)

[State 3508, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, ceil(-pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3508, End]
type = changestate
trigger1 = time >= 6
value = 3505


;========================<KOUOU KEN CHARGE>=============================
[Statedef 1004]
type = A
velset = 0, 0
anim = 1004
sprpriority = 3

[State 1004, Bind]
type = bindtoroot
trigger1 = 1

[State 1004, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1004, Anim]
type = changeanim
trigger1 = ((root, anim = [1000, 1002]) || root, anim = 1020) && root, animelemtime(3) < 0
trigger1 = animelemtime(3) >= 0
value = 1004
elem = 3

[State 1004, Anim]
type = changeanim
trigger1 = ((root, anim = [1000, 1002]) || root, anim = 1020) && root, animelemtime(3) >= 0 && root, animelemtime(4) < 0
value = 1004
elem = 4

[State 1004, Anim]
type = changeanim
trigger1 = ((root, anim = [1000, 1002]) || root, anim = 1020) && root, animelemtime(4) >= 0 && animelemtime(5) < 0
value = 1004
elem = 5

[State 1004, End]
type = destroyself
trigger1 = !animtime || root, movetype = H
trigger2 = root, stateno != 1000 || (root, anim != [1000, 1002])
trigger2 = root, stateno != 1020 || root, anim != 1020
trigger3 = ((root, anim = [1000, 1002]) || root, anim = 1020) && root, animelemtime(2) < 0


;========================<RAIOU KEN CHARGE>=============================
;----- RAIOSHO -----
[Statedef 1204]
type = A
velset = 0, 0
anim = 1204
sprpriority = 3

[State 1204, Bind]
type = bindtoroot
trigger1 = (root, anim = [1200, 1202]) || root, anim = 1220

[State 1204, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1204, Anim]
type = changeanim
triggerall = animelemtime(3) >= 0
trigger1 = (root, anim = [1200, 1201]) && root, animelemtime(4) >= 0 && root, animelemtime(5) < 0
trigger2 = root, anim = 1202 && root, animelemtime(12) >= 0 && root, animelemtime(13) < 0
trigger3 = root, anim = 1220 && root, animelemtime(12) >= 0 && root, animelemtime(13) < 0
value = 1204
elem = 3

[State 1204, Anim]
type = changeanim
trigger1 = (root, anim = [1200, 1201]) && root, animelemtime(5) >= 0 && root, animelemtime(6) < 0
trigger2 = root, anim = 1202 && root, animelemtime(13) >= 0 && root, animelemtime(14) < 0
trigger3 = root, anim = 1220 && root, animelemtime(13) >= 0 && root, animelemtime(14) < 0
value = 1204
elem = 4

[State 1204, Anim]
type = changeanim
trigger1 = (root, anim = [1200, 1201]) && root, animelemtime(6) >= 0 && root, animelemtime(7) < 0
trigger2 = root, anim = 1202 && root, animelemtime(14) >= 0 && root, animelemtime(15) < 0
trigger3 = root, anim = 1220 && root, animelemtime(14) >= 0 && root, animelemtime(15) < 0
value = 1204
elem = 5

[State 1204, Anim]
type = changeanim
triggerall = animelemtime(6) < 0
trigger1 = (root, anim = [1200, 1201]) && root, animelemtime(7) >= 0
trigger2 = root, anim = 1202 && root, animelemtime(15) >= 0
trigger3 = root, anim = 1220 && root, animelemtime(15) >= 0
value = 1204
elem = 6

[State 1204, End]
type = destroyself
trigger1 = animelemtime(14) >= 0
trigger2 = animelemtime(6) < 0
trigger2 = root, movetype = H || (root, stateno != [1200, 1220]) || (root, anim != [1200, 1220])


;----- AIR RAIOKEN -----
[Statedef 1254]
type = A
velset = 0, 0
anim = 1254
sprpriority = 3

[State 1254, Bind]
type = bindtoroot
trigger1 = 1

[State 1254, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1254, Anim]
type = changeanim
trigger1 = root, anim = 1250 && root, animelemtime(2) < 0
trigger1 = animelemtime(3) >= 0
value = 1254
elem = 3

[State 1254, Anim]
type = changeanim
trigger1 = root, anim = 1250 && root, animelemtime(3) >= 0 && animelemtime(4) < 0
value = 1254
elem = 4

[State 1254, Anim]
type = changeanim
trigger1 = root, anim = 1250 && root, animelemtime(4) >= 0 && animelemtime(5) < 0
value = 1254
elem = 5

[State 1254, End]
type = destroyself
trigger1 = !animtime || root, movetype = H
trigger2 = root, stateno != 1250 && root, stateno != 1270
trigger3 = root, anim != 1250


;----- RAIODAMA -----
[Statedef 3504]
type = A
velset = 0, 0
anim = 3504
sprpriority = 3

[State 3504, Bind]
type = bindtoroot
trigger1 = 1

[State 3504, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3504, Anim]
type = changeanim
trigger1 = root, anim = 3500
trigger1 = root, animelemtime(2) < 0
value = 3504
elem = 2

[State 3504, Anim]
type = changeanim
trigger1 = root, anim = 3500
trigger1 = root, animelemtime(2) >= 0 && root, animelemtime(3) < 0
value = 3504
elem = 3

[State 3504, Anim]
type = changeanim
trigger1 = root, anim = 3500
trigger1 = root, animelemtime(3) >= 0 && root, animelemtime(4) < 0
value = 3504
elem = 4

[State 3504, Anim]
type = changeanim
trigger1 = root, anim = 3500
trigger1 = root, animelemtime(4) >= 0 && animelemtime(5) < 0
value = 3504
elem = 5

[State 3504, End]
type = destroyself
trigger1 = !animtime
trigger2 = root, movetype = H
trigger3 = root, stateno != 3500
trigger4 = root, anim != 3500


;========================<SHOUKOUKEN CHARGE>=============================
[Statedef 3004]
type = A
velset = 0, 0
anim = 3004
sprpriority = 3

[State 3004, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3004, Bind]
type = bindtoroot
trigger1 = root, animelemtime(3) >= 0 && root, animelemtime(4) < 0
pos = -20, -55

[State 3004, Bind]
type = bindtoroot
trigger1 = root, animelemtime(4) >= 0 && root, animelemtime(5) < 0
pos = -30, -59

[State 3004, Bind]
type = bindtoroot
trigger1 = root, animelemtime(5) >= 0 && root, animelemtime(6) < 0
pos = -2, -60

[State 3004, End]
type = destroyself
trigger1 = root, movetype = H
trigger2 = root, stateno != 3000 || root, anim != 3000
trigger3 = root, stateno = 3000
trigger3 = root, animelemtime(3) < 0 || root, animelemtime(6) >= 0


;====================<POWER CHARGE>====================
;----- MAIN FX -----
[Statedef 8230]
type = S
anim = 9999
velset = 0, 0
ctrl = 0

[State 8230, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = -12, 0

[State 8230, Sound]
type = playsnd
trigger1 = !time
value = 0, 730
channel = 0

[State 8230, Sound]
type = playsnd
trigger1 = 1
value = 0, 731
channel = 1
lowpriority = 1
volumescale = ifelse(time < 180, (time * 0.277), 50)

[State 8230, Aura]
type = explod
trigger1 = !numexplod(8230)
ID = 8230
anim = 8230
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8230, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8104
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8230, FX]
type = modifyexplod
trigger1 = numexplod(8230)
trigger1 = root, time <= 60
ID = 8230
scale = 0.5, 0.125

[State 8230, FX]
type = modifyexplod
trigger1 = numexplod(8230)
trigger1 = root, time = [61, 119]
ID = 8230
scale = 0.5, 0.1 + ((root, time - 60) * 0.00625)

[State 8230, FX]
type = modifyexplod
trigger1 = numexplod(8230)
trigger1 = root, time >= 120
ID = 8230
scale = 0.5, 0.5

[State 8230, End]
type = stopsnd
trigger1 = root, stateno != 730
trigger2 = root, movetype = H
channel = 0

[State 8230, End]
type = stopsnd
trigger1 = root, stateno != 730
trigger2 = root, movetype = H
channel = 1

[State 8230, End]
type = removeexplod
trigger1 = root, stateno != 730
trigger2 = root, movetype = H

[State 8230, End]
type = destroyself
trigger1 = root, stateno != 730
trigger2 = root, movetype = H


;----- PARTICLES -----
[Statedef 8232]
type = S
anim = 9999
velset = 0, 0
ctrl = 0

[State 8232, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-185 + (random / 3.125)), ceil(97 -(random / 3.125))

[State 8232, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 8232
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -25) / 32.0), ((rootdist y -63) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8232, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8232, End]
type = destroyself
trigger1 = root, stateno != 730


;========================<CUSTOM COMBO>=============================
[Statedef 8300]
type = A
physics = N
movetype = I
anim = 8300
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8300, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8300, BG PalFX]
type = bgpalfx
trigger1 = time <= 25
time = 1
mul = 128, 128, 128

[State 8300, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8300, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8300, Scale]
type = angledraw
trigger1 = time < 8
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)

[State 8300, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5

[State 8300, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256

[State 8300, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8300, Lines]
type = explod
trigger1 = !time
anim = 8301
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
removetime = 16
supermovetime = -1

[State 8300, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 8300, Circle]
type = explod
trigger1 = time = 16
anim = 8302
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8300, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8300, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8300, End]
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
type = modifyexplod
trigger1 = numexplod(21) && (time = [16, 32])
ID = 21
scale = 0, 0

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160 + (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time >= 32
ID = 21
postype = back
pos = 160 - (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 90, 120)
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
[Statedef 8105]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 8105, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8105, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8105
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

[State 8105, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8105, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 - (16 * (time -3)), 256

[State 8105, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 - (16 * (time -6)), 256

[State 8105, End]
type = removeexplod
trigger1 = time >= 22

[State 8105, End]
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
[Statedef 8250]
type = S
anim = 9999
velset = 0, 0

[State 8250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8250, Circle]
type = explod
trigger1 = !time
anim = 8251
ID = 8251
sprpriority = 3
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8250, Circle]
type = modifyexplod
trigger1 = numexplod(8251)
ID = 8251
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8250, Lightning]
type = explod
trigger1 = !time
anim = 8250
ID = 8250
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8250, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 8250, End]
type = destroyself
trigger1 = time >= 16


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
trigger1 = root, map(superfinish) = 3000
var(0) = 2

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3100
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3200, 3210]
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3220, 3230]
var(0) = 5

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3300, 3311]
var(0) = 6

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3400
var(0) = 7

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3500
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
