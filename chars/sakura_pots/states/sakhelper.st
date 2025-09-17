; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<HADOU KEN>=============================
[Statedef 1005]
type = S
physics = N
movetype = A
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

[State 1005, Strength]
type = mapset
trigger1 = !time
map = "hadoucharge"
value = ifelse(root, map(dark), 0, root, map(hadoucharge))

[State 1005, Mode Var]
type = mapset
map = "dark"
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, map(dark)
value = 1

[State 1005, Anim]
type = changeanim
trigger1 = ishelper(1005)
trigger1 = anim != 1005
value = 1005

[State 1005, Anim]
type = changeanim
trigger1 = ishelper(1025)
trigger1 = anim != 1025
value = 1025

[State 1005, Anim]
type = changeanim
trigger1 = ishelper(1055)
trigger1 = anim != 1055
value = 1055

; Damage Scaling was here

[State 1005, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1000 || root, stateno = 1020 || root, stateno = 1050
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1005, Time Var]
type = mapadd
trigger1 = time
map = "fireballtime"
value = 1

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, Angle]
type = angleset
trigger1 = ishelper(1005)
value = 0
ignorehitpause = 1

[State 1005, Angle]
type = angleset
trigger1 = ishelper(1025)
value = ifelse(root, const(size.xscale) < 1, 50, 43)
ignorehitpause = 1

[State 1005, Angle]
type = angleset
trigger1 = ishelper(1055)
;value = -45
value = ifelse(map(strength) = 2, -45, ifelse(map(strength) = 1, -52.5, -60))
ignorehitpause = 1

[State 1005, Scale]
type = null
trigger1 = ishelper(1055)
trigger1 = 1 || map(scale_x) := 0.67
trigger1 = 1 || map(scale_y) := 0.33
trigger2 = map(dark)
trigger2 = 1 || map(scale_x) := 0.75
trigger2 = 1 || map(scale_y) := 0.50
trigger3 = !map(dark)
trigger3 = 1 || map(scale_x) := ifelse(map(hadoucharge) = 2, 1.0, ifelse(map(hadoucharge) = 1, 0.83, 0.67))
trigger3 = 1 || map(scale_y) := ifelse(map(hadoucharge) = 2, 1.0, ifelse(map(hadoucharge) = 1, 0.67, 0.33))
ignorehitpause = 1

[State 1005, Scale]
type = angledraw
trigger1 = 1
scale = map(scale_x), map(scale_y)
ignorehitpause = 1

[State 1005, Clsn Scale]
type = transformclsn
trigger1 = 1
scale = scale x, scale y
ignorehitpause = 1

[State 1005, Vel Normal]
type = velset
trigger1 = !map(dark)
trigger1 = ishelper(1005) || ishelper(1025)
x = ifelse(map(strength) = 2, 5.0, ifelse(map(strength) = 1, 4.17, 3.33)) * ifelse(map(hadoucharge) = 2, 0.667, ifelse(map(hadoucharge) = 1, 0.834, 1.000)) * cos(rad(-angle))
y = ifelse(map(strength) = 2, 5.0, ifelse(map(strength) = 1, 4.17, 3.33)) * ifelse(map(hadoucharge) = 2, 0.667, ifelse(map(hadoucharge) = 1, 0.834, 1.000)) * sin(rad(-angle))

[State 1005, Vel Dark]
type = velset
trigger1 = map(dark)
trigger1 = ishelper(1005) || ishelper(1025)
x = ifelse(map(strength) = 2, 5.0, ifelse(map(strength) = 1, 4.17, 3.33)) * cos(rad(-angle))
y = ifelse(map(strength) = 2, 5.0, ifelse(map(strength) = 1, 4.17, 3.33)) * sin(rad(-angle))

[State 1005, Vel Down]
type = velset
trigger1 = ishelper(1055)
;x = ifelse(map(strength) = 2, 3.0, ifelse(map(strength) = 1, 2.25, 1.50))
;y = ifelse(map(strength) = 2, 3.0, ifelse(map(strength) = 1, 2.25, 1.50))
x = 3.33 * cos(rad(-angle))
y = 3.33 * sin(rad(-angle))

[State 1005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 1005, Hit Weak]
type = hitdef
trigger1 = ishelper(1005) || ishelper(1025)
trigger1 = map(hadoucharge) = 0 || map(dark)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, SP
damage = 60, 15
dizzypoints = 100 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
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
air.velocity = -4, -6
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120

[State 1005, Hit Medium]
type = hitdef
trigger1 = ishelper(1005) || ishelper(1025)
trigger1 = map(hadoucharge) = 1 && !map(dark)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = S, SP
damage = 80, 20
dizzypoints = 150 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
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
air.velocity = -4, -6
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
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1005, Hit Strong]
type = hitdef
trigger1 = ishelper(1005) || ishelper(1025)
trigger1 = map(hadoucharge) = 2 && !map(dark)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
priority = 4, Hit
attr = S, SP
damage = 120, 30
dizzypoints = 200 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = ifelse(ishelper(1025), -2, -4), ifelse(ishelper(1025), -9, -6)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = ifelse(ishelper(1025), -2, -4), ifelse(ishelper(1025), -9, -6)
fall = 1
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
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1005, Hit Air]
type = hitdef
trigger1 = ishelper(1055)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 1005
priority = 4, Hit
attr = A, SP
damage = 50, 13
dizzypoints = 100 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
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
yaccel = 0.4850
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
down.velocity = 0, 0

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

