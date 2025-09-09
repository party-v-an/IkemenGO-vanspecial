; _______________________________
;| Nash by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<SONIC BOOM>=============================
[Statedef 1005]
type = S
physics = N
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

[State 1005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 4.687, ifelse(map(strength) = 1, 3.906, 3.125))
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

[State 1005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, SP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 50 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.20, -5.9
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = !(root, map(customcombo))
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
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

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

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

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime


;========================<EX SONIC BOOM>=============================
[Statedef 1025]
type = S
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 1025, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = ifelse(var(0) < 2, 1025, 1026)
ignorehitpause = 1

[State 1025, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1025, Anim]
type = changeanim
trigger1 = anim != 1005
value = 1005

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

[State 1025, numhit]
type = varadd
trigger1 = !time
var(0) = 1

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

[State 1025, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 1025, Hit]
type = hitdef
trigger1 = time >= ifelse(numtarget, 4, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (var(0) + 1))
attr = S, SP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 13
dizzypoints = 50 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.45, -6.65
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1025, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1025, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(var(0) < 2, 1025, 1026)
ignorehitpause = 1

[State 1025, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1026]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1006
velset = 0, 0
sprpriority = 3

[State 1026, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 1026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1026, End]
type = destroyself
trigger1 = !animtime


;========================<EX SOMERSAULT SHELL>=============================
[Statedef 1125]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 1125, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1126
ignorehitpause = 1

[State 1125, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 1125, Anim]
type = changeanim
trigger1 = anim != 1125
value = 1125

[State 1125, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1125, Vel];40 degrees
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = 8;7.7
y = -8;-9.2

[State 1125, Time Var]
type = varadd
trigger1 = 1
var(1) = 1
ignorehitpause = 1

; Damage Scaling was here

[State 1125, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1120
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1125, Hit]
type = hitdef
trigger1 = !movecontact
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
attr = A, SP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 22, 6
dizzypoints = 50 * !(root, map(customcombo))
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -4.0, -7.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 1125, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 1125, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1126
ignorehitpause = 1

[State 1125, End]
type = changestate
trigger1 = var(1) >= 10
value = 1127

[State 1125, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1126]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1126
velset = 0, 0
sprpriority = 3

[State 1126, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 1126, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1126, End]
type = destroyself
trigger1 = !animtime


[Statedef 1127]
type = A
physics = N
movetype = I
sprpriority = 3

[State 1127, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1127, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(time * 0.1), 1 -(time * 0.1)

[State 1127, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (25 * time), 256
ignorehitpause = 1

[State 1127, End]
type = velmul
trigger1 = 1
x = 0.75
y = 0.75

[State 1127, End]
type = destroyself
trigger1 = time >= 10


;========================<SONIC BREAK>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 3005, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 3006
ignorehitpause = 1

[State 3005, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3005, Anim]
type = changeanim
trigger1 = anim != 1005
value = 1005

[State 3005, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Vel]
type = velset
trigger1 = 1
;x = 5.54;6.66
x = ifelse(map(strength) = 2, 5.50, ifelse(map(strength) = 1, 4.75, 4.00))
y = ifelse(map(strength) = 2, 1.00, ifelse(map(strength) = 1, 2.00, 3.00)) * cos(pi * time / ifelse(map(strength) = 2, 8, ifelse(map(strength) = 1, 12, 16)))

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

[State 3005, ProjContact Share]
type = mapset
trigger1 = numhelper(3005)
trigger1 = helper(3005), map(projcontact)
map = "projcontact"
value = 1

[State 3005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 4)
attr = S, HP
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 50, 12
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
ground.velocity = -4.1, -5.9
guard.velocity = -10.52
air.velocity = -4.1, -5.9
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
guard.dist = 320
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -20) * (map(sparkx.max) := 20), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1
palfx.time = ifelse(root, map(shadow), 60, 0)
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)

[State 3005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3006
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 3006]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3006
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


;========================<SONIC BLADE>=============================
[Statedef 3605]
type = S
physics = N
movetype = A
ctrl = 0
sprpriority = 1

[State 3605, Anim]
type = changeanim
trigger1 = (anim != [3605, 3606])
value = 3605

[State 3605, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3605, Bind]
type = bindtoroot
trigger1 = anim = 3605 && animelemtime(7) < 0
trigger1 = root, stateno = 3600 && root, movetype != H
trigger1 = root, animelemtime(21) < 0
pos = 0, -75

[State 3605, Anim]
type = changeanim
trigger1 = anim = 3605 && animelemtime(10) >= 0
trigger1 = movecontact && numtarget
value = 3606

[State 3605, Vel]
type = velset
trigger1 = anim = 3605
x = 6
y = 0

[State 3606, Vel]
type = velmul
trigger1 = anim = 3606
x = 0.85
y = 0.85

; Damage Scaling was here

[State 3605, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3600
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3605, Spark Position]
type = null
trigger1 = 1 || map(sparkx.min) := (ifelse(moveguarded, 20, 40) * cos((time - 6) / 10.0 * pi))
trigger1 = 1 || map(sparkx.max) := map(sparkx.min)
trigger1 = 1 || map(sparky) := (((p2dist y + pos y) / 2.0) - ifelse(moveguarded, 20, 40) * sin((time - 6) / 10.0 * pi))

[State 3605, Hit]
type = hitdef
trigger1 = anim = 3605
trigger1 = animelem = 7
trigger2 = anim = 3606
trigger2 = animelem = 1 || animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21 || animelem = 25 || animelem = 29
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
attr = S, HP
hitflag = MAFP
guardflag = M
priority = 4, Hit
damage = 45, 11
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
air.hittime = 120
ground.velocity = 0, 0
guard.velocity = -10.52
air.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.dist = 320
p1sprpriority = sprpriority
forcestand = 1

[State 3605, Hit]
type = hitdef
trigger1 = anim = 3606 && animelem = 29
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
attr = S, HP
hitflag = MAFP
guardflag = M
priority = 4, Hit
damage = 45, 11
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
ground.velocity = -6, -6
guard.velocity = -10.52
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.dist = 320
p1sprpriority = sprpriority
forcestand = 1

[State 3605, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 3605, End]
type = destroyself
trigger1 = !animtime
trigger1 = anim = 3605
trigger2 = anim = 3605 && animelemtime(7) < 0
trigger2 = root, movetype = H

[State 3605, End]
type = destroyself
trigger1 = !animtime
trigger1 = anim = 3606


;========================<MOONSAULT STRIKE>=============================
[Statedef 3705]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 3705, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 3706
ignorehitpause = 1

[State 3705, HB]
type = hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3705, Anim]
type = changeanim
trigger1 = anim != 3705
value = 3705

