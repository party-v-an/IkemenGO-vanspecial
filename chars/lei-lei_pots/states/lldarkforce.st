; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;======================================<DARK FORCE STATES>=====================================
;==============================================================================================

;====================<DARK FORCE>====================
[Statedef 4000]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 4000, Turn]
type = changeanim
trigger1 = p2dist x < 0
trigger1 = anim != 4005
value = 4005

[State 4000, Turn]
type = turn
trigger1 = anim = 4005 && animelem = 1

[State 4000, Anim]
type = changeanim
trigger1 = anim != 4000 && anim != 4005
trigger2 = !animtime
trigger2 = anim = 4005
value = 4000

[State 4000, Dead]
type = changestate
trigger1 = !alive
value = 5050

[State 4000, Crouch]
type = changestate
trigger1 = command = "holddown" && command != "holdup"
value = 4010

[State 4000, Walk]
type = changestate
trigger1 = command = "holdfwd" + command = "holdback" = 1
value = 4020

[State 4000, Jump]
type = changestate
trigger1 = command = "holdup" && command != "holddown"
value = 4040


;====================<CROUCHING>====================
[Statedef 4010]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 4010, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 4012
value = 10
elem = ifelse(animelemtime(4) >= 0, 1, 4 - animelemno(0))

[State 4010, Anim]
type = changeanim
trigger1 = anim != 4010
value = 4010

[State 4010, Jump]
type = changestate
trigger1 = command = "holdup" && command != "holddown"
value = 4040

[State 4010, End]
type = changestate
trigger1 = !animtime
value = 4011


[Statedef 4011]
type = C
physics = C
movetype = I
anim = 4011
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 4011, Turn]
type = changeanim
trigger1 = p2dist x < 0
trigger1 = anim != 4006
value = 4006

[State 4011, Turn]
type = turn
trigger1 = anim = 4006 && animelem = 1

[State 4011, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 4006
value = 4011

[State 4011, End]
type = changestate
trigger1 = command != "holddown"
value = 4012


[Statedef 4012]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 4012, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 4010
value = 4012
elem = 4 - animelemno(0)

[State 4012, Anim]
type = changeanim
trigger1 = anim != 4012
value = 4012

[State 4012, End]
type = changestate
trigger1 = command = "holddown" && command != "holdup"
value = 4010

[State 4012, Jump]
type = changestate
trigger1 = command = "holdup" && command != "holddown"
value = 4040

[State 4012, End]
type = changestate
trigger1 = !animtime
value = 4000


;====================<WALKING>====================
[Statedef 4020]
type = S
physics = S
movetype = I
sprpriority = 0
ctrl = 0

[State 4020, Vel]
type = velset
trigger1 = command = "holdfwd"
x = 4.17

[State 4020, Vel]
type = velset
trigger1 = command = "holdback"
x = -4.43

[State 4020, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 4020 && anim != 4005
trigger2 = anim = 4005 && animelemtime(1) >= 1
value = 4020

[State 4020, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 4021 && anim != 4005
trigger2 = anim = 4005 && animelemtime(1) >= 1
value = 4021

[State 4020, Steps]
type = playsnd
trigger1 = anim = [4020, 4021]
trigger1 = animelem = 2 || animelem = 6
value = 0, ifelse((animelem = 2), 103, 106)

[State 4020, Jump]
type = changestate
trigger1 = command = "holdup" && command != "holddown"
value = 4040

[State 4020, End]
type = changestate
trigger1 = command = "holdfwd" + command = "holdback" != 1
value = 4000


;===================<JUMPING>================
[Statedef 4040]
type = S
physics = S
movetype = I
anim = 4040
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 4040, Direction]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))

