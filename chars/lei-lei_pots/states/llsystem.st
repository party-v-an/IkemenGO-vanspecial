; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0
juggle = 0

[State 0, Gone]
type = destroyself
trigger1 = ishelper
removeexplods = 1

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Dark Force]
type = changestate
trigger1 = map(darkforce)
value = 4000

[State 0, Dead]
type = selfstate
trigger1 = !alive
value = 5050
ctrl = 0

[State 0, Not Myself]
type = selfstate
trigger1 = incustomstate
trigger1 = time > 0
value = 5040


;====================<CROUCHING>====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 12
value = 10
elem = ifelse(animelemtime(3) >= 0, 1, 4 - animelemno(0))

[State 10, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 47
value = 10
elem = 2

[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = selfstate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6
trigger1 = !animtime
value = 11


[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 10
value = 12
elem = 4 - animelemno(0)

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;====================<WALKING>====================
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
trigger1 = ifelse(anim = 20, animelemtime(7) < 0, 1)
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 5 && anim != 12 && anim != 20
trigger2 = anim = 5
trigger2 = !animtime
trigger3 = anim = 12
trigger3 = !animtime
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 5 && anim != 21
trigger2 = anim = 5
trigger2 = !animtime
value = 21


;===================<JUMPING>================
;----- JUMP START -----
[Statedef 40]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = (prevstateno != 100)

[State 40, Keyboard Check]; currently obsolete in Ikemen
type = changestate
trigger1 = !time
trigger1 = !AIlevel
trigger1 = prevstateno = 52
trigger1 = command = "holddown" && command = "holdup"
value = 10
ctrl = 1

[State 40, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 40, Direction]
type = varset
trigger1 = !AIlevel
trigger1 = time >= 1
trigger1 = command = "holdfwd" || command = "holdback"
sysvar(1) = (command = "holdfwd") - (command = "holdback")
persistent = 0

[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse(p2bodydist x < 30, 0, ifelse((life - p2life) > 200 && p2movetype != H && random < 333, -1, 1))

[State 40, High Jump]
type = mapset
trigger1 = !time
map = "jumptype"
value = 0

[State 40, High Jump]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
trigger1 = map(cmd_highjump)
map = "jumptype"
value = 3

[State 40, High Jump]
type = mapset
trigger1 = !time
trigger1 = AIlevel
trigger1 = p2bodydist x > 80 && p2statetype != L
trigger1 = random < 333
map = "jumptype"
value = 3

[State 40, Running Jump]
type = mapset
trigger1 = prevstateno = 100
map = "jumptype"
value = 3

[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
sysvar(1) = 1

[State 40, Sound]
type = playsnd
trigger1 = !animtime
value = 0, ifelse(map(jumptype) = [2, 3], 41, 40)

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Long]
type = velset
trigger1 = !animtime && map(jumptype) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = selfstate
trigger1 = !animtime
value = 50
ctrl = 1


;----- JUMP UP -----
[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x, 41, ifelse((vel x) > 0, 42, 43))

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP FALL -----
[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP LAND -----
[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 1; state -1 only sees this in the next frame
velset = 0, 0
sprpriority = 1

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Disable Trip Guard]; this is a bit different between Mugen and Ikemen
type = assertspecial
trigger1 = !time
trigger1 = prevstateno != [5000, 5999] && prevmovetype != H
trigger1 = prevstateno != 50 && prevstateno != 51 && prevstateno != [120, 155]
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 52, Trip Guard]; actually no longer necessary for human players
type = changestate
triggerall = !time
triggerall = ctrl
triggerall = inguarddist
triggerall = isasserted(nostandguard) = 0
triggerall = isasserted(nocrouchguard) = 0
trigger1 = !AIlevel
trigger1 = command = "holdback"
trigger2 = AIlevel
trigger2 = random < (1000 * (AIlevelF / 8.0))
value = 120

[State 52, No Walk]
type = assertspecial
trigger1 = animtime
trigger1 = anim != 5
flag = nowalk

[State 52, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, Remove Pursuit FX]
type = removeexplod
trigger1 = numexplod(1905)
ID = 1905

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<FORWARD DASH>==========================
[Statedef 100]
type = S
physics = N
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Sound]
type = playsnd
trigger1 = !time
value = 0, 100
persistent = 0

[State 100, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7104
ID = 8100
name = "Dash Dust"
postype = p1
pos = ceil(-15 * const(size.xscale)), 0
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Vel]
type = velset
trigger1 = animelemtime(7) < 0 || animelemtime(16) >= 0
x = 0

[State 100, Vel]
type = velmul
trigger1 = vel x
x = 0.8

[State 100, Vel]
type = velset
trigger1 = animelemtime(7) >= 0 && animelemtime(10) < 0
x = const(velocity.run.fwd.x)

[State 100, Fadeout]
type = explod
trigger1 = animelem = 7
anim = 103
ID = 103
sprpriority = 1
postype = p1
removeongethit = 1
scale = const(size.xscale), const(size.yscale)
ownpal = 0

[State 100, NHB]
type = nothitby
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
value = SCA
time = 1

[State 100, Push]
type = playerpush
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
value = 0

[State 100, Cloud]
type = explod
trigger1 = animelemtime(7) = 5 || animelemtime(7) = 13
anim = 7107
ID = 7107
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 100, Sound]
type = playsnd
trigger1 = animelem = 17
value = 0, ifelse((time % 72) < 36, 103, 106)

[State 100, End]
type = changestate
triggerall = !animtime
trigger1 = frontedgedist <= 0
trigger2 = !AIlevel
trigger2 = command != "holdfwd" || command = "holdback"
trigger3 = AIlevel
trigger3 = p2bodydist x <= 90
value = 0
ctrl = 1


;========================<BACK DASH>==========================
[Statedef 105]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)

[State 105, End]
type = changestate
trigger1 = !animtime
value = 106


;----- LAND -----
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Sound]
type = playsnd
trigger1 = !time
value = 0, 106

[State 106, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<AIR DASH>==========================
[Statedef 110]
type = A
anim = 110
physics = N
ctrl = 1
sprpriority = 1

[State 110, Turn]
type = turn
triggerall = !time
trigger1 = !AIlevel
trigger1 = command = "holdback"; This should be something else if dashes are buffered
trigger2 = AIlevel
trigger2 = p2, ctrl
trigger2 = random < 200

[State 110, Assert]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 110, Gravity]
type = gravity
trigger1 = 1

[State 110, Vel]
type = velset
trigger1 = animelemtime(10) < 0
x = 5.125
y = 0

[State 110, Sound]
type = playsnd
trigger1 = animelem = 2 || animelem = 6
value = 0, 110
freqmul = 0.8 + (random / 2500.0)

