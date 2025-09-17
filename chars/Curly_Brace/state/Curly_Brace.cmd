;==============================================================================
; Win版専用パート
;==============================================================================
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| ボタンリマップ（ボタンコンフィグ）|---------------------------------------- 第１部

[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| デフォルト設定 |----------------------------------------------------------- 第２部

[Defaults]
command.time = 15  ;標準のコマンド入力受付時間。
                   ;各コマンドで省略している場合に有効。
                   ;このパラメータを消した場合、デフォルトは１フレームになる。
                   ;（　M.U.G.E.Nでの１フレーム　＝　１／６０秒　）

command.buffer.time = 1  ;標準のコマンド入力記憶時間。
                         ;入力した直後にコマンドを記憶し、
                         ;指を離してもコマンドが成功している状態を
                         ;ここで設定した時間の分維持する。
                         ;１～３０フレームまでの間で設定可能。
                         ;デフォルトは１フレーム。

;============================================================================== 第３部
; コマンド定義パート（入力キーを設定する）
;==============================================================================
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| ＡＩ発動用コマンド |-------------------------------------------------------

;※ＣＰＵに『人間には入力出来ないコマンド』を入力させる事で、
;　『擬似ＡＩプログラム』を発動させるようにするテクニック。
;　発動確率はまさにランダムなので、運任せ。

[Command]
name = "AI-000"
command = ~F,a,~D,y,~U,c+x,D,b+y,F,z,z,z+a
time = 1

[Command]
name = "AI-001"
command = ~F,c,~D,y,~U,c+a,D,b+x,B,z,z,z+b
time = 1

[Command]
name = "AI-002"
command = ~F,y,~D,y,~U,c+y,D,b+z,F,z,z,z+c
time = 1

[Command]
name = "AI-003"
command = ~F,b,~D,y,~U,c+b,D,b+a,B,z,z,z+x
time = 1

[Command]
name = "AI-004"
command = ~F,x,~D,x,~U,c+x,D,b+y,F,z,z,z+y
time = 1

[Command]
name = "AI-005"
command = ~F,z,~D,y,~U,c+a,D,b+c,B,z,z,z+a
time = 1

[Command]
name = "AI-006"
command = ~D,U,x+y+z,~F,F,b,c,y,B,~B,a+b+c,U
time = 1

[Command]
name = "AI-007"
command = ~U,D,x+b+z,~F,F,b,b,x,B,~B,a+y+c,F
time = 1

[Command]
name = "AI-008"
command = ~D,U,a+y+c,~F,F,b,a,z,B,~B,x+b+z,D
time = 1

[Command]
name = "AI-009"
command = ~U,D,x+b+c,~F,F,b,c,x,B,~B,a+y+z,B
time = 1

[Command]
name = "AI-010"
command = ~x,~y,~z,~a,~b,~c,~s,a+b+c,x+y+z,~F,B
time = 1

;***********************************
[Command]
name = "AI-011"
command = F,D,F
time = 0

[Command]
name = "AI-012"
command = B,F,B
time = 0

[Command]
name = "AI-013"
command = U,B,U
time = 0

[Command]
name = "AI-014"
command = D,U,D
time = 0

;***********************************
[Command]
name = "AI-015"
command = a,s,a
time = 0

[Command]
name = "AI-016"
command = b,a,b
time = 0

[Command]
name = "AI-017"
command = c,b,c
time = 0

[Command]
name = "AI-018"
command = x,c,x
time = 0

[Command]
name = "AI-019"
command = y,x,y
time = 0

[Command]
name = "AI-020"
command = z,y,z
time = 0

[Command]
name = "AI-021"
command = s,z,s
time = 0

;------------------------------------------------------------------------------
;-| スーパーアーツ |-----------------------------------------------------------

;***********************************
;鉄の絆
[Command]
name = "kizuna"
command = ~D,DB,B,DB,D,DF,F,x
time = 30

[Command]
name = "kizuna"
command = ~D,DB,B,DB,D,DF,F,y
time = 30

;***********************************
;マシンガンlv3
[Command]
name = "mashin_gun_LV3"
command = ~D,DF,F,D,DF,F,x
time = 30

[Command]
name = "mashin_gun_LV3"
command = ~D,DF,F,D,DF,F,y
time = 30

;トリッキーアサルト
[Command]
name = "tricky"
command = ~D,DF,F,D,DF,F,a
time = 30

[Command]
name = "tricky"
command = ~D,DF,F,D,DF,F,b
time = 30

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

;***********************************
;ネメシスlv2
[Command]
name = "Nemesis"
command = ~F,D,DF,x

[Command]
name = "Nemesis"
command = ~F,D,DF,y

;***********************************
;マシンガンlv2
[Command]
name = "mashin_gun_Lv2"
command = ~D,DF,F,x

[Command]
name = "mashin_gun_Lv2"
command = ~D,DF,F,y

;***********************************
;バレットステップ
[Command]
name = "bullet_step"
command = ~D,DB,B,x

[Command]
name = "bullet_step"
command = ~D,DB,B,y

;サマーソルトショット
[Command]
name = "ss"
command = ~D,DB,B,a

[Command]
name = "ss"
command = ~D,DB,B,b

;------------------------------------------------------------------------------
;-| 特殊技 |-------------------------------------------------------------------

;ガードキャンセル攻撃
[Command]
name = "counter_k"
command = ~B,DB,D,a

[Command]
name = "counter_k"
command = ~B,DB,D,b

[Command]
name = "counter_p"
command = ~B,DB,D,x

[Command]
name = "counter_p"
command = ~B,DB,D,y

;***********************************
;ブロッキング
[Command]
name = "blocking-000"
command = F
time = 1

[Command]
name = "blocking-001"
command = /F
time = 1

[Command];クイックスタンディングと共用
name = "blocking-002"
command = D
time = 1

[Command]
name = "blocking-003"
command = /D
time = 1

;***********************************
;スーパージャンプ
[Command]
name = "super_jump"
command = D,$U
time = 7

;------------------------------------------------------------------------------
;-| キー２回バレットステップ入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F,F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B,B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = a+b
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = x+y
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

;[Command]
;name = "fwd_a"
;command = /F,a

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

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

;-| 押し続け |-----------------------------------------------------------------

[Command]
name = "chargec"
command = /c
time = 1

[Command]
name = "chargez"
command = /z
time = 1

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1

;============================================================================== 第４部
; ステートエントリーパート（技などを出せるようにするための条件を設定）
;==============================================================================
[Statedef -1] ;←この行は絶対に消さないでね。必須項目です。

;==============================================================================
; スーパーアーツ
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 鉄の絆]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (StateType != A) 
triggerall = (command = "kizuna")
triggerall = (Power > 2999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;■■■スーパーキャンセル■■■
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
value = 3100

[State -1, マシンガンlv3]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "mashin_gun_LV3")
triggerall = (Power > 999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;■■■スーパーキャンセル■■■
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
trigger7 = (StateNo = 1008) && (animElemTime(8) >= 0) && (animElemTime(13) >= 1)
value = 3000

[State -1, トリッキーアサルト]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (StateType != A) 
triggerall = (command = "tricky")
triggerall = (Power > 999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;■■■スーパーキャンセル■■■
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
trigger7 = (StateNo = 1008)
value = 3001

;==============================================================================
; 必殺技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ネメシスlv2]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "Nemesis")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1005

