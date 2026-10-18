# SPDX-License-Identifier: Unlicense
# Pure Nix remaining-distance meter: one impure eval proves local honesty
# from files on this laptop. Does not claim slakeOwnsPackageTypecheck.
# Does not mix specimen keep with Lean 4 / mathlib clocks. Does not mill.
# Remote ELF proof is out of this gate. Occupancy 49. FullHost false.
# Rebuild 23 GREEN. Current independently reviewed ELF
# /nix/store/97p32bdbdw6v79yxydi1y4s4s39ksp8j-slake-bootstrap
# (149467016 bytes). That path is not
# /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap
# (149447232 bytes). /nix/store/4s8fq7rcyq65nfl0qgj1pdx6kk7jpf5k-slake-bootstrap
# (149447232 bytes) is no longer current.
# /nix/store/jzaimy5hq45h12h1905ajk1qyjgdjjia-slake-bootstrap
# (149423320 bytes) is no longer current.
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
# 24 GREEN.
# Walker.lean 367. UseCheck 177 of 356. Occupancy 49. Comments-only C
# needle (nix/gutierrez-honesty/comments-only-needle.nix) must fail
# closed: needle.ok true fails this meter. Living tree may stay
# EVAL_EXIT 0 while that needle is EVAL_EXIT 1. Open stays Open.
#
#   import ./slake-remaining-distance { inherit lib; root = repoRoot; }
#   -> { ok, violations, summary }
# Optional overlay: allTypesUseCheckDone = true must fail closed (EXIT 1).
#
# Live impure eval (not wired into flake.nix this slice; HITL):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/slake-remaining-distance { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
{ lib, root, allTypesUseCheckDone ? null }:
let
  specs = import ./specs.nix;
  has = import ../string-contains.nix;
  fixture = import ../slake-linear-fixture-c { inherit lib root; };
  slice = import ../lean-string-slice-copy { inherit lib root; };
  closure = import ../slake-bootstrap-closure { inherit lib root; };
  commentsOnlyNeedle = import ../gutierrez-honesty/comments-only-needle.nix { inherit lib; };
  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel = rel: if exists rel then builtins.readFile (root + "/${rel}") else null;
  lineCount = text:
    let n = builtins.length (lib.splitString "\n" text);
    in if n == 0 then 0 else n - 1;
  linesOf = rel: let t = readRel rel; in if t == null then null else lineCount t;
  parseBool = name: text:
    let
      parts = lib.splitString "def ${name} : Bool :=" text;
      n = builtins.length parts;
    in
    if n < 2 then null
    else
      let
        rest = lib.removeSuffix "\r" (builtins.head (lib.splitString "\n" (builtins.elemAt parts (n - 1))));
        toks = lib.filter (t: t != "") (lib.splitString " " rest);
        tok = if toks == [ ] then "" else builtins.head toks;
      in
      if tok == "false" then false else if tok == "true" then true else null;
  boolOf = rel: name: let t = readRel rel; in if t == null then null else parseBool name t;
  occupancyN =
    let
      t = readRel specs.occupancyWalkRel;
      parts = if t == null then [ ] else lib.splitString specs.occupancyDef t;
      odds =
        if builtins.length parts < 2 then [ ]
        else
          lib.filter (p: lib.mod p.i 2 == 1) (
            lib.imap0 (i: s: { inherit i s; }) (
              lib.splitString "\"" (builtins.head (lib.splitString "]" (builtins.elemAt parts 1)))
            )
          );
      names = lib.filter (s: builtins.match "SystemsLean[.][A-Za-z0-9]+" s != null) (map (p: p.s) odds);
    in
    if builtins.length parts < 2 then null else builtins.length names;
  probeText = readRel specs.probeRel;
  occupancyProbeText = readRel specs.occupancyProbeRel;
  probeHasBan = probeText != null && has specs.probeBan probeText;
  occupancyProbe50 = occupancyProbeText != null && has specs.occupancyLen50 occupancyProbeText;
  occupancyProbe49 = occupancyProbeText != null && has specs.occupancyLen49 occupancyProbeText;
  allTypesParsed = boolOf specs.useCheckRel specs.allTypesName;
  allTypes = if allTypesUseCheckDone != null then allTypesUseCheckDone else allTypesParsed;
  ownsElab = boolOf specs.elabMeetRel specs.ownsPkgName;
  ownsHit = boolOf specs.keptHitRel specs.ownsPkgName;
  ownsDrop = boolOf specs.keptDropRel specs.ownsPkgName;
  ownsPkg =
    if ownsElab == null || ownsHit == null || ownsDrop == null then null
    else ownsElab || ownsHit || ownsDrop;
  fullHost = boolOf specs.elabMeetRel specs.fullHostName;
  hkLines = linesOf specs.hostKernelRel;
  keptHitLines = linesOf specs.keptHitRel;
  ucLines = linesOf specs.useCheckRel;
  frLines = linesOf specs.franciscoRel;
  hfLines = linesOf specs.hostFrontUseRel;
  hostFrontText = readRel specs.hostFrontRel;
  pinText = readRel specs.pinRel;
  hostFrontHooked =
    hostFrontText != null && has specs.hostFrontParseNeedle hostFrontText;
  pinLiveRelOk = pinText != null && has specs.pinLiveRelNeedle pinText;
  seesSlice =
    let t = readRel specs.franciscoRel;
    in if t == null then null
    else
      let after = lib.splitString specs.seesStart t;
      in if builtins.length after < 2 then null
      else
        let before = lib.splitString specs.seesEnd (builtins.elemAt after 1);
        in if builtins.length before < 2 then null
        else builtins.head before;
  useCheckProgressN =
    if seesSlice == null then null
    else builtins.length (lib.splitString specs.boundedNeedle seesSlice) - 1;
  flag = cond: msg: if cond then [ msg ] else [ ];
  frText = readRel specs.franciscoRel;
  leftoverNeedleFails =
    if frText == null then [ "missing file: ${specs.franciscoRel} (leftover pin spellings)" ]
    else
      lib.concatMap (needle:
        flag (!(has needle frText))
          "leftover pin spelling missing as bounded needle in ${specs.franciscoRel}: ${needle} (leftover unused would remain; leftover pin spellings must stay BLOCKED exhausted unused none)"
      ) specs.leftoverExhaustedNeedles;
  leftoverExhaustedOk = leftoverNeedleFails == [ ];
  franciscoUseCheckExists = exists specs.franciscoUseCheckRel;
  franciscoUseCheckRow =
    if franciscoUseCheckExists then "seat-prefixed UseCheck dest EXISTS (FAIL; not a living product file)"
    else "seat-prefixed UseCheck dest is absent (not a living product file)";
  bneExists = exists specs.bneRel;
  bneRow =
    if bneExists then specs.bneLeftoverRowPresent else specs.bneLeftoverRow;
  rejectBoolBneExists = exists specs.boolBneRel;
  rejectBoolBneLines = linesOf specs.boolBneRel;
  rejectBoolBneNRow =
    if rejectBoolBneLines == null then
      "RejectBoolBne.lean disk absent (FAIL; rename GREEN expected EXISTS 528)"
    else
      "${nRow "RejectBoolBne.lean" rejectBoolBneLines} (expect ${toString specs.boolBneExpect}; RejectBoolBne.lean EXISTS (rename GREEN); old Ident-suffix path missing; Bool.bne lives in RejectBoolBne; leftover is next leftover after infix Boolean tokens || && ^^ dest-and-hook done is being named; leftover is rebuild 24 BLOCKED Mult-place.drv signal 9; the current produced slake-bootstrap ELF; fail if over ${toString specs.lineFailOver})";
  rejectBoolBeqExists = exists specs.boolBeqRel;
  rejectBoolBeqLines = linesOf specs.boolBeqRel;
  rejectBoolBeqNRow =
    if rejectBoolBeqLines == null then
      "RejectBoolBeq.lean disk absent (FAIL; dest RejectBoolBeq.lean done dest expected EXISTS 531)"
    else
      "${nRow "RejectBoolBeq.lean" rejectBoolBeqLines} (expect ${toString specs.boolBeqExpect}; RejectBoolBeq.lean EXISTS (done dest); Bool.beq toy CHECK_EXIT 1 kept reject; Token == already lives in RejectBeqThm; Bool.beq lives in RejectBoolBeq; BeqIdentToy is not a product dest; An Ident-suffix name is not a dest; the later toy directory is bool-beq; leftover is next leftover after infix Boolean tokens || && ^^ dest-and-hook done is being named; leftover is rebuild 24 BLOCKED Mult-place.drv signal 9; the current produced slake-bootstrap ELF; fail if over ${toString specs.lineFailOver})";
  beqThmExists = exists specs.beqThmRel;
  beqThmRow =
    if beqThmExists then "RejectBeqThm.lean EXISTS (Token == already lives in RejectBeqThm)"
    else "RejectBeqThm.lean disk absent (FAIL; Token == already lives in RejectBeqThm)";
  notPrefixExists = exists specs.notPrefixRel;
  notPrefixRow =
    if notPrefixExists then "RejectNotPrefix.lean EXISTS (done dest); Prefix-not toy CHECK_EXIT 1 kept reject"
    else "RejectNotPrefix.lean disk absent (FAIL; dest RejectNotPrefix.lean done dest)";
  orInfixExists = exists specs.orInfixRel;
  orInfixRow =
    if orInfixExists then "RejectOrInfix.lean EXISTS (done dest); infix || toy CHECK_EXIT 1 kept reject"
    else "RejectOrInfix.lean disk absent (FAIL; dest RejectOrInfix.lean done dest)";
  andInfixExists = exists specs.andInfixRel;
  andInfixRow =
    if andInfixExists then "RejectAndInfix.lean EXISTS (done dest); infix && toy CHECK_EXIT 1 kept reject"
    else "RejectAndInfix.lean disk absent (FAIL; dest RejectAndInfix.lean done dest)";
  xorInfixExists = exists specs.xorInfixRel;
  xorInfixRow =
    if xorInfixExists then "RejectXorInfix.lean EXISTS (done dest); infix ^^ toy CHECK_EXIT 1 kept reject"
    else "RejectXorInfix.lean disk absent (FAIL; dest RejectXorInfix.lean done dest)";
  matchExists = exists specs.matchRel;
  matchRow =
    if matchExists then specs.matchLeftoverRowPresent else specs.matchLeftoverRow;
  ifExists = exists specs.ifRel;
  ifText = readRel specs.ifRel;
  ifLines = linesOf specs.ifRel;
  ifHasHasIf = ifText != null && has specs.ifHasIfNeedle ifText;
  ifHasIfToy =
    ifText != null
    && has specs.ifToyDefNeedle ifText
    && has specs.ifToyTextNeedle ifText;
  keptHitText = readRel specs.keptHitRel;
  ifHooked =
    keptHitText != null && has specs.ifHookRejectsNeedle keptHitText;
  ifRow =
    if ifExists then specs.ifLeftoverRowPresent else specs.ifLeftoverRow;
  iteExists = exists specs.iteRel;
  iteText = readRel specs.iteRel;
  iteLines = linesOf specs.iteRel;
  iteHasHasIte = iteText != null && has specs.iteHasIteNeedle iteText;
  iteHasIteToy =
    iteText != null
    && has specs.iteToyDefNeedle iteText
    && has specs.iteToyTextNeedle iteText;
  iteHooked =
    keptHitText != null && has specs.iteHookRejectsNeedle keptHitText;
  iteRow =
    if iteExists then specs.iteLeftoverRowPresent else specs.iteLeftoverRow;
  decideExists = exists specs.decideRel;
  decideText = readRel specs.decideRel;
  decideLines = linesOf specs.decideRel;
  decideHooked =
    keptHitText != null && has specs.decideHookRejectsNeedle keptHitText;
  decideRow =
    if decideExists then specs.decideLeftoverRowPresent else specs.decideLeftoverRow;
  condExists = exists specs.condRel;
  condText = readRel specs.condRel;
  condLines = linesOf specs.condRel;
  condHooked =
    keptHitText != null && has specs.condHookRejectsNeedle keptHitText;
  condRow =
    if condExists then specs.condLeftoverRowPresent else specs.condLeftoverRow;
  ditExists = exists specs.ditRel;
  ditText = readRel specs.ditRel;
  ditLines = linesOf specs.ditRel;
  ditHooked =
    keptHitText != null && has specs.ditHookRejectsNeedle keptHitText;
  ditRow =
    if ditExists then specs.ditLeftoverRowPresent else specs.ditLeftoverRow;
  bifExists = exists specs.bifRel;
  bifText = readRel specs.bifRel;
  bifLines = linesOf specs.bifRel;
  bifHooked =
    keptHitText != null && has specs.bifHookRejectsNeedle keptHitText;
  bifRow =
    if bifExists then specs.bifLeftoverRowPresent else specs.bifLeftoverRow;
  dcondExists = exists specs.dcondRel;
  dcondText = readRel specs.dcondRel;
  dcondLines = linesOf specs.dcondRel;
  dcondHooked =
    keptHitText != null && has specs.dcondHookRejectsNeedle keptHitText;
  dcondRow =
    if dcondExists then specs.dcondLeftoverRowPresent else specs.dcondLeftoverRow;
  orExists = exists specs.orRel;
  orText = readRel specs.orRel;
  orLines = linesOf specs.orRel;
  orHooked =
    keptHitText != null && has specs.orHookRejectsNeedle keptHitText;
  orRow =
    if orExists then specs.orLeftoverRowPresent else specs.orLeftoverRow;
  andExists = exists specs.andRel;
  andText = readRel specs.andRel;
  andLines = linesOf specs.andRel;
  andHooked =
    keptHitText != null && has specs.andHookRejectsNeedle keptHitText;
  andRow =
    if andExists then specs.andLeftoverRowPresent else specs.andLeftoverRow;
  notExists = exists specs.notRel;
  notText = readRel specs.notRel;
  notLines = linesOf specs.notRel;
  notHooked =
    keptHitText != null && has specs.notHookRejectsNeedle keptHitText;
  notRow =
    if notExists then specs.notLeftoverRowPresent else specs.notLeftoverRow;
  ifFindWordStructuralOk =
    ifText != null
    && has specs.ifFindWordStructuralCommentNeedle ifText
    && has specs.ifFindWordSkipIdentRestNeedle ifText;
  ifFindWordStaleCallOnLaptop =
    ifText != null && has specs.ifFindWordSkipIdentNeedle ifText;
  honesty = import ./honesty-flags.nix {
    inherit lib specs has;
    rows = {
      inherit ifRow iteRow decideRow condRow ditRow dcondRow bifRow orRow andRow notRow bneRow matchRow;
    };
    disk = {
      inherit ifExists ifHooked ifHasHasIf ifHasIfToy;
      inherit iteExists iteHooked iteHasHasIte iteHasIteToy;
      inherit decideExists decideHooked;
      inherit condExists condHooked;
      inherit ditExists ditHooked;
      inherit dcondExists dcondHooked;
      inherit bifExists bifHooked;
      inherit orExists orHooked;
      inherit andExists andHooked;
      inherit notExists notHooked;
      inherit bneExists matchExists;
    };
  };
  inherit (honesty)
    currentLacksS0sjpz1 staleCurrentWpc482yn staleCurrentIldbshq8 staleCurrentImsr2xgr staleCurrentVh2cdi00 staleCurrentXw41jhmv lacksRebuild17Green lacksRebuild18Green lacksRebuild19Green lacksRebuild22Green lacksRebuild23Green
    bifLacksToyFailClosed dcondLacksToyFailClosed orLacksToyFailClosed
    ;
  ctx = {
    inherit fixture slice closure commentsOnlyNeedle allTypes ownsElab ownsHit ownsDrop fullHost;
    inherit occupancyN occupancyProbe50 occupancyProbe49;
    inherit hkLines ucLines frLines hfLines keptHitLines;
    inherit hostFrontText hostFrontHooked pinText pinLiveRelOk useCheckProgressN;
    inherit leftoverNeedleFails ifFindWordStructuralOk ifFindWordStaleCallOnLaptop franciscoUseCheckExists rejectBoolBneExists rejectBoolBneLines rejectBoolBeqExists rejectBoolBeqLines beqThmExists notPrefixExists orInfixExists andInfixExists xorInfixExists;
    inherit ifExists ifLines iteExists iteLines decideExists decideLines;
    inherit condExists condLines ditExists ditLines dcondExists dcondLines;
    inherit bifExists bifLines orExists orLines andExists andLines notExists notLines probeText probeHasBan;
  };
  violations = import ./violations.nix { inherit lib specs honesty ctx; };
  ok = violations == [ ];
  yn = b: if b then "OK" else "FAIL";
  falseRow = v: lab:
    if v == null then "${lab} missing (FAIL)"
    else if v then "${lab} is true (FAIL)"
    else "${lab} is false";
  occRow =
    if occupancyN == null then "occupancy names missing (FAIL)"
    else if occupancyN == specs.occupancyStay && occupancyProbe49 && !occupancyProbe50 then
      "occupancy names stay ${toString occupancyN}"
    else "occupancy names counted ${toString occupancyN} (FAIL)";
  nRow = name: n: if n == null then "${name} lines missing (FAIL)" else "${name} lines: ${toString n}";
  remainingN =
    if useCheckProgressN == null then null
    else specs.progressDenom - useCheckProgressN;
  progressRow =
    if useCheckProgressN == null then "UseCheck progress missing (FAIL)"
    else if !hostFrontHooked then
      "UseCheck progress: ${toString useCheckProgressN} of ${toString specs.progressDenom} unhooked (FAIL)"
    else
      "UseCheck progress: ${toString useCheckProgressN} of ${toString specs.progressDenom} (derived from ${specs.walkerBaseName} seesDecls bounded strings; not keep count)";
  remainingRow =
    if remainingN == null then "UseCheck remaining missing (FAIL)"
    else
      "${toString remainingN} remaining of ${toString specs.progressDenom} (${toString specs.progressDenom} minus ${toString useCheckProgressN})";
  leftoverRow =
    if leftoverExhaustedOk then specs.leftoverExhaustedRow
    else "leftover pin spellings unused remain (FAIL)";
  findWordRow =
    if !ifExists then "findWord GREEN missing (RejectIf.lean is MISSING)"
    else if ifFindWordStaleCallOnLaptop then
      "findWord still has skipIdent (c :: rest) (FAIL)"
    else if ifFindWordStructuralOk then
      "findWord GREEN (structural-tail skipIdent rest; old findWord w (skipIdent (c :: rest)) gone on laptop source)"
    else "findWord GREEN missing (FAIL)";
  iteNRow =
    if iteLines == null then "RejectIte.lean is MISSING"
    else if iteHooked then
      "${nRow "RejectIte.lean" iteLines} (expect ${toString specs.iteExpect}; source GREEN; RejectIte fail-closed on wiky18mm; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectIte.lean" iteLines} (expect ${toString specs.iteExpect}; source GREEN not hooked; fail if over ${toString specs.lineFailOver})";
  decideNRow =
    if decideLines == null then "RejectDecideAscription.lean is MISSING"
    else
      "${nRow "RejectDecideAscription.lean" decideLines} (expect ${toString specs.decideExpect}; source GREEN; RejectDecideAscription fail-closed on wiky18mm; DecideAscriptionToy fail-closed; fail if over ${toString specs.lineFailOver})";
  condNRow =
    if condLines == null then "RejectCond.lean is MISSING"
    else
      "${nRow "RejectCond.lean" condLines} (expect ${toString specs.condExpect}; source GREEN; RejectCond fail-closed on l85gkygc; CondToy fail-closed; fail if over ${toString specs.lineFailOver})";
  ditNRow =
    if ditLines == null then "RejectDite.lean is MISSING"
    else if ditHooked then
      "${nRow "RejectDite.lean" ditLines} (expect ${toString specs.ditExpect}; RejectDite hook GREEN in source; DiteToy fail-closed on ELF vh2cdi00; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectDite.lean" ditLines} (expect ${toString specs.ditExpect}; source GREEN not hooked; fail if over ${toString specs.lineFailOver})";
  dcondNRow =
    if dcondLines == null then "RejectDcond.lean is MISSING"
    else if dcondHooked then
      "${nRow "RejectDcond.lean" dcondLines} (expect ${toString specs.dcondExpect}; RejectDcond hook GREEN in source; DcondToy fail-closed on ELF vh2cdi00; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectDcond.lean" dcondLines} (expect ${toString specs.dcondExpect}; source GREEN not fail-closed (unhooked); fail if over ${toString specs.lineFailOver})";
  bifNRow =
    if bifLines == null then "RejectBif.lean is MISSING"
    else if bifHooked then
      "${nRow "RejectBif.lean" bifLines} (expect ${toString specs.bifExpect}; RejectBif hook GREEN in source; RejectBif EXISTS 326; BifToy fail-closed on ELF vh2cdi00; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectBif.lean" bifLines} (expect ${toString specs.bifExpect}; RejectBif EXISTS 326; source GREEN not hooked; fail if over ${toString specs.lineFailOver})";
  orNRow =
    if orLines == null then "RejectOr.lean is MISSING"
    else if orHooked then
      "${nRow "RejectOr.lean" orLines} (expect ${toString specs.orExpect}; RejectOr hook GREEN in source; RejectOr fail-closed; OrToy fail-closed on ELF imsr2xgr; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectOr.lean" orLines} (expect ${toString specs.orExpect}; source GREEN not fail-closed (unhooked); fail if over ${toString specs.lineFailOver})";
  andNRow =
    if andLines == null then "RejectAnd.lean is MISSING"
    else if andHooked then
      "${nRow "RejectAnd.lean" andLines} (expect ${toString specs.andExpect}; RejectAnd hook GREEN in source; RejectAnd fail-closed; AndToy fail-closed on ELF p763g8sb; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectAnd.lean" andLines} (expect ${toString specs.andExpect}; source GREEN not fail-closed (unhooked); RejectAnd source GREEN not fail-closed on this ELF; fail if over ${toString specs.lineFailOver})";
  notNRow =
    if notLines == null then "RejectNot.lean is MISSING"
    else if notHooked then
      "${nRow "RejectNot.lean" notLines} (expect ${toString specs.notExpect}; source GREEN hooked; fail if over ${toString specs.lineFailOver})"
    else
      "${nRow "RejectNot.lean" notLines} (expect ${toString specs.notExpect}; source GREEN not fail-closed (unhooked); fail if over ${toString specs.lineFailOver})";
  keptHitNRow =
    if keptHitLines == null then "KeptHitKernel.lean lines missing (FAIL)"
    else "${nRow "KeptHitKernel.lean" keptHitLines} (expect ${toString specs.keptHitExpect}; conjunct line 238; fail if over ${toString specs.lineFailOver})";
  hkRow =
    if hkLines == null then "HostKernel.lean lines missing (FAIL)"
    else "${nRow "HostKernel.lean" hkLines} (expect ${toString specs.hostKernelExpect}; closed; not the exclusive remote job; fail if over ${toString specs.lineFailOver})";
  frRow =
    if frLines == null then "${specs.walkerBaseName} lines missing (FAIL)"
    else "${nRow specs.walkerBaseName frLines} (expect ${toString specs.franciscoExpect}; fail if over ${toString specs.lineFailOver}; historical 776 / 773 / 361 / 346 / 331 / 324 are not the live cell)";
  probeRow =
    if probeText == null then "probe source missing (FAIL)"
    else if probeHasBan then "probe source contains ${specs.probeBan} (FAIL)"
    else "probe source does not contain ${specs.probeBan}";
  summary =
    (if ok then "remaining-distance OK" else "remaining-distance FAILED")
    + "\nnamed allocate/free C: ${yn fixture.ok}"
    + "\ncomments-only C needle: ${if commentsOnlyNeedle.ok then "GREENED (FAIL)" else "fail-closed (ok false)"}"
    + "\nslice-copy gate: ${yn slice.ok}"
    + "\nbootstrap closure gate: ${yn closure.ok}"
    + "\n${falseRow allTypes "allTypesUseCheckDone"}"
    + "\n${falseRow ownsPkg "slakeOwnsPackageTypecheck"}"
    + "\n${falseRow fullHost "FullHost"}"
    + "\n${occRow}"
    + "\n${hkRow}"
    + "\n${keptHitNRow}"
    + "\n${nRow "UseCheck.lean" ucLines}"
    + "\n${frRow}"
    + "\n${franciscoUseCheckRow}"
    + "\n${progressRow}"
    + "\n${remainingRow}"
    + "\n${leftoverRow}"
    + "\n${bneRow}"
    + "\n${rejectBoolBneNRow}"
    + "\n${rejectBoolBeqNRow}"
    + "\n${beqThmRow}"
    + "\n${notPrefixRow}"
    + "\n${orInfixRow}"
    + "\n${andInfixRow}"
    + "\n${xorInfixRow}"
    + "\n${matchRow}"
    + "\n${findWordRow}"
    + "\n${ifRow}"
    + "\n${if ifExists then nRow "RejectIf.lean" ifLines else "RejectIf.lean is MISSING"}"
    + "\n${iteRow}"
    + "\n${iteNRow}"
    + "\n${decideRow}"
    + "\n${decideNRow}"
    + "\n${condRow}"
    + "\n${condNRow}"
    + "\n${ditRow}"
    + "\n${ditNRow}"
    + "\n${dcondRow}"
    + "\n${dcondNRow}"
    + "\n${bifRow}"
    + "\n${bifNRow}"
    + "\n${orRow}"
    + "\n${orNRow}"
    + "\n${andRow}"
    + "\n${andNRow}"
    + "\n${notRow}"
    + "\n${notNRow}"
    + "\n${nRow "HostFrontLiveUseCheckSource.lean" hfLines}"
    + "\n${probeRow}"
    + "\n${specs.keepRow}"
    + "\n${specs.emitRow}"
    + "\n${specs.keepClock}"
    + "\n${specs.lean4Clock}"
    + "\n${specs.mathlibClock}"
    + "\n${specs.dualClocksUnaddedRow}"
    + "\n${specs.millHeld}"
    + "\n${specs.remoteRow}"
    + "\n${specs.rebuild9GreenRow}"
    + "\n${specs.rebuild10BlockedRow}"
    + "\n${specs.rebuild11GreenRow}"
    + "\n${specs.rebuild12GreenRow}"
    + "\n${specs.rebuild13GreenRow}"
    + "\n${specs.rebuild14GreenRow}"
    + "\n${specs.rebuild15GreenRow}"
    + "\n${specs.rebuild16GreenRow}"
    + "\n${specs.rebuild17GreenRow}"
    + "\n${specs.rebuild18GreenRow}"
    + "\n${specs.rebuild19GreenRow}"
    + "\n${specs.rebuild20GreenRow}"
    + "\n${specs.rebuild21GreenRow}"
    + "\n${specs.rebuild22GreenRow}"
    + "\n${specs.rebuild23GreenRow}"
    + "\n${specs.rebuild24BlockedRow}"
    + (if ok then "" else "\n" + lib.concatStringsSep "\n" violations);
in
{
  inherit ok violations summary commentsOnlyNeedle;
  inherit allTypes fullHost occupancyN hkLines keptHitLines ucLines frLines hfLines;
  inherit useCheckProgressN remainingN hostFrontHooked pinLiveRelOk leftoverExhaustedOk;
  inherit bneExists matchExists ifExists iteExists decideExists condExists;
  inherit ditExists dcondExists bifExists orExists andExists notExists;
  inherit dcondHooked bifHooked orHooked andHooked notHooked;
  inherit currentLacksS0sjpz1 staleCurrentWpc482yn staleCurrentIldbshq8 staleCurrentImsr2xgr staleCurrentVh2cdi00 staleCurrentXw41jhmv lacksRebuild17Green lacksRebuild18Green lacksRebuild19Green lacksRebuild22Green lacksRebuild23Green;
  inherit bifLacksToyFailClosed dcondLacksToyFailClosed orLacksToyFailClosed;
}
