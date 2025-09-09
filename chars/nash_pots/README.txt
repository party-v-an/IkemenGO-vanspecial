                                _______________________________
===============================| Nash by Phantom.of.the.Server |===============================
                                ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯          [22.02.2025]

 - Contact: potsmugen@gmail.com
 - Website: https://network.mugenguild.com/pots/
 - If you downloaded this character from anywhere else, it's probably outdated

 - Customized version of Capcom's Nash (Charlie) character from the Street Fighter series
 - Playable in the Ikemen GO engine, February 2025 build and above
 - For older versions for older engines, try searching my Mediafire folder



==========< FEATURES >==========

 - Two modes: Nash and Shadow
 - Custom gameplay inspired by both classic and modern games
 - Details and moves taken from his various video game appearances and storyline
 - Some original moves
 - Original and edited effects from various games
 - Sounds from various games, including CvS2 and SFA3
 - Voice samples from SFA3 and XvSF
 - Special intros versus Guile, Vega and my Shin Gouki
 - Custom input parser
 - A.I.



==========< MODE OVERVIEW >==========

This character has two different modes. Here follows a short description of each:


<NASH>
 - 1000 life points
 - Base mode
 - Uses charge inputs
 - Can use EX specials


<SHADOW>
 - 850 life points
 - Uses motion inputs
 - Can perform chain combos on the ground
 - Can use Shadow Warp
 - Has a few different super combos


The mode is selected according to the definition file, as explained below.

 

==========< .DEF OVERVIEW >==========

This character has three different .def files. Here's what each one does:


<nash_pots.def>
The mode is selected via palette:

A, B, C, X, Y, Z          -> Nash
Start + A, B, C, X, Y, Z  -> Shadow

To add him to your Mugen, add the following line to your select.def, under [Characters]:
nash_pots,


<normalnash.def>
Only Nash mode is available.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
nash_pots/normalnash.def,


<shadownash.def>
Only Shadow mode is available.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
nash_pots/shadownash.def,



==========< MOVELIST >==========

NOTE: The movelist can be accessed from the ingame menu.

U - up          x - light punch        a - light kick
D - down        y - medium punch       b - medium kick
F - forward     z - hard punch         c - hard kick
B - back        p - any punch          k - any kick
s - start       pp - two punches       kk - two kicks

(air) - Move must be performed in the air.
(air also) - Move can be performed either on the ground or in the air.
(EX) - Move has an EX version, performed by pressing two punch/kick buttons.
(charge) - Hold said direction for about 2 seconds before releasing.


<THROWS>

.Knee Gatling               F/B + pp (near opponent)
.Dragon Suplex              F/B + kk (near opponent)
.Airjack                    F/B + pp (near opponent / air)
.Flying Buster Drop         F/B + kk (near opponent / air)


<UNIQUE ATTACKS>

.Knee Bazooka               F/B + a  (possible during forward dash)
.Jumping Sobat              F/B + b
.Step Kick                  F/B + c


<NASH SPECIAL MOVES>

.Sonic Boom (EX)            (charge) B, F, p
.Somersault Shell (EX):     (charge) D, U, k
.Moonsault Slash (EX):      U, UF, F, k (air)


<NASH LEVEL 1 SUPER COMBOS>

.Sonic Break                (charge) B, F, B, F, p
.Crossfire Blitz            (charge) B, F, B, F, k
.Reversed Somersault        (charge) DB, DF, DB, U, k


<NASH LEVEL 2 SUPER COMBOS>

.Somersault Justice         (charge) DB, DF, DB, U, kk


<NASH LEVEL 3 SUPER COMBO>

.Sonic Blade                (charge) B, F, B, F, pp


<SHADOW SPECIAL MOVES>

.Sonic Boom (EX)            D, DF, F, p
.Somersault Shell (EX):     B, D, DB, k
.Moonsault Slash (EX):      U, UF, F, k (air)
.Shadow Warp                D, DF, F, k


