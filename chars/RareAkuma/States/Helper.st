; _____________________________________
;| Rare Akuma by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<MESSATSU GOU HADOU>=============================
[Statedef 1005]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1005, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(const(size.height) = 1, 1006, 1009)
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1005, Anim]
type = changeanim
trigger1 = anim != 1005 && anim != 1008
value = 1005

[State 1005, Anim for Cloning]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
trigger1 = numhelper(1005) <= 1
trigger1 = const(size.height) != 1
trigger1 = random < ifelse((!(root, AIlevel) && root, command = "/s"), 250, 125)
value = 1008

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 6, 2))

[State 1005, Vel]
type = velset
trigger1 = time < 2 && var(2) > 1
x = 1

[State 1005, trans]
type = trans
trigger1 = anim != [1008, 1009]
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, hitsnd]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse(moveguarded, 0, 7)
channel = 1
persistent = 0
ignorehitpause = 1

[State 1005, FX]
type = explod
trigger1 = !(gametime % 2) && numexplod(1007) < 8
anim = 1007
sprpriority = 5
postype = p1
random = 48, 48
vel = -(0.25 + (random / 4000.0)) * vel x, -(0.25 + (random / 4000.0)) * vel y
accel = 0, 0.25
scale = 0.5, 0.5
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = 20, 4
animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 4, 6
sparkno = 1
sparkxy = -10, 0
guard.sparkno = 40
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -4
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = 1
fall.recover = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = (root, var(20) <= 0)

[State 1005, flames]
type = helper
trigger1 = movehit && numtarget && !numhelper(7181)
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 1005, 1006)

[State 1005, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320


[Statedef 1006]
type = A
physics = N
movetype = A
anim = ifelse(anim = 1008, 1009, 1006)
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1006, trans]
type = trans
trigger1 = anim != [1008, 1009]
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, bonus!]
type = helper
trigger1 = !time
trigger1 = anim = [1008, 1009]
trigger1 = numhelper(1) < 5
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
keyctrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
immortal = 1
pausemovetime = 8
supermovetime = 8

[State 1006]
type = explod
trigger1 = !time
trigger1 = anim != [1008, 1009]
anim = 7170
postype = p1
random = 40, 40
sprpriority = 3
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime


[Statedef 1009]
type = A
physics = N
movetype = A
anim = ifelse(anim = 1008, 1009, 1006)
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1009, FX]
type = helper
trigger1 = !time
trigger1 = numhelper(1) < 3
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
keyctrl = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
immortal = 1
pausemovetime = 8
supermovetime = 8

[State 1009, bonus!]
type = helper
trigger1 = !time
trigger1 = anim = [1008, 1009]
trigger1 = numhelper(1) < 5
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
pos = -16, -16
keyctrl = 1
immortal = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 8
supermovetime = 8

[State 1009, bonus!]
type = helper
trigger1 = !time
trigger1 = anim = [1008, 1009]
trigger1 = numhelper(1) < 5
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
pos = 16, -16
keyctrl = 1
immortal = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 8
supermovetime = 8

[State 1009, bonus!]
type = helper
trigger1 = !time
trigger1 = anim = [1008, 1009]
trigger1 = numhelper(1) < 5
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
pos = 16, -16
keyctrl = 1
immortal = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 8
supermovetime = 8

[State 1009, bonus!]
type = helper
trigger1 = !time
trigger1 = anim = [1008, 1009]
trigger1 = numhelper(1) < 5
helpertype = normal
ID = 1
name = "Akuma Juniors"
postype = p1
pos = 16, 16
keyctrl = 1
immortal = 1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 8
supermovetime = 8

[State 1009, End]
type = destroyself
trigger1 = 1


;========================<GOU HADOU 2>=============================
[Statedef 1015]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 4

[State 1015, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1015, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 64, 1015, 1006)
ignorehitpause = 1

[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1015, Anim]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
value = 1015

[State 1015, Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = 5
y = 0

[State 1015, Vel]
type = veladd
triggerall = vel x < 5
trigger1 = (!(root, AIlevel)) && (root, facing = facing) && root, command = "holdfwd"
trigger2 = (!(root, AIlevel)) && (root, facing != facing) && root, command = "holdback"
trigger3 = (root, AIlevel) && p2dist x >= 0
x = 0.5

[State 1015, Vel]
type = veladd
triggerall = vel x > -5
trigger1 = (!(root, AIlevel)) && (root, facing = facing) && root, command = "holdback"
trigger2 = (!(root, AIlevel)) && (root, facing != facing) && root, command = "holdfwd"
trigger3 = (root, AIlevel) && p2dist x < 0
x = -0.5

[State 1015, Vel]
type = veladd
triggerall = vel y > -5
trigger1 = (!(root, AIlevel)) && root, command = "holdup"
trigger2 = (root, AIlevel) && numenemy
trigger2 = pos y > (p2, pos y + p2, const(size.mid.pos.y))
y = -0.5

[State 1015, Vel]
type = veladd
triggerall = vel y < 5
trigger1 = (!(root, AIlevel)) && root, command = "holddown"
trigger2 = (root, AIlevel) && numenemy
trigger2 = pos y < (p2, pos y + p2, const(size.mid.pos.y))
y = 0.5

[State 1015, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1015, hitsnd]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse(moveguarded, 0, 7)
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, FX]
type = explod
trigger1 = !(gametime % 2) && numexplod(1007) < 8
anim = 1007
sprpriority = 5
postype = p1
random = 112, 112
accel = 0, 0.25
scale = 1, 1
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = 10, 1
animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 0
sparkno = 2
sparkxy = -10, 0
guard.sparkno = 40
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -vel x, -0.5 + vel y
ground.cornerpush.veloff = 0
air.velocity = -vel x, -0.5 + vel y
fall = 1
fall.recover = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = (root, var(20) <= 0)

[State 1015, flames]
type = helper
trigger1 = movehit && numtarget && !numhelper(7181)
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 64, 1015, 1006)

[State 1015, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320
trigger2 = screenpos y != [-160, 400]


[Statedef 1016]
type = A
physics = N
movetype = A
anim = 1006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1016, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1016, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 1

[State 1016, End]
type = destroyself
trigger1 = !animtime


;========================<MESSATSU GO TO HELL>=============================
[Statedef 1025]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1025, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, Anim]
type = changeanim
trigger1 = anim != 1025
value = 1025

[State 1025, Vel]
type = velset
trigger1 = !time
trigger1 = !prevstateno
x = -2.5 -(random / 400.0)
y = -10 + (random / 50.0)

[State 1025, Vel]
type = veladd
trigger1 = vel x < 10 && p2dist x > 0
x = 0.25

[State 1025, Vel]
type = veladd
trigger1 = vel x > -10 && p2dist x < 0
x = -0.25

[State 1025, Vel]
type = veladd
trigger1 = vel y < 10 && numenemy
trigger1 = pos y < (p2, pos y + p2, const(size.mid.pos.y))
y = 0.25

[State 1025, Vel]
type = veladd
trigger1 = vel y > -10 && numenemy
trigger1 = pos y > (p2, pos y + p2, const(size.mid.pos.y))
y = -0.25

[State 1025, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, Hide Reflection]
type = assertspecial
trigger1 = pos y > 0
flag = noshadow

[State 1025, hitsnd]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse(moveguarded, 0, 7)
channel = 1
persistent = 0
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = 20, 3
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 4, 6
sparkno = 1
sparkxy = -10, 0
guard.sparkno = 40
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, 0
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = 0
fall.recover = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = (root, var(20) <= 0)

[State 1025, End]
type = changestate
trigger1 = movecontact
value = 1006

[State 1025, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320


;========================<TENMA GOU ZANKUU>=============================
[Statedef 1055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1055, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1009
ignorehitpause = 1

[State 1055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1055, Anim]
type = changeanim
trigger1 = anim != 1005 && anim != 1008
value = 1005

[State 1055, Anim for Cloning]
type = changeanim
trigger1 = !time
trigger1 = !prevstateno
trigger1 = numhelper(1005) <= 1
trigger1 = const(size.height) != 1
trigger1 = random < ifelse((!(root, AIlevel) && root, command = "/s"), 167, 83)
value = 1008

[State 1055, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 6, 2))
y = ifelse(var(10) = 3, 7, ifelse(var(10) = 2, 4.2, 1.4))

[State 1055, Vel]
type = velset
trigger1 = time < 2 && var(2) > 1
x = 1
y = 1

[State 1055, trans]
type = trans
trigger1 = anim != [1008, 1009]
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1055, hitsnd]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse(moveguarded, 0, 7)
channel = 1
persistent = 0
ignorehitpause = 1

