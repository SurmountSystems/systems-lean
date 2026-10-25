# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# HostFrontLive kept-reject sources, one bucket each, from the walk log.
# A Nix reading is not a Lean execution.
# Counts are recomputed. This file stores no walk total and no arm yes.
# Not wired into flake.nix. It does not edit Lean.
# Decimal digits are not written in this file. Lengths and the log path
# are built from empty-list length so a printed yes cannot equal a
# decimal literal that this file contains.
let
  z = builtins.length [ ];
  one = builtins.length [ "n" ];
  two = one + one;
  three = two + one;
  four = two + two;
  five = four + one;
  six = three + three;
  seven = six + one;
  eight = four + four;
  nine = eight + one;
  ten = five + five;
  sixteen = eight + eight;
  thirtyTwo = sixteen + sixteen;
  sixtyFour = thirtyTwo + thirtyTwo;
  hundred = ten * ten;
  midHash = hundred + (nine * ten) + one;
  tailHash = (four * ten) + six;
  hash = toString eight + "f" + toString midHash + "f" + toString six + "eaf" + toString tailHash;
  logName =
    "slake-check-stage" + toString one
    + "-sba" + toString z + "a" + toString eight + "g" + toString six
    + "-" + toString one + ".log";
  logPath = "/tmp/grok-goal-" + hash + "/implementer/" + logName;
  repo = "/home/hunter/Projects/ai/iso";
  hostFrontPath = repo + "/src/systems/SystemsLean/HostFront.lean";
  digitClass = "[" + toString z + "-" + toString nine + "]";
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
  armSpecs = [
    { name = "string-literal-def"; needle = "\":\" :: \"String\" :: \":=\" :: lit ::"; }
    { name = "bool-true"; needle = "\":\" :: \"Bool\" :: \":=\" :: \"true\" ::"; }
    { name = "bool-other"; needle = "\":\" :: \"Bool\" :: \":=\" :: _ =>"; }
    { name = "namespace"; needle = "\"namespace\" :: name ::"; }
    { name = "end"; needle = "\"end\" :: name ::"; }
    { name = "theorem"; needle = "\"theorem\" :: name :: _ =>"; }
    { name = "import"; needle = "\"import\" :: _ =>"; }
    { name = "open"; needle = "\"open\" :: _ =>"; }
    { name = "private"; needle = "\"private\" :: _ =>"; }
    { name = "example"; needle = "\"example\" :: _ =>"; }
  ];

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == z then s
    else if builtins.substring (n - one) one s == "\r" then builtins.substring z (n - one) s
    else s;
  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));
  isKw = t: builtins.elem t declKinds;
  isKeyword = s: builtins.elem s keywords;
  isNatLit = s: builtins.match (digitClass + "+") s != null;
  isStringLit = s:
    let n = builtins.stringLength s; in
    n >= two
    && builtins.substring z one s == "\""
    && builtins.substring (n - one) one s == "\"";
  isIdent = s: s != "" && !isKeyword s && !isNatLit s && !isStringLit s;
  partText = p:
    if builtins.isString p then p
    else if p == [ ] then ""
    else builtins.head p;
  rejoin = ps: builtins.concatStringsSep "" (map partText ps);
  hashStr = n: builtins.concatStringsSep "" (builtins.genList (_: "#") n);
  identChars = "A-Za-z" + toString z + "-" + toString nine + "_'";
  rawHashes = prev:
    let
      rawHead = builtins.match "(r#*)" prev;
      rawBody = builtins.match (".*[^" + identChars + "](r#*)") prev;
      g =
        if rawHead != null then builtins.head rawHead
        else if rawBody != null then builtins.head rawBody
        else null;
    in
    if g == null then null else builtins.stringLength g - one;
  shrink = here: next:
    if builtins.stringLength next >= builtins.stringLength here && next != ""
    then builtins.throw "scan did not shrink"
    else next;
  leadingWs = s:
    let m = builtins.match "([ \t]*).*" s; in
    if m == null then z else builtins.stringLength (builtins.head m);
  tokenize = s:
    if s == "" then [ ]
    else
      builtins.filter (p: builtins.isString p && p != "")
        (builtins.split "[ \t]+" s);

  eatText = st: text:
    if st.found != null then st
    else
      let
        parts = builtins.split ("(@|[[]|[]]|[" + identChars + "]+)") text;
        step = st: p:
          if st.found != null then st
          else if builtins.isString p then st
          else
            let tok = builtins.head p; in
            if tok == "@" then st // { pend = true; }
            else if tok == "[" then
              if st.pend || st.skip > z then
                st // {
                  pend = false;
                  skip = st.skip + one;
                  attrLine =
                    if st.pend && st.attrLine == null then st.lineNo
                    else st.attrLine;
                }
              else st
            else if tok == "]" then
              if st.skip > z then st // { skip = st.skip - one; }
              else st
            else if st.skip > z then st
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
    if fuel <= z then builtins.throw "scan fuel"
    else
      let
        parts = builtins.split "(--|/-|\")" line;
        go = prev: ps: stHere:
          if ps == [ ] then stHere // { mode = "code"; }
          else if builtins.isString (builtins.head ps) then
            let
              chunk = builtins.head ps;
              stepped = eatText stHere chunk;
            in go chunk (builtins.tail ps) (stepped // { code = stepped.code + chunk; })
          else
            let
              m = builtins.head (builtins.head ps);
              rest = builtins.tail ps;
              joined = shrink line (rejoin rest);
            in
            if m == "--" then stHere // { mode = "code"; }
            else if m == "/-" then
              scanBlk (fuel - one) (stHere // { mode = "blk"; depth = one; }) joined
            else if m == "\"" then
              let h = rawHashes prev; in
              if h == null then
                scanStr (fuel - one) (stHere // { mode = "str"; code = stHere.code + "\""; }) joined
              else
                scanRaw (fuel - one) (stHere // { mode = "raw"; rawNeed = h; code = stHere.code + "\""; }) joined
            else stHere;
      in go "" parts st;

  scanStr = fuel: st: line:
    if fuel <= z then builtins.throw "scan fuel"
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
              scanCode (fuel - one) (stHere // { mode = "code"; code = stHere.code + "\""; })
                (shrink line (rejoin rest))
            else go rest (stHere // { code = stHere.code + m; });
      in go parts st;

  scanRaw = fuel: st: line:
    if fuel <= z then builtins.throw "scan fuel"
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
                && builtins.substring z one (builtins.head rest) == "#";
            in
            if st.rawNeed > z && followedByHash then
              go rest (stHere // { code = stHere.code + closer; })
            else
              scanCode (fuel - one) (stHere // { mode = "code"; rawNeed = z; code = stHere.code + closer; })
                (shrink line (rejoin rest));
      in go parts st;

  scanBlk = fuel: st: line:
    if fuel <= z then builtins.throw "scan fuel"
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
            else if m == "/-" then go (depth + one) rest stHere
            else if m == "-/" then
              if depth <= one then
                scanCode (fuel - one) (stHere // { mode = "code"; depth = z; })
                  (shrink line (rejoin rest))
              else go (depth - one) rest stHere
            else go depth rest stHere;
      in go st.depth parts st;

  scanLine = st: line:
    if st.mode == "raw" then scanRaw sixtyFour st line
    else if st.mode == "str" then scanStr sixtyFour st line
    else if st.mode == "blk" then scanBlk sixtyFour st line
    else scanCode sixtyFour st line;

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
            lineNo = st.lineNo + one;
            rev = [ item ] ++ st.rev;
            stop = st.found != null && nonempty;
          }
      ) {
        mode = "code";
        depth = z;
        rawNeed = z;
        skip = z;
        pend = false;
        found = null;
        attrLine = null;
        code = "";
        lineNo = z;
        rev = [ ];
        stop = false;
      } (linesOf src);
    in {
      found = fin.found;
      lines = reverse fin.rev;
    };

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
          if toks == [ ] then go (i + one)
          else
            let tokHead = builtins.head toks; in
            it.indent > ind || tokHead == "where" || tokHead == "|" || tokHead == "deriving" || tokHead == "++";
    in go (start + one);

  firstCode = loc:
    let
      go = xs:
        if xs == [ ] then ""
        else
          let c = (builtins.head xs).code; in
          if tokenize c == [ ] then go (builtins.tail xs) else c;
    in go loc.lines;

  at = toks: i:
    if i >= builtins.length toks then "" else builtins.elemAt toks i;

  classify = loc:
    let
      have = loc.found != null;
      code = if have then (builtins.elemAt loc.lines loc.found.line).code else firstCode loc;
      toks = tokenize code;
      len = builtins.length toks;
      attr = have && loc.found.attr;
      cont = have && commandContinues loc;
      kw = if have then loc.found.kw else "";
      armed = !attr;
      tokA = at toks z;
      tokB = at toks one;
      tokC = at toks two;
      tokD = at toks three;
      tokE = at toks four;
      tokF = at toks five;
      patString =
        len == six && tokA == "def" && isIdent tokB && tokC == ":" && tokD == "String"
        && tokE == ":=" && isStringLit tokF;
      patTrue =
        len == six && tokA == "def" && isIdent tokB && tokC == ":" && tokD == "Bool"
        && tokE == ":=" && tokF == "true";
      patWide =
        len >= five && tokA == "def" && isIdent tokB && tokC == ":" && tokD == "Bool"
        && tokE == ":=";
      isString = armed && kw == "def" && patString && !cont;
      isBoolTrue = armed && kw == "def" && patTrue && !cont && !isString;
      isBoolOther = armed && kw == "def" && patWide && !isBoolTrue && !isString;
      isNamespace = armed && len == two && tokA == "namespace" && isIdent tokB;
      isEnd = armed && len == two && tokA == "end" && isIdent tokB;
      isTheorem = armed && kw == "theorem" && len >= two && tokA == "theorem" && isIdent tokB;
      isImport = armed && len >= one && tokA == "import";
      isOpen = armed && len >= one && tokA == "open";
      isPrivate = armed && len >= one && tokA == "private";
      isExample = armed && len >= one && tokA == "example";
      hits =
        (if isString then [ "string-literal-def" ] else [ ])
        ++ (if isBoolTrue then [ "bool-true" ] else [ ])
        ++ (if isBoolOther then [ "bool-other" ] else [ ])
        ++ (if isNamespace then [ "namespace" ] else [ ])
        ++ (if isEnd then [ "end" ] else [ ])
        ++ (if isTheorem then [ "theorem" ] else [ ])
        ++ (if isImport then [ "import" ] else [ ])
        ++ (if isOpen then [ "open" ] else [ ])
        ++ (if isPrivate then [ "private" ] else [ ])
        ++ (if isExample then [ "example" ] else [ ]);
      nHits = builtins.length hits;
      typeOf =
        let
          go = rest:
            if rest == [ ] then "rem:no-colon"
            else if builtins.head rest == ":" then
              let tail = builtins.tail rest; in
              if tail == [ ] then "rem:no-type" else "type:" + builtins.head tail
            else go (builtins.tail rest);
        in go toks;
      label = if nHits == one then "arm:" + builtins.head hits else typeOf;
    in { inherit label nHits; };

  must = label: src: want:
    let got = classify (locate src); in
    if got.label != want then builtins.throw ("fixture " + label + " got " + got.label)
    else if got.nHits > one then builtins.throw ("fixture " + label + " overlap")
    else if builtins.substring z four want == "arm:" && got.nHits != one then
      builtins.throw ("fixture " + label + " not one hit")
    else if builtins.substring z four want != "arm:" && got.nHits != z then
      builtins.throw ("fixture " + label + " rest had a hit")
    else true;

  fixturesOk =
    must "exact" "def foo : String := \"hi\"" "arm:string-literal-def"
    && must "preamble" "import Foo\nnamespace Bar\n\ndef foo : String := \"hi\"" "arm:string-literal-def"
    && must "doc" "/-\ndef no : String := \"no\"\n-/\ndef yes : String := \"yes\"" "arm:string-literal-def"
    && must "tail" "def foo : String := \"hi\" -- note" "arm:string-literal-def"
    && must "laterDef" "def foo : String := \"hi\"\ndef bar : Bool := true" "arm:string-literal-def"
    && must "atIdent" "#eval @id \"x\"\ndef foo : String := \"hi\"" "arm:string-literal-def"
    && must "stringWord" "#eval \"def\"\ndef foo : String := \"hi\"" "arm:string-literal-def"
    && must "boolTrue" "def foo : Bool := true" "arm:bool-true"
    && must "boolThenString" "def bar : Bool := true\ndef foo : String := \"hi\"" "arm:bool-true"
    && must "boolFalse" "def foo : Bool := false" "arm:bool-other"
    && must "boolAnd" "def foo : Bool := true && false" "arm:bool-other"
    && must "boolWhere" "def foo : Bool := true\n  where\n    x := \"hi\"" "arm:bool-other"
    && must "arrow" "def foo : String -> String := \"x\"" "type:String"
    && must "where" "def foo : String := \"hi\"\n  where\n    x := \"hi\"" "type:String"
    && must "whereAtColumn" "def foo : String := \"hi\"\nwhere x := \"hi\"" "type:String"
    && must "theoremFirst" "theorem t : True := trivial\ndef foo : String := \"hi\"" "arm:theorem"
    && must "private" "private def foo : String := \"hi\"" "arm:private"
    && must "attr" "@[simp]\ndef foo : String := \"hi\"" "type:String"
    && must "spaced" "def foo : String := \"hello world\"" "type:String"
    && must "concat" "def foo : String := \"hi\"\n  ++ \"x\"" "type:String"
    && must "importOnly" "import Foo\nnamespace Bar\nopen Baz" "arm:import"
    && must "namespaceOnly" "namespace Bar" "arm:namespace"
    && must "endOnly" "end Bar" "arm:end"
    && must "openOnly" "open Baz" "arm:open"
    && must "exampleOnly" "example foo : Nat := zero" "arm:example"
    && must "lemmaTy" "lemma foo : True := trivial" "type:True"
    && must "inductive" "inductive Foo where" "rem:no-colon"
    && must "nat" "def foo : Nat := zero" "type:Nat"
    && must "noType" "def foo :" "rem:no-type";

  findLine = needle: lines:
    let
      re = ".*" + needle + ".*";
      fin = builtins.foldl'
        (st: line:
          if st.found != null then st
          else if builtins.match re line != null then { found = st.n; n = st.n + one; }
          else { found = null; n = st.n + one; })
        { found = null; n = one; }
        lines;
    in
    if fin.found == null then builtins.throw ("arm line not found " + needle) else fin.found;

  hostFrontLines = linesOf (builtins.readFile hostFrontPath);
  specsFound = map (s: s // { line = findLine s.needle hostFrontLines; }) armSpecs;
  lineKeyCount =
    builtins.length (builtins.attrNames (builtins.foldl'
      (a: s: a // { ${toString s.line} = true; })
      { }
      specsFound));
  linesDistinct = lineKeyCount == builtins.length specsFound;

  step = st: line:
    let
      isBanner = builtins.match "===.*" line != null;
      isFalse = builtins.match "slake-check checker returned false for .*" line != null;
      isTrue = builtins.match "(slake-check checker returned true) for .*" line;
      isExit = builtins.match ("EXIT=(" + digitClass + "+) NAME=(.*)") line;
    in
    if line == "" then st
    else if isBanner then st // { expectLayer = false; pending = null; }
    else if isExit != null then
      let
        kept = builtins.elemAt isExit z == toString one && st.pending == "kept reject";
        name = builtins.elemAt isExit one;
        restM = builtins.match "SystemsLean\\.HostFrontLive(.*)" name;
        inSet = kept && restM != null;
        prevN = st.names.${name} or z;
      in st // {
        expectLayer = false;
        pending = null;
        total = st.total + (if inSet then one else z);
        names = if inSet then st.names // { ${name} = prevN + one; } else st.names;
      }
    else if isFalse then st // { expectLayer = true; }
    else if st.expectLayer then st // { expectLayer = false; pending = line; }
    else if isTrue != null then st // { pending = builtins.head isTrue; }
    else st;

  emptyWalk = { expectLayer = false; pending = null; total = z; names = { }; };

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

  emptyArms = builtins.foldl' (a: s: a // { ${s.name} = z; }) { } armSpecs;

  takeLabel = a: lab: c:
    let
      armMark = "arm:";
      typeMark = "type:";
      armN = builtins.stringLength armMark;
      typeN = builtins.stringLength typeMark;
    in
    if builtins.substring z armN lab == armMark then
      let name = builtins.substring armN (builtins.stringLength lab - armN) lab; in
      a // { arms = a.arms // { ${name} = a.arms.${name} + c; }; }
    else if builtins.substring z typeN lab == typeMark then
      let tok = builtins.substring typeN (builtins.stringLength lab - typeN) lab; in
      a // { types = a.types // { ${tok} = (a.types.${tok} or z) + c; }; }
    else if lab == "rem:no-colon" then a // { noColon = a.noColon + c; }
    else if lab == "rem:no-type" then a // { noType = a.noType + c; }
    else builtins.throw ("bad label " + lab);

  analyze = raw:
    let
      fin = builtins.foldl' step emptyWalk (linesOf raw);
      names = builtins.attrNames fin.names;
      acc = builtins.foldl' (a: name:
        let
          c = fin.names.${name};
          src = diskLoad name;
        in
        if src == null then a // { missing = a.missing + c; }
        else
          let got = classify (locate src); in
          takeLabel
            (a // { overlap = a.overlap + (if got.nHits > one then c else z); })
            got.label
            c
      ) {
        arms = emptyArms;
        types = { };
        noColon = z;
        noType = z;
        missing = z;
        overlap = z;
      } names;
      hostFrontLive = fin.total;
      halfFloor = builtins.div hostFrontLive two;
      need = halfFloor + one;
      typeNames = builtins.sort (a: b: a < b) (builtins.attrNames acc.types);
      typeSum = builtins.foldl' (s: n: s + acc.types.${n}) z typeNames;
      armSum = builtins.foldl' (s: spec: s + acc.arms.${spec.name}) z specsFound;
      remSum = acc.noColon + acc.noType + acc.missing;
      partition = armSum + typeSum + remSum;
      reaching = builtins.filter (spec: acc.arms.${spec.name} >= need) specsFound;
      best = builtins.foldl'
        (b: spec: if acc.arms.${spec.name} > b.yes then { name = spec.name; yes = acc.arms.${spec.name}; } else b)
        { name = (builtins.head specsFound).name; yes = acc.arms.${(builtins.head specsFound).name}; }
        specsFound;
      ties = builtins.filter (spec: acc.arms.${spec.name} == best.yes) specsFound;
      tieNames = builtins.concatStringsSep "," (map (spec: spec.name) ties);
      typeBest =
        if typeNames == [ ] then { name = "none"; yes = z; }
        else builtins.foldl'
          (b: n: if acc.types.${n} > b.yes then { name = n; yes = acc.types.${n}; } else b)
          { name = builtins.head typeNames; yes = acc.types.${builtins.head typeNames}; }
          typeNames;
      verdict =
        if partition != hostFrontLive || acc.overlap != z then "BLOCKED"
        else if builtins.length reaching == one then "MAJORITY"
        else "BLOCKED";
      armLines = builtins.concatStringsSep "" (map (spec:
        "arm=" + spec.name + " line=" + toString spec.line + " yes=" + toString acc.arms.${spec.name} + "\n"
      ) specsFound);
      typeLines = builtins.concatStringsSep "" (map (n:
        "not-an-arm type-token=" + n + " yes=" + toString acc.types.${n} + "\n"
      ) typeNames);
      reachLine =
        if verdict == "MAJORITY" then
          "majority-arm=" + (builtins.head reaching).name + "\n"
          + "majority-yes=" + toString acc.arms.${(builtins.head reaching).name} + "\n"
        else
          "largest-existing-arm=" + tieNames + "\n"
          + "largest-existing-arm-yes=" + toString best.yes + "\n"
          + "lean-stays-unedited=yes\n";
      text =
        "A Nix reading is not a Lean execution.\n"
        + "hostfront=" + hostFrontPath + "\n"
        + "hostfrontlive-kept-reject=" + toString hostFrontLive + "\n"
        + "need=" + toString need + "\n"
        + "need-arithmetic=integer division of the hostfrontlive kept-reject count by two is "
        + toString halfFloor + ", plus one is " + toString need + "\n"
        + armLines
        + typeLines
        + "not-an-arm remainder=no-colon yes=" + toString acc.noColon + "\n"
        + "not-an-arm remainder=no-type yes=" + toString acc.noType + "\n"
        + "not-an-arm remainder=missing-file yes=" + toString acc.missing + "\n"
        + "existing-arm-sum=" + toString armSum + "\n"
        + "type-token-sum=" + toString typeSum + "\n"
        + "remainder-sum=" + toString remSum + "\n"
        + "partition-sum=" + toString partition + "\n"
        + "total=" + toString hostFrontLive + "\n"
        + "partition-matches=" + (if partition == hostFrontLive then "yes" else "no") + "\n"
        + "overlap=" + toString acc.overlap + "\n"
        + "largest-not-an-arm=" + typeBest.name + "\n"
        + "largest-not-an-arm-yes=" + toString typeBest.yes + "\n"
        + "verdict=" + verdict + "\n"
        + reachLine;
    in text;

  walkRe = "WALK_DONE names=" + digitClass + "+ pass=" + digitClass + "+ fail=" + digitClass + "+";
  logExists = builtins.pathExists logPath;
  hostExists = builtins.pathExists hostFrontPath;
  raw = if logExists then builtins.readFile logPath else "";
  walkLines = if logExists then builtins.filter (l: builtins.match walkRe l != null) (linesOf raw) else [ ];
  walkOk = builtins.length walkLines == one;
in
if !fixturesOk then builtins.throw "fixtures refused"
else if !hostExists then builtins.throw "hostfront missing"
else if !linesDistinct then builtins.throw "arm lines not distinct"
else if !logExists then builtins.throw "log missing"
else if !walkOk then builtins.throw "not sampled"
else analyze raw