<SHADOW LEVEL 1 SUPER COMBOS>

.Sonic Break                D, DF, F, D, DF, F, p
.Reversed Somersault        D, DB, B, D, DB, B, k
.Moonsault Strike           D, DF, F, D, DF, F, k (air)


<SHADOW LEVEL 2 SUPER COMBOS>

.Crossfire Blitz II         D, DF, F, D, DF, F, kk


<SHADOW LEVEL 3 SUPER COMBO>

.Final Mission              D, DF, F, D, DF, F, pp


<SYSTEM>

.Forward Dash                      F, F
   .Run                            hold
.Back Dash                         B, B
.Low Jump                          tap U
.High Jump                         tap D, U
.Long Low Jump                     tap D, tap U            
.Sidestep                          a + x
   .Sidestep Attack                p / k
.Forward Roll                      F + a + x
.Back Roll                         B + a + x
.Parry High                        tap F
.Parry Low                         tap D
.Air Parry                         tap F           (air)
.Power Charge                      hold b + y
.Guard Cancel High                 F + pp          (during guard) (1 power bar)
.Guard Cancel Low                  F + kk          (during guard) (1 power bar)
.Custom Combo                      c + z           (air also) (2 power bars)
.Fall Recovery                     pp / a + x      (while falling and allowed)
.Roll Recovery                     F + p / k (while falling from a hit)
.Taunt                             s



==========< MOVE DETAILS >==========

 - During Knee Gatling, you and your opponent can mash buttons to respectively increase or
decrease the number of hits;

 - Jumping Sobat is an overhead;

 - During Sonic Break, pressing any punch button will make Nash shoot up to 3 extra Sonic Booms;



==========< GAMEPLAY NOTES >==========

COMBO SYSTEM
 - Some Normal attacks can be canceled into any Special and Super moves
 - Some Special moves can be canceled into any Super moves
 - Some Super moves can be canceled into different Super moves
 - Cancelling a Special, Super or Custom Combo into a Super move resets the juggle points
 - Shadow can chain normal attacks in this order: X, A, Y, B, Z, C


DAMAGE SCALING
 - The damage your attacks inflict goes down with each attack in a combo
 - The first attack deals 100% damage
 - Successive attacks deal 10% less damage
 - Super cancelling a special advances 2 steps in the damage scaling
 - Super cancelling a super advances 3 steps in the damage scaling
 - Damage during Custom Combo scales according to the damage already dealt to the opponent
 - Super Combo damage will not fall below 30% for Level 1, 40% for Level 2 and 50% for Level 3
 - Normal attacks deal more damage on their own than during a Chain Combo
 - The amount of power gained during a combo is also affected by damage scaling


THROWS
 - Throws cannot be blocked but can be jumped out of
 - The opponent can escape a normal throw by inputting a throw of their own just as they are grabbed
 - Normally throws can only be escaped if the opponent was in a position where they could also attempt to throw


COUNTER HITS
 - If the opponent is in the middle of attacking, your attacks deal 20% extra damage
 - Most attacks cause extra hit stun as well, allowing links that are normally not possible
 - You'll know a counter hit happened when a round shockwave effect appears at the point of impact


KNOCKDOWNS
 - This character uses 3 types of knockdowns: Soft, Medium and Hard
 - Soft knockdowns allow the enemy to use fall recovery or fast recovery (mash buttons to get up)
 - Medium knockdowns allow only fast recovery
 - Hard knockdowns allow neither. The enemy will always get up with the same timing
 - Hard knockdowns are signalled by a lifebar message (if the lifebars allow it)


FORWARD DASH
 - Moves you forward faster than walking, but you can't interrupt it
 - Useful for sneaking up on the opponent


RUN
 - Can be interrupted unlike dashes


BACK DASH
 - Creates some space between you and the opponent
 - Considered airborne, so it avoids most throws and standing combos


LOW JUMP
 - Useful for quick jumping attacks that must be blocked high
 - Cannot use special and super moves while low jumping
 - Delay after attacking is longer than other jumps