[State 1055, FX]
type = explod
trigger1 = !(gametime % 2) && numexplod(1007) < 8
anim = 1007
sprpriority = 5
postype = p1
random = 48, 48
vel = -(0.25 + (random / 4000.0)) * vel x, -(0.25 + (random / 4000.0)) * vel y
accel = 0, 0.25
scale = 0.5, 0.5
ignorehitpause = 1

[State 1055, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = A, HP
damage = 15, 3
animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 4, 6
sparkno = 1
sparkxy = -10, 0
guard.sparkno = 40
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -2
ground.cornerpush.veloff = 0
air.velocity = -4, -2
down.velocity = 0, 0
down.hittime = 20
fall = 1
fall.recover = 0
getpower = ifelse(p2movetype = H, 96, 192), 48
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
kill = (root, var(20) <= 0)

[State 1055, flames]
type = helper
trigger1 = movehit && numtarget && !numhelper(7181)
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 4, 1055, 1006)

[State 1055, End]
type = changestate
trigger1 = pos y >= 0
value = 1057

[State 1055, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320


[Statedef 1057]
type = A
physics = N
movetype = I
anim = ifelse(anim = 1008, 1009, 1006)
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1057, trans]
type = trans
trigger1 = anim != [1008, 1009]
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1057, Pos]
type = posset
trigger1 = 1
y = 0