[State -1, マシンガンlv2]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "mashin_gun_Lv2")
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact || Time = [1,9])
value = 1000

[State -1, バレットステップ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "bullet_step")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1007

[State -1, サマーソルトショット]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "ss")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1008

;==============================================================================
; 特殊技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 投げ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "recovery")
triggerall = (StateNo != 100)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
;地上投げ
trigger1 = (command = "holdfwd") || (command = "holdback")
trigger1 = (StateType != A)
trigger1 = (Ctrl)
trigger1 = (P2StateType != A)
trigger1 = (P2MoveType != H)
;空中投げ
trigger2 = (command = "holdfwd") || (command = "holdback")
trigger2 = (StateType = A)
trigger2 = (Ctrl)
trigger2 = (P2StateType = A)
trigger2 = (P2MoveType != H)
value = 800

;※「trigger*」も条件の付け方によって何個でも増やせる。

;------------------------------------------------------------------------------

[State -1, 踏みつけ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "blocking-003") && (command = "b")
;trigger1 = (StateType = A) && (Ctrl) && (Vel X > 0) && (Vel Y = [-1.75,1.75])
trigger1 = (StateType = A) && (Ctrl) && (Vel X > 0) && (Vel Y >= -1.75)
trigger1 = (pos Y <= -60)
value = 750

