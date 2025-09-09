; ____________________________________________
;| Pocket Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;======================<MESSATSU GOU HADOU>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000

[State 3000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3000, Width]
type = width
trigger1 = animelemtime(6) > 0 && animelemtime(9) < 0
value = ceil(30 * const(size.xscale)), 0

[State 3000, Kanji]
type = explod
trigger1 = animelem = 2
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3000, Aura]
type = explod
trigger1 = !time
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
supermovetime = -1
removetime = abs(animelemtime(3)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3000, Superpause BG]
type = explod
trigger1 = animelem = 2
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-20 * const(size.xscale)), -18
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 16
channel = 0

[State 3000, focus]
type = helper
trigger1 = animelem = 4
stateno = 3004
ID = 3004
name = "focus"
ownpal = 1

[State 3000, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
anim = s6100
pos = ceil(-20 * const(size.xscale)), -18
sound = s6, 0
darken = 0
p2defmul = 1

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 7
value2 = SCA, AA, AT
time = 1

[State 3000, Hadouken]
type = helper
trigger1 = animelem = 7
helpertype = normal; projectile
stateno = 3005
ID = 3005
name = "hadouken"
postype = p1
pos = ceil(74* const(size.xscale)), -30
ownpal = 1

[State 3000, Wave]
type = explod
trigger1 = animelem = 7
vel = -1.33, 0
anim = 3008
sprpriority = 5
postype = p1
pos = ceil(70* const(size.xscale)), -30
ownpal = 1
scale = 0.75, 0.75

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 6
value = 3, 7
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 0

[State 3000, Dust]
type = explod
trigger1 = animelem = 7
vel = -1, 0
anim = 6023
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MESSATSU CHOU HADOU>=============================
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3020
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -2000

[State 3020, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3020, Width]
type = width
trigger1 = animelemtime(8) > 0 && animelemtime(51) < 0
value = ceil(30 * const(size.xscale)), 0

[State 3020, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 4

[State 3020, Shake]
type = envshake
trigger1 = animelem = 4
time = 18
ampl = 2
freq = 180

[State 3020, Kanji]
type = explod
trigger1 = animelem = 5
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3020, Aura]
type = explod
trigger1 = animelem = 4
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
supermovetime = -1
removetime = abs(animelemtime(6)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3020, Superpause BG]
type = explod
trigger1 = animelem = 5
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-21 * const(size.xscale)), -20
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3020, Sound]
type = playsnd
trigger1 = animelem = 5
value = 4, 16
channel = 0

[State 3020, Super Pause]
type = SuperPause
trigger1 = animelem = 5
time = 45
anim = s6100
pos = ceil(-21 * const(size.xscale)), -20
sound = s6, 5
darken = 0
p2defmul = 1

[State 3020, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3020, NHB]
type = nothitby
trigger1 = animelemtime(6) >= 0
trigger1 = animelemtime(13) < 0
value = , AP
time = 1
ignorehitpause = 1

[State 3020, focus]
type = helper
trigger1 = animelem = 7
stateno = 3004
ID = 3004
name = "focus"
ownpal = 1

[State 3020, Hadouken]
type = helper
trigger1 = animelem = 10
helpertype = normal; projectile
stateno = 3025
ID = 3025
name = "hadouken"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1

[State 3020, Sound]
type = playsnd
trigger1 = animelem = 10
value = 5, 9
channel = 5

[State 3020, Wave]
type = explod
trigger1 = animelemtime(10) >= 0 && animelemtime(29) < 0
trigger1 = !(animelemtime(10) % 6)
vel = 5, 0
anim = 3008
postype = p1
pos = 50, -30
scale = 0.75, 0.75
sprpriority = 5
ownpal = 1

[State 3020, Sound]
type = playsnd
trigger1 = animelem = 9
value = 3, 7
channel = 0

[State 3020, Dust]
type = explod
triggerall = animelemtime(10) >= 0 && animelemtime(29) < 0
trigger1 = !(animelemtime(10) % 24)
vel = -1, 0
anim = 6023
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 3020, Dust]
type = explod
trigger1 = abs(vel x) >= 1
trigger1 = !(time % 3)
vel = -0.5, 0
anim = 6020
sprpriority = 2
postype = p1
pos = ceil(-32 * const(size.xscale)), 0
ownpal = 1

[State 3020, Type]
type = statetypeset
trigger1 = animelem = 10
statetype = S
physics = N

[State 3020, Vel]
type = velmul
trigger1 = animelemtime(10) >= 0
x = 0.9

[State 3020, Vel]
type = velset
trigger1 = numhelper(3025)
trigger1 = animelemtime(10) >= 0
trigger1 = frontedgedist <= (helper(3025), animelemno(0)) * 30
x = -16
persistent = 0

[State 3020, Bound]
type = screenbound
trigger1 = animelemtime(10) >= 0
value = 0
movecamera = (backedgedist > 0), 1