HIGH JUMP
 - Useful for quickly closing distance
 - If the opponent is in the corner, this allows you to cross them up


LONG LOW JUMP
 - A cross between Low and High jumps


SIDESTEP
 - Avoids all attacks and fireballs
 - Vulnerable to throws
 - Instant recovery


SIDESTEP ATTACK
 - Allows you to counterattack after dodging
 - Between the punch and kick options, one can be cancelled into special and super moves, and the other knocks down


ROLL
 - Avoids all attacks and fireballs while moving
 - Vulnerable to throws
 - Can be hit by anything at the end of the animation
 - Forward version is a bit faster than the back version


PARRY
 - Allows you to bypass block stun, leaving the opponent open for a counterattack
 - To parry high attacks tap forward just before being hit. To parry low attacks tap down. While jumping only forward works


POWER CHARGE
 - Manually charges the power meter
 - Rate of charge is slow at first, but increases the longer you hold it


GUARD CANCEL
 - While guarding, this cancels out of the guarding pose with a counterattack
 - Subtracts 300 points from the guard bar (if guard break is enabled)
 - Cannot be used to finish off the opponent
 - Useful to relieve pressure


CUSTOM COMBO
 - Removes most cancellable attack restrictions and gives you a lot of freedom to perform combos
 - Juggle limits are temporarily disabled
 - You can only use EX Special or Super moves from the point the character starts flashing faster and brighter, and doing so ends Custom Combo
 - Gives you a short invulnerability window at the start


FALL RECOVERY
 - Allows you to land on your feet after being knocked down


ROLL RECOVERY
 - Allows you to sneak up behind the opponent after being knocked down
 - Completely vulnerable to throws and low attacks
 - Cannot be used during a hard knockdown
 - Holding forward makes you travel farther



==========< MISCELLANEOUS >==========

 - Holding down a button as Nash wins a round allows you to select his win pose, as follows:

X/B/C -> Puts on his glasses
Y -> Turns his back, salutes and says "Too easy!"
Z -> Adjusts his jacket and says "Hmph."
A -> Cleans his glasses and says "Hmph."

Shadow has a special win pose at the end of a match.



==========< VERSION HISTORY >==========

<22.02.2025>
 - Minor fixes
 - Compatibility update for latest Ikemen version
 - The last followup of Sonic Break now moves Nash forward
 - Sonic Break fireballs can now vary their speed in normal mode

<23.11.2024>
 - Compatibility update for latest Ikemen version

<27.09.2024>
 - Minor bug fixes and adjustments for latest Ikemen version
 - Restored the ability to perform EX and super moves at the the end of Custom Combo
 - Counter hit bonus system is now more accurate, but does not happen when trading hits
 - Implemented "medium" knockdowns where the enemy cannot safe fall but can vary their wakeup timing
 - Light hits will now also cause the collapse KO animation

<22.04.2024>
 - Bug fixing
 - Power Charge now has a significant recovery time
 - Adjusted Power Charge charging rate
 - Adjusted throws so that punch throws the opponent forward and kick throws them back
 - Knee Gatling is no longer mashable
 - Special moves now also give +2 frame advantage on a counter hit
 - Hard knockdowns are now signaled with lifebar messages
 - The AI should now guard more like a human player
 - Hitsparks no longer rely on helpers, for better performance
 - Can now also select "Nakoruru type" hit sparks in the config file

<05.10.2023>
 - Meter gain is now affected by damage scaling
 - The timing to cancel fireballs is now more specific
 - Implemented maximum damage scaling for supers
 - Increased the chances that an AI enemy will tech out of throws
 - Changed the sidestep attacks
 - Crouching friction constant reverted to Mugen standard
 - Roll Recovery can no longer be used during hard knockdowns

