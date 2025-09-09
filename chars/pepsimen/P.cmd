[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s
[Defaults]
command.time = 15
command.buffer.time = 1

[Command]
name = "623a"
command = ~F, D, DF, a
[Command]
name = "623b"
command = ~F, D, DF, b

[Command]
name = "623a+b"
command = ~F, D, DF, a+b

[Command]
name = "26a"
command = ~D, F, a

[Command]
name = "26b"
command = ~D, F, b

[Command]
name = "26a+b"
command = ~D, F, a+b

[Command]
name = "26x"
command = ~D, F, x

[Command]
name = "24a"
command = ~D, B, a

[Command]
name = "24b"
command = ~D, B, b

[Command]
name = "24a+b"
command = ~D, B, a+b

[Command]
name = "24x"
command = ~D, B, x

[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "ab"
command = a+b

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

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

[Command]
name = "hold_a"
command = /a

[Command]
name = "hold_b"
command = /b

[Command]
name = "hold_c"
command = /c

[Command]
name = "hold_x"
command = /x

[Command]
name = "hold_y"
command = /y

[Command]
name = "hold_z"
command = /z

[Command]
name = "hold_s"
command = /s

[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;---|AI Commands|-----------------------------------------------------------
[Command]
Name = "AI_00"
Command = a, a
Time = 0
[Command]
Name = "AI_01"
Command = a, b
Time = 0
[Command]
Name = "AI_02"
Command = a, c
Time = 0
[Command]
Name = "AI_03"
Command = a, x
Time = 0
[Command]
Name = "AI_04"
Command = a, y
Time = 0
[Command]
Name = "AI_05"
Command = a, z
Time = 0
[Command]
Name = "AI_06"
Command = a, s
Time = 0
[Command]
Name = "AI_07"
Command = b, a
Time = 0
[Command]
Name = "AI_08"
Command = b, b
Time = 0
[Command]
Name = "AI_09"
Command = b, c
Time = 0
[Command]
Name = "AI_10"
Command = b, x
Time = 0
[Command]
Name = "AI_11"
Command = b, y
Time = 0
[Command]
Name = "AI_12"
Command = b, z
Time = 0
[Command]
Name = "AI_13"
Command = b, s
Time = 0
[Command]
Name = "AI_14"
Command = c, a
Time = 0
[Command]
Name = "AI_15"
Command = c, b
Time = 0
[Command]
Name = "AI_16"
Command = c, c
Time = 0
[Command]
Name = "AI_17"
Command = c, x
Time = 0
[Command]
Name = "AI_18"
Command = c, y
Time = 0
[Command]
Name = "AI_19"
Command = c, z
Time = 0
[Command]
Name = "AI_20"
Command = c, s
Time = 0
[Command]
Name = "AI_21"
Command = x, a
Time = 0
[Command]
Name = "AI_22"
Command = x, b
Time = 0
[Command]
Name = "AI_23"
Command = x, c
Time = 0
[Command]
Name = "AI_24"
Command = x, x
Time = 0
[Command]
Name = "AI_25"
Command = x, y
Time = 0
[Command]
Name = "AI_26"
Command = x, z
Time = 0
[Command]
Name = "AI_27"
Command = x, s
Time = 0
[Command]
Name = "AI_28"
Command = y, a
Time = 0
[Command]
Name = "AI_29"
Command = y, b
Time = 0
[Command]
Name = "AI_30"
Command = y, c
Time = 0
[Command]
Name = "AI_31"
Command = y, x
Time = 0
[Command]
Name = "AI_32"
Command = y, y
Time = 0
[Command]
Name = "AI_33"
Command = y, z
Time = 0
[Command]
Name = "AI_34"
Command = y, s
Time = 0
[Command]
Name = "AI_35"
Command = s, a
Time = 0
[Command]
Name = "AI_36"
Command = s, b
Time = 0
[Command]
Name = "AI_37"
Command = s, c
Time = 0
[Command]
Name = "AI_38"
Command = s, x
Time = 0
[Command]
Name = "AI_39"
Command = s, y
Time = 0
[Command]
Name = "AI_40"
Command = s, z
Time = 0
[Command]
Name = "AI_41"
Command = s, s
Time = 0
[Command]
Name = "AI_42"
Command = U, U
Time = 0
[Command]
Name = "AI_43"
Command = U, F
Time = 0
[Command]
Name = "AI_44"
Command = U, D
Time = 0
[Command]
Name = "AI_45"
Command = U, B
Time = 0
[Command]
Name = "AI_46"
Command = F, U
Time = 0
[Command]
Name = "AI_47"
Command = F, F
Time = 0
[Command]
Name = "AI_48"
Command = F, D
Time = 0
[Command]
Name = "AI_49"
Command = F, B
Time = 0






[Statedef -1]
;AI Command Check
[State -1, AI Command]
Type = VarSet
TriggerAll = Var(59)=0 && !isHelper
trigger1 = command = "AI_01" || command = "AI_02" || command = "AI_03" || command = "AI_04"
trigger2 = command = "AI_05" || command = "AI_06" || command = "AI_07" || command = "AI_08"
trigger3 = command = "AI_09" || command = "AI_10" || command = "AI_11" || command = "AI_12"
trigger4 = command = "AI_13" || command = "AI_14" || command = "AI_15" || command = "AI_16"
trigger5 = command = "AI_17" || command = "AI_18" || command = "AI_19" || command = "AI_20"
Trigger6 = Command = "AI_21" || Command = "AI_22" || Command = "AI_23" || Command = "AI_24"
Trigger7 = Command = "AI_24" || Command = "AI_26" || Command = "AI_27" || Command = "AI_28"
Trigger8 = Command = "AI_29" || Command = "AI_30" || Command = "AI_31" || Command = "AI_32"
Trigger9 = Command = "AI_33" || Command = "AI_34" || Command = "AI_35" || Command = "AI_36"
Trigger10 = Command = "AI_37" || Command = "AI_38" || Command = "AI_39" || Command = "AI_40"
Trigger11 = Command = "AI_41" || Command = "AI_42" || Command = "AI_43" || Command = "AI_44"
Trigger12 = Command = "AI_45" || Command = "AI_46" || Command = "AI_47" || Command = "AI_48"
Trigger13 = Command = "AI_49" || Command = "AI_00"
;Trigger14 = 1;AI即起動スイッチ
V = 59
Value = 1
IgnoreHitPause = 1

[State -1, AI Command]
Type = VarSet
TriggerAll = isHelper(1) && stateno = 0
trigger1 = command = "AI_01" || command = "AI_02" || command = "AI_03" || command = "AI_04"
trigger2 = command = "AI_05" || command = "AI_06" || command = "AI_07" || command = "AI_08"
trigger3 = command = "AI_09" || command = "AI_10" || command = "AI_11" || command = "AI_12"
trigger4 = command = "AI_13" || command = "AI_14" || command = "AI_15" || command = "AI_16"
trigger5 = command = "AI_17" || command = "AI_18" || command = "AI_19" || command = "AI_20"
Trigger6 = Command = "AI_21" || Command = "AI_22" || Command = "AI_23" || Command = "AI_24"
Trigger7 = Command = "AI_24" || Command = "AI_26" || Command = "AI_27" || Command = "AI_28"
Trigger8 = Command = "AI_29" || Command = "AI_30" || Command = "AI_31" || Command = "AI_32"
Trigger9 = Command = "AI_33" || Command = "AI_34" || Command = "AI_35" || Command = "AI_36"
Trigger10 = Command = "AI_37" || Command = "AI_38" || Command = "AI_39" || Command = "AI_40"
Trigger11 = Command = "AI_41" || Command = "AI_42" || Command = "AI_43" || Command = "AI_44"
Trigger12 = Command = "AI_45" || Command = "AI_46" || Command = "AI_47" || Command = "AI_48"
Trigger13 = Command = "AI_49" || Command = "AI_00"
Trigger14 = 1;AI即起動スイッチ
V = 59
Value = 1
IgnoreHitPause = 1

[State -1, 歩く]
type = ChangeState
value = 20
triggerall = var(59)>0
triggerall = roundstate = 2
triggerall = statetype != A
trigger1 = ctrl && stateno != 20
trigger1 = random <= 100
ctrl = 1

[State -1, ジャンプ]
type = ChangeState
value = 40
triggerall = var(59)>0
triggerall = roundstate = 2
triggerall = statetype != A && ctrl
trigger1 = BackEdgeBodyDist <= 20 && p2statetype = L && p2bodydist X <= 60
trigger2 = p2statetype != A && enemynear,HitDefAttr = SC, NT,ST,HT
trigger2 = random <= 700
trigger3 = p2statetype = A && p2movetype = H
trigger3 = P2BodyDist X = [0,90]
trigger3 = enemynear,vel Y = [-1,1]
trigger3 = p2stateno != [1025,1028]
trigger3 = random <= 700
trigger4 = p2statetype != A && p2BodyDist X >= 80 && enemynear,NumProj > 0
trigger4 = random <= 100
trigger5 = p2statetype != A && p2BodyDist X >= 120 && p2movetype = A && EnemyNear,NumHelper > 0
trigger5 = random <= 50
ctrl = 1

[State -1, 空中受け身]
Type = ChangeState
Value = 5210
triggerall = var(59)>0
triggerall = RoundState = 2
triggerAll = Vel Y > -1
triggerAll = Alive
triggerAll = StateNo = 5050
trigger1 = CanRecover
trigger1 = Random <= 700

[State -1, シールド]
type = ChangeState
value = 720
value = ifelse(random<2,260,720)
triggerall = var(59)>0
triggerall = RoundState = 2
triggerall = random<4
triggerall = p2movetype=A
triggerall = stateno!=720
triggerall = stateno!=730
trigger1 = p2movetype = A || InGuardDist
trigger2 = p2movetype = A || InGuardDist || enemynear,NumProj > 0
trigger2 = P2BodyDist X >= 90 || statetype = A

[State -1, ガード]
type = ChangeState
value = 120
triggerall = var(59)>0
triggerall = RoundState = 2
triggerall = ctrl && stateno != [120,155]
trigger1 = random <= 700
trigger1 = p2movetype = A || InGuardDist
trigger2 = p2movetype = A || InGuardDist || enemynear,NumProj > 0
trigger2 = P2BodyDist X >= 90 || statetype = A

[State -1, ]
type = ChangeState
value = 250
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 110
trigger1 = time>5

[State -1, ]
type = ChangeState
value = 610
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 505
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 505
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 504
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 504
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = p2bodydist X <= 20
triggerall = p2bodydist Y <= 20
triggerall = p2bodydist Y >= -20
triggerall = statetype = A
trigger1 = stateno != 504
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 503
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = p2bodydist X > 30
trigger1 = stateno = 502
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 102
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = p2bodydist X > 60
triggerall = statetype = S
triggerall = p2movetype=H
trigger1 = stateno != 102
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 100
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = p2bodydist X > 30
triggerall = statetype = S
trigger1 = stateno != 100
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 502
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = p2bodydist X <= 30
trigger1 = stateno = 502
trigger1 = movecontact

[State -1, しゃがみ攻撃]
type = ChangeState
value = 502
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = (stateno != 502)
trigger1 = p2bodydist X <= 30
trigger1 = p2stateno=130
trigger1 = (statetype = S)||(statetype = C)
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 504
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 231
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 230
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 210
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 210
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 200
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = ifelse(random<500,200,102)
triggerall = RoundState = 2
triggerall = var(59)>0
trigger1 = stateno = 501
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 501
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = (statetype = S)
triggerall = p2bodydist X > 30
trigger1 = stateno = 500
trigger1 = movecontact

[State -1, ]
type = ChangeState
value = 500
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = (statetype = S)
triggerall = p2bodydist X <= 30
trigger1 = stateno = 500
trigger1 = movecontact

[State -1, 立ち弱パンチ]
type = ChangeState
value = 500
triggerall = RoundState = 2
triggerall = var(59)>0
triggerall = p2bodydist X <= 30
triggerall = statetype = S
trigger1 = stateno != 500
trigger1 = ctrl



;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59)<=0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59)<=0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl


[State -1, ]
type = ChangeState
value = 110
triggerall = var(59)<=0
triggerall = command = "ab"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl || stateno=102

[State -1, ]
type = ChangeState
value = 115
triggerall = var(59)<=0
triggerall = command = "ab"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, シールド]
type = ChangeState
value = 720
triggerall = var(59)<=0
triggerall = command = "ab"
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 102
triggerall = var(59)<=0
triggerall = command = "b"
trigger1 = stateno=100
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, ]
type = ChangeState
value = 260
triggerall = var(59)<=0
triggerall =var(11)<=0
triggerall = (command = "623a")||(command = "623b")
trigger1 = statetype = S
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 200
triggerall = var(59)<=0
triggerall = (command = "26a")
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno=[500,503]

