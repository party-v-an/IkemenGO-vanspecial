;==============================================================================
; Win�Ő�p�p�[�g
;==============================================================================
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| �{�^�����}�b�v�i�{�^���R���t�B�O�j|---------------------------------------- ��P��

[Remap]
x = x      ;�w�{�^���̓��͔�������ۂɉ����{�^���Ɋ��蓖�Ă�B
y = y      ;�x�{�^���@�@�@�@�@�@�@�@�@�V
z = z      ;�y�{�^���@�@�@�@�@�@�@�@�@�V
a = a      ;�`�{�^���@�@�@�@�@�@�@�@�@�V
b = b      ;�a�{�^���@�@�@�@�@�@�@�@�@�V
c = c      ;�b�{�^���@�@�@�@�@�@�@�@�@�V
s = s      ;�X�^�[�g�{�^���@�@�@�@�@�@�V

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| �f�t�H���g�ݒ� |----------------------------------------------------------- ��Q��

[Defaults]
command.time = 15  ;�W���̃R�}���h���͎�t���ԁB
                   ;�e�R�}���h�ŏȗ����Ă���ꍇ�ɗL���B
                   ;���̃p�����[�^���������ꍇ�A�f�t�H���g�͂P�t���[���ɂȂ�B
                   ;�i�@M.U.G.E.N�ł̂P�t���[���@���@�P�^�U�O�b�@�j

command.buffer.time = 1  ;�W���̃R�}���h���͋L�����ԁB
                         ;���͂�������ɃR�}���h���L�����A
                         ;�w�𗣂��Ă��R�}���h���������Ă����Ԃ�
                         ;�����Őݒ肵�����Ԃ̕��ێ�����B
                         ;�P�`�R�O�t���[���܂ł̊ԂŐݒ�\�B
                         ;�f�t�H���g�͂P�t���[���B

;============================================================================== ��R��
; �R�}���h��`�p�[�g�i���̓L�[��ݒ肷��j
;==============================================================================
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;-| �`�h�����p�R�}���h |-------------------------------------------------------

;���b�o�t�Ɂw�l�Ԃɂ͓��͏o���Ȃ��R�}���h�x����͂����鎖�ŁA
;�@�w�[���`�h�v���O�����x�𔭓�������悤�ɂ���e�N�j�b�N�B
;�@�����m���͂܂��Ƀ����_���Ȃ̂ŁA�^�C���B

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
;-| �X�[�p�[�A�[�c |-----------------------------------------------------------

;***********************************
;�S���J
[Command]
name = "kizuna"
command = ~D,DB,B,DB,D,DF,F,x
time = 30

[Command]
name = "kizuna"
command = ~D,DB,B,DB,D,DF,F,y
time = 30

;***********************************
;�}�V���K��lv3
[Command]
name = "mashin_gun_LV3"
command = ~D,DF,F,D,DF,F,x
time = 30

[Command]
name = "mashin_gun_LV3"
command = ~D,DF,F,D,DF,F,y
time = 30

;�g���b�L�[�A�T���g
[Command]
name = "tricky"
command = ~D,DF,F,D,DF,F,a
time = 30

[Command]
name = "tricky"
command = ~D,DF,F,D,DF,F,b
time = 30

;------------------------------------------------------------------------------
;-| �K�E�Z |-------------------------------------------------------------------

;***********************************
;�l���V�Xlv2
[Command]
name = "Nemesis"
command = ~F,D,DF,x

[Command]
name = "Nemesis"
command = ~F,D,DF,y

;***********************************
;�}�V���K��lv2
[Command]
name = "mashin_gun_Lv2"
command = ~D,DF,F,x

[Command]
name = "mashin_gun_Lv2"
command = ~D,DF,F,y

;***********************************
;�o���b�g�X�e�b�v
[Command]
name = "bullet_step"
command = ~D,DB,B,x

[Command]
name = "bullet_step"
command = ~D,DB,B,y

;�T�}�[�\���g�V���b�g
[Command]
name = "ss"
command = ~D,DB,B,a

[Command]
name = "ss"
command = ~D,DB,B,b

;------------------------------------------------------------------------------
;-| ����Z |-------------------------------------------------------------------

;�K�[�h�L�����Z���U��
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
;�u���b�L���O
[Command]
name = "blocking-000"
command = F
time = 1

[Command]
name = "blocking-001"
command = /F
time = 1

[Command];�N�C�b�N�X�^���f�B���O�Ƌ��p
name = "blocking-002"
command = D
time = 1

[Command]
name = "blocking-003"
command = /D
time = 1

;***********************************
;�X�[�p�[�W�����v
[Command]
name = "super_jump"
command = D,$U
time = 7

;------------------------------------------------------------------------------
;-| �L�[�Q��o���b�g�X�e�b�v���� |---------------------------------------------------------

[Command]
name = "FF"       ;�K�{�R�}���h��
command = F,F
time = 10

[Command]
name = "BB"       ;�K�{�R�}���h��
command = B,B
time = 10

;------------------------------------------------------------------------------
;-| �������� |-----------------------------------------------------------------

[Command]
name = "recovery" ;�K�{�R�}���h��
command = a+b
time = 1

[Command]
name = "recovery" ;�K�{�R�}���h��
command = x+y
time = 1

;------------------------------------------------------------------------------
;-| �����L�[�{�{�^�� |---------------------------------------------------------

;[Command]
;name = "fwd_a"
;command = /F,a

;------------------------------------------------------------------------------
;-| �{�^���P�� |---------------------------------------------------------------

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

;-| �������� |-----------------------------------------------------------------

[Command]
name = "chargec"
command = /c
time = 1

[Command]
name = "chargez"
command = /z
time = 1

;------------------------------------------------------------------------------
;-| �����L�[ |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;�K�{�R�}���h��
command = /$F
time = 1

[Command]
name = "holdback"  ;�K�{�R�}���h��
command = /$B
time = 1

[Command]
name = "holdup"    ;�K�{�R�}���h��
command = /$U
time = 1

[Command]
name = "holddown"  ;�K�{�R�}���h��
command = /$D
time = 1

;============================================================================== ��S��
; �X�e�[�g�G���g���[�p�[�g�i�Z�Ȃǂ��o����悤�ɂ��邽�߂̏�����ݒ�j
;==============================================================================
[Statedef -1] ;�����̍s�͐�΂ɏ����Ȃ��łˁB�K�{���ڂł��B

;==============================================================================
; �X�[�p�[�A�[�c
;==============================================================================
;------------------------------------------------------------------------------

[State -1, �S���J]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (StateType != A) 
triggerall = (command = "kizuna")
triggerall = (Power > 2999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;�������X�[�p�[�L�����Z��������
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
value = 3100

[State -1, �}�V���K��lv3]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "mashin_gun_LV3")
triggerall = (Power > 999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;�������X�[�p�[�L�����Z��������
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
trigger7 = (StateNo = 1008) && (animElemTime(8) >= 0) && (animElemTime(13) >= 1)
value = 3000

[State -1, �g���b�L�[�A�T���g]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (StateType != A) 
triggerall = (command = "tricky")
triggerall = (Power > 999)
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact)
;�������X�[�p�[�L�����Z��������
trigger3 = (StateNo = 1000) && (Time = [12,26])
trigger4 = (StateNo = 1001) && (MoveContact)
trigger5 = (StateNo = 1005) && (MoveContact)
trigger6 = (StateNo = 1007) && (MoveContact)
trigger7 = (StateNo = 1008)
value = 3001

;==============================================================================
; �K�E�Z
;==============================================================================
;------------------------------------------------------------------------------

[State -1, �l���V�Xlv2]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "Nemesis")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1005

[State -1, �}�V���K��lv2]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "mashin_gun_Lv2")
trigger1 = (Ctrl)
trigger2 = (StateNo = [200,699]) && (MoveContact || Time = [1,9])
value = 1000

[State -1, �o���b�g�X�e�b�v]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "bullet_step")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1007

[State -1, �T�}�[�\���g�V���b�g]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "ss")
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact || Time = [1,9])
value = 1008

;==============================================================================
; ����Z
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ����]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "recovery")
triggerall = (StateNo != 100)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
;�n�㓊��
trigger1 = (command = "holdfwd") || (command = "holdback")
trigger1 = (StateType != A)
trigger1 = (Ctrl)
trigger1 = (P2StateType != A)
trigger1 = (P2MoveType != H)
;�󒆓���
trigger2 = (command = "holdfwd") || (command = "holdback")
trigger2 = (StateType = A)
trigger2 = (Ctrl)
trigger2 = (P2StateType = A)
trigger2 = (P2MoveType != H)
value = 800

;���utrigger*�v�������̕t�����ɂ���ĉ��ł����₹��B

;------------------------------------------------------------------------------

[State -1, ���݂�]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "blocking-003") && (command = "b")
;trigger1 = (StateType = A) && (Ctrl) && (Vel X > 0) && (Vel Y = [-1.75,1.75])
trigger1 = (StateType = A) && (Ctrl) && (Vel X > 0) && (Vel Y >= -1.75)
trigger1 = (pos Y <= -60)
value = 750

[State -1, �K�[�h�L�����Z��]
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

[State -1, ��荞��]
type = ChangeState
triggerall = (RoundState = 2) && (Alive)
trigger1 = (command = "a") && (command = "x") && (StateType != A) && (Ctrl)
value = 702

[State -1, �ړ��N���オ��]
type = ChangeState
triggerall = (Alive)
triggerall = (RoundState = 2) && (StateNo = 5110) && (MoveType = H) && (Time > 1)
trigger1 = (command = "holdfwd") || (command = "holdback")
value = 10002

;�p���[����
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
; �ړ��֘A
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ����]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "FF") && (StateType = S) && (Ctrl)
value = 100

[State -1, �o�b�N�X�e�b�v]
type = ChangeState
triggerall = (StateNo != 100)
trigger1 = (command = "BB") && (StateType = S) && (Ctrl)
value = 105

[State -1, �󒆃_�b�V��]
type = ChangeState
triggerall = (Pos Y < -40)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
triggerall = !(PrevStateNo = 45 && StateNo = 50)
trigger1 = (command = "FF") && (StateType = A) && (Ctrl)
value = 101

[State -1, �󒆃o�b�N�_�b�V��]
type = ChangeState
triggerall = (Pos Y < -40)
triggerall = (StateNo != 101)
triggerall = (StateNo != 106)
triggerall = !(PrevStateNo = 45 && StateNo = 50)
trigger1 = (command = "BB") && (StateType = A) && (Ctrl)
value = 106

[State -1, �X�[�p�[�W�����v]
type = ChangeState
trigger1 = (command = "super_jump") && (StateType != A) && (Ctrl)
value = 10003

;==============================================================================
; �ʏ�U���Z
;==============================================================================
;------------------------------------------------------------------------------

[State -1, ������p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 200

[State -1, �������p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 210

[State -1, ������L�b�N]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a") && (command != "holddown")
trigger1 = (StateType = S) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 230

[State -1, �������L�b�N]
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

[State -1, ���Ⴊ�ݎ�p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 400

[State -1, ���Ⴊ�݋��p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (MoveContact)
trigger3 = (StateNo = 230) && (MoveContact)
trigger4 = (StateNo = 400) && (MoveContact)
trigger5 = (StateNo = 430) && (MoveContact)
value = 410

[State -1, ���Ⴊ�ݎ�L�b�N]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a") && (command = "holddown")
trigger1 = (StateType = C) && (Ctrl)
trigger2 = (StateNo = 200) && (AnimElemTime(3) > 1)
trigger3 = (StateNo = 400) && (AnimElemTime(2) > 1)
trigger4 = (StateNo = 430) && (AnimElemTime(3) > 1)
value = 430

[State -1, ���Ⴊ�݋��L�b�N]
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

[State -1, �W�����v��p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "x")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 630) && (MoveContact)
value = 600

[State -1, �W�����v���p���`]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "y")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600 || StateNo = 630) && (MoveContact)
value = 610

[State -1, �W�����v��L�b�N]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "a")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600) && (MoveContact)
value = 630

[State -1, �W�����v���L�b�N]
type = ChangeState
triggerall = (var(0) = 0)
triggerall = (command = "b")
trigger1 = (StateType = A) && (Ctrl)
trigger2 = (StateNo = 600 || StateNo = 630) && (MoveContact)
value = 640

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

[State -1, ����]
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