<30.07.2023>
 - Bug fixing
 - Minor updates to keep up with the engine
 - Air resets don't hit the opponent as far back as before
 - The opponent must now be standing to be allowed to tech throws
 - The zoom during win poses can be disabled in the configuration file
 - The PalFX now match each palette's effect colors
 - Added a makeshift diagonal get hit animation
 - Revised super pause times
 - EX Moonsault Slash nerfed a little
 - Changed Custom Combo damage scaling
 - Removed the ability to perform EX and super moves at the end of Custom Combo
 - Adjusted Somersault invincibility
 - Negative edge is now disabled by default

<19.03.2023>
 - Bug fixing
 - Updated some codes with new engine features
 - Updated the parry code so that it can parry fireballs (helper type) without pausing the other players
 - Guard Cancel now deducts 300 guard points
 - The AI will now mostly halt if the inputs are disabled by AssertSpecial (Ikemen compatibility update)
 - Sonic Break will continue automatically if the inputs are disabled, for compatibility with tag
 - Rewrote the input parser code in the new ZSS language for improved performance
 - Partner attacks no longer increase your own juggle points, for consistency with other characters
 - Taunting now builds the opponent's meter
 - Tweaked the alternate taunt animation
 - Increased leniency on double tap inputs, such as dashes
 - Guard cancel pauses the opponent a shorter time, so that it is easier to bait
 - The hurt voices can now play during custom states as well
 - The AI can now adapt to blocking some standing low attacks
 - The character now says something when tagging in
 - Block stun reduced by 2 frames for most attacks
 - Hard knockdowns now force the opponent to stay down for a specific length of time
 - The hitsound channel is now mostly handled by a new engine feature instead of workarounds
 - Most intros now respect the lifebar's waiting time
 - Adjusted corner crossups so that they're less ambiguous
 - Missed normal throws have more recovery
<04.11.2022>
 - Bug fixing
 - A.I. adjustments
 - Adjusted Somersault physics and collision boxes
 - Victory music can now be switched on or off in the configuration file
 - Restored the ability to walk immediately after crouching
 - Final Mission now has a fixed startup invulnerability, giving it less priority at maximum range
 - Sonic Break fireballs now have a curved trajectory
 - Adjusted Sonic Boom frame data. Each version has its own properties now
 - EX Sonic Boom no longer knocks down
 - Sonic Break fireballs now knock down
 - Nash and Shadow modes can now be selected by separate def files
 - Knee Bazooka is now exclusive to the normal Nash mode
 - Some supers are now exclusive to a specific mode
 - Added several palettes
 - Shadow Warp has more fireball invincibility
 - Changed Crossfire Blitz physics. Nash now moves forward with each attack rather than continuously
 - Shadow health and stun increased to 850
 - Shadow has more attacks that set the opponent on fire
 - Remade many collision boxes
 - Gave Shadow some edited voices

<11.09.2022>
 - Bug fixing
 - Added an experimental victory BGM
 - Added a new target combo
 - Adjusted super combo startup invulnerability
 - Custom Combo damage scaling changed so that they do more damage at the beginning and are less likely to do too much
 - The camera now follows the character for the win poses
 - The character now flashes white to signal a super cancel

<03.07.2022>
 - Bug fixing
 - Shadow now explodes when defeated, as a throwback to Marvel VS Street Fighter
 - Shadow now grunts during several attacks
 - Somersault Justice input is more lenient
 - Adjusted some air hit velocities to fit better in Ikemen GO

<25.06.2022>
 - Bug fixing
 - Removed minimum damage threshold. Attacks can now do less than 7 points of damage
 - Changed chip damage calculation. It is now 25% of regular damage
 - Final Mission can kill by chip damage
 - Chip damage is now affected by damage scaling
 - Reduced the damage supers do to the opponent's guard bar

