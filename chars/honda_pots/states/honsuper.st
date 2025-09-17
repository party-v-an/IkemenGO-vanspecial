; _______________________________________
;| Edmond Honda by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<ONI MUSOU>=============================
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

[State 3000, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3000, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 4
channel = 0

[State 3000, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
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
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 12

[State 3000, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 3000, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 8 * const(size.xscale)

[State 3000, Pos]
type = posadd
trigger1 = animelem = 5
x = 16 * const(size.xscale)

[State 3000, Vel]
type = velset
trigger1 = animelem = 5
x = 10.64 * const(size.xscale)
y = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 3000, Shield]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3005
ID = 3005
name = "Shield"
postype = p1
ownpal = 1

[State 3000, Shield]
type = hitby
trigger1 = numhelper(3005)
value2 = SCA, AA, AT, HP
time = 1
ignorehitpause = 1

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
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
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3000, End]
type = changestate
trigger1 = animelemtime(5) >= 17
trigger2 = animelemtime(5) > 0
trigger2 = (movecontact = [1, 4]) || (movereversed = [1, 4])
trigger3 = animelemtime(5) >= 9
trigger3 = frontedgebodydist <= 0
value = 3001

[State 3000, Wind]
type = explod
trigger1 = animelemtime(5) = 0
trigger2 = animelemtime(5) = 3
trigger3 = animelemtime(5) = 6
trigger4 = animelemtime(5) = 9
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Second -----
[Statedef 3001]
type = S
physics = N
movetype = A
anim = 3001
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3001, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 52

[State 3001, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3001, Sound]
type = playsnd
trigger1 = animelem = 11
value = 7, 12

[State 3001, Dust]
type = helper
trigger1 = animelem = 11
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3001, Type]
type = statetypeset
trigger1 = animelem = 11
statetype = A
physics = N

[State 3001, Pos]
type = posadd
trigger1 = animelem = 9 || animelem = 10
x = 8 * const(size.xscale)

[State 3001, Pos]
type = posadd
trigger1 = animelem = 11
x = 16 * const(size.xscale)

[State 3001, Vel]
type = velset
trigger1 = animelem = 11
x = 10.64 * const(size.xscale)
y = 0

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3001, Hit]
type = hitdef
trigger1 = animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -4.00, -5.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3001, End]
type = changestate
trigger1 = animelemtime(11) >= 17
trigger2 = animelemtime(11) > 0
trigger2 = (movecontact = [1, 4]) || (movereversed = [1, 4])
value = 3002

[State 3001, Wind]
type = explod
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(11) = 3
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Recover -----
[Statedef 3002]
type = S
physics = N
movetype = I
anim = 3002
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3002, Pos]
type = posset
trigger1 = animelem = 5
y = 0

