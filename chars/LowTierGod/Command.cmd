;==============================================================================================
;=======================================<COMMAND FILE>=========================================
;==============================================================================================

;====================<BUTTON REMAPPING>====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;====================<DEFAULT VALUES>====================

[Defaults]
command.time = 15
command.buffer.time = 1

;====================<SINGLE BUTTON>====================

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1

;====================<HOLD BUTTON>====================

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;====================<DIRECTION>====================

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "down"
command = D
time = 1

;====================<RELEASE DIR>====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1

;====================<RELEASE BUTTON>====================

[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1

;====================<SUPER MOTIONS>====================

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, c
time = 30

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, ~a
time = 30

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, ~b
time = 30

[Command]
name = "TyrantSlaughter"
command = ~D, DF, F, D, DF, F, ~c
time = 30


[Command]
name = "MAXTyrantSlaughter"
command = ~D, DF, F, D, DF, F, a+b
time = 24

[Command]
name = "MAXTyrantSlaughter"
command = ~D, DF, F, D, DF, F, b+c
time = 24

[Command]
name = "MAXTyrantSlaughter"
command = ~D, DF, F, D, DF, F, a+c
time = 24


[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "TemporalThunder"
command = ~D, DF, F, D, DF, F, ~z
time = 32


[Command]
name = "MAXTemporalThunder"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MAXTemporalThunder"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MAXTemporalThunder"
command = ~D, DF, F, D, DF, F, x+z
time = 32


[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, x
time = 32

[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, y
time = 32

[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, z
time = 32

[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, ~x
time = 32

[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, ~y
time = 32

[Command]
name = "AegisReflector"
command = ~D, DB, B, D, DB, B, ~z
time = 32


[Command]
name = "MAXAegisReflector"
command = ~D, DB, B, D, DB, B, x+y
time = 32

[Command]
name = "MAXAegisReflector"
command = ~D, DB, B, D, DB, B, y+z
time = 32

[Command]
name = "MAXAegisReflector"
command = ~D, DB, B, D, DB, B, x+z
time = 32


[Command]
name = "VesuvianBurnout"
command = ~D, DB, B, D, DB, B, s
time = 24

[Command]
name = "VesuvianBurnout"
command = ~D, DB, B, D, DB, B, s
time = 24

[Command]
name = "VesuvianBurnout"
command = ~D, DB, B, D, DB, B, s
time = 24

;====================<SPECIAL MOTIONS>====================

[Command]
name = "MetallicSphere"
command = ~D, DF, F, x
time = 12

[Command]
name = "MetallicSphere"
command = ~D, DF, F, y
time = 12

[Command]
name = "MetallicSphere"
command = ~D, DF, F, z
time = 12

[Command]
name = "MetallicSphere"
command = ~D, DF, F, ~x
time = 12

[Command]
name = "MetallicSphere"
command = ~D, DF, F, ~y
time = 12

[Command]
name = "MetallicSphere"
command = ~D, DF, F, ~z
time = 12


[Command]
name = "ChariotTackle"
command = ~$B, F, a
time = 10

[Command]
name = "ChariotTackle"
command = ~$B, F, b
time = 10

[Command]
name = "ChariotTackle"
command = ~$B, F, c
time = 10

[Command]
name = "ChariotTackle"
command = ~$B, F, ~a
time = 10

[Command]
name = "ChariotTackle"
command = ~$B, F, ~b
time = 10

[Command]
name = "ChariotTackle"
command = ~$B, F, ~c
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, a
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, b
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, c
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, ~a
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, ~b
time = 10

[Command]
name = "ViolenceKneeDrop"
command = ~$D, $U, ~c
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, x
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, y
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, z
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, ~x
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, ~y
time = 10

[Command]
name = "DangerousHeadbutt"
command = ~$D, $U, ~z
time = 10

[Command]
name = "412p" ;Zero Counter
command = /$B,x+y;~B, DB, D, x
time = 4;12
[Command]
name = "412p" ;Zero Counter
command = /$B,y+z;~B, DB, D, y
time = 4;12
[Command]
name = "412p" ;Zero Counter
command = /$B,x+z;~B, DB, D, z
time = 4;12
[Command]
name = "412k" ;Zero Counter
command = /$B,a+b;~B, DB, D, a
time = 4;12
[Command]
name = "412k" ;Zero Counter
command = /$B,b+c;~B, DB, D, b
time = 4;12
[Command]
name=  "412k" ;Zero Counter
command = /$B,a+c;~B, DB, D, c
time = 4;12

;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 10

;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

;====================<2/3 BUTTON COMBINATION>====================

[Command]
name = "recovery"
command = x+y
time = 1
[Command]
name = "recovery"
command = x+z
time = 1
[Command]
name = "recovery"
command = y+z
time = 1
[Command]
name = "recovery"
command = a+b
time=1
[Command]
name = "recovery"
command = b+c
time=1
[Command]
name = "recovery"
command = a+c
time=1


[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1


[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1


[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1

;==============================================================================================
;========================================<-1 STATES>===========================================
;==============================================================================================
[StateDef -1]

[State -1, Tick Fix]
type = CtrlSet
triggerAll = !ctrl
trigger1 = (StateNo = 52 || Stateno = 101 || stateno = 111 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = StateNo = 820 && !AnimTime
trigger5 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, Salt Overload]
type = null;ChangeState
value = 3300
triggerAll = !AILevel
triggerAll = command = "VesuvianBurnout"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111
trigger2 = var(7)

[State -1, Modder's Block]
type = ChangeState
value = 3250
triggerAll = !AILevel
triggerAll = command = "MAXAegisReflector"
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=1000 && var(37)<3000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106
trigger2 = var(7)
trigger3 = StateNo = 1003 && AnimElemTime(5) >= 0
trigger4 = StateNo = 1100 && MoveContact && AnimElemTime(3) >= 0

[State -1, Roid Rage]
type =ChangeState
value = 3150
triggerAll = !AILevel
triggerAll = command = "MAXTyrantSlaughter"
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=2000 && var(37)<3000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111
trigger2 = var(7)

[State -1, Ban Hammer]
type = ChangeState
value = 3050
triggerAll = !AILevel
triggerAll = command = "MAXTemporalThunder"
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=1000 && var(37)<3000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111
trigger2 = var(7)

[State -1, EX Violence Knee Drop]
type = ChangeState
value = 1350
triggerAll = !AILevel
triggerAll = command = "ViolenceKneeDrop" & var(57) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)

[State -1, Laggin Ass Knee Drop]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "ViolenceKneeDrop" & var(57) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)

[State -1, EX Dangerous Headbutt]
type = ChangeState
value = 1250
triggerAll = !AILevel
triggerAll = command = "DangerousHeadbutt" & var(57) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)

[State -1, Eraserhead Smash]
type = ChangeState
value = 1200
triggerAll = !AILevel
triggerAll = command = "DangerousHeadbutt" & var(57) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)

[State -1, EX Chariot Tackle]
type = ChangeState
value = 1150
triggerAll = !AILevel
triggerAll = command = "ChariotTackle" & var(49) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106
trigger2 = var(6)

[State -1, Triggered Tackle]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "ChariotTackle" & var(49) > 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106
trigger2 = var(6)

[State -1, EX Metallic Sphere]
type = ChangeState
value = 1050
triggerAll = !AILevel
triggerAll = command = "MetallicSphere"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106
trigger2 = var(6)
trigger3 = Stateno = 1205 && Animelemtime(1)>=0

[State -1, Desperate Fireball]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "MetallicSphere"
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = power < 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106
trigger2 = var(6)
trigger3 = Stateno = 1205 && Animelemtime(1)>=0

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel && P2BodyDist X <=20
triggerall = p2statetype != A && p2statetype != L && P2MoveType != H
trigger1 = (command = "z" || command = "c") && (command = "holdfwd" || command = "holdback")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit

[State -1, Standing Medium Punch]
type = ChangeState
value = 210 + (command = "holdfwd") * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 + (command = "holdfwd") * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=210||stateno=215||Stateno=240)&& var(6) && Movehit

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit

[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 + (command = "holdfwd") * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit


[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=410||stateno=440)&& var(6) && Movehit

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101 || stateno = 111
trigger2 = (stateno=410||stateno=440)&& var(6) && Movehit

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = !AILevel
triggerAll = command = "start"
triggerAll = StateType != A
triggerAll = StateNo != [200,699]
trigger1 = ctrl || Stateno = 101 || stateno = 111

[State -1, Dash Forward/Run]
type = ChangeState
value = 100+(var(24)*10)
triggerAll = !AILevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && StateType = S
trigger1 = ctrl

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = !AILevel
trigger1 = command = "BB"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

;==============================================================================================
;===========================================< A.I >==============================================
;==============================================================================================

[State -1, Fall Recovery (Air)]
type = null;ChangeState
value = 5210
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = null;ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0));(100 * (AILevel ** 2 / 64.0))

[State -1, Metallic Sphere]
type = ChangeState
value = 1050
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1)
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106)
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 2 / 64.0))
trigger3 = NumHelper(var(44)) && Random < (300 * (AILevel ** 2 / 64.0)) && !StateNo = 1000
trigger4 = Stateno = 1205 && Animelemtime(1)>=0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Chariot Tackle]
type = ChangeState
value = 1150
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
triggerall = var(49) > 0
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,115]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (37 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && Random < (400 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = P2Dist x <= -146 && P2Dist Y >= -20
trigger4 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Dangerous HeadButt]
type = ChangeState
value = 1250
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
triggerall = var(50) > 0
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52) && Random < (150 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && Random < (400 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = P2Dist x <= -80 && P2Dist Y >= -70
trigger4 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Violence Knee Drop]
type = ChangeState
value = 1350
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000
triggerall = var(50) > 0
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52) && Random < (150 * (AILevel ** 2 / 64.0))
trigger2 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Jump]
type = ChangeState
value = 40
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A && ctrl
trigger1 = EnemyNear, MoveType = A && P2BodyDist x < 160 && EnemyNear, HitDefAttr = SC, AT

