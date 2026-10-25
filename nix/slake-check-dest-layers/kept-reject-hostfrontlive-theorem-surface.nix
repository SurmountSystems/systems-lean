# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# Source-text split of acceptKeptTheoremSurface on HostFrontLive kept rejects.
# Not a Lean execution. Not a bootstrap. Not nix build. Not flake wired.
# parseTheoremSurface structural gates are ported from TopScan.
# theoremSurfaceRejectClosed is not ported, so a structural match is undecided.
# Decided yes stays 0. need is (hostFrontLive / 2) + 1, computed here.
#
#   nice -n 19 nix eval --impure --raw --option cores 8 -f nix/slake-check-dest-layers/kept-reject-hostfrontlive-theorem-surface.nix
let
  logPath = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-sba0a8g6-1.log";
  walkExact = "WALK_DONE names=2801 pass=107 fail=2694";
  repoRoot = "/home/hunter/Projects/ai/iso";

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s;

  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));

  charsOf = s:
    builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);

  identChar = c:
    builtins.match "[A-Za-z0-9_']" c != null;

  takeIdent = s:
    builtins.concatStringsSep "" (builtins.foldl' (acc: c:
      if acc.stop then acc
      else if identChar c then { stop = false; cs = acc.cs ++ [c]; }
      else { stop = true; cs = acc.cs; }
    ) { stop = false; cs = []; } (charsOf s)).cs;

  trim = s:
    let
      dropL = t:
        if t == "" then t
        else
          let c = builtins.substring 0 1 t; in
          if c == " " || c == "\t" || c == "\r" then dropL (builtins.substring 1 (builtins.stringLength t - 1) t)
          else t;
      a = dropL s;
      b = dropL (builtins.concatStringsSep "" (reverseChars a));
    in builtins.concatStringsSep "" (reverseChars b);

  reverseChars = s:
    let cs = charsOf s; in
    builtins.genList (i: builtins.elemAt cs (builtins.length cs - 1 - i)) (builtins.length cs);

  hasSuffix = s: suf:
    let
      ns = builtins.stringLength s;
      nf = builtins.stringLength suf;
    in nf > 0 && nf <= ns && builtins.substring (ns - nf) nf s == suf;

  unAttr = t:
    if builtins.substring 0 2 t != "@[" then t
    else
      let
        cs = charsOf t;
        fin = builtins.foldl' (st: c:
          if st.done then st
          else if !st.seen then
            if c == "]" then { seen = true; done = false; out = ""; }
            else st
          else { seen = true; done = false; out = st.out + c; }
        ) { seen = false; done = false; out = ""; } cs;
      in if fin.seen then trim fin.out else t;

  # One line. Block depth, string mode, and escape carry across lines.
  stripLine = depth0: inStr0: esc0: line:
    let
      fin = builtins.foldl' (st: c:
        if st.skip then st
        else if st.inStr then
          if st.esc then st // { esc = false; out = st.out + c; slash = false; dash = false; }
          else if c == "\\" then st // { esc = true; out = st.out + c; slash = false; dash = false; }
          else if c == "\"" then st // { inStr = false; out = st.out + c; slash = false; dash = false; }
          else st // { out = st.out + c; slash = false; dash = false; }
        else if st.depth > 0 then
          if st.dash && c == "/" then st // { depth = st.depth - 1; dash = false; slash = false; }
          else if st.slash && c == "-" then st // { depth = st.depth + 1; slash = false; dash = false; }
          else st // { dash = c == "-"; slash = c == "/"; }
        else if st.dash && c == "-" then st // { skip = true; dash = false; slash = false; }
        else if st.slash && c == "-" then st // { depth = 1; slash = false; dash = false; }
        else if st.slash then
          let out = st.out + "/"; in
          if c == "\"" then st // { out = out + c; inStr = true; slash = false; dash = false; }
          else if c == "/" then st // { out = out; slash = true; dash = false; }
          else if c == "-" then st // { out = out; slash = false; dash = true; }
          else st // { out = out + c; slash = false; dash = false; }
        else if st.dash then
          if c == "\"" then st // { out = st.out + "-" + c; inStr = true; dash = false; slash = false; }
          else if c == "/" then st // { out = st.out + "-"; slash = true; dash = false; }
          else st // { out = st.out + "-" + c; dash = false; slash = false; }
        else if c == "/" then st // { slash = true; }
        else if c == "-" then st // { dash = true; }
        else if c == "\"" then st // { inStr = true; out = st.out + c; }
        else st // { out = st.out + c; }
      ) { depth = depth0; inStr = inStr0; esc = esc0; out = ""; skip = false; slash = false; dash = false; }
        (charsOf line);
      flushed =
        if fin.skip || fin.depth > 0 || fin.inStr then fin.out
        else if fin.slash then fin.out + "/"
        else if fin.dash then fin.out + "-"
        else fin.out;
    in { depth = fin.depth; inStr = fin.inStr; esc = fin.esc; text = flushed; };

  stripSrc = src:
    builtins.foldl' (st: line:
      let r = stripLine st.depth st.inStr st.esc line; in
      { depth = r.depth; inStr = r.inStr; esc = r.esc; lines = st.lines ++ [r.text]; }
    ) { depth = 0; inStr = false; esc = false; lines = []; } (linesOf src);

  isStart = t:
    hasPrefix t "def " || hasPrefix t "theorem " || hasPrefix t "example"
    || hasPrefix t "structure " || hasPrefix t "import " || hasPrefix t "namespace "
    || hasPrefix t "end " || t == "end" || hasPrefix t "axiom "
    || hasPrefix t "inductive " || hasPrefix t "set_option "
    || t == "mutual" || hasPrefix t "mutual "
    || hasPrefix t "abbrev " || hasPrefix t "instance " || hasPrefix t "class "
    || hasPrefix t "private " || hasPrefix t "noncomputable "
    || hasPrefix t "protected " || hasPrefix t "partial "
    || hasPrefix t "unsafe " || hasPrefix t "@"
    || hasPrefix t "#" || hasPrefix t "section"
    || hasPrefix t "variable " || hasPrefix t "open ";

  hasPrefix = s: p:
    let n = builtins.stringLength p; in
    builtins.substring 0 n s == p;

  dropLead = s: pre:
    let p = pre + " "; in
    if hasPrefix s p then trim (builtins.substring (builtins.stringLength p) (builtins.stringLength s) s) else null;

  dropMods = fuel: s:
    if fuel <= 0 then s
    else
      let
        tries = [ "private" "noncomputable" "protected" "partial" "unsafe" ];
        hit = builtins.foldl' (cur: pre:
          if cur != null then cur else dropLead s pre
        ) null tries;
      in if hit == null then s else dropMods (fuel - 1) hit;

  joinSp = xs:
    builtins.concatStringsSep " " xs;

  assignSplit = flat:
    let
      cs = charsOf flat;
      fin = builtins.foldl' (st: c:
        if st.done then st
        else if st.prev == ":" && c == "=" then { done = true; prev = ""; pre = st.pre; rhs = ""; }
        else if st.prev == ":" then { done = false; prev = c; pre = st.pre + ":" + c; rhs = ""; }
        else { done = false; prev = c; pre = st.pre; rhs = ""; }
      ) { done = false; prev = ""; pre = ""; rhs = ""; } cs;
    in
      if !fin.done then null
      else
        let
          # Re-scan once we know := exists. pre above is messy on the colon hold.
          parts = builtins.split ":=" flat;
        in
          if builtins.length parts < 3 then null
          else {
            pre = builtins.elemAt parts 0;
            rhs = builtins.concatStringsSep ":=" (builtins.filter builtins.isString (builtins.tail (builtins.tail parts)));
          };

  retKind = flat:
    let sp = assignSplit flat; in
    if sp == null then null
    else
      let t = trim sp.pre; in
      if hasSuffix t "String" then "str"
      else if hasSuffix t "Bool" then "bool"
      else null;

  exactBool = t:
    if t == "true" then true
    else if t == "false" then false
    else null;

  asString = rhs:
    let t = trim rhs; in
    if builtins.substring 0 1 t != "\"" then null
    else if builtins.substring (builtins.stringLength t - 1) 1 t != "\"" then null
    else if builtins.stringLength t < 2 then null
    else builtins.substring 1 (builtins.stringLength t - 2) t;

  chunkBool = lines:
    let
      fin = builtins.foldl' (st: line:
        if st.done then st
        else
          let sp = assignSplit line; in
          if sp != null then
            let t = trim sp.rhs; in
            if t == "" then st // { wait = true; }
            else let b = exactBool t; in
              if b == null then st // { done = true; hit = null; }
              else st // { done = true; hit = b; }
          else if st.wait then
            let t = trim line; in
            if t == "" then st
            else let b = exactBool t; in
              if b == null then st // { done = true; hit = null; }
              else st // { done = true; hit = b; }
          else st
      ) { done = false; wait = false; hit = null; } lines;
    in fin.hit;

  chunkStr = lines:
    let
      fin = builtins.foldl' (st: line:
        if st.done then st
        else
          let sp = assignSplit line; in
          if sp != null then
            let t = trim sp.rhs; in
            if t == "" then st // { wait = true; }
            else let lit = asString t; in
              if lit == null then st // { done = true; hit = null; }
              else st // { done = true; hit = lit; }
          else if st.wait then
            let t = trim line; in
            if t == "" then st
            else let lit = asString t; in
              if lit == null then st // { done = true; hit = null; }
              else st // { done = true; hit = lit; }
          else st
      ) { done = false; wait = false; hit = null; } lines;
    in fin.hit;

  addChunk = b: lines:
    if lines == [] then b
    else
      let
        flat = joinSp lines;
        body = dropMods 6 flat;
      in
        if hasPrefix body "namespace " then
          let m = trim (builtins.substring 10 (builtins.stringLength body) body); in
          if m == "" then b else b // { ns = b.ns ++ [m]; }
        else if hasPrefix body "theorem " then b // { theoremN = b.theoremN + 1; }
        else if hasPrefix body "structure " then b // { structN = b.structN + 1; }
        else if hasPrefix body "def " then
          let
            rest = trim (builtins.substring 4 (builtins.stringLength body) body);
            name = takeIdent rest;
          in
            if name == "main" then b // { mainN = b.mainN + 1; }
            else if name == "" then b
            else
              let k = retKind flat; in
              if k == "bool" then
                let v = chunkBool lines; in
                if v == null then b else b // { bools = b.bools ++ [{ name = name; v = v; }]; }
              else if k == "str" then
                let lit = chunkStr lines; in
                if lit == null then b else b // { strs = b.strs ++ [{ name = name; }]; }
              else b
        else b;

  scanStructs = src:
    let
      stripped = stripSrc src;
      prepared = map (line: unAttr (trim line)) stripped.lines;
      chunks = builtins.foldl' (acc: t:
        if t == "" then acc
        else if isStart t then [[t]] ++ acc
        else if acc == [] then acc
        else
          let h = builtins.head acc; rest = builtins.tail acc; in
          [(h ++ [t])] ++ rest
      ) [] prepared;
      ordered = reverseList chunks;
      fin = builtins.foldl' addChunk { ns = []; theoremN = 0; mainN = 0; structN = 0; bools = []; strs = []; } ordered;
    in fin // { closed = stripped.depth == 0 && !stripped.inStr; };

  reverseList = xs:
    builtins.foldl' (acc: x: [x] ++ acc) [] xs;

  boolSufTrue = bools: suf:
    builtins.any (p: hasSuffix p.name suf && p.v == true) bools;

  # "no" when parseTheoremSurface would be none.
  # "undecided" when the structural parse would be some, because
  # theoremSurfaceRejectClosed is not ported. Never "yes".
  classSurface = src:
    if src == null then "undecided"
    else
      let sc = scanStructs src; in
      if !sc.closed then "no"
      else if builtins.length sc.ns == 0 then "no"
      else if sc.theoremN == 0 || sc.mainN != 0 then "no"
      else if sc.structN != 0 then "no"
      else if (builtins.length sc.bools + builtins.length sc.strs) != 0 then "no"
      else if boolSufTrue sc.bools "FullHost" then "no"
      else if boolSufTrue sc.bools "OwnsPackageTypecheck" then "no"
      else "undecided";

  must = label: cond: if cond then true else builtins.throw "self-test ${label}";

  keepToy =
    "namespace SystemsLean.SurfaceMatrix\n"
    + "theorem matrixSurfaceOk_true : matrixSurfaceOk = true := by decide\n"
    + "end SystemsLean.SurfaceMatrix\n";

  commentToy =
    "/-\ntheorem fake : True := by decide\n-/\n"
    + "namespace N\ndef x : Nat := 1\nend N\n";

  mainToy =
    "namespace N\ndef main : IO Unit := pure ()\ntheorem t : True := by decide\nend N\n";

  structToy =
    "namespace N\nstructure S where\n  x : Nat\ntheorem t : True := by decide\nend N\n";

  strToy =
    "namespace N\ndef stageId : String := \"SLAKE\"\ntheorem t : True := by decide\nend N\n";

  hostToy =
    "namespace N\ndef stageFullHost : Bool := true\ntheorem t : True := by decide\nend N\n";

  selfTest =
    must "keep" (classSurface keepToy == "undecided")
    && must "hollow" (classSurface "namespace N\nend N\n" == "no")
    && must "comment" (classSurface commentToy == "no")
    && must "main" (classSurface mainToy == "no")
    && must "struct" (classSurface structToy == "no")
    && must "str" (classSurface strToy == "no")
    && must "fullhost" (classSurface hostToy == "no")
    && must "null" (classSurface null == "undecided")
    && must "no-yes" (classSurface keepToy != "yes");

  isBanner = line: builtins.match "===.*" line != null;
  isFalse = line: builtins.match "slake-check checker returned false for .*" line != null;
  isExit = line: builtins.match "EXIT=([0-9]+) NAME=(.*)" line;

  step = st: line:
    if line == "" then st
    else if isBanner line then st // { expectLayer = false; pending = null; }
    else if isExit line != null then
      let
        parts = isExit line;
        kept = builtins.elemAt parts 0 == "1" && st.pending == "kept reject";
        name = builtins.elemAt parts 1;
        restM = builtins.match "SystemsLean\\.HostFrontLive(.*)" name;
        inSet = kept && restM != null;
      in st // {
        expectLayer = false;
        pending = null;
        total = st.total + (if inSet then 1 else 0);
        names = if inSet then st.names ++ [name] else st.names;
      }
    else if isFalse line then st // { expectLayer = true; }
    else if st.expectLayer then st // { expectLayer = false; pending = line; }
    else st;

  emptyWalk = { expectLayer = false; pending = null; total = 0; names = []; };

  realRaw = builtins.readFile logPath;
  realLines = linesOf realRaw;
  walkOk = builtins.any (l: l == walkExact) realLines;
  fin = builtins.foldl' step emptyWalk realLines;
  hostFrontLive = fin.total;

  load = name:
    let
      pref = "SystemsLean.";
      rest = builtins.substring (builtins.stringLength pref)
        (builtins.stringLength name - builtins.stringLength pref) name;
      path = repoRoot + "/src/systems/SystemsLean/${rest}.lean";
    in if builtins.pathExists path then builtins.readFile path else null;

  tally = builtins.foldl' (acc: name:
    let cls = classSurface (load name); in
    acc // { ${cls} = acc.${cls} + 1; }
  ) { yes = 0; no = 0; undecided = 0; } fin.names;

  need = builtins.div hostFrontLive 2 + 1;
  verdict = if tally.yes >= need then "MAJORITY" else "BLOCKED";
  accounted = tally.yes + tally.no + tally.undecided;

  text =
    "hostFrontLive=${toString hostFrontLive}\n"
    + "need=${toString need}\n"
    + "yes=${toString tally.yes}\n"
    + "no=${toString tally.no}\n"
    + "undecided=${toString tally.undecided}\n"
    + "accounted=${toString accounted}\n"
    + "verdict=${verdict}\n"
    + "arm=acceptKeptTheoremSurface\n"
    + "liveShortCircuit=KeptHitKernel.acceptKept\n"
    + "rejectClosed=not ported\n"
    + "structuralMatch=undecided\n"
    + "reading=source text, not a Lean execution\n"
    + "count=decided yes only\n";
in
if !selfTest then builtins.throw "self-test refused"
else if !walkOk then builtins.throw "not sampled"
else if accounted != hostFrontLive then builtins.throw "account diverged"
else text