[State 3002, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 52

[State 3002, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<MAX ONI MUSOU>=============================
[Statedef 3050]
type = S
physics = N
movetype = A
anim = 3050
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
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3050, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State 3050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(5) < 1
time = 1
value = SCA

[State 3050, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 4
channel = 0

[State 3050, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(0 * const(size.xscale)), ceil(-82 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 5
value = 7, 12

[State 3050, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3050, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 3050, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = 8 * const(size.xscale)

[State 3050, Pos]
type = posadd
trigger1 = animelem = 5
x = 16 * const(size.xscale)

[State 3050, Vel]
type = velset
trigger1 = animelem = 5
x = 10.64 * const(size.xscale)
y = 0

[State 3050, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 0

[State 3050, Shield]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3005
ID = 3005
name = "Shield"
postype = p1
ownpal = 1

[State 3050, Shield]
type = hitby
trigger1 = numhelper(3005)
value2 = SCA, AA, AT
time = 1
ignorehitpause = 1

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3050, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
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
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3050, End]
type = changestate
trigger1 = animelemtime(5) >= 32
trigger2 = animelemtime(5) > 0
trigger2 = (movecontact = [1, 4]) || (movereversed = [1, 4])
trigger3 = animelemtime(5) >= 16
trigger3 = frontedgebodydist <= 0
value = 3051

[State 3050, Wind]
type = explod
trigger1 = animelemtime(5) = 0
trigger2 = animelemtime(5) = 3
trigger3 = animelemtime(5) = 6
trigger4 = animelemtime(5) = 9
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Second -----
[Statedef 3051]
type = S
physics = N
movetype = A
anim = 3051
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3051, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 52

[State 3051, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3051, Sound]
type = playsnd
trigger1 = animelem = 11
value = 7, 12

[State 3051, Dust]
type = helper
trigger1 = animelem = 11
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3051, Type]
type = statetypeset
trigger1 = animelem = 11
statetype = A
physics = N

[State 3051, Pos]
type = posadd
trigger1 = animelem = 9 || animelem = 10
x = 8 * const(size.xscale)

[State 3051, Pos]
type = posadd
trigger1 = animelem = 11
x = 16 * const(size.xscale)

[State 3051, Vel]
type = velset
trigger1 = animelem = 11
x = 10.64 * const(size.xscale)
y = 0

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3051
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3051, Hit]
type = hitdef
trigger1 = animelem = 11
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3051
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 80, 20
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
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3051, P2 State]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget(3051)
trigger1 = target(3051), alive
trigger1 = (target(3051), pos x - pos x) * facing > 0
ID = 3051
value = 3060
ignorehitpause = 1

[State 3051, End - Hit]
type = changestate
trigger1 = movehit = 1
trigger1 = animelemtime(11) > 0
trigger1 = cond(numtarget(3051), (target(3051), pos x - pos x) * facing > 0, 1)
value = 3052

[State 3051, End - Miss]
type = changestate
trigger1 = animelemtime(11) >= 32
trigger2 = animelemtime(11) > 0
trigger2 = (movecontact + movereversed) = [1, 4]
trigger3 = animelemtime(11) >= 16
trigger3 = frontedgebodydist <= 0
value = 3002

[State 3051, Wind]
type = explod
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(11) = 3
trigger3 = animelemtime(11) = 6
anim = 1190
ID = 1190
postype = p1
pos = ceil(70 * const(size.xscale)), ceil(-50 * const(size.yscale))
sprpriority = 3
scale = 0.5, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1


;----- Third Spinning -----
[Statedef 3052]
type = S
physics = N
movetype = A
anim = 3052
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3052, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 52

[State 3052, Dust]
type = explod
trigger1 = animelem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3052, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, 4
channel = 0

[State 3052, Sound]
type = playsnd
trigger1 = animelem = 11
value = 7, 12

[State 3052, Dust]
type = helper
trigger1 = animelem = 11
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3052, Type]
type = statetypeset
trigger1 = animelem = 11
statetype = A
physics = N

[State 3052, Pos]
type = posadd
trigger1 = animelem = 9 || animelem = 10
x = 8 * const(size.xscale)

[State 3052, Pos]
type = posadd
trigger1 = animelem = 11
x = 16 * const(size.xscale)

[State 3052, Vel]
type = velset
trigger1 = animelem = 11
x = 10.64 * const(size.xscale)
y = 0

[State 3052, Wind]
type = explod
trigger1 = animelem = 12
anim = 3090
ID = 3090
sprpriority = 3
postype = p1
pos = ceil(64 * const(size.xscale)), ceil(-58 * const(size.yscale))
vfacing = -1
vel = 0, 0
scale = 0.33, 0.50
removeongethit = 1
ownpal = 1

[State 3052, Hit]
type = hitdef
trigger1 = animelem = 10
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3052
attr = S, HA
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
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 40), map(sparky) := -66
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3052, Hit Spinning]
type = hitdef
trigger1 = animelemtime(11) >= 0
trigger1 = animelemtime(23) < 0
trigger1 = (movecontact + movereversed) % 4 = 0
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3052
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 10, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 0, 0
guard.pausetime = 0, 0
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
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -4.00, -5.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -40 - (random / 50)
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3052, Hit Final]
type = hitdef
trigger1 = animelem = 23
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3052
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 40, 10
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 32
air.hittime = 120
ground.velocity = -6.00, -6.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -6.00, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 59), map(sparky) := -47
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3052, End]
type = changestate
trigger1 = !animtime
value = 3053


;----- Recover -----
[Statedef 3053]
type = S
physics = S
movetype = I
anim = 3053
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1

[State 3053, Pos]
type = posset
trigger1 = !time
y = 0