[State 1005, End Out of Bounds]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80
trigger2 = ishelper(1025)
trigger2 = screenpos y < -50

[State 1005, End Crash]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1007
ignorehitpause = 1

[State 1005, End Time Out]
type = changestate
trigger1 = !map(dark)
trigger1 = ishelper(1005)
trigger1 = map(fireballtime) >= ifelse(map(strength) = 2, 34, ifelse(map(strength) = 1, 41, 51)) * ifelse(map(hadoucharge) = 2, 0.50, ifelse(map(hadoucharge) = 1, 0.75, 1.00))
value = 1007
ignorehitpause = 1

[State 1005, End Time Out]
type = changestate
trigger1 = !map(dark)
trigger1 = ishelper(1025)
trigger1 = map(fireballtime) >= ifelse(map(strength) = 2, 21, ifelse(map(strength) = 1, 27, 32)) * ifelse(map(hadoucharge) = 2, 0.50, ifelse(map(hadoucharge) = 1, 0.75, 1.00))
value = 1007
ignorehitpause = 1

[State 1005, End Time Out]
type = changestate
trigger1 = map(dark)
trigger1 = !ishelper(1055)
trigger1 = map(fireballtime) >= ifelse(map(strength) = 2, 52, ifelse(map(strength) = 1, 46, 40))
value = 1007
ignorehitpause = 1

[State 1005, End Time Out]
type = changestate
trigger1 = ishelper(1055)
trigger1 = map(fireballtime) >= 32
value = 1007
ignorehitpause = 1


[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 1006, Shrink]
type = angledraw
trigger1 = 1
scale = map(scale_x), 1.50 * map(scale_y)
ignorehitpause = 1

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

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


;--- Fade out ---
[Statedef 1007]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1007, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (time * 16), 256
ignorehitpause = 1

[State 1007, Shrink]
type = angledraw
trigger1 = 1
scale = map(scale_x) * (1 - (time / 17.0)), map(scale_y)

[State 1007, End]
type = destroyself
trigger1 = time >= 16


;========================<EX HADOUKEN>=============================
[Statedef 1015]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1015, Hit Number]
type = mapadd
trigger1 = 1
map = "fireballhits"
value = 1
persistent = 0
ignorehitpause = 1

[State 1015, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1015
ignorehitpause = 1

[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, NHB]
type = nothitby
trigger1 = map(fireballhits) >= 4
time = -1
value = SCA
ignorehitpause = 1

[State 1015, Movevar]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "rootstate"
value = root, stateno

[State 1015, Anim]
type = changeanim
trigger1 = anim != 1015 && anim != 1035
value = ifelse(map(rootstate) = 1030, 1035, 1015)

[State 1015, Anim]
type = changeanim
trigger1 = prevstateno = 1015
trigger1 = animelemno(0) < 17 && map(fireballhits) < 4
trigger1 = time <= (prevstateno = 1015) * 4
value = anim
elem = animelemno(0) + ifelse(time = 0, 1, 0)
ignorehitpause = 1

[State 1015, Angle]
type = angledraw
trigger1 = map(rootstate) = 1030
value = ifelse(root, const(size.xscale) < 1, 50, 43)
ignorehitpause = 1

[State 1015, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

; Damage Scaling was here

[State 1015, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1010 || root, stateno = 1030
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1015, Bind]
type = bindtoroot
trigger1 = map(rootstate) = 1010
trigger1 = root, stateno = 1010
trigger1 = root, movetype != H
pos = (root, const(size.xscale) * 74), (root, const(size.yscale) * -54)

[State 1015, Bind]
type = bindtoroot
trigger1 = map(rootstate) = 1030
trigger1 = root, stateno = 1030
trigger1 = root, movetype != H
pos = (root, const(size.xscale) * 48), (root, const(size.yscale) * -92)

[State 1015, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = ishelper(1015)
trigger1 = map(fireballhits) < 4
trigger1 = time >= (prevstateno = 1015) * 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
priority = 4, Hit
attr = S, SP
damage = 40, 10
dizzypoints = 67 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := p2dist x), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4, -6
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
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1015, Hit]
type = hitdef
trigger1 = ishelper(1035)
trigger1 = map(fireballhits) < 4
trigger1 = time >= (prevstateno = 1015) * 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
priority = 4, Hit
attr = S, SP
damage = 40, 10
dizzypoints = 67 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 0) * (map(sparkx.max) := p2dist x), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -3, -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -3, -6
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
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1015, End]
type = destroyself
trigger1 = !animtime
trigger2 = root, movetype = H
trigger3 = animelemtime(7) < 0 && (root, stateno != map(rootstate))
trigger4 = (root, anim = 1010 && root, animelemtime(5) < 0)
trigger5 = (root, anim = 1030 && root, animelemtime(5) < 0)
ignorehitpause = 1

