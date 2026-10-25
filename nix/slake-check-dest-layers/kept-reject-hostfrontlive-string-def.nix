# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# HostFrontLive kept-reject names whose first declaration outside
# comments is the parseHonestyKeep String-literal arm
# (HostFront.lean, the "def" :: name :: ":" :: "String" :: ":=" :: lit :: [] arm).
# Counts are recomputed from the walk log and the sources.
# This file does not store a walk total. Not wired into flake.nix.
# It does not edit Lean.
#
# Kept-reject selection matches kept-reject-hostfrontlive-decl.nix.
# EXIT=1, pending layer line exactly "kept reject", name matches
# SystemsLean.HostFrontLive. Absent source counts as missingFile.
#
# stringDef: that first declaration is exactly keyword def, a name,
# colon, String, :=, one double-quoted literal, and the command ends.
# Bool, a function type, a where clause, a modifier, an attribute,
# or a later def is otherDef.
#
# Synthetic log (sources live in this file, not on disk):
#   SLAKE_STRING_DEF_LOG=/tmp/slake-string-def-synthetic.log \
#     nice -n 19 nix eval --impure --raw --option cores 8 \
#     -f nix/slake-check-dest-layers/kept-reject-hostfrontlive-string-def.nix
# Real walk log (unset that variable):
#   nice -n 19 nix eval --impure --raw --option cores 8 \
#     -f nix/slake-check-dest-layers/kept-reject-hostfrontlive-string-def.nix
let
  realLog = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-sba0a8g6-1.log";
  synLog = "/tmp/slake-string-def-synthetic.log";
  envLog = builtins.getEnv "SLAKE_STRING_DEF_LOG";
  logPath = if envLog == "" then realLog else envLog;
  useSyn = logPath == synLog;
  walkExact = "WALK_DONE names=2801 pass=107 fail=2694";
  repo = "/home/hunter/Projects/ai/iso";
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
  keywords = [
    "module" "import" "namespace" "end" "open" "inductive" "deriving" "def"
    "check" "match" "some" "none" "true" "false" "var" "const" "app"
    ":=" ":" "->" "|" "=>" "(" ")" "_"
  ];

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s;
  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));
  isKw = t: builtins.elem t declKinds;
  isKeyword = s: builtins.elem s keywords;
  isNatLit = s: builtins.match "[0-9]+" s != null;
  isStringLit = s:
    let n = builtins.stringLength s; in
    n >= 2
    && builtins.substring 0 1 s == "\""
    && builtins.substring (n - 1) 1 s == "\"";
  isIdent = s: s != "" && !isKeyword s && !isNatLit s && !isStringLit s;
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
  shrink = here: next:
    if builtins.stringLength next >= builtins.stringLength here && next != ""
    then builtins.throw "scan did not shrink"
    else next;
  leadingWs = s:
    let m = builtins.match "([ \t]*).*" s; in
    if m == null then 0 else builtins.stringLength (builtins.head m);
  tokenize = s:
    if s == "" then [ ]
    else
      builtins.filter (p: builtins.isString p && p != "")
        (builtins.split "[ \t]+" s);
  trim = s:
    let
      n = builtins.stringLength s;
      cut = n > 400;
      t = if cut then builtins.substring 0 400 s else s;
      m2 = builtins.match "[ \t]*([^ \t].*[^ \t])[ \t]*" t;
      m1 = builtins.match "[ \t]*([^ \t])[ \t]*" t;
      body =
        if m2 != null then builtins.head m2
        else if m1 != null then builtins.head m1
        else "";
    in body + (if cut then "..." else "");

  eatText = st: text:
    if st.found != null then st
    else
      let
        parts = builtins.split "(@|[[]|[]]|[A-Za-z0-9_']+)" text;
        step = st: p:
          if st.found != null then st
          else if builtins.isString p then st
          else
            let tok = builtins.head p; in
            if tok == "@" then st // { pend = true; }
            else if tok == "[" then
              if st.pend || st.skip > 0 then
                st // {
                  pend = false;
                  skip = st.skip + 1;
                  attrLine =
                    if st.pend && st.attrLine == null then st.lineNo
                    else st.attrLine;
                }
              else st
            else if tok == "]" then
              if st.skip > 0 then st // { skip = st.skip - 1; }
              else st
            else if st.skip > 0 then st
            else if st.pend then
              if isKw tok then
                st // {
                  pend = false;
                  found = {
                    kw = tok;
                    line = st.lineNo;
                    attr = st.attrLine != null && st.attrLine != st.lineNo;
                  };
                }
              else st // { pend = false; }
            else if isKw tok then
              st // {
                found = {
                  kw = tok;
                  line = st.lineNo;
                  attr = st.attrLine != null && st.attrLine != st.lineNo;
                };
              }
            else st;
      in builtins.foldl' step st parts;

  scanCode = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        parts = builtins.split "(--|/-|\")" line;
        go = prev: ps: stHere:
          if ps == [ ] then stHere // { mode = "code"; }
          else if builtins.isString (builtins.head ps) then
            let
              chunk = builtins.head ps;
              st2 = eatText stHere chunk;
            in go chunk (builtins.tail ps) (st2 // { code = st2.code + chunk; })
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
              joined = shrink line (rejoin rest);
            in
            if m == "--" then stHere // { mode = "code"; }
            else if m == "/-" then
              scanBlk (fuel - 1) (stHere // { mode = "blk"; depth = 1; }) joined
            else if m == "\"" then
              let h = rawHashes prev; in
              if h == null then
                scanStr (fuel - 1) (stHere // { mode = "str"; code = stHere.code + "\""; }) joined
              else
                scanRaw (fuel - 1) (stHere // { mode = "raw"; rawNeed = h; code = stHere.code + "\""; }) joined
            else stHere;
      in go "" parts st;

  scanStr = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        parts = builtins.split "(\\\\\\\\|\\\\\"|\")" line;
        go = ps: stHere:
          if ps == [ ] then stHere // { mode = "str"; }
          else if builtins.isString (builtins.head ps) then
            go (builtins.tail ps) (stHere // { code = stHere.code + builtins.head ps; })
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
            in
            if m == "\"" then
              scanCode (fuel - 1) (stHere // { mode = "code"; code = stHere.code + "\""; })
                (shrink line (rejoin rest))
            else go rest (stHere // { code = stHere.code + m; });
      in go parts st;

  scanRaw = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        closer = "\"" + hashStr st.rawNeed;
        parts = builtins.split closer line;
        go = ps: stHere:
          if ps == [ ] then stHere // { mode = "raw"; }
          else if builtins.isString (builtins.head ps) then
            go (builtins.tail ps) (stHere // { code = stHere.code + builtins.head ps; })
          else
            let
              rest = builtins.tail ps;
              followedByHash =
                rest != [ ] && builtins.isString (builtins.head rest)
                && builtins.substring 0 1 (builtins.head rest) == "#";
            in
            if st.rawNeed > 0 && followedByHash then
              go rest (stHere // { code = stHere.code + closer; })
            else
              scanCode (fuel - 1) (stHere // { mode = "code"; rawNeed = 0; code = stHere.code + closer; })
                (shrink line (rejoin rest));
      in go parts st;

  scanBlk = fuel: st: line:
    if fuel <= 0 then builtins.throw "scan fuel"
    else
      let
        blkRe = "(--|/-|-/)";
        parts = builtins.split blkRe line;
        go = depth: ps: stHere:
          if ps == [ ] then stHere // { mode = "blk"; depth = depth; }
          else if builtins.isString (builtins.head ps) then
            go depth (builtins.tail ps) stHere
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
            in
            if m == "--" then go depth rest stHere
            else if m == "/-" then go (depth + 1) rest stHere
            else if m == "-/" then
              if depth <= 1 then
                scanCode (fuel - 1) (stHere // { mode = "code"; depth = 0; })
                  (shrink line (rejoin rest))
              else go (depth - 1) rest stHere
            else go depth rest stHere;
      in go st.depth parts st;

  scanLine = st: line:
    if st.mode == "raw" then scanRaw 64 st line
    else if st.mode == "str" then scanStr 64 st line
    else if st.mode == "blk" then scanBlk 64 st line
    else scanCode 64 st line;

  reverse = xs: builtins.foldl' (acc: x: [ x ] ++ acc) [ ] xs;

  locate = src:
    let
      fin = builtins.foldl' (st: line:
        if st.stop then st
        else
          let
            scanned = scanLine (st // { code = ""; }) line;
            nonempty = tokenize scanned.code != [ ];
            item = {
              indent = leadingWs line;
              code = scanned.code;
              orig = line;
            };
          in scanned // {
            code = "";
            lineNo = st.lineNo + 1;
            rev = [ item ] ++ st.rev;
            stop = st.found != null && nonempty;
          }
      ) {
        mode = "code";
        depth = 0;
        rawNeed = 0;
        skip = 0;
        pend = false;
        found = null;
        attrLine = null;
        code = "";
        lineNo = 0;
        rev = [ ];
        stop = false;
      } (linesOf src);
    in {
      found = fin.found;
      lines = reverse fin.rev;
    };

  patternMatch = code:
    let t = tokenize code; in
    builtins.length t == 6
    && builtins.elemAt t 0 == "def"
    && isIdent (builtins.elemAt t 1)
    && builtins.elemAt t 2 == ":"
    && builtins.elemAt t 3 == "String"
    && builtins.elemAt t 4 == ":="
    && isStringLit (builtins.elemAt t 5);

  commandContinues = loc:
    let
      start = loc.found.line;
      ind = (builtins.elemAt loc.lines start).indent;
      n = builtins.length loc.lines;
      go = i:
        if i >= n then false
        else
          let
            it = builtins.elemAt loc.lines i;
            toks = tokenize it.code;
          in
          if toks == [ ] then go (i + 1)
          else
            let t0 = builtins.head toks; in
            it.indent > ind || t0 == "where" || t0 == "|" || t0 == "deriving" || t0 == "++";
    in go (start + 1);

  inspect = src:
    let
      loc = locate src;
      declOf =
        if loc.found == null then "(no declaration)"
        else trim (builtins.elemAt loc.lines loc.found.line).orig;
      kind =
        if loc.found == null then "otherDef"
        else if loc.found.kw != "def" || loc.found.attr then "otherDef"
        else if !patternMatch (builtins.elemAt loc.lines loc.found.line).code then "otherDef"
        else if commandContinues loc then "otherDef"
        else "stringDef";
    in { inherit kind declOf; };

  must = label: src: want:
    let got = (inspect src).kind; in
    if got == want then true else builtins.throw "fixture ${label} got ${got}";

  fixturesOk =
    must "exact" ''
      def foo : String := "hi"
    '' "stringDef"
    && must "preamble" ''
      import Foo
      namespace Bar

      def foo : String := "hi"
    '' "stringDef"
    && must "doc" ''
      /-
      def no : String := "no"
      -/
      def yes : String := "yes"
    '' "stringDef"
    && must "tail" ''
      def foo : String := "hi" -- note
    '' "stringDef"
    && must "laterDef" ''
      def foo : String := "hi"
      def bar : Bool := true
    '' "stringDef"
    && must "atIdent" ''
      #eval @id "x"
      def foo : String := "hi"
    '' "stringDef"
    && must "stringWord" ''
      #eval "def"
      def foo : String := "hi"
    '' "stringDef"
    && must "bool" ''
      def foo : Bool := true
    '' "otherDef"
    && must "arrow" ''
      def foo : String -> String := "x"
    '' "otherDef"
    && must "where" ''
      def foo : String := "hi"
        where
          x := "hi"
    '' "otherDef"
    && must "whereCol0" ''
      def foo : String := "hi"
      where x := "hi"
    '' "otherDef"
    && must "later" ''
      theorem t : True := trivial
      def foo : String := "hi"
    '' "otherDef"
    && must "private" ''
      private def foo : String := "hi"
    '' "otherDef"
    && must "attr" ''
      @[simp]
      def foo : String := "hi"
    '' "otherDef"
    && must "spaced" ''
      def foo : String := "hello world"
    '' "otherDef"
    && must "concat" ''
      def foo : String := "hi"
        ++ "x"
    '' "otherDef"
    && must "none" ''
      import Foo
      namespace Bar
      open Baz
    '' "otherDef";

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

  pathOf = name:
    let
      pref = "SystemsLean.";
      rest = builtins.substring (builtins.stringLength pref)
        (builtins.stringLength name - builtins.stringLength pref) name;
    in
    repo + "/src/systems/SystemsLean/" + rest + ".lean";

  diskLoad = name:
    let p = pathOf name; in
    if builtins.pathExists p then builtins.readFile p else null;

  synSources = {
    "SystemsLean.HostFrontLiveSynStr" = ''
      import Foo
      namespace Bar

      def foo : String := "hi"
    '';
    "SystemsLean.HostFrontLiveSynTail" = ''
      def foo : String := "hi" -- note
    '';
    "SystemsLean.HostFrontLiveSynBool" = ''
      def foo : Bool := true
    '';
    "SystemsLean.HostFrontLiveSynFn" = ''
      def foo : String -> String := "x"
    '';
    "SystemsLean.HostFrontLiveSynWhere" = ''
      def foo : String := "hi"
        where
          x := "hi"
    '';
    "SystemsLean.HostFrontLiveSynLater" = ''
      theorem t : True := trivial
      def foo : String := "hi"
    '';
    "SystemsLean.HostFrontLiveSynPrivate" = ''
      private def foo : String := "hi"
    '';
  };
  synLoad = name: synSources.${name} or null;

  push = xs: item: if builtins.length xs >= 3 then xs else xs ++ [ item ];

  analyze = load: pathFor: raw:
    let
      fin = builtins.foldl' step emptyWalk (linesOf raw);
      names = builtins.attrNames fin.names;
      acc = builtins.foldl' (a: name:
        let
          c = fin.names.${name};
          src = load name;
          path = pathFor name;
        in
        if src == null then a // { missingFile = a.missingFile + c; }
        else
          let ins = inspect src; in
          if ins.kind == "stringDef" then
            a // {
              stringDef = a.stringDef + c;
              stringExamples = push a.stringExamples { inherit path; decl = ins.declOf; };
            }
          else
            a // {
              otherDef = a.otherDef + c;
              otherExamples = push a.otherExamples { inherit path; decl = ins.declOf; };
            }
      ) {
        stringDef = 0;
        otherDef = 0;
        missingFile = 0;
        stringExamples = [ ];
        otherExamples = [ ];
      } names;
      hostFrontLive = fin.total;
      halfFloor = builtins.div hostFrontLive 2;
      need = halfFloor + 1;
      verdict = if acc.stringDef >= need then "MAJORITY" else "BLOCKED";
      accounted = acc.stringDef + acc.otherDef + acc.missingFile;
      show = prefix: xs:
        let
          n = builtins.length xs;
          one = i:
            let item = builtins.elemAt xs (i - 1); in
            "${prefix}Example${toString i}=${item.path}\n"
            + "${prefix}Decl${toString i}=${item.decl}\n";
          go = i: if i > n then "" else one i + go (i + 1);
        in
        "${prefix}Shown=${toString n}\n" + go 1;
      text =
        "hostFrontLive=${toString hostFrontLive}\n"
        + "halfFloor=${toString halfFloor}\n"
        + "need=${toString need}\n"
        + "stringDef=${toString acc.stringDef}\n"
        + "otherDef=${toString acc.otherDef}\n"
        + "missingFile=${toString acc.missingFile}\n"
        + "accounted=${toString accounted}\n"
        + "accountedMatches=${if accounted == hostFrontLive then "yes" else "no"}\n"
        + "verdict=${verdict}\n"
        + show "stringDef" acc.stringExamples
        + show "otherDef" acc.otherExamples;
    in
    if accounted != hostFrontLive then builtins.throw "accounted diverged from hostFrontLive"
    else { inherit text hostFrontLive need; buckets = acc; verdict = verdict; };

  synPathFor = name: "(source-map " + name + ")";
  synRaw = if useSyn then builtins.readFile logPath else "";
  syn = if useSyn then analyze synLoad synPathFor synRaw else null;
  synOk =
    !useSyn
    || (
      syn.buckets.stringDef == 2
      && syn.buckets.otherDef == 5
      && syn.buckets.missingFile == 1
      && syn.hostFrontLive == 8
      && syn.buckets.stringDef + syn.buckets.otherDef + syn.buckets.missingFile == syn.hostFrontLive
      && syn.verdict == "BLOCKED"
      && syn.need == 5
    );

  realRaw = if useSyn then "" else builtins.readFile logPath;
  realLines = if useSyn then [ ] else linesOf realRaw;
  walkOk = useSyn || builtins.any (l: l == walkExact) realLines;
  real = if useSyn then null else analyze diskLoad pathOf realRaw;
in
if !fixturesOk then builtins.throw "fixtures refused"
else if useSyn && !synOk then builtins.throw ("synthetic refused\n" + syn.text)
else if useSyn then syn.text
else if !walkOk then builtins.throw "not sampled"
else real.text