[State 3053, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3053, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3053, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target Restand -----
[Statedef 3060]
type = S
physics = N
movetype = H
velset = 0, 0

[State 3060, Pos]
type = posset
trigger1 = 1
y = 0

[State 3060, Fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3060, Anim]
type = changeanim
trigger1 = !time
value = ifelse((gethitvar(groundtype) = 1), 5002, 5012)

[State 3060, Anim]
type = changeanim
trigger1 = time > 0
value = anim

[State 3060, FFB Hard]
type = forcefeedback
trigger1 = !time
time = 15
ampl = 140
waveform = sinesquare

[State 3060, End]
type = changestate
trigger1 = hitshakeover
value = 3061


[Statedef 3061]
type = S
physics = S
movetype = H

[State 3061, Vel]
type = velset
trigger1 = !time
x = const240p(-10.52)

[State 3061, Anim]
type = changeanim
trigger1 = !animtime
value = 5017

[State 3061, Vel]
type = velset
trigger1 = time >= 18
x = 0

[State 3061, Defense]
type = defencemulset
trigger1 = time >= 18
value = 1

[State 3061, End]
type = changestate
trigger1 = time >= 18
value = 3062


[Statedef 3062]
type = S
physics = S
movetype = H
anim = 5300
velset = 0, 0

[State 3061, Defense]
type = defencemulset
trigger1 = time >= 60
value = 1

[State 3061, End]
type = selfstate
trigger1 = time >= 60
value = 0
ctrl = 1


;========================<OROCHI KUDAKI>=============================
;----- Startup -----
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
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

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3100, Sound]
type = playsnd
trigger1 = time = 3
value = 4, 7
channel = 0

