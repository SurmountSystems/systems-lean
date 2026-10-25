# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# HostFrontLive kept-reject names, classified by the first Lean
# declaration keyword in the on-disk source. Counts come from the
# walk log and from those sources. This file does not store a walk
# total. Not wired into flake.nix. It does not name a .lean land
# target: no decl kind has exactly one module-returning parser.
#
# Kept-reject selection matches kept-reject-hostfrontlive-other.nix.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept
# reject only when the pending layer line is exactly "kept reject".
# The name must match SystemsLean.HostFrontLive.
#
#   nice -n 19 nix eval --impure --raw --option cores 8 -f nix/slake-check-dest-layers/kept-reject-hostfrontlive-decl.nix
let
  logPath = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-sba0a8g6-1.log";
  walkExact = "WALK_DONE names=2801 pass=107 fail=2694";
  repoRoot = /home/hunter/Projects/ai/iso;
  declKinds = [
    "theorem"
    "lemma"
    "def"
    "structure"
    "inductive"
    "class"
    "instance"
    "abbrev"
    "axiom"
    "opaque"
  ];
  # Exactly one module-returning parser for that kind, or null.
  # The search did not find exactly one for any kind.
  parsers = {
    theorem = null;
    lemma = null;
    def = null;
    structure = null;
    inductive = null;
    class = null;
    instance = null;
    abbrev = null;
    axiom = null;
    opaque = null;
  };
  zero = {
    theorem = 0;
    lemma = 0;
    def = 0;
    structure = 0;
    inductive = 0;
    class = 0;
    instance = 0;
    abbrev = 0;
    axiom = 0;
    opaque = 0;
    missingFile = 0;
    none = 0;
  };
  bucketKeys = declKinds ++ [ "missingFile" "none" ];

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s;
  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));
  isKw = t: builtins.elem t declKinds;
  partText = p:
    if builtins.isString p then p
    else if p == [ ] then ""
    else builtins.head p;
  rejoin = ps: builtins.concatStringsSep "" (map partText ps);
  hashStr = n: builtins.concatStringsSep "" (builtins.genList (_: "#") n);
  rawHashes = prev:
    let
      m1 = builtins.match "(r#*)" prev;
      m2 = builtins.match ".*[^A-Za-z0-9_'](r#*)" prev;
      g =
        if m1 != null then builtins.head m1
        else if m2 != null then builtins.head m2
        else null;
    in
    if g == null then null else builtins.stringLength g - 1;

  firstKeyword = text:
    let
      parts = builtins.split "(@|[[]|[]]|[A-Za-z0-9_']+)" text;
      fin = builtins.foldl' (st: p:
        if st.kind != null then st
        else if builtins.isString p then st
        else
          let tok = builtins.head p; in
          if tok == "@" then st // { pend = true; }
          else if tok == "[" then
            if st.pend || st.skip > 0 then st // { pend = false; skip = st.skip + 1; }
            else st
          else if tok == "]" then
            if st.skip > 0 then st // { skip = st.skip - 1; }
            else st
          else if st.skip > 0 then st
          else if st.pend then
            st // { pend = false; kind = if isKw tok then tok else null; }
          else if isKw tok then st // { kind = tok; }
          else st
      ) { skip = 0; pend = false; kind = null; } parts;
    in fin.kind;

  shrink = here: next:
    if builtins.stringLength next >= builtins.stringLength here && next != ""
    then builtins.throw "scan did not shrink"
    else next;

  scanCode = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        parts = builtins.split "(--|/-|\")" line;
        go = prev: ps:
          if ps == [ ] then st // { mode = "code"; }
          else if builtins.isString (builtins.head ps) then
            let
              chunk = builtins.head ps;
              k = firstKeyword chunk;
            in
            if k != null then st // { kind = k; mode = "code"; }
            else go chunk (builtins.tail ps)
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
              joined = shrink line (rejoin rest);
            in
            if m == "--" then st // { mode = "code"; }
            else if m == "/-" then
              scanBlk (fuel - 1) (st // { mode = "blk"; depth = 1; }) joined
            else if m == "\"" then
              let h = rawHashes prev; in
              if h == null then
                scanStr (fuel - 1) (st // { mode = "str"; }) joined
              else
                scanRaw (fuel - 1) (st // { mode = "raw"; rawNeed = h; }) joined
            else st;
      in go "" parts;

  scanStr = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        parts = builtins.split "(\\\\\\\\|\\\\\"|\")" line;
        go = ps:
          if ps == [ ] then st // { mode = "str"; }
          else if builtins.isString (builtins.head ps) then go (builtins.tail ps)
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
            in
            if m == "\"" then
              scanCode (fuel - 1) (st // { mode = "code"; }) (shrink line (rejoin rest))
            else go rest;
      in go parts;

  scanRaw = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        closer = "\"" + hashStr st.rawNeed;
        parts = builtins.split closer line;
        go = ps:
          if ps == [ ] then st // { mode = "raw"; }
          else if builtins.isString (builtins.head ps) then go (builtins.tail ps)
          else
            let
              rest = builtins.tail ps;
              followedByHash =
                rest != [ ] && builtins.isString (builtins.head rest)
                && builtins.substring 0 1 (builtins.head rest) == "#";
            in
            if st.rawNeed > 0 && followedByHash then go rest
            else
              scanCode (fuel - 1) (st // { mode = "code"; rawNeed = 0; })
                (shrink line (rejoin rest));
      in go parts;

  scanBlk = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        blkRe = "(--|/-|-/)";
        parts = builtins.split blkRe line;
        go = depth: ps:
          if ps == [ ] then st // { mode = "blk"; depth = depth; }
          else if builtins.isString (builtins.head ps) then go depth (builtins.tail ps)
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
            in
            if m == "--" then go depth rest
            else if m == "/-" then go (depth + 1) rest
            else if m == "-/" then
              if depth <= 1 then
                scanCode (fuel - 1) (st // { mode = "code"; depth = 0; })
                  (shrink line (rejoin rest))
              else go (depth - 1) rest
            else go depth rest;
      in go st.depth parts;

  scanLine = st: line:
    if st.kind != null then st
    else if st.mode == "raw" then scanRaw 40 st line
    else if st.mode == "str" then scanStr 40 st line
    else if st.mode == "blk" then scanBlk 40 st line
    else scanCode 40 st line;

  classifyText = src:
    let
      n = builtins.stringLength src;
      go = win:
        let
          w = if win >= n then n else win;
          past = if w >= n then "" else builtins.substring w 1 src;
          slice = builtins.substring 0 w src + past;
          st0 = { kind = null; mode = "code"; depth = 0; rawNeed = 0; };
          fin = builtins.foldl' (st: line:
            if st.kind != null then st else scanLine st line
          ) st0 (linesOf slice);
        in
        if fin.kind != null then fin.kind
        else if w >= n then null
        else go (win * 2);
    in go 8192;

  kindOrNone = k: if k == null then "none" else k;
  must = label: got: want:
    let g = kindOrNone got; in
    if g == want then true else builtins.throw "synthetic ${label} got ${g}";

  sumBuckets = b:
    builtins.foldl' (s: k: s + (b.${k} or 0)) 0 bucketKeys;

  decide = buckets: total:
    let
      half = builtins.div total 2;
      overs = builtins.filter (k: (buckets.${k} or 0) > half) declKinds;
      over =
        if overs == [ ] then "none"
        else if builtins.length overs == 1 then builtins.head overs
        else "many";
      p =
        if over == "none" || over == "many" then null
        else parsers.${over} or null;
      land = if p == null then "none" else p;
      status = if land == "none" then "BLOCKED" else "LAND";
    in { inherit half over land status; };

  render = total: buckets: decision:
    "status=${decision.status}\n"
    + "set=${toString total}\n"
    + "halfFloor=${toString decision.half}\n"
    + "theorem=${toString (buckets.theorem or 0)}\n"
    + "lemma=${toString (buckets.lemma or 0)}\n"
    + "def=${toString (buckets.def or 0)}\n"
    + "structure=${toString (buckets.structure or 0)}\n"
    + "inductive=${toString (buckets.inductive or 0)}\n"
    + "class=${toString (buckets.class or 0)}\n"
    + "instance=${toString (buckets.instance or 0)}\n"
    + "abbrev=${toString (buckets.abbrev or 0)}\n"
    + "axiom=${toString (buckets.axiom or 0)}\n"
    + "opaque=${toString (buckets.opaque or 0)}\n"
    + "missingFile=${toString (buckets.missingFile or 0)}\n"
    + "none=${toString (buckets.none or 0)}\n"
    + "bucketSum=${toString (sumBuckets buckets)}\n"
    + "overHalf=${decision.over}\n"
    + "landTarget=${decision.land}\n";

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

  analyze = load: raw:
    let
      fin = builtins.foldl' step emptyWalk (linesOf raw);
      buckets = builtins.foldl' (acc: name:
        let
          c = fin.names.${name};
          loaded = load name;
          k = if loaded == null then "missingFile" else kindOrNone (classifyText loaded);
        in acc // { ${k} = (acc.${k} or 0) + c; }
      ) zero (builtins.attrNames fin.names);
      total = fin.total;
      bucketSum = sumBuckets buckets;
      decision = decide buckets total;
    in
    if bucketSum != total then builtins.throw "bucket sum diverged"
    else { inherit buckets total bucketSum decision; text = render total buckets decision; };

  scannerOk =
    must "lineComment" (classifyText ''
      -- theorem
      def synDef : Nat := 0
    '') "def"
    && must "blockComment" (classifyText ''
      /-
      def
      -/
      theorem synThm : True := trivial
    '') "theorem"
    && must "attr" (classifyText ''
      @[def] structure SynBox where
    '') "structure"
    && must "string" (classifyText ''
      "theorem"
      def later : Nat := 0
    '') "def"
    && must "raw" (classifyText ''
      #eval r#"say "theorem" please"#
      abbrev synA := 1
    '') "abbrev"
    && must "nested" (classifyText ''
      /- /- def -/ theorem -/
      lemma synL : True := trivial
    '') "lemma"
    && must "definitionWord" (classifyText ''
      definition synD : Nat := 0
    '') "none"
    && must "header" (classifyText ''
      import Foo
      namespace Bar
      open Baz
    '') "none"
    && must "mutual" (classifyText ''
      mutual
      theorem synM : True := trivial
    '') "theorem"
    && must "class" (classifyText ''
      protected class SynKlass where
    '') "class"
    && must "instance" (classifyText ''
      instance : Repr Nat where
    '') "instance"
    && must "inductive" (classifyText ''
      partial inductive SynInd where
    '') "inductive"
    && must "axiom" (classifyText ''
      unsafe axiom synAx : True
    '') "axiom"
    && must "opaque" (classifyText ''
      opaque synOp : Nat
    '') "opaque"
    && must "classical" (classifyText ''
      classical
      def synC : Nat := 0
    '') "def"
    && must "classicalOnly" (classifyText "classical\n") "none";

  gateOk =
    let
      blocked = decide { def = 3; theorem = 1; } 4;
      under = decide { def = 2; theorem = 2; } 4;
    in
    blocked.status == "BLOCKED" && blocked.land == "none" && blocked.over == "def"
    && blocked.half == 2
    && under.status == "BLOCKED" && under.over == "none" && under.land == "none";

  synSrc = {
    "SystemsLean.HostFrontLiveSynDefA" = ''
      -- theorem
      def synDef : Nat := 0
    '';
    "SystemsLean.HostFrontLiveSynDefB" = ''
      private noncomputable def synDefB : Nat := 1
    '';
    "SystemsLean.HostFrontLiveSynThm" = ''
      /-
      def
      -/
      theorem synThm : True := trivial
    '';
    "SystemsLean.HostFrontLiveSynStruct" = ''
      @[def] structure SynBox where
    '';
    "SystemsLean.HostFrontLiveSynNone" = ''
      import Foo
      namespace Bar
      open Baz
    '';
  };
  synLoad = name: synSrc.${name} or null;
  synBlock = n: name: layer: code: [
    "=== [${toString n}] --slake-check ${name} ==="
    "slake-check checker returned false for ${name}"
    layer
    "note ${name}"
    "EXIT=${code} NAME=${name}"
  ];
  syntheticLog = builtins.concatStringsSep "\n" (
    [ "EXIT=1 NAME=SystemsLean.HostFrontLiveSynBare" ]
    ++ synBlock 1 "SystemsLean.HostFrontLiveSynDefA" "kept reject" "1"
    ++ synBlock 2 "SystemsLean.HostFrontLiveSynDefB" "kept reject" "1"
    ++ synBlock 3 "SystemsLean.HostFrontLiveSynThm" "kept reject" "1"
    ++ synBlock 4 "SystemsLean.HostFrontLiveSynStruct" "kept reject" "1"
    ++ synBlock 5 "SystemsLean.HostFrontLiveSynNone" "kept reject" "1"
    ++ synBlock 6 "SystemsLean.HostFrontLiveSynMiss" "kept reject" "1"
    ++ synBlock 7 "SystemsLean.HostFrontLiveSynDrop" "dropped layer" "1"
    ++ synBlock 8 "SystemsLean.HostFrontGoldens" "kept reject" "1"
    ++ synBlock 9 "SystemsLean.OtherKept" "kept reject" "1"
    ++ synBlock 10 "SystemsLean.HostFrontLiveSynZero" "kept reject" "0"
    ++ [
      "=== [11] --slake-check SystemsLean.HostFrontLiveSynClear ==="
      "slake-check checker returned false for SystemsLean.HostFrontLiveSynClear"
      "=== [12] cleared ==="
      "EXIT=1 NAME=SystemsLean.HostFrontLiveSynClear"
      "slake-check checker returned true for SystemsLean.HostFrontLiveSynTrue"
      "EXIT=0 NAME=SystemsLean.HostFrontLiveSynTrue"
    ]
  );
  syn = analyze synLoad syntheticLog;
  syntheticOk =
    scannerOk && gateOk
    && syn.total == 6
    && syn.bucketSum == 6
    && syn.buckets.def == 2
    && syn.buckets.theorem == 1
    && syn.buckets.structure == 1
    && syn.buckets.none == 1
    && syn.buckets.missingFile == 1
    && syn.buckets.lemma == 0
    && syn.buckets.inductive == 0
    && syn.buckets.class == 0
    && syn.buckets.instance == 0
    && syn.buckets.abbrev == 0
    && syn.buckets.axiom == 0
    && syn.buckets.opaque == 0
    && syn.decision.half == 3
    && syn.decision.over == "none"
    && syn.decision.land == "none"
    && syn.decision.status == "BLOCKED"
    && syn.total < 20
    && syn.buckets.def < 20;

  canaryPath = repoRoot + "/src/systems/SystemsLean/HostFrontLiveBootstrapHonestySource.lean";
  canary = kindOrNone (classifyText (builtins.readFile canaryPath));

  realLoad = name:
    let
      pref = "SystemsLean.";
      rest = builtins.substring (builtins.stringLength pref)
        (builtins.stringLength name - builtins.stringLength pref) name;
      path = repoRoot + "/src/systems/SystemsLean/${rest}.lean";
    in
    if builtins.pathExists path then builtins.readFile path else null;

  realRaw = builtins.readFile logPath;
  realLines = linesOf realRaw;
  walkOk = builtins.any (l: l == walkExact) realLines;
  real = analyze realLoad realRaw;
in
if !syntheticOk then builtins.throw ("synthetic classifier refused\n" + syn.text)
else if canary != "def" then builtins.throw "canary ${canary}"
else if !walkOk then builtins.throw "not sampled"
else
  real.text + "synthetic=pass\n"