[State 3020, End]
type = changestate
triggerall = !animtime
triggerall = backedgedist < -const(size.ground.back)
trigger1 = teammode != tag
trigger2 = teammode = tag
trigger2 = playerno = teamleader
value = 3021
ctrl = 0

[State 3020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- Warp back in -----
[Statedef 3021]
type = S
physics = N
movetype = I
anim = 3021
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 3021, Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 3021, Afterimage]
type = afterimage
trigger1 = animelem = 5
time = 2
timegap = 1
framegap = 6
length = 13
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 3021, Vel]
type = velset
trigger1 = animelemtime(1) > 0 && animelemtime(7) < 0
x = -4 * sin((time -6) / 2)

[State 1350, Vel]
type = velset
trigger1 = animelemtime(7) >= 0
x = ifelse(abs(pos x) > (gamewidth / 2), 16, 8)

[State 3021, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 6
persistent = 0

[State 3021, Sound]
type = playsnd
trigger1 = animelem = 7
value = 5, 5
persistent = 0

[State 3021, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3021, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 3021, Turn]
type = turn
trigger1 = p2dist x < 0

[State 3021, End]
type = changestate
trigger1 = backedgedist >= (gamewidth / 4)
trigger2 = time = 180
value = 0
ctrl = 1


;======================<TENMA GOU ZANKUU>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000

[State 3050, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3050, Kanji]
type = explod
trigger1 = animelem = 2
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = ceil(12 * const(size.xscale)), -53
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3050, Aura]
type = explod
trigger1 = animelem = 2
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 12 * const(size.xscale), -40
supermovetime = -1
removetime = abs(animelemtime(3)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3050, Superpause BG]
type = explod
trigger1 = animelem = 2
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-17 * const(size.xscale)), -45
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3040, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 32
channel = 0

[State 3050, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
anim = s6100
pos = ceil(-17 * const(size.xscale)), -45
sound = s6, 0
darken = 0
p2defmul = 1

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 4
value2 = SCA, AA, AT
time = 1

[State 3050, Hadouken]
type = helper
trigger1 = animelem = 4
helpertype = normal; projectile
stateno = 3055
ID = 3005
name = "hadouken"
postype = p1
pos = ceil(74 * const(size.xscale)), -20
ownpal = 1

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 3, 7
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 4
value = 5, 0

[State -3, Gravity]
type = veladd
trigger1 = animelemtime(4) >= 1
y = 0.5

[State 3050, velback]
type = velset
trigger1 = animelemtime(4) = 1
x = -3
y = -6

[State 3050, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)


;======================<TENMA RENZOKU ZANKUU>=============================
[Statedef 3060]
type = A
physics = N
movetype = A
anim = 3060
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -2000

[State 3060, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3060, Kanji]
type = explod
trigger1 = animelem = 2
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = ceil(12 * const(size.xscale)), -53
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3060, Aura]
type = explod
trigger1 = animelem = 2
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 12 * const(size.xscale), -40
supermovetime = -1
removetime = abs(animelemtime(3)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3060, Superpause BG]
type = explod
trigger1 = animelem = 2
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-17 * const(size.xscale)), -45
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3060, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 32
channel = 0

[State 3060, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
anim = s6100
pos = ceil(-17 * const(size.xscale)), -45
sound = s6, 5
darken = 0
p2defmul = 1

[State 3060, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3060, NHB]
type = nothitby
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(5) < 0
value = , AP
time = 1
ignorehitpause = 1

[State 3060, Hadouken Left 1]
type = helper
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
trigger2 = animelem = 18 || animelem = 22 || animelem = 26
helpertype = normal; projectile
stateno = 1055
ID = 3065
name = "Hadouken"
postype = p1
pos = ceil(75 * const(size.xscale)), -23
ownpal = 1

[State 3060, Hadouken Right 1]
type = helper
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
trigger2 = animelem = 16 || animelem = 20 || animelem = 24
helpertype = normal; projectile
stateno = 1055
ID = 3065
name = "Hadouken"
postype = p1
pos = ceil(68 * const(size.xscale)), -2
ownpal = 1

[State 3060, Hadouken Left 2]
type = helper
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
trigger2 = animelem = 18 || animelem = 22 || animelem = 26
helpertype = normal; projectile
stateno = 1055
ID = 3065
name = "Hadouken"
postype = p1
pos = ceil(57 * const(size.xscale)), -5
ownpal = 1

[State 3060, Hadouken Right 2]
type = helper
trigger1 = animelem = 4 || animelem = 8 || animelem = 12
trigger2 = animelem = 16 || animelem = 20 || animelem = 24
helpertype = normal; projectile
stateno = 1055
ID = 3065
name = "Hadouken"
postype = p1
pos = ceil(89 * const(size.xscale)), -20
ownpal = 1

[State 3060, Sound]
type = playsnd
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
trigger2 = animelem = 18 || animelem = 22 || animelem = 26
trigger3 = animelem = 4 || animelem = 8 || animelem = 12
trigger4 = animelem = 16 || animelem = 20 || animelem = 24
value = 3, 7
channel = 0

[State 3000, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16 || animelem = 20 || animelem = 24
trigger2 = animelem = 6 || animelem = 10 || animelem = 14 || animelem = 18 || animelem = 22 || animelem = 26
value = 5, 0
channel = 5

[State 3060, velback]
type = velset
trigger1 = animelemtime(4) = 1
x = -0.66
y = -0.5

[State 3060, velback]
type = velset
trigger1 = animelem = 26
x = -3
y = -6

[State 3060, Type]
type = statetypeset
trigger1 = animelemtime(26) >= 1
statetype = A
physics = A

[State 3060, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)


;======================<MESSATSU GOU SHORYUU>=============================
[Statedef 3100]
type = S
physics = N
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000

[State 3100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3100, Kanji]
type = explod
trigger1 = animelemtime(1) = 3 && anim = 3100
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = ceil(8 * const(size.xscale)), -44
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3100, Aura]
type = explod
trigger1 = !time
trigger1 = anim = 3100
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 2, -26
supermovetime = -1
removetime = abs(animelemtime(2)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3100, Superpause BG]
type = explod
trigger1 = animelemtime(1) = 3 && anim = 3100
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(10 * const(size.xscale)), -13
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3100, Sound]
type = playsnd
trigger1 = animelemtime(1) = 3 && anim = 3100
value = 4, 16
channel = 0

