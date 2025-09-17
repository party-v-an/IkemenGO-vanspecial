; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 5, ifelse(map(strength) = 1, 4.17, 3.33))
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
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
priority = 4, Hit
attr = S, SP
damage = 60, 15
dizzypoints = 50 * !(root, map(customcombo))
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
air.velocity = -0.75 * vel x, -6
yaccel = 0.4850
fall = 0;var(1) <= 12
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1006
ignorehitpause = 1

[State 1005, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


;----- Hitpause -----
[Statedef 1006]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1006, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1006, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1006, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = 2, ifelse(numtarget, 7, 0)
channel = 2
ignorehitpause = 1

[State 1006, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1000
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1006, End]
type = changestate
trigger1 = time >= 0
value = 1007


;----- Disappear -----
[Statedef 1007]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1007, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1007, End]
type = destroyself
trigger1 = !animtime


;========================<SHAKUNETSU HADOU KEN>=============================
[Statedef 1025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1025, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 1025, Anim]
type = changeanim
trigger1 = anim != 1025
value = 1025

[State 1025, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1026
ignorehitpause = 1

[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 6, ifelse(map(strength) = 1, 5, 4))
y = 0

[State 1025, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 3)
ID = 1025
priority = 4, Hit
attr = S, SP
damage = ifelse(map(strength) = 2, 37, ifelse(map(strength) = 1, 43, 60)), ifelse(map(strength) = 2, 9, ifelse(map(strength) = 1, 11, 15))
dizzypoints = ifelse(map(strength) = 2, 34, ifelse(map(strength) = 1, 75, 200)) * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18; + 2 * map(counterhit_buffer)
ground.slidetime = 18
ground.velocity = -4.0, -5.25
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -4.0, -5.25
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
palfx.time = 60
palfx.color = 0
palfx.mul = 256, 96, 0
palfx.sinadd = 128, 128, 128, 4
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1025, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1026

[State 1025, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


;----- Hitpause -----
[Statedef 1026]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1026, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1026, Total Hits]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1026, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit && !prevstateno, 50, 25) * root, map(meterscaling)
ignorehitpause = 1

[State 1026, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1025)
trigger1 = target(1025), hitfall
trigger1 = target(1025), selfanimexist(7697)
trigger1 = target(1025), stateno = 5000 || target(1025), stateno = 5010 || target(1025), stateno = 5020
value = 7697
ID = 1025
ignorehitpause = 1

[State 1026, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = 2, ifelse(numtarget, 12, 0)
channel = 2
ignorehitpause = 1

[State 1026, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1020
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1026, End]
type = changestate
trigger1 = var(2) >= (map(strength) + 1)
value = 1027

[State 1026, Hit More]
type = changestate
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = var(2) < (map(strength) + 1)
value = 1025


;----- Disappear -----
[Statedef 1027]
type = A
physics = N
movetype = I
anim = 1026
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1027, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1027, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1027, End]
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

[State 1055, Vel]
type = velset
trigger1 = 1
;x = ifelse(map(strength) = 2, 5.7, ifelse(map(strength) = 1, 4.3, 2.9))
;y = ifelse(map(strength) = 2, 4, ifelse(map(strength) = 1, 3, 2))
;x = ifelse(map(strength) = 2, 4.15, ifelse(map(strength) = 1, 3.46, 2.76))
;y = ifelse(map(strength) = 2, 2.80, ifelse(map(strength) = 1, 2.32, 1.86))
x = ifelse(map(strength) = 2, 4.33, ifelse(map(strength) = 1, 3.98, 3.54))
y = ifelse(map(strength) = 2, 2.50, ifelse(map(strength) = 1, 3.03, 3.54))

[State 1055, Angle]
type = angleset
trigger1 = 1
value = atan(vel y / vel x) * (-180 / pi)