[State 3100, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(72 * const(size.xscale)), ceil(-60 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 102)
pos = ceil(72 * const(size.xscale)), ceil(-60 * const(size.yscale))
sound = s0, 8520
darken = !map(cfg_superfx)

[State 3100, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 3100, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= ceil(50 * const(size.xscale))
ID = 3100
attr = S, HT
hitflag = M
priority = 7, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (map(sparkno) := 0)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 72), map(sparky) := -60
hitsound = s2, 800
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
fall.xvelocity = 0
fall.yvelocity = 0
numhits = 0
p1stateno = 3110
p2stateno = 3120

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 800
channel = 0

[State 3100, Sound]
type = playsnd
trigger1 = animelem = 4
value = 1, 0
;channel = 1
stopongethit = 1

[State 3100, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 3100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Throw -----
[Statedef 3110]
type = A
physics = N
movetype = A
anim = 3110
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3110, Safety]
type = changestate
trigger1 = !time
trigger1 = !numtarget
value = 0
ctrl = 1

[State 3110, Throw]
type = targetstate
trigger1 = !time
trigger1 = numtarget
value = 3120

[State 3110, Throw]
type = targetfacing
trigger1 = time <= 3
value = 1

[State 3110, Pos]
type = posadd
trigger1 = animelem = 10
x = 68 * const(size.xscale)

[State 3110, Width]
type = width
trigger1 = animelemtime(3) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
edge = ceil(18 * const(size.xscale)), 0

[State 3110, Width]
type = width
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
edge = ceil(79 * const(size.xscale)), 0

[State 3110, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(12) >= 0
edge = ceil(87 * const(size.xscale)), 0

[State 3110, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(10) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 3110, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(2) < 0
pos = 21 * const(size.xscale), -115 * const(size.yscale)

[State 3110, Bind 2]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = 56 * const(size.xscale), -112 * const(size.yscale)

[State 3110, Bind 3]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = 90 * const(size.xscale), -98 * const(size.yscale)

[State 3110, Bind 4]
type = targetbind
triggerall = numtarget
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(12) >= 0
pos = 87 * const(size.xscale), -8 * const(size.yscale)

[State 3110, Bind 7]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 47 * const(size.xscale), -22 * const(size.yscale)

[State 3110, Bind 8]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = 44 * const(size.xscale), -76 * const(size.yscale)

[State 3110, Bind 9]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = 40 * const(size.xscale), -110 * const(size.yscale)

[State 3110, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = animelem = 4
value = floor(map(damagescaling) * -130)
dizzy = 0
kill = 0

[State 3110, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = animelem = 4
value = 100

[State 3110, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = animelem = 4
value = 1

[State 3110, Accel]
type = veladd
trigger1 = animelemtime(7) >= 2
x = 0
y = 0.88445

[State 3110, Vel]
type = velset
trigger1 = animelemtime(7) = 2
x = 1.33 * const(size.xscale)
y = -10.54;68

[State 3110, Snd Randomizer]
type = mapset
trigger1 = !time
map = "orochi_voice"
value = (random % 3)

[State 3110, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = map(orochi_voice) = 0
value = 5, 6
channel = 0

[State 3110, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = map(orochi_voice) = 1
value = 5, 8
channel = 0

[State 3110, Sound]
type = playsnd
trigger1 = animelem = 4
trigger1 = map(orochi_voice) = 2
value = 5, 3
channel = 0

[State 3110, Sound]
type = playsnd
trigger1 = animelem = 3
trigger2 = animelem = 11
value = 1, 5
;channel = 1
stopongethit = 1

[State 3110, Sound]
type = playsnd
trigger1 = animelemtime(7) = 2
value = 0, 40

[State 3110, Dust]
type = helper
trigger1 = animelemtime(7) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3110, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = animelem = 4
value = 7, 1

[State 3110, Shake]
type = envshake
trigger1 = numtarget
trigger1 = animelem = 4
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3110, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 84 * const(size.xscale), 0
ownpal = 1

[State 3110, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = animelem = 4
anim = F 62
postype = p1
pos = 84 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 3110, Floor Cracks]
type = explod
trigger1 = numtarget
trigger1 = animelem = 4
anim = 8115
ID = 8115
postype = p1
pos = ceil(84 * const(size.xscale)), 0
scale = ifelse(random < 500, -0.5, 0.5), 0.5
ownpal = 1
under = 1

[State 3110, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = animelemtime(4) >= 0
trigger1 = numtarget(3100)
scale = 1.10
pos = target(3100), pos x, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3110, End]
type = changestate
trigger1 = animelemtime(7) >= 2
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3111


;----- Slam -----
[Statedef 3111]
type = A
physics = N
movetype = A
anim = 3111
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3111, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 3121

[State 3111, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = animelem = 4
value = 3122

[State 3111, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(87 * const(size.xscale)), 0

[State 3111, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = ceil(56 * const(size.xscale)), 0

[State 3111, Pos]
type = posset
trigger1 = animelemtime(4) < 0
y = 0

[State 3111, Bind 1]
type = targetbind
trigger1 = numtarget
trigger1 = animelemtime(4) < 0
pos = 87 * const(size.xscale), -8 * const(size.yscale)

;[State 3111, Bind 4]
;type = targetbind
;trigger1 = numtarget
;trigger1 = animelemtime(4) = 0
;pos = 112 * const(size.xscale), 0

[State 3111, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * -130)
dizzy = 0
kill = 0

[State 3111, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 100

[State 3111, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 3111, Accel]
type = veladd
trigger1 = animelemtime(4) >= 2
x = 0
y = 1.33

[State 3111, Vel]
type = velset
trigger1 = animelemtime(4) = 2
x = 2.72
y = -22.00

[State 3111, Sound]
type = playsnd
trigger1 = animelem = 1
trigger1 = map(orochi_voice) = 2
value = 5, 1
channel = 0

[State 3111, Sound]
type = playsnd
trigger1 = animelem = 7
trigger1 = map(orochi_voice) = 0
value = 5, 7
channel = 0

[State 3111, Sound]
type = playsnd
trigger1 = animelem = 7
trigger1 = map(orochi_voice) = 1
value = 5, 9
channel = 0

[State 3111, Sound]
type = playsnd
trigger1 = animelemtime(4) = 2
value = 0, 41

[State 3111, Dust]
type = helper
trigger1 = animelemtime(4) = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3111, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 1

[State 3111, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3111, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 84 * const(size.xscale), 0
ownpal = 1

[State 3111, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 84 * const(size.xscale), 0
sprpriority = -10
ownpal = 1

[State 3111, Floor Cracks]
type = explod
trigger1 = numtarget
trigger1 = !time
anim = 8115
ID = 8115
postype = p1
pos = ceil(84 * const(size.xscale)), 0
scale = ifelse(random < 500, -0.5, 0.5), 0.5
ownpal = 1
under = 1

[State 3111, Sound]
type = playsnd
trigger1 = animelem = 8
value = 7, 12

[State 3111, Wind]
type = explod
trigger1 = vel y > 0
trigger1 = animelemtime(8) >= 6
trigger1 = !(animelemtime(8) % 2)
anim = 1290
ID = 1290
postype = p1
pos = ceil(80 * const(size.xscale)), ceil(-32 * const(size.yscale))
sprpriority = 3
scale = 0.33, 0.5
vfacing = ifelse(random < 500, -1, 1)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3111, Afterimage]
type = explod
trigger1 = vel y > 0
trigger1 = animelemtime(8) >= 6
ID = 3111
postype = p1
pos = 0, 0
sprpriority = sprpriority - 1
anim = anim
animfreeze = 1
animelem = animelemno(0)
removetime = 4
trans = addalpha
alpha = 256, 0
scale = const(size.xscale), const(size.yscale)
interpolation.time = 4
interpolation.alpha = 0, 256
ownpal = 1

[State 3111, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = numtarget(3100)
trigger1 = animelemtime(4) < 0
scale = 1.15
pos = target(3100), pos x, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3111, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = numtarget(3100)
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(8) < 0
scale = 1
pos = target(3100), pos x, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3111, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = numtarget(3100)
trigger1 = animelemtime(8) >= 0
scale = 1.15
pos = target(3100), pos x, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3111, End]
type = changestate
trigger1 = animelemtime(4) >= 2
trigger1 = vel y > 0
trigger1 = pos y > (24 - vel y)
value = 3112


;----- Butt Slam -----
[Statedef 3112]
type = A
physics = N
movetype = A
anim = 3112
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3112, Pos]
type = posset
trigger1 = animelemtime(4) < 0
y = -16

[State 3112, Pos]
type = posadd
trigger1 = animelem = 4
x = 80 * const(size.xscale)

[State 3112, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = !time
value = floor(map(damagescaling) * -200)
dizzy = 0
kill = 1

[State 3112, Give Power]
type = targetpoweradd
trigger1 = numtarget
trigger1 = !time
value = 100

[State 3112, Hit]
type = hitadd
trigger1 = numtarget
trigger1 = !time
value = 1

[State 3112, Throw]
type = targetstate
trigger1 = numtarget
trigger1 = !time
value = 3124

[State 3112, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = ceil(56 * const(size.xscale)), 0

[State 3112, Sound]
type = playsnd
trigger1 = animelem = 1
trigger1 = map(orochi_voice) = 2
value = 5, 0
channel = 0

[State 3112, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 2, 5
channel = 2

;[State 3112, Spark]
;in ZSS

[State 3112, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 2

[State 3112, Sound]
type = playsnd
trigger1 = numtarget
trigger1 = !time
value = 7, 1

[State 3112, Shake]
type = envshake
trigger1 = numtarget
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 3112, Dust]
type = helper
trigger1 = map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8110
name = "Impact Dust"
postype = p1
pos = 47 * const(size.xscale), -pos y
ownpal = 1

[State 3112, Dust]
type = explod
trigger1 = !map(cfg_sparks)
trigger1 = numtarget
trigger1 = !time
anim = F 62
postype = p1
pos = 47 * const(size.xscale), -pos y
sprpriority = -10
ownpal = 1

[State 3112, Floor Cracks]
type = explod
trigger1 = numtarget
trigger1 = !time
anim = 8115
ID = 8115
postype = p1
pos = ceil(47 * const(size.xscale)), ceil(-pos y)
scale = ifelse(random < 500, -0.5, 0.5), 0.5
ownpal = 1
under = 1

[State 3112, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = animelemtime(6) < 0
trigger1 = numtarget(3100)
scale = 1.20
pos = target(3100), pos x, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3112, Zoom]
type = zoom
trigger1 = map(zoom_allowed)
trigger1 = animelemtime(6) >= 0
scale = 1
pos = 0, 0
lag = 0.90
stagebound = 1
camerabound = 0

[State 3112, Accel]
type = veladd
trigger1 = animelemtime(4) >= 0
y = 0.88445

[State 3112, Vel]
type = velset
trigger1 = animelem = 4
x = 2.50
y = -10.53

[State 3112, Camera]
type = screenbound
trigger1 = animelemtime(4) >= 0
value = 1
movecamera = 1, 0

[State 3112, End]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3113


;----- Land -----
[Statedef 3113]
type = S
physics = N
movetype = I
ctrl = 0
anim = 3113
velset = 0, 0
sprpriority = 2

[State 3113, Pos]
type = posset
trigger1 = 1
y = 0

[State 3113, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3113, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3113, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Target -----
[Statedef 3120]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 3120, Anim]
type = changeanim2
trigger1 = !time
value = 3120

[State 3120, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3120, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3121]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 3121, Anim]
type = changeanim2
trigger1 = !time
value = 3121

[State 3121, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 3121, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 3122]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3122, Anim]
type = changeanim2
trigger1 = !time
value = 3122

[State 3122, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3122, Pos]
type = posadd
trigger1 = !time
x = 21

[State 3122, Pos]
type = posset
trigger1 = !time
y = 0

[State 3122, Accel]
type = veladd
trigger1 = 1
y = 1.326675

[State 3122, Vel]
type = velset
trigger1 = !time
x = 6.00
y = -5.3067

[State 3122, End]
type = changestate
trigger1 = time >= 8
value = 3123


[Statedef 3123]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3123, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3123, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3123, Pos]
type = posset
trigger1 = 1
y = 0

[State 3123, Anim]
type = changeanim
trigger1 = !time
value = 5170

[State 3123, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim != 5110
value = 5110

[State 3123, End]
type = selfstate
trigger1 = time >= 60
value = ifelse(alive, 5120, 5150)


[Statedef 3124]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3124, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 3124, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3124, Pos]
type = posset
trigger1 = 1
y = 0

[State 3124, Anim]
type = changeanim
trigger1 = !(time % 6)
trigger1 = time < 32
value = 5080

[State 3124, End]
type = changestate
trigger1 = time >= 48
value = 3125


[Statedef 3125]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 3125, Pos]
type = posset
trigger1 = 1
y = 0

[State 3125, Anim]
type = changeanim
trigger1 = !time
value = 5110

[State 3125, End]
type = selfstate
trigger1 = time >= 12
value = ifelse(alive, 5120, 5150)


;========================<FUJI OROSHI>=============================
[Statedef 3200]
type = S
physics = N
movetype = A
anim = 3200
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

[State 3200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3200, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3200, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

;[State 3200, Variable Height]
;type = playerpush
;trigger1 = 1
;value = 1
;ignorehitpause = 1

[State 3200, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 3
channel = 0

[State 3200, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Superpause]
type = superpause
trigger1 = time = 3
time = 41
movetime = 41
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 100)
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
sound = s0, 8500
darken = !map(cfg_superfx)

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 40

[State 3200, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3200, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 3200, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 1.326675

[State 3200, Vel]
type = velset
trigger1 = animelem = 5
x = 4.0 * const(size.xscale);109
y = -12

[State 3200, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 2
channel = 0

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -1.00, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 64), map(sparky) := -51
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3200, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
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
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 32
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -1.00, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 106), map(sparky) := -54
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

;replaced with variable height exceptions
;[State 3200, Short Characters Fix]
;type = velmul
;trigger1 = movecontact
;trigger1 = map(truebodydistx) = 0
;x = 0.8

[State 3200, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3201


;----- Lift -----
[Statedef 3201]
type = S
physics = N
movetype = A
anim = 3201
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3201, Pos]
type = posset
trigger1 = 1
y = 0

[State 3201, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3201, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 1
channel = 0

[State 3201, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 3201, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (3 + hitcount))
ID = 3201
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 13
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 12, 12
animtype = Hard
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
ground.velocity = -1.08, -14.00
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -1.08, -14.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 1
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 66), map(sparky) := -46
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3201, Juggle Reset]
type = mapset
trigger1 = time > 0
trigger1 = !map(jugglereset)
trigger1 = map(juggle_count)
trigger1 = movehit = 1
trigger1 = numtarget(3201)
trigger1 = 1 || map(jugglereset) := 1
map = "juggle_count"
value = 0
ignorehitpause = 1

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


;========================<MAX FUJI OROSHI>=============================
[Statedef 3250]
type = S
physics = N
movetype = A
anim = 3250
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
value = ifelse((prevstateno = [3000, 4999]), 3, ifelse((prevstateno = [1000, 2999]) && !map(customcombo), 2, 1))

[State 3250, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3250, Lose Charge]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(cmd_charge4) := 0
trigger1 = 1 || map(ai_charge4) := 0
ignorehitpause = 1
persistent = 0

[State Cancel Flags]
type = null
trigger1 = time <= 0
trigger1 = 1 || map(supercancelflag) := (prevstateno = [1000, 2999] && map(supercancel) && !map(customcombo))
trigger1 = 1 || map(hypercancelflag) := (prevstateno = [3000, 4999] && map(hypercancel))
ignorehitpause = 1
persistent = 0

[State 3250, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = map(customcombo) > 0
trigger1 = (map(customcombo) := 0) || (map(juggle_count) := 0) || 1
time = 1

[State Super Cancel Flash]
type = palfx
trigger1 = time % 2
trigger1 = time = [1, 11]
trigger1 = map(supercancelflag) || map(hypercancelflag)
trigger1 = 1 || map(juggle_count) := 0
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3250, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

;[State 3250, Variable Height]
;type = playerpush
;trigger1 = 1
;value = 1
;ignorehitpause = 1

[State 3250, Sound]
type = playsnd
trigger1 = time = 3
value = 5, 3
channel = 0

[State 3250, Superpause FX]
type = helper
trigger1 = map(cfg_superfx)
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8500
name = "Superpause FX"
postype = p1
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3250, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = ifelse(map(cfg_superfx), -1, 101)
pos = ceil(-2 * const(size.xscale)), ceil(-44 * const(size.yscale))
sound = s0, 8510
darken = !map(cfg_superfx)

[State 3250, Sound]
type = playsnd
trigger1 = animelem = 5
value = 0, 40

[State 3250, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3250, Type]
type = statetypeset
trigger1 = animelem = 5
statetype = A
physics = N

[State 3250, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 1.326675

[State 3250, Vel]
type = velset
trigger1 = animelem = 5
x = 6.0 * const(size.xscale);109
y = -12

[State 3250, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 2
channel = 0

[State 3250, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (4 + hitcount))
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 64), map(sparky) := -51
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3250, Hit]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (4 + hitcount))
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
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
ground.hittime = 32
ground.slidetime = 18
guard.hittime = 32
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -2.17, -6.00
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 106), map(sparky) := -54
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

;replaced with variable height exceptions
;[State 3250, Short Characters Fix]
;type = velmul
;trigger1 = movecontact
;trigger1 = map(truebodydistx) = 0
;x = 0.8

[State 3250, End]
type = changestate
trigger1 = animelemtime(5) >= 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3251


;----- Lift -----
[Statedef 3251]
type = S
physics = N
movetype = A
anim = 3251
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3251, Pos]
type = posset
trigger1 = 1
y = 0

[State 3251, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3251, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3251, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 1
channel = 0

[State 3251, Sound]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
;channel = 1
stopongethit = 1

[State 3251, Hit]
type = hitdef
trigger1 = animelem = 4
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (4 + hitcount))
ID = 3251
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 15
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 2, 2
guard.pausetime = 12, 12
animtype = Hard
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
ground.velocity = 0, -35.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -35.0
air.cornerpush.veloff = 0
yaccel = 1.167
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 66), map(sparky) := -46
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3251, Juggle Reset]
type = mapset
trigger1 = time > 0
trigger1 = movehit = 1
trigger1 = numtarget(3251)
map = "juggle_count"
value = 0
ignorehitpause = 1

[State 3251, Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 3251, P2 Camera]
redirectID = target(3251), ID
type = screenbound
trigger1 = numtarget(3251)
value = 1
movecamera = 1, 0
ignorehitpause = 1

[State 3251, End]
type = changestate
trigger1 = !animtime
trigger1 = movehit && numtarget(3251)
value = 3252

[State 3251, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Prepare -----
[Statedef 3252]
type = S
physics = N
movetype = A
anim = 3252
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 3252, P2 Camera]
redirectID = target(3251), ID
type = screenbound
trigger1 = numtarget(3251)
value = 1
movecamera = 1, 0

[State 3252, Sound]
type = playsnd
trigger1 = animelem = 4
value = 7, 5

[State 3252, End]
type = changestate
trigger1 = !animtime
value = 3253


;----- Slaps -----
[Statedef 3253]
type = S
physics = N
movetype = A
anim = 3253
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3253, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3253, P2 Camera]
redirectID = target(3251), ID
type = screenbound
trigger1 = numtarget(3251)
value = 1
movecamera = 1, 0
ignorehitpause = 1

[State 3253, Loop]
type = changeanim
trigger1 = !animtime
value = 3253
elem = 1

[State 3253, Mashing]
type = varset
trigger1 = !time
var(12) = 0

;[State 3253, Mashing]
;type = varadd
;trigger1 = !AIlevel
;trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
;trigger2 = !AIlevel
;trigger2 = command = "U" || command = "D" || command = "B" || command = "F"
;trigger3 = AIlevel && random < 800
;var(12) = 1

[State 3253, Mashing]
type = varadd
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = random < 800
var(12) = 1

[State 3253, Anim Skip]
type = changeanim
trigger1 = animelemtime(6) < 0
trigger1 = animelemtime(animelemno(0)) >= 0
trigger1 = animelemtime(animelemno(0) + 1) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + animelemtime(animelemno(0) + 1))
value = 3253
elem = animelemno(0) + 1

[State 3253, Anim Skip]
type = changeanim
trigger1 = animelemtime(6) > 0
trigger1 = animelemtime(6) >= (2 - var(12))
trigger1 = 1 || var(12) := (var(12) + 2 - animelemtime(6))
value = 3253
elem = 1

[State 3253, Mashing]
type = varset
trigger1 = var(12) < 0
var(12) = 0

[State 3253, Sound]
type = playsnd
trigger1 = !time
value = 4, 6
channel = 0

[State 3253, Sound]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 5
value = 7, 10
;channel = 1
stopongethit = 1

[State 3253, Spark XY]
type = null
trigger1 = animelem = 1 || animelem = 7
trigger1 = map(sparkx.min) := 50 || map(sparkx.min) := 50 || map(sparkx.max) := 120 || map(sparky) := -55
trigger2 = animelem = 3 || animelem = 9
trigger2 = map(sparkx.min) := 50 || map(sparkx.min) := 50 || map(sparkx.max) := 113 || map(sparky) := -26
trigger3 = animelem = 5 || animelem = 11
trigger3 = map(sparkx.min) := 50 || map(sparkx.min) := 50 || map(sparkx.max) := 111 || map(sparky) := -84

[State 3253, Hit Low]
type = hitdef
trigger1 = animelem = 1 || animelem = 3 || animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3253
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 10, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 12
guard.pausetime = 4, 4
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
ground.velocity = 0, -8.96
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -8.96
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0

[State 3253, Hit High]
type = hitdef
trigger1 = animelem = 5
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := 99)
ID = 3253
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 10, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 4, 12
guard.pausetime = 4, 4
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = 0, -8.96
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0, -8.96
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 2
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10, 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
kill = 0

[State 3253, Bind]
type = targetbind
trigger1 = movehit = 1
trigger1 = numtarget(3253)
pos = 90 * const(size.xscale), -16 * const(size.yscale)
ignorehitpause = 1

[State 3253, Width]
type = width
trigger1 = numtarget(3253)
edge = ceil(90 * const(size.xscale)), 0
ignorehitpause = 1

[State 3253, End]
type = changestate
trigger1 = time >= 36
value = 3254


;----- Final -----
[Statedef 3254]
type = S
physics = N
movetype = A
anim = 3254
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3254, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 0
channel = 0

[State 3254, Sound]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
;channel = 1
stopongethit = 1

[State 3254, Hit]
type = hitdef
trigger1 = animelem = 3
air.juggle = 0 * (map(juggle_start) := 1 || map(juggle_increase) := 1 || map(juggle_limit) := (2 + hitcount))
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
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.hittime = 120
ground.velocity = -9.73, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -9.73, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 0
down.recover = 0; cannot mash
down.recovertime = 30
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 6
hitsound.channel = 2
guardsound = s3, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8014)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 94), map(sparky) := -64
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667

[State 3254, Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I
persistent = 0

[State 3254, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
