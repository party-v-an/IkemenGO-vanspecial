; __________________________________
;| Lei-Lei by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<CHUUKADAN>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3000, Strength]
type = mapset
trigger1 = !AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(map(cmd_strength_yz), 2, ifelse(map(cmd_strength_xz), 1, 0))
ignorehitpause = 1
persistent = 0

[State 3000, AI Strength]
type = mapset
trigger1 = AIlevel
trigger1 = time <= 0
map = "strength"
value = ifelse(p2bodydist x > 180, 2, ifelse(p2bodydist x > 120, 1, 0))
ignorehitpause = 1

[State 3000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-4 * const(size.xscale)), ceil(-42 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-4 * const(size.xscale)), ceil(-42 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(6) < -1
time = 1
value = SCA

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 3000, Bomb]
type = helper
trigger1 = animelem = 6
helpertype = normal; projectile?
stateno = 3004
ID = 3005
name = "Bomb"
postype = p1
pos = ceil(88 * const(size.xscale)), -90
ownpal = 1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 0
channel = 0

[State 3000, spinsnd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
;channel = 1
stopongethit = 1

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- < DETONATE > -----
[Statedef 3002]
type = S
movetype = I
physics = S
anim = 3002
velset = 0, 0
ctrl = 0

[State 3002, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5000, 0
channel = 0

[State 3002, Sound]
type = playsnd
trigger1 = animelem = 3 && numhelper(3005)
trigger1 = abs(helper(3005), rootdist x) > 155 * const(size.xscale)
value = 4, 9
channel = 0

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target burned -----
[Statedef 7697]
type = A
physics = N
movetype = H
velset = 0, 0

[State 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(7697)
value = 7697

[State 7697, End]
type = selfstate
trigger1 = !time
trigger1 = !selfanimexist(7697)
value = 5030

[State 7697, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 7697, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 7697, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100


;======================<JIREITOU>=============================
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000 + 0 * (map(superlevel) := 2)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-3 * const(size.xscale)), ceil(-27 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-3 * const(size.xscale)), ceil(-27 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3200, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 1
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 2
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
;channel = 1
stopongethit = 1

[State 3200, Blade Dispenser]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3204
ID = 3204
name = "Blade Dispenser"
postype = p1
pos = ceil(64 * const(size.xscale)), 0
supermovetime = p2, pausetime
ownpal = 1

[State 3200, NHB]
type = nothitby
trigger1 = time <= 52
time = 1
value = SCA

[State 3200, Loop]
type = changeanim
trigger1 = time < 88
trigger1 = animelem = 9
value = 3200
elem = 7

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Offscreen -----
[Statedef 3202]
type = S
physics = S
anim = 3202
ctrl = 0
sprpriority = 2

[State 3202, Bound]
type = screenbound
trigger1 = anim = 3202
value = 0
movecamera = 0, 1

[State 3202, Vel]
type = velset
trigger1 = anim = 3202
x = ifelse(backedgedist < -160, 12, 6)

[State 3202, Steps]
type = playsnd
trigger1 = anim = 3202 && (animelem = 4 || animelem = 8)
value = 0, ifelse((animelem = 4), 103, 106)

[State 3202, Change]
type = changeanim
trigger1 = anim = 3202
trigger1 = backedgedist >= 40
trigger2 = time >= 120
value = 3203

[State 3202, steps]
type = playsnd
trigger1 = anim = 3203
value = 0, 101
persistent = 0

[State 3202, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 3203
value = 0
ctrl = 1


;======================<TENRAIHA>=============================
[Statedef 3400]
type = S
physics = S
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -3000 + 0 * (map(superlevel) := 3)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3400, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3400, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(103 * const(size.xscale)), ceil(-128 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(103 * const(size.xscale)), ceil(-128 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3400, NHB]
type = nothitby
trigger1 = animelemtime(7) < 1
time = 1
value = SCA

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 7
channel = 0

[State 3400, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(10) < 0
player = 30 * const(size.xscale), 0

[State 3400, Shockwave]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 3405
ID = 3405
name = "Shockwave"
postype = p1
pos = ceil(106 * const(size.xscale)), 0

[State 3400, Dust]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 3406
ID = 3406
name = "Red Dust"
postype = p1
pos = ceil(106 * const(size.xscale)), 0
size.xscale = 2
ownpal = 1

[State 3400, Sound]
type = playsnd
trigger1 = animelem = 9
value = 5, 3

[State 3400, Shake]
type = envshake
trigger1 = animelem = 9
time = 32
freq = 180
ampl = 6
mul = 0.85

[State 3400, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = animelem = 7 || animelem = 8 || animelem = 9
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 2)
ID = 3400
attr = S, HA
damage = 200, 50
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = H
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 76) * (map(sparkx.max) := 138), map(sparky) := ifelse((animelem = 7), -54, ifelse((animelem = 8), -30, -13))
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
air.velocity = -2.5, -5
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
persistent = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
down.velocity = 0, 0
down.hittime = 40
;envshake.time = 12
;envshake.freq = 180
;envshake.ampl = ifelse((gametime % 2), -2, 2)

[State 3400, Squish]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(3400)
trigger1 = target(3400), pos y >= -8
trigger1 = !(target, time) && (target(3400), stateno = [5000, 5010])
value = 3490
ignorehitpause = 1

[State 3400, Ball]
type = helper
trigger1 = animelemtime(9) = [0, 63]
trigger1 = !(animelemtime(9) % 9)
helpertype = normal; projectile
stateno = 3410
ID = 3410
name = "Spiked Ball"
postype = p1
pos = ceil(ifelse(animelemtime(9) = 0, 50, ifelse(animelemtime(9) = 9, 106, 106 + (-50 + (random / 10.0)))) * const(size.xscale)), 0
facing = ifelse(random < 500, -1, 1)
ownpal = 1

[State 3400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Squished -----
[Statedef 3490]
type = L
physics = N
movetype = H
velset = 0, 0

[State 3490, Hitfall]
type = hitfallset
trigger1 = 1
value = 1

[State 3490, Pos]
type = posset
trigger1 = 1
y = 0

[State 3490, Anim]
type = changeanim
trigger1 = !hitshakeover
trigger1 = !selfanimexist(7689)
value = 5012

[State 3490, Anim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(7689)
value = 7689

[State 3490, Anim]
type = changeanim
trigger1 = hitshakeover
trigger1 = anim = 5012
value = 5100

[State 3490, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5100
value = 5110

[State 3490, Wait for balls]
type = nothitby
trigger1 = time < 30
value = SCA
time = 1

[State 3490, No Clsn2]
type = changeanim
trigger1 = anim = 7689
trigger1 = time >= 30
trigger1 = animelemvar(numclsn2) = 0
value = 5110

[State 3490, Scale]
type = angledraw
trigger1 = anim != 7689
trigger1 = time < 10
scale = 1, 1 - 0.05 * time

[State 3490, Scale]
type = angledraw
trigger1 = anim != 7689
trigger1 = time = [10, 50]
scale = 1, 0.5

[State 3490, Scale]
type = angledraw
trigger1 = anim != 7689
trigger1 = time = [50, 60]
scale = 1, 0.5 - 0.05 * (time - 50)

[State 3490, No FX]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 3490, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = time >= 60
value = 5110


;======================<BOWLING>=============================
[Statedef 3500]
type = S
physics = S
movetype = A
anim = 3500
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000 + 0 * (map(superlevel) := 1)
facep2 = 1

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]), 2, 1))

[State 3500, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(29 * const(size.xscale)), ceil(-51 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3500, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(29 * const(size.xscale)), ceil(-51 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3500, NHB]
type = nothitby
trigger1 = animelemtime(3) < 1
time = 1
value = SCA

[State 3500, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 3500, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(36 * const(size.xscale))
air.juggle = 0 * (map(juggle_start) := 0 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 3500
attr = S, HT
hitflag = M
priority = 7, Miss
numhits = 0
sparkno = -1 + 0 * (map(sparkno) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3501
p2stateno = 3505
animtype = Diagup
ground.velocity = -4.5, -9
air.velocity = -4.5, -9
fall = 1
fall.recover = 0
down.recover = 1
hitsound = s2, 800
hitsound.channel = 2
ground.cornerpush.veloff = 0

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5000, 0
channel = 0

[State 3500, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 1
;channel = 1
stopongethit = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 3500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 3501]
type = S
physics = N
movetype = A
anim = 3501
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetstate
trigger1 = !time
ID = 3500
value = 3505

[State 3501, Anim]
type = changeanim
trigger1 = !time
trigger1 = stagefrontedgedist >= stagebackedgedist
value = 3501
elem = 4

[State 3501, Turn]
type = turn
trigger1 = !time
trigger1 = stagefrontedgedist < stagebackedgedist

[State 3501, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(23) < 0
edge = ceil(70 * const(size.xscale)), 0

[State 3501, Throw]
type = targetfacing
trigger1 = animelemtime(21) < 0
ID = 3500
value = -1

[State 3501, Throw]
type = targetfacing
trigger1 = animelemtime(21) >= 0
value = 1
ID = 3500
persistent = 0

[State 3501, Throw]
type = targetstate
trigger1 = animelem = 4
ID = 3500
value = 3506

[State 3501, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 1
channel = 2

[State 3501, Sound]
type = playsnd
trigger1 = animelem = 5
value = 3, 11
channel = 0

[State 3501, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -28 * const(size.xscale), 0
ID = 3500

[State 3501, bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 0, 0
ID = 3500

[State 3501, bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 36 * const(size.xscale), 0
ID = 3500

[State 3501, bind squish]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(8) < 0
pos = 63 * const(size.xscale), -27
ID = 3500

[State 3501, bind spin]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(22) < 0
pos = -4 * const(size.xscale), -58
ID = 3500

[State 3501, bind 22]
type = targetbind
trigger1 = animelem = 22
pos = 94 * const(size.xscale), 0
ID = 3500

[State 3501, Throw]
type = targetstate
trigger1 = animelem = 22
value = 3507
ID = 3500

[State 3501, Damage]
type = targetlifeadd
trigger1 = numtarget(3500)
trigger1 = target(3500), stateno = 3508 && target(3500), time = 1
value = floor(-180 * map(damagescaling))
ID = 3500
dizzy = 0
kill = 1

[State 3501, Give Power]
type = targetpoweradd
trigger1 = numtarget(3500)
trigger1 = target(3500), stateno = 3508 && target(3500), time = 1
value = 100
ID = 3500

[State 3501, Hits]
type = hitadd
trigger1 = numtarget(3500)
trigger1 = target(3500), stateno = 3508 && target(3500), time = 1
value = 10

[State 3501, Sound]
type = playsnd
trigger1 = animelem = 21
value = 3, 6
channel = 0

[State 3501, Sound]
type = playsnd
trigger1 = animelem = 22
value = 5, 17
channel = 5

[State 3501, Ball]
type = helper
trigger1 = animelem = 22
trigger1 = numtarget(3500)
trigger1 = target(3500), stateno = 3507
helpertype = normal
stateno = 3510
ID = 3510
name = "Bowling Ball"
postype = p1
pos = ceil(94 * const(size.xscale)), 0
facing = 1
ownpal = 1
persistent = 0

[State 3501, Throw]
type = targetstate
triggerall = animelemtime(22) >= 0 && numtarget(3500)
triggerall = target(3500), stateno = 3507
trigger1 = target(3500), frontedgedist < -20
trigger2 = target(3500), backedgedist < -20
trigger3 = target(3500), time >= 180
value = 3508
ID = 3500

[State 3501, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 3501, Camera]
type = width
trigger1 = 1
edge = 280, 40

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351110
name = "Pin"
postype = back
pos = ceil(308 * (gamewidth / 320.0)), 16
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = 12
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351109
name = "Pin"
postype = back
pos = ceil(305 * (gamewidth / 320.0)), 6
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = 2
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351108
name = "Pin"
postype = back
pos = ceil(303 * (gamewidth / 320.0)), -6
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -10
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351107
name = "Pin"
postype = back
pos = ceil(302 * (gamewidth / 320.0)), -16
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -20
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351106
name = "Pin"
postype = back
pos = ceil(280 * (gamewidth / 320.0)), 12
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = 8
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351105
name = "Pin"
postype = back
pos = ceil(279 * (gamewidth / 320.0)), 0
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -4
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351104
name = "Pin"
postype = back
pos = ceil(278 * (gamewidth / 320.0)), -12
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -16
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351103
name = "Pin"
postype = back
pos = ceil(252 * (gamewidth / 320.0)), 6
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = 2
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351102
name = "Pin"
postype = back
pos = ceil(251 * (gamewidth / 320.0)), -6
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -10
facing = -1
ownpal = 1

[State 3501, Pin]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3511
ID = 351101
name = "Pin"
postype = back
pos = ceil(224 * (gamewidth / 320.0)), 0
size.xscale = 0.625
size.yscale = 0.75
size.shadowoffset = -4
facing = -1
ownpal = 1

[State 3501, Sound]
type = playsnd
trigger1 = animelem = 11 || animelem = 15 || animelem = 19
value = 1, 6
;channel = 1
stopongethit = 1

[State 3501, Anim]
type = changeanim
trigger1 = numtarget(3500)
trigger1 = animelemtime(24) >= 0 && animelemtime(25) < 0
trigger1 = target(3500), stateno = 3507
value = 3501
elem = 24

[State 3501, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 3505]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 2

[State 3505, Anim]
type = changeanim2
trigger1 = !time
value = 3505

[State 3505, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3506]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 3506, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3506, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3506, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3506, Anim]
type = changeanim2
trigger1 = !time
trigger1 = !selfanimexist(7689)
value = 3506

[State 3506, Anim]
type = changeanim
trigger1 = time <= 19 && selfanimexist(7689)
value = 7689
elem = 1

[State 3506, Anim]
type = changeanim
trigger1 = (time = [20, 23]) && selfanimexist(7689)
value = 7689
elem = 2

[State 3506, Anim]
type = changeanim2
trigger1 = time >= 24
value = 3506
elem = 3

[State 3506, Fade]
type = palfx
trigger1 = time >= 24
trigger1 = !selfanimexist(7688)
add = -255, -255, -255
time = 2

[State 3506, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3507]
type = A
physics = N
movetype = H
velset = 12, 0
ctrl = 0
sprpriority = 3

[State 3507, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3507, Pos]
type = posset
trigger1 = 1
y = 0

[State 3507, Anim]
type = changeanim2
trigger1 = !selfanimexist(7688)
value = 3507

[State 3506, Anim]
type = changeanim
trigger1 = selfanimexist(7688)
value = 7688
elem = 1

[State 3507, End]
type = changestate
trigger1 = time >= 180
trigger1 = frontedgedist <= 0
value = 3508

[State 3507, Fade]
type = palfx
trigger1 = !selfanimexist(7688)
add = -255, -255, -255
time = 2


[Statedef 3508]
type = A
physics = N
movetype = H
velset = 0, 0
anim = 5030

[State 3508, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3508, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 6

[State 3508, Anim]
type = changeanim
trigger1 = anim != 5052
trigger1 = selfanimexist(5052)
value = 5052

[State 3508, Anim]
type = changeanim
trigger1 = vel y >= const240p(2)
trigger1 = anim = 5052
trigger1 = selfanimexist(5062)
value = 5062

[State 3508, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5030 && selfanimexist(5035)
value = 5035

[State 3508, Anim]
type = changeanim
triggerall = !animtime
trigger1 = anim = 5030 && !selfanimexist(5035)
trigger2 = anim = 5035
value = 5050

[State 3508, Fade]
type = palfx
trigger1 = !time
trigger1 = !selfanimexist(7688)
add = -255, -255, -255
sinadd = 255, 255, 255, 80
time = 20

[State 3508, Accel]
type = veladd
trigger1 = 1
y = 0.4850; yaccel

[State 3508, Vel]
type = velset
trigger1 = !time
x = -4
y = -11

[State 3508, Track Nearest Player]
type = velset
trigger1 = !time
x = ((p2, pos x - pos x) * facing + 60) / 46.0

[State 3508, Track Exact Player]
type = velset
trigger1 = !time
trigger1 = gethitvar(playerno)
trigger1 = playerIDexist(player(gethitvar(playerno)), ID)
x = ((player(gethitvar(playerno)), pos x - pos x) * facing + 60) / 46.0

[State 3508, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100
