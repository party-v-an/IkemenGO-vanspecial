; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;======================================<DARK FORCE STATES>=====================================
;==============================================================================================

;===================<START>===================
[Statedef 774]
type = S
physics = N
movetype = I
anim = 773
ctrl = 0
sprpriority = 1
facep2 = 1

[State 774, End]
type = changestate
trigger1 = !ishelper(775)
value = 0
ctrl = 1

[State 774, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 774, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 774, Vel]
type = velset
trigger1 = !time
x = 0.05 * facing * (root, pos x + 2 * (root, p2dist x * root, facing) -pos x)

[State 774, Anim]
type = changeanim
trigger1 = anim = 773 && time >= 20
value = 774

[State 774, Vel]
type = velset
trigger1 = anim = 774
x = 0

[State 774, Pos]
type = posset
trigger1 = anim = 774
x = root, pos x + 2 * (root, p2dist x * root, facing)
y = root, pos y

[State 774, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 774, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 774
value = 775

[State 774, End]
type = changestate
trigger1 = root, map(darkforce) <= 0
value = 779


;===================<ACTIVE>===================
[Statedef 775]
type = A
physics = N
movetype = I
anim = 0
ctrl = 0
velset = 0, 0

[State 775, End]
type = selfstate
trigger1 = !ishelper(775)
value = 0
ctrl = 1

[State 775, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 775, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 775, Anim]
type = changeanim
trigger1 = selfanimexist(root, anim)
trigger1 = root, stateno != [770, 771]
trigger1 = ifelse((root, movetype = H), (root, anim = [5000, 5300]), 1)
trigger1 = (anim != root, anim) || (animelemno(0) != root, animelemno(0))
value = root, anim
elem = root, animelemno(0)
ignorehitpause = 1

[State 775, Custom States Anim]
type = changeanim
trigger1 = root, movetype = H
trigger1 = root, anim != [5000, 5300]
trigger2 = !selfanimexist(root, anim)
value = 5010
ignorehitpause = 1

[State 775, Pos]
type = bindtoroot
trigger1 = 1
time = 1
facing = -1
pos = 2 * (root, p2dist x), 0

[State 775, Sprite Priority]
type = sprpriority
trigger1 = 1
value = 0
ignorehitpause = 1

[State 775, Type]
type = statetypeset
trigger1 = root, movetype = A
movetype = A
ignorehitpause = 1

[State 775, Type]
type = statetypeset
trigger1 = root, movetype = I
trigger2 = root, movetype = H
movetype = I
ignorehitpause = 1

[State 775, Strength]
type = mapset
trigger1 = 1
map = "strength"
value = root, map(strength)

[State 775, Hit Reset]
type = movehitreset
trigger1 = !(root, movecontact)

[State Damage Scaling - Helper Multiplier]
type = attackmulset
trigger1 = 1
value = root, map(damagescaling)
ignorehitpause = 1

;[State 775, No Light Loops]
;type = varadd
;trigger1 = var(0) > 0
;var(0) = 1
;ignorehitpause = 1
;
;[State 775, No Light Loops]
;type = varset
;triggerall = !var(0)
;triggerall = numtarget
;trigger1 = anim = 200 || anim = 201 || anim = 230
;trigger2 = anim = 400 || anim = 430 || anim = 431
;var(0) = 1
;ignorehitpause = 1
;
;[State 775, No Light Loops]
;type = varset
;trigger1 = !numtarget
;var(0) = 0

[State 775, Juggle Properties]
type = null
trigger1 = 1 || map(juggle_start) := 0
trigger1 = 1 || map(juggle_increase) := 0
trigger1 = 1 || map(juggle_limit) := (root, map(juggle_limit) + 1)
ignorehitpause = 1

[State 775, Spark Properties]
type = null
trigger1 = 1 || map(sparkno) := root, map(sparkno)
trigger1 = 1 || map(guard.sparkno) := root, map(guard.sparkno)
trigger1 = 1 || map(sparkx.min) := root, map(sparkx.min)
trigger1 = 1 || map(sparkx.max) := root, map(sparkx.max)
trigger1 = 1 || map(sparky) := root, map(sparky)
ignorehitpause = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = [200, 201]
trigger1 = root, animelem = 2
attr = S, NA
damage = 30, 0
animtype = Light
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, anim = 200), -82, -74)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 210
trigger1 = root, animelem = 3
attr = S, NA
damage = 70, 0
animtype = Medium
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8011)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -54
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 211
trigger1 = root, animelem = 4
attr = S, NA
damage = 80, 0
animtype = Medium
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -62
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 220
trigger1 = root, animelem = 5
attr = S, NA
damage = 100, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 221
trigger1 = root, animelem = 2
attr = S, NA
damage = 90, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -36
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 221
trigger1 = root, animelem = 3
trigger1 = !(root, movecontact) && !(root, movereversed)
attr = S, NA
damage = 90, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -62
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 230
trigger1 = root, animelem = 2
attr = S, NA
damage = 30, 0
animtype = Light
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -32
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 240
trigger1 = root, animelem = 4
attr = S, NA
damage = 70, 0
animtype = Medium
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8011)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -53
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 250
trigger1 = root, animelem = 4
attr = S, NA
damage = 90, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -59
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255
trigger1 = root, animelem = 3 || root, animelem = 4
attr = A, NA
damage = 30, 0
animtype = Hard
guardflag = HA
hitflag = HAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, animelem = 3), -96, -72)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255
trigger1 = root, animelem = 5
attr = A, NA
damage = 30, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255
trigger1 = root, animelem = 6
attr = A, NA
damage = 30, 0
animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -24
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, 9
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 400 && (root, animelem = 2 || root, animelem = 3)
attr = C, NA
damage = 20, 0
animtype = Light
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -36
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
down.velocity = 0, -2
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 410
trigger1 = root, animelem = 2
attr = C, NA
damage = 60, 0
animtype = Medium
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -29
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
down.velocity = 0, -3
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 420
trigger1 = root, animelem = 4
attr = C, NA
damage = 100, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -32
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 425
trigger1 = root, animelem = 3
attr = C, NA
damage = 90, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -120
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -9
air.type = Low
air.velocity = 0, -9
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 430 || root, anim = 431
trigger1 = root, animelem = 2
attr = C, NA
damage = 30, 0
animtype = Light
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, anim = 430), -4, -17)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
down.velocity = 0, -2
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 440 || root, anim = 441
trigger1 = root, animelem = 2
attr = S, NA
damage = 70, 0
animtype = Medium
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8011)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, anim = 440), -14, -31)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
down.velocity = 0, -3
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 450
trigger1 = root, animelem = 4
attr = C, NA
damage = 80, 0
animtype = Hard
hitflag = MAF
guardflag = L
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10 + 0 * (map(sparkx.min) := 30) * (map(sparkx.max) := 90), map(sparky) := -30
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Trip
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -8.0
air.type = Trip
air.velocity = 0, -8.0
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
yaccel = 0.695

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 600
trigger1 = root, animelem = 2
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -43
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 610
trigger1 = root, animelem = 3
attr = A, NA
damage = 70, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 620
trigger1 = root, animelem = 6
attr = A, NA
damage = 90, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -66
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = [630, 631]
trigger1 = root, animelem = 2
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, anim = 630), -42, -62)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 12
ground.hittime = 1 + 12
ground.velocity = 0, 0
air.type = High
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 640
trigger1 = root, animelem = 3
attr = A, NA
damage = 70, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8011)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -47
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 15
ground.hittime = 1 + 15
ground.velocity = 0, 0
air.type = High
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 650
trigger1 = root, animelem = 3
attr = A, NA
damage = 90, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8012)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -54
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
getpower = 0, 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -3, 3)
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 1100
trigger1 = root, animelem = 2 || root, animelem = 3
trigger1 = !(root, movecontact) && !(root, movereversed)
attr = S, SA
damage = 90 + (10 * map(strength)), 0
animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8023)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, animelem = 2), -35, -60)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 1 + 22
ground.velocity = 0, -6 -map(strength)
air.type = Low
air.velocity = 0, -6 -map(strength)
getpower = 0, 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -2, 2)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = root, anim = 1100
trigger1 = root, animelem = 4
trigger1 = !(root, movecontact) && !(root, movereversed)
attr = A, SA
damage = 60, 0
animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8023)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 1 + 22
ground.velocity = 0, -6 -map(strength)
air.type = Low
air.velocity = 0, -6 -map(strength)
getpower = 0, 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -2, 2)
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
forcestand = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 1110
trigger1 = root, animelem = 2 || root, animelem = 3
attr = S, SA
damage = 40, 5
animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 8, 8
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -10.0
air.type = Low
air.velocity = 0, -10.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = root, anim = 1110
trigger1 = root, animelem = 4
attr = A, SA
damage = 60, 7
animtype = Up
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 8, 8
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, -10.0
air.type = Low
air.velocity = 0, -10.0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.cornerpush.veloff = 0
airguard.velocity = 0, -1.5
forcestand = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = [1205, 1207]
trigger1 = root, animelem = 4 || root, animelem = 10 || root, animelem = 16
attr = S, SA
damage = 40, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8023)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 0
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = 0, -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 1251
trigger1 = !((root, movecontact + root, movereversed) % 8)
attr = S, SA
damage = 20, 0
animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 4, 4
sparkno = ifelse(root, map(cfg_sparks), -1, 2)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -7
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12; super
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
envshake.mul = 0.667
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 1 + 16
airguard.velocity = 0, -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 775, Hit]
type = hitdef
trigger1 = root, stateno = 1900
trigger1 = root, animelemtime(12) >= 0
ID = 1900
attr = A, SA
hitflag = FD
guardflag = HA
priority = 4, Hit
damage = 20, 5
redlife = 20, 5
dizzypoints = 0
getpower = ifelse(movehit, 25, 100) * !map(darkforce), ifelse(moveguarded, 25, 50) * !map(darkforce)
givepower = 40, 40
pausetime = 10, 10
guard.pausetime = 10, 10
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
airguard.velocity = 0, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.hittime = 18
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 10), map(sparky) := 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 775, Hit]
type = hitdef
trigger1 = root, stateno = 1930
trigger1 = root, animelemtime(12) >= 0
ID = 1930
attr = A, SA
hitflag = FD
guardflag = HA
priority = 4, Hit
damage = 13, 3
redlife = 13, 3
dizzypoints = 0
getpower = 0, 0
givepower = 40, 40
pausetime = 8, 8
guard.pausetime = 8, 8
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 1 + 18
ground.slidetime = 18
air.hittime = 120
airguard.ctrltime = 1 + 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
airguard.velocity = 0, -1.00
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.hittime = 18
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
p1sprpriority = sprpriority
forcestand = 1
hitsound = s2, 9
hitsound.channel = 2
guardsound = s2, 0
guardsound.channel = 2
sparkno = -1 + 0 * (map(sparkno) := 8023)
guard.sparkno = -1 + 0 * (map(guard.sparkno) := 8001)
sparkxy = -10 + 0 * (map(sparkx.min) := -10) * (map(sparkx.max) := 10), map(sparky) := 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 3100
trigger1 = root, animelem = 2 || root, animelem = 3
attr = S, HA
damage = 30, 0
animtype = Back
hitflag = MAFD
guardflag = M
priority = 4, Hit
pausetime = 3, 4
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8024)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, ifelse((root, animelem = 2), -35, -60)
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = Low
ground.slidetime = 18
ground.hittime = 1 + 22
ground.velocity = 0, -7.0
air.type = Low
air.velocity = 0, -7.0
down.hittime = 20
down.velocity = 0, 0
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
down.recover = 1
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = root, anim = 3100
trigger1 = root, animelem = 4 || root, animelem = 6 || root, animelem = 8 || root, animelem = 9 || root, animelem = 10 || root, animelem = 11
attr = A, HA
damage = 30, 0
animtype = Up
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = ifelse((root, animelem = 11), 12, 4), ifelse((root, animelem = 11), 12, 4)
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8024)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 1 + 22
ground.velocity = 0, -7.0
air.type = Low
air.velocity = 0, -7.0
down.velocity = 0, 0
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
ground.cornerpush.veloff = 0
guard.hittime = 1 + 16
guard.ctrltime = 1 + 16
guard.slidetime = 16
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
down.recover = 1
yaccel = 0.4850
forcestand = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 3402
trigger1 = !((root, movecontact + root, movereversed) % 3)
attr = A, HA
damage = ifelse((root, movecontact || root, movereversed), 10, 120), ifelse((root, movecontact || root, movereversed), 3, 30)
animtype = Hard
air.animtype = Back
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, map(cfg_sparks), -1, 2) + 0 * (map(sparkno) := 8024)
guard.sparkno = ifelse(root, map(cfg_sparks), -1, 40)
sparkxy = -10, -43
hitsound = -1
guardsound = s2, 0
guardsound.channel = 2
ground.type = High
ground.slidetime = 18
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -5.33; air reset
air.fall = 1
fall.recover = 0
down.recover = 1
getpower = 0, 0
givepower = 0
envshake.time = 12; special
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.mul = 0.667
yaccel = 0.4850
forcestand = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1000
trigger1 = anim = 1000 && animelem = 1
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1