[State -1, Run]
type = ChangeState
value = 100+(var(24)*10)
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 2 / 64.0))

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155])
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Guard]
type = ChangeState
value = 120
triggerall= AILevel && numenemy&& (StateNo!=[120,155]) && !(enemynear,ctrl) && random < (300 * (AIlevel ** 2 / 64.0));(450 * (AIlevel ** 2 / 64.0))
triggerall= Ctrl||stateno = 21
triggerall=enemynear,Movetype=A && !(enemynear,hitdefattr=SCA,AT) 
triggerall = statetype != A
trigger1 = inguarddist

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-10,20]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (325 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-75,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit && Random < (225 * (AILevel ** 2 / 64.0))

[State -1, Quarrel Punch/Standing Normal Medium Punch]
type = ChangeState
value = ifElse(Random < 50, 215, 210)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-80,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit && Random < (113 * (AILevel ** 2 / 64.0))

[State -1, Standing Normal Hard Punch]
type = ChangeState
value = 220
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-100,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=210||stateno=215||Stateno=240)&& var(6) && Movehit && Random < (115 * (AILevel ** 2 / 64.0))

[State -1, Terrible Smash]
type = ChangeState
value = 225
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-100,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=210||stateno=215||Stateno=240)&& var(6) && Movehit && Random < (115 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-17,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit && Random < (225 * (AILevel ** 2 / 64.0))

[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-80,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=230)&& var(6) && Movehit && Random < (113 * (AILevel ** 2 / 64.0))

[State -1, Standing Hard Kick]
type = ChangeState
value = 250 + (Abs(P2BodyDist X) <= 25) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-120,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-30,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit && Random < (200 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Crouching Hard Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-90,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (200 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=410||stateno=440)&& var(6) && Movehit && Random < (115 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,48]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit && Random < (200 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,68]) && (P2Dist y = [-12,10]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=400||stateno=430)&& var(6) && Movehit && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-20,60]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || Stateno = 101 || stateno = 111) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (stateno=410||stateno=440)&& var(6) && Movehit && Random < (115 * (AILevel ** 2 / 64.0))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,23]) && (P2Dist y = [-28,13]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,48]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,20]) && (P2Dist y = [-25,55]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,28]) && (P2Dist y = [-25,25]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-22,40]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Desperate Fireball]
type = ChangeState
value = 1000
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1)
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106)
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 2 / 64.0))
trigger3 = NumHelper(var(44)) && Random < (300 * (AILevel ** 2 / 64.0)) && !StateNo = 1000
trigger4 = Stateno = 1205 && Animelemtime(1)>=0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Triggered Tackle]
type = ChangeState
value = 1100
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
triggerall = var(49) > 0
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,115]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (37 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && Random < (400 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = P2Dist x <= -146 && P2Dist Y >= -20
trigger4 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Eraserhead Smash]
type = ChangeState
value = 1200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
triggerall = var(50) > 0
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52) && Random < (150 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && Random < (400 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = P2Dist x <= -70 && P2Dist Y >= -60
trigger4 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Laggin Ass Knee Drop]
type = ChangeState
value = 1300
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = power < 1000
triggerall = var(50) > 0
triggerAll = !var(16) && (var(15) < 1)
triggerAll = (P2BodyDist x = [0,70]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52) && Random < (150 * (AILevel ** 2 / 64.0))
trigger2 = StateNo = 1305 && AnimElemTime(1)>= 0 && Random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Ban Hammer]
type = ChangeState
value = 3050
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=1000 && var(37)<3000
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111) && Random < (165 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111)
trigger2 = EnemyNear, StateNo = 195 && Random < (200 * (AILevel ** 2 / 64.0))
trigger3 = var(7) && Movecontact && Random < (330 * (AILevel ** 2 / 64.0))