[State 3100, Super Pause]
type = SuperPause
trigger1 = animelemtime(1) = 3 && anim = 3100
time = 45
anim = s6100
pos = ceil(10 * const(size.xscale)), -13
sound = s6, 0
darken = 0
p2defmul = 1

[State 3100, Accel]
type = veladd
trigger1 = vel x > 0
x = -0.67

[State 3100, Accel]
type = velset
trigger1 = vel x < 0
x = 0

[State 3100, Accel]
type = veladd
trigger1 = anim = 3100
trigger1 = animelemtime(22) >= 1
trigger2 = anim = 1101
y = ifelse(vel y > 0, 0.75, 0.50)

[State 3100, Vel]
type = velset
triggerall = anim = 3100
trigger1 = animelem = 2 || animelem = 11 || animelem = 20
x = ifelse((animelem = 20), 12.00, ifelse((animelem = 11), 10.00, 8.00))

[State 3100, Vel]
type = velset
trigger1 = anim = 3100
trigger1 = animelemtime(22) = 1
y = -12.00

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100
trigger1 = animelemtime(3) < 1
value = SCA
time = 1
ignorehitpause = 1

[State 3100, Sound]
type = playsnd
triggerall = anim = 3100
trigger1 = animelem = 4 || animelem = 13 || animelem = 22
value = ifelse((animelem = 22), 4, 3), ifelse((animelem = 22), 31, ifelse((animelem = 13), 0, 10))
channel = 0

[State 3100, Hitfloor]
type = hitdef
triggerall = anim = 3100
trigger1 = animelem = 2
trigger2 = animelem = 3
attr = S, HA
damage = 27, 4
dizzypoints = 0
animtype = Medium
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 3, 3
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -3, -6
down.cornerpush.veloff = -8
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, ifelse((animelem=3), -43, -23)
yaccel = 0.941
p1sprpriority = sprpriority

[State 3100, Hitfloorhigh]
type = hitdef
triggerall = anim = 3100
trigger1 = animelem = 4
attr = S, HA
damage = 27, 4
dizzypoints = 0
animtype = Medium
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -3, -6
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -60
yaccel = 0.941
p1sprpriority = sprpriority

[State 3100, Hitfloor2]
type = hitdef
triggerall = anim = 3100
trigger1 = animelem = 11 || animelem = 12
attr = S, HA
damage = 27, 4
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 3, 3
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse((animelemtime(20) >= 0), -1.5, -4), ifelse((animelemtime(20) >= 0), -6, 0)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -3, -6
getpower = 0, 0
givepower = 40, 40
down.cornerpush.veloff = -8
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, ifelse((animelem=12), -43, -23)
yaccel = 0.941
p1sprpriority = sprpriority

[State 3100, Hitfloorhigh2]
type = hitdef
triggerall = anim = 3100
trigger1 = animelem = 13
attr = S, HA
damage = 27, 4
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -3, -6 + map(juggledecay)
down.velocity = -3, -6
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -60
yaccel = 0.941
p1sprpriority = sprpriority

[State 3100, Hit Midair]
type = hitdef
triggerall = anim = 3100
trigger1 = animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
attr = S, HA
damage = 27, 4
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = ifelse((animelem = 25), 8, 4), ifelse((animelem = 25), 8, 4)
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse((animelem = 25), -8, -3), ifelse((animelem = 25), -20, -8)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse((animelem = 25), -8, -3), ifelse((animelem = 25), -20, -8) + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Medium
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -60
yaccel = 0.941
p1sprpriority = sprpriority
air.hittime = 40

