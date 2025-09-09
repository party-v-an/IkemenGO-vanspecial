; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<SHINPI KAIBYAKU>========================
[Statedef 3000]
type = S
physics = N
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
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
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

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 0
channel = 0

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-55 * const(size.yscale))
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
pos = ceil(0 * const(size.xscale)), ceil(-55 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.125

[State 3000, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3000, Vel]
type = velset
trigger1 = animelem = 3 || animelem = 8 || animelem = 15 || animelem = 20 || animelem = 25
x = 4

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 3
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 18
value = 5, 4
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 18 || animelem = 22 || animelem = 29
value = 1, 2
;channel = 1
stopongethit = 1

[State 3000, Dust]
type = explod
trigger1 = vel x >= 1
trigger1 = !(gametime % 6) && time > 0
anim = 8104
sprpriority = 3
postype = p1
pos = ceil(-28 * const(size.xscale)), 0
vel = -1.5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
trans = addalpha
alpha = 128, 256
ownpal = 1

[State 3000, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000, Hit low]
type = hitdef
trigger1 = animelem = 4 || animelem = 10 || animelem = 19
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.25, -7
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 85), map(sparky) := -55
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, Hit high]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.25, -7
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 85), map(sparky) := -55
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, Hit final]
type = hitdef
trigger1 = animelem = 30
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (1 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -7.0, -6.5
guard.velocity = -10.52
air.velocity = -7.0, -6.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 95), map(sparky) := -58
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, Idle]
type = statetypeset
trigger1 = animelemtime(32) >= 0
movetype = I
persistent = 0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<KOUOU KEN>========================
[Statedef 3100]
type = S
physics = N
movetype = A
anim = 3100
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
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3100, Erase Inputs]
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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
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

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
time = 1
value = A

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 0
channel = 0