[State 3705, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3705, Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = 4
y = 4

; Damage Scaling was here

[State 3705, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3700
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3705, Hit]
type = hitdef
trigger1 = !movecontact
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
attr = A, HP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
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
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -5.67, -6.67
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
guard.dist = const(size.proj.attack.dist)
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
p1sprpriority = sprpriority
forcestand = 1

[State 3705, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = ifelse(numtarget, 2, 3), ifelse(numtarget, 6, 0)
channel = 2
ignorehitpause = 1

[State 3705, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3706
ignorehitpause = 1

[State 3705, End]
type = changestate
trigger1 = pos y >= 0
value = 3707

[State 3705, End]
type = destroyself
trigger1 = frontedgedist < -160 || backedgedist < -160


[Statedef 3706]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3706
velset = 0, 0
sprpriority = 3

[State 3706, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 3, 0
channel = 2
volumescale = 33

[State 3706, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3706, End]
type = destroyself
trigger1 = !animtime


[Statedef 3707]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3706
velset = 0, 0
sprpriority = 3

[State 3707, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3707, Pos]
type = posset
trigger1 = pos y > 0
y = 0

[State 3707, Sound]
type = playsnd
trigger1 = !time
value = 3, 0
volumescale = 75

[State 3706, End]
type = destroyself
trigger1 = !animtime


;========================<SONIC BOOM FX>=============================
[Statedef 1010]
type = A
velset = 0, 0
anim = 1010
sprpriority = 3

[State 1010, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1000 || parent, anim != [1000, 1002]
trigger2 = parent, stateno != 1020 || parent, anim != 1020
trigger2 = parent, stateno != 3000 || parent, anim != [3000, 3002]
trigger2 = parent, stateno != 3200 || parent, anim != 3200
trigger2 = parent, stateno != 3600 || parent, anim != 3600
trigger3 = parent, anim = [1000, 1002] || parent, anim = 1020
trigger3 = parent, animelemtime(3) < 0 || parent, animelemtime(6) >= 0
trigger4 = parent, anim = [3000, 3002]
trigger4 = parent, animelemtime(2) < 0 || parent, animelemtime(5) >= 0
trigger5 = parent, anim = 3200
trigger5 = parent, animelemtime(23) < 0 || parent, animelemtime(26) >= 0
trigger6 = parent, anim = 3600
trigger6 = parent, animelemtime(6) < 0 || parent, animelemtime(9) >= 0

[State 1010, Bind]
type = bindtoparent
trigger1 = 1

[State 1010, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = [1000, 1002] || parent, anim = 1020
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
trigger2 = parent, anim = 3000
trigger2 = parent, animelemtime(2) >= 0 && parent, animelemtime(3) < 0
value = 1010
elem = 1

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = [1000, 1002] || parent, anim = 1020
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
trigger2 = parent, anim = 3000
trigger2 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
value = 1010
elem = 2

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = [1000, 1002] || parent, anim = 1020
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 0
trigger2 = parent, anim = 3000
trigger2 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
value = 1010
elem = 3

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3001
trigger1 = parent, animelemtime(2) >= 0 && parent, animelemtime(3) < 0
trigger2 = parent, anim = 3600
trigger2 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
value = 1010
elem = 4

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3001
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
trigger2 = parent, anim = 3600
trigger2 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
value = 1010
elem = 5

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3001
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
trigger2 = parent, anim = 3600
trigger2 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 0
value = 1010
elem = 6

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3002
trigger1 = parent, animelemtime(2) >= 0 && parent, animelemtime(3) < 0
trigger2 = parent, anim = 3200
trigger2 = parent, animelemtime(23) >= 0 && parent, animelemtime(24) < 0
value = 1010
elem = 7

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3002
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
trigger2 = parent, anim = 3200
trigger2 = parent, animelemtime(24) >= 0 && parent, animelemtime(25) < 0
value = 1010
elem = 8

[State 1010, Anim]
type = changeanim
trigger1 = parent, anim = 3002
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
trigger2 = parent, anim = 3200
trigger2 = parent, animelemtime(25) >= 0 && parent, animelemtime(26) < 0
value = 1010
elem = 9


;========================<SOMERSAULT FX>=============================
[Statedef 1105]
type = A
velset = 0, 0
anim = 1105
sprpriority = 3

[State 1105, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1100 || parent, anim != [1100, 1102]
trigger2 = parent, stateno != 1120 || parent, anim != 1120
trigger2 = parent, stateno != 3100 || parent, anim != 3100
trigger2 = parent, stateno != 3500 || parent, anim != 3500
trigger3 = parent, anim = [1100, 1101]
trigger3 = parent, animelemtime(3) < 0 || parent, animelemtime(6) >= 0
trigger4 = parent, anim = 1102 || parent, anim = 1120
trigger4 = parent, animelemtime(3) < 0 || parent, animelemtime(9) >= 0

[State 1105, End]
type = destroyself
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(4) < 0 || parent, animelemtime(34) >= 0
trigger2 = parent, animelemtime(10) >= 0 && parent, animelemtime(16) < 0
trigger3 = parent, animelemtime(22) >= 0 && parent, animelemtime(28) < 0

[State 1105, End]
type = destroyself
triggerall = parent, anim = 3500
trigger1 = parent, animelemtime(5) < 0 || parent, animelemtime(18) >= 0
trigger2 = parent, animelemtime(8) >= 0 && parent, animelemtime(12) < 0

[State 1105, Bind]
type = bindtoparent
trigger1 = 1

[State 1105, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = [1100, 1102] || parent, anim = 1120
trigger1 = parent, animelemtime(3) >= 0 && parent, animelemtime(4) < 0
value = 1105
elem = 1

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = [1100, 1102] || parent, anim = 1120
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
value = 1105
elem = 2

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = [1100, 1102] || parent, anim = 1120
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 0
value = 1105
elem = 3

[State 1105, Anim]
type = changeanim
trigger4 = parent, anim = 1102 || parent, anim = 1120
trigger1 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
value = 1105
elem = 4

[State 1105, Anim]
type = changeanim
trigger4 = parent, anim = 1102 || parent, anim = 1120
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
value = 1105
elem = 5

[State 1105, Anim]
type = changeanim
trigger4 = parent, anim = 1102 || parent, anim = 1120
trigger1 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 0
value = 1105
elem = 6

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(4) >= 0 && parent, animelemtime(5) < 0
trigger2 = parent, animelemtime(16) >= 0 && parent, animelemtime(17) < 0
trigger3 = parent, animelemtime(28) >= 0 && parent, animelemtime(29) < 0
value = 1105
elem = 1

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 0
trigger2 = parent, animelemtime(17) >= 0 && parent, animelemtime(18) < 0
trigger3 = parent, animelemtime(29) >= 0 && parent, animelemtime(30) < 0
value = 1105
elem = 2

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
trigger2 = parent, animelemtime(18) >= 0 && parent, animelemtime(19) < 0
trigger3 = parent, animelemtime(30) >= 0 && parent, animelemtime(31) < 0
value = 1105
elem = 3

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
trigger2 = parent, animelemtime(19) >= 0 && parent, animelemtime(20) < 0
trigger3 = parent, animelemtime(31) >= 0 && parent, animelemtime(32) < 0
value = 1105
elem = 4

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 0
trigger2 = parent, animelemtime(20) >= 0 && parent, animelemtime(21) < 0
trigger3 = parent, animelemtime(32) >= 0 && parent, animelemtime(33) < 0
value = 1105
elem = 5

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3100
trigger1 = parent, animelemtime(9) >= 0 && parent, animelemtime(10) < 0
trigger2 = parent, animelemtime(21) >= 0 && parent, animelemtime(22) < 0
trigger3 = parent, animelemtime(33) >= 0 && parent, animelemtime(34) < 0
value = 1105
elem = 6

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3500
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 0
trigger2 = parent, animelemtime(12) >= 0 && parent, animelemtime(13) < 0
value = 1105
elem = 1

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3500
trigger1 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
trigger2 = parent, animelemtime(13) >= 0 && parent, animelemtime(14) < 0
value = 1105
elem = 2

[State 1105, Anim]
type = changeanim
triggerall = parent, anim = 3500
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
trigger2 = parent, animelemtime(14) >= 0 && parent, animelemtime(15) < 0
value = 1105
elem = 3

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = 3500
trigger1 = parent, animelemtime(15) >= 0 && parent, animelemtime(16) < 0
value = 1105
elem = 4

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = 3500
trigger1 = parent, animelemtime(16) >= 0 && parent, animelemtime(17) < 0
value = 1105
elem = 5

[State 1105, Anim]
type = changeanim
trigger1 = parent, anim = 3500
trigger1 = parent, animelemtime(17) >= 0 && parent, animelemtime(18) < 0
value = 1105
elem = 6


;========================<MOONSAULT FX>=============================
[Statedef 1205]
type = A
velset = 0, 0
anim = 1205
sprpriority = 3

[State 1205, Bind]
type = bindtoparent
trigger1 = 1

[State 1205, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1205, End]
type = destroyself
trigger1 = parent, movetype = H
trigger2 = parent, stateno != 1200 || (parent, anim != [1200, 1202])
trigger2 = parent, stateno != 1220 || parent, anim != 1220
trigger2 = parent, stateno != 3700 || parent, anim != 3700
trigger3 = parent, anim = [1200, 1202] || parent, anim = 1220
trigger3 = parent, animelemtime(5) < 0 || parent, animelemtime(8) >= 0
trigger4 = parent, anim = 3700
trigger4 = parent, animelemtime(7) < 0 || (parent, animelemtime(10) >= 0 && parent, animelemtime(15) < 0) || parent, animelemtime(18) >= 0

[State 1205, Anim]
type = changeanim
trigger1 = parent, anim = [1200, 1202] || parent, anim = 1220
trigger1 = parent, animelemtime(5) >= 0 && parent, animelemtime(6) < 0
value = 1205
elem = 1

[State 1205, Anim]
type = changeanim
trigger1 = parent, anim = [1200, 1202] || parent, anim = 1220
trigger1 = parent, animelemtime(6) >= 0 && parent, animelemtime(7) < 0
value = 1205
elem = 2

[State 1205, Anim]
type = changeanim
trigger1 = parent, anim = [1200, 1202] || parent, anim = 1220
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
value = 1205
elem = 3

[State 1205, Anim]
type = changeanim
triggerall = parent, anim = 3700
trigger1 = parent, animelemtime(7) >= 0 && parent, animelemtime(8) < 0
trigger2 = parent, animelemtime(15) >= 0 && parent, animelemtime(16) < 0
value = 1205
elem = 1

[State 1205, Anim]
type = changeanim
triggerall = parent, anim = 3700
trigger1 = parent, animelemtime(8) >= 0 && parent, animelemtime(9) < 0
trigger2 = parent, animelemtime(16) >= 0 && parent, animelemtime(17) < 0
value = 1205
elem = 2

[State 1205, Anim]
type = changeanim
triggerall = parent, anim = 3700
trigger1 = parent, animelemtime(9) >= 0 && parent, animelemtime(10) < 0
trigger2 = parent, animelemtime(17) >= 0 && parent, animelemtime(18) < 0
value = 1205
elem = 3


;========================<WARP FX>=============================
[Statedef 1305]
type = A
velset = 0, 0
anim = 1305
sprpriority = -1

[State 1305, End]
type = destroyself
trigger1 = parent, movetype = H
trigger1 = parent, stateno != 1300 || parent, anim != [1300, 1302]
trigger2 = parent, anim = [1300, 1302]
trigger2 = parent, animelemtime(2) < 0 || parent, animelemtime(3) >= 0

[State 1305, Bind]
type = bindtoparent
trigger1 = 1

[State 1305, Anim]
type = changeanim
trigger1 = !time
value = 1305
elem = ifelse((parent, anim = 1300), 5, ifelse((parent, anim = 1301), 3, 1))

[State 1305, Anim]
type = changeanim
trigger1 = animelemtime(7) >= 0
value = 1305
elem = 7

[State 1305, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow


;====================<HARRIER>====================
[Statedef 6000]
type = A
physics = N
anim = 6000
velset = 0, 5
ctrl = 0
sprpriority = -255

[State 6000, Angle]
type = varadd
trigger1 = vel y <= 0 && var(0) <= 60
var(0) = 1

[State 6000, Angle]
type = angledraw
trigger1 = 1
value = var(0)
scale = (0.25 + 0.015 * time), (0.25 + 0.015 * time)

[State 6000, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
x = -0.1
y = -0.25

[State 6000, Sound]
type = playsnd
trigger1 = time = 5
value = 7, 3

[State 6000, Shake]
type = envshake
trigger1 = !(time % 3) && time < 100
time = 3
ampl = 1
freq = 180

[State 6000, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6000, End]
type = destroyself
trigger1 = time >= 190
trigger1 = (frontedgedist < -160 || backedgedist < -160) || (screenpos y != [-34, 75])


[Statedef 6001]
type = A
physics = N
anim = 6001
velset = 5, -1
ctrl = 0
sprpriority = -255

[State 6001, Pos]
type = posset
trigger1 = !time
x = -205 * facing
y = -112

[State 6001, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
[State 6001, End]
type = destroyself
trigger1 = time >= 60
trigger1 = (pos x != [-210, 210]) || (screenpos y != [0, 240])


;====================<SHADOW DISTORTION>====================
[Statedef 6010]
type = A
physics = N
movetype = I
anim = 9999
sprpriority = 2
ctrl = 0

[State 6010, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 6010, Bind]
type = bindtoroot
trigger1 = 1
facing = 1
pos = -1 + (random / 500.0), -1 + (random / 500.0)

[State 6010, Layer]
type = sprpriority
trigger1 = 1
value = root, sprpriority + 3

[State 6010, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 6010, Anim]
type = changeanim
trigger1 = selfanimexist(root, anim)
value = root, anim
elem = root, animelemno(0)

[State 6010, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6010, Custom]
type = assertspecial
trigger1 = root, incustomstate
flag = invisible

[State 6010, Custom]
type = changeanim
trigger1 = root, incustomstate
value = 9999

[State 6010, Anim]
type = assertspecial
trigger1 = 1
flag = animfreeze

[State 6010, End]
type = destroyself
trigger1 = root, map(shadow) = 0
trigger2 = root, palno != 12


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
anim = 8104
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
pos = ceil(-161 + (random / 3.125)), ceil(73 -(random / 3.125))

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
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
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
pos = 160 + (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time >= 32
ID = 21
postype = back
pos = 160 - (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 105, 120)
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


;========================<SHADOW FLAMES>=============================
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
value = 7, 7
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

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
sprpriority = 5
postype = left
pos = 0, 0
scale = 1, (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
scale = 1, 1
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
sprpriority = -5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
sprpriority = -5

[State 8600, Shrink]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

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
triggerall = !time
trigger1 = root, map(superfinish) = 3200
trigger2 = root, map(superfinish) = [3300, 3301]
var(0) = 3

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3400
var(0) = 5

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3500
var(0) = 6

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3600
var(0) = 7

[State 8600, Text]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3700
var(0) = 8

[State 8600, Text]
type = explod
trigger1 = !time
anim = 8610 + var(0)
ID = 8610
sprpriority = 5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = (1.3333333 * gameheight / gamewidth), (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8610)
ID = 8610
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

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
scale = 1, (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
ontop = 1

[State 8650, Fade]
type = modifyexplod
trigger1 = numexplod(8650)
ID = 8650
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