[State 1057, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 1
channel = 1

[State 1057, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1057, End]
type = destroyself
trigger1 = !animtime


;========================<CHOCOLATE BEAM>=============================
[Statedef 1605]
type = A
physics = N
movetype = A
anim = 1605
ctrl = 0

[State 1605, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1606
ignorehitpause = 1

[State 1605, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1605, Pos]
type = bindtoroot
trigger1 = 1
pos = 30, -44

[State 1605, scale]
type = angledraw
trigger1 = 1
scale = 0.5, 0.375 + (random / 4000.0)
ignorehitpause = 1

[State 1605, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 192 + ceil(64 * random / 1000.0), 256
ignorehitpause = 1

[State 1605, FX]
type = removeexplod
trigger1 = 1
ID = 1606

[State 1605, FX]
type = explod
trigger1 = 1
anim = 1606
ID = 1606
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.5, 0.375 + (random / 4000.0)
trans = addalpha
alpha = 192 + ceil(64 * random / 1000.0), 256
ownpal = 1

[State 1605, grab]
type = reversaldef
trigger1 = (gametime % 2) = 1 && !movecontact
reversal.attr = SCA, AA, AT
damage = 0, 0
ID = 1600
hitonce = 1
p1stateno = 1640
p2stateno = 1650
pausetime = 0, 0
hitsound = s5, 33
sparkno = 2
guard.sparkno = 40
sparkxy = 0, 0
sprpriority = 3
kill = 0

[State 1605, Hit]
type = hitdef
trigger1 = (gametime % 2) = 0 && !movecontact
ID = 1600
attr = S, HP
damage = 0, 0
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 0, 0
guard.dist = 320
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ceil(p2dist y -48)
hitsound = s5, 33
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
airguard.velocity = -2, -3
down.velocity = -4, -4
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 0
air.fall = 1
forcestand = 1
fall.recover = 0
sprpriority = 3
yaccel = 0.5
hitonce = 1
p1stateno = 1640
p2stateno = 1650
kill = 0

[State 1605, End]
type = changestate
trigger1 = root, stateno != 1600 || root, movetype = H
trigger2 = root, stateno = 1600 && root, animelemtime(5) >= 0
value = 1606
ignorehitpause = 1


[Statedef 1606]
type = A
physics = N
movetype = A
ctrl = 0

[State 1606, End]
type = destroyself
trigger1 = 1


;--- Food anims ---
[Statedef 1640]
type = A
physics = N
movetype = I
anim = 1640 + (random % 6)
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1640, bind]
type = turn
trigger1 = numtarget(1600)
trigger1 = facing != target(1600), facing

[State 1640, bind]
type = posset
trigger1 = numtarget(1600)
x = ceil(target(1600), pos x)
y = ceil(target(1600), pos y + 1)

[State 1640, angle]
type = angleset
trigger1 = numtarget(1600)
trigger1 = target(1600), stateno = 1650 || target(1600), stateno = 1652
value = 0

[State 1640, Snd]
type = angleset
trigger1 = numtarget(1600)
trigger1 = target(1600), stateno = 1651
value = ceil(20 * cos(gametime / 8.0 * pi))

[State 1640, angle]
type = angledraw
trigger1 = 1
scale = 0.7780, 1

[State 1640, walk]
type = playsnd
trigger1 = numtarget(1600)
trigger1 = target(1600), stateno = 1651
value = 5, 37
channel = 1
lowpriority = 1

[State 1640, walk]
type = stopsnd
trigger1 = numtarget(1600)
trigger1 = target(1600), prevstateno = 1651 && target(1600), time = 1
channel = 1

[State 1640, jump]
type = playsnd
trigger1 = numtarget(1600)
trigger1 = target(1600), stateno = 1652 && target(1600), time = 1
value = 0, 42
channel = 1

[State 1640, Snd]
type = sndpan
trigger1 = 1
channel = 1
pan = 0

[State 1640, sparks]
type = explod
trigger1 = (time = [1, 16]) && !(time % 4)
anim = f2
sprpriority = 5
postype = p1
random = 50, 50
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1640, End]
type = changestate
trigger1 = time >= 160 || roundstate != 2
trigger2 = !numtarget(1600)
trigger3 = numtarget(1600)
trigger3 = (target(1600), stateno != [1650, 1652]) || (target(1600), ishelper)
value = 1641


;--- Over ---
[Statedef 1641]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = 1

[State 1641, bind]
type = targetstate
trigger1 = 1
ID = 1600
value = 1655

[State 1641, walk]
type = stopsnd
trigger1 = 1
channel = 1

[State 1641, End]
type = destroyself
trigger1 = 1


;========================<BEAM>=============================
[Statedef 3005]
type = A
physics = N
movetype = A
anim = 3005
ctrl = 0
sprpriority = 4

[State 3005, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3005
ignorehitpause = 1

[State 3005, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3005, Pos]
type = bindtoroot
trigger1 = root, stateno = 3000
pos = 83, -68

[State 3005, ProjContact]
type = varset
trigger1 = numtarget
var(0) = 1
ignorehitpause = 1

[State 3005, scale]
type = angledraw
trigger1 = 1
scale = 1, ifelse(random < 500, -1, 1) * (0.75 + (random / 2000.0))
ignorehitpause = 1

[State 3005, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 192 + ceil(64 * random / 1000.0), 256
ignorehitpause = 1

[State 3005, bgpalfx]
type = bgpalfx
trigger1 = 1
time = 1
mul = 128, 128, 128

[State 3005, bgpalfx]
type = bgpalfx
trigger1 = !(time % 3)
time = 1
color = 0
invertall = 1

[State 3005, Shake]
type = envshake
trigger1 = !(time % 6)
time = 6
ampl = 4
freq = 120

[State 3005, hitsnd]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse(moveguarded, 0, 7)
channel = 1
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = !(movecontact % 2) && time < 48
attr = S, HP
damage = 18, 4
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 0, 1
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -13, -1.2
ground.cornerpush.veloff = 0
air.velocity = -13, -1.2
down.velocity = -13, -1.2
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
kill = (root, var(20) <= 0)

[State 3005, Hit]
type = hitdef
trigger1 = !(movecontact % 2) && time < 48 && (hitcount % 2)
attr = S, HP
damage = 18, 4
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 0, 1
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -13, -1.2
ground.cornerpush.veloff = 0
air.velocity = -13, -1.2
down.velocity = -13, -1.2
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
kill = (root, var(20) <= 0)

[State 3005, Hit]
type = hitdef
trigger1 = time = 48
attr = S, HP
damage = 18, 4
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 0, 1
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -15, -6
ground.cornerpush.veloff = 0
air.velocity = -15, -6
down.velocity = -15, -6
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
kill = (root, var(20) <= 0)

[State 3005, sparks]
type = explod
trigger1 = movecontact && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = fifelse(moveguarded, 40, 2)
ID = 7000
ontop = 1
postype = p2
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
random = 20, 20
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 100
supermovetime = 100

[State 3005, End]
type = changestate
trigger1 = time >= 49
trigger2 = root, stateno != 3000 || root, movetype = H
trigger3 = root, stateno = 3000 && root, animelemtime(14) < 0
value = 3006
ignorehitpause = 1


[Statedef 3006]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3005
velset = 0, 0
sprpriority = 5

[State 3006, shrink]
type = angledraw
trigger1 = 1
scale = 1, ifelse(random < 500, -1, 1) * (1 -(time / 32.0))

[State 3005, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(time * 8), 256

[State 3006, End]
type = destroyself
trigger1 = time >= 32


;========================<KATAMARI>=============================
[Statedef 3410]
type = A
physics = N
movetype = A
anim = 3410 + (random % 5)
ctrl = 0
juggle = 0
sprpriority = 2

[State 3410, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3410
ignorehitpause = 1

[State 3410, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3410, Vel]
type = velset
trigger1 = 1
x = ifelse(numtarget, 4, 12)
y = 0

[State 3410, Pos]
type = posset
trigger1 = 1
y = -180

[State 3410, Snd]
type = angleset
trigger1 = !time
trigger1 = !prevstateno
value = 3 * (random % 120)
ignorehitpause = 1

[State 3410, Snd]
type = angleadd
trigger1 = 1
value = ifelse(numtarget, -1, -3)
ignorehitpause = 1

[State 3410, Snd]
type = angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3410, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = ((facing = 1 && pos x >= 0) || (facing = -1 && pos x <= 0)), 0

[State 3410, Snd]
type = playsnd
trigger1 = 1
value = 5, 31
channel = 0
lowpriority = 1

[State 3410, Snd]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 3410, hitsnd]
type = playsnd
trigger1 = moveguarded = 1
value = 2, 0
channel = 1
ignorehitpause = 1

[State 3410, grab]
type = reversaldef
trigger1 = (gametime % 2) = 1
reversal.attr = SCA, AA, AP, AT
damage = 7, 1
affectteam = B
ID = 3400 + numtarget
p2facing = 1
p2stateno = 3420
pausetime = 0, 0
hitsound = s5, 32
sparkno = 2
guard.sparkno = 2
sparkxy = 0, 0
sprpriority = 2
kill = 0

[State 3410, Hit]
type = hitdef
trigger1 = (gametime % 2) = 0
ID = 3400 + (numtarget % 16)
attr = S, HA
damage = 7, 1
affectteam = B
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 0, 0
guard.dist = 320
sparkno = 2
guard.sparkno = 40
sparkxy = -10, ceil(p2dist y -48)
hitsound = s5, 32
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
airguard.velocity = -2, -3
down.velocity = -4, -4
getpower = ifelse(p2movetype = H, 96, 192), 48
fall = 0
air.fall = 1
forcestand = 1
fall.recover = 0
sprpriority = 2
yaccel = 0.5
p2facing = 1
p2stateno = 3420
kill = 0
guard.kill = (root, var(20) <= 0)

[State 3410, p2state]
type = targetfacing
trigger1 = numtarget
value = -1
ignorehitpause = 1

[State 3410, Hurt]
type = hitadd
trigger1 = numtarget && !(time % 4)
trigger1 = target, stateno = 3420
value = numtarget

[State 3410, Hurt]
type = targetlifeadd
trigger1 = numtarget && !(time % 4)
trigger1 = target, stateno = 3420
value = floor(-7 * ifelse((p2, lifemax <= 2000), 2000, (p2, lifemax)) / 2000.0)
absolute = 1
kill = 0

[State 3410, Hurt]
type = playsnd
trigger1 = numtarget && !(time % 4)
trigger1 = target, stateno = 3420
value = 2, 3
channel = 1
ignorehitpause = 1

[State 3410, sparks]
type = explod
trigger1 = numtarget = 1 && !moveguarded && !(time % 4)
anim = f2
ID = 7000
ontop = 1
postype = p2
pos = (target, const(size.ground.front)) - 10, (target, const(size.mid.pos.y))
random = 80, 80
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3410, sparks]
type = explod
trigger1 = numtarget >= 2 && !moveguarded && !(time % 4)
anim = f2
ID = 7000
ontop = 1
postype = p1
pos = 0, 0
random = 240, 240
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3410, bind]
type = targetbind
trigger1 = numtarget
trigger1 = target, stateno = 3420
pos = ceil(140 * cos(gametime / 180.0 * pi)), ceil(140 * sin(gametime / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3400)
trigger1 = target(3400), stateno = 3420
ID = 3400
pos = ceil(140 * cos((gametime + 7) / 180.0 * pi)), ceil(140 * sin((gametime + 7) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3401)
trigger1 = target(3401), stateno = 3420
ID = 3401
pos = ceil(140 * cos((gametime + 37) / 180.0 * pi)), ceil(140 * sin((gametime + 37) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3402)
trigger1 = target(3402), stateno = 3420
ID = 3402
pos = ceil(140 * cos((gametime + 67) / 180.0 * pi)), ceil(140 * sin((gametime + 67) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3403)
trigger1 = target(3403), stateno = 3420
ID = 3403
pos = ceil(140 * cos((gametime + 97) / 180.0 * pi)), ceil(140 * sin((gametime + 97) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3404)
trigger1 = target(3404), stateno = 3420
ID = 3404
pos = ceil(120 * cos((gametime + 14) / 180.0 * pi)), ceil(120 * sin((gametime + 14) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3405)
trigger1 = target(3405), stateno = 3420
ID = 3405
pos = ceil(120 * cos((gametime + 44) / 180.0 * pi)), ceil(120 * sin((gametime + 44) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3406)
trigger1 = target(3406), stateno = 3420
ID = 3406
pos = ceil(120 * cos((gametime + 74) / 180.0 * pi)), ceil(120 * sin((gametime + 74) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3407)
trigger1 = target(3407), stateno = 3420
ID = 3407
pos = ceil(120 * cos((gametime + 104) / 180.0 * pi)), ceil(120 * sin((gametime + 104) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3408)
trigger1 = target(3408), stateno = 3420
ID = 3408
pos = ceil(100 * cos((gametime + 21) / 180.0 * pi)), ceil(100 * sin((gametime + 21) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3409)
trigger1 = target(3409), stateno = 3420
ID = 3409
pos = ceil(100 * cos((gametime + 51) / 180.0 * pi)), ceil(100 * sin((gametime + 51) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3410)
trigger1 = target(3410), stateno = 3420
ID = 3410
pos = ceil(100 * cos((gametime + 81) / 180.0 * pi)), ceil(100 * sin((gametime + 81) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3411)
trigger1 = target(3411), stateno = 3420
ID = 3411
pos = ceil(100 * cos((gametime + 111) / 180.0 * pi)), ceil(100 * sin((gametime + 111) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3412)
trigger1 = target(3412), stateno = 3420
ID = 3412
pos = ceil(80 * cos((gametime + 28) / 180.0 * pi)), ceil(80 * sin((gametime + 28) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3413)
trigger1 = target(3413), stateno = 3420
ID = 3413
pos = ceil(80 * cos((gametime + 58) / 180.0 * pi)), ceil(80 * sin((gametime + 58) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3414)
trigger1 = target(3414), stateno = 3420
ID = 3414
pos = ceil(80 * cos((gametime + 88) / 180.0 * pi)), ceil(80 * sin((gametime + 88) / 180.0 * pi))

[State 3410, bind]
type = targetbind
trigger1 = numtarget(3415)
trigger1 = target(3415), stateno = 3420
ID = 3415
pos = ceil(80 * cos((gametime + 128) / 180.0 * pi)), ceil(80 * sin((gametime + 128) / 180.0 * pi))

[State 3410, End]
type = changestate
trigger1 = time >= 60 && (frontedgedist < -320 || backedgedist < -320)
trigger2 = time >= 10 && root, stateno != 3401
trigger3 = time >= 10 && !(playerIDexist(root, ID))
value = 3411
ignorehitpause = 1


;--- Exit screen ---
[Statedef 3411]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = 2

[State 3411, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3411, Hurt]
type = targetlifeadd
trigger1 = !time
value = -7
absolute = 1
kill = 1

[State 3411, p2state]
type = targetstate
trigger1 = !(root, win) && time
value = 3421

[State 3411, End]
type = targetdrop
trigger1 = !(root, win) && time

[State 3411, Vel]
type = velset
trigger1 = 1
x = 12
y = 0

[State 3411, Pos]
type = posset
trigger1 = 1
y = -180

[State 3411, Snd]
type = angleadd
trigger1 = 1
value = -3
ignorehitpause = 1

[State 3411, Snd]
type = angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3411, win]
type = changestate
trigger1 = root, win
value = 3490

[State 3411, End]
type = changestate
trigger1 = !(root, win) && time
trigger1 = time >= 60 || (frontedgedist < -320 || backedgedist < -320)
value = 3407


;--- Destroy self ---
[Statedef 3407]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = 2

[State 3407, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3407, End]
type = targetdrop
trigger1 = 1

[State 3407, Vel]
type = velset
trigger1 = 1
x = 12
y = 0

[State 3407, Pos]
type = posset
trigger1 = 1
y = -180

[State 3407, Snd]
type = angleadd
trigger1 = 1
value = -3
ignorehitpause = 1

[State 3407, Snd]
type = angledraw
trigger1 = 1
scale = 1, 1
ignorehitpause = 1

[State 3407, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(time * 16), 256

[State 3407, End]
type = destroyself
trigger1 = time >= 16


;--- Outer space ---
[Statedef 3490]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3490, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3490, p2state]
type = targetstate
trigger1 = !time
value = 3422

[State 3490, Vel]
type = velset
trigger1 = !time
x = 2
y = -7.5

[State 3490, Vel]
type = veladd
trigger1 = vel x > -5
x = -0.25

[State 3490, Vel]
type = veladd
trigger1 = vel y < 0
y = 0.125

[State 3490, Pos]
type = posset
trigger1 = screenpos y < 20 && vel y < 0
y = ceil(pos y -screenpos y) + 20

[State 3490, Snd]
type = angleadd
trigger1 = 1
value = -3
ignorehitpause = 1

[State 3490, Snd]
type = angledraw
trigger1 = 1
scale = 1 -(0.01 * time), 1 -(0.01 * time)
ignorehitpause = 1

[State 3490, Snd]
type = playsnd
trigger1 = 1
value = 5, 31
channel = 0
lowpriority = 1

[State 3490, Snd]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 3490, bind]
type = targetbind
trigger1 = numtarget
pos = 0, 0

[State 3490, End]
type = changestate
trigger1 = time >= 100
value = 3491
ignorehitpause = 1


;--- Shine ---
[Statedef 3491]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3491, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3491, mc]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 3491, Snd]
type = angledraw
trigger1 = 1
scale = 0, 0
ignorehitpause = 1

[State 3491, Snd]
type = playsnd
trigger1 = !time
value = 5, 45
channel = 0

[State 3491, Flash]
type = explod
trigger1 = !time
anim = 6104
sprpriority = -3
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3491, p2state]
type = targetstate
trigger1 = !time
value = 3423

[State 3491, End]
type = destroyself
trigger1 = time >= 60


;========================<DUCK>=============================
[Statedef 6160]
type = A
physics = N
movetype = A
anim = 6160
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 6160, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 6161
ignorehitpause = 1

[State 6160, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AA, AP
ignorehitpause = 1

[State 6160, Anim]
type = varset
trigger1 = !time
var(0) = (random % 3)

[State 6160, Anim]
type = changeanim
trigger1 = !time
value = 6160 + var(0)

[State 6160, Snd]
type = playsnd
trigger1 = !time
value = 5, 39
channel = 1

[State 6160, Pos]
type = posset
trigger1 = !time
y = ceil(pos y -screenpos y) -32

[State 6160, Vel]
type = velset
trigger1 = 1
x = 0
y = 4

[State 6160, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = A, NP
damage = 25, 5
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 4
sparkno = 1
guard.sparkno = 40
sparkxy = -10, 0
hitsound = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.velocity = 0, -4
down.velocity = 0, 0
fall = 0
fall.recover = 1
getpower = ifelse(p2movetype = H, 72, 144), 36
givepower = 25, 25
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
kill = (root, var(20) <= 0)

[State 6160, End]
type = changestate
trigger1 = movecontact
trigger2 = vel y > 0 && (pos y > -vel y)
value = 6161
ignorehitpause = 1

[State 6160, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320


[Statedef 6161]
type = A
physics = N
movetype = I
anim = 6163 + var(0)
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 6161, trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = 256 -((time -16) * 16), ((time -16) * 16)

[State 6161, Snd]
type = playsnd
trigger1 = !time
value = 5, 40
channel = 1

[State 6161, Pos]
type = posset
trigger1 = pos y > 0
y = 0

[State 6161, End]
type = destroyself
trigger1 = time >= 32


;====================<AFTERIMAGE>====================
[Statedef 1511]
physics = N
velset = 0, 0
anim = 9999
sprpriority = 0

[State 1511, HB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1511, animvar]
type = varset
trigger1 = !time
var(1) = root, var(31)

[State 1511, animvar]
type = varset
trigger1 = !time
var(2) = root, var(32)

[State 1511, Anim]
type = changeanim
trigger1 = 1
value = var(1)
elem = var(2)

[State 1511, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -8 * time), ceil(8 * time)

[State 1511, End]
type = destroyself
trigger1 = time >= 32


;====================<SUICIDE>====================
[Statedef 4907]
physics = N
velset = 0, 0
anim = 4907
sprpriority = 5

[State 4907, HB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 4907, bind]
type = bindtoroot
trigger1 = 1
pos = 0, -64
facing = 1

[State 4907, Snd]
type = angleset
trigger1 = !time
value = 15 * (random % 24)
ignorehitpause = 1

[State 4907, Snd]
type = angleadd
trigger1 = 1
value = 15
ignorehitpause = 1

[State 4907, scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.05 * time), 0.25 + (0.05 * time)

[State 4907, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 4907, End]
type = destroyself
trigger1 = root, stateno != 4902 || root, movetype = H


;====================<DEFLECTOR SHIELD>====================
[Statedef 75]
type = A
physics = N
movetype = H
anim = 75
sprpriority = 2
ctrl = 0

[State 75, Hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 75
ignorehitpause = 1

[State 75, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 75, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 75
value = 5, 24
channel = 1

[State 75, kick them shells]
type = reversaldef
trigger1 = 1
reversal.attr = SCA, AP
p2stateno = 6994
pausetime = 0, 0
hitsound = s5, 24
sparkno = 40
sparkxy = 0, 0
numhits = 0

[State 75, Damage Limit]
type = reversaldef
trigger1 = root, map(damagelimit) >= 250
trigger1 = root, stateno != 4000
reversal.attr = SCA, AA, AP, AT
p2stateno = 6996
pausetime = 0, 0
hitsound = s2, 10
sparkno = 3
sparkxy = 0, 0
numhits = 0

[State 75, double negative nothitby]
type = reversaldef
trigger1 = root, map(useless)
trigger1 = root, stateno != 4000
reversal.attr = SCA, AA, AP, AT
p2stateno = ifelse(root, map(useless) >= 1200, 6997, 6995)
pausetime = 0, 0
hitsound = s2, 10
sparkno = 3
sparkxy = 0, 0
numhits = 0

[State 75, wait]
type = reversaldef
trigger1 = root, stateno = 9666
reversal.attr =
pausetime = 0, 0
hitsound = -1
sparkno = -1
numhits = 0

[State 75]
type = bgpalfx
trigger1 = movehit = [1, 10]
time = 1
add = (280 -25 * movehit), (280 -25 * movehit), (280 -25 * movehit)

[State 75, drop]
type = targetdrop
trigger1 = numtarget

[State 75, Bind]
type = posset
trigger1 = 1
x = root, pos x
y = ifelse(root, pos y = 0, 0.1, root, pos y); avoid ground dust effects

[State 75, Bind]
type = turn
trigger1 = facing != root, facing

[State 75, Anim]
type = changeanim
trigger1 = 1
value = 75

[State 75, noshadow]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 75, Reset Combos]
type = statetypeset
trigger1 = 1
movetype = H

[State 75, Reset Combos]
type = statetypeset
trigger1 = receivedhits
movetype = I

[State 75, End]
type = destroyself
trigger1 = roundstate != 2


;====================<HOLINESS>====================
[Statedef 77]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 77, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 77, noshadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 77, bind]
type = bindtoroot
trigger1 = 1
pos = -1 + (random / 500.0), 0.25 * (gametime % 40) - 1 + (random / 500.0)
facing = 1

[State 77, bind]
type = bindtoroot
trigger1 = root, stateno = 4010
pos = -4 + (random / 125.0), 1.0 * (gametime % 40) - 4 + (random / 125.0)
facing = 1

[State 77, trans]
type = angledraw
trigger1 = 1
scale = 1 + 0.0083 * (gametime % 40), 1 + 0.0083 * (gametime % 40)

[State 77, trans]
type = angledraw
trigger1 = root, stateno = 4010
scale = 4 + 0.0333 * (gametime % 40), 4 + 0.0333 * (gametime % 40)

[State 77, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 - 6.4 * (gametime % 40)), floor(6.4 * (gametime % 40))
ignorehitpause = 1

[State 77, Anim]
type = assertspecial
trigger1 = 1
flag = animfreeze

[State 77, Anim]
type = changeanim
trigger1 = root, incustomstate = 0
value = root, anim
elem = root, animelemno(0)

[State 77, Hide]
type = assertspecial
trigger1 = root, incustomstate
trigger1 = root, anim != [5000, 5300] || !selfanimexist(root, anim)
trigger2 = !selfanimexist(root, anim)
trigger3 = root, stateno = 194
trigger3 = root, animelemtime(2) < 0
trigger4 = root, stateno = 178
trigger5 = root, stateno = 179
trigger6 = root, stateno = [4902, 4903]
flag = invisible

[State 77, Layer]
type = sprpriority
trigger1 = 1
value = (root, sprpriority) + 1

[State 77, Frequency]
type = varrandom
trigger1 = 1
v = 1
range = 1, 40

[State 77, Frequency]
type = varrandom
trigger1 = root, stateno = 195 || root, stateno = 740 || root, stateno = 4901
v = 1
range = 1, 10

[State 77, Frequency]
type = varset
trigger1 = root, stateno = 4001
trigger2 = root, standby
var(1) = 0

[State 77, Frequency]
type = varrandom
trigger1 = root, stateno = 9666
v = 1
range = 1, 5

[State 77]
type = varset
trigger1 = numhelper(7500)
trigger2 = !(root, alive) || root, incustomstate || root, var(20) > 0
trigger3 = root, stateno = 177 && root, animelemtime(2) < 0
trigger4 = root, stateno = 178
trigger5 = root, stateno = 188 && root, animelemtime(6) < 0
trigger6 = root, stateno = 192 && root, animelemtime(3) < 0
trigger7 = root, stateno = 194 && root, animelemtime(2) < 0
trigger8 = root, stateno = [4020, 4021]
trigger9 = root, stateno = [4902, 4903]
var(1) = -1

[State 77, Lightning]
type = mapset
trigger1 = var(1) = 1
map = "lightningpos"
value = -10 + (random / 38.5)

[State 77, Lightning]
type = explod
trigger1 = var(1) = 1
anim = 7250
ID = 7250
sprpriority = (root, sprpriority) + ifelse(map(lightningpos) < 0, -3, 3)
postype = p1
pos = ifelse(root, stateno = 9666, p2dist x, 0), (rootdist y) - (root, pos y) + map(lightningpos)
scale = ifelse(random < 500, -1, 1), ifelse(root, pos y >= -100, 1, 1 + abs(root, pos y + 100) / 240.0)
random = 160, 0
trans = addalpha
alpha = 192, 256
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 77, Sound]
type = playsnd
trigger1 = var(1) = 1
trigger1 = numexplod(7250) <= 3
trigger1 = roundstate = [1, 4]
value = 5, 15
;channel = 1
volumescale = 40 + (random / 50.0)
freqmul = 0.75 + (random / 2000.0)

[State 77, BG Color]
type = bgpalfx
trigger1 = var(1) = 1
trigger1 = var(1) := -1
time = 32
add = -96, -96, -96
sinadd = 96, 96, 96, 128

[State 77, End]
type = changestate
triggerall = roundstate = 2
triggerall = root, stateno != 4001
triggerall = root, stateno != 9666
triggerall = root, standby = 0
trigger1 = random = 1
trigger1 = random < 333
trigger1 = var(1) > 0 && time >= 300
trigger2 = !(root, AILevel)
trigger2 = root, command = "holddown" && root, command = "start"
value = 78


;--- Hunting wabbits ---
[Statedef 78]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 78, noshadow]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow
flag3 = nomusic

[State 78, bind]
type = bindtoroot
trigger1 = 1
pos = 0, 0
facing = 1

[State 78]
type = stopsnd
trigger1 = !time
channel = -1

[State 78]
type = playsnd
trigger1 = !time
value = 5, 41
channel = 2

[State 78]
type = bgpalfx
trigger1 = !time
time = 300
add = -128, -128, -128

[State 78, End]
type = changestate
triggerall = !(root, standby)
trigger1 = time >= 300 && random < 16
trigger2 = time >= 60 && (roundstate != [2, 3])
trigger3 = time > 0
trigger3 = root, stateno = 9666
trigger4 = root, stateno = const(StateTagEnteringScreen)
value = 77


;========================<TREE LOG>=============================
[Statedef 1510]
type = A
physics = N
movetype = I
anim = 1510
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 1510]
type = veladd
trigger1 = 1
y = 0.33

[State 1510]
type = velset
trigger1 = !time
x = -2 + (random / 500.0)
y = -1 -(random / 500.0)

[State 1510]
type = posset
trigger1 = pos y >= 0
y = 0

[State 1510]
type = velmul
trigger1 = pos y >= 0
trigger1 = vel y > 2
x = 0.75
y = -0.75

[State 1510]
type = trans
trigger1 = time = [33, 64]
trans = addalpha
alpha = 256 -8 * (time -32), 8 * (time -32)
ignorehitpause = 1

[State 1510]
type = destroyself
trigger1 = time >= 64


;========================<PURPLE DUST>=============================
[Statedef 4210]
physics = N
anim = 9999

[State 4210, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4210, Dust]
type = explod
trigger1 = !time
anim = 4210
ID = 4210
sprpriority = -2
postype = p1
removetime = 25
pausemovetime = -1
supermovetime = -1

[State 4210, fade]
type = palfx
trigger1 = !time
mul = 384, 384, 384
sinadd = -255, -255, -255, 100
time = 25

[State 4210, shrink]
type = modifyexplod
trigger1 = 1
ID = 4210
scale = 0.5 + (0.1 * time), 0.1 + (0.02 * time)

[State 4210, End]
type = destroyself
trigger1 = time >= 26


;========================<TENMA SHINZUI WARI F.X.>=============================
[Statedef 3305]
physics = N
velset = 0, 0
anim = 3305
sprpriority = 3

[State 3305, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3305, bind]
type = bindtoroot
trigger1 = root, anim = 3300
ignorehitpause = 1

[State 3305, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 2
length = 3
palcontrast = 120, 90, 150
trans = add

[State 3305, End]
type = destroyself
trigger1 = !animtime || root, stateno != 3300


;========================<S.G.S. GUARDED>=============================
[Statedef 4095]
physics = N
velset = 0, 0
anim = 9999

[State 4095, Palfx]
type = bgpalfx
trigger1 = !time
time = 30
add = 255, 255, 255
sinadd = -255, -255, -255, 120

[State 4095, Snd]
type = playsnd
trigger1 = !time
value = 7, 1

[State 4095, thunder]
type = explod
trigger1 = !time
anim = 7250
ID = 4095
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1

[State 4095, circle]
type = explod
trigger1 = !time
anim = 7251
ID = 4026
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 30
ownpal = 1

[State 4095, shrink]
type = modifyexplod
trigger1 = numexplod(4026)
ID = 4026
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)

[State 4095, noshadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 4095, End]
type = removeexplod
trigger1 = time >= 20

[State 4095, End]
type = destroyself
trigger1 = time >= 20


;========================<MISOGI ILLUSIONS>=============================
[Statedef 4104]
physics = N
anim = 9999

[State 4111, assert]
type = assertspecial
trigger1 = 1
flag = invisible

[State 4104, Dust]
type = explod
trigger1 = !time
anim = 4110
ID = 4110
sprpriority = -1
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4104, particles]
type = explod
trigger1 = time = [1, 16]
vel = 0, -ceil(random / 200)
accel = 0, -0.3
anim = 4111
sprpriority = -1
postype = p1
pos = -2, -45
random = 50, 50
facing = -1 + (random < 500) * 2
removetime = -2
ownpal = 1
scale = 0.25, 0.25
pausemovetime = 300
supermovetime = 300

[State 4104, fade]
type = palfx
trigger1 = !time
mul = 200, 0, 256
sinadd = -255, -255, -255, 240
time = 60

[State 4104, End]
type = destroyself
trigger1 = time >= 60


;========================<MOON>=============================
[Statedef 4305]
type = A
physics = N
movetype = I
anim = 4305
velset = 0, 0
sprpriority = 2

[State 4305, Var]
type = varset
trigger1 = !time
trigger1 = !prevstateno
var(1) = ifelse(random < 500, 1, 0)

[State 4305, bind]
type = bindtoroot
trigger1 = root, stateno = 4301
pos = 0, 230

[State 4305, bind]
type = posset
trigger1 = root, stateno = 4310 && root, movetype != H
x = ceil(root, pos x)

[State 4305, bind]
type = posset
trigger1 = root, stateno != 4301
y = 0

[State 4305, FX]
type = explod
trigger1 = !numexplod(4309)
anim = 4309
ID = 4309
sprpriority = 3
postype = p1
pos = 0, -230
bindtime = -1
removetime = -1
ignorehitpause = 1

[State 4305, Anim]
type = changeanim
trigger1 = !var(1) && anim != 4306 && (root, movecontact = [1, 8])
trigger2 = var(1) && anim != 4308 && (root, movecontact = [1, 8])
value = ifelse(var(1), 4308, 4306)

[State 4305, Anim]
type = changeanim
trigger1 = !var(1) && anim != 4305 && !(root, movecontact = [1, 8])
trigger2 = var(1) && anim != 4307 && !(root, movecontact = [1, 8])
value = ifelse(var(1), 4307, 4305)

[State 4305, End]
type = changestate
trigger1 = root, movetype = H
trigger2 = root, stateno != 4301 && (root, stateno != [4310, 4312])
value = 4306


[Statedef 4306]
type = A
physics = N
movetype = I
anim = ifelse(var(1), 4307, 4305)
velset = 0, 0
sprpriority = 2

[State 4306, FX]
type = removeexplod
trigger1 = time = 0

[State 4306]
type = explod
trigger1 = !time
anim = 7170
postype = p1
pos = 0, -120
sprpriority = 3
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 2, 2
ownpal = 1

[State 4306, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 1

[State 4306, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (time * 16), (time * 16)

[State 4306, End]
type = destroyself
trigger1 = frontedgedist < -320 || backedgedist < -320
trigger2 = time >= 16


;========================<AURA>=============================
[Statedef 6000]
physics = N
velset = 0, 0
anim = 6000
sprpriority = 2

[State 6000, bind]
type = bindtoroot
trigger1 = 1
pos = -4, 0
facing = 1

[State 6000, Var]
type = varset
trigger1 = !time
var(0) = root, anim

[State 3005, scale]
type = angledraw
trigger1 = 1
scale = 0.75 + (random / 2000.0), 0.75 + (random / 2000.0)
ignorehitpause = 1

[State 6000, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128 + ceil(128 * random / 1000.0), 256
ignorehitpause = 1

[State 6000, End]
type = destroyself
trigger1 = (root, anim) != var(0)
trigger2 = root, stateno = 195 && root, animelemtime(19) >= 0
trigger3 = root, stateno = 182 && root, animelemtime(26) >= 0
trigger4 = root, stateno = 1020 && root, animelemtime(9) >= 0
trigger5 = root, stateno = 1400 && root, animelemtime(5) >= 0
trigger6 = root, stateno = 3020 && root, anim = 3020 && root, animelemtime(22) >= 0
trigger7 = root, stateno = 193 && root, anim = 193 && root, animelemtime(39) >= 0


;========================<EVE -IL!>=============================
[Statedef 6002]
physics = N
velset = 0, -0.5
anim = 6002
sprpriority = -1

[State 6002, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6002, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 120, 90, 150
trans = add

[State 6002, Shadows]
type = velset
trigger1 = animelem = 6
y = -3

[State 6002, fade]
type = palfx
trigger1 = animelem = 7
sinadd = -255, -255, -255, 64
time = 16

[State 6002, bind]
type = posset
trigger1 = root, stateno = 195 && root, movetype != H
x = ceil(root, pos x) + ifelse(root, facing = -1, 5, -5)

[State 6002, End]
type = destroyself
trigger1 = !animtime || root, movetype = H


;========================<POKÉBALL>=============================
[Statedef 6110]
type = A
physics = N
anim = 6110

[State 6110, Pos]
type = posset
trigger1 = !time
x = ifelse(root, command = "holdback", -160, 80) * facing
y = -9

[State 6110, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 6110, Vel]
type = velset
trigger1 = !time
x = rootdist x / 60.0
y = -15

[State 6110, Snd]
type = angleset
trigger1 = !time
value = 30 * (random % 12)

[State 6110, Snd]
type = angleadd
trigger1 = 1
value = -30

[State 6110, Snd]
type = angledraw
trigger1 = 1
scale = 6.5 -(0.1 * time), 6.5 -(0.1 * time)

[State 6110, End]
type = destroyself
trigger1 = time >= 60 || pos y > 0



;========================<EARTH>=============================
;--- Kirby ---
[Statedef 6120]
type = A
physics = N
anim = 9999
ctrl = 0

[State 6120, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 6120]
type = assertspecial
trigger1 = 1
flag = nomusic

[State wait]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 6120]
type = pause
trigger1 = 1
time = 3
movetime = 3

[State 6120]
type = allpalfx
trigger1 = time < 32
time = 1
add = 8 * time, 8 * time, 8 * time

[State 6120]
type = envcolor
trigger1 = time >= 32
value = 0, 0, 0

[State 6120]
type = assertspecial
trigger1 = time >= 32
flag = noBG
flag2 = noFG

[State 6120]
type = explod
trigger1 = time = 32
anim = 6121
ontop = 1
postype = left
pos = 0, 0
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 6120]
type = explod
trigger1 = time = 32
anim = 6120
ontop = 1
postype = left
pos = 160, 120
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 6120]
type = explod
trigger1 = time = 32
anim = 6122
ontop = 1
postype = left
pos = 160, 120
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 6120, End]
type = removeexplod
trigger1 = roundstate != 4

[State 6120, End]
type = destroyself
trigger1 = roundstate != 4


;--- SPACE ---
[Statedef 6125]
type = A
physics = N
anim = 9999
ctrl = 0

[State 6125, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 6125]
type = assertspecial
trigger1 = 1
flag = nomusic
flag2 = globalnoshadow

[State 6125]
type = assertspecial
trigger1 = 1
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 6125]
type = allpalfx
trigger1 = time < 64
time = 1
add = -256 + (4 * time), -256 + (4 * time), -256 + (4 * time)

[State 6125, Space]
type = explod
trigger1 = !numexplod(6126)
anim = 6126
ID = 6126
sprpriority = -255
postype = left
pos = 160, 120
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = -1

[State 6125, Floor]
type = explod
trigger1 = !numexplod(6125)
anim = 6125
ID = 6125
sprpriority = -64
postype = left
pos = 220, 60
removetime = -1

[State 6125, Statue]
type = explod
trigger1 = !numexplod(6200)
anim = 6200
ID = 6200
sprpriority = -5
postype = left
pos = 684, 216
removetime = -1

[State 6125, Shadow]
type = explod
trigger1 = !numexplod(4309)
anim = 4309
ID = 4309
sprpriority = -5
postype = left
pos = 160, 216
bindtime = -1
removetime = -1

[State 6125, Scroll Floor]
type = modifyexplod
trigger1 = time < 180
trigger1 = numexplod(6125)
ID = 6125
postype = left
pos = 0, 0

[State 6125, Scroll Floor]
type = modifyexplod
trigger1 = time = [180, 480]
trigger1 = numexplod(6125)
ID = 6125
postype = left
pos = -1.48 * (time - 180), 0

[State 6125, Scroll Floor]
type = modifyexplod
trigger1 = time >= 480
trigger1 = numexplod(6125)
ID = 6125
postype = left
pos = -444, 0

[State 6125, Scroll Shadow]
type = modifyexplod
trigger1 = time < 180
trigger1 = numexplod(4309)
ID = 4309
postype = left
pos = 160, 216

[State 6125, Scroll Shadow]
type = modifyexplod
trigger1 = time = [180, 480]
trigger1 = numexplod(4309)
ID = 4309
postype = left
pos = 160 - 0.267 * (time - 180), 216

[State 6125, Scroll Shadow]
type = modifyexplod
trigger1 = time >= 480
trigger1 = numexplod(4309)
ID = 4309
postype = left
pos = 80, 216

[State 6125, Scroll Statue]
type = modifyexplod
trigger1 = time < 180
trigger1 = numexplod(6200)
ID = 6200
postype = left
pos = 684, 216

[State 6125, Scroll Statue]
type = modifyexplod
trigger1 = time = [180, 480]
trigger1 = numexplod(6200)
ID = 6200
postype = left
pos = 684 - 1.48 * (time -180), 216

[State 6125, Scroll Statue]
type = modifyexplod
trigger1 = time >= 480
trigger1 = numexplod(6200)
ID = 6200
postype = left
pos = 240, 216

[State 6121, End]
type = removeexplod
trigger1 = root, stateno != [4020, 4021]

[State 6121, End]
type = destroyself
trigger1 = root, stateno != [4020, 4021]


;========================<RAINBOW>=============================
[Statedef 6150]
type = A
physics = N
movetype = I
anim = 6150
ctrl = 0
sprpriority = 0

[State 6150, noshadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6150, Snd]
type = angleset
trigger1 = !time
value = 0
ignorehitpause = 1

[State 6150, Snd]
type = angleadd
trigger1 = 1
value = -5
ignorehitpause = 1

[State 6150, Snd]
type = angledraw
trigger1 = 1
scale = ifelse(time < 72, 0.14 + (0.005 * time), 0.5), ifelse(time < 72, 0.14 + (0.005 * time), 0.5)
ignorehitpause = 1

[State 6150, End]
type = destroyself
trigger1 = roundstate < 3 || (root, stateno != 179)


;====================<POSSE>====================
;--- Chase ---
[Statedef 6180]
type = S
physics = N
anim = 6180
sprpriority = -1
ctrl = 0

[State 6180]
type = turn
trigger1 = time = 120

[State 6180]
type = velset
trigger1 = 1
x = 10


;--- Mini Chaser ---
[Statedef 6181]
type = S
physics = N
anim = 9801
sprpriority = -1
ctrl = 0

[State 6181]
type = velset
trigger1 = !time
x = 8 + (random / 250.0)



;====================<AKUMA JUNIORS START>====================
[Statedef 6970]
type = A
physics = N
movetype = I
anim = 6970
sprpriority = 2
velset = ifelse((root, stateno = 1900), 8, 0), ifelse((root, stateno = 1900), 0, -8)
ctrl = 0

[State 6970]
type = velset
trigger1 = !time
trigger1 = root, var(20) >= 0
x = (random / 125.0)
y = -(random / 125.0)

[State 6970]
type = playsnd
trigger1 = time = 8
value = 4, ifelse(random < 500, 3, 15)
channel = 0
freqmul = 1.5

[State 6970]
type = angledraw
trigger1 = time < 9
scale = 0.1 + (0.1 * time), 0.1 + (0.1 * time)

[State 6970]
type = veladd
trigger1 = 1
y = 0.5

[State 6970, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;====================<AKUMA JUNIORS CATWALK>====================
[Statedef 6975]
type = A
physics = N
movetype = I
anim = 0
sprpriority = 2
velset = 0, 0
ctrl = 0

[State 6975, End]
type = changestate
trigger1 = root, movetype != H
value = ifelse(roundstate = 2, 6980, 180)

[State 6975]
type = angledraw
trigger1 = time < 10
scale = 2 -(0.1 * time), (0.1 * time)

[State 6975, mimic]
type = changeanim
trigger1 = selfanimexist(root, anim)
value = root, anim
elem = root, animelemno(0)

[State 6975, Snd]
type = playsnd
trigger1 = animelem = 1
trigger1 = anim != 0 && (anim != [5000, 5999])
value = 3, (random % 12)
volumescale = 33
freqmul = 1.5
channel = 0

[State 6975, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 571
trigger1 = anim != 0 && (anim != [5000, 5999])
value = 4, (random % 16)
volumescale = 33
freqmul = 1.5
channel = 0

[State 6975, Snd]
type = playsnd
trigger1 = animelem = 1
trigger1 = (anim = [5000, 5999]) && anim != 5300
value = 5000, (random % 3)
volumescale = 33
freqmul = 1.5
channel = 0


;====================<AKUMA JUNIORS WIN POSE>====================
[Statedef 6976]
type = A
physics = N
movetype = I
anim = 6970
sprpriority = 1
velset = 0, 0
ctrl = 0

[State 6976, Vel]
type = turn
trigger1 = !time
trigger1 = random < 500

[State 6976, Vel]
type = velset
trigger1 = !time
x = (random / 250.0)
y = -6 -(random / 250.0)

[State 6976]
type = veladd
trigger1 = 1
y = 0.6

[State 6976]
type = angledraw
trigger1 = time < 9
scale = 0.1 + (0.1 * time), 0.1 + (0.1 * time)

[State 6976, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 6977

[Statedef 6977]
type = A
physics = N
movetype = I
anim = 100
sprpriority = 1
velset = 0, 0
ctrl = 0

[State 6977, Vel]
type = velset
trigger1 = !time
x = 2 + (random / 250.0)
y = 0

[State 6977]
type = posset
trigger1 = 1
y = 0

[State 6977, End]
type = destroyself
trigger1 = pos x != [-240, 240]


;====================<AKUMA JUNIORS DIE>====================
[Statedef 6980]
type = A
physics = N
movetype = H
anim = 6980
sprpriority = 2
velset = 0, 0
ctrl = 0

[State 6980]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = 1

[State 6980]
type = playsnd
trigger1 = !time
value = 11, 0
freqmul = 1.5

[State 6980]
type = posadd
trigger1 = !time
y = -30

[State 6980]
type = angledraw
trigger1 = 1
value = 22 * time
scale = 1 + (0.125 * time), 1 + (0.125 * time)

[State 6980]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(16 * time), (16 * time)

[State 6980, End]
type = destroyself
trigger1 = time >= 16


;====================<TOASTY>====================
[Statedef 6998]
type = A
velset = 0, 0
anim = 9999
sprpriority = 5

[State 6998, Snd]
type = playsnd
trigger1 = !time
value = 5, 19

[State 6998]
type = explod
trigger1 = !numexplod(6998)
anim = 6998
ID = 6998
ontop = 1
postype = back
bindtime = -1
pausemovetime = -1
supermovetime = -1
removetime = 80
ownpal = 1

[State 6998]
type = modifyexplod
trigger1 = numexplod(6998) && time < 20
ID = 6998
postype = back
pos = -120 + ceil(6 * time), 240

[State 6998]
type = modifyexplod
trigger1 = numexplod(6998) && (time = [20, 60])
ID = 6998
postype = back
pos = 0, 240

[State 6998]
type = modifyexplod
trigger1 = numexplod(6998) && time >= 60
ID = 6998
postype = back
pos = -ceil(6 * (time -60)), 240

[State 6998, End]
type = removeexplod
trigger1 = time >= 80

[State 6998, End]
type = destroyself
trigger1 = time >= 80


;========================<FIRE>=============================
;--- PURPLE ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9999
sprpriority = 4

[State 7181, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 7181, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -0.2, -0.75
pos = (p2, const(size.mid.pos.x)), (p2, const(size.mid.pos.y)) + 10
random = 40, 40
removetime = -2
scale = 0.5, 0.5
ownpal = 1

[State 7181, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)

[State 7181, End]
type = destroyself
trigger1 = time >= 120
trigger2 = p2, ctrl || (p2, movetype != H) || (p2, statetype = L)


;========================<SUPER CHARGE>=============================
[Statedef 7500]
physics = N
velset = 0, 0
anim = 9999

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7500, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7500]
type = assertspecial
trigger1 = root, stateno = [4900, 4902]
flag = nomusic

[State 7500, Lv1]
type = bgpalfx
trigger1 = time <= 10 && root, var(10) = 5
time = 1
add = 256 -ceil(25.6 * time), 256 -ceil(25.6 * time), 256 -ceil(25.6 * time)
mul = 256 -floor(25.6 * time), 256, 256 -floor(25.6 * time)
color = 256 -floor(25.6 * time)

[State 7500, Lv1]
type = bgpalfx
trigger1 = (time = [11, 39]) && root, var(10) = 5
time = 1
mul = 0, 256, 0
color = 0

[State 7500, Lv1]
type = bgpalfx
trigger1 = time >= 40 && root, var(10) = 5
time = 1
mul = ceil(51.2 * (time -40)), 256, ceil(51.2 * (time -40))
color = floor(51.2 * (time -40))

[State 7500, Lv2]
type = bgpalfx
trigger1 = time <= 15 && root, var(10) = 6
time = 1
add = 256 -ceil(17.07 * time), 256 -ceil(17.07 * time), 256 -ceil(17.07 * time)
mul = 256 -floor(17.07 * time), 256, 256 -floor(17.07 * time)
color = 256 -floor(17.07 * time)

[State 7500, Lv2]
type = bgpalfx
trigger1 = (time = [16, 47]) && root, var(10) = 6
time = 1
mul = 0, 256, 0
color = 0

[State 7500, Lv2]
type = bgpalfx
trigger1 = time >= 48 && root, var(10) = 6
time = 1
mul = ceil(51.2 * (time -48)), 256, ceil(51.2 * (time -48))
color = floor(51.2 * (time -48))

[State 7500, Lv3]
type = bgpalfx
trigger1 = time <= 20 && root, var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)

[State 7500, Lv3]
type = bgpalfx
trigger1 = (time = [21, 54]) && root, var(10) = 7
time = 1
mul = 0, 0, 0
color = 0

[State 7500, Lv3]
type = bgpalfx
trigger1 = time >= 55 && root, var(10) = 7
time = 1
mul = ceil(51.2 * (time -55)), ceil(51.2 * (time -55)), ceil(51.2 * (time -55))
color = floor(51.2 * (time -55))

[State 7500, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
postype = p1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Portrait]
type = explod
trigger1 = time = 1 && root, var(10) = 7
anim = 7510
ID = 7510
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
sprpriority = -16
bindtime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = !time
anim = 7502
ID = 75021
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 7
anim = 7502
ID = 75022
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 14
anim = 7502
ID = 75023
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 21
anim = 7502
ID = 75024
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = time = 28
anim = 7502
ID = 75025
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, scale]
type = modifyexplod
trigger1 = root, var(10) = 5
ID = 7500
postype = p1
pos = 0, 0
scale = 1.5 -(0.0333 * time), 1.5 -(0.0333 * time)

[State 7500, scale]
type = modifyexplod
trigger1 = root, var(10) = 6
ID = 7500
postype = p1
pos = 0, 0
scale = 1.5 -(0.0283 * time), 1.5 -(0.0283 * time)

[State 7500, scale]
type = modifyexplod
trigger1 = root, var(10) = 7
ID = 7500
postype = p1
pos = 0, 0
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(7501)
ID = 7501
postype = p1
pos = 0, 0
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(7510) && time < 8
ID = 7510
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = (32 * time), 256

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50
ID = 7510
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 105, 120)
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(75021)
ID = 75021
postype = p1
pos = 0, 0
scale = 0.25 + (0.0375 * time), 0.25 + (0.0375 * time)

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(75022)
ID = 75022
postype = p1
pos = 0, 0
scale = 0.25 + (0.0375 * (time -7)), 0.25 + (0.0375 * (time -7))

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(75023)
ID = 75023
postype = p1
pos = 0, 0
scale = 0.25 + (0.0375 * (time -14)), 0.25 + (0.0375 * (time -14))

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(75024)
ID = 75024
postype = p1
pos = 0, 0
scale = 0.25 + (0.0375 * (time -21)), 0.25 + (0.0375 * (time -21))

[State 7500, scale]
type = modifyexplod
trigger1 = numexplod(75025)
ID = 75025
postype = p1
pos = 0, 0
scale = 0.25 + (0.0375 * (time -28)), 0.25 + (0.0375 * (time -28))

[State 7500, Safety]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 7500, No bars]
type = assertspecial
trigger1 = root, var(10) = 7
flag = nobardisplay
flag2 = noFG

[State 7500, Safety]
type = removeexplod
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60

[State 7500, End]
type = destroyself
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60


;========================<THE WORLD IS SAFE>=============================
[Statedef 7680]
physics = N
anim = 9999

[State 7680]
type = varset
trigger1 = !time
var(1) = const(size.height)

[State 7680]
type = destroyself
trigger1 = var(1) != [1, 7]

[State 7680]
type = pause
trigger1 = 1
time = 3
movetime = 3

[State 7680]
type = bgpalfx
trigger1 = 1
time = 2
color = 0

[State 7680]
type = allpalfx
trigger1 = 1
time = 2
color = 0

[State 7680]
type = assertspecial
trigger1 = 1
flag = roundnotover
flag2 = nomusic
flag3 = nobardisplay

[State 7680]
type = stopsnd
trigger1 = time <= 1
channel = -1

[State 7680]
type = playsnd
trigger1 = time = 1
value = 8, const(size.height)
channel = 0

[State 7680]
type = explod
trigger1 = !numexplod(7680)
anim = 7680
ID = 7680
ontop = 1
postype = left
pos = 160, 120
scale = 10, 10
pausemovetime = -1
supermovetime = -1

[State 7680]
type = changestate
trigger1 = var(1) = 1 && time >= (9.501 * tickspersecond)
trigger2 = var(1) = 2 && time >= (6.420 * tickspersecond)
trigger3 = var(1) = 3 && time >= (5.940 * tickspersecond)
trigger4 = var(1) = 4 && time >= (3.165 * tickspersecond)
trigger5 = var(1) = 5 && time >= (3.039 * tickspersecond)
trigger6 = var(1) = 6 && time >= (7.419 * tickspersecond)
trigger7 = var(1) = 7 && time >= (3.164 * tickspersecond)
value = 7681

[State 7680]
type = changestate
triggerall = !(root, AIlevel)
trigger1 = root, command = "x" || root, command = "y" || root, command = "z"
trigger2 = root, command = "a" || root, command = "b" || root, command = "c"
value = 7681


[Statedef 7681]
physics = N
anim = 9999

[State 7681]
type = stopsnd
triggerall = !time
triggerall = !(root, AIlevel)
trigger1 = root, command = "x" || root, command = "y" || root, command = "z"
trigger2 = root, command = "a" || root, command = "b" || root, command = "c"
channel = 0

[State 7681]
type = removeexplod
trigger1 = time <= 8
ID = 7680

[State 7681]
type = destroyself
trigger1 = time >= 300


;========================<POWER CHARGE>=============================
;----- < MAIN FX > -----
[Statedef 7240]
physics = N
anim = 7240
sprpriority = -2

[State 7240, bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -4, 0

[State 7240, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 4
palmul = 0.5, 0.33, 0.25
palcontrast = 120, 120, 120
trans = add

[State 7240, FX]
type = explod
trigger1 = !numexplod(7242)
anim = 7242
ID = 7242
sprpriority = 4
postype = p1
bindtime = -1
removetime = -1

[State 7240, FX]
type = modifyexplod
trigger1 = 1
ID = 7242
scale = 0.5, 0.1 + 0.00022 * (root, power)

[State 7240, FX]
type = modifyexplod
trigger1 = root, power >= 3000
ID = 7242
scale = 0.5, 0.75

[State 7240, FX]
type = helper
trigger1 = anim = 7240 && !(time % 7) && numhelper(7243) < 8
helpertype = normal
stateno = 7243
ID = 7243
name = "Power Particle"
postype = p1
pos = ceil(240 -random / 2.1), -ceil(random / 4)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 7240, Anim]
type = changeanim
trigger1 = anim = 7240 && ((root, stateno != 740) || (root, anim != 740))
value = 7241
elem = animelemno(0)

[State 7240, Snd]
type = stopsnd
trigger1 = anim = 7241
channel = 0
persistent = 0

[State 7240, fade]
type = palfx
trigger1 = anim = 7241
sinadd = -255, -255, -255, 64
time = 17
persistent = 0

[State 7240, remove]
type = removeexplod
trigger1 = anim = 7241 && !animtime

[State 7240, End]
type = destroyself
trigger1 = anim = 7241 && !animtime


;----- < PARTICLES > -----
[Statedef 7243]
physics = N
anim = 7243
sprpriority = 4

[State 7243, assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7243, assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 7243, fade]
type = palfx
trigger1 = !time
add = -255, -255, -255
sinadd = 300, 300, 300, 240
time = 56

[State 7243, Vel]
type = velset
trigger1 = !time
x = (rootdist x -4) / 60
y = (rootdist y -55) / 60

[State 7243, End]
type = destroyself
trigger1 = time >= 56
trigger2 = (root, stateno != 740) || (root, anim != 740)


;========================<CAMERA CONTROL>=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9999

[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 7650, End]
type = destroyself
trigger1 = roundstate = 2