[State 3100, Flames]
type = helper
trigger1 = anim = 3100
trigger1 = animelem = 10
trigger2 = anim = 3100 && animelem = 19
helpertype = normal
stateno = 3105
ID = 3105
name = "Flames"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1

[State 3100, Dust]
type = explod
trigger1 = anim = 3100
trigger1 = animelem = 22
anim = 6026
sprpriority = 3
postype = p1
vel = -1
ownpal = 1

[State 3100, Dust]
type = explod
trigger1 = anim = 3100
trigger1 = animelem = 22
anim = 6026
sprpriority = 3
postype = p1
vel = 1
facing = -1
ownpal = 1

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3100
trigger1 = animelem = 22
statetype = A
physics = N

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100
trigger1 = animelemtime(22) > 1
trigger1 = vel y > -5
value = 1101

[State 3100, Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State 3100, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 1102


;======================<MESSATSU GOU RASEN>=============================
[Statedef 3200]
type = A
physics = N
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000

[State 3200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3200, Kanji]
type = explod
trigger1 = anim = 3200 && animelem = 2
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3200, Aura]
type = explod
trigger1 = !time
trigger1 = anim = 3200
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
supermovetime = -1
removetime = abs(animelemtime(3)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3200, Superpause BG]
type = explod
trigger1 = anim = 3200 && animelem = 2
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-20 * const(size.xscale)), -18
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3200 && animelem = 2
value = 4, 16
channel = 0

[State 3200, Super Pause]
type = SuperPause
trigger1 = anim = 3200 && animelem = 2
time = 45
anim = s6100
pos = ceil(-20 * const(size.xscale)), -18
sound = s6, 0
darken = 0
p2defmul = 1

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200
trigger2 = anim = 3200 && animelemtime(2) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3200 && animelem = 3
value = 3, 2
channel = 0

[State 3200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 3200
value = 3201

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelemtime(3) = 1
y = -9

[State 3200, Dust]
type = explod
trigger1 = anim = 3200 && animelem = 3
anim = 6026
sprpriority = 3
postype = p1
vel = -1
ownpal = 1

[State 3200, Dust]
type = explod
trigger1 = anim = 3200 && animelem = 3
anim = 6026
sprpriority = 3
postype = p1
vel = 1
facing = -1
ownpal = 1

[State 3200, Accel]
type = veladd
trigger1 = anim = 3201 && animelem = 31
y = -4

[State 3200, Sound]
type = playsnd
trigger1 = anim = 3200 && animelem = 3
value = 0, 40

[State 3200, Dust]
type = explod
trigger1 = anim = 3200 && animelem = 3
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
ownpal = 1

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(3) >= 1
trigger2 = anim = 3201
statetype = A
physics = N

[State 3200, Accel]
type = veladd
trigger1 = anim = 3200 && animelemtime(3) >= 2
trigger2 = anim = 3201 && animelemtime(31) < 0
y = 0.3

[State 3200, Accel]
type = veladd
trigger1 = anim = 3201 && animelemtime(31) >= 0
y = 0.5

[State 3200, Push]
type = playerpush
trigger1 = movecontact
trigger1 = anim = [3200, 3201]
value = 0
ignorehitpause = 1

[State 3200, Sound]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 1, 1
;channel = 1
stopongethit = 1

[State 3200, spin2]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
value = 1, 4
;channel = 1
stopongethit = 1

[State 3200, Sound]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 34
value = 1, 5
;channel = 1
stopongethit = 1

[State 3200, Sound]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 34
value = 4, 28
channel = 0

[State 3200, electricity]
type = helper
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
trigger2 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 3200, shock]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 5, 7
channel = 5

[State 3200, Hit]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x > 16, 30, 20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x > 16, 30, 20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60

[State 3200, Hit 2]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x < -16, -30, -20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x < -16, -30, -20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority + 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60

[State 3200, Hit Pass]
type = hitdef
trigger1 = anim = 3201 && animelem = 29
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x < -16, -12, -8), -4
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x < -16, -12, -8), -4 + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60

[State 3200, Hit Final]
type = hitdef
trigger1 = anim = 3201 && animelem = 35
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 24, 24
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -6, 14
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = High
airguard.velocity = -6.00, -1.00
air.velocity = -6, 14 + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -50
yaccel = 0.941
p1sprpriority = sprpriority
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60