[State 1055, Angle]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 1055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 1055, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 1055
priority = 4, Hit
attr = A, SP
damage = 40, 10
dizzypoints = 50 * !(root, map(customcombo))
guard.dist = const(size.proj.attack.dist)
animtype = Medium
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 8
sparkno = -1 + 0 * (map(sparkno) := 8013)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = High
ground.hittime = 1 + 15; + 2 * map(counterhit_buffer)
ground.slidetime = 15
ground.velocity = -7.51, 0
guard.velocity = -7.51
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.velocity = -1.0 * vel x, -1.5
yaccel = 0.4850
down.hittime = 15
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1055, Hit Low]
type = modifyhitdef
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low
air.type = Low

[State 1055, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 1056
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = pos y >= 0
value = 1058
ignorehitpause = 1

[State 1055, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


;----- Hitpause -----
[Statedef 1056]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1056, Angle]
type = angledraw
trigger1 = 1

[State 1056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1056, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1056, Getpower]
type = poweradd
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50) * root, map(meterscaling)
ignorehitpause = 1

[State 1056, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = !time
trigger1 = movecontact
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 1056, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 1050
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 1056, End]
type = changestate
trigger1 = time >= 0
value = 1057


;----- Disappear -----
[Statedef 1057]
type = A
physics = N
movetype = I
anim = 3056
velset = 0, 0
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1057, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 1057, Angle]
type = angledraw
trigger1 = 1

[State 1057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1057, End]
type = destroyself
trigger1 = !animtime


;--- Hit floor ---
[Statedef 1058]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 1058, Angle]
type = angleset
trigger1 = !time
value = 0

[State 1058, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1058, Pos]
type = posset
trigger1 = 1
y = 0

[State 1058, Sound]
type = playsnd
trigger1 = !time
value = 5, 3

[State 1058, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
pos = 0, 0
ownpal = 1
scale = 0.5, 0.5

[State 1058, End]
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

[State 3005, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3006
ignorehitpause = 1

[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
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

; Damage Scaling was here

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse(map(strength) = 2, 8.0, ifelse(map(strength) = 1, 6.5, 5.0))
y = 0

[State 3005, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 3005, Last Hit Flag]
type = mapset
trigger1 = 1
map = "fireball_lasthit"
value = var(2) >= 7

[State 3005, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 8)
ID = 3005
priority = 4, Hit
attr = S, HP
damage = 28, 7
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
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(map(fireball_lasthit), -6.25, -10.52), ifelse(map(fireball_lasthit), -5.25, 0)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -6.25, -5.25
yaccel = 0.4850
guard.velocity = -10.52
fall = map(fireball_lasthit)
air.fall = 1
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
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 3005, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3006

[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


;----- Hitpause -----
[Statedef 3006]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3006, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3006, Total Hits]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3006, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3005)
trigger1 = target(3005), hitfall
trigger1 = target(3005), selfanimexist(7697)
trigger1 = target(3005), stateno = 5000 || target(3005), stateno = 5010 || target(3005), stateno = 5020
value = 7697
ID = 3005
ignorehitpause = 1

[State 3006, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = 2, ifelse(numtarget, 12, 0)
channel = 2
ignorehitpause = 1

[State 3006, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3000
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3006, End]
type = changestate
trigger1 = map(fireball_lasthit)
value = 3007

[State 3006, Hit More]
type = changestate
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = !map(fireball_lasthit)
value = 3005


;----- Disappear -----
[Statedef 3007]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3007, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3007, End]
type = destroyself
trigger1 = !animtime


;========================<MESSATSU GOHADO AGYO>=============================
[Statedef 3025]
type = S
physics = N
movetype = A
anim = 3025
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3025, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3026
ignorehitpause = 1

[State 3025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 3025, Vel]
type = velset
trigger1 = !vel x
trigger1 = rootdist y >= 75
x = 6 + (random / 500.0)
y = -(random / 500.0)

[State 3025, Vel]
type = velset
trigger1 = !vel x
trigger1 = rootdist y < 75
x = 6 + (random / 500.0)
y = (random / 500.0)

[State 3025, Angle]
type = angleset
trigger1 = 1
value = atan(vel y / vel x) * (-180 / pi)

[State 3025, Angle]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 3025, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 0.5 + (0.125 * time)

[State 3025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 3025, Hit High]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 18)
ID = 3025
priority = 4, Hit
attr = S, HP
damage = 18, 5
dizzypoints = 0
guard.dist = 320
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -0.75 * vel x, -6
down.hittime = 18
down.velocity = 0, 0
yaccel = 0.4850
fall = 0;var(1) <= 12
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 3025, Hit Low]
type = modifyhitdef
;trigger1 = random < 500
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low

