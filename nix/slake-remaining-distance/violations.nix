# SPDX-License-Identifier: Unlicense
# Violation list for the remaining-distance meter. Occupancy 49.
# FullHost false. Rebuild 23 GREEN. Current independently reviewed
# ELF /nix/store/97p32bdbdw6v79yxydi1y4s4s39ksp8j-slake-bootstrap
# (149467016 bytes). That path is not
# /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap
# (149447232 bytes). /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap
# (149447232 bytes) is no longer current.
# /nix/store/s7achs1g5mlxdwk92a6mqnpxwz19c0mz-slake-bootstrap
# (149403616 bytes) is no longer current.
# /nix/store/2b2yl85hy7nbcx27xm02h2xq5jcg0mnh-slake-bootstrap
# (149384352 bytes) is no longer current.
# /nix/store/vd819cjncxn614xzk47d051msvd93gr1-slake-bootstrap
# (149334976 bytes) is no longer current. rebuild 24 BLOCKED: Mult-place.drv
# /nix/store/vnaf6g728b5pph6pgkjj2idmy7jk9sf2-slake-bootstrap-Mult-place.drv
# signal 9. No NEW ELF from rebuild 24. Copy set already on the builder.
# dest RejectNotPrefix.lean done. Prefix-not toy CHECK_EXIT 1 kept reject.
# infix || toy CHECK_EXIT 1 kept reject on the current independently reviewed ELF.
# infix && toy CHECK_EXIT 1 kept reject on the current independently reviewed ELF.
# infix ^^ toy CHECK_EXIT 1 kept reject on the current independently reviewed ELF.
# infix Boolean tokens || && ^^ are dest-and-hook done on this ELF.
# CompilePathLinear CHECK_EXIT 0. RejectOrInfix.lean EXISTS (done dest).
# RejectAndInfix.lean EXISTS (done dest). Do not reopen RejectAndInfix.lean as remaining.
# RejectXorInfix.lean EXISTS (done dest). Do not reopen RejectXorInfix.lean as remaining.
# Do not reopen RejectNotPrefix.lean as remaining.
# next leftover after infix Boolean tokens || && ^^ dest-and-hook done is being named.
# An Ident-suffix name is not a dest. Do not mint an Ident-suffix dest.
# dest RejectBoolBeq.lean done. Bool.beq toy CHECK_EXIT 1 kept reject.
# Token == already lives in RejectBeqThm. Bool.beq lives in
# RejectBoolBeq. BeqIdentToy is not a product dest. An Ident-suffix
# name is not a dest. Do not mint RejectBang. the later toy directory is bool-beq.
# RejectBoolBne.lean EXISTS (done dest; rename GREEN). old Ident-suffix
# path missing. Bool.bne lives in RejectBoolBne. Token != is RejectBne.
# rebuild 24 prior miss: Mult-place.drv signal 9. Do not name rebuild
# 24 GREEN. Open stays Open. Comments-only C needle.ok true fails this
# meter.
{ lib, specs, honesty, ctx }:
let
  inherit (honesty)
    bneMissingFrozen bneLacksSourceGreen bneLacksFailClosed
    bneClaimsNotFailClosed bneStaleLater bneStaleInFlight rebuild9StaleInFlight
    currentLacksS0sjpz1 staleCurrentWpc482yn lacksNoLongerCurrentWpc staleCurrentIldbshq8 lacksNoLongerCurrentIldb staleCurrentL04l55ig lacksNoLongerCurrentL04 staleCurrentP763g8sb lacksNoLongerCurrentP763 staleCurrentImsr2xgr lacksNoLongerCurrentImsr staleCurrentVh2cdi00 lacksNoLongerCurrentVh2 staleCurrentXw41jhmv lacksNoLongerCurrentXw41 staleCurrentIbdxkpf7 lacksNoLongerCurrentIbdx staleCurrentL85gkygc lacksNoLongerCurrentL85 staleCurrentWiky18mm lacksNoLongerCurrentWiky
    staleCurrentH0j4119 lacksNoLongerCurrentH0j staleCurrentLpxw2099 lacksNoLongerCurrentLpxw staleCurrentW9775
    l9NamedCurrent pcjNamedCurrent lacksRebuild9Green staleRebuild8Green lacksMatchToyFailClosed
    matchMissingFrozen matchLacksSourceGreen matchLacksFailClosed matchClaimsNotFailClosed matchStaleInFlight
    ifMissingFrozen ifLacksSourceGreen ifRebuildLacksSourceGreen
    ifStaleInFlight ifStaleExclusiveLater staleFindWordNextLeftover lacksFindWordGreen
    ifLacksHasIf ifLacksIfToy
    ifStaleNotFailClosed ifStaleRejectIfNotFailClosed ifStaleIfToyNotFailClosed
    ifLacksIfThenElseFailClosed ifToyLacksFailClosed ifLacksRejectIfFailClosedLpxw
    siblingLeftoverNamed ifClaimsHookAbsent
    iteMissingFrozen iteLacksSourceGreen iteLacksNotHooked iteLacksHookPresent
    iteLacksHasIte iteLacksIteToy iteClaimsNotHookedWhileHooked
    iteLacksFailClosedLpxw staleIteHookNotFailClosed iteToyLacksFailClosed staleIteToyNotFailClosed
    decideMissingFrozen decideLacksSourceGreen decideLacksNotHooked
    decideClaimsNotHookedWhileHooked decideStaleNotFailClosed decideLacksFailClosed
    decideStaleHookInFlight decideLacksToyFailClosed decideStaleToyNotFailClosed
    condMissingFrozen condLacksSourceGreen condLacksInFlight
    condStaleSourceOnly condStaleHookInFlight condStaleNotFailClosed
    condLacksFailClosed condToyLacksFailClosed condStaleToyNotFailClosed condClaimsNotHookedWhileHooked
    ditMissingFrozen ditLacksSourceGreen ditLacksNotHooked
    ditClaimsNotHookedWhileHooked
    ditLacksHookGreen ditStaleHookInFlight ditStaleToyNotFailClosed
    ditStaleSourceNotFailClosed ditLacksFailClosed ditLacksToyFailClosed
    dcondMissingFrozen dcondLacksSourceGreen dcondLacksUnhooked
    dcondClaimsUnhookedWhileHooked dcondLacksNotHooked dcondClaimsNotHookedWhileHooked
    dcondStaleNotFailClosed dcondLacksFailClosed dcondLacksHookGreen dcondStaleHookInFlight
    dcondLacksToyFailClosed dcondClaimsToyNotFailClosed
    bifMissingFrozen bifLacksSourceGreen bifLacksNotHooked bifLacksHookGreen bifLacksExists326 bifClaimsNotHookedWhileHooked
    bifLacksToyFailClosed bifClaimsToyNotFailClosed
    orMissingFrozen orLacksSourceGreen orLacksUnhooked
    orClaimsUnhookedWhileHooked orStaleNotFailClosed orLacksFailClosed orLacksExists388
    orLacksHookGreen orStaleHookedNotFailClosed orStaleHookInFlight
    orStaleToyNotFailClosed orLacksToyFailClosed orClaimsBoolOrFailClosed
    andMissingFrozen andLacksSourceGreen andLacksUnhooked
    andClaimsUnhookedWhileHooked andStaleNotFailClosed andLacksFailClosed andLacksToyFailClosed
    andStaleToyNotFailClosed andStaleHookedNotFailClosed andLacksExists428
    notMissingFrozen notLacksSourceGreen notLacksUnhooked
    notClaimsUnhookedWhileHooked notStaleNotFailClosed notLacksFailClosed notLacksExists466
    notStaleToyNotFailClosed notLacksToyFailClosed
    lacksRebuild10Blocked staleRebuild10Green rebuild10StaleInFlight
    rebuild10LacksNixExit rebuild10LacksFinishUtc rebuild10LacksFindWord
    rebuild10LacksNoNewElf rebuild10LacksCqfMissing rebuild10LacksNotProof
    rebuild10LacksNotSampled rebuild10LacksClosureMods rebuild10LacksW9775
    rebuild10NamesNewElfSuccess staleTypedPassHookLeftover
    staleRebuild11InFlight lacksRebuild11Green staleRebuild11NotProof staleRebuild11NextLeftover
    staleRebuild12InFlight lacksRebuild12Green staleRebuild12NextLeftover
    staleRebuild13InFlight lacksRebuild13Green staleRebuild13NextLeftover
    staleRebuild14InFlight lacksRebuild14Green staleRebuild14NextLeftover
    staleRebuild15NextLeftover staleRebuild15InFlight staleRebuild15NoNewElf
    staleRebuild15NextBifLeftover staleRebuild15NextDcondLeftover lacksRebuild15Green
    staleRebuild16InFlight staleRebuild16NoNewElf lacksRebuild16Green
    staleRebuild16NextDcondLeftover staleRebuild17NextLeftover staleRebuild17InFlight
    lacksRebuild17Green staleRebuild18NextLeftover
    staleRebuild18HookRemaining staleRebuild18InFlight lacksRebuild18Green
    staleRebuild19NextLeftover staleRebuild19Blocked staleRebuild19SuccessorInFlight
    staleRebuild19AndToyNextLeftover staleRebuild19HookRemaining lacksRebuild19Green
    staleRebuild19WalkerOleanLeftover staleRebuild19EqSomeBinderLeftover staleRebuild19TypecheckDriverLeftover staleRebuild19EdmontonChainLeftover
    staleRebuild19HostFrontSuccessorInFlight staleRebuild19OldSuccessorInFlight
    staleRebuild20NextLeftover lacksRebuild20Green lacksTopScanNotLivingMiss staleTopScanOleanLivingMiss
    staleRebuild21NextLeftover lacksRebuild21Green staleXorToyStaysNotFailClosed lacksXorToyFailClosed staleResearchAfterXorInFlight staleRebuild22NextLeftover staleResearchAfterStrictOr lacksStrictAndLeftover staleRebuild24Green staleRebuild24InFlight staleRejectBneIdentNamed staleRejectBeqIdentNamed staleRejectBoolBeqIdentNamed staleBoolBneMissing staleBoolBneLanding staleBoolBneToyLeftover staleLeftoverIdentBne staleCurrentElfNickname staleResearchAfterStrictAnd staleSshBlockedLeftover staleRebuild23NextLeftover lacksRebuild23Green staleRebuild23InFlight staleS0sjpz1LeftoverNotCurrent staleIndependentlyReviewedWpc lacksIndependentlyReviewedS0 lacksStrictAndToyFailClosed lacksCompilePathLinearOnS0 staleTypedPassHookStrictAndLeftover lacksRejectStrictAndHookGreen staleStrictAndRejectMissing staleBoolStrictAndMissingLeftover lacksRejectStrictAndExists staleBoolStrictOrNextLeftover lacksRebuild22Green staleRebuild22InFlight staleRebuild22LeftoverNotGreen staleStrictOrToyStaysNotFailClosed lacksStrictOrToyFailClosed lacksCompilePathLinearOnWpc staleTypedPassHookStrictOrLeftover staleStrictOrRejectMissing staleRebuild21InFlight staleRebuild21LeftoverNotGreen staleXorUnhooked staleRebuild21XorUnhookedNextLeftover lacksXorHooked
    staleFranciscoUseCheckNamed
    staleIndependentlyReviewedVd819 staleCurrentVd819 lacksNoLongerCurrentVd819 staleBoolBeqDestLeftover staleBoolBeqSourceLand lacksBoolBeqDoneDest lacksBoolBeqToyCheckExit
    staleIndependentlyReviewed2b2 staleCurrent2b2 lacksNoLongerCurrent2b2 staleIndependentlyReviewedS7achs staleCurrentS7achs lacksNoLongerCurrentS7achs staleIndependentlyReviewedJzaimy staleCurrentJzaimy lacksNoLongerCurrentJzaimy staleIndependentlyReviewed4s8 staleCurrent4s8 lacksNoLongerCurrent4s8 stalePrefixNotLeftover lacksInfixOrToyCheckExit lacksRejectOrInfixDoneDest lacksRejectAndInfixDest lacksInfixAndToyCheckExit lacksInfixXorToyCheckExit lacksRejectXorInfixDoneDest lacksInfixBooleanTokensDestAndHook staleInfixAndResearchLeftover staleRejectXorInfixIdentNamed staleAndInfixHookLeftover staleRejectAndInfixIdentNamed staleBoolBeqResearchLeftover lacksPrefixNotToyCheckExit lacksRejectNotPrefixDoneDest staleRejectNotPrefixDestLeftover staleRejectBangNamed staleRejectNotPrefixIdentNamed
    lacksCompilePathLinear lacksCondToyFailClosed lacksDcondToyFailClosed
    ;
  inherit (ctx)
    fixture slice closure commentsOnlyNeedle allTypes ownsElab ownsHit ownsDrop fullHost
    occupancyN occupancyProbe50 occupancyProbe49
    hkLines ucLines frLines hfLines keptHitLines
    hostFrontText hostFrontHooked pinText pinLiveRelOk useCheckProgressN
    leftoverNeedleFails ifFindWordStructuralOk ifFindWordStaleCallOnLaptop
    franciscoUseCheckExists rejectBoolBneExists rejectBoolBneLines
    rejectBoolBeqExists rejectBoolBeqLines beqThmExists notPrefixExists
    orInfixExists andInfixExists xorInfixExists
    ifExists ifLines iteExists iteLines decideExists decideLines
    condExists condLines ditExists ditLines dcondExists dcondLines
    bifExists bifLines orExists orLines andExists andLines notExists notLines probeText probeHasBan
    ;
  flag = cond: msg: if cond then [ msg ] else [ ];
  mustFalse = v: lab: rel:
    if v == null then [ "missing living Bool ${lab} in ${rel}" ]
    else flag (v == true) "${lab} is true in ${rel} (must stay false)";
  needLines = rel: n:
    if n == null then [ "missing file: ${rel}" ]
    else flag (n > specs.lineFailOver) "${rel}: ${toString n} lines over ${toString specs.lineFailOver}";
