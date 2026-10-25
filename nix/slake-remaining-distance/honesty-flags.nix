# SPDX-License-Identifier: Unlicense
# Living-row honesty flags for the remaining-distance meter.
# Occupancy 49. FullHost false. Rebuild 23 GREEN. Current
# independently reviewed ELF
# /nix/store/n7xg5dkxr2jkjmlqyzmj8y1gm6rc9nzm-slake-bootstrap
# (149599304 bytes). That path is not
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
# 24 GREEN. Do not mill. Open stays Open.
{ lib, specs, has, rows, disk }:
let
  inherit (rows)
    ifRow
    iteRow
    decideRow
    condRow
    ditRow
    dcondRow
    bifRow
    orRow
    andRow
    notRow
    bneRow
    matchRow
    ;
  inherit (disk)
    ifExists
    ifHooked
    ifHasHasIf
    ifHasIfToy
    iteExists
    iteHooked
    iteHasHasIte
    iteHasIteToy
    decideExists
    decideHooked
    condExists
    condHooked
    ditExists
    ditHooked
    dcondExists
    dcondHooked
    bifExists
    bifHooked
    orExists
    orHooked
    andExists
    andHooked
    notExists
    notHooked
    bneExists
    matchExists
    ;

  livingHas = needle:
    has needle ifRow
    || has needle iteRow
    || has needle decideRow
    || has needle condRow
    || has needle ditRow
    || has needle dcondRow
    || has needle bifRow
    || has needle orRow
    || has needle andRow
    || has needle notRow
    || has needle bneRow
    || has needle matchRow
    || has needle specs.rebuild9GreenRow
    || has needle specs.rebuild10BlockedRow
    || has needle specs.rebuild11GreenRow
    || has needle specs.rebuild12GreenRow
    || has needle specs.rebuild13GreenRow
    || has needle specs.rebuild14GreenRow
    || has needle specs.rebuild15GreenRow
    || has needle specs.rebuild16GreenRow
    || has needle specs.rebuild17GreenRow
    || has needle specs.rebuild18GreenRow
    || has needle specs.rebuild19GreenRow
    || has needle specs.rebuild20GreenRow
    || has needle specs.rebuild21GreenRow
    || has needle specs.rebuild22GreenRow
    || has needle specs.rebuild23GreenRow
    || has needle specs.rebuild24BlockedRow;

  bneMissingFrozen =
    bneExists && has specs.bneMissingFrozenNeedle specs.rebuild9GreenRow;
  bneLacksSourceGreen = bneExists && !(has "RejectBne source GREEN" bneRow);
  bneLacksFailClosed =
    bneExists && !(has specs.bneFailClosedNeedle bneRow);
  bneClaimsNotFailClosed =
    bneExists
    && (has specs.bneNotFailClosedNeedle bneRow
      || has specs.bneToyNotFailClosedNeedle bneRow);
  bneStaleLater = bneExists && has specs.bneStaleLaterNeedle bneRow;
  bneStaleInFlight =
    has specs.bneStaleInFlightNeedle bneRow
    || has specs.bneStaleInFlightNeedle specs.rebuild9GreenRow;
  rebuild9StaleInFlight =
    has specs.rebuild9StaleInFlightNeedle specs.rebuild9GreenRow
    || has specs.rebuild9StaleInFlightNeedle bneRow;

  currentLacksS0sjpz1 =
    !(has specs.currentElfHashNeedle specs.rebuild23GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild23GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild22GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild22GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild21GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild21GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild20GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild20GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild19GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild19GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild18GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild18GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild17GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild17GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild16GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild16GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild15GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild15GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild14GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild14GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild13GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild13GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild12GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild12GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild11GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild11GreenRow)
    || !(has specs.currentElfHashNeedle specs.rebuild9GreenRow)
    || !(has specs.currentElfBytesNeedle specs.rebuild9GreenRow);

  staleCurrentWpc482yn =
    livingHas specs.staleCurrentWpcStoreNeedle
    || livingHas specs.staleCurrentWpcShortNeedle
    || livingHas specs.staleCurrentWpcProducedNeedle
    || livingHas specs.staleCurrentWpcStaysNeedle
    || livingHas specs.staleCurrentWpcReviewedNeedle
    || livingHas specs.staleCurrentWpcReviewedShortNeedle;
  lacksNoLongerCurrentWpc =
    !(has specs.noLongerCurrentWpcNeedle specs.rebuild23GreenRow)
    || !(has specs.noLongerCurrentWpcNeedle specs.rebuild22GreenRow);

  staleCurrentIldbshq8 =
    livingHas specs.staleCurrentIldbStoreNeedle
    || livingHas specs.staleCurrentIldbShortNeedle
    || livingHas specs.staleCurrentIldbProducedNeedle
    || livingHas specs.staleCurrentIldbStaysNeedle;
  lacksNoLongerCurrentIldb =
    !(has specs.noLongerCurrentIldbNeedle specs.rebuild22GreenRow)
    || !(has specs.noLongerCurrentIldbNeedle specs.rebuild21GreenRow);
  staleCurrentL04l55ig =
    livingHas specs.staleCurrentL04StoreNeedle
    || livingHas specs.staleCurrentL04ShortNeedle
    || livingHas specs.staleCurrentL04ProducedNeedle
    || livingHas specs.staleCurrentL04StaysNeedle;
  lacksNoLongerCurrentL04 =
    !(has specs.noLongerCurrentL04Needle specs.rebuild22GreenRow)
    || !(has specs.noLongerCurrentL04Needle specs.rebuild21GreenRow)
    || !(has specs.noLongerCurrentL04Needle specs.rebuild20GreenRow);

  staleCurrentP763g8sb =
    livingHas specs.staleCurrentP763StoreNeedle
    || livingHas specs.staleCurrentP763ShortNeedle
    || livingHas specs.staleCurrentP763ProducedNeedle
    || livingHas specs.staleCurrentP763StaysNeedle;
  lacksNoLongerCurrentP763 =
    !(has specs.noLongerCurrentP763Needle specs.rebuild20GreenRow)
    || !(has specs.noLongerCurrentP763Needle specs.rebuild19GreenRow);

  staleCurrentImsr2xgr =
    livingHas specs.staleCurrentImsrStoreNeedle
    || livingHas specs.staleCurrentImsrShortNeedle
    || livingHas specs.staleCurrentImsrProducedNeedle
    || livingHas specs.staleCurrentImsrStaysNeedle;
  lacksNoLongerCurrentImsr =
    !(has specs.noLongerCurrentImsrNeedle specs.rebuild19GreenRow)
    || !(has specs.noLongerCurrentImsrNeedle specs.rebuild18GreenRow);

  staleCurrentVh2cdi00 =
    livingHas specs.staleCurrentVh2StoreNeedle
    || livingHas specs.staleCurrentVh2ShortNeedle
    || livingHas specs.staleCurrentVh2ProducedNeedle
    || livingHas specs.staleCurrentVh2StaysNeedle;
  lacksNoLongerCurrentVh2 =
    !(has specs.noLongerCurrentVh2Needle specs.rebuild18GreenRow)
    || !(has specs.noLongerCurrentVh2Needle specs.rebuild17GreenRow);

  staleCurrentXw41jhmv =
    livingHas specs.staleCurrentXw41StoreNeedle
    || livingHas specs.staleCurrentXw41ShortNeedle
    || livingHas specs.staleCurrentXw41ProducedNeedle
    || livingHas specs.staleCurrentXw41StaysNeedle;
  lacksNoLongerCurrentXw41 =
    !(has specs.noLongerCurrentXw41Needle specs.rebuild17GreenRow)
    || !(has specs.noLongerCurrentXw41Needle specs.rebuild16GreenRow);

  staleCurrentIbdxkpf7 =
    livingHas specs.staleCurrentIbdxStoreNeedle
    || livingHas specs.staleCurrentIbdxShortNeedle
    || livingHas specs.staleCurrentIbdxProducedNeedle
    || livingHas specs.staleCurrentIbdxStaysNeedle;
  lacksNoLongerCurrentIbdx =
    !(has specs.noLongerCurrentIbdxNeedle specs.rebuild16GreenRow)
    || !(has specs.noLongerCurrentIbdxNeedle specs.rebuild15GreenRow);

  staleCurrentL85gkygc =
    livingHas specs.staleCurrentL85StoreNeedle
    || livingHas specs.staleCurrentL85ShortNeedle
    || livingHas specs.staleCurrentL85ProducedNeedle
    || livingHas specs.staleCurrentL85StaysNeedle;
  lacksNoLongerCurrentL85 =
    !(has specs.noLongerCurrentL85Needle specs.rebuild14GreenRow)
    || !(has specs.noLongerCurrentL85Needle specs.rebuild15GreenRow)
    || !(has specs.noLongerCurrentL85Needle specs.rebuild16GreenRow);

  staleCurrentWiky18mm =
    livingHas specs.staleCurrentWikyStoreNeedle
    || livingHas specs.staleCurrentWikyShortNeedle
    || livingHas specs.staleCurrentWikyProducedNeedle
    || livingHas specs.staleCurrentWikyStaysNeedle;
  lacksNoLongerCurrentWiky =
    !(has specs.noLongerCurrentWikyNeedle specs.rebuild14GreenRow)
    || !(has specs.noLongerCurrentWikyNeedle specs.rebuild13GreenRow);

  staleCurrentH0j4119 =
    livingHas specs.staleCurrentH0jStoreNeedle
    || livingHas specs.staleCurrentH0jShortNeedle
    || livingHas specs.staleCurrentH0jProducedNeedle
    || livingHas specs.staleCurrentH0jStaysNeedle;
  lacksNoLongerCurrentH0j =
    !(has specs.noLongerCurrentH0jNeedle specs.rebuild12GreenRow)
    || !(has specs.noLongerCurrentH0jNeedle specs.rebuild13GreenRow)
    || !(has specs.noLongerCurrentH0jNeedle specs.rebuild14GreenRow);
  staleCurrentLpxw2099 =
    livingHas specs.staleCurrentLpxwStoreNeedle
    || livingHas specs.staleCurrentLpxwShortNeedle
    || livingHas specs.staleCurrentLpxwProducedNeedle
    || livingHas specs.staleCurrentLpxwStaysNeedle;
  lacksNoLongerCurrentLpxw =
    !(has specs.noLongerCurrentLpxwNeedle specs.rebuild13GreenRow)
    || !(has specs.noLongerCurrentLpxwNeedle specs.rebuild14GreenRow);
  staleCurrentW9775 =
    livingHas specs.staleCurrentW9775Needle
    || livingHas specs.staleCurrentW9775StoreNeedle
    || livingHas specs.staleCurrentW9775StaysStoreNeedle;
  l9NamedCurrent =
    has "l9l72744" specs.rebuild9GreenRow
    && !(has "not l9l72744" specs.rebuild9GreenRow);
  pcjNamedCurrent =
    has "pcj0rbgi" specs.rebuild9GreenRow
    && !(has "not pcj0rbgi" specs.rebuild9GreenRow);
  lacksRebuild9Green = !(has "Rebuild 9 GREEN" specs.rebuild9GreenRow);
  staleRebuild8Green = has "Rebuild 8 GREEN" specs.rebuild9GreenRow;
  lacksMatchToyFailClosed =
    !(has "MatchToy CHECK_EXIT 1" specs.rebuild9GreenRow)
    || !(has specs.matchFailClosedNeedle specs.rebuild9GreenRow);

  matchMissingFrozen =
    matchExists && has specs.matchMissingFrozenNeedle specs.rebuild9GreenRow;
  matchLacksSourceGreen =
    matchExists && !(has "RejectMatch source GREEN" matchRow);
  matchLacksFailClosed =
    matchExists && !(has specs.matchFailClosedNeedle matchRow);
  matchClaimsNotFailClosed =
    matchExists && has specs.matchNotFailClosedNeedle matchRow;
  matchStaleInFlight =
    matchExists && has specs.matchInFlightNeedle matchRow;

  ifMissingFrozen =
    ifExists && has specs.ifMissingFrozenNeedle specs.rebuild9GreenRow;
  ifLacksSourceGreen =
    ifExists && !(has specs.ifSourceGreenNeedle ifRow);
  ifRebuildLacksSourceGreen =
    ifExists && !(has specs.ifSourceGreenNeedle specs.rebuild9GreenRow);
  ifStaleInFlight =
    ifExists && has specs.ifInFlightNeedle ifRow;
  ifStaleExclusiveLater =
    livingHas specs.ifExclusiveLaterNeedle;
  staleFindWordNextLeftover =
    livingHas specs.staleFindWordNextLeftoverNeedle;
  lacksFindWordGreen =
    ifExists && !(livingHas specs.ifFindWordGreenNeedle);
  ifLacksHasIf = ifExists && !ifHasHasIf;
  ifLacksIfToy = ifExists && !ifHasIfToy;
  ifStaleNotFailClosed = livingHas specs.ifNotFailClosedNeedle;
  ifStaleRejectIfNotFailClosed =
    livingHas specs.ifRejectIfNotFailClosedNeedle;
  ifStaleIfToyNotFailClosed =
    livingHas specs.ifToyNotFailClosedNeedle;
  ifLacksIfThenElseFailClosed =
    !(livingHas specs.ifThenElseFailClosedNeedle);
  ifToyLacksFailClosed =
    !(livingHas specs.ifToyFailClosedNeedle);
  ifLacksRejectIfFailClosedLpxw =
    !(livingHas specs.rejectIfFailClosedLpxwNeedle);
  siblingLeftoverNamed =
    livingHas specs.siblingDecideNeedle
    || livingHas specs.siblingCondNeedle;
  ifClaimsHookAbsent =
    ifHooked
    && livingHas specs.ifHookAbsentNeedle;

  iteMissingFrozen =
    iteExists && livingHas specs.iteMissingFrozenNeedle;
  iteLacksSourceGreen =
    iteExists && !(livingHas specs.iteSourceGreenNeedle);
  iteLacksNotHooked =
    iteExists && !iteHooked && !(livingHas specs.iteNotHookedNeedle);
  iteLacksHookPresent =
    iteExists && iteHooked && !(livingHas specs.iteHookPresentNeedle);
  iteLacksHasIte = iteExists && !iteHasHasIte;
  iteLacksIteToy = iteExists && !iteHasIteToy;
  iteClaimsNotHookedWhileHooked =
    iteHooked && livingHas specs.iteNotHookedNeedle;
  iteLacksFailClosedLpxw =
    iteExists && !(livingHas specs.iteFailClosedLpxwNeedle);
  staleIteHookNotFailClosed =
    livingHas specs.iteHookGreenNotFailClosedNeedle;
  iteToyLacksFailClosed =
    !(livingHas specs.iteToyFailClosedNeedle);
  staleIteToyNotFailClosed =
    livingHas specs.iteToyNotFailClosedNeedle;

  decideMissingFrozen =
    decideExists && livingHas specs.decideMissingFrozenNeedle;
  decideLacksSourceGreen =
    decideExists && !(livingHas specs.decideSourceGreenNeedle);
  decideLacksNotHooked =
    decideExists && !decideHooked && !(livingHas specs.decideNotHookedNeedle);
  decideClaimsNotHookedWhileHooked =
    decideHooked && livingHas specs.decideNotHookedNeedle;
  decideStaleNotFailClosed =
    livingHas specs.decideNotFailClosedNeedle;
  decideLacksFailClosed =
    decideExists && !(livingHas specs.decideFailClosedNeedle);
  decideStaleHookInFlight =
    has specs.decideHookInFlightNeedle decideRow;
  decideLacksToyFailClosed =
    decideExists && !(livingHas specs.decideAscriptionToyFailClosedNeedle);
  decideStaleToyNotFailClosed =
    livingHas specs.decideAscriptionToyNotFailClosedNeedle;

  condMissingFrozen =
    condExists && livingHas specs.condMissingFrozenNeedle;
  condLacksSourceGreen =
    condExists && !(livingHas specs.condSourceGreenNeedle);
  condLacksInFlight =
    condExists && !condHooked && !(livingHas specs.condInFlightNeedle);
  condStaleSourceOnly =
    livingHas specs.condSourceOnlyInFlightNeedle;
  condStaleHookInFlight =
    has specs.condHookInFlightNeedle condRow;
  condStaleNotFailClosed =
    livingHas specs.condNotFailClosedNeedle;
  condLacksFailClosed =
    condExists && !(livingHas specs.condFailClosedNeedle);
  condToyLacksFailClosed =
    condExists && !(livingHas specs.condToyFailClosedNeedle);
  condStaleToyNotFailClosed =
    livingHas specs.condToyNotFailClosedNeedle
    || livingHas specs.condToyNotFailClosedCapNeedle;
  condClaimsNotHookedWhileHooked =
    condHooked && livingHas specs.condNotHookedNeedle;

  ditMissingFrozen =
    ditExists && livingHas specs.ditMissingFrozenNeedle;
  ditLacksSourceGreen =
    ditExists && !(livingHas specs.ditSourceGreenNeedle);
  ditLacksNotHooked =
    ditExists && !ditHooked && !(livingHas specs.ditNotHookedNeedle);
  ditClaimsNotHookedWhileHooked =
    ditHooked && livingHas specs.ditNotHookedNeedle;
  ditStaleSourceNotFailClosed =
    livingHas specs.ditNotFailClosedNeedle;
  ditLacksHookGreen =
    ditExists && ditHooked && !(livingHas specs.ditHookGreenNeedle);
  ditStaleHookInFlight =
    ditHooked && livingHas specs.ditHookInFlightNeedle;
  ditStaleToyNotFailClosed =
    livingHas specs.ditToyNotFailClosedNeedle;
  ditLacksFailClosed =
    ditExists && !(livingHas specs.ditFailClosedNeedle);
  ditLacksToyFailClosed =
    ditExists
    && !(livingHas specs.ditToyFailClosedCapNeedle)
    && !(livingHas specs.ditToyFailClosedOnVh2Needle);

  dcondMissingFrozen =
    dcondExists && has specs.dcondMissingFrozenNeedle specs.rebuild9GreenRow;
  dcondLacksSourceGreen =
    dcondExists && !(livingHas specs.dcondSourceGreenNeedle);
  dcondLacksUnhooked =
    dcondExists && !dcondHooked && !(livingHas specs.dcondUnhookedNeedle);
  dcondClaimsUnhookedWhileHooked =
    dcondHooked && livingHas specs.dcondUnhookedNeedle;
  dcondLacksNotHooked =
    dcondExists && !dcondHooked && !(livingHas specs.dcondNotHookedNeedle);
  dcondClaimsNotHookedWhileHooked =
    dcondHooked && livingHas specs.dcondNotHookedNeedle;
  dcondStaleNotFailClosed =
    livingHas specs.dcondNotFailClosedNeedle;
  dcondLacksFailClosed =
    dcondExists && !(livingHas specs.dcondFailClosedNeedle);
  dcondLacksHookGreen =
    dcondExists && dcondHooked && !(livingHas specs.dcondHookGreenNeedle);
  dcondStaleHookInFlight =
    dcondHooked && livingHas specs.dcondHookInFlightNeedle;
  dcondLacksToyFailClosed =
    dcondExists
    && !(livingHas specs.dcondToyFailClosedCapNeedle)
    && !(livingHas specs.dcondToyFailClosedOnVh2Needle);
  dcondClaimsToyNotFailClosed =
    livingHas specs.dcondToyNotFailClosedNeedle;

  bifMissingFrozen =
    bifExists && livingHas specs.bifMissingFrozenNeedle;
  bifLacksSourceGreen =
    bifExists && !(livingHas specs.bifSourceGreenNeedle);
  bifLacksNotHooked =
    bifExists && !bifHooked && !(livingHas specs.bifNotHookedNeedle);
  bifLacksHookGreen =
    bifExists && bifHooked && !(livingHas specs.bifHookGreenNeedle);
  bifLacksExists326 =
    bifExists && !(livingHas specs.bifExists326Needle);
  bifClaimsNotHookedWhileHooked =
    bifHooked && livingHas specs.bifNotHookedNeedle;
  bifLacksToyFailClosed =
    bifExists
    && !(livingHas specs.bifToyFailClosedCapNeedle)
    && !(livingHas specs.bifToyFailClosedOnVh2Needle);
  bifClaimsToyNotFailClosed =
    livingHas specs.bifToyNotFailClosedNeedle;

  orMissingFrozen =
    orExists && livingHas specs.orMissingFrozenNeedle;
  orLacksSourceGreen =
    orExists && !(livingHas specs.orSourceGreenNeedle);
  orLacksUnhooked =
    orExists && !orHooked && !(livingHas specs.orUnhookedNeedle);
  orClaimsUnhookedWhileHooked =
    orHooked && livingHas specs.orUnhookedNeedle;
  orStaleNotFailClosed =
    livingHas specs.orNotFailClosedNeedle;
  orLacksFailClosed =
    orExists && !(livingHas specs.orFailClosedNeedle);
  orLacksExists388 =
    orExists && !(livingHas specs.orExists388Needle);
  orLacksHookGreen =
    orExists && orHooked && !(livingHas specs.orHookGreenNeedle);
  orStaleHookedNotFailClosed =
    orHooked && livingHas specs.orHookedInSourceNotFailClosedNeedle;
  orStaleHookInFlight =
    orHooked && livingHas specs.orHookInFlightNeedle;
  orStaleToyNotFailClosed =
    livingHas specs.orToyNotFailClosedNeedle;
  orLacksToyFailClosed =
    orExists
    && !(livingHas specs.orToyFailClosedCapNeedle)
    && !(livingHas specs.orToyFailClosedOnImsrNeedle);
  orClaimsBoolOrFailClosed =
    livingHas specs.boolOrFailClosedNeedle;

  andMissingFrozen =
    andExists && livingHas specs.andMissingFrozenNeedle;
  andLacksSourceGreen =
    andExists && !(livingHas specs.andSourceGreenNeedle);
  andLacksUnhooked =
    andExists && !andHooked && !(livingHas specs.andUnhookedNeedle);
  andClaimsUnhookedWhileHooked =
    andHooked && livingHas specs.andUnhookedNeedle;
  andStaleNotFailClosed =
    livingHas specs.andNotFailClosedNeedle;
  andLacksFailClosed =
    andExists && !(livingHas specs.andFailClosedNeedle);
  andLacksToyFailClosed =
    andExists
    && !(livingHas specs.andToyFailClosedCapNeedle)
    && !(livingHas specs.andToyFailClosedOnP763Needle)
    && !(livingHas specs.andToyCheckExitNeedle);
  andStaleToyNotFailClosed =
    livingHas specs.andToyNotFailClosedNeedle;
  andStaleHookedNotFailClosed =
    andHooked && livingHas specs.andHookedInSourceNotFailClosedNeedle;
  andLacksExists428 =
    andExists && !(livingHas specs.andExists428Needle);

  notMissingFrozen =
    notExists && livingHas specs.notMissingFrozenNeedle;
  notLacksSourceGreen =
    notExists && !(livingHas specs.notSourceGreenNeedle);
  notLacksUnhooked =
    notExists && !notHooked && !(livingHas specs.notUnhookedNeedle);
  notClaimsUnhookedWhileHooked =
    notHooked && livingHas specs.notUnhookedNeedle;
  notStaleNotFailClosed =
    livingHas specs.notNotFailClosedNeedle;
  notLacksFailClosed =
    notExists && !(livingHas specs.notFailClosedNeedle);
  notLacksExists466 =
    notExists && !(livingHas specs.notExists466Needle);
  notStaleToyNotFailClosed =
    livingHas specs.notToyStaysNotFailClosedNeedle
    || livingHas specs.notToyNotFailClosedNeedle;
  notLacksToyFailClosed =
    notExists
    && !(livingHas specs.notToyFailClosedCapNeedle)
    && !(livingHas specs.notToyFailClosedOnL04Needle)
    && !(livingHas specs.notToyCheckExitNeedle);

  lacksRebuild10Blocked =
    !(has specs.rebuild10BlockedNeedle specs.rebuild10BlockedRow)
    || !(has specs.rebuild10BlockedNeedle specs.rebuild9GreenRow);
  staleRebuild10Green = livingHas specs.rebuild10GreenNeedle;
  rebuild10StaleInFlight = livingHas specs.rebuild10InFlightNeedle;
  rebuild10LacksNixExit =
    !(has specs.rebuild10NixExitNeedle specs.rebuild10BlockedRow);
  rebuild10LacksFinishUtc =
    !(has specs.rebuild10FinishUtcNeedle specs.rebuild10BlockedRow);
  rebuild10LacksFindWord =
    !(has specs.ifFindWordSkipIdentNeedle specs.rebuild10BlockedRow);
  rebuild10LacksNoNewElf =
    !(has specs.rebuild10NoNewElfNeedle specs.rebuild10BlockedRow);
  rebuild10LacksCqfMissing =
    !(has specs.rebuild10CqfMissingNeedle specs.rebuild10BlockedRow);
  rebuild10LacksNotProof =
    !(has specs.rebuild10NotProofNeedle specs.rebuild10BlockedRow)
    || !(has specs.rebuild10NotProofNeedle specs.rebuild9GreenRow);
  rebuild10LacksNotSampled =
    !(has specs.rebuild10NotSampledNeedle specs.rebuild10BlockedRow);
  rebuild10LacksClosureMods =
    !(has specs.rebuild10ClosureModsNeedle specs.rebuild10BlockedRow);
  rebuild10LacksW9775 =
    !(has "w9775kbs8x28n528p5hsq539achj9r9y" specs.rebuild10BlockedRow);
  rebuild10NamesNewElfSuccess =
    has "cqf0iqzs" specs.rebuild10BlockedRow
    && !(has specs.rebuild10CqfMissingNeedle specs.rebuild10BlockedRow);
  staleTypedPassHookLeftover =
    livingHas specs.staleTypedPassHookNeedle;
  staleRebuild11InFlight = livingHas specs.rebuild11InFlightNeedle;
  lacksRebuild11Green =
    !(has specs.rebuild11GreenNeedle specs.rebuild11GreenRow)
    || !(livingHas specs.rebuild11GreenNeedle);
  staleRebuild11NotProof = livingHas specs.rebuild11NotProofNeedle;
  staleRebuild11NextLeftover = livingHas specs.rebuild11NextLeftoverNeedle;
  staleRebuild12InFlight = livingHas specs.rebuild12InFlightNeedle;
  lacksRebuild12Green =
    !(has specs.rebuild12GreenNeedle specs.rebuild12GreenRow)
    || !(livingHas specs.rebuild12GreenNeedle);
  staleRebuild12NextLeftover = livingHas specs.rebuild12NextLeftoverNeedle;
  staleRebuild13InFlight =
    livingHas specs.rebuild13InFlightNeedle
    || livingHas specs.rebuild13ExclusiveInFlightNeedle;
  lacksRebuild13Green =
    !(has specs.rebuild13GreenNeedle specs.rebuild13GreenRow)
    || !(livingHas specs.rebuild13GreenNeedle);
  staleRebuild13NextLeftover = livingHas specs.rebuild13NextLeftoverNeedle;
  staleRebuild14InFlight =
    livingHas specs.rebuild14InFlightNeedle
    || livingHas specs.rebuild14ExclusiveInFlightNeedle;
  lacksRebuild14Green =
    !(has specs.rebuild14GreenNeedle specs.rebuild14GreenRow)
    || !(livingHas specs.rebuild14GreenNeedle);
  staleRebuild14NextLeftover = livingHas specs.rebuild14NextLeftoverNeedle;
  staleRebuild15NextLeftover =
    livingHas specs.rebuild15NextLeftoverNeedle;
  staleRebuild15InFlight =
    livingHas specs.rebuild15ExclusiveInFlightNeedle;
  staleRebuild15NoNewElf =
    livingHas specs.rebuild15NoNewElfNeedle;
  staleRebuild15NextBifLeftover =
    livingHas specs.rebuild15NextBifLeftoverNeedle;
  staleRebuild15NextDcondLeftover =
    livingHas specs.rebuild15NextDcondLeftoverNeedle;
  lacksRebuild15Green =
    !(has specs.rebuild15GreenNeedle specs.rebuild15GreenRow)
    || !(livingHas specs.rebuild15GreenNeedle);
  staleRebuild16InFlight =
    livingHas specs.rebuild16ExclusiveInFlightNeedle;
  staleRebuild16NoNewElf =
    livingHas specs.rebuild16NoNewElfNeedle;
  lacksRebuild16Green =
    !(has specs.rebuild16GreenNeedle specs.rebuild16GreenRow)
    || !(livingHas specs.rebuild16GreenNeedle);
  staleRebuild16NextDcondLeftover =
    livingHas specs.rebuild16NextDcondLeftoverNeedle;
  staleRebuild17NextLeftover =
    livingHas specs.rebuild17NextLeftoverNeedle;
  staleRebuild17InFlight =
    livingHas specs.rebuild17ExclusiveInFlightNeedle;
  lacksRebuild17Green =
    !(has specs.rebuild17GreenNeedle specs.rebuild17GreenRow)
    || !(livingHas specs.rebuild17GreenNeedle);
  staleRebuild18NextLeftover =
    livingHas specs.rebuild18NextLeftoverNeedle;
  staleRebuild18HookRemaining =
    livingHas specs.staleRebuild18HookRemainingNeedle;
  staleRebuild18InFlight =
    livingHas specs.rebuild18ExclusiveInFlightNeedle;
  lacksRebuild18Green =
    !(has specs.rebuild18GreenNeedle specs.rebuild18GreenRow)
    || !(livingHas specs.rebuild18GreenNeedle);
  staleRebuild19NextLeftover =
    livingHas specs.rebuild19NextLeftoverNeedle;
  staleRebuild19Blocked =
    livingHas specs.rebuild19BlockedNeedle;
  staleRebuild19SuccessorInFlight =
    livingHas specs.rebuild19SuccessorInFlightNeedle
    || livingHas specs.rebuild19InFlightNeedle;
  staleRebuild19AndToyNextLeftover =
    livingHas specs.staleRebuild19AndToyNextLeftoverNeedle;
  staleRebuild19HookRemaining =
    livingHas specs.staleRebuild19HookRemainingNeedle;
  lacksRebuild19Green =
    !(has specs.rebuild19GreenNeedle specs.rebuild19GreenRow)
    || !(livingHas specs.rebuild19GreenNeedle);
  staleRebuild19WalkerOleanLeftover =
    livingHas specs.staleRebuild19WalkerOleanNeedle;
  staleRebuild19EqSomeBinderLeftover =
    livingHas specs.staleRebuild19EqSomeBinderNeedle;
  staleRebuild19TypecheckDriverLeftover =
    livingHas specs.staleRebuild19TypecheckDriverNeedle;
  staleRebuild19EdmontonChainLeftover =
    livingHas specs.staleRebuild19EdmontonChainNeedle;
  staleRebuild19HostFrontSuccessorInFlight =
    livingHas specs.staleRebuild19HostFrontSuccessorInFlightNeedle;
  staleRebuild19OldSuccessorInFlight =
    livingHas specs.staleRebuild19OldSuccessorInFlightNeedle;
  staleRebuild20NextLeftover =
    livingHas specs.rebuild20NextLeftoverNeedle;
  lacksRebuild20Green =
    !(has specs.rebuild20GreenNeedle specs.rebuild20GreenRow)
    || !(livingHas specs.rebuild20GreenNeedle);
  lacksTopScanNotLivingMiss =
    !(livingHas specs.topScanNotLivingMissNeedle);
  staleTopScanOleanLivingMiss =
    livingHas specs.topScanOleanMissingNeedle;
  staleRebuild21NextLeftover =
    livingHas specs.rebuild21NextLeftoverNeedle;
  lacksRebuild21Green =
    !(has specs.rebuild21GreenNeedle specs.rebuild21GreenRow)
    || !(livingHas specs.rebuild21GreenNeedle);
  staleXorToyStaysNotFailClosed =
    livingHas specs.xorToyStaysNotFailClosedNeedle;
  lacksXorToyFailClosed =
    !(livingHas specs.xorToyFailClosedNeedle)
    || !(livingHas specs.xorToyFailClosedOnIldbNeedle)
    || !(livingHas specs.xorToyCheckExitNeedle);
  staleResearchAfterXorInFlight =
    livingHas specs.researchAfterXorInFlightNeedle;
  staleRebuild22NextLeftover =
    livingHas specs.strictOrRejectMissingNeedle;
  staleResearchAfterStrictOr =
    livingHas specs.researchAfterStrictOrNeedle;
  lacksStrictAndLeftover =
    !(livingHas specs.strictAndLeftoverNeedle)
    || !(livingHas specs.rebuild24BlockedNeedle)
    || !(livingHas specs.multPlaceDrvNeedle)
    || !(livingHas specs.rebuild24Signal9Needle)
    || !(livingHas specs.rebuild24PriorMissNeedle)
    || !(livingHas specs.rebuild10NoNewElfNeedle)
    || !(livingHas specs.copySetAlreadyNeedle)
    || !(livingHas specs.boolBneRenameGreenNeedle)
    || !(livingHas specs.boolBneFormNeedle)
    || !(livingHas specs.oldIdentSuffixMissingNeedle)
    || !(livingHas specs.boolBeqDoneDestNeedle)
    || !(livingHas specs.boolBeqToyCheckExitNeedle)
    || !(livingHas specs.beqThmTokenNeedle)
    || !(livingHas specs.boolBeqFormNeedle)
    || !(livingHas specs.beqIdentToyNotDestNeedle)
    || !(livingHas specs.identSuffixNotDestNeedle)
    || !(livingHas specs.laterToyDirNeedle)
    || !(livingHas specs.boolBeqExistsNeedle)
    || !(livingHas specs.boolBneExistsNeedle)
    || !(livingHas specs.rejectBneExistsTokenNeedle)
    || !(livingHas specs.leftoverS0sjpz1HashNeedle)
    || !(livingHas specs.leftoverS0sjpz1BytesNeedle)
    || !(livingHas specs.leftoverVd819HashNeedle)
    || !(livingHas specs.leftoverVd819BytesNeedle)
    || !(livingHas specs.noLongerCurrentVd819Needle)
    || !(livingHas specs.leftover2b2HashNeedle)
    || !(livingHas specs.leftover2b2BytesNeedle)
    || !(livingHas specs.noLongerCurrent2b2Needle)
    || !(livingHas specs.leftoverS7achsHashNeedle)
    || !(livingHas specs.leftoverS7achsBytesNeedle)
    || !(livingHas specs.noLongerCurrentS7achsNeedle)
    || !(livingHas specs.leftoverJzaimyHashNeedle)
    || !(livingHas specs.leftoverJzaimyBytesNeedle)
    || !(livingHas specs.noLongerCurrentJzaimyNeedle)
    || !(livingHas specs.leftover4s8HashNeedle)
    || !(livingHas specs.leftover4s8BytesNeedle)
    || !(livingHas specs.noLongerCurrent4s8Needle)
    || !(livingHas specs.prefixNotToyCheckExitNeedle)
    || !(livingHas specs.rejectNotPrefixDoneDestNeedle)
    || !(livingHas specs.currentProducedElfNeedle)
    || !(livingHas specs.independentlyReviewedS0Needle)
    || !(livingHas specs.infixOrToyCheckExitNeedle)
    || !(livingHas specs.rejectOrInfixDoneDestNeedle)
    || !(livingHas specs.infixAndToyCheckExitNeedle)
    || !(livingHas specs.rejectAndInfixDoneDestNeedle)
    || !(livingHas specs.infixXorToyCheckExitNeedle)
    || !(livingHas specs.rejectXorInfixDoneDestNeedle)
    || !(livingHas specs.infixBooleanTokensDestAndHookDoneNeedle);
  staleRebuild24Green =
    livingHas specs.rebuild24GreenNeedle;
  staleRebuild24InFlight =
    livingHas specs.staleRebuild24InFlightNeedle
    || livingHas specs.rebuild24UntilNewStoreNeedle;
  staleRejectBneIdentNamed =
    livingHas specs.staleRejectBneIdentNeedle;
  staleRejectBeqIdentNamed =
    livingHas specs.staleRejectBeqIdentNeedle;
  staleRejectBoolBeqIdentNamed =
    livingHas specs.staleRejectBoolBeqIdentNeedle;
  staleBoolBneMissing =
    livingHas specs.staleBoolBneMissingNeedle;
  staleBoolBneLanding =
    livingHas specs.boolBneLandingNeedle;
  staleBoolBneToyLeftover =
    livingHas specs.boolBneToyRebuildInFlightNeedle;
  staleLeftoverIdentBne =
    livingHas specs.leftoverIdentBneNeedle;
  staleCurrentElfNickname =
    livingHas specs.staleCurrentElfShortNeedle
    || livingHas specs.staleCurrentElfPrefixNeedle
    || livingHas specs.staleCurrentElfParenNeedle
    || livingHas specs.staleCurrentElfOnNeedle
    || livingHas specs.staleCurrentElfStaysNeedle;
  staleResearchAfterStrictAnd =
    livingHas specs.researchAfterStrictAndNeedle
    || livingHas specs.staleResearchAfterStrictAndLeftoverNeedle;
  staleSshBlockedLeftover =
    livingHas specs.staleSshBlockedLeftoverNeedle;
  staleRebuild23NextLeftover =
    livingHas specs.staleRebuild23LeftoverNeedle;
  lacksRebuild23Green =
    !(has specs.rebuild23GreenNeedle specs.rebuild23GreenRow)
    || !(livingHas specs.rebuild23GreenNeedle);
  staleRebuild23InFlight =
    livingHas specs.staleRebuild23InFlightNeedle;
  staleS0sjpz1LeftoverNotCurrent =
    livingHas specs.s0sjpz1LeftoverNotCurrentNeedle;
  staleIndependentlyReviewedWpc =
    livingHas specs.independentlyReviewedWpcNeedle;
  lacksIndependentlyReviewedS0 =
    !(livingHas specs.independentlyReviewedS0Needle);
  staleIndependentlyReviewed4s8 =
    livingHas specs.independentlyReviewed4s8Needle;
  staleCurrent4s8 =
    livingHas specs.staleCurrent4s8StoreNeedle
    || livingHas specs.staleCurrent4s8ShortNeedle
    || livingHas specs.staleCurrent4s8ProducedNeedle
    || livingHas specs.staleCurrent4s8StaysNeedle
    || livingHas specs.staleCurrent4s8ReviewedNeedle;
  lacksNoLongerCurrent4s8 =
    !(livingHas specs.noLongerCurrent4s8Needle);
  staleIndependentlyReviewed2b2 =
    livingHas specs.independentlyReviewed2b2Needle;
  staleCurrent2b2 =
    livingHas specs.staleCurrent2b2StoreNeedle
    || livingHas specs.staleCurrent2b2ShortNeedle
    || livingHas specs.staleCurrent2b2ProducedNeedle
    || livingHas specs.staleCurrent2b2StaysNeedle
    || livingHas specs.staleCurrent2b2ReviewedNeedle;
  lacksNoLongerCurrent2b2 =
    !(livingHas specs.noLongerCurrent2b2Needle);
  staleIndependentlyReviewedS7achs =
    livingHas specs.independentlyReviewedS7achsNeedle;
  staleCurrentS7achs =
    livingHas specs.staleCurrentS7achsStoreNeedle
    || livingHas specs.staleCurrentS7achsShortNeedle
    || livingHas specs.staleCurrentS7achsProducedNeedle
    || livingHas specs.staleCurrentS7achsStaysNeedle
    || livingHas specs.staleCurrentS7achsReviewedNeedle;
  lacksNoLongerCurrentS7achs =
    !(livingHas specs.noLongerCurrentS7achsNeedle);
  stalePrefixNotLeftover =
    livingHas specs.stalePrefixNotLeftoverNeedle;
  lacksInfixOrToyCheckExit =
    !(livingHas specs.infixOrToyCheckExitNeedle);
  lacksRejectOrInfixDoneDest =
    !(livingHas specs.rejectOrInfixDoneDestNeedle);
  lacksRejectAndInfixDest =
    !(livingHas specs.rejectAndInfixDoneDestNeedle);
  lacksInfixAndToyCheckExit =
    !(livingHas specs.infixAndToyCheckExitNeedle);
  lacksInfixXorToyCheckExit =
    !(livingHas specs.infixXorToyCheckExitNeedle);
  lacksRejectXorInfixDoneDest =
    !(livingHas specs.rejectXorInfixDoneDestNeedle);
  lacksInfixBooleanTokensDestAndHook =
    !(livingHas specs.infixBooleanTokensDestAndHookDoneNeedle);
  staleInfixAndResearchLeftover =
    livingHas specs.staleInfixAndResearchLeftoverNeedle;
  staleRejectXorInfixIdentNamed =
    livingHas specs.staleRejectXorInfixIdentNeedle;
  staleAndInfixHookLeftover =
    livingHas specs.staleAndInfixHookLeftoverNeedle
    || livingHas specs.rejectAndInfixExistsNeedle;
  staleRejectAndInfixIdentNamed =
    livingHas specs.staleRejectAndInfixIdentNeedle;
  staleIndependentlyReviewedJzaimy =
    livingHas specs.independentlyReviewedJzaimyNeedle;
  staleCurrentJzaimy =
    livingHas specs.staleCurrentJzaimyStoreNeedle
    || livingHas specs.staleCurrentJzaimyShortNeedle
    || livingHas specs.staleCurrentJzaimyProducedNeedle
    || livingHas specs.staleCurrentJzaimyStaysNeedle
    || livingHas specs.staleCurrentJzaimyReviewedNeedle;
  lacksNoLongerCurrentJzaimy =
    !(livingHas specs.noLongerCurrentJzaimyNeedle);
  staleBoolBeqResearchLeftover =
    livingHas specs.staleBoolBeqResearchLeftoverNeedle;
  lacksPrefixNotToyCheckExit =
    !(livingHas specs.prefixNotToyCheckExitNeedle);
  lacksRejectNotPrefixDoneDest =
    !(livingHas specs.rejectNotPrefixDoneDestNeedle);
  staleRejectNotPrefixDestLeftover =
    livingHas specs.staleRejectNotPrefixDestLeftoverNeedle
    || livingHas specs.staleRejectNotPrefixRemainingNeedle;
  staleRejectBangNamed =
    livingHas specs.staleRejectBangNeedle;
  staleRejectNotPrefixIdentNamed =
    livingHas specs.staleRejectNotPrefixIdentNeedle;
  staleIndependentlyReviewedVd819 =
    livingHas specs.independentlyReviewedVd819Needle;
  staleCurrentVd819 =
    livingHas specs.staleCurrentVd819StoreNeedle
    || livingHas specs.staleCurrentVd819ShortNeedle
    || livingHas specs.staleCurrentVd819ProducedNeedle
    || livingHas specs.staleCurrentVd819StaysNeedle
    || livingHas specs.staleCurrentVd819ReviewedNeedle;
  lacksNoLongerCurrentVd819 =
    !(livingHas specs.noLongerCurrentVd819Needle);
  staleBoolBeqDestLeftover =
    livingHas specs.staleBoolBeqDestLeftoverNeedle;
  staleBoolBeqSourceLand =
    livingHas specs.boolBeqSourceLandNeedle;
  lacksBoolBeqDoneDest =
    !(livingHas specs.boolBeqDoneDestNeedle);
  lacksBoolBeqToyCheckExit =
    !(livingHas specs.boolBeqToyCheckExitNeedle);
  lacksStrictAndToyFailClosed =
    !(livingHas specs.strictAndToyFailClosedNeedle)
    || !(livingHas specs.strictAndToyFailClosedOnS0Needle)
    || !(livingHas specs.strictAndToyCheckExitNeedle);
  lacksCompilePathLinearOnS0 =
    !(livingHas specs.compilePathLinearOnS0Needle);
  staleTypedPassHookStrictAndLeftover =
    livingHas specs.staleTypedPassHookStrictAndNeedle;
  lacksRejectStrictAndHookGreen =
    !(livingHas specs.rejectStrictAndHookGreenNeedle);
  staleStrictAndRejectMissing =
    livingHas specs.staleStrictAndMissingNeedle;
  staleBoolStrictAndMissingLeftover =
    livingHas specs.staleBoolStrictAndMissingNeedle;
  lacksRejectStrictAndExists =
    !(livingHas specs.rejectStrictAndExistsNeedle);
  staleBoolStrictOrNextLeftover =
    livingHas specs.staleBoolStrictOrNextLeftoverNeedle;
  lacksRebuild22Green =
    !(has specs.rebuild22GreenNeedle specs.rebuild22GreenRow)
    || !(livingHas specs.rebuild22GreenNeedle);
  staleRebuild22InFlight =
    livingHas specs.rebuild22InFlightNeedle;
  staleRebuild22LeftoverNotGreen =
    livingHas specs.rebuild22LeftoverNotGreenNeedle;
  staleStrictOrToyStaysNotFailClosed =
    livingHas specs.strictOrToyStaysNotFailClosedNeedle;
  lacksStrictOrToyFailClosed =
    !(livingHas specs.strictOrToyFailClosedNeedle)
    || !(livingHas specs.strictOrToyFailClosedOnWpcNeedle)
    || !(livingHas specs.strictOrToyCheckExitNeedle);
  lacksCompilePathLinearOnWpc =
    !(livingHas specs.compilePathLinearOnWpcNeedle);
  staleTypedPassHookStrictOrLeftover =
    livingHas specs.staleTypedPassHookStrictOrNeedle;
  staleStrictOrRejectMissing =
    livingHas specs.staleStrictOrMissingNeedle;
  staleRebuild21InFlight =
    livingHas specs.rebuild21InFlightNeedle;
  staleRebuild21LeftoverNotGreen =
    livingHas specs.rebuild21LeftoverNotGreenNeedle;
  staleXorUnhooked =
    livingHas specs.xorUnhookedNeedle;
  staleRebuild21XorUnhookedNextLeftover =
    livingHas specs.staleRebuild21XorUnhookedNextLeftoverNeedle;
  lacksXorHooked =
    !(livingHas specs.xorHookedNeedle);
  staleFranciscoUseCheckNamed =
    livingHas specs.franciscoUseCheckMissingNeedle
    || livingHas "FranciscoUseCheck.lean";
  lacksCompilePathLinear =
    !(livingHas "CompilePathLinear CHECK_EXIT 0");
  lacksCondToyFailClosed =
    !(livingHas specs.condToyFailClosedNeedle)
    || !(livingHas specs.condToyCheckExitNeedle);
  lacksDcondToyFailClosed =
    !(livingHas specs.dcondToyFailClosedCapNeedle)
    || !(livingHas specs.dcondToyFailClosedOnVh2Needle);