[State 3025, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3026
ignorehitpause = 1

[State 3025, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= -12
value = 1058
ignorehitpause = 1

[State 3025, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


;----- Hitpause -----
[Statedef 3026]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3026, Angle]
type = angledraw
trigger1 = 1

[State 3026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3026, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3026, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3026, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = [3021, 3022]
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3026, End]
type = changestate
trigger1 = time >= 0
value = 3027


;----- Disappear -----
[Statedef 3027]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3027, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3027, Angle]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 3027, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 3027, End]
type = destroyself
trigger1 = !animtime


;========================<TENMA GOU ZANKUU>=============================
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3055, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3056
ignorehitpause = 1

[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = mapset
trigger1 = !time
trigger1 = !prevstateno
map = "strength"
value = root, map(strength)

[State 3055, Anim]
type = changeanim
trigger1 = anim != 3055
value = 3055

; Damage Scaling was here

[State 3055, Vel]
type = velset
trigger1 = 1
;x = ifelse(map(strength) = 2, 6.63, ifelse(map(strength) = 1, 5.39, 4.15))
;y = ifelse(map(strength) = 2, 4.47, ifelse(map(strength) = 1, 3.63, 2.80))
x = ifelse(map(strength) = 2, 6.37, ifelse(map(strength) = 1, 5.66, 4.87))
y = ifelse(map(strength) = 2, 4.87, ifelse(map(strength) = 1, 5.66, 6.37))

[State 3055, Angle]
type = angleset
trigger1 = 1
value = atan(vel y / vel x) * (-180 / pi)

[State 3055, Angle]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 3055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 8)
ID = 3055
priority = 4, Hit
attr = A, HP
damage = 25, 6
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
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6.25, 4.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -6.25, 4.5
yaccel = 0.4850
down.hittime = 18
down.velocity = 0, 0
fall = 1
air.fall = 1
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
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 3055, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3056

[State 3055, End]
type = changestate
trigger1 = pos y >= 0
value = 3058

[State 3055, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


;----- Hitpause -----
[Statedef 3056]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3056, Angle]
type = angledraw
trigger1 = 1

[State 3056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3056, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3056, Total Hits]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3056, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3055)
trigger1 = target(3055), hitfall
trigger1 = target(3055), selfanimexist(7697)
trigger1 = target(3055), stateno = 5000 || target(3055), stateno = 5010 || target(3055), stateno = 5020
value = 7697
ID = 3055
ignorehitpause = 1

[State 3056, HitSound]
type = playsnd
trigger1 = !time
trigger1 = movehit
value = 2, ifelse(numtarget, 12, 0)
channel = 2
ignorehitpause = 1

[State 3056, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3050
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3056, End]
type = changestate
trigger1 = var(2) >= 8
value = 3057

[State 3056, Hit More]
type = changestate
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = var(2) < 8
value = 3055


;----- Disappear -----
[Statedef 3057]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3057, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3057, Angle]
type = angledraw
trigger1 = 1

[State 3057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3057, End]
type = destroyself
trigger1 = !animtime


;--- Hit floor ---
[Statedef 3058]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 3

[State 3058, Angle]
type = angleset
trigger1 = !time
value = 0

[State 3058, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3058, Pos]
type = posset
trigger1 = 1
y = 0

