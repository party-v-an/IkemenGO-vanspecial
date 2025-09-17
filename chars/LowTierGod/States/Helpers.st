;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;====================<FLAME PILLAR>====================
[StateDef 10186]
anim = 10186
sprpriority = 5
ctrl = 0

[State 10186, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

;====================<TRANSFORM>====================
[StateDef 10190]
anim = 10190
sprpriority = 3
ctrl = 0

[State 10190, Voice vs. Scrub characters(Evolve motherfucker)]
type = PlaySnd
trigger1 = AnimElem = 12
value = S190,2
volumescale=128
channel = 0

[State 10190, Voice vs. non-scrubby characters(mentally untouchable)]
type = PlaySnd
triggerall = AnimElem = 12
trigger1 = enemy,name = "Urien" || enemy,name = "Sean" || enemy,name = "Dan Hibiki"
trigger2 = enemy,name = "Poison" || enemy,name = "Falke" || enemy,name = "Remy" || enemy,name = "Makoto"
trigger3 = enemy,name = "Charlie Nash" || (Enemy, Name = "Charlie Nash" && Enemy, AuthorName = "Trololo")
trigger4 = enemy,name = "Rose" || enemy,name = "Rolento" || enemy,name = "Juri" || enemy,name = "Juri Han"
value = S190,1
volumescale=128;255
channel = 0

[State 10190, Voice vs. the top six(THAT SHIT'S FUNNY TO YOU!?)]
type = PlaySnd
triggerall = AnimElem = 12
trigger1 = enemy,name = "Guile" || enemy,name = "R. Mika" || enemy,name = "Chun-Li"
trigger2 = enemy,name = "Karin" || enemy,name = "Cammy" || enemy,name = "Balrog"
value = S190,3
volumescale=128;255
channel = 0

[State 10190, Voice vs. Bosses]
type = PlaySnd
triggerall = AnimElem = 12
trigger1 = enemy,name = "Shuma-Gorath" && StageVar(info.name) = "Messiah's Cocoon"
value = S190,3
volumescale=128;255
channel = 0

[State 10190, Voice vs. Trolls(Mods you know what to do!)]
type = PlaySnd
triggerall = AnimElem = 12
trigger1 = enemy,name = "LowTierGod" || enemy,name = "Twelve" || enemy,name = "DarksydePhil"
trigger2 = enemy,name = "Donkey Kong"
value = S190,0
volumescale=128;255
channel = 0

[State 10190, Voice vs. Shotos(excluding Ryu, Akuma, Dan, Sean & DSP)]
type = PlaySnd
triggerall = AnimElem = 12 
trigger1 = enemy,name = "Ryo Sakazaki" || enemy,name = "Morrigan" || enemy,name = "Kairi"
trigger2 = enemy,name = "Blaziken" || enemy,name = "Ken Masters"
value = S1027,0
volumescale=255;128
channel = 0

[State 10190, Voice vs. Ryu(LTG's worst nightmare)]
type = PlaySnd
trigger1 = AnimElem = 12
trigger1 = enemy,name = "Ryu"
value = S1029,0
volumescale=100;128
channel = 0

[State 10190, Voice vs. Scorpion(a scrub's worst nightmare)]
type = PlaySnd
trigger1 = AnimElem = 12
trigger1 = enemy,name = "Scorpion"
value = S1030,0
volumescale=100;128
channel = 0

[State 10190, Voice vs Akuma(Takes no fucking skill to use this character)]
type = PlaySnd
trigger1 = AnimElem = 12
trigger1 = enemy,name = "akuma"   
value = S1027,1
volumescale=128
channel = 0

[State 9000, Assert]
type = AssertSpecial
trigger1 = AnimElem = 24
flag = NoShadow
ignorehitpause = 1

[State 10190, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime

;====================<SUIT>====================
[StateDef 10191]
anim = 10191
ctrl = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 21
value = 190,10
channel = 1

[State 10190, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime

;====================<PARRY HELPER>=========================
[StateDef 765]
type = A
physics = N
moveType = I
anim = ifElse(Root, StateType = C, 766, ifElse(Root, StateType = A, 767, 765))
velSet = 0,0
ctrl = 0

[State 765, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 765, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1

[State 765, Change to Crouching]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "down"
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "fwd"
trigger2 = Root, AILevel && Anim != 766
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Change to Standing / Jumping]
type = ChangeAnim
trigger1 = Anim = 765 || Anim = 767
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Disable]
type = VarSet
trigger1 = Time >= ifElse((Root, StateType = A), 7, 8)
trigger2 = Facing != (Root, Facing)
trigger3 = !(Root, ctrl)
trigger3 = (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
var(0) = 1

[State 765, Disable]
type = VarSet
triggerAll = !(Root, AILevel)
trigger1 = (Root, command = "holdback")
trigger2 = Time < 4 && (Root, command = "holdfwd" + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (Root, command = "holdfwd" || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && Root, command = "fwd") || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable]
type = ChangeAnim
trigger1 = var(0) = 1
value = 1

[State 765, Standing/Air]
type = ReversalDef
trigger1 = !var(0) && (Anim = 765 || Anim = 767)
trigger1 = (Root, StateNo != 5120) || !(Root, AnimTime)
reversal.attr = SCA,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Crouching]
type = ReversalDef
trigger1 = !var(0) && Anim = 766
reversal.attr = SC,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Disable]
type = ReversalDef
trigger1 = var(0) = 1
reversal.attr =
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, End]
type = DestroySelf
trigger1 = Time >= 18
trigger2 = (Root, MoveType != I)
trigger3 = !(Root, ctrl) && (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
trigger4 = (Root, StateNo = [760,762]) && (Root, Time <= 1)


;Success
[StateDef 766]
moveType = I
ctrl = 0

[State 766, Disable]
type = VarSet
trigger1 = 1
var(0) = 1

[State 766, End]
type = DestroySelf
trigger1 = Root, StateNo = [760,762]
trigger2 = Time >= 2

;=====================<METALLIC SPHERE PROJECTILE>=========================
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 1005

[State 1005, VarSet]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(1) = Root, var(1)

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, VelSet]
type = VelSet
trigger1 = animelem=1
y = 0.0 + (var(10) * -1.97);((var(10) * -1.97) + (var(1) * -0.75))
x = 2.915 + (var(1) * 0.84375);5.83 + (var(1) * 1.6875)

[State 1005, VelSet]
type = VelSet
trigger1 = animelem=12
y = -10.0 ;+ ((var(10) * -1.97) + (var(1) * -0.75))
x = -11.66 ;+ (var(1) * 1.6875)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
Triggerall = Root,Var(1) = 0
trigger1= !(Root, var(16)) && (Root, var(15) < 2)
attr = S,SP
hitFlag = MAF
guardFlag = M;A
priority = 4, Hit
damage = floor(Ifelse(root,var(20),27,54)*root,fvar(10)),floor(Ifelse(root,var(20),3,5)*root,fvar(10));ceil(ifElse(fvar(11) * 54 < 7, 7, fvar(11) * 54)), 5
getPower = 120,0
givePower = 144, 30
pauseTime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3
guard.kill=0

[State 1005, HitDef]
type = HitDef
Triggerall = Root,Var(1) = 1
trigger1= !(Root, var(16)) && (Root, var(15) < 2)
attr = S,SP
hitFlag = MAF
guardFlag = M;A
priority = 4, Hit
damage = floor(Ifelse(root,var(20),35,70)*root,fvar(10)),floor(Ifelse(root,var(20),4,7)*root,fvar(10));ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 120,0
givePower = 144, 30
pauseTime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3
guard.kill=0

[State 1005, HitDef]
type = HitDef
Triggerall = Root,Var(1) = 2
trigger1= !(Root, var(16)) && (Root, var(15) < 2)
attr = S,SP
hitFlag = MAF
guardFlag = M;A
priority = 4, Hit
damage = floor(Ifelse(root,var(20),44,87)*root,fvar(10)),floor(Ifelse(root,var(20),4,9)*root,fvar(10));ceil(ifElse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 9
getPower = 120,0
givePower = 144, 30
pauseTime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3
guard.kill=0

[State 1005, Static Particles]
type = Helper
trigger1 = !NumHelper(8156)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8156
ID = 8156
name = "Static Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1005, End]
type = DestroySelf
trigger1 = Pos X != [-200,200]

;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1000
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1007

;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
anim = 1007
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volumescale = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;Wait
[StateDef 1008]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<STATIC CHARGE>=========================
[StateDef 1010]
type = A
physics = N
moveType = I
anim = 8156
ctrl = 0
velSet = 0,0
sprpriority = 5

[State 1010, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = ceil(0*const(size.xscale)), ceil(-181*const(size.yscale))

[State 1010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1010, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,9
channel = 12
volumescale = -65
lowPriority = 1

[State 1010, End]
type = DestroySelf
trigger1 = !AnimTime

;=====================<EX METALLIC SPHERE PROJECTILE>=========================
[StateDef 1055]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1055, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1055, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 1005

[State 1055, VelSet]
type = VelSet
trigger1 = Time = 0
x = 5.75
y = -5.5625

[State 1055, VelAdd]
type = Velset
trigger1 = Time = 8
x = .23
y = 1.3

[State 1055, VelSet]
type = VelSet
trigger1 = Time = 10
x = 3.14
y = 4.8736

[State 1055, VelAdd]
type = Velset
trigger1 = Time = 25
x = .23
y = -.08

[State 1055, VelSet]
type = VelSet
trigger1 = Time = 27
x = 6.75
y = -3.5625

[State 1055, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1055, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1055, HitDef]
type = HitDef
trigger1= !(Root, var(16)) && (Root, var(15) < 1)
attr = S,SP
hitFlag = MAF
guardFlag = M;A
priority = 4, Hit
damage = floor(Ifelse(root,var(20),48,95)*root,fvar(10)),floor(Ifelse(root,var(20),5,10)*root,fvar(10));ceil(ifElse(fvar(11) * 95 < 7, 7, fvar(11) * 95)), 10
getPower = 0,0
givePower = 0, 0
pauseTime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3
ID = 1055
guard.kill=0

[State 1055, Static Particles]
type = Helper
trigger1 = !NumHelper(8156)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8156
ID = 8156
name = "Static Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1055, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1056
ignoreHitPause = 1

[State 1055, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1055, End]
type = DestroySelf
trigger1 = Pos X != [-240,240]

;Hit Pause
[StateDef 1056]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1056, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1056, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1056, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1056, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1056, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1056, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1056, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1050
var(18) = 1

[State 1056, End]
type = ChangeState
trigger1 = Time >= 0
value = 1007

;Hit Pause
[Statedef 3006]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1
hitcountpersist = 1

[State 3006, PosFreeze]
type = Posfreeze
trigger1 = !Time
value = 1

[State 3005, VarAdd]
type = VarAdd
trigger1 = !Time
var(14) = 1

[State 3006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3006, Static Particles]
type = Helper
trigger1 = !NumHelper(8156)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8156
ID = 8156
name = "Static Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3006, HitCount]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 3006, HitCount]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 3006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 3006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 3000
var(18) = 1
persistent = 0

[State 3006, End]
type= ChangeState
TriggerAll = PrevStateNo = 3005
trigger1 = Time >= 0
value = 3005

[State 3006, End]
type= ChangeState
TriggerAll = PrevStateNo = 3055
trigger1 = Time >= 0
value = 3055

;Fade Out
[Statedef 3007]
type = A
physics = N
movetype = I
anim = 3007
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3007, End]
type = DestroySelf
trigger1 = !AnimTime

;========================<TEMPORAL THUNDER PROJECTILE>=============================
[Statedef 3055]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
slot = 0
stateNo = 3055
ignoreHitPause = 1

[State 3055, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3055, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 3055, Anim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 3005

[State 3055, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10))

[State 3055, VelSet]
type = VelSet
trigger1 = !Time
x = 0

[State 3055, VelSet]
type = VelSet
trigger1 = AnimElemTime(17) >= 0 && AnimElemTime(20) < 0 
x = 0.13;2.13

[State 3055, VelSet]
type = VelSet
trigger1 = AnimElemTime(19) >= 0 && AnimElemTime(22) < 0
x = 0.43;4.43

[State 3055, VelSet]
type = VelSet
trigger1 = AnimElemTime(21) >= 0 && AnimElemTime(26) < 0
x = 0.68;7.68

[State 3055, VelSet]
type = VelSet
trigger1 = AnimElemTime(24) >= 0
x = 0.85;9.85

[State 3055, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 10)
priority = 4, Hit
attr = S, HP
damage = 70,7
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4, 8
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.23, -4
guard.velocity = -7.23
ground.cornerpush.veloff = 0
air.velocity = -7.23, -4
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 0, 0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
yaccel = 0.5
ID = 3055
guard.kill=0

[State 3055, Miss]
type = HitDef
trigger1 = (Root, var(16)) || (Root, var(15) >= (8 + HitCount))
attr = S,HP
hitflag =
sparkxy = -10,0

[State 3055, End]
type = ChangeState
trigger1 = MoveContact
value = 3006
ignorehitpause =1

[State 3055, End]
type= ChangeState
trigger1 = !AnimTime
trigger2 = var(14) = 8
trigger3 = Root, MoveType = H
value = 3007
ctrl = 0
ignorehitpause = 1

[State 3055, End]
type = DestroySelf
trigger1 = Pos X != [-240,240]

;========================<AEGIS REFLECTOR PROJECTILE>=============================
;Fade Out
[Statedef 3207]
type = A
physics = N
movetype = I
anim = 3207
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3207, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3207, End]
type = DestroySelf
trigger1 = !AnimTime

;Hit Pause
[StateDef 3231]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 3231, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3231, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3231, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3231, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3231, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3299]
var(18) = 1

[State 3231, End]
type = ChangeState
trigger1 = Time >= 0
value = 3232

;Disappear
[StateDef 3232]
type = A
physics = N
moveType = A
anim = 3217
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 3232, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volumescale = -128
lowPriority = 1

[State 3232, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 3232, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;Reflected
[Statedef 3240]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
hitdefpersist = 1

[state 3240, SelfState]
type = SelfState
trigger1 = !IsHelper
value = 5000
ignorehitpause = 1

[state 3240, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod
ignorehitpause = 1

[State 3240, DestroySelf]
type = DestroySelf
trigger1 = IsHelper
ignorehitpause = 1

;Reflect - Hit
[Statedef 3260]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3260, VarSet]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(1) = Root, var(1)

[State 3260, HitVar]
type = VarAdd
trigger1 = !time
var(2) = 1

[State 3260, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 3260, Anim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 3210

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 0
x = 7.375
y = -5.5

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 3
x = 5.375
y = -4.35

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 6
x = 3.375
y = -3.63

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 10
x = 1.375
y = -2.65

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 15
x = 0.375
y = -0.75

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) < 0
trigger1 = Time >= 18
x = 0
y = 0

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) >= 0
trigger1 = Time >= 18
x = -0.225;0.225;
y = 0

[State 3260, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP, HP
stateno = 3271
time = -1
ignorehitpause = 1

[State 3260, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3260, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 3260, Attack Distance]
type = AttackDist
trigger1 = 1
value = Const(Size.Proj.Attack.Dist)

[State 3260, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 3260, Miss]
type = HitDef
trigger1 = !Time
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 3260, Hit]
type = HitDef
trigger1 = Var(2) < 10
priority = 4, Hit
attr = S, HA;P
damage = 27,3
affectteam = B
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 4, 8
ground.type = High
air.animtype = Hard
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0,0;-10.52
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = 0,0;-6, -6
fall = 0
air.fall = 0
fall.recover = 0
getpower = 0
givepower = 0, 0
guard.kill=0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
ID = 3260

[State 3260, Hit]
type = HitDef
trigger1 = Var(2) = 10
priority = 4, Hit
attr = S, HA;P
damage = 35,4
affectteam = B
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 4, 8
ground.type = High
air.animtype = Hard
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0,0;-10.52, -6
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = 0,0;-6, -6
fall = 0
air.fall = 0
fall.recover = 0
getpower = 0
givepower = 0, 0
guard.kill=0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
ID = 3260

[State 3260, ChangeState]
type = ChangeState
trigger1 = MoveContact || MoveReversed
value = 3263
ignorehitpause = 1

[State 3260, ChangeState]
type = ChangeState
trigger1 = Time = 350
trigger2 = Var(2) = 10
value = 3207
ctrl = 0
ignorehitpause = 1

;Reflect - OverRide
[Statedef 3261]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
movehitpersist = 0
hitcountpersist = 0

[State 3261, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = Invisible

[State 3261, VarSet]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(44) = Root, var(44)

[State 3261, PosSet]
type = PosSet
trigger1 = NumHelper(var(44))
x = (Helper(var(44)), ScreenPos X) - 160
y = ((Helper(var(44)), Pos Y))

[State 3261, Anim]
type = ChangeAnim
trigger1 = Root, NumHelper (var(44))
trigger2 = AnimElemTime (AnimElemNo(0 + 1)) < 0
value = 3205
elem = Root, Var(45)

[State 3261, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP, HP
stateno = 3271
time = -1
ignorehitpause = 1

[State 3261, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3261, End]
type = DestroySelf
trigger1 = !Root, NumHelper(var(44))

;Reflect - Reverse
[Statedef 3262]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
movehitpersist = 0
hitcountpersist = 0

[State 3262, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = Invisible

[State 3262, VarSet]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(44) = Root, var(44)

[State 3262, PosSet]
type = PosSet
trigger1 = NumHelper(var(44))
x = (Helper(var(44)), ScreenPos X) - 160
y = ((Helper(var(44)), Pos Y))

[State 3262, Anim]
type = ChangeAnim
trigger1 = Root, NumHelper (var(44))
trigger2 = AnimElemTime (AnimElemNo(0 + 1)) < 0
value = 3205
elem = Root, Var(45)

[State 3262, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 3262, Counter]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA, NP, SP, HP
pausetime = 0,0
sparkno = -1
sparkxy = 0,0
p1stateno = 3272
p2stateno = 3240
numhits = 0

[State 3262, End]
type = DestroySelf
trigger1 = !Root, NumHelper(var(44))

;Reflect - Contact
[Statedef 3263]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
movehitpersist = 0
hitcountpersist = 0

[State 3263, ParentVarAdd]
type = ParentVarAdd
trigger1 = MoveHit
trigger2 = NumTarget
var(15) = 1

[State 3263, ParentVarAdd]
type = ParentVarAdd
trigger1 = MoveHit
trigger2 = NumTarget
var(13) = 1

[State 3263, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10))

[State 3263, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3263, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 3263, Static Particles]
type = Helper
trigger1 = !NumHelper(8157)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8157
ID = 8157
name = "Static Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3263, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 3263, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3299]
var(18) = 1
persistent = 0

[State 3263, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3263, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 3263, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP, HP
stateno = 3271
time = -1
ignorehitpause = 1

[State 3263, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3263, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 3263, Attack Distance]
type = AttackDist
trigger1 = 1
value = Const(Size.Proj.Attack.Dist)

[State 3263, Miss]
type = HitDef
trigger1 = 1
attr = S, SP
hitFlag =
sparkXY = -10,0

[State 3263, ChangeState]
type = ChangeState
trigger1 = !HitPauseTime
value = 3260
ctrl = 0
ignorehitpause = 1

;Reflect - OverRidden
[Statedef 3271]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
movehitpersist = 0
hitcountpersist = 0

[State 3271, Reflect]
type = ParentVarSet
trigger1 = !Time
var(46) = 1

[State 3271, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3271, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP, HP
stateno = 3271
time = -1
ignorehitpause = 1

[State 3271, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3271, ChangeState]
type = ChangeState
trigger1 = !Time
value = 3261

[State 3271, End]
type = DestroySelf
trigger1 = !Root, NumHelper(var(44))

;Reflect - Reversed
[Statedef 3272]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
movehitpersist = 0
hitcountpersist = 0

[State 3272, Reflect]
type = ParentVarSet
trigger1 = !Time
var(46) = 1

[State 3272, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignorehitpause = 1

[State 3272, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 3272, ChangeState]
type = ChangeState
trigger1 = !Time
value = 3262

[State 3272, End]
type = DestroySelf
trigger1 = !Root, NumHelper(var(44))

;Static Sphere
[Statedef 3280]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3280, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP, HP
stateno = 3232
time = -1
ignorehitpause = 1

[State 3280, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3280, Anim]
type = ChangeAnim
trigger1 = !Time
value = 3215

[State 3280, Turn]
type = Turn
trigger1 = (P2Dist X < 10)

[State 3280, VelSet]
type = VelSet
trigger1 =(!Time)
x = 3

[State 3280, VelAdd]
type=VelAdd
trigger1 = (P2Dist X < 0) && (Vel X > -6)
x = -0.2

[State 3280, VelAdd]
type=VelAdd
trigger1=(P2Dist X > 0) && (Vel X < 6)
x = 0.2

[State 3280, VelAdd]
type = VelAdd
trigger1 = (EnemyNear, Pos Y > Pos Y) && (Vel Y < 6)
y = 0.2

[State 3280, VelAdd]
type = VelAdd
trigger1 = (EnemyNear, Pos Y <= Pos Y) && (Vel Y > -6)
y = -0.2

[State 3280, Attack Distance]
type = AttackDist
trigger1 = 1
value = Const(Size.Proj.Attack.Dist)


[State 3280, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10))

[State 3280, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3280, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitflag =
sparkXY = -10,0

[State 3280, HitDef]
type = HitDef
trigger1= !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
attr = S,SP
hitFlag = MAF
guardFlag = M;A
priority = 4, Hit
damage = 87,9;ceil(ifElse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 8
getPower = 0,0
givePower = 0,0
pauseTime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3
guard.kill=0
ID = 3280

[State 3280, Static Particles]
type = Helper
trigger1 = !NumHelper(8157)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8157
ID = 8157
name = "Static Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3280, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3281
ignoreHitPause = 1

[State 3280, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3232
ignoreHitPause = 1

[State 3280, End]
type = DestroySelf
trigger1 = FrontEdgeDist <= -60
trigger1 = Pos X != [-200,200]

;Hit Pause
[StateDef 3281]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 3281, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3281, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 3281, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3281, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3281, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3299]
var(18) = 1

[State 3281, End]
type = ChangeState
trigger1 = Time >= 0
value = 3232

;========================<VESUVIAN BURNOUT (FLAME PILLAR)>=============================
[Statedef 3305]
type = S
physics = N
movetype = A
ctrl = 0
sprpriority = 3
hitcountpersist = 1

[State 3305, HitOverride]
type = Hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 3306
ignorehitpause = 1

[State 3305, HitBy]
type = Hitby
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignorehitpause = 1

[State 3305, ChangeAnim]
type = Changeanim
trigger1 = !Time && !PrevStateNo
value = 3305

[State 3305, BindtoRoot]
type = BindtoRoot
trigger1 = 1
pos = 9, 12
facing = 1

[State 3305, Damage Dampener]
type = null;VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3305, Transparency]
type = trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 3305, Miss]
type = HitDef
trigger1 = (Root, var(16)) || (Root, var(15) >= (8 + HitCount) && Parent, StateNo = 3300)
attr = S,HP
hitflag =
sparkxy = -10,0

[State 3305, Desperate motherfuckers Dude!!]
type = HitDef
triggerall=Enemy, Name != "Nakoruru"||Enemy, Name != "Breloom"
triggerall=Enemy, Name != "Hugo"||Enemy, Name != "Utsuho Reiuji"
triggerall=Enemy, Name != "DarksydPhil"
trigger1 = Root, StateNo = 3300
trigger1 = ((Time = 6 && PrevStateNo = 3306) || (Time = 0 && !var(14))) && (var(13) < 8)
attr = S,HP
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = floor(Ifelse(root,var(20),77,154)*root,fvar(10)),floor(Ifelse(root,var(20),15,31)*root,fvar(10))
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 10
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 60
ground.velocity = -2.25, -7.75
ground.cornerpush.veloff = 0
guard.velocity = -11
guard.cornerpush.veloff = 0
air.velocity = -2.25, -7.75
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -48
palfx.time = 55
palfx.mul = 128,128,128
palfx.sinadd = 96,96,96,4
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
sprpriority = 3
ID = 3305
guard.kill=0

[State 3305, Desperate motherfuckers Dude!!]
type = HitDef
triggerall=Enemy, Name = "Hugo"||Enemy, Name = "Utsuho Reiuji"
trigger1 = Root, StateNo = 3300
trigger1 = ((Time = 6 && PrevStateNo = 3306) || (Time = 0 && !var(14))) && (var(13) < 8)
attr = S,HP
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = floor(Ifelse(root,var(20),83,166)*root,fvar(10)),floor(Ifelse(root,var(20),17,33)*root,fvar(10))
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 10
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 60
ground.velocity = -2.25, -7.75
ground.cornerpush.veloff = 0
guard.velocity = -11
guard.cornerpush.veloff = 0
air.velocity = -2.25, -7.75
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -48
palfx.time = 55
palfx.mul = 128,128,128
palfx.sinadd = 96,96,96,4
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
sprpriority = 3
ID = 3305
guard.kill=0

[State 3305, Desperate motherfuckers Dude!!]
type = HitDef
triggerall=Enemy, Name = "Nakoruru"||Enemy, Name = "Breloom"
trigger1 = Root, StateNo = 3300
trigger1 = ((Time = 6 && PrevStateNo = 3306) || (Time = 0 && !var(14))) && (var(13) < 8)
attr = S,HP
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = floor(Ifelse(root,var(20),71,142)*root,fvar(10)),floor(Ifelse(root,var(20),14,28)*root,fvar(10))
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 10
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 60
ground.velocity = -2.25, -7.75
ground.cornerpush.veloff = 0
guard.velocity = -11
guard.cornerpush.veloff = 0
air.velocity = -2.25, -7.75
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -48
palfx.time = 55
palfx.mul = 128,128,128
palfx.sinadd = 96,96,96,4
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
sprpriority = 3
ID = 3305
guard.kill=0

[State 3305, Desperate motherfuckers Dude!!]
type = HitDef
triggerall=Enemy, Name = "DarksydePhil"
trigger1 = Root, StateNo = 3300
trigger1 = ((Time = 6 && PrevStateNo = 3306) || (Time = 0 && !var(14))) && (var(13) < 8)
attr = S,HP
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = floor(Ifelse(root,var(20),89,178)*root,fvar(10)),floor(Ifelse(root,var(20),17,33)*root,fvar(10))
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 10
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 60
ground.velocity = -2.25, -7.75
ground.cornerpush.veloff = 0
guard.velocity = -11
guard.cornerpush.veloff = 0
air.velocity = -2.25, -7.75
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -48
palfx.time = 55
palfx.mul = 128,128,128
palfx.sinadd = 96,96,96,4
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
sprpriority = 3
ID = 3305
guard.kill=0

[State 3305, Final Hit]
type = null;HitDef
trigger1 = Root, StateNo = 3300
trigger1 = (Time = 6 && PrevStateNo = 3306) && (var(13) = 8)
attr = S,HP
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = floor(Ifelse(root,var(20),166,332)*root,fvar(10)),floor(Ifelse(root,var(20),33,66)*root,fvar(10));floor(Ifelse(root,var(20),83,166)*root,fvar(10)),floor(Ifelse(root,var(20),17,33)*root,fvar(10));ceil(ifElse(fvar(11) * 166 < 7, 7, fvar(11) * 166)), 33;ceil(ifElse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 16
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 10
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 60
ground.velocity = -2.25, -7.75
ground.cornerpush.veloff = 0
guard.velocity = -11
guard.cornerpush.veloff = 0
air.velocity = -2.25, -7.75
air.cornerpush.veloff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -48
palfx.time = 55
palfx.mul = 128,128,128
palfx.sinadd = 96,96,96,4
envshake.time = 18
envshake.ampl = 6
envshake.freq = 120
sprpriority = 3
ID = 3305
guard.kill=0

[State 3305, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3305, End]
type = ChangeState
trigger1 = MoveContact
value = 3306
ignorehitpause =1

[State 3305, End]
type= ChangeState
trigger1 = !AnimTime
trigger2 = Root, MoveType = H
trigger3 = Root, StateNo!= 3300
trigger4 = var(14) >= 8
value = 3307
ignorehitpause = 1

;Hit Pause
[Statedef 3306]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1
hitcountpersist = 1

[State 3306, PosFreeze]
type = Posfreeze
trigger1 = 1
value = 1

[State 3306, VarSet]
type = VarAdd
trigger1 = 1
var(14) = 1

[State 3306, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 8)
channel = 3
persistent = 0
ignorehitPause = 1

[State 3306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist X < -64, -64, ifElse(P2Dist X < 64, ceil(P2Dist X), 64)), ceil(P2Dist Y - 64)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3306, HitCount]
type= ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3306, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && Numtarget
var(15) = 1

[State 3306, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3306, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root,Stateno = 3300
var(18) = 1

[State 3306, End]
type= ChangeState
trigger1 = Time >= 0
value = 3305

;Explosion Fade
[Statedef 3307]
type = A
physics = N
movetype = A
anim = 3307
ctrl = 0
velset = 0,0
sprpriority = 3
movehitpersist = 1

[State 3307, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 3307, End]
type = DestroySelf
trigger1 = !Animtime

;========================<SPARKS>=============================
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8


;Light Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Heavy Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8

;======================<JUMP DUST>===========================
[StateDef 8100]
type = S
anim = 1
velSet = 0,0

[State 8100, Bind]
type = BindToRoot
trigger1 = Time

[State 8100, Floor Dust]
type = Explod
trigger1 = !Time
anim = 8100
sprPriority = 3
posType = P1
pos = 0, ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, Player Dust]
type = Explod
trigger1 = !Time || Time = 2 || Time = 6
anim = 8101
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, End]
type = DestroySelf
trigger1 = Time >= 7

;======================<DASH DUST>===========================
[StateDef 8103]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8103, posSet]
type = PosSet
trigger1 = !Time = 0
y = 0

[State 8103, Dash Dust]
type = Explod
trigger1 = Time = 0 || Time = 3 || Time = 6
anim = 8103
ID = ifElse((Time = 6), 3, ifElse((Time = 3), 2, 1))
posType = P1
pos = 0,-4
random = 8,8
vel = -3 - (Random / 1000.0), -2 - (Random / 2000.0)
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 16
sprPriority = 3
pauseMoveTime = -1
superMoveTime = -1

[State 8103, Scale Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.1 + (0.025 * Time), 0.1 + (0.025 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8103, Scale Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.1 + (0.025 * (Time - 3)), 0.1 + (0.025 * (Time - 3))
trans = AddAlpha
alpha = 256 - (16 * (Time - 3)), 256

[State 8103, Scale Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.1 + (0.025 * (Time - 6)), 0.1 + (0.025 * (Time - 6))
trans = AddAlpha
alpha = 256 - (16 * (Time - 6)), 256

[State 8103, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 22

[State 8103, End]
type = DestroySelf
trigger1 = !NumExplod

;======================<IMPACT DUST>===========================
[StateDef 8110]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod

;======================<WALL IMPACT DUST>===========================
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;========================<FLAMES>=============================
[StateDef 8150]
type = A
velSet = 0,0
anim = 1

[State 8150, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8150, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 8150, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 8150, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8150, Flame Explod 1]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, Flames Explod 2]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, End]
type = DestroySelf
trigger1 = Time >= 600
trigger2 = !PlayerIDexist(var(0))
trigger3 = Root, StateNo = 1520 && Root, AnimElem = 2

[State 8150, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), Movetype != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])

;========================<STATIC>=============================
[Statedef 8155]
type = A
velset = 0, 0
anim = 1

[State 8155, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8155, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))
[State 8155, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8155, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8155, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8155
sprpriority = 3
postype = p1
random = 40, 40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
;bindtime = -1
scale = 0.15, 0.15
ownpal = 1

[State 8155, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 10
volumescale = -65
lowPriority = 1

[State 8155, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8155, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;========================<STATIC (PALETTE APPLIED)>=============================
[Statedef 8156]
type = A
velset = 0, 0
anim = 1

[State 8156, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8156, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8156, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8156, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8156, Static]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8156
sprpriority = 3
postype = p1
random = 40, 40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
;bindtime = -1
scale = 0.15, 0.15
ownpal = 1

[State 8156, PlaySnd]
type = PlaySnd
trigger1 = !Time; && Stateno = [200,2999]
value = 2,7
channel = 10
volumescale = -65
lowPriority = 1

[State 8156, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8156, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;========================<STATIC (AEGIS REFLECTOR)>=============================
[Statedef 8157]
type = A
velset = 0, 0
anim = 1

[State 8157, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8157, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8157, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8157, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8157, Static]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8157
sprpriority = 3
postype = p1
random = 40, 40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
;bindtime = -1
scale = 0.23, 0.23
ownpal = 1

[State 8157, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 10
volumescale = -65
lowPriority = 1

[State 8157, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8157, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;========================<RECOVER FX>=============================
[StateDef 8200]
type = A
velSet = 0,0
anim = 8200
sprPriority = 5

[State 8200, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8200, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.017 * Time), 0.25 + (0.017 * Time)
ignoreHitPause = 1

[State 8200, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(256 - 17.1 * Time), 256
ignoreHitPause = 1

[State 8200, End]
type = DestroySelf
trigger1 = Time >= 15
;========================<SUPER FINISH>=============================
[StateDef 8600]
type = A
velSet = 0,0
anim = 1

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 8600, Super Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0
volumescale=172;255

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * GameHeight / GameWidth), (0.25 * time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 8600, End]
type = DestroySelf
trigger1 = RoundState < 3

;========================< CAMERA CONTROL >=============================
[Statedef 8999]
type = S
velset = 0, 0
anim = 9741

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2
trigger1 = (root, stateno != [3205, 3206])

;---------------------------------------------------------------------------
;CAMERA FOCUS
[Statedef 6001]
type = S
physics  = S
anim = 0
ctrl = 0

[state 6001,TURN]
type=turn
trigger1=ishelper(6001)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type = VelSet
trigger1 = parent,pos X > 0
x = ifelse(facing = 1,4,-4)

[State 6001,vel]
type = VelSet
trigger1 = parent,pos X < 0
x = ifelse(facing = 1,-4,4)

[State 6001,vel]
type = VelSet
trigger1 = parent,pos X = [-5,5]
x = 0

[State 6001, WIDTH]
type = Width
trigger1 = 1
value = 1,1

[State 6001, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 6001,AS]
type = AssertSpecial
Trigger1 = 1
flag = invisible
flag2 = noshadow

[State 6001,Bound]
type = ScreenBound
trigger1 =1
value =1
movecamera = 320,0
[State 6001,push]
type = PlayerPush
trigger1 =1
value = 0

[State 6001, Destroyself]
type = destroyself
trigger1 = Time = 50
trigger1 = enemy, Life >= 1
trigger2=numhelper(6001)>=2


;--------------------------------------------------
;afterimages de lados
[Statedef 8505]
physics=N
anim = root,anim

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 0
;ignorehitpause =
;persistent =

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, BindToParent]
type = BindToroot
triggerall = stateno != 3900
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, BindToParent]
type = BindToroot
triggerall = stateno = 3900
trigger1 = time = 0
time = 1
pos = -20,-75

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = .4
y = ifelse((root,statetype != A),0,-.4)

[State 0, Trans]
type = Trans
trigger1 = 1
trans=addalpha
alpha=120-2*(time),256

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 46
trigger2 = root,movetype =h

[State 3887: DestroySelf]
type = DestroySelf
trigger1 = Time >= 46
trigger2 = root,movetype =h
;--------------------------------------------------
;afterimages de lados
[Statedef 8506]
physics=N
anim = root,anim

[State 0, SprPriority]
type = SprPriority
trigger1 = 1
value = 0
[State 0, BindToParent]
type = BindToroot
triggerall = stateno != 3900
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2
ignorehitpause = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = -.4
y = ifelse((root,statetype != A),0,.4)

[State 0, Trans]
type = Trans
trigger1 = 1
trans=addalpha
alpha=120-2*(time),256

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 46
trigger2 = root,movetype =h

[State 3887: DestroySelf]
type = DestroySelf
trigger1 = Time >= 46
trigger2 = root,movetype =h