in
  flag (!fixture.ok) "named allocate/free C: FAIL"
  ++ (
    if commentsOnlyNeedle.ok then
      [ specs.commentsOnlyNeedleGreenedMsg ]
    else
      [ ]
  )
  ++ flag (!slice.ok) "slice-copy gate: FAIL"
  ++ flag (!closure.ok) "bootstrap closure gate: FAIL"
  ++ mustFalse allTypes specs.allTypesName specs.useCheckRel
  ++ mustFalse ownsElab specs.ownsPkgName specs.elabMeetRel
  ++ mustFalse ownsHit specs.ownsPkgName specs.keptHitRel
  ++ mustFalse ownsDrop specs.ownsPkgName specs.keptDropRel
  ++ mustFalse fullHost "FullHost" specs.elabMeetRel
  ++ (
    if occupancyN == null then [ "missing occupancy names list in ${specs.occupancyWalkRel}" ]
    else flag (occupancyN == specs.occupancyFail || occupancyN != specs.occupancyStay)
      "occupancy names counted ${toString occupancyN} (must stay ${toString specs.occupancyStay}; fail closed at ${toString specs.occupancyFail})"
  )
  ++ flag occupancyProbe50 "${specs.occupancyProbeRel}: living occupancy length is 50"
  ++ flag (!occupancyProbe49) "${specs.occupancyProbeRel}: missing living occupancy length 49"
  ++ needLines specs.hostKernelRel hkLines
  ++ needLines specs.useCheckRel ucLines
  ++ needLines specs.franciscoRel frLines
  ++ needLines specs.hostFrontUseRel hfLines
  ++ (
    if hostFrontText == null then [ "missing file: ${specs.hostFrontRel}" ]
    else flag (!hostFrontHooked) "${specs.hostFrontRel}: missing ${specs.hostFrontParseNeedle}"
  )
  ++ (
    if pinText == null then [ "missing file: ${specs.pinRel}" ]
    else flag (!pinLiveRelOk) "${specs.pinRel}: missing liveRel UseCheck.lean"
  )
  ++ (
    if useCheckProgressN == null then [ "missing UseCheck progress slice in ${specs.franciscoRel}" ]
    else flag (useCheckProgressN < specs.progressQuoted)
      "UseCheck progress ${toString useCheckProgressN} of ${toString specs.progressDenom} below quoted floor ${toString specs.progressQuoted} of ${toString specs.progressDenom} (live remaining-distance eval this turn; batch-eleven L2 MISSING; constructor growth stays BLOCKED)"
  )
  ++ leftoverNeedleFails
  ++ flag bneMissingFrozen
    "rebuild9GreenRow hardcodes ${specs.bneMissingFrozenNeedle} while ${specs.bneRel} exists (recap lie)"
  ++ flag bneLacksSourceGreen
    "${specs.bneRel} exists but living bne row omits RejectBne source GREEN"
  ++ flag bneLacksFailClosed
    "${specs.bneRel} exists but living bne row omits ${specs.bneFailClosedNeedle}"
  ++ flag bneClaimsNotFailClosed
    "living bne row claims != is not fail-closed (rebuild 9 GREEN is still fail-closed on != / bne)"
  ++ flag bneStaleLater
    "living bne row still says exclusive ELF check is later (rebuild 9 GREEN)"
  ++ flag bneStaleInFlight
    "living summary still says rebuild 8 in flight (rebuild 9 GREEN on w9775kbs)"
  ++ flag rebuild9StaleInFlight
    "living summary still says rebuild 9 in flight (rebuild 9 GREEN on w9775kbs)"
  ++ flag currentLacksS0sjpz1
    "living rebuild rows omit the current independently reviewed ELF store hash / 149467016 bytes"
  ++ flag staleCurrentWpc482yn
    "living summary still names wpc482yn as current (wpc482yn is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentWpc
    "rebuild23GreenRow or rebuild22GreenRow omits wpc482yn is no longer current"
  ++ flag staleCurrentIldbshq8
    "living summary still names ildbshq8 as current (ildbshq8 is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentIldb
    "rebuild22GreenRow or rebuild21GreenRow omits ildbshq8 is no longer current"
  ++ flag staleCurrentL04l55ig
    "living summary still names l04l55ig as current (l04l55ig is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentL04
    "rebuild21GreenRow or rebuild20GreenRow omits l04l55ig is no longer current"
  ++ flag staleCurrentP763g8sb
    "living summary still names p763g8sb as current (p763g8sb is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentP763
    "rebuild20GreenRow or rebuild19GreenRow omits p763g8sb is no longer current"
  ++ flag staleCurrentImsr2xgr
    "living summary still names imsr2xgr as current (imsr2xgr is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentImsr
    "rebuild19GreenRow or rebuild18GreenRow omits imsr2xgr is no longer current"
  ++ flag staleCurrentVh2cdi00
    "living summary still names vh2cdi00 as current (vh2cdi00 is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentVh2
    "rebuild18GreenRow or rebuild17GreenRow omits vh2cdi00 is no longer current"
  ++ flag staleCurrentXw41jhmv
    "living summary still names xw41jhmv as current (xw41jhmv is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentXw41
    "rebuild17GreenRow or rebuild16GreenRow omits xw41jhmv is no longer current"
  ++ flag staleCurrentIbdxkpf7
    "living summary still names ibdxkpf7 as current (ibdxkpf7 is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentIbdx
    "rebuild16GreenRow or rebuild15GreenRow omits ibdxkpf7 is no longer current"
  ++ flag staleCurrentL85gkygc
    "living summary still names l85gkygc as current (l85gkygc is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentL85
    "rebuild14GreenRow or rebuild15GreenRow or rebuild16GreenRow omits l85gkygc is no longer current"
  ++ flag staleCurrentWiky18mm
    "living summary still names wiky18mm as current (wiky18mm is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentWiky
    "rebuild13GreenRow or rebuild14GreenRow omits wiky18mm is no longer current"
  ++ flag staleCurrentH0j4119
    "living summary still names h0j4119d as current (h0j4119d is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentH0j
    "rebuild12GreenRow or rebuild13GreenRow or rebuild14GreenRow omits h0j4119d is no longer current"
  ++ flag staleCurrentLpxw2099
    "living summary still names lpxw2099 as current (lpxw2099 is no longer current; the current produced slake-bootstrap ELF)"
  ++ flag lacksNoLongerCurrentLpxw
    "rebuild13GreenRow or rebuild14GreenRow omits lpxw2099 is no longer current"
  ++ flag staleCurrentW9775
    "living summary still names w9775kbs as current (the current produced slake-bootstrap ELF)"
  ++ flag l9NamedCurrent
    "rebuild9GreenRow names l9l72744 as current (must stay not l9l72744)"
  ++ flag pcjNamedCurrent
    "rebuild9GreenRow names pcj0rbgi as current (must stay not pcj0rbgi)"
  ++ flag lacksRebuild9Green
    "living summary omits Rebuild 9 GREEN"
  ++ flag staleRebuild8Green
    "living summary still says Rebuild 8 GREEN (the current produced slake-bootstrap ELF)"
  ++ flag lacksMatchToyFailClosed
    "rebuild9GreenRow omits MatchToy CHECK_EXIT 1 fail-closed on Bool-valued match"
  ++ flag matchMissingFrozen
    "rebuild9GreenRow hardcodes ${specs.matchMissingFrozenNeedle} while ${specs.matchRel} exists (recap lie)"
  ++ flag matchLacksSourceGreen
    "${specs.matchRel} exists but living match row omits RejectMatch source GREEN"
  ++ flag matchLacksFailClosed
    "${specs.matchRel} exists but living match row omits ${specs.matchFailClosedNeedle}"
  ++ flag matchClaimsNotFailClosed
    "living match row claims match is not fail-closed (rebuild 9 GREEN is fail-closed on Bool-valued match)"
  ++ flag matchStaleInFlight
    "living match row still says RejectMatch source in flight (rebuild 9 GREEN)"
  ++ flag ifMissingFrozen
    "rebuild9GreenRow hardcodes ${specs.ifMissingFrozenNeedle} while ${specs.ifRel} exists (recap lie)"
  ++ flag ifLacksSourceGreen
    "${specs.ifRel} exists but living if row omits ${specs.ifSourceGreenNeedle}"
  ++ flag ifRebuildLacksSourceGreen
    "${specs.ifRel} exists but rebuild9GreenRow omits ${specs.ifSourceGreenNeedle}"
  ++ flag ifStaleInFlight
    "living if row still says ${specs.ifInFlightNeedle} (RejectIf source GREEN)"
  ++ flag ifStaleExclusiveLater
    "living summary still says ${specs.ifExclusiveLaterNeedle} (Rebuild 20 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleFindWordNextLeftover
    "living summary still says next leftover is findWord (findWord leftover is historical; Rebuild 17 GREEN)"
  ++ flag lacksFindWordGreen
    "${specs.ifRel} exists but living summary omits findWord GREEN"
  ++ flag (!ifFindWordStructuralOk && ifExists)
    "${specs.ifRel} exists but omits structural-tail findWord (skipIdent rest)"
  ++ flag ifFindWordStaleCallOnLaptop
    "${specs.ifRel} still has findWord w (skipIdent (c :: rest)) (findWord GREEN requires skipIdent rest)"
  ++ flag ifLacksHasIf
    "${specs.ifRel} exists but omits ${specs.ifHasIfNeedle}"
  ++ flag ifLacksIfToy
    "${specs.ifRel} exists but omits ${specs.ifToyDefNeedle} or ${specs.ifToyTextNeedle}"
  ++ flag ifStaleNotFailClosed
    "living summary still says if then else is not fail-closed (IfToy fail-closed on ELF wiky18mm)"
  ++ flag ifStaleRejectIfNotFailClosed
    "living summary still says RejectIf not fail-closed on w9775kbs (RejectIf fail-closed on wiky18mm)"
  ++ flag ifStaleIfToyNotFailClosed
    "living summary still says IfToy is not fail-closed (IfToy fail-closed on ELF wiky18mm)"
  ++ flag ifLacksIfThenElseFailClosed
    "living summary omits if then else is fail-closed (Rebuild 17 GREEN on ELF vh2cdi00)"
  ++ flag ifToyLacksFailClosed
    "living summary omits IfToy fail-closed (Rebuild 17 GREEN on ELF vh2cdi00)"
  ++ flag ifLacksRejectIfFailClosedLpxw
    "living summary omits RejectIf fail-closed on wiky18mm"
  ++ flag siblingLeftoverNamed
    "living summary names decide (1 = 1) or cond (1 = 1) true false as leftover (research in flight; not current leftover)"
  ++ flag ifClaimsHookAbsent
    "living summary claims ${specs.ifHookAbsentNeedle} while ${specs.keptHitRel} has ${specs.ifHookRejectsNeedle}"
  ++ flag iteMissingFrozen
    "living summary hardcodes ${specs.iteMissingFrozenNeedle} while ${specs.iteRel} exists (recap lie)"
  ++ flag iteLacksSourceGreen
    "${specs.iteRel} exists but living summary omits ${specs.iteSourceGreenNeedle}"
  ++ flag iteLacksNotHooked
    "${specs.iteRel} exists unhooked but living summary omits ${specs.iteNotHookedNeedle}"
  ++ flag iteLacksHookPresent
    "${specs.iteRel} hook is present on laptop but living summary omits ${specs.iteHookPresentNeedle}"
  ++ flag iteLacksHasIte
    "${specs.iteRel} exists but omits ${specs.iteHasIteNeedle}"
  ++ flag iteLacksIteToy
    "${specs.iteRel} exists but omits ${specs.iteToyDefNeedle} or ${specs.iteToyTextNeedle}"
  ++ flag iteClaimsNotHookedWhileHooked
    "living summary claims ${specs.iteNotHookedNeedle} while ${specs.keptHitRel} has ${specs.iteHookRejectsNeedle}"
  ++ flag iteLacksFailClosedLpxw
    "living summary omits RejectIte fail-closed on wiky18mm"
  ++ flag staleIteHookNotFailClosed
    "living summary still says RejectIte hook GREEN not fail-closed on h0j4119d (IteToy fail-closed on ELF wiky18mm)"
  ++ flag iteToyLacksFailClosed
    "living summary omits IteToy fail-closed (Rebuild 17 GREEN on ELF vh2cdi00)"
  ++ flag staleIteToyNotFailClosed
    "living summary still says IteToy is not fail-closed (IteToy fail-closed on ELF wiky18mm)"
  ++ flag decideMissingFrozen
    "living summary hardcodes ${specs.decideMissingFrozenNeedle} while ${specs.decideRel} exists (recap lie)"
  ++ flag decideLacksSourceGreen
    "${specs.decideRel} exists but living summary omits ${specs.decideSourceGreenNeedle}"
  ++ flag decideLacksNotHooked
    "${specs.decideRel} exists unhooked but living summary omits ${specs.decideNotHookedNeedle}"
  ++ flag decideClaimsNotHookedWhileHooked
    "living summary claims ${specs.decideNotHookedNeedle} while ${specs.keptHitRel} has ${specs.decideHookRejectsNeedle}"
  ++ flag decideStaleNotFailClosed
    "living summary still says RejectDecideAscription source GREEN not fail-closed (RejectDecideAscription fail-closed on wiky18mm)"
  ++ flag decideLacksFailClosed
    "living summary omits RejectDecideAscription fail-closed on wiky18mm"
  ++ flag decideStaleHookInFlight
    "living decide row still says hook in flight (RejectDecideAscription fail-closed on wiky18mm)"
  ++ flag decideLacksToyFailClosed
    "living summary omits DecideAscriptionToy fail-closed"
  ++ flag decideStaleToyNotFailClosed
    "living summary still says decideAscriptionToy is not fail-closed (DecideAscriptionToy fail-closed on wiky18mm)"
  ++ flag condMissingFrozen
    "living summary hardcodes ${specs.condMissingFrozenNeedle} while ${specs.condRel} exists (recap lie)"
  ++ flag condLacksSourceGreen
    "${specs.condRel} exists but living summary omits ${specs.condSourceGreenNeedle}"
  ++ flag condLacksInFlight
    "${specs.condRel} exists unhooked but living summary omits ${specs.condInFlightNeedle}"
  ++ flag condStaleSourceOnly
    "living summary still says source-only in flight (RejectCond fail-closed historically on l85gkygc)"
  ++ flag condStaleHookInFlight
    "living cond row still says hook in flight (RejectCond fail-closed historically on l85gkygc)"
  ++ flag condStaleNotFailClosed
    "living summary still says RejectCond source GREEN not fail-closed (RejectCond fail-closed historically on l85gkygc)"
  ++ flag condLacksFailClosed
    "living summary omits RejectCond fail-closed on l85gkygc"
  ++ flag condToyLacksFailClosed
    "living summary omits CondToy fail-closed"
  ++ flag condStaleToyNotFailClosed
    "living summary still says condToy is not fail-closed (CondToy fail-closed historically)"
  ++ flag condClaimsNotHookedWhileHooked
    "living summary claims ${specs.condNotHookedNeedle} while ${specs.keptHitRel} has ${specs.condHookRejectsNeedle}"
  ++ flag ditMissingFrozen
    "living summary hardcodes ${specs.ditMissingFrozenNeedle} while ${specs.ditRel} exists (recap lie)"
  ++ flag ditLacksSourceGreen
    "${specs.ditRel} exists but living summary omits ${specs.ditSourceGreenNeedle}"
  ++ flag ditLacksNotHooked
    "${specs.ditRel} exists unhooked but living summary omits ${specs.ditNotHookedNeedle}"
  ++ flag ditClaimsNotHookedWhileHooked
    "living summary claims ${specs.ditNotHookedNeedle} while ${specs.keptHitRel} has ${specs.ditHookRejectsNeedle}"
  ++ flag ditStaleSourceNotFailClosed
    "living summary still says RejectDite source GREEN not fail-closed on l85gkygc (DiteToy fail-closed on ELF vh2cdi00)"
  ++ flag ditLacksHookGreen
    "living summary omits RejectDite hook GREEN in source"
  ++ flag ditStaleHookInFlight
    "living summary still says hook in flight for RejectDite (RejectDite hook GREEN in source; Rebuild 15 GREEN)"
  ++ flag ditStaleToyNotFailClosed
    "living summary still says diteToy is not fail-closed on ELF l85gkygc (DiteToy fail-closed on ELF vh2cdi00)"
  ++ flag ditLacksFailClosed
    "living summary omits RejectDite fail-closed"
  ++ flag ditLacksToyFailClosed
    "living summary omits DiteToy fail-closed on ELF vh2cdi00"
  ++ flag dcondMissingFrozen
    "living summary hardcodes ${specs.dcondMissingFrozenNeedle} while ${specs.dcondRel} exists (recap lie)"
  ++ flag dcondLacksSourceGreen
    "${specs.dcondRel} exists but living summary omits ${specs.dcondSourceGreenNeedle}"
  ++ flag dcondLacksUnhooked
    "${specs.dcondRel} exists unhooked but living summary omits ${specs.dcondUnhookedNeedle}"
  ++ flag dcondClaimsUnhookedWhileHooked
    "living summary claims ${specs.dcondUnhookedNeedle} while ${specs.keptHitRel} has ${specs.dcondHookRejectsNeedle}"
  ++ flag dcondLacksNotHooked
    "${specs.dcondRel} exists unhooked but living summary omits ${specs.dcondNotHookedNeedle}"
  ++ flag dcondClaimsNotHookedWhileHooked
    "living summary claims ${specs.dcondNotHookedNeedle} while ${specs.keptHitRel} has ${specs.dcondHookRejectsNeedle}"
  ++ flag dcondStaleNotFailClosed
    "living summary still says RejectDcond source GREEN not fail-closed (DcondToy fail-closed on ELF vh2cdi00)"
  ++ flag dcondLacksFailClosed
    "living summary omits RejectDcond fail-closed"
  ++ flag dcondLacksHookGreen
    "living summary omits RejectDcond hook GREEN in source"
  ++ flag dcondStaleHookInFlight
    "living summary still says RejectDcond hook in flight (RejectDcond hook GREEN in source; Rebuild 17 GREEN)"
  ++ flag dcondLacksToyFailClosed
    "living summary omits DcondToy fail-closed on ELF vh2cdi00"
  ++ flag dcondClaimsToyNotFailClosed
    "living summary still says dcondToy is not fail-closed (DcondToy fail-closed on ELF vh2cdi00)"
  ++ flag bifMissingFrozen
    "living summary hardcodes ${specs.bifMissingFrozenNeedle} while ${specs.bifRel} exists (recap lie)"
  ++ flag bifLacksSourceGreen
    "${specs.bifRel} exists but living summary omits ${specs.bifSourceGreenNeedle}"
  ++ flag bifLacksNotHooked
    "${specs.bifRel} exists unhooked but living summary omits ${specs.bifNotHookedNeedle}"
  ++ flag bifLacksHookGreen
    "living summary omits RejectBif hook GREEN in source"
  ++ flag bifLacksExists326
    "${specs.bifRel} exists but living summary omits ${specs.bifExists326Needle}"
  ++ flag bifClaimsNotHookedWhileHooked
    "living summary claims ${specs.bifNotHookedNeedle} while ${specs.keptHitRel} has ${specs.bifHookRejectsNeedle}"
  ++ flag bifLacksToyFailClosed
    "living summary omits BifToy fail-closed on ELF vh2cdi00"
  ++ flag bifClaimsToyNotFailClosed
    "living summary still says bifToy is not fail-closed (BifToy fail-closed on ELF vh2cdi00; Rebuild 17 GREEN)"
  ++ flag orMissingFrozen
    "living summary hardcodes ${specs.orMissingFrozenNeedle} while ${specs.orRel} exists (recap lie)"
  ++ flag orLacksSourceGreen
    "${specs.orRel} exists but living summary omits ${specs.orSourceGreenNeedle}"
  ++ flag orLacksUnhooked
    "${specs.orRel} exists unhooked but living summary omits ${specs.orUnhookedNeedle}"
  ++ flag orClaimsUnhookedWhileHooked
    "living summary claims ${specs.orUnhookedNeedle} while ${specs.keptHitRel} has ${specs.orHookRejectsNeedle}"
  ++ flag orStaleNotFailClosed
    "living summary still says RejectOr source GREEN not fail-closed (RejectOr fail-closed; OrToy fail-closed on ELF imsr2xgr)"
  ++ flag orLacksFailClosed
    "living summary omits RejectOr fail-closed"
  ++ flag orLacksExists388
    "${specs.orRel} exists but living summary omits ${specs.orExists388Needle}"
  ++ flag orLacksHookGreen
    "living summary omits RejectOr hook GREEN in source"
  ++ flag orStaleHookedNotFailClosed
    "living summary still says RejectOr hooked in source not fail-closed on this ELF (OrToy fail-closed on ELF imsr2xgr)"
  ++ flag orStaleHookInFlight
    "living summary still says RejectOr hook in flight (RejectOr hook GREEN in source; Rebuild 18 GREEN)"
  ++ flag orStaleToyNotFailClosed
    "living summary still says orToy is not fail-closed on ELF vh2cdi00 (OrToy fail-closed on ELF imsr2xgr)"
  ++ flag orLacksToyFailClosed
    "living summary omits OrToy fail-closed on ELF imsr2xgr"
  ++ flag orClaimsBoolOrFailClosed
    "living summary claims Bool.or fail-closed (meter names OrToy fail-closed; do not claim Bool.or fail-closed as a separate living cell)"
  ++ flag andMissingFrozen
    "living summary hardcodes ${specs.andMissingFrozenNeedle} while ${specs.andRel} exists (recap lie)"
  ++ flag andLacksSourceGreen
    "${specs.andRel} exists but living summary omits ${specs.andSourceGreenNeedle}"
  ++ flag andLacksUnhooked
    "${specs.andRel} exists unhooked but living summary omits ${specs.andUnhookedNeedle}"
  ++ flag andClaimsUnhookedWhileHooked
    "living summary claims ${specs.andUnhookedNeedle} while ${specs.keptHitRel} has ${specs.andHookRejectsNeedle}"
  ++ flag andStaleNotFailClosed
    "living summary still says RejectAnd source GREEN not fail-closed (RejectAnd fail-closed; AndToy fail-closed on ELF p763g8sb)"
  ++ flag andLacksFailClosed
    "living summary omits RejectAnd fail-closed"
  ++ flag andLacksToyFailClosed
    "living summary omits AndToy fail-closed on ELF p763g8sb"
  ++ flag andStaleToyNotFailClosed
    "living summary still says andToy is not fail-closed (AndToy fail-closed on ELF p763g8sb)"
  ++ flag andStaleHookedNotFailClosed
    "living summary still says RejectAnd hooked in source not fail-closed on this ELF (AndToy fail-closed on ELF p763g8sb)"
  ++ flag andLacksExists428
    "${specs.andRel} exists but living summary omits ${specs.andExists428Needle}"
  ++ flag notMissingFrozen
    "living summary hardcodes ${specs.notMissingFrozenNeedle} while ${specs.notRel} exists (recap lie)"
  ++ flag notLacksSourceGreen
    "${specs.notRel} exists but living summary omits ${specs.notSourceGreenNeedle}"
  ++ flag notLacksUnhooked
    "${specs.notRel} exists unhooked but living summary omits ${specs.notUnhookedNeedle}"
  ++ flag notClaimsUnhookedWhileHooked
    "living summary claims ${specs.notUnhookedNeedle} while ${specs.keptHitRel} has ${specs.notHookRejectsNeedle}"
  ++ flag notStaleNotFailClosed
    "living summary still says RejectNot source GREEN not fail-closed (RejectNot fail-closed; notToy fail-closed on ELF l04l55ig)"
  ++ flag notLacksFailClosed
    "living summary omits RejectNot fail-closed"
  ++ flag notLacksExists466
    "${specs.notRel} exists but living summary omits ${specs.notExists466Needle}"
  ++ flag notStaleToyNotFailClosed
    "living summary still says notToy stays not fail-closed (notToy fail-closed on ELF l04l55ig)"
  ++ flag notLacksToyFailClosed
    "living summary omits notToy fail-closed on ELF l04l55ig"
  ++ flag lacksRebuild10Blocked
    "living summary omits Rebuild 10 BLOCKED"
  ++ flag staleRebuild10Green
    "living summary claims Rebuild 10 GREEN (Nix EXIT 1; no NEW ELF)"
  ++ flag rebuild10StaleInFlight
    "living summary still says rebuild 10 in flight (Rebuild 10 BLOCKED)"
  ++ flag rebuild10LacksNixExit
    "rebuild10BlockedRow omits Nix EXIT 1"
  ++ flag rebuild10LacksFinishUtc
    "rebuild10BlockedRow omits FINISH_UTC 2026-10-17T10:45:56Z"
  ++ flag rebuild10LacksFindWord
    "rebuild10BlockedRow omits findWord w (skipIdent (c :: rest))"
  ++ flag rebuild10LacksNoNewElf
    "rebuild10BlockedRow omits no NEW ELF"
  ++ flag rebuild10LacksCqfMissing
    "rebuild10BlockedRow omits cqf0iqzs missing"
  ++ flag rebuild10LacksNotProof
    "living summary omits that w9775kbs is not a rebuild-10 proof"
  ++ flag rebuild10LacksNotSampled
    "rebuild10BlockedRow omits IfToy and CompilePathLinear not sampled on a NEW ELF"
  ++ flag rebuild10LacksClosureMods
    "rebuild10BlockedRow omits closureMods line 233"
  ++ flag rebuild10LacksW9775
    "rebuild10BlockedRow omits historical ELF w9775kbs (not current; not a rebuild-10 proof)"
  ++ flag rebuild10NamesNewElfSuccess
    "rebuild10BlockedRow names cqf0iqzs without missing (no NEW ELF)"
  ++ flag staleTypedPassHookLeftover
    "living summary still says next leftover is typedPass hook then exclusive --slake-check of ifToy (Rebuild 17 GREEN)"
  ++ flag staleRebuild11InFlight
    "living summary still says rebuild 11 exclusive in flight (Rebuild 11 GREEN; h0j4119d is no longer current)"
  ++ flag lacksRebuild11Green
    "living summary omits Rebuild 11 GREEN"
  ++ flag staleRebuild11NotProof
    "living summary still says not a rebuild-11 proof (Rebuild 11 GREEN)"
  ++ flag staleRebuild11NextLeftover
    "living summary still says next leftover is exclusive Nix of rebuild 11 then IfToy (Rebuild 17 GREEN)"
  ++ flag staleRebuild12InFlight
    "living summary still says rebuild 12 exclusive in flight (Rebuild 12 GREEN; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild12Green
    "living summary omits Rebuild 12 GREEN"
  ++ flag staleRebuild12NextLeftover
    "living summary still says next leftover is exclusive Nix of rebuild 12 then IteToy (Rebuild 17 GREEN)"
  ++ flag staleRebuild13InFlight
    "living summary still says rebuild 13 in flight (Rebuild 13 GREEN; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild13Green
    "living summary omits Rebuild 13 GREEN"
  ++ flag staleRebuild13NextLeftover
    "living summary still says next leftover is decide-ascription typedPass hook then exclusive rebuild 13 (Rebuild 17 GREEN)"
  ++ flag staleRebuild14InFlight
    "living summary still says rebuild 14 in flight (Rebuild 14 GREEN; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild14Green
    "living summary omits Rebuild 14 GREEN"
  ++ flag staleRebuild14NextLeftover
    "living summary still says next leftover is RejectCond typedPass hook then exclusive rebuild 14 (Rebuild 17 GREEN)"
  ++ flag staleRebuild15NextLeftover
    "living summary still says next leftover is RejectDite typedPass hook then exclusive rebuild 15 (Rebuild 17 GREEN; DiteToy fail-closed on vh2cdi00)"
  ++ flag staleRebuild15InFlight
    "living summary still says rebuild 15 exclusive in flight (Rebuild 15 GREEN; not in flight)"
  ++ flag staleRebuild15NoNewElf
    "living summary still says rebuild 15 no NEW ELF (Rebuild 15 GREEN produced historical ibdxkpf7; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild15NextBifLeftover
    "living summary still says next leftover is RejectBif hook after exclusive rebuild 15 diteToy (RejectBif hook GREEN in source; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild15NextDcondLeftover
    "living summary still says next leftover is RejectDcond hook after exclusive rebuild 15 diteToy (Rebuild 19 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild15Green
    "living summary omits Rebuild 15 GREEN"
  ++ flag staleRebuild16InFlight
    "living summary still says rebuild 16 exclusive in flight (Rebuild 16 GREEN; not in flight; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild16NoNewElf
    "living summary still says rebuild 16 no NEW ELF (Rebuild 16 GREEN produced historical xw41jhmv; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild16Green
    "living summary omits Rebuild 16 GREEN"
  ++ flag staleRebuild16NextDcondLeftover
    "living summary still says next leftover is RejectDcond hook after exclusive rebuild 16 bifToy (${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild17NextLeftover
    "living summary still says next leftover is RejectDcond hook then exclusive rebuild 17 (Rebuild 19 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild17InFlight
    "living summary still says rebuild 17 exclusive in flight (Rebuild 17 GREEN; not in flight; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild17Green
    "living summary omits Rebuild 17 GREEN"
  ++ flag staleRebuild18NextLeftover
    "living summary still says next leftover is exclusive rebuild 18, then RejectAnd hook (Rebuild 18 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild18HookRemaining
    "living summary still says next leftover is RejectOr hook then exclusive rebuild 18 (RejectOr hook GREEN in source; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild18InFlight
    "living summary still says rebuild 18 exclusive in flight (Rebuild 18 GREEN; not in flight; the current produced slake-bootstrap ELF)"
  ++ flag lacksRebuild18Green
    "living summary omits Rebuild 18 GREEN"
  ++ flag staleRebuild19NextLeftover
    "living summary still says next leftover is rebuild 19 Nix EXIT 1 BLOCKED (Rebuild 19 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild19Blocked
    "living summary still says rebuild 19 Nix EXIT 1 BLOCKED (Rebuild 19 GREEN on ELF p763g8sb; TopScan.olean is not the living miss)"
  ++ flag staleRebuild19SuccessorInFlight
    "living summary still says successor exclusive Nix retry is in flight (Rebuild 19 GREEN; not in flight)"
  ++ flag staleRebuild19AndToyNextLeftover
    "living summary still says next leftover is exclusive rebuild 19 of andToy (Rebuild 19 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild19HookRemaining
    "living summary still says next leftover is RejectAnd hook then exclusive rebuild 19 (RejectAnd fail-closed; ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild19Green
    "living summary omits Rebuild 19 GREEN"
  ++ flag staleRebuild19WalkerOleanLeftover
    "living summary still names Walker.olean of module SystemsLean.Walker does not exist in the KeptDrop-tree as the living miss (Walker is in closureMods; TopScan.olean is not the living miss; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild19EqSomeBinderLeftover
    "living summary still names EqSomeBinder-place.drv builder failed due to signal 9 as the living miss (signal 9 count 0; TopScan.olean is not the living miss; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild19TypecheckDriverLeftover
    "living summary still says TypecheckDriver.lean missing on the builder (TypecheckDriver compiled on the last Nix; TopScan.olean is not the living miss; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild19EdmontonChainLeftover
    "living summary still says builder HostFront.lean still import SystemsLean.EdmontonChain (HostFront copy stayed landed; TopScan.olean is not the living miss; the current produced slake-bootstrap ELF)"
  ++ flag staleRebuild19HostFrontSuccessorInFlight
    "living summary still says successor exclusive rebuild 01a14b51-a32d-76b6-8bf1-6440c795da2f in flight (that successor finished BLOCKED; Rebuild 19 GREEN)"
  ++ flag staleRebuild19OldSuccessorInFlight
    "living summary still says successor exclusive rebuild 01a14b42-3920-7237-ac2c-f46734480426 in flight (that successor finished BLOCKED; Rebuild 19 GREEN)"
  ++ flag staleRebuild20NextLeftover
    "living summary still says next leftover is rebuild 20 of notToy (Rebuild 20 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild20Green
    "living summary omits Rebuild 20 GREEN"
  ++ flag lacksTopScanNotLivingMiss
    "living summary omits TopScan.olean is not the living miss"
  ++ flag staleTopScanOleanLivingMiss
    "living summary still names TopScan.olean of module SystemsLean.TopScan does not exist in the KeptDrop-tree as the living miss (Rebuild 20 GREEN; TopScan.olean is not the living miss; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild21NextLeftover
    "living summary still says next leftover is rebuild 21 of xorToy (Rebuild 21 GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild21Green
    "living summary omits Rebuild 21 GREEN"
  ++ flag staleXorToyStaysNotFailClosed
    "living summary still says xorToy stays not fail-closed (xorToy fail-closed on ELF ildbshq8)"
  ++ flag lacksXorToyFailClosed
    "living summary omits xorToy fail-closed (CHECK_EXIT 1, banner kept reject) on ELF ildbshq8"
  ++ flag staleResearchAfterXorInFlight
    "living summary still says next leftover is research after xor in flight (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild22NextLeftover
    "living summary still says next leftover is exclusive rebuild 22 of a strictOr toy (Rebuild 22 GREEN; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleResearchAfterStrictOr
    "living summary still says next leftover is research of the next typedPass leftover after strictOr (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksStrictAndLeftover
    "living summary omits ${specs.strictAndLeftoverNeedle}"
  ++ flag staleRebuild24Green
    "living summary names Rebuild 24 GREEN (rebuild 24 BLOCKED; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild24InFlight
    "living summary still names exclusive rebuild 24 of a Bool.bne toy as in flight or waiting for a NEW store path (rebuild 24 is a prior miss BLOCKED; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectBneIdentNamed
    "living summary still names the retired packed module (old Ident-suffix path missing; Bool.bne lives in RejectBoolBne; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectBeqIdentNamed
    "living summary still names an Ident-suffix beq dest (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectBoolBeqIdentNamed
    "living summary still names an Ident-suffix Bool.beq dest (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleBoolBneMissing
    "living leftover still names RejectBoolBne.lean as absent (RejectBoolBne.lean EXISTS (rename GREEN); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleBoolBneLanding
    "living leftover still says rename L2 is landing RejectBoolBne.lean (RejectBoolBne.lean EXISTS (rename GREEN); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleBoolBneToyLeftover
    "living leftover still names exclusive rebuild of a Bool.bne toy (RejectBoolBne is done dest; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleLeftoverIdentBne
    "living leftover still names leftover identifier bne / Bool.bne (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrentElfNickname
    "living summary nicknames the current produced slake-bootstrap ELF by an 8-character store hash (quote the full store path, then the current produced slake-bootstrap ELF)"
  ++ flag staleResearchAfterStrictAnd
    "living summary still names research-after-strictAnd as the living leftover (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag (!rejectBoolBneExists)
    "RejectBoolBne.lean disk absent (rename GREEN expected EXISTS 528)"
  ++ flag (rejectBoolBneExists && rejectBoolBneLines != null && rejectBoolBneLines > specs.lineFailOver)
    "RejectBoolBne.lean lines over ${toString specs.lineFailOver}"
  ++ flag (!rejectBoolBeqExists)
    "RejectBoolBeq.lean disk absent (dest RejectBoolBeq.lean done dest expected EXISTS 531)"
  ++ flag (rejectBoolBeqExists && rejectBoolBeqLines != null && rejectBoolBeqLines > specs.lineFailOver)
    "RejectBoolBeq.lean lines over ${toString specs.lineFailOver}"
  ++ flag (!beqThmExists)
    "RejectBeqThm.lean disk absent (Token == already lives in RejectBeqThm)"
  ++ flag (!notPrefixExists)
    "RejectNotPrefix.lean disk absent (dest RejectNotPrefix.lean done dest)"
  ++ flag (!orInfixExists)
    "RejectOrInfix.lean disk absent (dest RejectOrInfix.lean done dest)"
  ++ flag (!andInfixExists)
    "RejectAndInfix.lean disk absent (dest RejectAndInfix.lean done dest)"
  ++ flag (!xorInfixExists)
    "RejectXorInfix.lean disk absent (dest RejectXorInfix.lean done dest)"
  ++ flag staleSshBlockedLeftover
    "living summary still names leftover as SSH BLOCKED independent resample (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild23NextLeftover
    "living summary still says next leftover is exclusive rebuild 23 of a strictAnd toy (Nix is not still live; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild23Green
    "living summary omits Rebuild 23 GREEN"
  ++ flag staleRebuild23InFlight
    "living summary still says rebuild 23 exclusive in flight (Nix is not still live; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleS0sjpz1LeftoverNotCurrent
    "living summary still names the current produced slake-bootstrap ELF as leftover, not current"
  ++ flag staleIndependentlyReviewedWpc
    "living summary still names current independently reviewed ELF /nix/store/wpc482ynsqa9ambfszvjabmfrsdj2408-slake-bootstrap (wpc482yn is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksIndependentlyReviewedS0
    "living summary omits current independently reviewed ELF /nix/store/97p32bdbdw6v79yxydi1y4s4s39ksp8j-slake-bootstrap"
  ++ flag staleIndependentlyReviewed4s8
    "living summary still names current independently reviewed ELF /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrent4s8
    "living summary still names /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap as current (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksNoLongerCurrent4s8
    "living summary omits /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap (149447232 bytes) is no longer current"
  ++ flag staleIndependentlyReviewedJzaimy
    "living summary still names current independently reviewed ELF /nix/store/jzaimy5hq45h12h1905ajk1qyjgdjjia-slake-bootstrap (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrentJzaimy
    "living summary still names /nix/store/jzaimy5hq45h12h1905ajk1qyjgdjjia-slake-bootstrap as current (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksNoLongerCurrentJzaimy
    "living summary omits /nix/store/jzaimy5hq45h12h1905ajk1qyjgdjjia-slake-bootstrap (149423320 bytes) is no longer current"
  ++ flag staleIndependentlyReviewedS7achs
    "living summary still names current independently reviewed ELF /nix/store/s7achs1g5mlxdwk92a6mqnpxwz19c0mz-slake-bootstrap (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrentS7achs
    "living summary still names /nix/store/s7achs1g5mlxdwk92a6mqnpxwz19c0mz-slake-bootstrap as current (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksNoLongerCurrentS7achs
    "living summary omits /nix/store/s7achs1g5mlxdwk92a6mqnpxwz19c0mz-slake-bootstrap (149403616 bytes) is no longer current"
  ++ flag stalePrefixNotLeftover
    "living summary still names leftover as next typedPass after prefix not, research in flight (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksInfixOrToyCheckExit
    "living summary omits infix || toy CHECK_EXIT 1 kept reject"
  ++ flag lacksRejectOrInfixDoneDest
    "living summary omits RejectOrInfix.lean EXISTS (done dest)"
  ++ flag lacksRejectAndInfixDest
    "living leftover omits RejectAndInfix.lean EXISTS (done dest)"
  ++ flag lacksInfixAndToyCheckExit
    "living summary omits infix && toy CHECK_EXIT 1 kept reject"
  ++ flag lacksInfixXorToyCheckExit
    "living summary omits infix ^^ toy CHECK_EXIT 1 kept reject"
  ++ flag lacksRejectXorInfixDoneDest
    "living leftover omits RejectXorInfix.lean EXISTS (done dest)"
  ++ flag lacksInfixBooleanTokensDestAndHook
    "living leftover omits infix Boolean tokens || && ^^ are dest-and-hook done"
  ++ flag staleInfixAndResearchLeftover
    "living leftover still claims next leftover is next typedPass after infix && is being named by research (infix Boolean tokens || && ^^ are dest-and-hook done; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectXorInfixIdentNamed
    "living summary still names an Ident-suffix RejectXorInfix dest (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleAndInfixHookLeftover
    "living leftover still names dest RejectAndInfix.lean EXISTS, hook in flight (RejectAndInfix.lean EXISTS (done dest); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectAndInfixIdentNamed
    "living summary still names an Ident-suffix RejectAndInfix dest (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleIndependentlyReviewed2b2
    "living summary still names current independently reviewed ELF /nix/store/2b2yl85hy7nbcx27xm02h2xq5jcg0mnh-slake-bootstrap (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrent2b2
    "living summary still names /nix/store/2b2yl85hy7nbcx27xm02h2xq5jcg0mnh-slake-bootstrap as current (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksNoLongerCurrent2b2
    "living summary omits /nix/store/2b2yl85hy7nbcx27xm02h2xq5jcg0mnh-slake-bootstrap (149384352 bytes) is no longer current"
  ++ flag staleBoolBeqResearchLeftover
    "living summary still names leftover as research of the next typedPass leftover after Bool.beq (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksPrefixNotToyCheckExit
    "living summary omits Prefix-not toy CHECK_EXIT 1 kept reject"
  ++ flag lacksRejectNotPrefixDoneDest
    "living summary omits RejectNotPrefix.lean EXISTS (done dest)"
  ++ flag staleRejectNotPrefixDestLeftover
    "living leftover still names RejectNotPrefix.lean as remaining (RejectNotPrefix.lean EXISTS (done dest); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectBangNamed
    "living summary still names RejectBang (do not mint RejectBang; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRejectNotPrefixIdentNamed
    "living summary still names an Ident-suffix RejectNotPrefix dest (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleIndependentlyReviewedVd819
    "living summary still names current independently reviewed ELF /nix/store/vd819cjncxn614xzk47d051msvd93gr1-slake-bootstrap (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleCurrentVd819
    "living summary still names /nix/store/vd819cjncxn614xzk47d051msvd93gr1-slake-bootstrap as current (that ELF is no longer current; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksNoLongerCurrentVd819
    "living summary omits /nix/store/vd819cjncxn614xzk47d051msvd93gr1-slake-bootstrap (149334976 bytes) is no longer current"
  ++ flag staleBoolBeqDestLeftover
    "living summary still names living dest leftover is RejectBoolBeq.lean for identifier Bool.beq (RejectBoolBeq.lean EXISTS (done dest); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleBoolBeqSourceLand
    "living summary still says source land of RejectBoolBeq.lean / Bool.beq in flight (RejectBoolBeq.lean EXISTS (done dest); leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksBoolBeqDoneDest
    "living summary omits RejectBoolBeq.lean EXISTS (done dest)"
  ++ flag lacksBoolBeqToyCheckExit
    "living summary omits Bool.beq toy CHECK_EXIT 1 kept reject"
  ++ flag lacksStrictAndToyFailClosed
    "living summary omits StrictAndToy fail-closed (CHECK_EXIT 1, banner kept reject) on the current produced slake-bootstrap ELF"
  ++ flag lacksCompilePathLinearOnS0
    "living summary omits CompilePathLinear CHECK_EXIT 0 (banner checker returned true) on the current produced slake-bootstrap ELF"
  ++ flag staleTypedPassHookStrictAndLeftover
    "living summary still says next leftover is typedPass hook of RejectStrictAnd (RejectStrictAnd typedPass hook GREEN; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRejectStrictAndHookGreen
    "living summary omits RejectStrictAnd typedPass hook GREEN"
  ++ flag staleStrictAndRejectMissing
    "living summary still names RejectStrictAnd.lean MISSING as the living leftover (RejectStrictAnd EXISTS 510; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleBoolStrictAndMissingLeftover
    "living summary still says next leftover is Bool.strictAnd / RejectStrictAnd.lean MISSING (RejectStrictAnd source GREEN 510; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRejectStrictAndExists
    "living summary omits RejectStrictAnd EXISTS 510"
  ++ flag staleBoolStrictOrNextLeftover
    "living summary still names Bool.strictOr as next remaining (leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksRebuild22Green
    "living summary omits Rebuild 22 GREEN"
  ++ flag staleRebuild22InFlight
    "living summary still says rebuild 22 exclusive in flight (Rebuild 22 GREEN; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild22LeftoverNotGreen
    "living summary still says rebuild 22 is leftover, not claimed GREEN (Rebuild 22 GREEN)"
  ++ flag staleStrictOrToyStaysNotFailClosed
    "living summary still says strictOrToy stays not fail-closed (strictOrToy fail-closed on ELF wpc482yn)"
  ++ flag lacksStrictOrToyFailClosed
    "living summary omits strictOrToy fail-closed (CHECK_EXIT 1, banner kept reject) on ELF wpc482yn"
  ++ flag lacksCompilePathLinearOnWpc
    "living summary omits CompilePathLinear CHECK_EXIT 0 (banner checker returned true) on ELF wpc482yn"
  ++ flag staleTypedPassHookStrictOrLeftover
    "living summary still says next leftover is typedPass hook of RejectStrictOr (RejectStrictOr typedPass hook GREEN; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleStrictOrRejectMissing
    "living summary still names RejectStrictOr.lean MISSING as the living leftover (RejectStrictOr EXISTS 510; leftover is ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild21InFlight
    "living summary still says successor exclusive rebuild 21 is already in flight (Rebuild 21 GREEN)"
  ++ flag staleRebuild21LeftoverNotGreen
    "living summary still says rebuild 21 is leftover, not claimed GREEN (Rebuild 21 GREEN)"
  ++ flag staleXorUnhooked
    "living summary still names RejectXor.lean 467 unhooked as the living leftover (RejectXor.lean 467 hooked; ${specs.strictAndLeftoverNeedle})"
  ++ flag staleRebuild21XorUnhookedNextLeftover
    "living summary still says next leftover is RejectXor.lean 467 unhooked (RejectXor hook GREEN; ${specs.strictAndLeftoverNeedle})"
  ++ flag lacksXorHooked
    "living summary omits RejectXor.lean 467 hooked"
  ++ flag staleFranciscoUseCheckNamed
    "living summary still names a seat-prefixed UseCheck dest as a product file"
  ++ flag franciscoUseCheckExists
    "seat-prefixed UseCheck dest EXISTS (must stay absent; not a living product file)"
  ++ flag lacksCompilePathLinear
    "living summary omits CompilePathLinear CHECK_EXIT 0"
  ++ flag lacksCondToyFailClosed
    "living summary omits CondToy CHECK_EXIT 1 fail-closed"
  ++ flag lacksDcondToyFailClosed
    "living summary omits DcondToy fail-closed on ELF vh2cdi00"
  ++ (if ifExists then needLines specs.ifRel ifLines else [ ])
  ++ (if iteExists then needLines specs.iteRel iteLines else [ "missing file: ${specs.iteRel}" ])
  ++ (if decideExists then needLines specs.decideRel decideLines else [ "missing file: ${specs.decideRel}" ])
  ++ (if condExists then needLines specs.condRel condLines else [ "missing file: ${specs.condRel}" ])
  ++ (if ditExists then needLines specs.ditRel ditLines else [ "missing file: ${specs.ditRel}" ])
  ++ (if dcondExists then needLines specs.dcondRel dcondLines else [ "missing file: ${specs.dcondRel}" ])
  ++ (if bifExists then needLines specs.bifRel bifLines else [ "missing file: ${specs.bifRel}" ])
  ++ (if orExists then needLines specs.orRel orLines else [ "missing file: ${specs.orRel}" ])
  ++ (if andExists then needLines specs.andRel andLines else [ "missing file: ${specs.andRel}" ])
  ++ (if notExists then needLines specs.notRel notLines else [ "missing file: ${specs.notRel}" ])
  ++ needLines specs.keptHitRel keptHitLines
  ++ (if probeText == null then [ "missing file: ${specs.probeRel}" ] else flag probeHasBan "${specs.probeRel}: contains ${specs.probeBan}")