[State 3058, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 3
ignorehitpause = 1
persistent = 0

[State 3058, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
postype = p1
pos = 0, 0
ownpal = 1
scale = 0.5, 0.5
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 3058, End]
type = destroyself
trigger1 = !animtime


;========================<TENMA GOU ZANKUU>=============================
[Statedef 3075]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3075, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3076
ignorehitpause = 1

[State 3075, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

; Damage Scaling was here

[State 3075, vel1]
type = velset
trigger1 = !time
trigger1 = (rootdist y > 48)
x = 6 + random / 500.0
y = 3 + random / 500.0

[State 3075, vel2]
type = velset
trigger1 = !time
trigger1 = (rootdist y <= 48)
x = 4 + random / 500.0
y = 5 + random / 500.0

[State 3075, Angle]
type = angleset
trigger1 = 1
value = atan(vel y / vel x) * (-180 / pi)

[State 3075, Angle]
type = angledraw
trigger1 = 1
scale = 1, 1

[State 3075, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 3075, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 3075, Hit High]
type = hitdef
trigger1 = 1
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 18)
ID = 3075
priority = 4, Hit
attr = A, HP
damage = 18, 5
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 0), map(sparky) := 0
hitsound = -1; root
guardsound = -1; root
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -6.25, 4.5
yaccel = 0.4850
down.hittime = 18
down.velocity = 0, 0
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
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 3075, Hit Low]
type = modifyhitdef
trigger1 = p2dist y < -(p2, const(size.head.pos.y) / 2)
ground.type = Low
air.type = Low
air.animtype = Hard
fall.animtype = Hard

[State 3075, Connected]
type = changestate
trigger1 = movecontact || movereversed
value = 3076
ignorehitpause = 1

[State 3075, End]
type = changestate
trigger1 = pos y >= 0
value = 1058
ignorehitpause = 1

[State 3075, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


;----- Hitpause -----
[Statedef 3076]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 3076, Angle]
type = angledraw
trigger1 = 1

[State 3076, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3076, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 3076, HitSound]
redirectID = root, ID
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
abspan = ceil(pos x)
persistent = 0
ignorehitpause = 1

[State 3076, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 3070
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 3076, End]
type = changestate
trigger1 = time >= 0
value = 3077


;----- Disappear -----
[Statedef 3077]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3077, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = hitoverridden || prevmovetype = H
value = 2, 0
channel = 2
volumescale = 33

[State 3077, Angle]
type = angledraw
trigger1 = 1

[State 3077, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3077, End]
type = destroyself
trigger1 = !animtime


;========================<KONGOU KOKURETSU ZAN>=============================
;----- LIGHTNING -----
[Statedef 4205]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
anim = 4205
sprpriority = 3

[State 4205, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4205
ignorehitpause = 1

[State 4205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4205, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

; Damage Scaling was here

[State 4205, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 4200
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 4205, Hit]
type = hitdef
trigger1 = animelem = 1
air.juggle = 0 * (map(juggle_start) := 0 || map(juggle_increase) := 0 || map(juggle_limit) := 99)
attr = S, HP
damage = 120, 30
dizzypoints = 0
guard.dist = 320
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 30), map(sparky) := (p2dist y + 0.5 * p2, const(size.head.pos.y))
hitsound = s2, 8
guardsound = s2, 0
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(frontedgedist < backedgedist, 4, -4), -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.type = Low
air.velocity = ifelse(frontedgedist < backedgedist, 4, -4), -4
yaccel = 0.4850
down.velocity = ifelse(frontedgedist < backedgedist, 4, -4), -4
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
;no envshake

[State 4205, End]
type = destroyself
trigger1 = !animtime


;----- SHOCKWAVES -----
[Statedef 4206]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 4206, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4206
ignorehitpause = 1

[State 4206, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4206, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 4206, Anim]
type = changeanim
trigger1 = anim != 4206
value = 4206

; Damage Scaling was here

[State 4206, ProjContact]
type = null
trigger1 = movecontact = 1
trigger1 = p2, gethitvar(frame)
trigger1 = p2, gethitvar(ID) = ID || movehitvar(ID) = p2, ID
trigger1 = 1 || map(projcontact) := 1
trigger1 = root, stateno = 4200
trigger1 = root, map(projcontact) := 1
ignorehitpause = 1

[State 4206, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 8, 0)
channel = 2
ignorehitpause = 1

[State 4206, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 9)
attr = S, HP
damage = 30, 8
dizzypoints = 0
guard.dist = 320
animtype = Hard
fall.animtype = Up
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 0, 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 100), map(sparky) := (p2dist y + 0.5 * p2, const(size.head.pos.y))
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse((animelem = 9), -12, -4), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.velocity = -3, -12
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
ID = 4206 + (facing = -1)
nochainID = 4207 -(facing = -1)
p1sprpriority = sprpriority
forcestand = 1
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)
;no envshake