[State -1, ]
type = ChangeState
value = 210
triggerall = var(59)<=0
triggerall = (command = "a")
trigger1 = stateno = 200
trigger1 = animelemtime(4)>=0

[State -1, ]
type = ChangeState
value = 230
triggerall = var(59)<=0
triggerall = (command = "a")
trigger1 = stateno = 210
trigger1 = animelemtime(5)>=0

[State -1, ]
type = ChangeState
value = 240
triggerall = var(59)<=0
;triggerall = NumHelper(242) > 0 
triggerall = command = "26b"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 250
triggerall = var(59)<=0
triggerall = (command = "24a")
trigger1 = statetype = S
trigger1 = ctrl
[State -1, ]
type = ChangeState
value = 256
triggerall = var(59)<=0
triggerall = (command = "24b")
trigger1 = statetype = S
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 610
triggerall = var(59)<=0
triggerall = (command = "26a")||(command = "26b")
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno=[504,505]

[State -1, ]
type = ChangeState
value = 600
triggerall = var(59)<=0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 700
triggerall = var(59)<=0
triggerall = command = "c"
triggerall = power>=500
trigger1 = statetype != A && ctrl

[State -1, ]
type = ChangeState
value = 195
triggerall = var(59)<=0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, ]
type = ChangeState
value = 500
triggerall = var(59)<=0
triggerall = command = "a"
trigger1 = statetype = S
trigger1 = stateno !=100
trigger1 = ctrl || (stateno=500&&movecontact)

[State -1, ]
type = ChangeState
value = 501
triggerall = var(59)<=0
triggerall = command = "b"
trigger1 = statetype = S
trigger1 = ctrl || (stateno=500&&movecontact)

[State -1, ]
type = ChangeState
value = 502
triggerall = var(59)<=0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl || (stateno=502&&movecontact)

[State -1, ]
type = ChangeState
value = 503
triggerall = var(59)<=0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl || (stateno=502&&movecontact)

[State -1, ]
type = ChangeState
value = 504
triggerall = var(59)<=0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ]
type = ChangeState
value = 505
triggerall = var(59)<=0
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl || (stateno=504&&movecontact)