[State -1, ガードキャンセル]
type = ChangeState
triggerall = numhelper(12345)
triggerall = (helper(12345),var(7) = 1)
triggerall = (RoundState = 2) && (Alive)
triggerall = (command = "counter_k") || (command = "counter_p")
trigger1 = (Power > 999)
trigger1 = (StateType != A)
trigger1 = (StateNo = [150,153])
trigger1 = !(HitShakeOver)
trigger1 = (InGuardDist)
value = 703

;------------------------------------------------------------------------------

[State -1, 回り込み]
type = ChangeState
triggerall = (RoundState = 2) && (Alive)
trigger1 = (command = "a") && (command = "x") && (StateType != A) && (Ctrl)
value = 702

[State -1, 移動起き上がり]
type = ChangeState
triggerall = (Alive)
triggerall = (RoundState = 2) && (StateNo = 5110) && (MoveType = H) && (Time > 1)
trigger1 = (command = "holdfwd") || (command = "holdback")
value = 10002

;パワー溜め
[State -1]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = statetype != A
triggerall = ctrl
triggerall = (power < 3000)
triggerall = roundstate = 2
trigger1 = (command = "chargec" && command = "chargez")
value = 850

;==============================================================================
; 移動関連
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 走る]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "FF") && (StateType = S) && (Ctrl)
value = 100

[State -1, バックステップ]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "BB") && (StateType = S) && (Ctrl)
value = 105

[State -1, 空中ダッシュ]
type = ChangeState
triggerall = (Pos Y < -40)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
triggerall = !(PrevStateNo = 45 && StateNo = 50)
trigger1 = (command = "FF") && (StateType = A) && (Ctrl)
value = 101

[State -1, 空中バックダッシュ]
type = ChangeState
triggerall = (Pos Y < -40)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
triggerall = !(PrevStateNo = 45 && StateNo = 50)
trigger1 = (command = "BB") && (StateType = A) && (Ctrl)
value = 106

[State -1, スーパージャンプ]
type = ChangeState
trigger1 = (command = "super_jump") && (StateType != A) && (Ctrl)
value = 10003

;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 立ち弱パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 200

[State -1, 立ち強パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 210

[State -1, 立ち弱キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 230

[State -1, 立ち強キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "b") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 240

;------------------------------------------------------------------------------

[State -1, しゃがみ弱パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 400

[State -1, しゃがみ強パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 410

[State -1, しゃがみ弱キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 430

[State -1, しゃがみ強キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "b") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 440

;------------------------------------------------------------------------------

[State -1, ジャンプ弱パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 630) && (MoveContact)
value = 600

[State -1, ジャンプ強パンチ]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600 || StateNo = 630) && (MoveContact)
value = 610

[State -1, ジャンプ弱キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600) && (MoveContact)
value = 630

[State -1, ジャンプ強キック]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "b")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600 || StateNo = 630) && (MoveContact)
value = 640

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

[State -1, 挑発]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "start")
trigger1 = (StateType != A) && (Ctrl)
value = 10000

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