[State 4206, End]
type = destroyself
trigger1 = !animtime


;========================<KKZ GROUND IMPACT>=============================
[Statedef 4210]
type = C
physics = N
movetype = A
ctrl = 0
anim = 4210

[State 4210, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 4210
ignorehitpause = 1

[State 4210, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4210, Hit]
type = hitdef
trigger1 = !time
air.juggle = 0 * (map(juggle_start) := 0 || map(juggle_increase) := 0 || map(juggle_limit) := 1)
attr = S, HP
hitflag = H-
guardflag = L
priority = 1, Miss
damage = 0, 0
dizzypoints = 0
guardpoints = 0
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Trip
air.type = Trip
ground.hittime = 1 + 12
ground.slidetime = 12
air.hittime = 120
ground.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -1.0, -8.0
air.cornerpush.veloff = 0
yaccel = 0.695
fall = 1
fall.recover = 0
down.recover = 1
forcestand = 1
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := -1)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := -1)
sparkxy = -10, 0
numhits = 0

[State 4210, Idle]
type = statetypeset
trigger1 = time
movetype = I

[State 4210, End]
type = destroyself
trigger1 = time >= 16


;========================<TENSHOU KAIREKI JIN>=============================
[Statedef 4305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 4305, Override]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4305
ignorehitpause = 1

[State 4305, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (gametime % 3), 256
ignorehitpause = 1

[State 4305, Pos]
type = posset
trigger1 = 1
y = 0

[State 4305, Vel]
type = velmul
trigger1 = 1
x = 0.95

[State 4305, Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = 0;4
y = 0

[State 4305, Vel]
type = posadd
trigger1 = animelem = 2 || animelem = 3
x = 10

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

[State 4305, HitSound]
type = playsnd
trigger1 = movehit = 1 || movereversed = 1
value = 2, ifelse(numtarget, 11, 0)
channel = 2
ignorehitpause = 1

[State 4305, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10
trigger2 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 10)
attr = S, HP
damage = 28, 7
dizzypoints = 0
guard.dist = 320
animtype = Hard
fall.animtype = Up
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8024)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 30), map(sparky) := (p2dist y + 0.5 * p2, const(size.head.pos.y))
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x < 0, -1.0, 1.0), -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = ifelse(p2dist x < 0, -1.0, 1.0), -7.5
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)

[State 4305, Hit Final]
type = hitdef
trigger1 = animelem = 12
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 10)
attr = S, HP
damage = 28, 7
dizzypoints = 0
guard.dist = 320
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 12
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -30) * (map(sparkx.max) := 30), map(sparky) := (p2dist y + 0.5 * p2, const(size.head.pos.y))
;postype = p2; pos = (target, const(size.ground.front) - 30), (target, const(size.mid.pos.y))
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -2, -7.5
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
air.velocity = -2, -7.5
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
forcestand = 1
palfx.time = 60
palfx.color = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = root, map(palfx1_r), root, map(palfx1_g), root, map(palfx1_b)

[State 4305, End]
type = destroyself
trigger1 = !animtime


;========================<TENMA SHINZUI WARI F.X.>=============================
[Statedef 3305]
physics = N
velset = 0, 0
anim = 3305
sprpriority = 3

[State 3305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3305, Bind]
type = bindtoroot
trigger1 = root, anim = 3300
ignorehitpause = 1

[State 3305, End]
type = destroyself
trigger1 = !animtime || root, stateno != 3300 || root, movetype = H


;========================<MISOGI CAMERA>=============================
[Statedef 4199]
physics = N
velset = 0, 0
anim = 9999

[State 4199, Screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 4199, Accel]
type = posadd
trigger1 = time > 0
x = rootdist x * 0.05
y = rootdist y * ifelse(rootdist y < 0, 0.5, 0.05)