[State 110, Cloud]
type = explod
trigger1 = animelem = 2 || animelem = 6
anim = 7107
ID = 7107
sprpriority = 0
postype = p1
pos = ceil(ifelse((animelem = 2 || animelem = 10), 15, 11) * const(size.xscale)), ifelse((animelem = 2 || animelem = 10), -24, -18)
scale = 0.5 * const(size.xscale), 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 110, Stop]
type = changeanim
trigger1 = animelemtime(12) < 0 && time >= 8 && command = "holdback"
value = 110
elem = 12

[State Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;==========<ROLL>==========
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 6, 9)
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 3
x = 5.56

[State 720, Vel]
type = velset
trigger1 = animelem = 6
x = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 720, Push]
type = playerpush
trigger1 = animelemtime(6) < 0
value = 0

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<ROLL>==========
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 6, 9)
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 3
x = -4.17

[State 725, Vel]
type = velset
trigger1 = animelem = 6
x = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 725, Push]
type = playerpush
trigger1 = animelemtime(6) < 0
value = 0

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<POWER CHARGE>==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State Erase Inputs]
type = mapset
map = "cmd_erase_completed"
trigger1 = !AIlevel
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 740, Power]
type = poweradd
trigger1 = 1
value = 4 + ifelse(time < 60, 0, (time - 60) / 15)

[State 740, Sound]
type = playsnd
trigger1 = time = 8
value = 3, 10
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(7241)
helpertype = normal
stateno = 7241
ID = 7241
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, End]
type = changestate
triggerall = time >= 24
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel
trigger2 = command != "/b" || command != "/y"
trigger3 = AIlevel
trigger3 = inguarddist || p2bodydist x <= 120
trigger4 = AIlevel
trigger4 = p2movetype = A
trigger4 = p2stateno = [3000, 4999] || (p2, vel x * p2, facing * facing) < -1
value = 741


;----- END -----
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 0

[State 741, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 741, Sound]
type = playsnd
trigger1 = !time
trigger1 = power >= const(data.power)
value = 4, 1
channel = 0

