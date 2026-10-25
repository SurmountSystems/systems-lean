# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# Source-text count of acceptKept on HostFrontLive kept-reject names.
# Same kept-reject selection as kept-reject-hostfrontlive-decl.nix.
# Not a Lean execution. Not a bootstrap. Not nix build. Not flake wired.
# Decided yes only. A conjunct that this file does not decide is not a match.
# need is (hostFrontLive / 2) + 1, computed here. keptCount stays 4.
#
#   nice -n 19 nix eval --option cores 8 -f nix/slake-check-dest-layers/kept-reject-hostfrontlive-acceptkept.nix
let
  logPath = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-sba0a8g6-1.log";
  walkExact = "WALK_DONE names=2801 pass=107 fail=2694";
  repoRoot = "/home/hunter/Projects/ai/iso";

  boolTy = { k = "bool"; };
  natTy = { k = "nat"; };
  optionHost = { k = "option"; a = { k = "named"; n = "Host"; }; };

  fixtureArms = [
    {
      name = "acceptKeptTypes";
      thm = "typesFixtureKindMultOk_true";
      left = "typesFixtureKindMultOk";
      right = "typesFixtureProgramReady";
      lin = "typesFixtureMintId";
      leftKind = "bool";
    }
    {
      name = "acceptKeptProgram";
      thm = "programFixtureFoldOk_true";
      left = "programFixtureFoldOk";
      right = "programFixtureProgramReady";
      lin = "programFixtureMintId";
      leftKind = "bool";
    }
    {
      name = "acceptKeptCompilePath";
      thm = "lowerCompilePathFixtureCompose_isSome";
      left = "compilePathFixtureLiveView";
      right = "compilePathFixtureSpentView";
      lin = "compilePathFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptGraph";
      thm = "graphFixtureGraphReady_true";
      left = "graphFixtureGraphReady";
      right = "graphFixtureProgramReady";
      lin = "graphFixtureMintId";
      leftKind = "bool";
    }
    {
      name = "acceptKeptExtract";
      thm = "extractRuntimeFsGateReady_true";
      left = "extractFixtureLiveView";
      right = "extractFixtureSpentView";
      lin = "extractFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptApply";
      thm = "applyFixtureApplyOk_true";
      left = "applyFixtureLiveView";
      right = "applyFixtureSpentView";
      lin = "applyFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptBody";
      thm = "bodyFixtureComposeReady_true";
      left = "bodyFixtureLiveView";
      right = "bodyFixtureSpentView";
      lin = "bodyFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptCompose";
      thm = "composeFixtureComposeReady_true";
      left = "composeFixtureLiveView";
      right = "composeFixtureSpentView";
      lin = "composeFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptErasure";
      thm = "erasureFixtureComposeReady_true";
      left = "erasureFixtureLiveView";
      right = "erasureFixtureSpentView";
      lin = "erasureFixtureTagErased";
      leftKind = "option";
    }
    {
      name = "acceptKeptMult";
      thm = "multFixtureComposeReady_true";
      left = "multFixtureLiveView";
      right = "multFixtureSpentView";
      lin = "multFixtureMintId";
      leftKind = "option";
    }
    {
      name = "acceptKeptPlan";
      thm = "planFixtureComposeReady_true";
      left = "planFixtureLiveView";
      right = "planFixtureSpentView";
      lin = "planFixtureMintId";
      leftKind = "option";
    }
  ];

  armNames = [
    "KeptHitKernel.acceptKept"
    "KeptReject.acceptKept"
  ] ++ map (a: a.name) fixtureArms ++ [ "acceptKeptTheoremSurface" ];

  liveName = "KeptHitKernel.acceptKept";

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s;

  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));

  contains = needle: hay:
    builtins.length (builtins.split needle hay) > 1;

  identStart = c: builtins.match "[A-Za-z_]" c != null;
  identChar = c: builtins.match "[A-Za-z0-9_?']" c != null;

  isWs = c: c == " " || c == "\t" || c == "\r";

  trim = s:
    let
      n = builtins.stringLength s;
      idxs = builtins.genList (i: i) n;
      left = builtins.foldl' (st: i:
        if st.done then st
        else if isWs (builtins.substring i 1 s) then { done = false; at = i + 1; }
        else { done = true; at = i; }
      ) { done = false; at = 0; } idxs;
      right = builtins.foldl' (st: k:
        if st.done then st
        else
          let i = n - 1 - k; in
          if i < left.at then { done = true; at = left.at; }
          else if isWs (builtins.substring i 1 s) then { done = false; at = i; }
          else { done = true; at = i + 1; }
      ) { done = false; at = n; } idxs;
    in builtins.substring left.at (right.at - left.at) s;

  dropChars = s: k:
    let n = builtins.stringLength s; in
    if k >= n then "" else builtins.substring k (n - k) s;

  startsWord = s: word:
    let
      wl = builtins.stringLength word;
      sl = builtins.stringLength s;
    in
    if sl < wl then false
    else if builtins.substring 0 wl s != word then false
    else if sl == wl then true
    else
      let c = builtins.substring wl 1 s; in
      c == " " || c == "\t";

  skipMods = fuel: s:
    if fuel <= 0 then s
    else
      let t = trim s; in
      if startsWord t "noncomputable" then skipMods (fuel - 1) (dropChars t 13)
      else if startsWord t "protected" then skipMods (fuel - 1) (dropChars t 9)
      else if startsWord t "private" then skipMods (fuel - 1) (dropChars t 7)
      else if startsWord t "partial" then skipMods (fuel - 1) (dropChars t 7)
      else if startsWord t "unsafe" then skipMods (fuel - 1) (dropChars t 6)
      else t;

  firstIdent = s:
    let
      n = builtins.stringLength s;
      fin = builtins.foldl' (st: i:
        if st.done then st
        else
          let c = builtins.substring i 1 s; in
          if st.had then
            if identChar c then st // { acc = st.acc + c; }
            else { done = true; had = true; acc = st.acc; }
          else if identStart c then { done = false; had = true; acc = c; }
          else if c == " " || c == "\t" then st
          else { done = true; had = false; acc = ""; }
      ) { done = false; had = false; acc = ""; } (builtins.genList (i: i) n);
    in fin.acc;

  wordsOf = s:
    builtins.filter (w: w != "")
      (builtins.filter builtins.isString (builtins.split "[ \t]+" s));

  identAfterBy = ws:
    if ws == [ ] then null
    else if builtins.head ws != "by" then identAfterBy (builtins.tail ws)
    else
      let rest = builtins.tail ws; in
      if rest == [ ] then ""
      else
        let w = builtins.head rest; in
        if w == "" then ""
        else if identStart (builtins.substring 0 1 w) then firstIdent w
        else null;

  takeBy = s:
    identAfterBy (wordsOf s);

  thmHasDecide = want: src:
    if !contains want src then false
    else
      let
        fin = builtins.foldl' (st: line:
          if st.done then st
          else
            let t = skipMods 8 (trim line); in
            if startsWord t "theorem" then
              let
                body = trim (dropChars t 7);
                nm = firstIdent body;
              in
              if nm == want then { done = true; val = takeBy body == "decide"; }
              else st
            else st
        ) { done = false; val = false; } (linesOf src);
      in fin.val;

  hasBeq = s:
    let
      n = builtins.stringLength s;
      go = i:
        if i >= n then false
        else if builtins.substring i 3 s == "===" then go (i + 3)
        else if builtins.substring i 2 s == "==" then true
        else go (i + 1);
    in go 0;

  hasEqSign = s: contains "=" s;

  untilAssign = s:
    let
      n = builtins.stringLength s;
      fin = builtins.foldl' (st: i:
        if st.hit != null then st
        else if i + 1 >= n then st
        else if builtins.substring i 2 s == ":=" then { hit = i; }
        else st
      ) { hit = null; } (builtins.genList (i: i) n);
    in if fin.hit == null then s else builtins.substring 0 fin.hit s;

  colonType = s:
    let t = trim s; in
    if t == "" then null
    else if startsWord t ":=" || builtins.substring 0 2 t == ":=" then null
    else if builtins.substring 0 1 t == ":" then
      let body = trim (untilAssign (trim (dropChars t 1))); in
      if body == "" then null else body
    else null;

  indexOfIdent = s: name:
    let
      n = builtins.stringLength s;
      wn = builtins.stringLength name;
      fin = builtins.foldl' (st: i:
        if st.hit != null then st
        else if i + wn > n then st
        else if builtins.substring i wn s != name then st
        else
          let
            prev = if i == 0 then "" else builtins.substring (i - 1) 1 s;
            nxti = i + wn;
            nxt = if nxti >= n then "" else builtins.substring nxti 1 s;
            prevOk = prev == "" || !identChar prev;
            nxtOk = nxt == "" || !identChar nxt;
          in
          if prevOk && nxtOk then { hit = i; } else st
      ) { hit = null; } (builtins.genList (i: i) n);
    in fin.hit;

  ascriptionOnLine = name: line:
    let i = indexOfIdent line name; in
    if i == null then null
    else colonType (dropChars line (i + builtins.stringLength name));

  grab = src: name:
    builtins.foldl' (cur: line:
      if cur != null then cur else ascriptionOnLine name line
    ) null (linesOf src);

  isIdentStr = s:
    let n = builtins.stringLength s; in
    n > 0
    && identStart (builtins.substring 0 1 s)
    && builtins.all (i: identChar (builtins.substring i 1 s))
      (builtins.genList (i: i) n);

  parseHostType = fuel: s:
    if s == null || fuel <= 0 then null
    else
      let t = trim s; in
      if t == "" then null
      else if t == "Nat" then natTy
      else if t == "Bool" then boolTy
      else if t == "String" then { k = "string"; }
      else if t == "Mult" then { k = "mult"; }
      else if t == "True" || t == "Prop" then boolTy
      else if hasEqSign t then boolTy
      else if startsWord t "Option" then
        let inner = parseHostType (fuel - 1) (trim (dropChars t 6)); in
        if inner == null then null else { k = "option"; a = inner; }
      else if isIdentStr t then { k = "named"; n = t; }
      else null;

  tyEq = a: b:
    if a == null || b == null then false
    else if a.k != b.k then false
    else if a.k == "option" then tyEq a.a b.a
    else if a.k == "named" then a.n == b.n
    else true;

  firstThmType = src:
    builtins.foldl' (cur: line:
      if cur != null then cur
      else
        let t = skipMods 8 (trim line); in
        if startsWord t "theorem" then
          let
            rest = trim (dropChars t 7);
            nm = firstIdent rest;
          in
          if nm == "" then cur
          else
            let ty = colonType (dropChars rest (builtins.stringLength nm)); in
            if ty == null then cur else ty
        else cur
    ) null (linesOf src);

  beqRejects = src:
    if !contains "==" src then false
    else
      let ty = firstThmType src; in
      ty != null && hasBeq ty;

  typesOk = src: arm:
    let
      th = parseHostType 32 (grab src arm.thm);
      lf = parseHostType 32 (grab src arm.left);
      rt = parseHostType 32 (grab src arm.right);
      ln = parseHostType 32 (grab src arm.lin);
      wantLeft = if arm.leftKind == "bool" then boolTy else optionHost;
    in
    tyEq th boolTy && tyEq lf wantLeft && tyEq rt wantLeft && tyEq ln natTy;

  grabsAll = src: arm:
    grab src arm.thm != null
    && grab src arm.left != null
    && grab src arm.right != null
    && grab src arm.lin != null;

  classFixture = src: arm:
    if src == null then "undecided"
    else if !thmHasDecide arm.thm src then "no"
    else if beqRejects src then "no"
    else if !contains arm.left src || !contains arm.right src || !contains arm.lin src
    then "no"
    else if grabsAll src arm && !typesOk src arm then "no"
    else "undecided";

  kernelMarkers = src:
    contains "mutual" src && contains "decide" src && contains "Option" src
    && (contains "linear" src || contains "Linear" src
      || contains "typesFixtureMintId" src
      || contains "programFixtureMintId" src
      || contains "graphFixtureMintId" src
      || contains "compilePathFixtureMintId" src
      || contains "extractFixtureMintId" src
      || contains "applyFixtureMintId" src
      || contains "bodyFixtureMintId" src
      || contains "composeFixtureMintId" src
      || contains "multFixtureMintId" src
      || contains "planFixtureMintId" src);

  classKernel = src:
    if src == null then "undecided"
    else if !kernelMarkers src then "no"
    else "undecided";

  classSurface = src:
    if src == null then "undecided"
    else if !contains "namespace" src || !contains "theorem" src then "no"
    else "undecided";

  classifyAll = src:
    builtins.foldl' (acc: arm:
      acc // { ${arm.name} = classFixture src arm; }
    ) {
      "KeptHitKernel.acceptKept" = classKernel src;
      "KeptReject.acceptKept" = classKernel src;
      "acceptKeptTheoremSurface" = classSurface src;
    } fixtureArms;

  emptyArm = { yes = 0; no = 0; undecided = 0; };
  emptyCounts = builtins.listToAttrs (map (n: {
    name = n;
    value = emptyArm;
  }) armNames);

  addC = acc: name: cls: c:
    let a = acc.${name}; in
    if a.${cls} or null == null then builtins.throw "bad class ${cls}"
    else acc // { ${name} = a // { ${cls} = a.${cls} + c; }; };

  step = st: line:
    let
      isBanner = builtins.match "===.*" line != null;
      isFalse = builtins.match "slake-check checker returned false for .*" line != null;
      isTrue = builtins.match "(slake-check checker returned true) for .*" line;
      isExit = builtins.match "EXIT=([0-9]+) NAME=(.*)" line;
    in
    if line == "" then st
    else if isBanner then st // { expectLayer = false; pending = null; }
    else if isExit != null then
      let
        kept = builtins.elemAt isExit 0 == "1" && st.pending == "kept reject";
        name = builtins.elemAt isExit 1;
        restM = builtins.match "SystemsLean\\.HostFrontLive(.*)" name;
        inSet = kept && restM != null;
        prevN = st.names.${name} or 0;
      in st // {
        expectLayer = false;
        pending = null;
        total = st.total + (if inSet then 1 else 0);
        names = if inSet then st.names // { ${name} = prevN + 1; } else st.names;
      }
    else if isFalse then st // { expectLayer = true; }
    else if st.expectLayer then st // { expectLayer = false; pending = line; }
    else if isTrue != null then st // { pending = builtins.head isTrue; }
    else st;

  emptyWalk = { expectLayer = false; pending = null; total = 0; names = { }; };

  must = label: cond: if cond then true else builtins.throw "self-test ${label}";

  typesToy =
    "namespace SystemsLean.CompilePath\n"
    + "def typesFixtureMintId : Nat := 5\n"
    + "def typesFixtureKindMultOk : Bool := true\n"
    + "def typesFixtureProgramReady : Bool := true\n"
    + "theorem typesFixtureKindMultOk_true : "
    + "typesFixtureKindMultOk = true := by decide\n"
    + "end SystemsLean.CompilePath\n";

  optionToy =
    "def compilePathFixtureMintId : Nat := 0\n"
    + "def compilePathFixtureLiveView : Option Host := none\n"
    + "def compilePathFixtureSpentView : Option Host := none\n"
    + "theorem lowerCompilePathFixtureCompose_isSome : "
    + "lowerCompilePathFixtureCompose.isSome = true := by decide\n";

  typesArm = builtins.head fixtureArms;
  compileArm = builtins.elemAt fixtureArms 2;

  selfTest =
    must "beq" (hasBeq "1 == 1")
    && must "not-eq" (!hasBeq "a = true")
    && must "not-eqeqeq" (!hasBeq "===")
    && must "true-ty" (tyEq (parseHostType 20 "True") boolTy)
    && must "nat-ty" (tyEq (parseHostType 20 "Nat") natTy)
    && must "bool-ty" (tyEq (parseHostType 20 "Bool") boolTy)
    && must "opt-ty" (tyEq (parseHostType 20 "Option Host") optionHost)
    && must "eq-ty" (tyEq (parseHostType 20 "typesFixtureKindMultOk = true") boolTy)
    && must "thm-toy" (thmHasDecide "typesFixtureKindMultOk_true" typesToy)
    && must "thm-hollow" (!thmHasDecide "typesFixtureKindMultOk_true" "namespace N\nend N\n")
    && must "thm-bang" (thmHasDecide "typesFixtureKindMultOk_true"
      "theorem typesFixtureKindMultOk_true : Bool := by decide!\n")
    && must "thm-native" (!thmHasDecide "typesFixtureKindMultOk_true"
      "theorem typesFixtureKindMultOk_true : Bool := by native_decide\n")
    && must "thm-noncomp" (thmHasDecide "typesFixtureKindMultOk_true"
      "noncomputable theorem typesFixtureKindMultOk_true : Bool := by decide\n")
    && must "beq-toy" (beqRejects "theorem th : 1 == 1 := by decide\n")
    && must "beq-true" (!beqRejects "theorem th : True := by decide\n")
    && must "beq-prop" (!beqRejects
      "theorem th : linearFixtureProgramReady = true := by decide\n")
    && must "types-ok" (typesOk typesToy typesArm)
    && must "option-ok" (typesOk optionToy compileArm)
    && must "class-toy" (classFixture typesToy typesArm == "undecided")
    && must "kern-hollow" (classKernel "namespace N\nend N\n" == "no")
    && must "kern-hit" (classKernel
      ("mutual\ndef linearN : Nat := 0\n"
        + "def leftN : Option Host := none\n"
        + "theorem th : True := by decide\n") == "undecided")
    && must "surf-no" (classSurface "theorem t : True := by decide\n" == "no")
    && must "surf-maybe" (classSurface
      "namespace N\ntheorem t : True := trivial\n" == "undecided");

  realRaw = builtins.readFile logPath;
  realLines = linesOf realRaw;
  walkOk = builtins.any (l: l == walkExact) realLines;
  fin = builtins.foldl' step emptyWalk realLines;
  hostFrontLive = fin.total;
  nameSum = builtins.foldl' (s: name: s + fin.names.${name}) 0
    (builtins.attrNames fin.names);

  load = name:
    let
      pref = "SystemsLean.";
      rest = builtins.substring (builtins.stringLength pref)
        (builtins.stringLength name - builtins.stringLength pref) name;
      path = repoRoot + "/src/systems/SystemsLean/${rest}.lean";
    in
    if builtins.pathExists path then builtins.readFile path else null;

  counts = builtins.foldl' (acc: name:
    let
      c = fin.names.${name};
      src = load name;
      cls = classifyAll src;
    in
    builtins.foldl' (acc2: arm:
      addC acc2 arm (cls.${arm}) c
    ) acc armNames
  ) emptyCounts (builtins.attrNames fin.names);

  armSumOk = name:
    let a = counts.${name}; in
    a.yes + a.no + a.undecided == hostFrontLive;

  sumsOk = builtins.all armSumOk armNames;
  need = builtins.div hostFrontLive 2 + 1;
  liveYes = (counts.${liveName}).yes;
  verdict = if liveYes >= need then "MAJORITY" else "BLOCKED";

  oneArm = name:
    let a = counts.${name}; in
    "${name}=${toString a.yes}\n"
    + "${name}_no=${toString a.no}\n"
    + "${name}_undecided=${toString a.undecided}\n"
    + "${name}_live=${if name == liveName then "yes" else "no"}\n";

  text =
    "hostFrontLive=${toString hostFrontLive}\n"
    + "need=${toString need}\n"
    + "verdict=${verdict}\n"
    + "liveShortCircuit=${liveName}\n"
    + "reading=source text, not a Lean execution\n"
    + "count=decided yes only\n"
    + builtins.concatStringsSep "" (map oneArm armNames);
in
if !selfTest then builtins.throw "self-test refused"
else if !walkOk then builtins.throw "not sampled"
else if nameSum != hostFrontLive then builtins.throw "name sum diverged"
else if !sumsOk then builtins.throw "arm sum diverged"
else text