[State 3100, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(37 * const(size.xscale)), ceil(-55 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(37 * const(size.xscale)), ceil(-55 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3100, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(3) >= 2 && vel x > 0
x = -0.1

[State 3100, Accel]
type = veladd
trigger1 = animelemtime(3) >= 1
y = 0.5

[State 3100, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = 6.25
y = -9.25

[State 3100, Vel]
type = velset
trigger1 = animelem = 13
trigger2 = vel x < 0
x = 0

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 1
channel = 0

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
;channel = 1
stopongethit = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = animelemtime(3) = 0
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10 || animelem = 12 || animelem = 14
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (4 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 8
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 2, 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -2.75, -9.33
guard.velocity = 0
air.velocity = -2.75, -9.33
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3100, Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I
persistent = 0

[State 3100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3101


;----- Land -----
[Statedef 3101]
type = S
physics = N
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3101, Pos]
type = posset
trigger1 = 1
y = 0

[State 3101, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3101, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3101, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<KILLER SATELLITE-BOUND PUNCH>========================
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
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
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
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

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(8) < 0
time = 1
value = SCA

[State 3200, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 0
channel = 0

[State 3200, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(-37 * const(size.xscale)), ceil(-49 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(-37 * const(size.xscale)), ceil(-49 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 12
channel = 0

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 2
;channel = 1
stopongethit = 1

[State 3200, Pos]
type = posadd
trigger1 = animelem = 5
x = 30 * const(size.xscale)

[State 3200, Pos]
type = posadd
trigger1 = animelem = 6
x = 12 * const(size.xscale)

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 100, 25
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 45) * (map(sparkx.max) := 70), map(sparky) := -55
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3200, Dust]
type = helper
trigger1 = time > 0
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = ceil((p2bodydist x + 52) / 2.0), 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3200, Next]
type = changestate
triggerall = movecontact || movereversed
triggerall = animelemtime(7) >= 0 && animelemtime(9) < 0
trigger1 = !AIlevel
trigger1 = map(cmd_236p)
trigger2 = AIlevel
value = 3201

[State 3200, Idle]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
persistent = 0

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Connected -----
[Statedef 3201]
type = S
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3201, Pos]
type = posadd
trigger1 = animelem = 1
x = 22 * const(size.xscale)

[State 3201, Pos]
type = posadd
trigger1 = animelem = 2
x = 19 * const(size.xscale)

[State 3201, Pos]
type = posadd
trigger1 = animelem = 3
x = 24 * const(size.xscale)

[State 3201, Pos]
type = posadd
trigger1 = animelem = 4
x = 22 * const(size.xscale)

[State 3201, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 7
channel = 0

[State 3201, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
;channel = 1
stopongethit = 1

[State 3201, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 3200
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 100, 25
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 24, 24
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 65), map(sparky) := -55
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3201, Dust]
type = helper
trigger1 = time > 0
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = ceil((p2bodydist x + 48) / 2.0), 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3201, Next]
type = changestate
triggerall = movecontact || movereversed
triggerall = animelemtime(4) >= 0 && animelemtime(6) < 0
trigger1 = !AIlevel
trigger1 = map(cmd_41236p)
trigger2 = AIlevel
value = 3202

[State 3201, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 3201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Third -----
[Statedef 3202]
type = S
physics = N
movetype = A
anim = 3202
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3202, Pos]
type = posadd
trigger1 = animelem = 2
x = 19 * const(size.xscale)

[State 3202, Pos]
type = posadd
trigger1 = animelem = 3
x = 24 * const(size.xscale)

[State 3202, Pos]
type = posadd
trigger1 = animelem = 4
x = 22 * const(size.xscale)

[State 3202, Vel]
type = velset
trigger1 = animelem = 6
x = 8

[State 3202, Vel]
type = velset
trigger1 = animelem = 8
x = 0

[State 3202, Sound]
type = playsnd
trigger1 = animelem = 6
value = 4, 12
channel = 0

[State 3202, Sound]
type = playsnd
trigger1 = animelem = 6
value = 1, 2
;channel = 1
stopongethit = 1

[State 3202, Hit]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 3200
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 100, 25
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 24, 32
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -10.52, 0
guard.velocity = -10.52
air.velocity = -5.25, -7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 50) * (map(sparkx.max) := 95), map(sparky) := -55
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0

[State 3202, Dust]
type = helper
trigger1 = time > 0
trigger1 = movehit = 1
stateno = 3205
ID = 3205
name = "Dust"
postype = p1
pos = ceil((p2bodydist x + 75) / 2.0), 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3202, Cutscene]
type = helper
trigger1 = movecontact = 1
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
trigger1 = numtarget(3200)
trigger1 = numenemy
trigger1 = enemy, teammode != simul
trigger1 = cond(numpartner, partner, standby, 1)
helpertype = normal
stateno = 3260
ID = 3260
name = "Satellite Cutscene"
postype = left
ownpal = 1

[State 3202, Next]
type = changestate
trigger1 = movecontact >= 2
trigger1 = animelemtime(7) >= 0 && animelemtime(9) < 0
value = 3203

[State 3202, Idle]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
persistent = 0

[State 3202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Beam -----
[Statedef 3203]
type = S
physics = N
movetype = A
anim = 3203
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3203, Beam]
type = helper
trigger1 = !time
trigger1 = numtarget(3200)
helpertype = normal; projectile
stateno = 3250
ID = 3250
name = "Satellite Beam"
postype = p1
pos = (target(3200), pos x - pos x) * facing, 0
size.xscale = 0.5
size.yscale = 16
ownpal = 1

[State 3203, End]
type = changestate
trigger1 = !numhelper(3250)
trigger2 = time >= 60
value = 3204

[State 3203, Vel]
type = velmul
trigger1 = 1
x = 0.7

[State 3203, Vel]
type = velset
trigger1 = !time
x = -30

[State 3203, glow]
type = helper
trigger1 = !numhelper(3206)
helpertype = normal
stateno = 3206
ID = 3206
name = "Lighting FX"
postype = p1
ownpal = 1

[State 3203, glow]
type = palfx
trigger1 = numhelper(3206)
time = 1
mul = 128, 128, 128


;----- Beam Over -----
[Statedef 3204]
type = S
physics = N
movetype = I
anim = 3204
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3204, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Hit by Beam -----
[Statedef 3270]
type = A
physics = N
movetype = H
velset = 0, 0

[State 3270, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(7696)
value = ifelse(anim = 5002, 5012, 5002)

[State 3270, Anim]
type = changeanim
trigger1 = selfanimexist(7696)
trigger1 = anim != 7696
value = 7696

[State 3270, Anim]
type = changeanim
trigger1 = anim != 7696
value = anim

[State 3270, Shocked Anim PalFX]
type = palfx
trigger1 = anim = 7696 || anim = 9010
time = 1
color = 256

[State 3270, Shocked Anim PalFX]
type = palfx
trigger1 = random < 500
trigger1 = anim = 7696 || anim = 9010
time = 1
color = -256
invertall = 1

[State 3270, Normal Palfx]
type = palfx
trigger1 = !(gametime % 2)
trigger1 = anim != 7696 && anim != 9010
time = 1
color = -256
invertall = 1

[State 3270, End]
type = selfstate
trigger1 = hitshakeover
value = 5030


;======================<KISAKI NO KOURIN>========================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000 + 0 * (map(superlevel) := 2)

[State Damage Scaling - Add]
type = mapadd
trigger1 = !time
trigger1 = map(combocheck)
trigger1 = 1 || map(combocheck) := 0
map = "combototal"
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3300, Erase Inputs]
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
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
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

[State 3300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(3) < 1
time = 1
value = SCA

[State 3300, Sound]
type = playsnd
trigger1 = time = 3
value = 6, 1
channel = 0

[State 3300, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Super Charge"
postype = p1
pos = ceil(11 * const(size.xscale)), ceil(-38 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(11 * const(size.xscale)), ceil(-38 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3300, Vel]
type = velset
trigger1 = animelemtime(3) = 1
x = 9
y = 9

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0

[State 3300, Sound]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
;channel = 1
stopongethit = 1

[State 3300, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
ID = 3300
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 70, 18
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 30
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -7.51, 0
guard.velocity = -7.51
air.velocity = -5, 1.5
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 60), map(sparky) := -20
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0

[State 3300, P2 State]
type = targetstate
trigger1 = movehit && numtarget(3300)
trigger1 = target(3300), statetype != A
ID = 3300
value = 3302
ignorehitpause = 1

[State 3300, p1state]
type = changestate
trigger1 = movehit && numtarget(3300)
trigger1 = target(3300), statetype != A
value = 3310
ignorehitpause = 1

[State 3300, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3301


;----- Land -----
[Statedef 3301]
type = S
physics = S
movetype = I
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3301, Pos]
type = posset
trigger1 = 1
y = 0

[State 3301, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 3302]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 3302, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 3302, Pos]
type = posset
trigger1 = 1
y = 0

[State 3302, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3302, End]
type = changestate
trigger1 = time >= 30
value = 3303


[Statedef 3303]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 3303, Anim]
type = changeanim
trigger1 = !time
value = 5017

[State 3303, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 3303, End]
type = selfstate
trigger1 = time >= 30
value = 5000


;----- Ressen Ha -----
[Statedef 3310]
type = A
physics = N
movetype = A
anim = 3310
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3310, Corner Push]
type = mapset
trigger1 = !time
map = "cornerpush"
value = 0

[State 3310, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3310, Width]
type = width
trigger1 = vel y > 0
edge = ceil(40 * const(size.xscale)), 0

[State 3310, Pos]
type = bindtotarget
trigger1 = !time
trigger1 = numtarget(3300)
ID = 3300
pos = 0, -(target(3300), const(size.height))

[State 3310, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.4

[State 3310, Vel]
type = velset
trigger1 = animelem = 3
x = 0
y = -5

[State 3310, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 4
channel = 0

[State 3310, Loop];for tall characters
type = changeanim
trigger1 = animelemtime(17) = 0
trigger1 = pos y < -64
value = 3310
elem = 9

[State 3310, Sound]
type = playsnd
trigger1 = animelem = 5 || animelem = 9 || animelem = 13
value = 1, 2
;channel = 1
stopongethit = 1

[State 3310, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 40

[State 3310, Hit]
type = hitdef
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 5
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 4
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
guard.velocity = 0
air.velocity = -5.33, -6.46
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -32
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3310, End]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3311


;----- Combo -----
[Statedef 3311]
type = S
physics = N
movetype = A
anim = 3311
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3311, Pos]
type = posset
trigger1 = !time
y = 0

[State 3311, Pos]
type = posadd
trigger1 = animelem = 5
x = 40 * const(size.xscale)

[State 3311, Pos]
type = posadd
trigger1 = animelem = 11
x = 36 * const(size.xscale)

[State 3311, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.2

[State 3311, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3311, Vel]
type = velset
trigger1 = animelem = 12
x = 6

[State 3311, Sound]
type = playsnd
trigger1 = animelem = 1
value = 4, 3
channel = 0

[State 3310, Sound]
type = playsnd
trigger1 = animelem = 6
value = 4, 5
channel = 0

[State 3310, Sound]
type = playsnd
trigger1 = animelem = 14
value = 4, 8
channel = 0

[State 3311, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 6
value = 1, 2
;channel = 1
stopongethit = 1

[State 3311, Sound]
type = playsnd
trigger1 = animelem = 13 || animelem = 16
value = 1, 5
;channel = 1
stopongethit = 1

[State 3311, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3311, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = ceil(14 * const(size.xscale)), 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3311, Hit low]
type = hitdef
trigger1 = animelem = 1 || animelem = 13
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.33, -6.45
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := ifelse((animelem = 13), -36, -22)
hitsound = s2, ifelse((animelem = 13), 5, 2)
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3311, Hit high]
type = hitdef
trigger1 = animelem = 7
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 12
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -4.49, 0
guard.velocity = -4.49
air.velocity = -5.33, -6.45
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -74
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3311, Hit final]
type = hitdef
trigger1 = animelem = 17
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 1)
attr = S, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Up
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = -6.0, -9.0
guard.velocity = -7.51
air.velocity = -6.0, -9.0
airguard.velocity = -6.00, -1.00
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4850
p1sprpriority = sprpriority
forcestand = 1
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 40) * (map(sparkx.max) := 80), map(sparky) := -80
hitsound = s2, 5
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3311, Anim]
type = changeanim
trigger1 = anim = 3311
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(1) >= 0 && animelemtime(2) <= 0
trigger1 = hitpausetime <= 10
value = 3311
elem = 2
ignorehitpause = 1

[State 3311, Anim]
type = changeanim
trigger1 = anim = 3311
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 3311
elem = 3
ignorehitpause = 1

[State 3311, Anim]
type = changeanim
trigger1 = anim = 3311
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
trigger1 = hitpausetime <= 10
value = 3311
elem = 8
ignorehitpause = 1

[State 3311, Anim]
type = changeanim
trigger1 = anim = 3311
trigger1 = hitpausetime
trigger1 = movecontact = 1 || movereversed = 1
trigger1 = animelemtime(17) >= 0 && animelemtime(18) <= 0
trigger1 = hitpausetime <= 10
value = 3311
elem = 18
ignorehitpause = 1

[State 3311, Idle]
type = statetypeset
trigger1 = animelemtime(19) >= 0
movetype = I
persistent = 0

[State 3311, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1