[State 1015, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1015
ignorehitpause = 1


;========================<PROJECTILE SHIELD>=============================
[Statedef 1115]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3

[State 1115, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1115
ignorehitpause = 1

[State 1115, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1115, Anim]
type = changeanim
trigger1 = anim != 1115
value = 1115

[State 1115, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 64 * (gametime % 3), 256
ignorehitpause = 1

[State 1115, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1115, Vel]
type = velmul
trigger1 = 1
x = 1.05

[State 1115, Vel]
type = velset
trigger1 = vel x < 4
x = 4
y = 0

[State 1115, Vel]
type = velset
trigger1 = root, stateno = 4100
x = root, vel x
y = 0

[State 1115, Bind]
type = bindtoroot
trigger1 = root, stateno = 4100
trigger1 = root, movetype != H
pos = 16 * root, const(size.xscale), -58 * root, const(size.yscale)
time = 1

[State 1115, End]
type = destroyself
trigger1 = root, movetype = H
trigger1 = abs(rootdist x) < 32
trigger2 = frontedgedist < -80 || backedgedist < -80
trigger3 = time >= 300


;========================<OTOSHI PROJECTILE HITTER>=============================
[Statedef 1306]
type = A
physics = N
movetype = A
anim = 1306
ctrl = 0

[State 1306, Reversal]
type = reversaldef
trigger1 = !time
reversal.attr = SCA, AP
p1stateno = 1307
pausetime = 0, 0
sparkno = -1
numhits = 0
ground.hittime = 1 + 0
ignorehitpause = 1

[State 1306, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1307
ignorehitpause = 1

[State 1306, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AP
ignorehitpause = 1

[State 1306, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 1306, Anim]
type = changeanim
trigger1 = root, anim = 1305 && root, animelemtime(5) < 0
value = 1306
elem = (root, animelemno(0))
ignorehitpause = 1

[State 1306, End]
type = destroyself
trigger1 = !animtime || root, movetype = H
trigger2 = root, stateno != 1305 || root, anim != 1305


[Statedef 1307]
type = A
physics = N
movetype = A
anim = 9999
ctrl = 0

[State 1307, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 1307, HitSound]
type = playsnd
trigger1 = !time
value = 2, 1
channel = 2
ignorehitpause = 1
persistent = 0

;[State 1307, Spark]
;in ZSS

[State 1307, End]
type = destroyself
trigger1 = root, stateno != 1305 || root, anim != 1305
trigger2 = root, time = 0
trigger2 = root, stateno = 1305


;========================<SHINKUU HADOU KEN>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3005, Hit Number]
type = mapadd
trigger1 = 1
map = "fireballhits"
value = 1
persistent = 0
ignorehitpause = 1

[State 3005, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(map(fireballhits) < 5, 3005, 3006)
ignorehitpause = 1

[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Move Var]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "rootstate"
value = root, stateno

[State 3005, Mode Var]
type = mapset
map = "dark"
trigger1 = !time
trigger1 = !prevstateno
trigger1 = root, map(dark)
value = 1

[State 3005, Anim]
type = changeanim
trigger1 = anim != 1005
trigger1 = anim != 1025
value = ifelse(ishelper(3025), 1025, 1005)

; Damage Scaling was here

[State 3005, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3000 || root, stateno = 3020
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3005, Time Var]
type = mapadd
trigger1 = !map(dark)
trigger1 = time > ifelse(prevstateno = 3005, 4, 0)
map = "fireballtime"
value = 1

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Angle]
type = angleset
trigger1 = ishelper(3005)
value = 0
ignorehitpause = 1

[State 3005, Angle]
type = angleset
trigger1 = ishelper(3025)
value = ifelse(root, const(size.xscale) < 1, 50, 43)
ignorehitpause = 1

[State 3005, Scale]
type = null
trigger1 = !map(dark)
trigger1 = ishelper(3005)
trigger1 = 1 || map(scale_x) := 1 - (map(fireballtime) * 0.0084)
trigger1 = 1 || map(scale_y) := 1 - (map(fireballtime) * 0.0167)
trigger2 = !map(dark)
trigger2 = ishelper(3025)
trigger2 = 1 || map(scale_x) := 1 - (map(fireballtime) * 0.0084)
trigger2 = 1 || map(scale_y) := 1 - (map(fireballtime) * 0.0167)
trigger3 = map(dark)
trigger3 = 1 || map(scale_x) := 1.00
trigger3 = 1 || map(scale_y) := 0.75
ignorehitpause = 1

[State 3005, Scale]
type = angledraw
trigger1 = 1
scale = map(scale_x), map(scale_y)
ignorehitpause = 1

[State 3005, Clsn Scale]
type = transformclsn
trigger1 = 1
scale = scale x, scale y
ignorehitpause = 1

[State 3005, Particles]
type = explod
trigger1 = map(dark)
trigger1 = !(gametime % 2)
anim = 4308
sprpriority = sprpriority
postype = p1
pos = ifelse(ishelper(3025), -24, -24), ifelse(ishelper(3025), 24, 0)
random = 32, 32
vel = -0.5 * vel x, -0.5 * vel y
accel = 0, 0
scale = 0.5, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
ownpal = 1

[State 3005, Vel Diagonal]
type = velset
trigger1 = 1
x = ifelse(map(dark), 6, 4) * cos(rad(-angle))
y = ifelse(map(dark), 6, 4) * sin(rad(-angle))

[State 3005, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 3005, lose hits]
type = mapadd
triggerall = time > ifelse(numtarget, 4, 0)
trigger1 = ishelper(3005)
trigger1 = map(fireballtime) >= (10 * map(fireballhits))
trigger2 = ishelper(3025)
trigger2 = map(fireballtime) >= (10 * map(fireballhits))
map = "fireballhits"
value = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3005, Hit]
type = hitdef
trigger1 = ishelper(3005)
trigger1 = time >= ifelse(numtarget, 4, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
priority = 4, Hit
attr = S, HP
damage = 36, 9
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
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(map(fireballhits) < 5, -10.52, -4.5), ifelse(map(fireballhits) < 5, 0, -6)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -4.5, -6
guard.velocity = -10.52
fall = (map(fireballhits) >= 5)
air.fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 3005, Hit]
type = hitdef
trigger1 = ishelper(3025)
trigger1 = time >= ifelse(numtarget, 4, 0)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 5)
priority = 4, Hit
attr = S, HP
damage = 36, 9
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
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(map(fireballhits) < 5, -10.52, -2), ifelse(map(fireballhits) < 5, 0, -8.5)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -2, -10
guard.velocity = -10.52
fall = (map(fireballhits) >= 5)
air.fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(map(fireballhits) < 5, 3005, 3006)
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = ishelper(3005)
trigger1 = map(fireballtime) >= 48
trigger2 = ishelper(3025)
trigger2 = map(fireballtime) >= 48
value = 3007

[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3006]
type = A
physics = N
movetype = I
anim = 1006
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, Scale]
type = angledraw
trigger1 = 1
scale = map(scale_x), 1.50 * map(scale_y)
ignorehitpause = 1

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3006, End]
type = destroyself
trigger1 = !animtime