[State 775, SoulFist]
type = helper
trigger1 = root, stateno = 1000
trigger1 = anim = 1000 && animelem = 5
helpertype = normal
stateno = 1005
ID = 1005
name = "Soul Fist"
postype = p1
pos = 6 * const(size.xscale), -50 * const(size.yscale)
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1010
trigger1 = anim = 1000 && animelem = 1
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal = 1

[State 775, EX SoulFist]
type = helper
trigger1 = root, stateno = 1010
trigger1 = anim = 1000 && animelem = 6
helpertype = normal
stateno = 1015
ID = 1015
name = "EX Soul Fist"
postype = p1
pos = ceil(6 * const(size.xscale)), ceil(-50 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1050
trigger1 = anim = 1050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 775, Air Soul Fist]
type = helper
trigger1 = root, stateno = 1050
trigger1 = anim = 1050 && animelem = 6
helpertype = normal
stateno = 1055
ID = 1055
name = "Air Soul Fist"
postype = p1
pos = ceil(60 * const(size.xscale)), ceil(-48 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1060
trigger1 = anim = 1050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 775, EX Air Soul Fist]
type = helper
trigger1 = root, stateno = 1060
trigger1 = anim = 1050 && animelem = 6
helpertype = normal
stateno = 1065
ID = 1065
name = "EX Air Soul Fist"
postype = p1
pos = ceil(60 * const(size.xscale)), ceil(-48 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 3000
trigger1 = anim = 3000
trigger1 = animelem = 3
anim = 3004
ID = 3004
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 775, Soul Phoenix]
type = helper
trigger1 = root, stateno = 3000
trigger1 = anim = 3000
trigger1 = animelem = 5
helpertype = normal
stateno = 3005
ID = 3005
name = "Soul Phoenix"
postype = p1
pos = 6, -50
size.xscale = 0.85
size.yscale = 0.85
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 3050
trigger1 = anim = 3050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 775, Air Soul Phoenix]
type = helper
trigger1 = root, stateno = 3050
trigger1 = anim = 3050 && animelem = 6
helpertype = normal
stateno = 3055
ID = 3055
name = "Air Soul Phoenix"
postype = p1
pos = 60, -48
size.xscale = 0.85
size.yscale = 0.85
ownpal = 1

;[State 775, Sparks]
;in ZSS

[State 775, End]
type = changestate
trigger1 = root, map(darkforce) <= 0
value = 779


;========================<DISAPPEAR>=============================
[Statedef 779]
physics = N
velset = 0, 0

[State 779, Anim]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 779, shrink]
type = angledraw
trigger1 = 1
scale = 1 -(0.1 * time), 1

[State 779, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - ceil(25.6 * time), ceil(25.6 * time)

[State 779, Bats]
type = helper
trigger1 = time = 1 || time = 2 || time = 4 || time = 6 || time = 8
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
pos = 0, -55

[State 779, End]
type = destroyself
trigger1 = time >= 10