[State 741, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<GUARD CANCEL>==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = mapset
trigger1 = !time
trigger1 = !AIlevel
map = "strength"
value = ifelse((command = "counter_a" + command = "counter_b" + command = "counter_c") >= 2, 1, 0)
ignorehitpause = 1

[State 750, Strength AI]
type = mapset
trigger1 = !time
trigger1 = AIlevel
map = "strength"
value = ifelse((p2statetype = A), 0, ifelse((p2statetype = C), 1, ifelse(random < 500, 0, 1)))
ignorehitpause = 1

[State 750, Sound]
type = playsnd
trigger1 = !time
value = 3, 0
channel = 0

[State 750, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
time = 5

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = ceil(46 * const(size.xscale)), -46
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 10
movetime = 10
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0

[State 750, Guard Points]
type = guardpointsadd
trigger1 = !time
value = -min((guardpoints - 1), 300)

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(map(strength) = 1, 2910, 2900)


;===================<DARK FORCE>===================
[Statedef 770]
type = S
physics = S
movetype = I
anim = 770
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 2

[State 770, NHB]
type = nothitby
trigger1 = 1
time = 2
value = SCA

[State 770, Sound]
type = playsnd
trigger1 = !time
value = 4, 1
channel = 0

[State 770, Sound]
type = playsnd
trigger1 = !time
value = 7, 2

[State 770, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7270
ID = 7270
name = "Dark Force FX"
postype = p1
pos = ceil(8 * const(size.xscale)), -50
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 9999
supermovetime = 9999

[State 770, Var]
type = mapset
trigger1 = 1
map = "darkforce"
value = 360

[State 770, Lin-Lin]
type = helper
trigger1 = animelem = 3 && !numhelper(6000)
helpertype = normal
stateno = 6040
ID = 6000
name = "Lin-Lin"
postype = p1
pos = ceil(36 * const(size.xscale)), -60
size.shadowoffset = -8
ownpal = 1

[State 770, End]
type = changestate
trigger1 = !animtime
value = 4000


;========================<GUARD>========================
;----- START -----
[Statedef 120]
type = U
physics = U

[State 120, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 120, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = A

[State 120, Vel]
type = velset
trigger1 = !time
trigger1 = statetype != A
x = 0
y = 0

[State 120, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 120, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2

[State 120, End]
type = changestate
trigger1 = !animtime
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop Guarding];Has special handling to block bombs
type = changestate
triggerall = statetype != A
trigger1 = !inguarddist
trigger1 = !numhelper(3005);Bomb
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140

[State 120, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- STAND GUARD (Guarding) -----
[Statedef 130]
type = S
physics = S
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 130, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 130, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, AI fix]
type = changestate
trigger1 = AIlevel
trigger1 = numenemy
trigger1 = time >= 120 || p2, time >= 60
trigger1 = random < 17
value = 40

[State 130, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52

[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 130, High to Low]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
value = 131

[State 130, Stop Guarding];Has special handling to block bombs
type = changestate
trigger1 = !inguarddist
trigger1 = !numhelper(3005);Bomb
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140

[State 130, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- CROUCH GUARD (Guarding) -----
[Statedef 131]
type = C
physics = C
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 131, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 131, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Low to High]
type = changestate
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
value = 130

[State 131, AI fix]
type = changestate
trigger1 = AIlevel
trigger1 = numenemy
trigger1 = time >= 120 || p2, time >= 60
trigger1 = random < 17
value = 40

[State 131, Stop Guarding];Has special handling to block bombs
type = changestate
trigger1 = !inguarddist
trigger1 = !numhelper(3005);Bomb
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = p2, hitdefattr = SCA, AT
value = 140


;----- AIR GUARD (Guarding) -----
[Statedef 132]
type = A
physics = N

[State 132, Do or do not]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 132, AI Tranquilizer]
type = assertspecial
trigger1 = AIlevel
flag = nohardcodedkeys

[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132

[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 132, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

;[State 132, Stop guarding was here]


;----- GUARD (End) -----
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = A

[State 140, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 140, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

[State 140, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk

[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51


;----- STAND GUARD HIT (Shaking) -----
[Statedef 150]
type = S
physics = N
movetype = H
velset = 0, 0

[State 150, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = ifelse((!AIlevel && command = "holddown") || (AIlevel && !map(ai_blockhigh)), 153, 151)

[State 150, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 150, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 150, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- STAND GUARD HIT 2 (Knocked back) -----
[Statedef 151]
type = S
physics = S
movetype = H
anim = 130

[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 151, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 151, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;----- CROUCH GUARD HIT (Shaking) -----
[Statedef 152]
type = C
physics = N
movetype = H
velset = 0, 0

[State 152, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = ifelse((!AIlevel && command = "holddown") || (AIlevel && !map(ai_blockhigh)), 153, 151)

[State 152, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 152, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 152, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- CROUCH GUARD HIT 2 (Knocked back) -----
[Statedef 153]
type = C
physics = C
movetype = H
anim = 131

[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 153, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = !AIlevel
trigger1 = command = "holddown"
trigger2 = AIlevel
trigger2 = !map(ai_blockhigh)
statetype = C
physics = C

[State 153, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AIlevel
trigger2 = map(ai_blockhigh)
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;----- AIR GUARD HIT (Shaking) -----
[Statedef 154]
type = A
physics = N
movetype = H
velset = 0, 0

[State 154, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

[State 154, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- AIR GUARD HIT 2 (Knocked away) -----
[Statedef 155]
type = A
physics = N
movetype = H
anim = 132

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;==========<CHEAP K.O.>==========
[Statedef 5950]
type = S
physics = S
movetype = H
anim = 5950
velset = 0, 0
ctrl = 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, Assert]
type = assertspecial
trigger1 = 1
flag = nokosnd
flag2 = nomakedust
flag3 = sizepushonly; because anim has no Clsn2

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time
trigger1 = !alive
channel = 0

[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2
trigger1 = !alive
value = 11, 1

[State 5950, FX]
type = playsnd
trigger1 = animelem = 10
value = F 7, 0

[State 5950, FX]
type = explod
trigger1 = animelem = 10
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==========<TAUNT>==========
[Statedef 195]
type = S
movetype = I
physics = S
anim = 195
velset = 0, 0
ctrl = 0

[State 195, Give power]
redirectID = p2, ID
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = min(ceil(p2, powermax / 9.0), 334)

[State 195, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0

[State 195, Loop]
type = changeanim
trigger1 = animelem = 6
trigger1 = !AIlevel
trigger1 = command = "/s"
value = 196
elem = 4

[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<LOSE (Time over)>==========
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, Sound]
type = playsnd
trigger1 = animelem = 4
value = 3, 4
channel = 0


;==========<DRAW GAME (Time over)>==========
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0
sprpriority = -1

[State 175, Ball]
type = helper
trigger1 = animelem = 2 && !numhelper(176)
helpertype = normal
stateno = 176
ID = 176
name = "Iron Ball"
postype = p1
pos = ceil(9 * const(size.xscale)), -18

[State 175, Sound]
type = playsnd
trigger1 = animelem = 7
value = 1, 5
;channel = 1

[State 175, Sound]
type = playsnd
trigger1 = animelem = 7
value = 2, 4
volumescale = 50


;----- IRON BALL -----
[Statedef 176]
type = S
physics = N
anim = 176
velset = 1, 1
sprpriority = -2

[State 176, Accel]
type = veladd
trigger1 = pos y < 0
y = 0.50

[State 176, Sound]
type = playsnd
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5, 4
volumescale = 100

[State 176, Dust]
type = explod
trigger1 = vel y > 0
trigger1 = pos y > -vel y
anim = 7102
sprpriority = -5
postype = p1
pos = vel x * 2, 0
scale = 0.25, 0.25
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 176, Pos]
type = posset
trigger1 = vel y > 0
trigger1 = pos y > -vel y
y = 0

[State 176, Friction]
type = velmul
trigger1 = vel y >= 0
trigger1 = pos y >= 0
x = 0.75
y = 0

[State 176, Kicked]
type = velset
trigger1 = root, anim = 175
trigger1 = root, animelem = 7
x = 3
y = -6

[State 176, Pos]
type = bindtoroot
trigger1 = root, anim = 175
trigger1 = root, animelem = 7
pos = ceil(44 * const(size.xscale)), -37

;[State 176, Spark]
;in ZSS

[State 176, End]
type = destroyself
trigger1 = roundstate = 2


;==========<INITIALIZE>==========
;----- Before Config -----
[Statedef 5900]
type = S
anim = 9999

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, End]
type = changestate
trigger1 = time > 0; Wait for enemy to be loaded
value = 5901; Config


;----- After Config -----
[Statedef 5902]
type = S

[State 5902, Intro vs Pocket Shin Gouki]
type = changestate
trigger1 = numenemy
trigger1 = teamleader = playerno
trigger1 = enemy, teamleader = enemy, playerno
trigger1 = enemy, roundsexisted = 0
trigger1 = enemy, name = "Pocket Shin Gouki" && enemy, authorname = "Phantom.of.the.Server"
value = 6910

[State 5902, Turns Intro]
type = changestate
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, End]
type = changestate
trigger1 = !time
value = ifelse(roundno = 1, 190, 0)


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 193))


;==========<INTRO 1 - STANDING>==========
[Statedef 191]
type = S
anim = 191

[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 191, Lin-Lin]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6015
ID = 6000
name = "Lin-Lin"
postype = p1
pos = ceil(-55 * const(size.xscale)), 0

[State 191, Hat]
type = explod
trigger1 = animelem = 4
anim = 6016
ID = 6016
sprpriority = 1
postype = p1
pos = ceil(-10 * const(size.xscale)), -113
vel = 0, -2.10
accel = 0, 0.30
removetime = 19
ownpal = 1
scale = const(size.xscale), const(size.yscale)

[State 191, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0

[State 191, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
;channel = 1

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 2 - DASHING>==========
[Statedef 192]
type = S
physics = N
anim = 192

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 192, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1
pos = 0, 0
facing = 1

[State 192, Bound]
type = screenbound
trigger1 = 1
value = 0

[State 192, Pos]
type = posset
trigger1 = !time
x = 320 * facing

[State 192, Vel]
type = velset
trigger1 = roundstate != 0
trigger1 = animelemtime(2) < 0
x = -8

[State 192, Cloud]
type = explod
trigger1 = roundstate != 0
trigger1 = (time % 9) = 5
trigger1 = animelemtime(2) < 0
anim = 7107
ID = 7107
sprpriority = -1
postype = p1
pos = 0, 0
scale = 0.5 * const(size.xscale), 0.5
ownpal = 1

[State 192, Anim]
type = changeanim
trigger1 = time
trigger1 = roundstate != 0
trigger1 = numhelper(8999)
trigger1 = animelemtime(2) < 0
trigger1 = (helper(8999), rootdist x) <= 24
value = 192
elem = 2

[State 192, Vel]
type = velset
trigger1 = animelem = 2
x = (helper(8999), rootdist x) / -12.0

[State 192, Pos]
type = posset
trigger1 = numhelper(8999)
trigger1 = animelemtime(11) >= 0
x = helper(8999), pos x

[State 192, Vel]
type = velset
trigger1 = numhelper(8999)
trigger1 = animelemtime(11) >= 0
x = 0

[State 192, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 0
channel = 0

[State 193, Sound]
type = playsnd
trigger1 = animelem = 10
value = 0, 52

[State 193, Dust]
type = explod
trigger1 = animelem = 10
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
ownpal = 1
scale = 0.5, 0.5

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 3 - COFFIN>==========
[Statedef 193]
type = S
anim = 193
sprpriority = 3

[State 193, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 193, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 193, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 193, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 193, Pos]
type = posadd
trigger1 = !time
x = -20

[State 193, Coffin]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6020
ID = 6020
name = "Coffin"
postype = p1
pos = 0, 0

[State 193, Lin-Lin]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6027
ID = 6000
name = "Lin-Lin"
postype = p1
pos = ceil(36 * const(size.xscale)), 0
facing = -1

[State 193, Hide]
type = assertspecial
trigger1 = numhelper(6020)
trigger1 = helper(6020), stateno = 6020
flag = invisible

[State 193, Sprite Priority]
type = sprpriority
trigger1 = animelem = 8
value = 0

[State 193, Vel]
type = velset
trigger1 = animelem = 6
trigger1 = numhelper(8999)
x = (helper(8999), rootdist x) / (animelemtime(11))

[State 193, Pos]
type = posset
trigger1 = animelemtime(11) >= 0
trigger1 = numhelper(8999)
x = helper(8999), pos x
y = 0

[State 193, Vel]
type = velset
trigger1 = animelem = 11
x = 0
y = 0

[State 193, Sound]
type = playsnd
trigger1 = animelem = 11
value = 0, 52

[State 193, Dust]
type = explod
trigger1 = animelem = 11
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 193, Sound]
type = playsnd
trigger1 = animelem = 12
value = 4, 4
channel = 0

[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;----- COFFIN -----
[Statedef 6020]
type = A
physics = N
anim = 6020
velset = 0, 0
sprpriority = 3

[State 6020, End]
type = changestate
trigger1 = root, stateno = 193
trigger1 = root, animelemtime(2) >= 0
trigger2 = root, stateno != 193
value = 6021


[Statedef 6021]
type = A
physics = N
anim = 6021
velset = 0, 0
sprpriority = 3

[State 6021, Shake]
type = envshake
trigger1 = !time
time = 24
ampl = 2
freq = 180
mul = 0.8

[State 6021, Sound]
type = playsnd
trigger1 = !time
value = 5, 20

[State 6021, Left]
type = explod
trigger1 = !time
anim = 6022
ID = 6021
postype = p1
vel = -4, -2
accel = 0, 0.25
sprpriority = 4
scale = const(size.xscale), const(size.yscale)
removetime = 32

[State 6021, Right]
type = explod
trigger1 = !time
anim = 6023
ID = 6021
postype = p1
vel = 4, -4
accel = 0, 0.25
sprpriority = -1
scale = const(size.xscale), const(size.yscale)
removetime = 32

[State 6021, Top]
type = explod
trigger1 = !time
anim = 6024
ID = 6021
postype = p1
vel = 0, -8
accel = 0, 0.5
sprpriority = 4
scale = const(size.xscale), const(size.yscale)
removetime = 32

[State 6021, Front]
type = explod
trigger1 = !time
anim = 6025
ID = 6021
postype = p1
vel = 4, -2
accel = 0, 0.25
sprpriority = 4
scale = const(size.xscale), const(size.yscale)
removetime = 32

[State 6021, Fade]
type = modifyexplod
trigger1 = numexplod
trigger1 = time = [16, 32]
ID = 6021
trans = addalpha
alpha = 256 - (16 * (time - 16)), (16 * (time - 16))

[State 6021, Remove]
type = removeexplod
trigger1 = time >= 32
trigger1 = numexplod

[State 6021, Fade]
type = trans
trigger1 = time >= 32
trans = addalpha
alpha = 256 - (8 * (time - 32)), (8 * (time - 32))

[State 6021, End]
type = destroyself
trigger1 = time >= 64


;====================<TURNS INTRO>====================
[Statedef 6900]
type = A
anim = 6900
velset = 0, 0
ctrl = 0

[State 6900, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6900, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 6900, Camera]
type = helper
trigger1 = !numhelper(8999)
helpertype = normal
stateno = 8999
ID = 8999
name = "Camera"
postype = p1

[State 6900, Pos]
type = posset
trigger1 = !time
x = (-320 + abs(pos x)) * facing

[State 6900, Vel]
type = velset
trigger1 = roundstate != 0
x = (helper(8999), rootdist x) / -40.0
y = -10.25
persistent = 0

[State 6900, Accel]
type = veladd
trigger1 = roundstate != 0
y = 0.5

[State 6900, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6901


;----- Land -----
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0, 0

[State 6901, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6901, Pos]
type = posset
trigger1 = !time
trigger1 = numhelper(8999)
x = helper(8999), pos x

[State 6901, Pos]
type = posset
trigger1 = !time
y = 0

[State 6901, Sound]
type = playsnd
trigger1 = anim = 6901 && animelem = 7
value = 3, 5
channel = 0

[State 6901, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6901, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<INTRO vs POCKET SHIN GOUKI>====================
[Statedef 6910]
type = S
physics = S
anim = 6910

[State 6910, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6910, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = animfreeze

[State 6910, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 6
channel = 0

[State 6910, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S
ctrl = 0
velset = 0, 0

;[State 180, Quote]
;type = victoryquote
;trigger1 = 1
;value = randomrange(1, 22)

[State 180, Win]
type = changestate
trigger1 = command = "/x" || command = "/y" || command = "/z"
value = ifelse(command = "/z", 185, ifelse(command = "/y", 181, 184))

[State 180, Win]
type = changestate
trigger1 = command = "/a" || command = "/b" || command = "/c"
value = ifelse(command = "/c", 184, ifelse(command = "/b", 183, 182))

[State 180, Win Pose]
type = changestate
trigger1 = 1
value = ifelse(random < 200, 181, ifelse(random < 250, 182, ifelse(random < 333, 183, ifelse(random < 500, 184, 185))))


;==========<WIN 1>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
velset = 0, 0

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 181, Sound]
type = playsnd
trigger1 = animelem = 13
value = 4, 5
channel = 0


;==========<WIN 2>==========
[Statedef 182]
type = S
anim = 182
ctrl = 0
velset = 0, 0

[State 182, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 182, Sound]
type = playsnd
trigger1 = animelem = 14
value = 4, 5
channel = 0


;==========<WIN 3>==========
[Statedef 183]
type = S
anim = 183
ctrl = 0
velset = 0, 0

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Anim]
type = changeanim
trigger1 = !time
trigger1 = frontedgedist >= 100
value = 183
elem = 4

[State 183, Anim]
type = turn
trigger1 = !time
trigger1 = frontedgedist < 100

[State 183, Lin-Lin]
type = helper
trigger1 = !time
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6010
ID = 6000
name = "Lin-Lin"
postype = p1
pos = -1, -66

[State 183, Anim]
type = changeanim
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0 && numhelper(6000)
trigger1 = (helper(6000), anim = 6010) && (helper(6000), animelem = 6)
value = 183
elem = 5

[State 183, Sound]
type = playsnd
trigger1 = animelem = 8
value = 4, 6


;==========<WIN 4>==========
[Statedef 184]
type = S
anim = 184
ctrl = 0
velset = 0, 0

[State 184, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 184, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 9
channel = 0

[State 184, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 7
;channel = 1

[State 184, Sound]
type = playsnd
trigger1 = animelem = 7 || animelem = 12 || animelem = 17 || animelem = 22
value = 1, 7
volumescale = 67
;channel = 1


;==========<WIN 5 - WEAPONS FALL>==========
[Statedef 185]
type = S
anim = 185
ctrl = 0
velset = 0, 0

[State 185, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 185, Weapons]
type = helper
trigger1 = numhelper(185) < 4
trigger1 = animelemtime(14) = [1, 4]
helpertype = normal
stateno = 6100
ID = 185
name = "Weapon"
postype = p1
pos = ifelse(animelemtime(14) = 1, 10, ifelse(animelemtime(14) = 2, -14, ifelse(animelemtime(14) = 3, 22, -26))), -36


;----- WEAPONS -----
[Statedef 6100]
type = A
physics = N
anim = 6100
velset = 0, 0
sprpriority = -1

[State 6100, Accel]
type = veladd
trigger1 = 1
y = 0.167

[State 6100, Sound]
type = playsnd
trigger1 = animelemtime(2) < 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5, 4
volumescale = 75
persistent = 0

[State 6100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(random < 200, 6100, ifelse(random < 250, 6105, ifelse(random < 333, 6110, ifelse(random < 500, 6115, 6120))))

[State 6100, Vel]
type = velset
trigger1 = vel y > 0
trigger1 = pos y > -vel y
trigger1 = root, anim = 175 && root, animelemtime(7) < 0
x = 0
y = 0

[State 6100, Pos]
type = posset
triggerall = pos y >= 0
trigger1 = root, anim = 175 && root, animelemtime(7) < 0
trigger2 = animelemtime(2) > 0 && vel y > 0
y = 0

[State 6100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6101


[Statedef 6101]
type = A
physics = N
velset = 0, 0
sprpriority = 1

[State 6101, Pos]
type = posset
trigger1 = !time
y = 0

[State 6101, Flip]
type = turn
trigger1 = !time
trigger1 = random < 500

[State 6101, Sound]
type = playsnd
trigger1 = !time
trigger1 = numhelper(185)
trigger1 = helper(185), ID = ID
value = 5, 4

[State 6101, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(anim + 1)
value = anim + 1

[State 6101, End]
type = destroyself
trigger1 = roundstate = [0, 2]


;==========<CONTINUE?>==========
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==========<FALL RECOVERY>==========
[Statedef 5200]
type = A
physics = N
movetype = H

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035
trigger1 = !animtime
value = 5050

[State 5200, Accel]
type = veladd
trigger1 = time > 0
y = gethitvar(yaccel)

[State 5200, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5201


[Statedef 5201]
type = S
physics = N
movetype = I
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0

[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0

[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5000, 0
channel = 0

[State 5201, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5201, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-16 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
physics = N
movetype = I
anim = 5210
ctrl = 0

[State 5210, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, 3
channel = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5210, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-74 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[state 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[state 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[state 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[state 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[state 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[state 5210, Back]
type = veladd
trigger1 = !time
trigger1 = command = "holdback"
x = const(velocity.air.gethit.airrecover.back)

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;========================<RETREAT>==========================
[Statedef 5230]
type = L
physics = N
movetype = I
anim = 5230
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 5230, Vel Backward]
type = velset
trigger1 = !time
x = -5.263

[State 5230, Vel Forward]
type = velset
triggerall = !time
trigger1 = !AIlevel
trigger1 = command = "holdfwd"
trigger2 = AIlevel
trigger2 = !(p2, ctrl) && random < 500
x = 5.263

[State 5230, Vel]
type = velset
trigger1 = animelem = 6
x = 0

[State 5230, Push]
type = playerpush
trigger1 = animelemtime(6) < 0
value = 0

[State 5230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<TARGET OTG OVERRIDE>========================
[Statedef 1115080]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1115080, Pos]
type = posset
trigger1 = 1
y = 0

[State 1115080, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 1115080, End]
type = changestate
trigger1 = hitshakeover
value = 1115081


[Statedef 1115081]
type = L
physics = C
movetype = H
velset = 0, 0

[State 1115081, Var]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 1115081, End]
type = selfstate
trigger1 = time >= 18
value = 5110


;==================================================================================================
;===========================================<STATE -2>=============================================
;==================================================================================================
[Statedef -2]

[State -2, GuardSound Metal]
type = playsnd
triggerall = moveguarded = 1
triggerall = movehitvar(frame)
trigger1 = stateno = [200, 201] || stateno = 210 || stateno = [220, 221] || stateno = 225 || stateno = 250
trigger2 = stateno = 400 || stateno = 410 || stateno = 420
trigger3 = stateno = 600 || stateno = 610 || stateno = 620
trigger4 = stateno = 4200 || stateno = 4205 || stateno = 4210 || stateno = 4225 || stateno = 4240 || stateno = 4260
value = 5, 21
channel = 3
freqmul = 0.9 + (random / 5000.0)
ignorehitpause = 1

[State -2, Juggle Increase]
type = null; mapadd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(frame)
trigger1 = target, hitfall
trigger1 = target, movetype = H
trigger1 = target, gethitvar(ID) = ID
map = "juggle_count"
value = 1
ignorehitpause = 1

[State -2, Juggle Reset]
type = null; mapset
triggerall = map(juggle_count)
triggerall = p2, time >= 1
trigger1 = p2movetype != H
trigger2 = p2, hitfall = 0
trigger3 = p2statetype = S || p2statetype = C
trigger4 = p2statetype = L && p2, pos y = 0 && p2, vel y = 0
trigger5 = p2stateno = [120, 155] || p2stateno = 5201 || p2stateno = 5210
trigger6 = moveguarded = 1 || movereversed = 1
trigger7 = roundstate != 2
trigger8 = p2, ctrl
map = "juggle_count"
value = 0
ignorehitpause = 1

[State -2, Reset Combo Limits]
type = null
trigger1 = numenemy
trigger1 = p2, time > 0
trigger1 = p2movetype != H || p2stateno = p2, const(statedizzy)
trigger1 = map(jugglereset) || map(wallbounce)
trigger1 = 1 || map(jugglereset) := 0
trigger1 = 1 || map(wallbounce) := 0
ignorehitpause = 1

[State -2, Dark Force KO]
type = velset
trigger1 = !alive
trigger1 = map(darkforce) != 0
trigger1 = stateno = 5030 && time <= 1
x = gethitvar(xvel) * 2.0
y = gethitvar(yvel) - 5.0
ignorehitpause = 1

[State -2, Dark Force Timer]
type = mapadd
trigger1 = map(darkforce) > 0
map = "darkforce"
value = ifelse(map(darkforce) = 1, -2, -1)
ignorehitpause = 1

[State -2, Dark Force Over]
type = mapset
triggerall = map(darkforce) > 0
trigger1 = standby
trigger2 = roundstate != 2
map = "darkforce"
value = -1
ignorehitpause = 1

[State -2, Dark Force Over]
type = mapset
trigger1 = !alive
trigger1 = map(darkforce)
map = "darkforce"
value = 0
ignorehitpause = 1

[State -2, Dark Force Over]
type = mapset
trigger1 = map(darkforce) = 0
trigger1 = map(armorhittime)
map = "armorhittime"
value = 0
ignorehitpause = 1

[State -2, Dark Force Over]
type = mapset
trigger1 = map(darkforce) = 0
trigger1 = map(armorhitvel)
map = "armorhitvel"
value = 0
ignorehitpause = 1

[State -2, Dark Force Disables Tagging Out]
type = mapset
triggerall = map(_iksys_tagSwitchCooldown) < 6
trigger1 = map(darkforce) > 0
trigger2 = stateno = [4500, 4511]
map = "_iksys_tagSwitchCooldown"
value = 6
ignorehitpause = 1

[State -2, Dark Force BG]
type = bgpalfx
trigger1 = stateno = 770 || map(darkforce) != 0
time = 8
color = 0
mul = 192 + ceil(cos(gametime / 20.0) * 64), 64 + ceil(cos(gametime / 20.0) * 16), 0
ignorehitpause = 1

[State -2, Dark Force Warning]
type = palfx
triggerall = !(gametime % 2)
trigger1 = map(darkforce) = [1, 60]
trigger2 = map(darkforce) = -1 && stateno != 4510
time = 1
add = 96, 96, 96
ignorehitpause = 1

[State -2, Dark Force HitOverride]
type = hitoverride
trigger1 = map(darkforce) != 0
attr = SCA, AA, AP, AT
time = 600
stateno = 4500
ignorehitpause = 1

[State -2, Dark Force Stateno]
type = mapset
trigger1 = map(darkforce) != 0
trigger1 = movetype != H
trigger1 = stateno != 4500 && (stateno != [5000, 5199])
map = "armorstate"
value = stateno
ignorehitpause = 1

[State -2, Dark Force Gethit Vel]
type = posfreeze
trigger1 = map(armorhittime) > 0
value = 1
ignorehitpause = 1

[State -2, Dark Force Gethit Vel]
type = posadd
trigger1 = map(armorhittime) > 0
x = map(armorhitvel)
ignorehitpause = 1

[State -2, Dark Force Gethit Dust]
type = explod
trigger1 = map(armorhittime) > 0
trigger1 = pos y = 0
trigger1 = !(gametime % 4)
anim = F 120
sprpriority = -5
postype = p1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State -2, Dark Force Gethit VelMul]
type = mapset
trigger1 = map(armorhitvel)
map = "armorhitvel"
value = 0.85 * map(armorhitvel)
ignorehitpause = 1

[State -2, Dark Force Gethit Time]
type = mapadd
trigger1 = map(armorhittime) > 0
map = "armorhittime"
value = -1
ignorehitpause = 1

[State -2, Dark Force Gethit Over]
type = mapset
trigger1 = map(armorhittime) <= 0
map = "armorhitvel"
value = 0
ignorehitpause = 1

[State -2, Throw in Front]
type = null
trigger1 = 1 || map(grabbehind) := 0
trigger1 = p2dist x < 0
trigger1 = p2dist x < ifelse((facing = p2, facing), -(p2, const(size.ground.front)), -(p2, const(size.ground.back)))
trigger1 = map(grabbehind) := 1
ignorehitpause = 1

[State -2, Unthrowable Flag]
type = mapadd
trigger1 = map(unthrowable) > 0
trigger1 = numenemy
trigger1 = p2stateno != 52 || p2, ctrl || p2, time >= 6
map = "unthrowable"
value = -1
ignorehitpause = 1

[State -2, Unthrowable Flag - Jump Start]
type = mapset
trigger1 = numenemy
trigger1 = p2stateno = 40
trigger1 = p2movetype = I
trigger1 = p2, time < 10
map = "unthrowable"
value = 1
ignorehitpause = 1

[State -2, Unthrowable Flag - Hurt]
type = mapset
triggerall = numenemy
triggerall = p2, anim != 5300
triggerall = p2stateno != p2, const(statedizzy)
trigger1 = p2stateno = [150, 155]
trigger2 = p2stateno = 51
trigger2 = p2, prevstateno = [140, 155]
trigger3 = p2stateno = 5040
trigger4 = p2stateno = 5120;just in case
trigger5 = p2stateno = 5201
trigger6 = p2movetype = H
trigger6 = p2statetype != A
trigger7 = p2movetype = H
trigger7 = p2statetype = A
trigger7 = p2, hitfall = 0
map = "unthrowable"
value = 3
ignorehitpause = 1

[State -2, Damage Scaling - Reset]
type = null
trigger1 = p2movetype != H
trigger1 = p2, dizzy = 0
trigger1 = p2stateno != p2, const(statedizzy)
trigger1 = 1 || map(combototal) := 0
trigger1 = 1 || map(combocheck) := 0
ignorehitpause = 1

[State -2, Damage Scaling - Attack Connected Flag]
type = mapset
trigger1 = movecontact = 1
trigger1 = hitcount <= 1
map = "combocheck"
value = 1
ignorehitpause = 1

[State -2, Damage Scaling - Base Formula]
type = mapset
trigger1 = 1
map = "damagescaling"
value = ifelse(map(combototal) <= 0, 1, ifelse(map(combototal) >= 9, 0.1, 1 - 0.1 * map(combototal)))
ignorehitpause = 1

[State -2, Damage Scaling - Chain Combos]
type = mapset
trigger1 = numtarget
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
trigger1 = ifelse((stateno = 200 || stateno = 201 || stateno = 400), (prevstateno != 200 && prevstateno != 201 && prevstateno != 400 && prevstateno != 430), 1)
trigger1 = ifelse((stateno = 230 || stateno = 430), prevstateno != 430, 1)
map = "damagescaling"
value = 0.75 * map(damagescaling)
ignorehitpause = 1

[State -2, Damage Scaling - Minimum Super Damage]
type = null
triggerall = stateno = [3000, 4999]
;Level 3
trigger1 = map(superlevel) = 3
trigger1 = map(damagescaling) < 0.5
trigger1 = 1 || map(damagescaling) := 0.5
;Level 2
trigger2 = map(superlevel) = 2
trigger2 = map(damagescaling) < 0.4
trigger2 = 1 || map(damagescaling) := 0.4
;Other
trigger3 = stateno = [3000, 4999]
trigger3 = map(damagescaling) < 0.3
trigger3 = 1 || map(damagescaling) := 0.3
ignorehitpause = 1

[State -2, Meter Scaling]
type = null
trigger1 = map(darkforce) > 0
trigger1 = 1 || map(meterscaling) := 0
trigger2 = map(darkforce) <= 0
trigger2 = 1 || map(meterscaling) := map(damagescaling)
ignorehitpause = 1

[State -2, Damage Scaling - Override Fall Defense Bonus]
redirectID = p2, ID
type = assertspecial
trigger1 = numenemy
trigger1 = p2movetype = H
trigger1 = p2, gethitvar(playerno) = playerno
flag = nofalldefenceup
ignorehitpause = 1

[State -2, Damage Scaling - Long Combo Guts]
type = mapset
trigger1 = numenemy
trigger1 = p2, receiveddamage >= (p2, lifemax * 0.50)
map = "damagescaling"
value = map(damagescaling) * ifelse(p2, receiveddamage >= (p2, lifemax * 0.85), 0.75, ifelse(p2, receiveddamage >= (p2, lifemax * 0.70), 0.90, 0.95))
ignorehitpause = 1

[State -2, Damage Scaling - Root Multiplier]
type = attackmulset
trigger1 = 1
value = map(damagescaling); * ifelse(map(counterhit_buffer), 1.2, 1)
ignorehitpause = 1

[State -2, Reset Senpuubu Count]
type = mapset
trigger1 = map(senpubucount)
trigger1 = statetype != A
map = "senpubucount"
value = 0

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
triggerall = target, time > 0
trigger1 = target, stateno = 5040
trigger2 = target, stateno = 5201
trigger3 = target, movetype != H
trigger3 = target, movereversed = 0
ignorehitpause = 1

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time <= 1
triggerall = movetype = H
triggerall = !hitoverridden
triggerall = stateno != [120, 155]
triggerall = gethitvar(damage) = (0, life)
trigger1 = gethitvar(animtype) = 0 && random < 250
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) >= 2 && random < 500
trigger4 = gethitvar(damage) >= 100
trigger5 = gethitvar(fall)
trigger6 = gethitvar(attr) = SCA, HA, HT, HP
value = 5000, (random % 5)
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
trigger1 = stateno = 5100
trigger1 = gethitvar(fall.damage) > 0 || sysvar(1) > 14
trigger2 = stateno = 5050 || stateno = 5100
trigger2 = prevstateno != [5000, 5120]
value = 5000, (random % 5)
lowpriority = 1
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
triggerall = incustomstate
trigger1 = anim = [5000, 5002]
trigger2 = anim = [5010, 5012]
trigger3 = anim = [5020, 5022]
trigger4 = anim = 5030
trigger5 = anim = 5070
trigger6 = anim = 5080
trigger7 = anim = [5100, 5101]
trigger8 = anim = 5170
trigger9 = anim = 5950
trigger10 = anim = 170
value = 5000, (random % 5)
lowpriority = 1
channel = 0

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 0
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
trigger1 = stateno = const(StateGuardBreakRecover)
value = 5000, 1
lowpriority = 1
channel = 0

;[State -2, Voice Pos];happens automatically in Ikemen GO 0.99
;type = sndpan
;trigger1 = 1
;channel = 0
;pan = 0
;ignorehitpause = 1


;==================================================================================================
;===========================================<STATE -3>=============================================
;==================================================================================================
[Statedef -3]

[State -3, ProjContact Reset]
type = mapset
triggerall = map(projcontact)
trigger1 = stateno != 1000 && stateno != 1050 && stateno != 1200 && stateno != 1220 && stateno != 1300 && stateno != 1330 && stateno != 3200 && stateno != 3400
trigger2 = stateno = 1000 && animelemtime(4) < 0
trigger3 = stateno = 1050 && animelemtime(4) < 0
trigger4 = stateno = 1200 && animelemtime(4) < 0
trigger5 = stateno = 1220 && animelemtime(4) < 0
trigger6 = stateno = 1300 && animelemtime(4) < 0
trigger7 = stateno = 1330 && animelemtime(4) < 0
trigger8 = stateno = 3200 && animelemtime(4) < 0
trigger9 = stateno = 3400 && animelemtime(5) < 0
map = "projcontact"
value = 0

[State -3, ProjContact Timer]
type = mapadd
trigger1 = map(projcontact)
map = "projcontact"
value = 1

[State -3, Projectile Flag]
type = mapset
trigger1 = 1
map = "projflag"
value = 0
ignorehitpause = 1

[State -3, Projectile Flag]
type = mapset
triggerall = map(projflag) != 1
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1050 && numhelper(1055)
trigger2 = helper(1055), stateno = 1055
trigger3 = stateno != 1200 && numhelper(1205)
trigger3 = helper(1205), stateno = 1205
trigger4 = stateno != 1220 && numhelper(1225)
trigger4 = helper(1225), stateno = 1205
trigger5 = stateno != 1300 && numhelper(1305)
trigger5 = helper(1305), stateno = 1305
trigger6 = stateno != 1330 && numhelper(1335)
trigger6 = helper(1335), stateno = 1335
trigger7 = stateno != 3200 && numhelper(3204)
trigger7 = helper(3204), stateno = 3204
trigger8 = stateno != 3400 && numhelper(3410)
trigger8 = helper(3410), stateno = 3410
trigger9 = map(darkforce) > 0
map = "projflag"
value = 1
ignorehitpause = 1

[State -3, Special Cancel Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "specialcancel"
value = 0
ignorehitpause = 1

[State -3, Special Cancel Check]
type = mapset
triggerall = stateno = [200, 699]
trigger1 = !AIlevel
trigger1 = time <= 2
trigger1 = stateno = [200, 699]
trigger1 = prevstateno != [200, 4999]
trigger2 = stateno = 200 || stateno = 201
trigger3 = stateno = 210
trigger3 = animelemtime(5) < 0
trigger3 = (movecontact || movereversed) && prevstateno != [200, 699]
trigger4 = stateno = 221
trigger4 = animelemtime(5) < 0
trigger4 = (movecontact || movereversed) && prevstateno != [200, 699]
trigger5 = stateno = 230
trigger5 = animelemtime(5) < 0
trigger5 = (movecontact || movereversed) && prevstateno != [200, 699]
trigger6 = stateno = 400
trigger7 = stateno = 430
trigger8 = stateno = 440
trigger8 = animelemtime(4) < 0
trigger8 = (movecontact || movereversed) && prevstateno != [200, 699]
trigger9 = stateno = 600
trigger9 = animelemtime(4) < 0
trigger9 = (movecontact + movereversed)
trigger10 = stateno = 630
trigger10 = animelemtime(4) < 0
trigger10 = (movecontact || movereversed) && prevstateno != [200, 699]
map = "specialcancel"
value = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = mapset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
map = "supercancel"
value = 0
ignorehitpause = 1

[State -3, Super Cancel Check]
type = mapset
triggerall = stateno = [200, 1999]
trigger1 = map(specialcancel)
trigger2 = stateno = 1000
trigger2 = map(projcontact) = [1, 12]
trigger2 = (anim = 1000 && animelemtime(7) < 12) || animelemtime(6) < 12
trigger3 = stateno = 1050
trigger3 = animelemtime(7) < 12 && map(projcontact) = [1, 12]
trigger4 = stateno = 1300
trigger4 = animelemtime(5) < 12 && map(projcontact) = [1, 12]
trigger5 = stateno = 1330
trigger5 = animelemtime(5) < 12 && map(projcontact) = [1, 12]
map = "supercancel"
value = 1
ignorehitpause = 1

[State -3, Super Cancel Flag Reset]
type = mapset
trigger1 = map(supercancelflag)
trigger1 = (stateno != [3000, 4999]) || movetype = H
map = "supercancel_flag"
value = 0
ignorehitpause = 1

[State -3, Hyper Cancel Flag Reset]
type = mapset
trigger1 = map(hypercancelflag)
trigger1 = (stateno != [3000, 4999]) || movetype = H
map = "hypercancel_flag"
value = 0
ignorehitpause = 1

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1
trigger1 = stateno = 50 && map(jumptype) = 3
trigger2 = stateno = 720 || stateno = 725
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || stateno = [600, 699]
trigger1 = map(jumptype) = 3 && vel y < -1
trigger2 = stateno = 720 || stateno = 725
time = 2
ignorehitpause = 1

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Jump Reset]
type = mapset
trigger1 = map(jumptype)
trigger1 = stateno != 40
trigger1 = statetype != A || movetype = H
map = "jumptype"
value = 0

[State -3, Reset Super Finish Var]
type = mapset
trigger1 = map(superfinish)
trigger1 = roundstate = [0, 2]
map = "superfinish"
value = 0

[State -3, Dark Force Finish]
type = helper
triggerall = winKO
triggerall = map(darkforce)
triggerall = roundstate = 3
triggerall = !numhelper(8600)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = movehit = [1, 4]
trigger1 = stateno = [4200, 4299]
trigger1 = map(superfinish) := 900
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winhyper
triggerall = roundstate = 3
triggerall = !numhelper(8600)
triggerall = p2, gethitvar(playerno) = playerno
trigger1 = numhelper(3025)
trigger1 = helper(3025), map(projcontact)
trigger1 = map(superfinish) := 3000
trigger2 = numhelper(3204)
trigger2 = helper(3204), map(projcontact)
trigger2 = map(superfinish) := 3200
trigger3 = stateno = 3400 && (movecontact ||map(projcontact))
trigger3 = map(superfinish) := 3400
trigger4 = numhelper(3410)
trigger4 = helper(3410), map(projcontact)
trigger4 = map(superfinish) := 3400
trigger5 = stateno = 3501 && numtarget
trigger5 = map(superfinish) := 3500
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Victory Camera]
type = mapset
trigger1 = roundstate != 4
map = "victorycam"
value = 0

[State -3, Victory Camera]
type = mapset
trigger1 = map(cfg_winzoom)
trigger1 = map(zoom_allowed)
trigger1 = alive && !standby
trigger1 = winKO
trigger1 = stateno > 180
trigger1 = roundstate = 4
trigger1 = camerazoom <= 1
trigger1 = screenpos y = [0, gameheight]
trigger1 = numenemy
trigger1 = p2, incustomstate = 0
map = "victorycam"
value = 1

[State -3, Victory Camera]
type = zoom
trigger1 = map(victorycam)
scale = 1.0 / camerazoom
lag = 0.92
stagebound = 1
camerabound = 0
pos = pos x * camerazoom, 0

[State -3, Victory BGM]
type = mapset
map = "victorybgm"
trigger1 = map(victorybgm) != 0
trigger1 = motifstate(victoryscreen) = 0
value = 0

[State -3, Victory BGM]
type = mapadd
map = "victorybgm"
trigger1 = map(cfg_victorybgm)
trigger1 = motifstate(victoryscreen)
trigger1 = teamleader = playerno
trigger1 = matchover
trigger1 = alive
trigger1 = win
value = 1

[State -3, Victory BGM];Assertspecial nomusic does not work here
type = playbgm
trigger1 = map(cfg_victorybgm)
trigger1 = map(victorybgm) = [1, 5]
bgm = ""

[State -3, Victory BGM]
type = playbgm
trigger1 = map(cfg_victorybgm)
trigger1 = map(victorybgm) = 6
bgm = "llwin.mp3"
loop = 0
volume = 100

[State -3, Antifreeze]
type = changestate
triggerall = !ctrl
triggerall = time >= 300
triggerall = roundstate = 2
trigger1 = pos y > 0 && screenpos y > gameheight
trigger2 = !selfanimexist(anim)
value = 5040

[State -3, Antifreeze]
redirectID = p2, ID
type = selfstate
trigger1 = numenemy
trigger1 = movetype != A
trigger1 = p2, time >= 300
trigger1 = p2, incustomstate
trigger1 = p2, stateowner, playerno = playerno
value = 5040


;==================================================================================================
;===========================================<STATE -4>=============================================
;==================================================================================================
[Statedef -4]

[State -4, Helper Damage Scaling - Update Root]
type = null
trigger1 = ishelper
trigger1 = pausetime = 0
trigger1 = !map(combocheck)
trigger1 = movecontact && numtarget
trigger1 = root, map(combocheck) := 1
trigger1 = map(combocheck) := 1
ignorehitpause = 1

[State -4, Damage Scaling - Helper Multiplier]
type = attackmulset
trigger1 = ishelper
value = root, map(damagescaling)
ignorehitpause = 1

[State -4, Helper Juggle Increase]
type = null; rootmapadd
trigger1 = ishelper
trigger1 = movehit = 1
trigger1 = pausetime = 0
trigger1 = numtarget
trigger1 = target, gethitvar(frame)
trigger1 = target, hitfall
trigger1 = target, movetype = H
trigger1 = target, gethitvar(ID) = ID
map = "juggle_count"
value = 1
ignorehitpause = 1
