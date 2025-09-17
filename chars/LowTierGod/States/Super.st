;========================<BAN HAMMER>=============================
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0;-1000
faceP2 = 1

[State 3050, Venting Frustration]
type = Varadd
trigger1 = !Time
var(37)=-1000

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 2500, bgpalfx1]
type = bgpalfx
trigger1 = !time
time = 38
color=0
mul=0,0,0

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Attack Distance]
type = AttackDist
trigger1 = 1
value = Const(Size.Proj.Attack.Dist)

[State 3050, GTAB!!]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3050,0
volumescale=255
channel = 0

[State 3050, Temporal Thunder Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 2, 10
volumescale = 75
channel = 2

[State 3050, Jupiter Thunder Projectile]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 3055
ID = 3055
name = "Jupiter Thunder Projectile"
posType = P1
pos = ceil(52 * const(size.xScale)), ceil(-71 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Hit by roid rage final attack
[Statedef 3105]
type    = A
movetype= H
physics = N
velset = 0,0
ctrl = 0
facep2 = 1
SprPriority = 0

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3105, NotHitby]
type = NotHitby
trigger1 = 1
value = SCA

[State 3105, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3105, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3105, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 3105

[State 3105, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3106

[Statedef 3106]
type    = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
SprPriority = 0

[State 3106, NotHitby]
type = NotHitby
trigger1 = 1
value = SCA

[State 3106, playerpush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3106, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3106, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 5030

[State 3106, ChangeAnim2]
type = ChangeAnim2
trigger1 = SelfAnimExist(5035)
Trigger1 = Anim = 5030
Trigger1 = AnimTime = 0
value = 5035

[State 3106, ChangeAnim2]
type = ChangeAnim2
trigger1 = SelfAnimExist(5035)
Trigger1 = Anim = 5035
Trigger1 = AnimTime = 0
trigger2 = !SelfAnimExist(5035)
Trigger2 = Anim = 5030
Trigger2 = AnimTime = 0
value = 5050

[State 3106, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5050
trigger1 = Vel Y >= 1
trigger1 = SelfAnimExist(Anim)
value = Anim
persistent = 0

[State 3106, PosFreeze]
type = PosFreeze
trigger1 = AnimElem = 1

[State 3106, PosAdd]
type = PosAdd
trigger1 = !Time
x = -const(size.head.pos.X)
y = -const(size.head.pos.Y)

[State 3106, Velset]
type = Velset
trigger1 = !Time
x = -2.0
y = 10.0

[State 3106, VelAdd]
type = VelAdd
trigger1 = 1
y = .60

[State 3106, SelfState]
type = SelfState
trigger1 = Pos Y >= 25 && Vel Y > 0 && time > 0
value = 5100

;========================<ROID RAGE>=============================
[StateDef 3150]
type = S
physics = S
moveType = A
anim = 3150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0;-1000
faceP2 = 1

[State 3150, Venting Frustration]
type = Varadd
trigger1 = !Time
var(37)=-2000

[State 3150, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3150, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3150, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 2500, bgpalfx1]
type = bgpalfx
trigger1 = !time
time = 38
color=0
mul=0,0,0

[State 3150, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, "Roid Rage!!"]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
volumescale=128
channel = 0

[State 3150, "Roid Rage!!"]
type = PlaySnd
trigger1 = AnimElem = 4
value = 190,3
volumescale=128
channel = 0

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(130) <= 0
x = 7

[State 3150, VelMul]
type = VelMul
trigger1 = AnimElemTime(129) >= 0
x = 0.87

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElemTime(130) >= 0
x = 19.93

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElemTime(135) = 0
x = 0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 11
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 18
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 23
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 30
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
guard.kill=0

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 35
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 42
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 47
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 54
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 59
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 66
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 71
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 78
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 83
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 90
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 95
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 102
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 107
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 =  AnimElem = 114
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 119
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 126
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 20,4
getPower = 0,0
givePower = 0, 0
pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -76
guard.kill=0

[State 3100, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < HitCount + 5
trigger1 = AnimElem = 130;28 
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 45,9
getPower = 0,0
givePower = 0, 0
pausetime = 15,16
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15;30
air.hitTime = 120
ground.velocity = 1,0
ground.cornerPush.velOff = 0
guard.velocity = -7.0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover=0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -15), var(36) := -76
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p2stateno = 3105
p2Facing = 1
guard.kill=0

[State 3150, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;========================<MODDER'S BLOCK>=============================
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0;-1000
faceP2 = 1

[State 3250, Venting Frustration]
type = Varadd
trigger1 = !Time
var(37)=-1000

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 2500, bgpalfx1]
type = bgpalfx
trigger1 = !time
time = 38
color=0
mul=0,0,0

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
volumescale=225
channel = 0

[State 3250, VarSet]
type = VarSet
trigger1 = var(44) < (3215)
var(44) = 3215

[State 3250, Aegis Reflector Projectile]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 3260
ID = var(44) := var(44) + 1
name = "Aegis Reflector Projectile"
posType = P1
pos = ceil(71 * const(size.xScale)), ceil(-61 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[state 3250,Mirror]
type = Varset
trigger1 = NumHelper(var(44))
var(42) = Helper(var(44)), AnimElemNo(0)

[State 3250, Aegis Reflector Projectile]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 3261
ID = 3211
name = "Aegis Reflector Projectile"
posType = P1
pos = ceil(71 * const(size.xScale)), ceil(-61 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Aegis Reflector Projectile]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 3262
ID = 3212
name = "Aegis Reflector Projectile"
posType = P1
pos = ceil(71 * const(size.xScale)), ceil(-61 * const(size.yScale))
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 3250, Attack Distance]
type = AttackDist
trigger1 = 1
value = Const(Size.Proj.Attack.Dist)

[State 3250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<SALT OVERLOAD>=============================
[StateDef 3300]
type = S
physics = S
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0;-1000
faceP2 = 1

[State 3300, Venting Frustration]
type = VarSet
trigger1 = !Time
var(37)=0

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3300, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(11) < 0;AnimElemTime(9) < 0 || AnimElem = 9
time = 1
value = SCA

[State 2500, bgpalfx1]
type = bgpalfx
trigger1 = !time
time = 38
color=0
mul=0,0,0

[State 3300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0;4,2;
volumescale=128;255;
channel = 0

[State 3300, Eruption]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3300,1
channel = 2

[State 3300, Flame Pillar]
type = Helper
trigger1 = AnimElem = 10
helpertype = Normal
stateno = 3305
ID = 3305
name = "Flame Pillar"
postype = p1
pos = 0,0
size.xscale = 0.5
size.yscale = 0.75
ownpal = 1

[State 3300, Salt overload]
type = lifeadd
trigger1 = AnimElemTime(10) > 0 && AnimElemTime(12) < 0
value = -(lifemax/60);(lifemax/80);
;kill=0;1

[State 3300, Salt overload]
type = lifeadd
trigger1 = AnimElemTime(11) > 31 && AnimElemTime(12) < 0;AnimElemTime(11) = 60
value = -(lifemax/60);(lifemax/80);
;kill=0;1

[State 3300, Salt overload]
type = null;lifeadd
trigger1 = AnimElemTime(11) = 60
value = -332

[State 3300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1