[State 4040, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((p2movetype != A || backedgebodydist <= 10), 1, ifelse((p2movetype = A), -1, 0))

[State 4040, Sound]
type = playsnd
trigger1 = !animtime
value = 0, 40

[State 4040, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 4040, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 4040, End]
type = changestate
trigger1 = !animtime
value = 4050


[Statedef 4050]
type = A
physics = N
movetype = I
sprpriority = 1
ctrl = 0

[State 4050, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || (anim != [4041, 4043])
value = ifelse(vel x >= 0, 4041, 4043)

[State 4050, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 4040
value = 1

[State 4050, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 4040
trigger1 = map(armorhittime) <= 0

[State 4050, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4052


[Statedef 4052]
type = S
physics = S
movetype = I
anim = 4047
ctrl = 0
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 4052, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4047
value = 4047

[State 4052, Pos]
type = posset
trigger1 = 1
y = 0

[State 4052, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4052, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 4052, Turn]
type = changeanim
trigger1 = ctrl && p2dist x < 0
trigger1 = anim != 4005
value = 4005

[State 4052, Turn]
type = turn
trigger1 = anim = 4005 && animelem = 1

[State 4052, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Standing Light Punch>==========
[Statedef 4200]
type = S
physics = S
movetype = A
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4200, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4200
value = 4200

[State 4200, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 7
;channel = 1

[State 4200, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 50, 13
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8020)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 128), map(sparky) := -32
hitsound = s2, 7
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 4200 || prevstateno = 230 || prevstateno = 245), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 4200 || prevstateno = 230 || prevstateno = 245), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 4200 || prevstateno = 230 || prevstateno = 245), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 10
guard.ctrltime = 1 + 10
guard.slidetime = 10
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 4200, Anim]
type = changeanim
trigger1 = anim = 4200
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger1 = hitpausetime <= 7
value = 4200
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 4200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Standing Medium Punch>==========
[Statedef 4205]
type = S
movetype = A
physics = S
anim = ifelse((p2bodydist x <= (const(size.xscale) * 25)) && (prevstateno != [200, 259]), 211, 4205)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4205, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4205
value = 4205

[State 4205, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1

[State 4205, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 6 || animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 25, 6
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8021)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 80) * (map(sparkx.max) := 190), map(sparky) := -27
hitsound = s2, 8
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 11
movetype = I

[State 4205, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Standing Hard Punch>==========
[Statedef 4210]
type = S
movetype = A
physics = S
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4210, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4210
value = 4210

[State 4210, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 9
;channel = 1

[State 4210, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 4210, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = animelem = 4 || animelem = 5 || animelem = 6
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 90, 23
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 170), map(sparky) := ifelse((animelem = 4), -30, ifelse((animelem = 5), -99, -122))
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -4, -8
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 9
movetype = I

[State 4210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;=========<Dark Force Standing Light Kick>==========
[Statedef 4215]
type = S
movetype = A
physics = S
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4215, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4215
value = 4215

[State 4215, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
;channel = 1

[State 4215, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 40, 10
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8010)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 61), map(sparky) := -48
hitsound = s2, 4
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = ifelse((prevstateno = 245), 15, 12)
ground.hittime = 1 + ifelse((prevstateno = 245), 15, 12); + 2 * map(counterhit_buffer)
ground.velocity = ifelse((prevstateno = 245), -7.51, -4.49), 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 3
movetype = I

[State 4215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Standing Medium Kick>==========
[Statedef 4220]
type = S
movetype = A
physics = S
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4220, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4220
value = 4220

[State 4220, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
;channel = 1

[State 4220, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 60, 15
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8011)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 113), map(sparky) := -61
hitsound = s2, 5
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 13
guard.ctrltime = 1 + 13
guard.slidetime = 13
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1
forcestand = 1

[State 4220, Anim]
type = changeanim
trigger1 = anim = 4220
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger1 = hitpausetime <= 7
value = 4220
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 4
movetype = I

[State 4220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Standing Hard Kick>==========
[Statedef 4225]
type = S
movetype = A
physics = S
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4225, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4225
value = 4225

[State 4225, Width]
type = width
trigger1 = animelem = 3
player = ceil(48 * const(size.xscale)), 0

[State 4225, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
;channel = 1

[State 4225, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
damage = 80, 20
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 60) * (map(sparkx.max) := 144), map(sparky) := -61
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State Idle]
type = statetypeset
trigger1 = animelem = 5
movetype = I

[State 4225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Dark Force Crouching Punch>==========
[Statedef 4240]
type = C
physics = N
movetype = A
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4240, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4240
value = 4240

[State 4240, Type]
type = statetypeset
trigger1 = animelemtime(12) >= 0
physics = C

[State 4240, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(12) < 0
x = 4

[State 4240, Vel]
type = velset
trigger1 = animelem = 12
x = 0

[State 4240, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 9
;channel = 1

[State 4240, Hit]
type = hitdef
trigger1 = animelem = 2
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = C, HA
damage = 60, 15
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 120), map(sparky) := -22
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -1.0, -8.0
air.type = Low
air.velocity = -1.0, -8.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
fall = 1
yaccel = 0.695
fall.recover = 1
fall.recovertime = 120
down.bounce = 1
fall.xvelocity = -1
fall.yvelocity = -3

[State 4240, Faster]
type = changeanim
triggerall = animelemtime(2) > 0 && animelemtime(8) < 0
trigger1 = map(strength) = 1 && animelemtime(2) = 2
trigger2 = map(strength) = 2 && animelemtime(2) = 7
value = 4240
elem = 8

[State Idle]
type = statetypeset
trigger1 = animelem = 12
movetype = I

[State 4240, End]
type = changestate
trigger1 = !animtime
value = 4011


;=========<Dark Force Air Punch>==========
[Statedef 4260]
type = A
physics = N
movetype = A
sprpriority = 1
ctrl = 0

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = 1

[State 4260, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4260
value = 4260

[State 4260, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
;channel = 1

[State 4260, Hit]
type = hitdef
trigger1 = animelem = 3 || animelem = 8 || animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, HA
damage = 30, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8022)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8000)
sparkxy = -10 + 0 * (map(sparkx.min) := 26) * (map(sparkx.max) := 108), map(sparky) := -62
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 12
ground.slidetime = 12
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 1

[State 4260, Type]
type = statetypeset
trigger1 = animelem = 15
movetype = I

[State 4260, Type]
type = gravity
trigger1 = map(armorhittime) <= 0

[State 4260, Type]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4052


;====================<ARMOR>====================
[Statedef 4500]
type = U
physics = N
movetype = H

[State 4500, Damage]
type = lifeadd
trigger1 = !time
value = -gethitvar(damage)
dizzy = 0
kill = 1

[State 4500, Flash]
type = palfx
trigger1 = !time
trigger1 = alive
time = 4
add = 255, 255, 255
mul = 256, 0, 0
color = 0

[State 4500, Hittime]
type = mapset
trigger1 = !time
trigger1 = alive
map = "armorhittime"
value = ifelse(gethitvar(animtype) = 0, 12, ifelse(gethitvar(animtype) = 1, 15, 18))

[State 4500, Vel]
type = mapset
trigger1 = !time
trigger1 = alive
map = "armorhitvel"
value = ifelse(gethitvar(animtype) = 0, -4.49, ifelse(gethitvar(animtype) = 1, -7.51, -10.52))

[State 4500, End]
type = selfstate
trigger1 = 1
value = ifelse(!alive, 5000, map(armorstate))


;====================<DARK FORCE OVER>====================
[Statedef 4510]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0

[State 4510, Anim]
type = changeanim
trigger1 = !time
trigger1 = prevstateno != 4500 || anim != 4510
value = 4510

[State 4510, Var]
type = mapset
trigger1 = 1
map = "darkforce"
value = -1

[State 4510, End]
type = changestate
triggerall = !animtime
trigger1 = !numhelper(6000)
trigger2 = time >= 300
value = 4511


[Statedef 4511]
type = S
physics = S
movetype = I
anim = 4511
ctrl = 0
velset = 0, 0

[State 4511, Var]
type = mapset
trigger1 = 1
map = "darkforce"
value = 0

[State 4511, Clear HitOverride]
type = hitoverride
trigger1 = !time
time = 0
stateno = 5000

[State 4511, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