<12.06.2022>
 - Now exclusively compatible with Ikemen GO
 - Added Ikemen DEF and CNS parameters
 - Replaced the old movelist with Ikemen GO's movelist
 - Removed the custom dizzy system and improved compatibility with Ikemen GO's dizzy system
 - Disabled redizzy combos (until Ikemen fixes this)
 - Added a temporary fix to Explod position randomization
 - Hit sparks and super pause effects can be configured separately
 - Several pieces of code adapted to Ikemen's features
 - Disabled stun damage during Custom Combo
 - Added a new, custom input buffer to better accomodate Ikemen's inputs
 - Can now charge specials during an opponent's super pause
 - Defense code for Shadow mode updated with Ikemen features
 - Maximum stun points for Shadow lowered accordingly
 - Damage scaling is now similar to modern Street Fighter games

<11.06.2022>
 - Bug fixing
 - Shadow's chain combos can be executed even if the first attack is parried
 - Adjusted throw escape behaviour
 - Removed air throw height restrictions
 - Air throws no longer have instant startup
 - Changed the way range is handled for normal air throws
 - Removed the override to lying down states. Character still wakes up faster than normal, however
 - Reintroduced some input shortcuts

<14.05.2022>
 - Bug fixing
 - Updated ground impact effect
 - Parry window and cooldown increased slightly
 - Consecutive standing parries now move the player slightly back
 - Adjusted the way Parry pauses work
 - Parrying no longer builds extra meter
 - Trading fireballs no longer buils meter
 - Maximum damage scaling level corrected to 500. It is also more sensitive to increasing damage

<30.04.2022>
 - Standing kicks are closer to SFA2 so that he's more classic Nash and less Guile
 - Replaced far medium kick with Jumping Sobat
 - Removed far hard kick
 - Standing hard kick now does two hits
 - Detection of double quarter circle motions is more lenient
 - Improved "variable height" code. Crossups should be a bit more consistent
 - Adjusted input for high jumps. Should no longer happen on accident and also work better in Ikemen
 - Removed some input shortcuts for better Ikemen compatibility

<24.04.2022>
 - Shadow does the Sonic Break sequence automatically
 - Added flame particles to some Shadow attacks
 - Shadow mode gained ground Chain Combos but lost EX moves

<15.04.2022>
 - Bug fixing
 - Removed dragon punch motion shortcuts for better Ikemen compatibility
 - Shadow mode vitality reduced from 90% to 80%
 - Shadow will hold his pose after winning with Final Mission

<09.04.2022>
 - Several gameplay changes and adjustments
 - Updated some sounds and visual effects
 - Changed Custom Combos. They now cost two power levels, last longer and have normal hitpauses
 - Can now crossup in the corner with high jumps and some specific special moves
 - Inputs now reverse when the opponent is behind the player like they're supposed to
 - Changed the damage scaling to be affected by the total damage in a combo rather than number of hits
 - Removed Excel Combo timer bar
 - Changed ground bounce constants and lie down time
 - Added an override to Mugen's lie down state. Can no longer mash buttons to wake up faster, but in return can only be OTG'd once
 - Implemented a stun system
 - Added movelist display. Press Start twice
 - Shadow mode now uses motion commands instead of charging
 - Shadow mode now takes more damage
 - CommandEasy file is no longer included
 - Can perform Knee Bazooka during a forward dash
 - Moonsault Slash and Moonsault Strike can't be performed while jumping back
 - Moonsault Slash only causes a hard knockdown with the EX version
 - Roll does not travel as far as before
 - Fixed hit spark alignment during Crossfire Blitz
 - Forward dash is no longer considered airborne
 - Lowered walk speed
 - Can now run from a forward dash
 - Changed air reset handling. Should cause less issues now and make meaty attacks more useful
 - Can cancel attacks even if they are parried or reversed
 - Knee Bazooka is considered a medium attack
 - Added Back Roll
 - Adjusted jump arc
 - Added a configuration file
 - Attacks do more damage after a sweep or OTG, in order to bypass Mugen's defense bonus
 - Removed autoguard from EX Moonsault Slash
 - Changed the way directional charging is handled to bypass some Mugen bugs
 - Added charge partitioning while I was at it
 - A.I. can no longer use charge moves where a human can't
 - Jumping medium punch knocks down when hitting air to air
 - Normal attack damages buffed
 - Probably more