[State -1, Roid Rage]
type = ChangeState
value = 3150
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=2000 && var(37)<3000
triggerAll = (P2BodyDist x = [0,115]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || stateno = 111) && Random < (200 * (AILevel ** 2 / 64.0))
trigger2 = P2Dist x <= -146 && P2Dist Y >= -20
trigger3 = StateNo = 420 && AnimElem= 5 && Movehit && Random < (300 * (AIlevel ** 2 / 64.0))
trigger4 = var(7) && Movecontact && Random < (600 * (AILevel ** 2 / 64.0))

[State -1, Modder's Block]
type = ChangeState
value = 3250
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = var(37) >=1000 && var(37)<3000
triggerAll = !NumHelper(var(44))
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (180 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 106) && Random < (200 * (AILevel ** 2 / 64.0))
trigger2 = P2StateType = A
trigger3 = var(7) && Movecontact && Random < (360 * (AILevel ** 2 / 64.0))

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2
triggerAll = StateType != A && Life >= 0.5 * LifeMax
triggerAll = (EnemyNear, Life) <= 0.5 * (EnemyNear, LifeMax)
triggerAll = ctrl
trigger1 = P2Dist x >= 160 && !(EnemyNear, ctrl)
trigger1 = (EnemyNear, MoveType = H) && (EnemyNear, HitFall) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = P2Dist x >= 0 && P2Dist x <= 50 && !(EnemyNear, ctrl)
trigger2 = (EnemyNear, MoveType = H) && (EnemyNear, HitFall) && Random < (50 * (AILevel ** 2 / 64.0))