in
{
  inherit livingHas;
  inherit bneMissingFrozen bneLacksSourceGreen bneLacksFailClosed;
  inherit bneClaimsNotFailClosed bneStaleLater bneStaleInFlight rebuild9StaleInFlight;
  inherit currentLacksS0sjpz1 staleCurrentWpc482yn lacksNoLongerCurrentWpc staleCurrentIldbshq8 lacksNoLongerCurrentIldb staleCurrentL04l55ig lacksNoLongerCurrentL04 staleCurrentP763g8sb lacksNoLongerCurrentP763 staleCurrentImsr2xgr lacksNoLongerCurrentImsr staleCurrentVh2cdi00 lacksNoLongerCurrentVh2 staleCurrentXw41jhmv lacksNoLongerCurrentXw41;
  inherit staleCurrentIbdxkpf7 lacksNoLongerCurrentIbdx staleCurrentL85gkygc lacksNoLongerCurrentL85 staleCurrentWiky18mm lacksNoLongerCurrentWiky;
  inherit staleCurrentH0j4119 lacksNoLongerCurrentH0j staleCurrentLpxw2099 lacksNoLongerCurrentLpxw staleCurrentW9775;
  inherit l9NamedCurrent pcjNamedCurrent lacksRebuild9Green staleRebuild8Green lacksMatchToyFailClosed;
  inherit matchMissingFrozen matchLacksSourceGreen matchLacksFailClosed matchClaimsNotFailClosed matchStaleInFlight;
  inherit ifMissingFrozen ifLacksSourceGreen ifRebuildLacksSourceGreen;
  inherit ifStaleInFlight ifStaleExclusiveLater staleFindWordNextLeftover lacksFindWordGreen;
  inherit ifLacksHasIf ifLacksIfToy;
  inherit ifStaleNotFailClosed ifStaleRejectIfNotFailClosed ifStaleIfToyNotFailClosed;
  inherit ifLacksIfThenElseFailClosed ifToyLacksFailClosed ifLacksRejectIfFailClosedLpxw;
  inherit siblingLeftoverNamed ifClaimsHookAbsent;
  inherit iteMissingFrozen iteLacksSourceGreen iteLacksNotHooked iteLacksHookPresent;
  inherit iteLacksHasIte iteLacksIteToy iteClaimsNotHookedWhileHooked;
  inherit iteLacksFailClosedLpxw staleIteHookNotFailClosed iteToyLacksFailClosed staleIteToyNotFailClosed;
  inherit decideMissingFrozen decideLacksSourceGreen decideLacksNotHooked;
  inherit decideClaimsNotHookedWhileHooked decideStaleNotFailClosed decideLacksFailClosed;
  inherit decideStaleHookInFlight decideLacksToyFailClosed decideStaleToyNotFailClosed;
  inherit condMissingFrozen condLacksSourceGreen condLacksInFlight;
  inherit condStaleSourceOnly condStaleHookInFlight condStaleNotFailClosed;
  inherit condLacksFailClosed condToyLacksFailClosed condStaleToyNotFailClosed condClaimsNotHookedWhileHooked;
  inherit ditMissingFrozen ditLacksSourceGreen ditLacksNotHooked;
  inherit ditClaimsNotHookedWhileHooked;
  inherit ditLacksHookGreen ditStaleHookInFlight ditStaleToyNotFailClosed;
  inherit ditStaleSourceNotFailClosed ditLacksFailClosed ditLacksToyFailClosed;
  inherit dcondMissingFrozen dcondLacksSourceGreen dcondLacksUnhooked;
  inherit dcondClaimsUnhookedWhileHooked dcondLacksNotHooked dcondClaimsNotHookedWhileHooked;
  inherit dcondStaleNotFailClosed dcondLacksFailClosed dcondLacksHookGreen dcondStaleHookInFlight;
  inherit dcondLacksToyFailClosed dcondClaimsToyNotFailClosed;
  inherit bifMissingFrozen bifLacksSourceGreen bifLacksNotHooked bifLacksHookGreen bifLacksExists326 bifClaimsNotHookedWhileHooked;
  inherit bifLacksToyFailClosed bifClaimsToyNotFailClosed;
  inherit orMissingFrozen orLacksSourceGreen orLacksUnhooked;
  inherit orClaimsUnhookedWhileHooked orStaleNotFailClosed orLacksFailClosed orLacksExists388;
  inherit orLacksHookGreen orStaleHookedNotFailClosed orStaleHookInFlight;
  inherit orStaleToyNotFailClosed orLacksToyFailClosed orClaimsBoolOrFailClosed;
  inherit andMissingFrozen andLacksSourceGreen andLacksUnhooked;
  inherit andClaimsUnhookedWhileHooked andStaleNotFailClosed andLacksFailClosed andLacksToyFailClosed;
  inherit andStaleToyNotFailClosed andStaleHookedNotFailClosed andLacksExists428;
  inherit notMissingFrozen notLacksSourceGreen notLacksUnhooked;
  inherit notClaimsUnhookedWhileHooked notStaleNotFailClosed notLacksFailClosed notLacksExists466;
  inherit notStaleToyNotFailClosed notLacksToyFailClosed;
  inherit lacksRebuild10Blocked staleRebuild10Green rebuild10StaleInFlight;
  inherit rebuild10LacksNixExit rebuild10LacksFinishUtc rebuild10LacksFindWord;
  inherit rebuild10LacksNoNewElf rebuild10LacksCqfMissing rebuild10LacksNotProof;
  inherit rebuild10LacksNotSampled rebuild10LacksClosureMods rebuild10LacksW9775;
  inherit rebuild10NamesNewElfSuccess staleTypedPassHookLeftover;
  inherit staleRebuild11InFlight lacksRebuild11Green staleRebuild11NotProof staleRebuild11NextLeftover;
  inherit staleRebuild12InFlight lacksRebuild12Green staleRebuild12NextLeftover;
  inherit staleRebuild13InFlight lacksRebuild13Green staleRebuild13NextLeftover;
  inherit staleRebuild14InFlight lacksRebuild14Green staleRebuild14NextLeftover;
  inherit staleRebuild15NextLeftover staleRebuild15InFlight staleRebuild15NoNewElf;
  inherit staleRebuild15NextBifLeftover staleRebuild15NextDcondLeftover lacksRebuild15Green;
  inherit staleRebuild16InFlight staleRebuild16NoNewElf lacksRebuild16Green;
  inherit staleRebuild16NextDcondLeftover staleRebuild17NextLeftover staleRebuild17InFlight;
  inherit lacksRebuild17Green staleRebuild18NextLeftover;
  inherit staleRebuild18HookRemaining staleRebuild18InFlight lacksRebuild18Green;
  inherit staleRebuild19NextLeftover staleRebuild19Blocked staleRebuild19SuccessorInFlight;
  inherit staleRebuild19AndToyNextLeftover staleRebuild19HookRemaining lacksRebuild19Green;
  inherit staleRebuild19WalkerOleanLeftover staleRebuild19EqSomeBinderLeftover staleRebuild19TypecheckDriverLeftover staleRebuild19EdmontonChainLeftover;
  inherit staleRebuild19HostFrontSuccessorInFlight staleRebuild19OldSuccessorInFlight;
  inherit staleRebuild20NextLeftover lacksRebuild20Green lacksTopScanNotLivingMiss staleTopScanOleanLivingMiss;
  inherit staleRebuild21NextLeftover lacksRebuild21Green staleXorToyStaysNotFailClosed lacksXorToyFailClosed staleResearchAfterXorInFlight staleRebuild22NextLeftover staleResearchAfterStrictOr lacksStrictAndLeftover staleRebuild24Green staleRebuild24InFlight staleRejectBneIdentNamed staleRejectBeqIdentNamed staleRejectBoolBeqIdentNamed staleBoolBneMissing staleBoolBneLanding staleBoolBneToyLeftover staleLeftoverIdentBne staleCurrentElfNickname staleResearchAfterStrictAnd staleSshBlockedLeftover staleRebuild23NextLeftover lacksRebuild23Green staleRebuild23InFlight staleS0sjpz1LeftoverNotCurrent staleIndependentlyReviewedWpc lacksIndependentlyReviewedS0 lacksStrictAndToyFailClosed lacksCompilePathLinearOnS0 staleTypedPassHookStrictAndLeftover lacksRejectStrictAndHookGreen staleStrictAndRejectMissing staleBoolStrictAndMissingLeftover lacksRejectStrictAndExists staleBoolStrictOrNextLeftover lacksRebuild22Green staleRebuild22InFlight staleRebuild22LeftoverNotGreen staleStrictOrToyStaysNotFailClosed lacksStrictOrToyFailClosed lacksCompilePathLinearOnWpc staleTypedPassHookStrictOrLeftover staleStrictOrRejectMissing staleRebuild21InFlight staleRebuild21LeftoverNotGreen staleXorUnhooked staleRebuild21XorUnhookedNextLeftover lacksXorHooked;
  inherit staleFranciscoUseCheckNamed;
  inherit staleIndependentlyReviewedVd819 staleCurrentVd819 lacksNoLongerCurrentVd819 staleBoolBeqDestLeftover staleBoolBeqSourceLand lacksBoolBeqDoneDest lacksBoolBeqToyCheckExit;
  inherit staleIndependentlyReviewed2b2 staleCurrent2b2 lacksNoLongerCurrent2b2 staleIndependentlyReviewedS7achs staleCurrentS7achs lacksNoLongerCurrentS7achs staleIndependentlyReviewedJzaimy staleCurrentJzaimy lacksNoLongerCurrentJzaimy staleIndependentlyReviewed4s8 staleCurrent4s8 lacksNoLongerCurrent4s8 stalePrefixNotLeftover lacksInfixOrToyCheckExit lacksRejectOrInfixDoneDest lacksRejectAndInfixDest lacksInfixAndToyCheckExit lacksInfixXorToyCheckExit lacksRejectXorInfixDoneDest lacksInfixBooleanTokensDestAndHook staleInfixAndResearchLeftover staleRejectXorInfixIdentNamed staleAndInfixHookLeftover staleRejectAndInfixIdentNamed staleBoolBeqResearchLeftover lacksPrefixNotToyCheckExit lacksRejectNotPrefixDoneDest staleRejectNotPrefixDestLeftover staleRejectBangNamed staleRejectNotPrefixIdentNamed;
  inherit lacksCompilePathLinear lacksCondToyFailClosed lacksDcondToyFailClosed;
}