[State 4199, End]
type = destroyself
trigger1 = root, movetype = H
trigger2 = root, stateno != 4100


;========================<AURA>=============================
[Statedef 6000]
physics = N
velset = 0, 0
anim = 6000

[State 6000, Var]
type = varset
trigger1 = !time
var(0) = parent, anim

[State 6000, Bind]
type = bindtoparent
trigger1 = 1

[State 6000, Layering]
type = sprpriority
trigger1 = sprpriority > parent, sprpriority
value = parent, sprpriority

[State 6000, Fade in]
type = trans
trigger1 = time < 4
trans = addalpha
alpha = 64 * (time + 1), 256
ignorehitpause = 1

[State 6000, Particles]
type = explod
trigger1 = 1 || map(particle_x) := (-40 + random / 13.33)
ID = 6005
anim = 6005
postype = p1
pos = map(particle_x), -65 - 25 * cos(map(particle_x) / 40.0 * pi); follow aura outline
random = 0, 0
vel = 0.01 * map(particle_x), -1
accel = 0, -0.1
sprpriority = parent, sprpriority + 1
removetime = 20
scale = 0.33, 0.33
angle = 15 * (random % 24)
pausemovetime = p2, pausetime
supermovetime = p2, pausetime

[State 6000, End]
type = changestate
trigger1 = var(0) = 192
trigger1 = parent, stateno = 192 && parent, animelemtime(26) >= 0
trigger2 = var(0) = 195
trigger2 = parent, stateno = 195 && parent, animelemtime(19) >= 0
value = 6001

[State 6000, End]
type = destroyself
trigger1 = parent, anim != var(0)
trigger2 = parent, stateno = 1020 && parent, animelemtime(9) >= 0
trigger3 = parent, stateno = 1400 && parent, animelemtime(6) >= 0
trigger4 = parent, stateno = 3020
trigger4 = parent, anim = 3020 && parent, animelemtime(22) >= 0
trigger5 = parent, stateno = 188
trigger5 = parent, anim = 188 && parent, animelemtime(39) >= 0


;--- Fade out ---
[Statedef 6001]
physics = N
velset = 0, 0

[State 6001, Layering]
type = sprpriority
trigger1 = sprpriority > parent, sprpriority
value = parent, sprpriority