<12.01.2010>
 - For Mugen 1.0 now
 - Revised some invulnerability times on supers
 - Final Mission is considerably faster, but punishable and less damaging
 - Sonic Blade is less damaging
 - Juggle system no longer depends on whether or not P2 can fall recover, only on juggle points

<27.03.09>
 - Some fixes

<14.12.08>
 - Lv2 Crossfire Blitz now continues even if player 2 reverses it
 - Sonic Boom hit boxes extended further down, means fewer chars can crouch under them
 - Lv2 Crossfire Blitz is two frames slower, meaning the range at which it can catch an opponent
that wasn't guarding during the super pause is shorter

<v.1.25>
 - Decreased range of Reversed Somersault
 - Doesn't need to charge for supers when Super Cancelling
 - hard Somersault Shell now does more hits on block like the original
 - EX Somersault Shell does more hits
 - EX Somersault Shell projectile now comes out a bit later in Nash's anim, but connects better
and has a better vertical range
 - Standing weak kick is no longer rapid-fire
 - Looser juggle system in Simul mode, will reset juggle points if either opponent is idle
 - Special intro versus my Shin Gouki
 - Reduced speed of Sonic Booms to better fit Mugen's screen (narrower than CPS)
 - Recovers a lot faster from Knee Bazooka
 - Lowered priority of crouching medium kick
 - Tweaked Final Mission's custom states so that the opponent only gets up after a fixed
ammount of time


<v.1.2>
 - Moonsault Slash can no longer be performed too close to the ground


<v.1.1>
 - Nash no longer goes through thin opponents during Sonic Blade
 - Can now Super Cancel EX Sonic Boom
 - Added Moonsault Strike
 - Added Midnight Bliss special animation
 - Added A.I.
 - Added some Kara Canceling
 - Reduced damage of Somersault Justice
 - Reduced damage for Super Cancels
 - EX Sonic Boom and EX Somersault Shell now come out faster
 - Final Mission is now overall a better move, coming out faster when close to the opponent and
having better anti-air priority
 - Sonic Blade's invulnerability lasts slightly longer
 - Changed a bit the way Final Mission looks
 - Reduced Step Kick's damage, in order to somewhat weaken its Custom Combo
 - The autoguard on EX Moonsault Slash can now block any Normal or Special attack
 - Air throws can now juggle


<v.1.0>
 - Added Custom Combo Finish effect
 - Tweaked Final Mission velocities
 - Knee Bazooka is now considered an aerial attack (can be air guarded)
 - Can now use Roll Recovery after guarding an attack mid-air
 - Added Reversed Somersault, Sonic Blade and Shadow Warp
 - Supers done at the end of an Custom Combo now do less damage
 - Changed the Counter Hit special effect
 - Added Shadow mode
 - Added Power Charge anim
 - Added palettes


<v.0.85>
 - First release



==========< WHAT'S MISSING >==========

 - Bug fixing



==========< SPECIAL THANKS >==========

 - VirtuallTek, for the various versions of Fighter Factory
 - Shiyo Kakuge / TATsu, for the running animation
 - H" and Warusaki3, for some CvS2 effects
 - JustNoPoint, for ripping the MvC-exclusive Nash sprites
 - Winane, for the old A.I. activation code
 - Anise, for Immaterial and Missing Power sprite rips
 - 8th Gate Of Hell, BBH, Byakko, Messatsu, mh777, PRØJECT.13, Toni, Trololo, Winane, xerf84 and ZolidSone for feedback
 - All the good folks in the community, for support and motivation
 - www.GameFAQs.com, for... the game FAQs =P
 - You, for downloading my char ;)



==========< DISCLAIMER >==========

 - Nash and Street Fighter Zero are property of Capcom
 - This character is a non-profit fan work. It cannot be sold or used for any commercial purposes
 - No part of this work may be used for personal profit, be it commissions, paywalls and the likes of it
