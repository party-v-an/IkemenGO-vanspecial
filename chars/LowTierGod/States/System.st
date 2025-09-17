;==============================================================================================
;=======================================<SYSTEM STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[StateDef 0]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && !AnimTime
value = 0

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050

;====================<CROUCHING>====================
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11

;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = 11
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && !AnimTime
value = 11

;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 12
value = 12

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<WALKING>====================
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 20

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 21

;====================<JUMPING>====================
;Jumping
[StateDef 40]
type = S
physics = S
moveType = I
anim = 40
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 40, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 40, 0

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 40, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1

;In Air
[StateDef 50]
type = A
physics = N
moveType = I
sprPriority = 1

[State 50, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(!vel x , 41, ifElse(vel x > 0, 42, 43)) + 10 * (var(3) = [1,2])
persistent = 0

[State 50, Assert: No Guard]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard
ignoreHitPause = 1

[State 50, Grounded Frame]
type = PosFreeze
trigger1 = Time < 1 && PrevStateNo = 40
value = 1

[State 50, Gravity]
type = Gravity
trigger1 = Time >= 1 || PrevStateNo != 40

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

[StateDef 51]
type = A
physics = N
moveType = I
sprPriority = 1

[State 51, Gravity]
type = Gravity
trigger1 = 1

[State 51, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;Landing
[StateDef 52]
type = S
physics = S
moveType = I
anim = 47
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && (var(3) = 1 || var(3) = 2)
trigger1 = (PrevStateNo = [600,699])
value = 57

[State 52, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, CtrlSet]
type = CtrlSet
trigger1 = !Time && (PrevStateNo != [600,699])
trigger2 = Time = 1 && Anim != 57
value = 1

[State 52, ChangeState to Guarding]
type = ChangeState
trigger1 = ctrl && command = "holdback"
trigger1 = InGuardDist && (PrevStateNo != [600,699])
value = 120

[State 52, Assert: NoWalk]
type = AssertSpecial
trigger1 = Anim != 5
flag = NoWalk
ignoreHitPause = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, ChangeAnim to Turning]
type = ChangeAnim
trigger1 = ctrl && P2Dist x < 0
trigger1 = Anim != 5
value = 5

[State 52, Turn]
type = Turn
trigger1 = Anim = 5 && AnimElem = 1

[State 52, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;======================<RUN>===========================
[StateDef 100]
type = S
physics = N
moveType = I
anim = 100
ctrl = 0
sprPriority = 1

[State 100, VelSet]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 4 || AnimElem = 7)
value = 100, ifElse((AnimElem = 4), 0, 1)

[State 100, End]
type = ChangeState
triggerall = time >= 9
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x <= 90
value = 101

;Stop Running
[StateDef 101]
type = S
physics = S
moveType = I
anim = 101
sprPriority = 1

[State 101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 111, End]
type = Ctrlset
trigger1 = Animelem=2
value = 1

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(command = "holddown", 10, 0)
ctrl = 1

;========================<DASH BACKWARDS>==========================
[StateDef 105]
type = A
physics = N
moveType = I
velSet = 0,0
anim = 105
ctrl = 0
sprPriority = 1

[State 105, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105,0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 110, Type]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 105, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 106

;Stop Dashing Backwards
[StateDef 106]
type = S
physics = S
ctrl = 0
anim = 106
velSet = 0,0

[State 106, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 106, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 100,1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 106, End]
type = Ctrlset
trigger1 = Animelem=3
value = 1

[State 106, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=================<DASH FORWARD>=================
[StateDef 110]
type = S
physics = N
moveType = I
anim = 110
ctrl = 0
sprPriority = 1

[State 110, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, Type]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.35;8.45
y = -4.03

[State 110, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 110, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 111

;Stop Dashing Forward
[StateDef 111]
type = S
physics = S
ctrl = 0;1
anim = 111
velSet = 0,0

[State 111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 101, 1]
type = CtrlSet
trigger1 = Animelem=2
value = 1

[State 111, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;====================<PARRY>====================
;Standing Parry
[StateDef 760]
type = S
physics = S
moveType = I
anim = 760
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 144;72
faceP2 = 1

[State 760, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 760, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 760, No Walking]
type = VarSet
trigger1 = 1
var(26) = 7

[State 760, Voice]
type = PlaySnd
trigger1= !Time
value = 860,0
volumescale=128
channel = 0

[State 760, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 760, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 760, FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 44, -85
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownPal = 1

[State 760, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 760, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Crouching Parry
[StateDef 761]
type = C
physics = C
moveType = I
anim = 761
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 144;72
faceP2 = 1

[State 761, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 761, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 761, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 761, No Walk]
type = VarSet
trigger1 = 1
var(26) = 7

[State 761, Voice]
type = PlaySnd
trigger1 = !Time
value = 860,0
volumescale=128;255
channel = 0

[State 761, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 761, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinAdd = 0,-64,-255,60
time = 15

[State 761, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprpriority = 5
postype = P1
pos = 37, -41
pauseMovetime = -1
superMovetime = -1
scale = 0.5,0.5
ownpal = 1

[State 761, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 761, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;Jumping Parry
[StateDef 762]
type = A
physics = N
moveType = I
anim = 762
ctrl = 0
sprPriority = 2
powerAdd = 144;72
faceP2 = 1

[State 762, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 762, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 762, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 762, Voice]
type = PlaySnd
trigger1 = !Time
value = 860,0
volumescale=128;255
channel = 0

[State 762, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 762, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 762, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 38, -97
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownpal = 1

[State 762, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 762, End]
type = ChangeState
trigger1 = !AnimTime
value = 763
ctrl = 1

;Falling
[StateDef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(vel x > 2, 2, ifElse(vel x < -2, -2, vel x))
y = ifElse(vel y < -2, vel y, -2)

[State 763, Gravity]
type = Gravity
trigger1 = 1

[State 763, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52
;==========<TARGET SAFE FALL>==========
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = anim = 5035
value = 5050

[State 5205, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5205, SelfState (Ground)]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 5205, SelfState (Air)]
type = SelfState
trigger1 = Time >= 60
value = 5210

;==========<FALL RECOVERY>==========
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201

[StateDef 5201]
type = S
moveType = I
physics = N
anim = 5200
ctrl = 0
faceP2 = 1

[State 5201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = -8
y = 0

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 195,0;800,0
volumescale=128
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time=10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Air Recover
[StateDef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0
faceP2 = 1

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 195,0;800,0
volumescale=128
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value  = 5200,0
channel = 1

[State 5210, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5210, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-66 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(4) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52

;===================<GUARD>================
;Guard Start
[StateDef 120]
type = U
physics = U
anim = 120 + (StateType = C) + (StateType = A) * 2

[State 120, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 120, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 120, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 120, VelSet]
type = VelSet
trigger1 = !Time && StateType != A
x = 0
y = 0

[State 120, Stand to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 120, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 120, Change to Guard State]
type = ChangeState
trigger1 = !AnimTime || AILevel
value = 130 + (StateType = C) + (StateType = A) * 2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

;Standing Guard
[StateDef 130]
type = S
physics = S

[State 130, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 130, Standing to Crouch]
type = ChangeState
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

[State 130, Landing Sound]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
value = 52,0

[State 130, Landing Dust Expod]
type = Explod
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

;Crouch Guarding
[StateDef 131]
type = C
physics = C

[State 131, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 131
value = 131

[State 131, Crouching to Standing]
type = ChangeState
trigger1 = !AILevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

;Air Guard
[StateDef 132]
type = A
physics = N

[State 132, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 132
value = 132

[State 132, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 132, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 132, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 132, Jumping to Standing]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

;Guard End
[StateDef 140]
type = U
physics = U
ctrl = 1

[State 140, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 140 + (StateType = C) + (StateType = A) * 2

[State 140, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 140, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 140, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 140, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 140, End]
type = ChangeState
trigger1 = !AnimTime
value = (StateType = C) * 11 + (StateType = A) * 51

;Hit while Guarding (Standing)
[StateDef 150]
type = S
movetype = H
physics = N
velSet = 0,0

[State 150, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

;Knocked Back while Guarding (Standing)
[StateDef 151]
type = S
moveType = H
physics = S
anim = 150

[State 151, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 151, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 151, CtrlSet]
type = CtrlSet
trigger1 = time = GetHitVar(CtrlTime)
value = 1

[State 151, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 151, End]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1

;Hit while Guarding (Crouching)
[StateDef 152]
type = C
moveType = H
physics = N
velSet = 0,0

[State 152, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

;Knocked Back while Guarding (Crouching)
[StateDef 153]
type = C
moveType = H
physics = C
anim = 151

[State 153, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 153, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 153, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 153, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 153, End]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1

;Hit while Guarding (Jumping)
[StateDef 154]
type = A
moveType = H
physics = N
velSet = 0,0

[State 154, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, End]
type = ChangeState
trigger1 = HitShakeOver
value = 155

;Knocked Back while Guarding (Jumping)
[StateDef 155]
type = A
moveType = H
physics = N
anim = 152

[State 155, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 155, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 155, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 155, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 155, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 155, End]
type = ChangeState
trigger1 = sysvar(0)
value = 52

;====================<LOSE>====================
[StateDef 170]
type = S
ctrl = 0
anim = 170
velSet = 0,0

[State 170, 1]
type = Explod
trigger1 = Time = 88
anim = 8050
pos = 0, 0
postype = p1
sprpriority = 2
RemoveTime = -1
BindTime = -1
scale = const(size.xscale), const(size.yscale)

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 170, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 240
flag = RoundNotOver

;====================<DRAW GAME>====================
[StateDef 175]
type = S
ctrl = 0
velSet = 0,0

[State 175, ChangeState]
type = ChangeState
trigger1 = !Time
value = 170

;==========<TAUNT>==========
[StateDef 195]
type = S
moveType = A
physics = S
anim = 195
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 195, poweradd]
type = poweradd
trigger1 = anim = 195
value = 3

[State 195, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 195,0
volumescale=128
channel = 0

[State 195, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 1

[State 195, Impact]
type = PlaySnd
trigger1 = AnimElem = 9
value = 820,1
channel = 2

[State 195, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(11) <= 20
trigger1 = !(AnimElemTime(11) % 5)
time = 5
freq = 120
ampl = 3 -Ceil(AnimElemTime(11) * 0.31)

[State 195, Impact Dust]
type = Explod
trigger1 = AnimElem = 9
anim = 8105;06
sprPriority = -3
pos = 0,10
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 195, HitDef]
type = HitDef
trigger1 = AnimElem = 9
ID = 195
attr = S, SA 
hitFlag = MAFD
guardFlag = M
priority = 1, Hit
damage = 8, 0
getPower = 0,0
givePower = 0,0
pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = -1.2
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -1.2, -5
air.cornerPush.velOff = 0
yAccel = 0.63
fall = 0
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 50), var(36) := -51

[State 200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;====================<INTRO>====================
[StateDef 190]
type = S
physics = S
anim = 190

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = nobardisplay

[State 190, Helper]
type = Helper
trigger1 = !time
helpertype = normal
name = "Transform"
ID = 10190
stateno = 10190
pos = 0,0
postype = p1   
facing = 1
keyctrl = 0

[State 190, Helper]
type = Helper
trigger1 = !time
helpertype = normal
name = "Suit"
ID = 10191
stateno = 10191
pos = 0,0
postype = p1   
facing = 1
keyctrl = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<TURNS INTRO>====================
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y > -vel y
value = 6901

;Landing
[StateDef 6901]
type = S
physics = S
anim = 6901
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)

[State 6901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6901, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 190, 1
volumescale=128;255
channel = 0

[State 6901, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 1

[State 195, Impact]
type = PlaySnd
trigger1 = AnimElem = 9
value = 820,1
channel = 2

[State 195, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(11) <= 20
trigger1 = !(AnimElemTime(11) % 5)
time = 5
freq = 120
ampl = 3 -Ceil(AnimElemTime(11) * 0.31)

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====================<WIN POSE DECIDER>====================
[StateDef 180]
type = S

[State 180, Generic Victory Quote]
type = VictoryQuote
trigger1 = 1
value = (Random % 32)

[State 180, Victory Quote vs. Twinks(excluding Remy)]
type = VictoryQuote
trigger1 = enemy,name = "Gliz" || enemy,name = "Zhihao" || enemy,name = "Bellamy"
value = 32+random%4

[State 180, Victory Quote vs. shotos]
type = VictoryQuote
trigger1 = enemy,name = "Ryo Sakazaki" || enemy,name = "Ryu" || enemy,name = "Kairi" || enemy,name = "Morrigan" || enemy,name = "Blaziken"
trigger2 = enemy,name = "Ken Masters"
value = 49+random%3

[State 180, Victory Quote vs. grapplers]
type = VictoryQuote
trigger1 = enemy,name = "Alex" || enemy,name = "Hugo Andore" || enemy,name = "Griffon" || enemy,name = "Shermie"
value = 52+random%3

[State 180, Victory Quote vs. Darksydephil]
type = VictoryQuote
trigger1 = Enemy, Name = "DSP" || Enemy, Name = "DarksydePhil" || Enemy, Name = "Phil the king of hate"
value = 55

[State 180, Victory Quote vs. bosses in general]
type = VictoryQuote
trigger1 = enemy,name = "Utsuho Reiuji" && StageVar(info.name) = "Rapture"
trigger2 = enemy,name = "Ingrid" && StageVar(info.name) = "Infinity Chamber"
trigger3 = enemy,name = "????" && StageVar(info.name) = "THE MADNESS CITY"
trigger4 = enemy,name = "Gill"
value = 59

[State 180, Victory Quote vs. charge characters]
type = VictoryQuote
trigger1 = Enemy, Name = "Vampy" || enemy,name = "Balrog" || enemy,name = "Vega" || enemy,name = "M.Bison" || enemy,name = "Birdie"
trigger2 = enemy,name = "Blanka" || enemy,name = "Decapre" || enemy,name = "Chun-Li" || enemy,name = "Deejay" || enemy,name = "Remy"
trigger3 = Enemy, Name = "Bulk Bogan" || enemy,name = "Emulen"
value = 60+random%3

[State 180, Victory Quote vs. Mirror]
type = VictoryQuote
trigger1 = Enemy, Name = "LowTierGod"||Enemy, Name = "Urien"
value = 73+random%2

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = 181

[State 180, Win 2]
type = ChangeState
Triggerall = Enemy, P2Dist X <= 80
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
trigger1 = Enemy, Facing != Facing
trigger1 = Enemy, Anim = 5150 || Enemy, Anim = 5110
value = IfElse(Enemy, P2Dist X <= 40, 183, 182)

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holdstart"
value = 187

[State 180, Pefect Win]
type = ChangeState
trigger1 = WinPerfect = 1
value = 187

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = IfElse (Random < 500,181,IfElse(Enemy, P2Dist X <= 40, 183, 182))

;====================<WIN 1>====================
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0
sprpriority = -5

[State -2, Bodied the motherfucker]
type = varadd
trigger1 = 1
var(37) =  -1* life
persistent=0
ignorehitpause = 1

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 181, 0
volumescale=255;128

;=================<WIN POSE : DASH>=================
[StateDef 182]
type = S
physics = S
anim = 110
ctrl = 0
sprpriority = -5

[State -2, Bodied the motherfucker]
type = varadd
trigger1 = 1
var(37) =  -1* life
persistent=0
ignorehitpause = 1

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 182, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 182, Type]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 182, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.45
y = -4.03

[State 182, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 182, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 182, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 188

;====================<WIN 2 : PUNCH>====================
[StateDef 183]
type = S
physics = S
anim = 182
ctrl = 0
sprpriority = -5

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 183, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 183, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 183, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 183, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 183, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 183, Win Decider]
type = ChangeState
trigger1 = Time = 112
value = 184

;====================<WIN 2 : (SERIOUS)>====================
[StateDef 184]
type = S
physics = S
anim = 183
ctrl = 0
sprpriority = -5

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 184, Win Decider]
type = ChangeState
trigger1 = Time = 4 && IfElse(Random < 500, 1, 0) 
value = 185

;====================<WIN 2 : (SMILE)>====================
[StateDef 185]
type = S
physics = S
anim = 184
ctrl = 0
sprpriority = -5

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 185, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 185, Win Decider]
type = ChangeState
trigger1 = Time = 4 && IfElse(Random < 500, 1, 0) 
value = 186

;====================<WIN 2 : (GRIN)>====================
[StateDef 186]
type = S
physics = S
anim = 185
ctrl = 0
sprpriority = -5

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 186, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

;====================<WIN 3>====================
[StateDef 187]
type = S
physics = S
anim = 186
ctrl = 0

[State -2, Bodied the motherfucker]
type = varadd
trigger1 = 1
var(37) =  -1* life
persistent=0
ignorehitpause = 1

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 6001
pos = 0,0
postype = p1
stateno = 6001
helpertype = normal
ownpal = 1
keyctrl = 1

[State 187, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 187, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 181,1
volumescale=128;255
channel = 0

[State 187, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 9
value = 820,1
channel = 1

[State 187, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 10
value = 3300,1
channel = 2

[State 187, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(11) <= 20
trigger1 = !(AnimElemTime(11) % 5)
time = 5
freq = 120
ampl = 3 -Ceil(AnimElemTime(11) * 0.31)

[State 187, Flame Pillar]
type = Helper
trigger1 = AnimElem = 10
helpertype = Normal
stateno = 10186
ID = 10186
name = "Flame Pillar"
postype = p1
pos = -7,0
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 187, Voice]
type = null;PlaySnd
trigger1 = AnimElemTime(18) = 3
value = 195,0
volumescale=128
channel = 0

;Stop Dashing Forward
[StateDef 188]
type = S
physics = S
ctrl = 1
anim = 111
velSet = 0,0

[State 188, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 188, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 188, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 188, End]
type = ChangeState
trigger1 = !AnimTime
value = 183
ctrl = 1
;=====================<HIT GROUND(BOUNCE)>===================
;Hit Ground
[Statedef 5100]
type    = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10] ;Thud sound for when char hits ground
type = PlaySnd
trigger1 = Time = 1
value = 5000,11

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;================<HIT LIEDOWN>====================
;Hit Liedown
[Statedef 5110]
type    = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6] ;Thud sound for when char hits ground
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 5000,11

[State 5110, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine
;---------------------------------------------------------------------------
; Downed get-hit (lying defeated)
[Statedef 5150]
type    = L
movetype= H
physics = N
sprpriority = -3
ctrl = 0

[State 187, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 340 && enemy,name != "Goku"
flag = RoundNotOver

[State 187, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 620 && enemy,name = "Goku"
flag = RoundNotOver

[State 5150, 1] ;Normal anim
type = ChangeAnim
triggerall = Time = 0
triggerall = SelfAnimExist(5140)
trigger1 = (anim != [5111,5119]) && (anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (anim % 10))
value = 5140

[State 5150, 3] ;Hit up type anim
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (anim = [5111,5119]) || (anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4] ;Match over anim
type = ChangeAnim
persistent = 0
;trigger1 = Time = 0
trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5] ;Switch to 5110 if liedead anim does not exist
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, 6] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, 7] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;====================<CHEESE K.O.>====================
[StateDef 5950]
type = S
moveType = H
physics = S
anim = 5950
velSet = 0,0

[State 5950, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5950, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5950, Assert: NoKOsnd]
type = AssertSpecial
trigger1 = 1
flag = NoKOsnd

[State 5950, StopSnd]
type = StopSnd
trigger1 = !Time && !Alive
channel = 0

[State 5950, KO Sound]
type = PlaySnd
trigger1 = AnimElem = 1 && !Alive;AnimElem = 2 && !Alive
value = 5950,0
volumescale=167;154;255

[State 5981, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = F7,0

[State 5981, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 10
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 5950, End]
type = ChangeState
trigger1= !AnimTime
value = ifElse(Alive, 5110, 5150)

;====================<AIR HIT TRANSITION>====================
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim = [5000,5029]
value = 5035

[State 5035, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5035, Recover]
type = ChangeState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5040

[State 5035, Fall]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050

;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[StateDef -2]

[State -2, AirGuard]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard
IgnoreHitPause = 1

;//==========================
;//==========================

[State -2, AssertSpecial]
type = null;AssertSpecial
trigger1 = 1
ignorehitpause = 1
flag = NoKOSnd

 ;--------------------
    ; KO Scream
[State -2, VarSet]
type = VarSet
trigger1 = Alive
trigger1 = Life > 0
ignorehitpause = 1
v = 55
value = -1

[State -2, Salt Levels]
type = varadd
triggerall = alive
trigger1 = var(37) < 3000
trigger1 = !ctrl && movetype = H && stateno!=[5000,5071]
trigger1 = !ctrl && movetype = H && stateno!=[150,155]
var(37) =  1*(time/6)
ignorehitpause = 1

[State -2, Salt Levels]
type = varadd
triggerall = alive
trigger1 = var(37) < 3000
var(37) =  1* gethitvar(damage)
ignorehitpause = 1

[State -2, salt levels]
type = varSet
trigger1 = Var(37) >= 3000
var(37) = 3000
ignorehitpause = 1

[State -2, Salt Levels]
type = PalFX
triggerall = var(37) >= 1000 && var(37) <2000
trigger1 = Time >= 0
trigger1 = !(gametime%80)
time = 80
sinadd = 80, 0, 0, 160
ignorehitpause = 1

[State -2, Salt Levels]
type = PalFX
triggerall = var(37) >= 2000 && var(37) <3000
trigger1 = Time >= 0
trigger1 = !(gametime%60)
time = 60
sinadd = 120, -40, -40, 160
ignorehitpause = 1

[State -2, Salt Levels]
type = PalFX
triggerall = var(37) >= 3000
trigger1 = Time >= 0
trigger1 = !(gametime%40)
time = 40
sinadd = 160, -120, -120, 160
ignorehitpause = 1

[State -2, Salt Overload]
type = changestate
triggerall = var(37) >= 3000
trigger1 = ctrl
value = 3300

[State -2, Too Chill]
type = varset
trigger1 = var(37)<0
var(37) =  0
ignorehitpause = 1

[State -2, Cool off]
type = varset
trigger1 = matchover
var(37) =  0
ignorehitpause = 1

[State -2, VarAdd]
type = VarAdd
trigger1 = Alive <= 0
trigger1 = Life <= 0
trigger1 = Var(55) <= 10
ignorehitpause = 1
v = 55
value = 1

[State -2, PlaySnd]
Type = PlaySnd
triggerall = !alive && var(55) = 0;Alive <= 0
trigger1 = stateno != 5950
value = S11,1+random%6
volumescale=128
channel = 11

[State -2, PlaySnd]
Type = PlaySnd
triggerall = !alive && var(55) = 0
Trigger1 = enemy,name = "Ryu" 
trigger1 = stateno != 5950
value = S1027,3
volumescale=128
channel = 11

[State -2, PlaySnd]
Type = PlaySnd
triggerall = !alive && var(55) = 0
Trigger1 = enemy,name = "Ken" || enemy,name = "Blaziken" || enemy,name = "Ken Masters"
trigger1 = stateno != 5950
value = S1027,2
volumescale=128;141
channel = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = time < 1060
triggerall = time >= 1
Triggerall = enemy,name = "Ken" || enemy,name = "Blaziken" || enemy,name = "Ken Masters"
triggerall = stateno = 5150 && stateno != 5950
flag = roundnotover
;flag = intro
ignorehitpause = 1
persistent = 0

[State -2, PlaySnd]
Type = PlaySnd
triggerall = !alive && var(55) = 0
Trigger1 = enemy,name = "Scorpion" || enemy,name = "Scorpion ex" 
trigger1 = stateno != 5950
value = S1030,1
volumescale=128;141
channel = 11

[State -2, PlaySnd]
Type = PlaySnd
triggerall = !alive && var(55) = 0
trigger1 = stateno != 5950
Triggerall = Enemy,Name = "Goku Black"||Enemy,Name = "Jiren"||Enemy,Name = "Broly"||Enemy,Name = "ttblack"|| Enemy,Name = "Vegeta Buu saga edit by coldskin1"|| Enemy,Name = "vegeta"|| Enemy,Name = "Flash" && enemy, authorname = "rodrigol videla"|| Enemy,Name = "Broli"|| Enemy,Name = "Son Goku"||  Enemy,Name = "SonGoku"||Enemy,Name = "SonGohan"|| Enemy,Name = "Son Gohan"||Enemy,Name = "Gohan"||Enemy,Name = "hit"||Enemy,Name = "hitto"||Enemy,Name = "Black"||Enemy,Name = "Krillin"||Enemy,Name ="Jiren by Diogo Studios Mugen"||Enemy,Name = "trunks do futuro by FRS GAMES"||Enemy,Name ="Trunks"||Enemy,Name ="Trunkz 1.5 coldskin1 edit"||enemy, authorname ="Diogo Studios Mugen e Luis 17 Mugen"||Enemy,Name ="Piccolo"||Enemy,Name ="piccolo daimao by  Franciynaldo"||Enemy,Name ="TenShinHan"||Enemy,Name ="Freeza by Jardel"|| Enemy,Name ="Vegeta by DZGTEAM & FRS GAMES"||Enemy,Name ="Frieza"||Enemy,Name ="Gogeta"|| Enemy,Name ="Vegito"||Enemy,Name ="vegetto"|| Enemy,Name ="Freiza Type-R"||enemy, authorname = "Mugenfan2005 DGZ-Team"||enemy, authorname = "FRS GAMES"||enemy, authorname = "FRS GAMES"|| Enemy,Name ="Kyabe" || Enemy,Name ="Beerus"||Enemy,Name ="Bills"||enemy, authorname = "sheld"||Enemy,Name = "Android 18"|| Enemy,Name = "Android 17" ||enemy, authorname  = "Chrono_Strife and LoneWolf, edit mephistopheles"|| enemy, authorname  = "Chrono_Strife and LoneWolf"|| enemy, authorname  = "Chrono_Strife"||  enemy, name  = "Yamcha"||enemy, authorname  = "Neocide" 
value = S1026,2
volumescale=128;141
channel = 11

[State -2]
Type = PlaySnd
Trigger1=var(58)!=Gametime && alive
trigger1 = random <= 3
channel = 11
value = S1028,0+(random%3)
volumescale=113;128

[State -2]
Type = PlaySnd
triggerall = enemynear,hitdefattr=sca,NA, SA, AA,AP,AT
trigger1 = movetype = H && gethitvar(hitcount) = 9 && Alive;random <= 3 && movetype = H && gethitvar(hitcount) >= 8 && Alive
channel = 18
value = S1027,4+(random%3)
volumescale=128

[State -2]
Type = PlaySnd
triggerall = enemynear,hitdefattr=sca,NA, SA, AA,AP,AT
trigger1 = random <= 8 && movetype = H && gethitvar(hitcount) <= 8 && movetype = H && gethitvar(hitcount) >=2 && Alive
trigger1 = enemy,name = "Scorpion" || enemy,name = "Scorpion ex" 
channel = 11
value = S1034,3
volumescale=128
   
    ;--------------------


[State -2, Finish]
type = ScreenBound
triggerall = (Life <= 0) || (!Alive) || (Lose)
trigger1 = (StateNo = 5150) && (RoundState = 4)
value = 0
MoveCamera = 0,0
IgnoreHitPause = 1

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard

[State -2, Lv3 Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = [3300,3399]
var(11) = 1
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo != 3250) || (StateNo = 3250 && AnimElemTime(53) < 0) || (StateNo = 3250 && AnimElemTime(54) >= 0 && AnimElemTime(59) < 0) || (StateNo = 3250 && AnimElemTime(60) >= 0 && AnimElemTime(65) < 0)
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (MAX Shippu Jinraikyaku, Opponent Behind)]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo = 3250 && AnimElemTime(53) >= 0 && AnimElemTime(54) < 0) || (StateNo = 3250 && AnimElemTime(59) >= 0 && AnimElemTime(60) < 0) || (StateNo = 3250 && AnimElemTime(65) >= 0)
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x >= 0, 0, ifElse(P2Dist x >= var(35), ceil(P2Dist x), var(35))), var(36)
facing = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(9) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
trigger2 = MoveContact = 1 && NumTarget(1232)
trigger2 = !(Target, HitShakeOver) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target, command = "recovery"
trigger1 = Target, pos y >= -48 && Target, vel y > 0
trigger1 = Target, Alive && Target, HitFall && Target, GetHitVar(fall.recover)
trigger1 = Target, StateNo = 5030 || Target, StateNo = 5035 || Target, StateNo = 5050 || Target, StateNo = 5071
value = 5205
ignoreHitPause = 1

[State -2, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

[State -2, Updated Hit Count : Updated];Special Thanks To 20S.
type = VarAdd
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime 
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Updated Juggle Count : Updated];Special Thanks To 20S.
type = VarAdd
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime 
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1

[State -2, Juggle Reset Single];Special Thanks To 20S.
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 0)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
;trigger3 = StateNo = 420 && AnimElemTime(4) >= 0 && MoveContact
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul : Updated];Special Thanks To 20S.
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 0)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 0)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Throws Allowed]
type = VarSet
trigger1 = EnemyNear, MoveType != H
trigger1 = EnemyNear, StateNo != 140
trigger1 = (EnemyNear, ctrl && EnemyNear, Time >= 1) || (EnemyNear, Time >= 8)
trigger2 = EnemyNear, MoveType = A
trigger3 = (EnemyNear, StateNo != [0,52]) && (EnemyNear, StateNo != [120,155]) && (EnemyNear, StateNo != [5000,5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Throws Disallowed]
type = VarSet
triggerAll = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = EnemyNear, MoveType = H && EnemyNear, StateType != A && !var(20) && !var(21) && !var(22)
trigger4 = (EnemyNear, StateNo = [5020,5040]) && EnemyNear, HitFall = 0
trigger5 = EnemyNear, StateNo = 40 && EnemyNear, PrevStateNo != 52 && (EnemyNear, Anim != [0, 29])
var(38) = 1
ignoreHitPause = 1

;=========================================================================
;Dampener
;=========================================================================
[State -2, Damage based on hits]
type=varset
triggerall= numenemy
trigger1= MoveHit = 1
trigger1=!moveguarded
trigger2=enemynear,movetype=H||enemynear,Statetype=L
fvar(12)=1
ignorehitpause=1
[State -2, Reset var when the opponent recovers]
type=varset
triggerall=numenemy
trigger1=enemynear,hitover && enemynear,hitshakeover && enemynear,ctrl=1
trigger1=enemynear,movetype!=H || enemynear,Statetype!=L || (enemynear,stateno!=[5000,5120])
trigger2= moveguarded
trigger3=(stateno=[810,860]) && movetype!=H
trigger4=enemynear,stateno=0 && enemynear,movetype!=H
fvar(12)=0
ignorehitpause=1

[State -2, Control]
type = Varset
trigger1 = (ctrl||stateno=[0,110])&&fvar(12)
fvar(9) = 1
ignoreHitPause =1
[State -2, Control]
type = Varset
trigger1 = fvar(12)=0
fvar(9) = 0
ignoreHitPause =1

[State -2, combo]
type=varset
trigger1 = (stateno = [200,4999])&& movehit 
fvar(13)=Ifelse(fvar(12)=0,0,Ifelse((stateno = [200,999]),1,Ifelse((stateno = [1000,2999]),2,3)))
ignorehitpause=1

[State -2, Dampener - Normals]
type=varset
trigger1 = (stateno = [200,599]) && fvar(12) && (fvar(13)=[0,1])
fvar(10)= 0.95 * (Ifelse(var(13)<2,1.0,(1.00-(var(13)*.05))))
ignorehitpause=1
[State -2, Dampener - Normals]
type=varset
trigger1 = (stateno = [600,999]) && fvar(12) && (fvar(13)=[0,1])
fvar(10)= 0.75 * (Ifelse(var(13)<2,1.0,(1.00-(var(13)*.05))))
ignorehitpause=1
[State -2, Dampener - Specials]
type=varset
trigger1 = (stateno = [1000,2999]) && fvar(12) && (fvar(13)=[0,2])
fvar(10)= Ifelse((prevstateno=[3000,4999]),0.6,Ifelse((prevstateno=[200,999])||fvar(10)!=1,0.85,1.0)) * (Ifelse(var(13)<12,1.0,(1.00-(var(13)*.025))))
ignorehitpause=1
[State -2, Dampener for Supers]
type = VarSet
trigger1 = (StateNo = [3000,4999])
fvar(10) = Ifelse(var(22),0.7,Ifelse(var(21), 0.85,Ifelse((prevstateno=[200,999]),.9, Ifelse(fvar(10)=1.0,1.0,fvar(10)))))* (Ifelse(var(13)<45,1.0,(1.00-(var(13)*.025))))
ignoreHitPause = 1

[State -2, Dampener - Backup reset]
type=varset
trigger1=fvar(12)=0||var(20)
fvar(11)=0
ignorehitpause=1
[State -2, Backup Dampener]
type=varset
trigger1=fvar(9) && fvar(10)=1 && fvar(12) 
fvar(11)=1
ignorehitpause=1
[State -2, Backup Dampener - supers]
type=varset
trigger1 = fvar(11)
fvar(10)=0.6 * (Ifelse(var(13)<45,1.0,(1.00-(var(13)*.025))))
ignorehitpause=1

[State -2, Dampener for Safety]
type=varset
triggerall = numenemy
trigger1=fvar(9) && fvar(12)
trigger1=(enemynear,Statetype=L||(enemynear,stateno=[5100,5120]))
fvar(10)= Ifelse(fvar(10)>=0.7,0.7,0.6) * (Ifelse(var(13)<25,1.0,(1.00-(var(13)*.025))))
ignorehitpause=1

[State -2, Dampener Reset]
type = VarSet
trigger1 = fvar(12)=0
fvar(10) = 1
ignoreHitPause = 1

[State -2, Dampener Limit]
type=varset
trigger1= fvar(10)<=0.085
fvar(10)=0.085
ignorehitpause=1

[State -2, Dampener itself]
type=attackmulset
trigger1= 1
value=fvar(10)
ignorehitpause=1

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, KO Sound Variable]
type = VarSet
triggerAll = StateNo != 5950
trigger1 = Alive && var(41) > 0
trigger2 = !Alive && var(41) < 2
var(41) = ifElse(Alive, 0, var(41) + 1)
ignoreHitPause = 1

[State -2, Reflection]
type = Helper
trigger1 = NumHelper(var(44))
trigger1 = var(46)
helpertype = Normal
name = "Static_Sphere"
ID = 3230
stateno = 3280
pos = ceil(Helper(var(44)), ScreenPos X) - 31 * Facing, ceil((Helper(var(44)), Pos Y))
postype = Left
facing = Helper(var(44)),Facing
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .25
size.yscale = .25

[State -2, VarSet]
type = VarSet
trigger1 = Var(44) < (3215)
var(44) = 3215

[State -2, Reflection]
type = VarSet
trigger1 = NumHelper(var(44))
var(45) = Helper(var(44)), AnimElemNo(0)
ignorehitpause = 1

[State -2, Reflection]
type = VarSet
trigger1 = var(45)
var(46) = 0
ignorehitpause = 1

[State -2, Cr.HP Hit Count Reset]
type = VarSet
trigger1 = StateNo != 420 && var(54)
var(54) = 0
ignorehitpause = 1

[State -2, Back Charge Increment]
type = VarAdd
trigger1 = command = "holdback"
trigger2 = AIlevel
var(47) = 1
ignorehitpause = 1

[State -2, Back Charge Reset]
type = VarSet
trigger1 = !AIlevel && command != "holdback"
trigger2 = ((stateno=20 && vel x>0)||(stateno=100 && time>=1)||(stateno=40 && sysvar(1) >= 0)) && AIlevel
trigger3 = ((stateno=105&&time=1)||(stateno=110&&time=1)) && AIlevel
trigger4 = ((Stateno=215&&time=1)||(Stateno=225&&time=1)||(stateno=255&&time=1)) && AIlevel
trigger5 = ((Stateno=1000&&time=1)||(Stateno=1050&&time=1)||(stateno=1100&&time=1)) && AIlevel
trigger6 = ((Stateno=1150&&time=1)||(stateno=1200&&time=1)||(stateno=1250&&time=1)) && AIlevel
trigger7 = ((Stateno=1300&&time=1)||(stateno=1350&&time=1)) && AIlevel
trigger8 = ((Stateno=3050&&time=1)||(Stateno=3150&&time=1)||(stateno=3250&&time=1)||(stateno=3300&&time=1)) && AIlevel
trigger9 = roundstate=3
var(47) = 0
ignorehitpause = 1

[State -2, Back Charge Buffer Activation]
type = VarSet
trigger1 = var(47) >= 35
var(49) = 32
ignorehitpause = 1

[State -2, Back Charge Buffer Decrement]
type = VarAdd
trigger1 = var(47) < 35 && var(49) > 0
var(49) = -1
ignorehitpause = 1

[State -2, Down Charge Increment]
type = VarAdd
trigger1 = command = "holddown"
trigger2 = AIlevel
var(50) = 1
ignorehitpause = 1

[State -2, Down Charge Reset]
type = VarSet
trigger1 = !AIlevel && command != "holddown"
trigger2 = ((stateno=20 && time>=1)||(stateno=100 && time>=1)||(stateno=40 && time= 1)) && AIlevel
trigger3 = ((stateno=105&&time=1)||(stateno=110&&time=1)) && AIlevel
trigger4 = (Stateno=[200,255]) && time=1 && AIlevel
trigger5 = ((Stateno=1000&&time=1)||(Stateno=1050&&time=1)||(stateno=1100&&time=1)) && AIlevel
trigger6 = ((Stateno=1150&&time=1)||(stateno=1200&&time=1)||(stateno=1250&&time=1)) && AIlevel
trigger7 = ((Stateno=1300&&time=1)||(stateno=1350&&time=1)) && AIlevel
trigger8 = ((Stateno=3050&&time=1)||(Stateno=3150&&time=1)||(stateno=3250&&time=1)||(stateno=3300&&time=1)) && AIlevel
trigger9 = roundstate=3
var(50) = 0
ignorehitpause = 1

[State -2, Down Charge Buffer Activation]
type = VarSet
trigger1 = var(50) >= 35
var(57) = 32
ignorehitpause = 1

[State -2, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(50) < 35 && var(57) > 0
var(57) = -1
ignorehitpause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Damp = %d Limit = %d Hits = %d Juggle = %d salt %d"
params = AILevel, fvar(10), fvar(8), var(13), var(15), var(37)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Froz"
ignoreHitPause = 1

;Light
[State -2]
type = Helper
triggerall = !NumHelper(23680) 
trigger1 = StageVar(info.author) = "light"
pos = 0,0
stateno = 23680
id = 23680
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = p1

[State -2]
type = Helper
triggerall = !NumHelper(23681) 
trigger1 = StageVar(info.author) = "light"
pos = 134,0
stateno = 23681
id = 23681
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = left

[State -2]
type = Helper
triggerall = !NumHelper(23682)
trigger1 = StageVar(info.author) = "light"
pos = -134,0
stateno = 23682
id = 23682
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = right
;--------------------------------------------------------------
;1aD§3oE?I»OA
;--------------------------------------------------------------
[Statedef 23680]
type    = S
movetype= H
physics = N
velset = 0,0
sprpriority = -10

[State 3680, 4]
type = changeanim
trigger1 = time%2 = 0
value = 9741

[State 3680, 4]
type = ChangeAnim
triggerall = time%2 = 1
trigger1 = ((root,anim = [0,9741]) && root,movetype != H) 
trigger2 = (root,anim = [5000,9999])
value = root,anim
elem = root,animelemno(0)
ignorehitpause = 1
persistent = 1

[State 3680, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 224,88,0
sinadd = 48,50,32,16
;add = 248,232,192

[State 3680,0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3680, 4]
type=BindToParent
trigger1 = 1
time = -1
facing = 1
pos = (1+ifelse(Parent,fvar(36) = 1,-1,0)+ifelse(Parent,fvar(36) = 2,-2,0))*ifelse(Facing = -1,-1,1),0
;--------------------------------------------------------------
;1aD§×o
;--------------------------------------------------------------
[Statedef 23681]
type    = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0 && RootDist X < 52
fvar(36) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0
fvar(36) = 0

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA
;--------------------------------------------------------------
;1aD§OO
;--------------------------------------------------------------
[Statedef 23682]
type    = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0 && RootDist X > 52
fvar(36) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0
fvar(36) = 2

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA
;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[StateDef -3]

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3, ProjContact Reset]
type = VarSet
triggerAll = var(18)
trigger1 = (StateNo != [1000,1050]) && (StateNo != [3000,3050]) && (StateNo != [3200,3250])
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = 1
var(39) = 0
ignoreHitPause = 1

[State -3, Projectile Flag On]
type = VarSet
triggerAll = var(20) <= 0
triggerAll = NumHelper(1005)
trigger1 = Helper(1005), StateNo = 1005
trigger2 = Helper(1005), StateNo = 1055
var(39) = 1
ignoreHitPause = 1

[State -3, Special Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Special Cancel Check]
type = VarSet
trigger1 = (StateNo = [200,699]) && Time <= 2
trigger2 = StateNo = 200 && Animelemtime(5)>=0 && MoveContact
trigger3 = StateNo = 210 && Animelemtime(5)>=0 && MoveContact
trigger4 = StateNo = 215 && Animelemtime(7)>=0 && MoveContact
trigger5 = StateNo = 220 && Animelemtime(12)>=0 && MoveContact
trigger6 = StateNo = 225 && Animelemtime(10)>=0 && MoveContact
trigger7 = StateNo = 230 && Animelemtime(6)>=0 && MoveContact
trigger8 = StateNo = 240 && Animelemtime(8)>=0 && MoveContact
trigger9 = StateNo = 250 && Animelemtime(17)>=0 && MoveContact
trigger10 = StateNo = 255 && Animelemtime(11)>=0 && MoveContact
trigger11 = StateNo = 400 && Animelemtime(6)>=0 && MoveContact
trigger12 = StateNo = 410 && Animelemtime(6)>=0 && MoveContact
trigger13 = StateNo = 420 && Animelemtime(5)>=0 && MoveContact
trigger14 = StateNo = 430 && Animelemtime(6)>=0 && MoveContact
trigger15 = StateNo = 440 && Animelemtime(6)>=0 && MoveContact
trigger16 = StateNo = 1100 && AnimElemTime(8)>=0
trigger17 = StateNo = 1150 && AnimelemTime(14)>=0
trigger18 = StateNo = 1305 && AnimElemTime(1)>=0
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200 && Animelemtime(5)>=0 && MoveContact
trigger5 = StateNo = 210 && Animelemtime(5)>=0 && MoveContact
trigger6 = StateNo = 215 && Animelemtime(7)>=0 && MoveContact
trigger7 = StateNo = 220 && Animelemtime(12)>=0 && MoveContact
trigger8 = StateNo = 225 && Animelemtime(10)>=0 && MoveContact
trigger9 = StateNo = 230 && Animelemtime(6)>=0 && MoveContact
trigger10 = StateNo = 240 && Animelemtime(8)>=0 && MoveContact
trigger11 = StateNo = 250 && Animelemtime(17)>=0 && MoveContact
trigger12 = StateNo = 255 && Animelemtime(10)>=0 && MoveContact
trigger13 = StateNo = 400 && Animelemtime(6)>=0 && MoveContact
trigger14 = StateNo = 410 && Animelemtime(6)>=0 && MoveContact
trigger15 = StateNo = 420 && Animelemtime(5)>=0 && MoveContact
trigger16 = StateNo = 430 && Animelemtime(6)>=0 && MoveContact
trigger17 = StateNo = 440 && Animelemtime(6)>=0 && MoveContact
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3100 && AnimElemTime(16) >= 0 && AnimElemTime(28) < 0 && MoveContact
var(8) = 1
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Parry Detection]
type = Helper
triggerAll = RoundState = 2 && !NumHelper(765) && !var(20)
triggerAll = (MoveType = I && ctrl) || (StateNo = [760, 762]) || StateNo = 5120
triggerAll = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AILevel
trigger1 = !AILevel && (StateType = S || StateType = C || StateNo = 5120) && (command = "fwd" || command = "down")
trigger2 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AILevel && (StateNo != [760,762]) && InGuardDist && Random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = AILevel && (StateNo = [760,762]) && Time = 14 && Random < (75 * (AIlevel ** 2 / 64.0))
trigger5 = AILevel && (EnemyNear,NumProj || EnemyNear,NumHelper) && Random < (75 * (AIlevel ** 2 / 64.0))
helperType = Normal
stateNo = 765
ID = 765
name = "Parry Detection"
posType = P1
pauseMoveTime = 65535
superMoveTime = 65535

[State -3, Parry Attacks]
type = ChangeState
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = Helper(765), StateNo = 766
value = ifElse((Helper(765), Anim = 767), 762, ifElse((Helper(765), Anim = 766), 761, 760))
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 765)
attr = SA, AP
stateNo = 760
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 766)
attr = C, AP
stateNo = 761
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 767)
attr = SCA, AP
stateNo = 762
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Assert: NoWalk after Parry]
type = AssertSpecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26)-1)
flag = NoWalk
ignoreHitPause = 1

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = NumTarget
trigger1 = Target, HitOver || (Target, GetHitVar(HitShakeTime) > 0 && Target, Time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yvel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1

[State -3, Movement AfterImage]
type = AfterImage
triggerAll = Time = 1 && !var(20)
trigger1 = StateNo = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (StateNo = [700,715])
trigger3 = StateNo = 5983
time = 2
timeGap = 1
frameGap = 4
length = 9
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.9,0.9,0.9
trans = Add1

[State -3, Level 1 Super AfterImage]
type = AfterImage
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200) && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 2 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3050 && Time = 43
trigger2 = StateNo = 3150 && Time = 43
trigger3 = StateNo = 3250 && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 3 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3300 && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State -3, AfterImage Persist]
type = AfterImageTime
trigger1 = StateNo = 50 || (StateNo = [600,699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = StateNo = [700,715]
trigger4 = (StateNo = [3000,4999])
trigger5 = StateNo = 5983 && AnimElemTime(3) < 0
time = 2

[State -3, Underground Juggle Prevention]
type = TargetBind
trigger1 = MoveContact = 1
trigger1 = NumTarget && NumEnemy
trigger1 = (Target, Time = 0) && (Target, ID = EnemyNear, ID)
trigger1 = !(Target, HitShakeOver) && (Target, pos y > 0)
pos = ceil(P2Dist x), ceil(-pos y)
ignoreHitPause = 1

[State -3, Prevent Crossup]
type = Width
trigger1 = MoveType != H
edge = 8, 0
ignoreHitPause = 1

[State -3, Variable Height]
type = PlayerPush
triggerAll = StateType = A && MoveType != H && NumEnemy
triggerAll = P2BodyDist x = [-(EnemyNear, const(size.ground.back) + EnemyNear, const(size.ground.front)), 0]
trigger1 = P2StateType = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
Triggerall = Enemy,Name != "Goku Black"||Enemy,Name != "Jiren"||Enemy,Name != "Broly"||Enemy,Name != "ttblack"|| Enemy,Name != "Vegeta Buu saga edit by coldskin1"|| Enemy,Name != "vegeta"|| Enemy,Name != "Flash" && enemy, authorname != "rodrigol videla"|| Enemy,Name != "Broli"|| Enemy,Name != "Son Goku"||  Enemy,Name != "SonGoku"||Enemy,Name != "SonGohan"|| Enemy,Name != "Son Gohan"||Enemy,Name != "Gohan"||Enemy,Name != "hit"||Enemy,Name != "hitto"||Enemy,Name != "Black"||Enemy,Name != "Krillin"||Enemy,Name !="Jiren by Diogo Studios Mugen"||Enemy,Name != "trunks do futuro by FRS GAMES"||Enemy,Name !="Trunks"||Enemy,Name !="Trunkz 1.5 coldskin1 edit"||enemy, authorname !="Diogo Studios Mugen e Luis 17 Mugen"||Enemy,Name !="Piccolo"||Enemy,Name !="piccolo daimao by  Franciynaldo"||Enemy,Name !="TenShinHan"||Enemy,Name !="Freeza by Jardel"|| Enemy,Name !="Vegeta by DZGTEAM & FRS GAMES"||Enemy,Name !="Frieza"||Enemy,Name !="Gogeta"|| Enemy,Name !="Vegito"||Enemy,Name !="vegetto"|| Enemy,Name !="Freiza Type-R"||enemy, authorname != "Mugenfan2005 DGZ-Team"||enemy, authorname != "FRS GAMES"||enemy, authorname != "FRS GAMES"|| Enemy,Name !="Kyabe" || Enemy,Name !="Beerus"||Enemy,Name !="Bills"||enemy, authorname != "sheld"||Enemy,Name != "Android 18"|| Enemy,Name != "Android 17" ||enemy, authorname  != "Chrono_Strife and LoneWolf, edit mephistopheles"|| enemy, authorname  != "Chrono_Strife and LoneWolf"|| enemy, authorname  != "Chrono_Strife"||enemy,name != "Scorpion"||  enemy, name  != "Yamcha"|| enemy, authorname  != "Neocide"|| enemy,name != "Scorpion"
triggerall = movetype = H && gethitvar(hitcount) < 8 && Alive
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < 250;(250 * (AILevel ** 2 / 64.0))
value = 5000,(Random % 6)
volumescale=128
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
Triggerall =  enemy,name = "Scorpion"
triggerall = movetype = H && gethitvar(hitcount) < 2 && Alive
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < 250;(250 * (AILevel ** 2 / 64.0))
value = 5000,(Random % 6)
volumescale=128
channel = 0
ignoreHitPause = 1


[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
Triggerall = Enemy,Name = "Goku Black"||Enemy,Name = "Jiren"||Enemy,Name = "Broly"||Enemy,Name = "ttblack"|| Enemy,Name = "Vegeta Buu saga edit by coldskin1"|| Enemy,Name = "vegeta"|| Enemy,Name = "Flash" && enemy, authorname = "rodrigol videla"|| Enemy,Name = "Broli"|| Enemy,Name = "Son Goku"||  Enemy,Name = "SonGoku"||Enemy,Name = "SonGohan"|| Enemy,Name = "Son Gohan"||Enemy,Name = "Gohan"||Enemy,Name = "hit"||Enemy,Name = "hitto"||Enemy,Name = "Black"||Enemy,Name = "Krillin"||Enemy,Name ="Jiren by Diogo Studios Mugen"||Enemy,Name = "trunks do futuro by FRS GAMES"||Enemy,Name ="Trunks"||Enemy,Name ="Trunkz 1.5 coldskin1 edit"||enemy, authorname ="Diogo Studios Mugen e Luis 17 Mugen"||Enemy,Name ="Piccolo"||Enemy,Name ="piccolo daimao by  Franciynaldo"||Enemy,Name ="TenShinHan"||Enemy,Name ="Freeza by Jardel"|| Enemy,Name ="Vegeta by DZGTEAM & FRS GAMES"||Enemy,Name ="Frieza"||Enemy,Name ="Gogeta"|| Enemy,Name ="Vegito"||Enemy,Name ="vegetto"|| Enemy,Name ="Freiza Type-R"||enemy, authorname = "Mugenfan2005 DGZ-Team"||enemy, authorname = "FRS GAMES"||enemy, authorname = "FRS GAMES"|| Enemy,Name ="Kyabe" || Enemy,Name ="Beerus"||Enemy,Name ="Bills"||enemy, authorname = "sheld"||Enemy,Name = "Android 18"|| Enemy,Name = "Android 17" ||enemy, authorname  = "Chrono_Strife and LoneWolf, edit mephistopheles"|| enemy, authorname  = "Chrono_Strife and LoneWolf"|| enemy, authorname  = "Chrono_Strife"||  enemy, name  = "Yamcha"||enemy, authorname  = "Neocide" 
triggerall = movetype = H && gethitvar(hitcount) < 2 && Alive
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < 250
value = 5000,(Random % 6)
volumescale=128
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
Triggerall = enemy,name = "Scorpion"
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
triggerall = random <= 250
triggerall = movetype = H && gethitvar(hitcount) < 8 && Alive
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 1034,3
volumescale=128
channel = 11
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
Triggerall = Enemy,Name = "Goku Black"||Enemy,Name = "Jiren"||Enemy,Name = "Broly"||Enemy,Name = "ttblack"|| Enemy,Name = "Vegeta Buu saga edit by coldskin1"|| Enemy,Name = "vegeta"|| Enemy,Name = "Flash" && enemy, authorname = "rodrigol videla"|| Enemy,Name = "Broli"|| Enemy,Name = "Son Goku"||  Enemy,Name = "SonGoku"||Enemy,Name = "SonGohan"|| Enemy,Name = "Son Gohan"||Enemy,Name = "Gohan"||Enemy,Name = "hit"||Enemy,Name = "hitto"||Enemy,Name = "Black"||Enemy,Name = "Krillin"||Enemy,Name ="Jiren by Diogo Studios Mugen"||Enemy,Name = "trunks do futuro by FRS GAMES"||Enemy,Name ="Trunks"||Enemy,Name ="Trunkz 1.5 coldskin1 edit"||enemy, authorname ="Diogo Studios Mugen e Luis 17 Mugen"||Enemy,Name ="Piccolo"||Enemy,Name ="piccolo daimao by  Franciynaldo"||Enemy,Name ="TenShinHan"||Enemy,Name ="Freeza by Jardel"|| Enemy,Name ="Vegeta by DZGTEAM & FRS GAMES"||Enemy,Name ="Frieza"||Enemy,Name ="Gogeta"|| Enemy,Name ="Vegito"||Enemy,Name ="vegetto"|| Enemy,Name ="Freiza Type-R"||enemy, authorname = "Mugenfan2005 DGZ-Team"||enemy, authorname = "FRS GAMES"||enemy, authorname = "FRS GAMES"|| Enemy,Name ="Kyabe" || Enemy,Name ="Beerus"||Enemy,Name ="Bills"||enemy, authorname = "sheld"||Enemy,Name = "Android 18"|| Enemy,Name = "Android 17" ||enemy, authorname  = "Chrono_Strife and LoneWolf, edit mephistopheles"|| enemy, authorname  = "Chrono_Strife and LoneWolf"|| enemy, authorname  = "Chrono_Strife"||  enemy, name  = "Yamcha"||enemy, authorname  = "Neocide" 
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
triggerall = random <= 100
triggerall = movetype = H && gethitvar(hitcount) < 8 && Alive
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 1040,0
volumescale=128
channel = 11
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
Triggerall = Enemy,Name != "Goku Black"||Enemy,Name != "Jiren"||Enemy,Name != "Broly"||Enemy,Name != "ttblack"|| Enemy,Name != "Vegeta Buu saga edit by coldskin1"|| Enemy,Name != "vegeta"|| Enemy,Name != "Flash" && enemy, authorname != "rodrigol videla"|| Enemy,Name != "Broli"|| Enemy,Name != "Son Goku"||  Enemy,Name != "SonGoku"||Enemy,Name != "SonGohan"|| Enemy,Name != "Son Gohan"||Enemy,Name != "Gohan"||Enemy,Name != "hit"||Enemy,Name != "hitto"||Enemy,Name != "Black"||Enemy,Name != "Krillin"||Enemy,Name !="Jiren by Diogo Studios Mugen"||Enemy,Name != "trunks do futuro by FRS GAMES"||Enemy,Name !="Trunks"||Enemy,Name !="Trunkz 1.5 coldskin1 edit"||enemy, authorname !="Diogo Studios Mugen e Luis 17 Mugen"||Enemy,Name !="Piccolo"||Enemy,Name !="piccolo daimao by  Franciynaldo"||Enemy,Name !="TenShinHan"||Enemy,Name !="Freeza by Jardel"|| Enemy,Name !="Vegeta by DZGTEAM & FRS GAMES"||Enemy,Name !="Frieza"||Enemy,Name !="Gogeta"|| Enemy,Name !="Vegito"||Enemy,Name !="vegetto"|| Enemy,Name !="Freiza Type-R"||enemy, authorname != "Mugenfan2005 DGZ-Team"||enemy, authorname != "FRS GAMES"||enemy, authorname != "FRS GAMES"|| Enemy,Name !="Kyabe" || Enemy,Name !="Beerus"||Enemy,Name !="Bills"||enemy, authorname != "sheld"||Enemy,Name != "Android 18"|| Enemy,Name != "Android 17" ||enemy, authorname  != "Chrono_Strife and LoneWolf, edit mephistopheles"|| enemy, authorname  != "Chrono_Strife and LoneWolf"|| enemy, authorname  != "Chrono_Strife"||enemy,name != "Scorpion"||  enemy, name  != "Yamcha"|| enemy, authorname  != "Neocide"|| enemy,name = "Scorpion"
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 5000,(Random % 3)
volumescale=128
channel = 0
ignoreHitPause = 1
[State -3, Cheese KO]
type = ChangeState
trigger1 = !Alive && (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo = [150,153])
trigger2 = !Alive && Prevstateno=3300
value = 5950
ignoreHitPause = 1

[State -3, Assert: NoKOsnd (Cheese KO)]
type = AssertSpecial
trigger1 = (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo=[150,153])
flag = NoKOsnd
ignoreHitPause = 1

[State -3, Super Finish]
type = Helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := StateNo
trigger2 = NumHelper(3005) || NumHelper(3055)
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3150])
trigger3 = var(23) := 3100
trigger4 = NumHelper(var(44))
trigger4 = var(23) := 3200
trigger5 = StateNo = 3300
trigger5 = var(23) := 3300
helperType = Normal
stateNo = 8600
ID = 8600
name = "Super Finish"
posType = Left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