[State 6001, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (32 * time), 256
ignorehitpause = 1

[State 6001, Var]
type = varset
trigger1 = !time
var(0) = parent, anim

[State 6001, Afterimage]
type = afterimagetime
trigger1 = !time
value = 0

[State 6001, End]
type = destroyself
trigger1 = time >= 8


;========================<METSU>=============================
[Statedef 6002]
physics = N
anim = 6002
velset = 0, -0.5
sprpriority = -1

[State 6002, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128, 256
ignorehitpause = 1

[State 6002, Afterimage]
type = afterimage
trigger1 = !time
time = 300
timegap = 1
framegap = 1
length = 2
palcolor = 256
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.618, 0.618, 0.618
trans = add

[State 6002, Vel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = -0.25

[State 6002, Bind]
type = posset
trigger1 = parent, stateno = 195
trigger1 = parent, movetype != H
x = parent, pos x + ifelse(parent, facing = -1, 5, -5)

[State 6002, End]
type = destroyself
trigger1 = !animtime
trigger2 = parent, movetype = H


;========================<KKZ AURA>=============================
[Statedef 4203]
physics = N
anim = 4203
velset = 0, 0
sprpriority = 0

[State 4203, Bind]
type = bindtoparent
trigger1 = 1
pos = 0, 0

[State 4203, Layer]
type = sprpriority
trigger1 = 1
value = parent, sprpriority + 1

[State 4203, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4203, Afterimage]
type = afterimage
trigger1 = 0;!time
time = 60
timegap = 1
framegap = 2
length = 5
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add

[State 4203, Particles]
type = explod
trigger1 = parent, animelemtime(8) < 0
trigger1 = 1 || map(particle_x) := (-25 + random / 20.00)
trigger1 = 1 || map(particle_y) := (-90 + map(particle_x))
trigger2 = 1 || map(particle_x) := (-25 + random / 20.00)
trigger2 = 1 || map(particle_y) := (-40 - 50 * cos(map(particle_x) / 30.0 * pi / 2))
ID = 6005
anim = 6005
postype = p1
pos = map(particle_x), map(particle_y)
random = 0, 0
vel = 0.01 * map(particle_x), -1
accel = 0, -0.1
sprpriority = parent, sprpriority - 1
removetime = 20
scale = 0.33, 0.33
angle = 15 * (random % 24)
pausemovetime = -1
supermovetime = -1
;ownpal = 1

[State 4203, End]
type = destroyself
trigger1 = parent, stateno != 4200 || parent, anim != 4200
trigger2 = parent, stateno = 4200 && parent, animelemtime(19) >= 0
trigger3 = !animtime


;========================<RED PARTICLES>=============================
[Statedef 6021]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 6021, Bind]
type = bindtoroot
trigger1 = !(time % 3)
pos = ceil(-160 + (random / 3.125)), ceil(-60 - (random / 3.125))

[State 6021, Particle]
type = explod
trigger1 = (time % 3) = 1
trigger1 = time < 84
anim = 6021
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = (rootdist x + 16) / 36.0, (rootdist y - 79) / 36.0
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 45 * (random % 8)
scale = 0.5, 0.5
trans = addalpha
alpha = 128, 256
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6021, Fade]
type = modifyexplod
trigger1 = time >= 120
trigger1 = numexplod
trans = addalpha
alpha = 256 - (16 * (time - 120)), 256

[State 6021, End]
type = removeexplod
trigger1 = root, stateno != 193
trigger2 = time >= 136

[State 6021, End]
type = destroyself
trigger1 = time >= 3
trigger1 = !numexplod


;========================<VEGA>=============================
[Statedef 6100]
physics = N
velset = 0, 0
anim = 6100
sprpriority = 4

[State 6100, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6100, Pos]
type = posset
trigger1 = !time
y = 0

[State 6100, Offset]
type = offset
trigger1 = 1
y = 6

[State 6100, Sound]
type = playsnd
trigger1 = animelemtime(1) = 10
value = 6, random < 500
channel = 0

[State 6100, Purple Blood Thing]
type = explod
trigger1 = animelemtime(9) = [0, 2]
anim = 6105
ID = 6105
postype = p1
scale = 0.5, 0.5
trans = addalpha
alpha = 64, 256
sprpriority = sprpriority + 1
ownpal = 1
bindtime = -1

[State 6100, Sound]
type = stopsnd
trigger1 = animelem = 9
channel = 0

[State 6100, Sound]
type = playsnd
trigger1 = animelem = 9
value = 2, 9
channel = 2

[State 6100, Sound]
type = playsnd
trigger1 = animelem = 12
value = 6, 11
channel = 0

[State 6100, Sound]
type = playsnd
trigger1 = animelem = 20
value = F 7, 0

[State 6100, FX]
type = explod
trigger1 = animelem = 20
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 6100, Gone]
type = changestate
trigger1 = animelemtime(23) >= 0
value = 6101


;----- DEAD -----
[Statedef 6101]
physics = N
velset = 0, 0
anim = 6101
sprpriority = 4

[State 6101, Offset]
type = offset
trigger1 = 1
y = 6

[State 6101, Fade]
type = trans
trigger1 = time >= 180
trans = addalpha
alpha = 256 - 4 * (time - 180), 4 * (time - 180)

[State 6101, Gone]
type = destroyself
trigger1 = time >= 244


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
pos = -4 + (random % 9), -8 + (random % 9)
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


;----- Impact Small -----
[Statedef 8111]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 8111, Pos]
type = posset
trigger1 = !time
y = 0

[State 8111, Pos]
type = posset
trigger1 = !time
trigger1 = root, stateno = 175
y = 8

[State 8111, FX Ground]
type = explod
trigger1 = !time
anim = 8110
ID = 1
postype = p1
removetime = 8
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8111, FX Back]
type = explod
trigger1 = !time
anim = 8111
ID = 2
postype = p1
removetime = 8
sprpriority = 2
pausemovetime = -1
supermovetime = -1