[State 3201, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 3209


;---Land---
[Statedef 3209]
type = S
physics = S
movetype = I
anim = 3209
ctrl = 0
velset = 0, 0
sprpriority = 2
movehitpersist = 1
hitcountpersist = 1

[State 3209, Pos]
type = posset
trigger1 = 1
y = 0

[State 3209, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3209, Dust]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 3
postype = p1
pos = 0, 0
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3209, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<KUUCHU MESSATSU GOU RASEN>=============================
[Statedef 3220]
type = A
physics = N
movetype = A
anim = 3220
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = -1000

[State 3220, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 3220, Kanji]
type = explod
trigger1 = animelemtime(1) = 1
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -50
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 3220, Aura]
type = explod
trigger1 = !time
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -40
supermovetime = -1
removetime = abs(animelemtime(2)) + 45
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 3220, Superpause BG]
type = explod
trigger1 = animelemtime(1) = 1
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-17 * const(size.xscale)), -10
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 3220, Sound]
type = playsnd
trigger1 = animelemtime(1) = 1
value = 4, 16
channel = 0

[State 3220, Super Pause]
type = SuperPause
trigger1 = animelemtime(1) = 1
time = 45
anim = s6100
pos = ceil(-17 * const(size.xscale)), -10
sound = s6, 0
darken = 0
p2defmul = 1

[State 3220, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 3220, Sound]
type = playsnd
trigger1 = animelem = 2
value = 3, 2
channel = 0

[State 3220, Vel]
type = velset
trigger1 = animelemtime(10) < 0
x = 0
y = 0

[State 3220, Pos]
type = posset
trigger1 = animelemtime(10) < 0
trigger1 = pos y >= -5
y = -5

[State 3220, Accel]
type = veladd
trigger1 = animelemtime(10) > 0 && animelemtime(32) < 0
y = -0.33

[State 3220, Accel]
type = veladd
trigger1 = animelemtime(4) > 0
x = ifelse((command = "holdfwd" && vel x < 3.0), 0.1, ifelse((command = "holdback" && vel x > -3.0), -0.1, 0))

[State 3220, Push]
type = playerpush
trigger1 = movecontact
value = 0
ignorehitpause = 1