[Statedef 3007]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 3007, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (25 * time), 256
ignorehitpause = 1

[State 3007, Shrink]
type = angledraw
trigger1 = time
scale = map(scale_x) * (1 - (time / 11.0)), map(scale_y)
ignorehitpause = 1

[State 3007, End]
type = destroyself
trigger1 = time >= 10


;========================<MvC HADOU KEN>=============================
[Statedef 3305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

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

[State 3305, Anim]
type = changeanim
trigger1 = anim != 3305
value = 3305

; Damage Scaling was here

[State 3305, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3301
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3305, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 0.5 + (0.125 * time)

[State 3305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3305, Angle]
type = angledraw
trigger1 = 1
value = ifelse(root, const(size.xscale) = 1, 43, 50)
ignorehitpause = 1

[State 3305, Vel Diagonal]
type = velset
trigger1 = 1
x = 6 * cos(ifelse(root, const(size.xscale) < 1, 0.281, 0.239) * pi)
y = -6 * sin(ifelse(root, const(size.xscale) < 1, 0.281, 0.239) * pi)

[State 3305, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3305, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 10)
priority = 4, Hit
attr = S, HP
damage = 46, 12
dizzypoints = 0
guard.dist = 320
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 8
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -2.5, -10
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.type = Low
air.velocity = -2.5, -10
fall = 1
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
forcestand = 1

[State 3305, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3306
ignorehitpause = 1

[State 3305, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 3306]
type = A
physics = N
movetype = I
anim = 4306
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 3306, Size Fix]
type = angledraw
trigger1 = 1
scale = 1, 0.5
ignorehitpause = 1
ignorehitpause = 1

[State 3306, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3306, End]
type = destroyself
trigger1 = !animtime


;========================<NEKKETSU HADOU KEN>=============================
[Statedef 4305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4305, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4306
ignorehitpause = 1

[State 4305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 4305, Anim]
type = changeanim
trigger1 = anim != 4305
value = 4305

; Damage Scaling was here

[State 4305, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 4300
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 4305, Vel]
type = velset
trigger1 = 1
x = 10
y = 0

[State 4305, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 0.5 + (0.125 * time)

[State 4305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4305, Dust]
type = explod
trigger1 = !(time % 6)
anim = 4309
ID = 4309
sprpriority = 3
postype = p1
pos = 0, -pos y + 6
scale = 0.75, 0.5

[State 4305, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 9, 0)
channel = 2
ignorehitpause = 1

[State 4305, Hit]
type = hitdef
trigger1 = !map(projcontact)
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
priority = 4, Hit
attr = S, HP
damage = 200, 50
dizzypoints = 0
guard.dist = 320
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 1 + 24
ground.velocity = -10, -6
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.type = Low
air.velocity = -10, -6
p2facing = 1
fall = 1
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
forcestand = 1

[State 4305, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 4306
ignorehitpause = 1

[State 4305, End]
type = destroyself
trigger1 = frontedgedist < -240 || backedgedist < -240


;----- Explode -----
[Statedef 4306]
type = A
physics = N
movetype = A
anim = 4306
velset = 0, 0
ctrl = 0
sprpriority = 3
movehitpersist = 1
hitcountpersist = 1

[State 4306, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4306, Flash]
type = bgpalfx
trigger1 = !time
time = 30
add = 128, 128, 128
sinadd = -128, -128, -128, 120

[State 4306, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 4306, Circle]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4390
ID = 4390
name = "Nekketsu Impact"
postype = p1
pos = -10, 0
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 4306, Fragment]
type = helper
trigger1 = numhelper(4310) < 9
trigger1 = time = [1, 9]
helpertype = normal
stateno = 4310
ID = 4310
name = "Nekketsu Fragment"
postype = p1
pos = -40 + (random % 20), -10 + (random % 20)
size.xscale = ifelse(random < 500, -0.5, 0.5) * 0.8333
size.yscale = ifelse(random < 500, -0.5, 0.5)
ownpal = 1

[State 4306, Fragment]
type = explod
trigger1 = time = [1, 9]
anim = 4310
sprpriority = -1
postype = p1
pos = -30, 0
random = 20, 20
vel = -5 + (random / 100.0), -5 + (random / 100.0)
ownpal = 1
scale = ifelse(random < 500, -0.33, 0.33) * 0.8333, ifelse(random < 500, -0.33, 0.33)
angle = 90 * (random % 4)

[State 4306, End]
type = destroyself
trigger1 = time >= 16
trigger1 = !numhelper(4310) || time >= 180


;========================<NEKKETSU FRAGMENT>=============================
[Statedef 4310]
type = S
physics = N
movetype = A
anim = 4310
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 4310, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4311
ignorehitpause = 1

[State 4310, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4310, Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = 5 + (random / 100.0)
y = -5 + (random / 100.0)

[State 4310, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4310, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 4310, Hit]
type = hitdef
trigger1 = !time
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
priority = 4, Hit
attr = S, HP
damage = 20, 5
dizzypoints = 0
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -10, -6
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30

[State 4310, Hit Medium Anim]
type = modifyhitdef
trigger1 = !time
trigger1 = p2, gethitvar(hitcount) % 2 = 1
animtype = Medium
fall.animtype = Medium

[State 4310, End]
type = destroyself
trigger1 = !animtime
trigger2 = frontedgedist < -40 || backedgedist < -40


;========================<HADOUKEN CHARGE>=============================
[Statedef 1002]
physics = N
velset = 0, 0
anim = 1002
sprpriority = 3

[State 1002, Bind]
type = bindtoroot
trigger1 = 1

[State 1002, Anim]
type = changeanim
trigger1 = time = 0 || animelemtime(3) >= 0
trigger1 = root, anim = 1000 && root, animelemtime(10) < 0
value = anim
elem = 1

[State 1002, Anim]
type = changeanim
triggerall = root, anim = 1000 && root, animelemtime(10) < 0
trigger1 = anim = 1002 && root, map(hadoucharge) != 0
trigger2 = anim = 1003 && root, map(hadoucharge) != 1
trigger3 = anim = 1004 && root, map(hadoucharge) != 2
value = ifelse((root, map(hadoucharge) = 0), 1002, ifelse((root, map(hadoucharge) = 1), 1003, 1004))

[State 1002, Anim]
type = changeanim
trigger1 = root, anim = 1000 && root, animelemtime(10) >= 0
value = ifelse((root, map(hadoucharge) = 0), 1002, ifelse((root, map(hadoucharge) = 1), 1003, 1004))
elem = 3

[State 1002, Anim]
type = changeanim
trigger1 = time = 0 || animelemtime(3) >= 0
trigger1 = root, anim = 1010 && root, animelemtime(4) < 0
value = 1004
elem = 1

[State 1002, Anim]
type = changeanim
trigger1 = root, anim = 1010 && root, animelemtime(4) >= 0
value = 1004
elem = 3

[State 1002, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1002, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 5

[State 1002, Sound]
type = stopsnd
trigger1 = !animtime
trigger2 = root, stateno != 1000 && root, stateno != 1010
trigger3 = root, anim = 1000 && root, animelemtime(11) >= 0
trigger4 = root, anim = 1010 && root, animelemtime(5) >= 0
trigger5 = root, movetype = H
channel = 5

[State 1002, End]
type = destroyself
trigger1 = !animtime
trigger2 = root, stateno != 1000 && root, stateno != 1010
trigger3 = root, anim = 1000 && root, animelemtime(11) >= 0
trigger4 = root, anim = 1010 && root, animelemtime(5) >= 0
trigger5 = root, movetype = H


;----- DIAGONAL -----
[Statedef 1024]
physics = N
velset = 0, 0
anim = 1024
sprpriority = 3

[State 1024, Bind]
type = bindtoroot
trigger1 = 1

[State 1024, Anim]
type = changeanim
triggerall = animelemtime(4) >= 0
trigger1 = root, anim = 1020 && root, animelemtime(10) < 0
trigger2 = root, anim = 1030 && root, animelemtime(10) < 0
value = 1024
elem = 1

[State 1024, Anim]
type = changeanim
trigger1 = root, anim = 1020 && root, animelemtime(10) >= 0
trigger2 = root, anim = 1030 && root, animelemtime(4) >= 0
value = 1024
elem = 4

[State 1024, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1024, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2

[State 1024, Sound]
type = stopsnd
trigger1 = !animtime
trigger2 = root, stateno != 1020 && root, stateno != 1030
trigger3 = root, anim = 1020 && root, animelemtime(11) >= 0
trigger4 = root, anim = 1030 && root, animelemtime(5) >= 0
trigger5 = root, movetype = H
channel = 2

[State 1024, End]
type = destroyself
trigger1 = !animtime
trigger2 = root, stateno != 1020 && root, stateno != 1030
trigger3 = root, anim = 1020 && root, animelemtime(11) >= 0
trigger4 = root, anim = 1030 && root, animelemtime(5) >= 0
trigger5 = root, movetype = H


;----- SHINKUU -----
[Statedef 3004]
physics = N
velset = 0, 0
anim = 3004
sprpriority = 3

[State 3004, Bind]
type = bindtoroot
trigger1 = 1

[State 3004, Anim]
type = changeanim
trigger1 = root, anim = 3000 && animelemtime(4) >= 0
trigger2 = root, anim = 4300 && animelemtime(4) >= 0
value = 3004
elem = 1

[State 3004, Anim]
type = changeanim
trigger1 = root, anim = 3001 && animelemtime(4) < 0
trigger2 = root, anim = 4301 && animelemtime(4) < 0
value = 3004
elem = 4

[State 3004, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3004, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 5

[State 3004, Sound]
type = stopsnd
trigger1 = root, stateno != 3000 || (root, anim != [3000, 3001])
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = !animtime
channel = 5

[State 3004, End]
type = destroyself
trigger1 = root, stateno != 3000 || (root, anim != [3000, 3001])
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = !animtime


;----- DIAGONAL SHINKUU -----
[Statedef 3024]
physics = N
velset = 0, 0
anim = 1024
sprpriority = 3

[State 3024, Bind]
type = bindtoroot
trigger1 = 1

[State 3024, Anim]
type = changeanim
trigger1 = root, anim = 3020 && animelemtime(4) >= 0
value = 1024
elem = 1

[State 3024, Anim]
type = changeanim
trigger1 = root, anim = 3021 && animelemtime(4) < 0
value = 1024
elem = 4

[State 3024, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3024, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 5

[State 3024, Sound]
type = stopsnd
trigger1 = root, stateno != 3020 || (root, anim != [3020, 3021])
trigger2 = !animtime
channel = 5

[State 3024, End]
type = destroyself
trigger1 = root, stateno != 3020 && (root, stateno != [3300, 3301])
trigger2 = root, anim != [3020, 3021]
trigger3 = !animtime


;----- NEKKETSU -----
[Statedef 4304]
physics = N
velset = 0, 0
anim = 4304
sprpriority = 3

[State 4304, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((root, anim = 4300), -18, 3), ifelse((root, anim = 4300), -63, -55)

[State 4304, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4304, Angle]
type = angleadd
trigger1 = 1
value = 6

[State 4304, Angle]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[State 4304, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 5

[State 4304, Sound]
type = stopsnd
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = root, anim = 4301 && root, animelemtime(2) >= 0
channel = 5

[State 4304, End]
type = destroyself
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = root, anim = 4301 && root, animelemtime(2) >= 0


;========================<HADOUKEN INTRO>=============================
[Statedef 1003]
physics = N
velset = 0, 0
anim = 1002
sprpriority = 3

[State 1003, Bind]
type = bindtoroot
trigger1 = root, animelemtime(29) < 0

[State 1003, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(29) < 0
trigger1 = animelemtime(3) >= 0
value = 1002
elem = 1

[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(28) >= 0 && root, animelemtime(29) < 0
value = 1002
elem = 3

[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(29) >= 0
value = 1005
persistent = 0

[State 1003, Bind]
type = posadd
trigger1 = anim = 1005
x = 86 * (root, const(size.xscale))
y = -54
persistent = 0

[State 1003, Vel]
type = velset
trigger1 = anim = 1005
x = (p2dist x - 31) / 16.0
y = 0
persistent = 0

[State 1003, Anim]
type = changeanim
trigger1 = anim = 1005 && numenemy
trigger1 = (p2, animelemtime(23) >= 0)
value = 1006
persistent = 0

[State 1003, Vel]
type = velset
trigger1 = anim = 1006
x = 0
y = 0

[State 1003, Sound]
type = playsnd
trigger1 = anim = 1006
value = 2, 7
persistent = 0

[State 1003, Shrink]
type = angledraw
trigger1 = anim = [1005, 1006]
scale = 0.5, 0.4
ignorehitpause = 1

[State 1003, Shrink]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1003, Sound]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 5

[State 1003, Sound]
type = stopsnd
trigger1 = root, stateno != 352
trigger2 = !animtime
trigger2 = anim = 1006
channel = 5

[State 1003, End]
type = destroyself
trigger1 = root, stateno != 352
trigger2 = !animtime
trigger2 = anim = 1006
trigger3 = roundstate >= 2


;========================<NEKKETSU IMPACT>=============================
[Statedef 4390]
physics = N
velset = 0, 0
anim = 9999

[State 4390, Slow Motion Flag]
type = varset
trigger1 = !time
trigger1 = parent, numtarget
var(0) = 1

[State 4390, Slow Motion]
type = pause
trigger1 = var(0)
trigger1 = time < 16
time = ifelse(time < 8, 2, 1)

[State 4390, Circle]
type = explod
trigger1 = !time
anim = 4390
ID = 4390
sprpriority = 3
postype = p1
vel = 1, 0
pausemovetime = 255
supermovetime = 255

[State 4390, Shrink]
type = modifyexplod
trigger1 = numexplod(4390)
ID = 4390
trans = addalpha
alpha = 256 - (16 * time), 256
scale = 0.04 + (0.03 * time), 0.20 + (0.15 * time)

[State 4390, End]
type = removeexplod
trigger1 = time >= 16

[State 4390, End]
type = destroyself
trigger1 = !numexplod(4390)


;========================<DUST>=============================
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
vel = ((rootdist x -10) / 32.0), ((rootdist y -63) / 32.0)
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


;========================<CUSTOM COMBO PAUSE=============================
[Statedef 7260]
type = A
physics = N
movetype = I
anim = 7260
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 7260, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = time <= 25
time = 1
mul = 128, 128, 128

[State 7260, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 7260, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7260, Scale]
type = angledraw
trigger1 = time < 8
scale = 0.0556 * (time + 1), 0.0556 * (time + 1)

[State 7260, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5

[State 7260, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256

[State 7260, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7260, Lines]
type = explod
trigger1 = !time
anim = 7261
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
removetime = 16
supermovetime = -1

[State 7260, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 3, 64 * (time + 1), 256), 256

[State 7260, Circle]
type = explod
trigger1 = time = 16
anim = 7262
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 7260, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7260, Safety]
type = removeexplod
trigger1 = time >= 26

[State 7260, End]
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


;========================<SUPER FINISH>=============================
[Statedef 8600]
type = A
velset = 0, 0
anim = 9999

[State 8600, Kanji]
type = helper
trigger1 = !time
trigger1 = root, stateno = [4011, 4012]
helpertype = normal
stateno = 8690
ID = 8690
name = "Haru Kanji"
postype = left
pos = 0, floor((gameheight / gamewidth) * 80) - 60
ownpal = 1

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 7, ifelse((root, stateno = [4011, 4012]), 7, 6)
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
trigger1 = root, map(superfinish) = 3000 || root, map(superfinish) = 3020
var(0) = 2

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3100
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3200 || root, map(superfinish) = 4200
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [4100, 4110]
var(0) = 5

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4300
var(0) = 6

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3300
var(0) = 7

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


;========================<HARU KANJI>=============================
[Statedef 8690]
type = A
physics = N
anim = 9999

[State 8690, Kanji]
type = explod
trigger1 = !time
anim = 8690
ID = 8690
sprpriority = -5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
bindtime = -1
removetime = 60

[State 8690, Shrink]
type = modifyexplod
trigger1 = numexplod(8690)
trigger1 = time < 6
ID = 8690
scale = (5.5 - time) * (1.3333333 * gameheight / gamewidth), (5.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 8690, Shrink]
type = modifyexplod
trigger1 = numexplod(8690)
trigger1 = time >= 6
ID = 8690
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 - 8 * (time - 6)), 256

[State 8690, Safety]
type = removeexplod
trigger1 = time >= 38

[State 8690, End]
type = destroyself
trigger1 = time && !numexplod(8690)


;==========<KEI INTRO>==========
[Statedef 6000]
type = S
physics = N
anim = 6000
sprpriority = -1

[State 6000, offset]
type = offset
trigger1 = 1
y = -5

[State 6000, Anim]
type = changeanim
trigger1 = anim = 6000
trigger1 = animelemtime(2) < 0
trigger1 = root, stateno = 354
trigger1 = root, animelemtime(4) < -1
value = 6000
elem = 1

[State 6000, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 6000
value = 6001

[State 6000, steps]
type = playsnd
trigger1 = anim = 6001
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6000, Turn]
type = turn
trigger1 = anim = 6001
persistent = 0

[State 6000, Vel]
type = velset
trigger1 = anim = 6001
x = 8

[State 6000, Sound]
type = playsnd
trigger1 = anim = 6000 && animelem = 6
value = 6, 0
channel = 0

[State 6000, Sound]
type = playsnd
trigger1 = anim = 6000 && animelem = 13
value = 6, 1
channel = 0

[State 6000, Sound]
type = playsnd
trigger1 = anim = 6001
value = 6, 2
channel = 0
persistent = 0

[State 6000, End]
type = destroyself
trigger1 = anim = 6001
trigger1 = frontedgedist < -50
trigger2 = time >= 600


;==========<KEI WIN POSE 1 - TRIP>==========
[Statedef 6002]
type = S
physics = N
anim = 6002
sprpriority = 2

[State 6002, Offset]
type = offset
trigger1 = 1
y = 5

[State 6002, Steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6002, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6002, Anim]
type = changeanim
trigger1 = anim = 6002
trigger1 = rootdist x <= 200
value = 6003

[State 6002, Sound]
type = playsnd
trigger1 = anim = 6003
value = 6, 1
channel = 0
persistent = 0

[State 6002, Sound]
type = playsnd
trigger1 = anim = 6003 && animelem = 3
value = 5, 3

[State 6002, Dust]
type = explod
trigger1 = anim = 6003 && animelem = 3
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 36
ownpal = 1
scale = 0.5, 0.5

[State 6002, Shake]
type = envshake
trigger1 = anim = 6003 && animelem = 3
time = 12
freq = 180
ampl = 2

[State 6002, Type]
type = statetypeset
trigger1 = anim = 6003
trigger1 = animelem = 3
statetype = L
physics = C


;==========<KEI WIN POSE 2 - DANCE>==========
[Statedef 6004]
type = S
physics = N
anim = 6002
sprpriority = 2

[State 6004, Steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6004, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6004, Anim]
type = changeanim
trigger1 = anim = 6002
trigger1 = rootdist x <= 125
value = 6004

[State 6004, Anim]
type = changeanim
trigger1 = anim = 6004
trigger1 = root, stateno = 182
trigger1 = root, anim = 182
value = 6004
elem = root, animelemno(0)

[State 6004, Anim]
type = turn
trigger1 = anim = 6004
persistent = 0

[State 6004, Type]
type = statetypeset
trigger1 = anim = 6004
physics = S


;==========<KEI SHUN GOKU SATSU>==========
[Statedef 6010]
type = S
physics = N
anim = 6002
sprpriority = -1

[State 6010, Sound]
type = playsnd
trigger1 = !time
value = 6, 0
channel = 0
persistent = 0

[State 6010, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6010, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6010, Anim]
type = changeanim
trigger1 = anim = 6002
trigger1 = root, stateno = 4010
trigger1 = root, animelemtime(2) < 0 && rootdist x <= 90
value = 6010

[State 6010, grabsnd]
type = playsnd
trigger1 = anim = 6010
value = 2, 800
persistent = 0

[State 6010, Vel]
type = velset
trigger1 = anim = 6010
x = 0
persistent = 0

[State 6010, Bind]
type = bindtoroot
trigger1 = anim = 6010
trigger1 = root, stateno = 4010
trigger1 = root, animelemtime(8) < 0
pos = 65 * root, const(size.xscale), 0

[State 6010, Bind]
type = bindtoroot
trigger1 = anim = 6010 && root, stateno = 4010
trigger1 = root, animelemtime(8) >= 0
pos = 90 * root, const(size.xscale), 0

[State 6010, Palfx]
type = palfx
trigger1 = root, animelemtime(10) = 0
trigger2 = root, animelemtime(14) = 0
trigger3 = root, animelemtime(18) = 0
add = 0, 0, 0
sinadd = -255, -255, -255, 80
time = 20

[State 6010, Palfx]
type = palfx
trigger1 = root, time <= 1
trigger1 = root, stateno != 4010
time = 1

[State 6010, End]
type = changestate
trigger1 = anim = 6010
trigger1 = root, stateno != [4010, 4011]
value = 6011

[State 6010, End]
type = changestate
trigger1 = anim = 6010
trigger1 = root, stateno = 4011
value = 6012


;--- Holding Enemy ---
[Statedef 6011]
type = S
physics = N
anim = 6002
sprpriority = -2

[State 6011, Sound]
type = playsnd
trigger1 = !time
value = 6, 2
channel = 0
persistent = 0

[State 6011, Turn]
type = turn
trigger1 = !time

[State 6011, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6011, Vel]
type = velset
trigger1 = 1
x = 8

[State 6011, End]
type = destroyself
trigger1 = frontedgedist < -50
trigger2 = time >= 300


;--- Run away scared ---
[Statedef 6012]
type = S
physics = N
anim = 6012
sprpriority = -5

[State 6012, Vel]
type = velset
trigger1 = anim = 6012
x = 0

[State 6012, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 6012
value = 6002

[State 6012, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, ifelse((animelem = 2), 103, 106)

[State 6012, Turn]
type = turn
trigger1 = anim = 6002
persistent = 0

[State 6012, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6012, Sound]
type = playsnd
trigger1 = anim = 6012 && animelem = 5
value = 6, 1
channel = 0

[State 6012, Sound]
type = playsnd
trigger1 = anim = 6002
value = 6, 2
channel = 0
persistent = 0

[State 6012, End]
type = destroyself
trigger1 = anim = 6002
trigger1 = frontedgedist < -50
trigger2 = time >= 300


;========================<WIN POSE SHOE>=============================
[Statedef 6091]
physics = N
velset = 0, 0
anim = 6091
sprpriority = 2

[State 6091, Vel]
type = velset
trigger1 = time = 1
x = -(rootdist x -4) / -68.0
y = -5

[State 6091, Accel]
type = veladd
trigger1 = time
y = 0.15

[State 6091, Vel]
type = velset
trigger1 = anim = 6091 && vel y > 0 && rootdist y <= 90
x = 1.5 * vel x
y = -.5 * vel y
persistent = 0

[State 6091, Anim]
type = changeanim
trigger1 = anim = 6091
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6092

[State 6091, Pos]
type = posset
trigger1 = anim = 6092
y = 0

[State 6091, Vel]
type = velset
trigger1 = anim = 6092
x = 0
y = 0

[State 6091, Dust]
type = explod
trigger1 = anim = 6092
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.25, 0.25
ownpal = 1
persistent = 0


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