[State 8111, Scale]
type = modifyexplod
trigger1 = numexplod
scale = 0.125 + (0.015625 * time), 0.125 + (0.015625 * time)
trans = addalpha
alpha = 256 - (32 * time), 256

[State 8111, End]
type = removeexplod
trigger1 = time >= 8

[State 8111, End]
type = destroyself
trigger1 = !numexplod


;========================<PURPLE FLAMES>=============================
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

[State 8150, End]
type = destroyself
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), movetype = H
trigger1 = playerID(map(target)), incustomstate
trigger1 = playerID(map(target)), gethitvar(playerno) = playerno
trigger1 = playerID(map(target)), stateno = [1114100, 1114110]; Misogi

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
value = 5, 2
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


;========================<RED FLAMES>=============================
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

[State 8151, End]
type = destroyself
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), movetype = H
trigger1 = playerID(map(target)), incustomstate
trigger1 = playerID(map(target)), gethitvar(playerno) = playerno
trigger1 = playerID(map(target)), stateno = [1114100, 1114110]; Misogi

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

[State 8151, Turn]
type = turn
trigger1 = playerIDexist(map(target))
trigger1 = facing != (playerID(map(target)), facing)

[State 8151, Sound]
type = playsnd
trigger1 = playerIDexist(map(target))
trigger1 = playerID(map(target)), hitshakeover
value = 5, 2
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
value = 7, 5
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
vel = ((rootdist x - 5) / 32.0), ((rootdist y - 57) / 32.0)
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
pos = 160 + (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time >= 32
ID = 21
postype = back
pos = 160 - (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 80, 120)
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
value = 7, 6
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
trigger1 = root, map(superfinish) = 3050
var(0) = 3

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3100
var(0) = 4

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3200
var(0) = 5

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3250
var(0) = 6

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3300
var(0) = 7

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 3070
var(0) = 8

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4200
var(0) = 9

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4300
var(0) = 10

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = 4100
var(0) = 11

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, map(superfinish) = [3020, 3022]
var(0) = 12

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


;========================<KANJI FLAMES B.G.>=============================
[Statedef 8690]
physics = N
velset = 0, 0
anim = 9999

[State 8690, Sound]
type = playsnd
trigger1 = !time
value = 7, 7

[State 8690, black]
type = bgpalfx
trigger1 = time < 120
time = 2
add = -255, -255, -255

[State 8690, black]
type = bgpalfx
trigger1 = time = 120
time = 60
add = -255, -255, -255
sinadd = 255, 255, 255, 240

[State 8690, Fade]
type = modifyexplod
trigger1 = time >= 120
trans = addalpha
alpha = 256 - floor(4.267 * (time - 120)), 256

[State 8690, Kanji]
type = explod
trigger1 = !time
anim = 8690
ID = 8690
under = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 8690, Shrink]
type = modifyexplod
trigger1 = numexplod(8690)
trigger1 = time < 12
ID = 8690
scale = ((13 - time) / 2.0) * (1.3333333 * gameheight / gamewidth), ((13 - time) / 2.0) * (1.3333333 * gameheight / gamewidth)

[State 8690, Shrink]
type = modifyexplod
trigger1 = numexplod(8690)
trigger1 = time >= 12
ID = 8690
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)

[State 8690, Flame BG Fake Afterimage]
type = explod
trigger1 = time = 0
trigger2 = time = 2
trigger3 = time = 4
anim = 8691
under = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 1, 1.3333333 * (gameheight / gamewidth)
trans = addalpha
alpha = 128, 256
bindtime = -1
removetime = 600
pausemovetime = 300
supermovetime = 300

[State 8690, Assert]
type = assertspecial
trigger1 = time < 120
flag = nomusic
flag2 = globalnoshadow

[State 8690, Assert]
type = assertspecial
trigger1 = 1
flag = noFG
flag2 = nobardisplay

[State 8690, Safety]
type = removeexplod
trigger1 = time >= 180

[State 8690, End]
type = destroyself
trigger1 = time >= 180


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