[State 3220, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
value = 1, 1
;channel = 1
stopongethit = 1

[State 3220, spin2]
type = playsnd
trigger1 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
value = 1, 4
;channel = 1
stopongethit = 1

[State 3220, electricity]
type = helper
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
trigger2 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
helpertype = normal
stateno = 1210
ID = 1210
name = "Electricity"
postype = p1
pos = 0, 0
ownpal = 1
bindtime = -1
ignorehitpause = 0

[State 3220, shock]
type = playsnd
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
value = 5, 7
channel = 5

[State 3220, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22 || animelem = 28
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x > 16, 30, 20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x > 16, 30, 20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority - 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60
air.hittime = 40

[State 3220, Hit 2]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = ifelse(p2dist x < -16, -30, -20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = ifelse(p2dist x < -16, -30, -20), ifelse(p2dist y < (-40 - p2, const(size.mid.pos.y)), 0.0, -3.0) + vel y + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority + 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60
air.hittime = 40

[State 3220, Hit Final]
type = hitdef
trigger1 = animelem = 31
attr = A, HA
damage = 24, 3
dizzypoints = 0
animtype = Hard
hitflag = MAFD
guardflag = MA
priority = 4, Hit
pausetime = 4, 4
hitsound = s2, 6
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = -14, -20
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
air.type = Low
airguard.velocity = -6.00, -1.00
air.velocity = -14, -20
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 0
forcenofall = 1
fall.recover = 0
fall.recovertime = 0
fall.animtype = Hard
sparkno = s6007 + (random % 2)
guard.sparkno = s6000
sparkxy = -10, -38
yaccel = 0.941
p1sprpriority = sprpriority
p2sprpriority = sprpriority + 1
palfx.color = 128
palfx.add = 0, 25, 75
palfx.sinadd = 0, 25, 75, 6
palfx.time = 60
air.hittime = 40

[State 3220, End]
type = changestate
trigger1 = !animtime
value = 51
ctrl = (map(superjump) != 0)


;======================<SHUN GOKU SATSU>=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -3000

[State 4000, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4000, Kanji]
type = explod
trigger1 = time = 3
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 2, -41
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 4000, Aura]
type = explod
trigger1 = !time
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 2, -34
supermovetime = -1
removetime = 43
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 4000, Superpause BG]
type = explod
trigger1 = time = 3
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(14 * const(size.xscale)), -46
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 4000, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 45
movetime = 45
anim = s6100
pos = ceil(14 * const(size.xscale)), -46
sound = s6, 5
darken = 0
p2defmul = 1

[State 4000, NHB]
type = nothitby
trigger1 = time < 56
value = SCA
time = 1
ignorehitpause = 1

[State 4000, Vel]
type = velset
trigger1 = time >= 48
trigger1 = animelemtime(3) < 0
x = 6

[State 4000, Sound]
type = playsnd
trigger1 = time = 48
value = 5, 5

[State 4000, No proximity block]
type = attackdist
trigger1 = 1
value = 0

[State 4000, Miss]
type = hitdef
trigger1 = time >= 48 && animelemtime(3) < 0
attr = S, HT
hitflag =

[State 4000, Hit]
type = hitdef
trigger1 = time >= 4 && animelemtime(3) < 0
trigger1 = !map(unthrowable) && !map(grabbehind)
trigger1 = map(truebodydistx) <= 16
attr = S, HT
hitflag = M
priority = 7, Miss
p1facing = 1
p2facing = 1
p1stateno = 4010
p2stateno = 4020
fall = 1
fall.recover = 0
fall.recovertime = 0
sparkno = -1
hitsound = s2, 800
hitsound.channel = 2

[State 4000, Sound]
type = playsnd
trigger1 = animelem = 3
value = 0, 170
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I
persistent = 0

[State 4000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- PLAYER -----
[Statedef 4010]
type = S
physics = N
movetype = A
anim = 4010
ctrl = 0
velset = 0, 0
sprpriority = 2

[State Throw]
type = targetstate
trigger1 = !time
value = 4020

[State 4010, Width]
type = width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(17) < 0
edge = 48 * const(size.xscale), 48 * const(size.xscale)

[State 4010, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0 && animelemtime(18) < 0
value = 0

[State 4010, Fade Out]
type = allpalfx
trigger1 = animelemtime(1) = 12
time = 18
sinadd = -255, -255, -255, 72

[State 4010, Black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
value = 0, 0, 0

[State 4010, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 4010, Sprite Priority]
type = sprpriority
trigger1 = animelemtime(17) >= 0
value = -1

[State 4010, Bind]
type = targetbind
trigger1 = animelemtime(17) < 0
pos = 26 * const(size.xscale), 0

[State 4010, Pos Switch]
type = posadd
trigger1 = animelem = 17
x = 40 * const(size.xscale)

[State 4010, Bind]
type = targetbind
trigger1 = animelem = 17
pos = -40 * const(size.xscale), 0

[State 4010, Hit]
type = hitadd
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1

[State 4010, Damage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = floor(-80 * map(damagescaling))
dizzy = 0
kill = ifelse((animelem = 16), 1, 0)

[State 4010, Hit]
type = targetpoweradd
trigger1 = animelem = 16
value = 300

[State 4010, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
animelem = 16
value = 2, 3
channel = 2

[State 4010, Sparks]
type = explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
helpertype = normal
anim = 6007 + (random % 2)
ID = 6000
ontop = 1
postype = p2
pos = -10, -50
random = 120, 100
facing = ifelse(random < 500, 1, -1)
ownpal = 1
ontop = 1

[State 4010, Flash]
type = envcolor
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7
trigger2 = animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12
trigger3 = animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
time = 1
value = 128, 128, 128

[State 4010, Sound]
type = playsnd
trigger1 = animelem = 17
value = 5, 4

[State 4020, FX]
type = explod
trigger1 = animelem = 17
anim = F 62
postype = p1
pos = -40 * const(size.xscale), 0
ownpal = 1
sprpriority = 10

[State 4010, Shake]
type = envshake
trigger1 = animelem = 17
time = 24
freq = 180
ampl = 3
mul = 0.8

[State 4010, Ten]
type = explod
trigger1 = animelem = 17 && !numexplod(6052)
anim = ifelse(winko, 6054, 6052)
ID = 6052
sprpriority = ifelse(winko, -3, 0)
postype = p1
pos = ceil(ifelse(facing = -1, 8, 0) * const(size.xscale)), -2
scale = const(size.xscale), const(size.yscale)
facing = facing
bindtime = -1
ownpal = 1
removeongethit = 1

[State 4010, Sound]
type = playsnd
trigger1 = animelem = 17
value = 4, ifelse(winKO, 25, 24)
channel = 0

[State 4010, End]
type = changestate
trigger1 = animelem = 17
trigger1 = winko
value = 4090

[State 4010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- TARGET -----
[Statedef 4020]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 4020, Anim]
type = changeanim2
trigger1 = !time
value = 4020

[State 4020, Pos]
type = posset
trigger1 = 1
y = 0

[State 4020, End]
type = selfstate
trigger1 = !alive
trigger1 = animelemtime(3) >= 0
value = 5150

[State 4020, End]
type = selfstate
trigger1 = !animtime
value = 5120


;======================<KONGOU KOKURETSU ZAN>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -3000

[State 4100, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4100, Kanji]
type = explod
trigger1 = anim = 4100
trigger1 = animelemtime(1) = 3
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 5, -41
vel = 0, -0.75
supermovetime = -1
ownpal = 1
scale = const(size.xscale), const(size.yscale)
facing = facing

[State 4100, Superpause BG]
type = explod
trigger1 = animelemtime(1) = 3
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-1 * const(size.xscale)), -82
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 4100, Sound]
type = playsnd
trigger1 = animelemtime(1) = 3
value = 3, 14
channel = 0

[State 4100, Super Pause]
type = SuperPause
trigger1 = animelemtime(1) = 3
time = 45
anim = s6100
pos = -1, -82
sound = s6, 5
darken = 0
p2defmul = 1

[State 4100, NHB]
type = nothitby
trigger1 = animelemtime(5) <= 10
value = SCA
time = 1
ignorehitpause = 1

[State 4100, explosion]
type = helper
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 4105
ID = 4105
name = "explosion"
postype = p1
pos = ceil(3 * const(size.xscale)), 0
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4105, explosion]
type = helper
trigger1 = animelemtime(5) = 10
helpertype = normal
stateno = 4106
ID = 4106
name = "explosion"
postype = p1
pos = ceil(17 * const(size.xscale)), 16
facing = 1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4105, explosion]
type = helper
trigger1 = animelemtime(5) = 10
helpertype = normal
stateno = 4106
ID = 4106
name = "explosion"
postype = p1
pos = ceil(-11 * const(size.xscale)), 16
facing = -1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4105, explosion]
type = explod
trigger1 = animelemtime(5) = 10
anim = 4106
supermovetime = -1
sprpriority = -1
postype = p1
pos = ceil(-3 * const(size.xscale)), -6
facing = 1
vel = -1
ownpal = 1
scale = 0.75 * const(size.xscale), 0.75

[State 4105, explosion]
type = explod
trigger1 = animelemtime(5) = 10
anim = 4106
supermovetime = -1
sprpriority = -1
postype = p1
pos = ceil(9 * const(size.xscale)), -6
facing = -1
vel = 1
ownpal = 1
scale = 0.75 * const(size.xscale), 0.75

[State 4105, explosion]
type = explod
trigger1 = animelemtime(5) = 10
anim = 4106
supermovetime = -1
sprpriority = 5
postype = p1
pos = ceil(-7 * const(size.xscale)), 39
facing = 1
vel = -2
ownpal = 1
scale = const(size.xscale), 1

[State 4105, explosion]
type = explod
trigger1 = animelemtime(5) = 10
anim = 4106
supermovetime = -1
sprpriority = 5
postype = p1
pos = ceil(13 * const(size.xscale)), 39
facing = -1
vel = 2
ownpal = 1
scale = const(size.xscale), 1

[State 4100, Sound]
type = playsnd
trigger1 = animelem = 5
value = 5, 10

[State 4100, bgflash]
type = bgpalfx
trigger1 = animelemtime(5) = 1
add = 100, 100, 200
sinadd = -100, -100, -200, 72
mul = 256, 256, 384
time = 18
persistent = 0

[State 4106, Flash]
type = palfx
trigger1 = numhelper(4105) && (animelemtime(5) = [0, 40])
add = 0, 50, 100
sinadd = 0, 50, 100, 6
time = 6

[State 4106, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
ampl = 3
freq = 180

[State 4100, Dust]
type = explod
trigger1 = animelem = 5
anim = 6024
sprpriority = -2
postype = p1
pos = ceil(5 * const(size.xscale)), 2
ownpal = 1
persistent = 0
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
persistent = 0

[State 4100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MISOGI>=============================
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 4200
ctrl = 0
velset = 0, 0
facep2 = 1
poweradd = -3000

[State 4200, Erase Inputs]
type = null
trigger1 = !AIlevel
trigger1 = time <= 0
trigger1 = 1 || map(cmd_erase_motion_super) := 1
trigger1 = 1 || map(cmd_erase_completed) := 1
ignorehitpause = 1
persistent = 0

[State 4200, Width]
type = width
trigger1 = anim = 3201
value = ceil(15 * const(size.xscale)), 0

[State 4200, Push]
type = playerpush
trigger1 = anim != 4200
value = 0

[State 4200, sprpriority]
type = sprpriority
trigger1 = anim != 4200
value = -1

[State 4200, Kanji]
type = explod
trigger1 = anim = 4200 && animelem = 2
anim = 6051
ID = 6051
sprpriority = -1
postype = p1
pos = 0, -45
vel = 0, -0.75
supermovetime = -1
ownpal = 1

[State 4200, Aura]
type = explod
trigger1 = !time
trigger1 = anim = 4200
anim = 6050
ID = 6050
sprpriority = -1
postype = p1
pos = 0, -27
supermovetime = -1
removetime = 53
bindtime = -1
ownpal = 1
removeongethit = 1
removeonchangestate = 1
scale = const(size.xscale), const(size.yscale)

[State 4200, Superpause BG]
type = explod
trigger1 = anim = 4200 && animelem = 2
trigger1 = (screenpos y = [0, 240 * (gameheight / 240.0)])
anim = 6101
supermovetime = -1
sprpriority = 3
postype = p1
pos = ceil(-20 * const(size.xscale)), -18
scale = 1.0 / camerazoom, (gamewidth / 320.0)
bindtime = -1
ownpal = 1

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4200 && animelem = 2
value = 4, 12
channel = 0

[State 4200, Super Pause]
type = SuperPause
trigger1 = anim = 4200 && animelem = 2
time = 45
anim = s6100
pos = ceil(-20 * const(size.xscale)), -18
sound = s6, 5
darken = 0
p2defmul = 1

[State 4200, NHB]
type = nothitby
trigger1 = anim = 4200
value = SCA
time = 1
ignorehitpause = 1

[State 4200, illusion]
type = helper
trigger1 = !animtime
trigger1 = anim = 4200
helpertype = normal
stateno = 4203
ID = 4203
name = "illusion"
postype = p1
pos = 0, 0
ownpal = 1
persistent = 0

[State 4200, teleport]
type = posadd
trigger1 = !animtime
trigger1 = anim = 4200
x = p2dist x - 10
y = p2dist y - 160

[State 4200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 4200
value = 4201

[State 4200, Type]
type = statetypeset
trigger1 = anim = 4201
statetype = A
physics = N

[State 4200, Accel]
type = veladd
trigger1 = anim = 4201
y = 0.5

[State 4200, Vel]
type = velset
trigger1 = animelem = 4
trigger1 = anim = 4201
y = 15

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4201 && p2bodydist y < 120 && (p2bodydist x = [-40, 40])
value = 4, 35
channel = 0
persistent = 0

[State 4200, Hit]
type = hitdef
trigger1 = anim = 4201
trigger1 = animelem = 4 || animelem = 5
persistent = 0
attr = A, HA
damage = 420, 50
dizzypoints = 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 60
guard.pausetime = 0, 45
hitsound = s2, 3
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
air.type = Low
ground.slidetime = 10
ground.hittime = 1 + 18
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
airguard.velocity = -6.00, -1.00
air.velocity = -1, 0 + map(juggledecay)
getpower = 0, 0
givepower = 40, 40
palfx.color = 32
palfx.sinadd = 40, 20, 60, 8
palfx.mul = 384, 128, 512
palfx.time = 60
guard.velocity = -8.36
guard.cornerpush.veloff = 0
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 0
sparkno = s4209
guard.sparkno = s6000
sparkxy = -10, -25
yaccel = 0.941
p1sprpriority = sprpriority

[State 4200, explosion]
type = helper
trigger1 = anim = 4202
helpertype = normal
stateno = 4205
ID = 4205
name = "explosion"
postype = p1
pos = 0, 0
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4200, bgflash]
type = bgpalfx
trigger1 = anim = 4202
add = 300, 200, 400
sinadd = -300, -200, -400, 40
time = 10
persistent = 0

[State 4200, Sound]
type = playsnd
trigger1 = anim = 4202
value = 5, 10
persistent = 0

[State 4200, Shake]
type = envshake
trigger1 = anim = 4202
time = 24
freq = 180
ampl = -4
mul = 0.85
persistent = 0
ignorehitpause = 1

[State 4200, Dust]
type = explod
trigger1 = anim = 4202
vel = -2, 0
anim = 6023
sprpriority = 3
postype = p1
pos = ceil(-20 * const(size.xscale)), 0
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4200, dust2]
type = explod
trigger1 = anim = 4202 && animelemtime(1) = 1
vel = 2, 0
anim = 6023
sprpriority = 3
postype = p1
pos = ceil(20 * const(size.xscale)), 0
facing = -1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 4200, End]
type = changeanim
trigger1 = movehit
trigger1 = anim = 4201
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4202

[State 4200, Stop]
type = posset
trigger1 = anim = 4202
y = 0

[State 4200, Stop]
type = velset
trigger1 = anim = 4202
y = 0

[State 4200, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 4202
value = 0
ctrl = 1

[State 4200, End]
type = changestate
trigger1 = !movehit
trigger1 = anim = 4201
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 4290


;----- MISS -----
[Statedef 4290]
type = S
physics = N
movetype = I
anim = 4290
ctrl = 0
velset = 0, 0

[State 4290, Stop]
type = posset
trigger1 = 1
y = 0

[State 4290, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 4290, Sound]
type = playsnd
trigger1 = animelem = 2
value = 11, 1
channel = 0

[State 4290, Sound]
type = playsnd
trigger1 = !time
value = 5, 10
persistent = 0
volumescale = 50

[State 4290, Dust]
type = explod
trigger1 = !time
anim = 6024
sprpriority = -2
postype = p1
pos = 0, 0
facing = -1
persistent = 0
ignorehitpause = 1

[State 4290, Shake]
type = envshake
trigger1 = !time
time = 24
freq = 180
ampl = -4
mul = 0.85

[State 4290, Accel]
type = gethitvarset
trigger1 = !animtime
fall.xvel = -2
fall.yvel = -10
yaccel = 10

[State 4290, End]
type = changestate
trigger1 = !animtime
value = 4291


[Statedef 4291]
type = A
physics = N
movetype = I

[State 4291, Anim]
type = changeanim
trigger1 = !time
value = 4291

[State 4291, Accel]
type = veladd
trigger1 = 1
y = 1.0

[State 4291, Vel]
type = velset
trigger1 = !time
x = -2.0
y = -12.0

[State 4291, Pos]
type = posset
trigger1 = !time
y = 0

[State 4291, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5110
