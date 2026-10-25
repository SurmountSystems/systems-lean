# SPDX-License-Identifier: Unlicense
# Impure count of walk-1 RESULT=fail names against acceptKept arms
# that already exist. Reads the log and the Lean sources. Does not
# build, does not store a walk total, and is not wired into flake.nix.
#
# Ports, by line:
#   HostFront.lean hkStringLitDef, isIdent, isStringLit, lineTokens
#   SlakeCheckSource.lean acceptKeptStringLitDef and rejectLayer
#   SlakeCheckSource.lean acceptKeptTypes through acceptKeptPlan
#   SlakeCheckSource.lean acceptKeptTheoremSurface
#   KeptHitKernel.lean acceptKept, typedPass, typesOf, nameHasLinear
#   KeptReject.lean acceptKept (inside afterKept, not before it)
#   KeptWalk.lean walkKept
#   MutualForm.lean eat / flushPending / endLine
#   TopScan.lean scanSource / parseTheoremSurface's caller
#   TheoremSurface.lean parseTheoremSurface
# A keyword bucket is not an arm.
# A Nix reading is not a Lean execution.
#
#   nice -n 19 nix eval --impure --raw --option cores 8 \
#     --file nix/slake-check-dest-layers/stop-at-decl-source-arm-count.nix
let
  logPath = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-stop-at-decl-1.log";
  repo = "/home/hunter/Projects/ai/iso";

  boolTy = { k = "bool"; };
  natTy = { k = "nat"; };
  optionHost = { k = "option"; a = { k = "named"; n = "Host"; }; };

  keywords = [
    "module" "import" "namespace" "end" "open" "inductive" "deriving" "def"
    "check" "match" "some" "none" "true" "false" "var" "const" "app"
    ":=" ":" "->" "|" "=>" "(" ")" "_"
  ];

  fixtureArms = [
    { name = "acceptKeptTypes"; thm = "typesFixtureKindMultOk_true"; left = "typesFixtureKindMultOk"; right = "typesFixtureProgramReady"; lin = "typesFixtureMintId"; leftKind = "bool"; }
    { name = "acceptKeptProgram"; thm = "programFixtureFoldOk_true"; left = "programFixtureFoldOk"; right = "programFixtureProgramReady"; lin = "programFixtureMintId"; leftKind = "bool"; }
    { name = "acceptKeptCompilePath"; thm = "lowerCompilePathFixtureCompose_isSome"; left = "compilePathFixtureLiveView"; right = "compilePathFixtureSpentView"; lin = "compilePathFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptGraph"; thm = "graphFixtureGraphReady_true"; left = "graphFixtureGraphReady"; right = "graphFixtureProgramReady"; lin = "graphFixtureMintId"; leftKind = "bool"; }
    { name = "acceptKeptExtract"; thm = "extractRuntimeFsGateReady_true"; left = "extractFixtureLiveView"; right = "extractFixtureSpentView"; lin = "extractFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptApply"; thm = "applyFixtureApplyOk_true"; left = "applyFixtureLiveView"; right = "applyFixtureSpentView"; lin = "applyFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptBody"; thm = "bodyFixtureComposeReady_true"; left = "bodyFixtureLiveView"; right = "bodyFixtureSpentView"; lin = "bodyFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptCompose"; thm = "composeFixtureComposeReady_true"; left = "composeFixtureLiveView"; right = "composeFixtureSpentView"; lin = "composeFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptErasure"; thm = "erasureFixtureComposeReady_true"; left = "erasureFixtureLiveView"; right = "erasureFixtureSpentView"; lin = "erasureFixtureTagErased"; leftKind = "option"; }
    { name = "acceptKeptMult"; thm = "multFixtureComposeReady_true"; left = "multFixtureLiveView"; right = "multFixtureSpentView"; lin = "multFixtureMintId"; leftKind = "option"; }
    { name = "acceptKeptPlan"; thm = "planFixtureComposeReady_true"; left = "planFixtureLiveView"; right = "planFixtureSpentView"; lin = "planFixtureMintId"; leftKind = "option"; }
  ];

  # rejectLayer order. KeptReject.acceptKept runs inside afterKept.
  armOrder = [
    { name = "KeptHitKernel.acceptKept"; live = true; before = true; }
    { name = "acceptKeptTypes"; live = false; before = true; }
    { name = "acceptKeptProgram"; live = false; before = true; }
    { name = "acceptKeptCompilePath"; live = false; before = true; }
    { name = "acceptKeptGraph"; live = false; before = true; }
    { name = "acceptKeptExtract"; live = false; before = true; }
    { name = "acceptKeptApply"; live = false; before = true; }
    { name = "acceptKeptBody"; live = false; before = true; }
    { name = "acceptKeptCompose"; live = false; before = true; }
    { name = "acceptKeptErasure"; live = false; before = true; }
    { name = "acceptKeptMult"; live = false; before = true; }
    { name = "acceptKeptPlan"; live = false; before = true; }
    { name = "acceptKeptTheoremSurface"; live = false; before = true; }
    { name = "acceptKeptStringLitDef"; live = false; before = true; }
    { name = "KeptReject.acceptKept"; live = false; before = false; }
  ];

  yn = b: if b then "yes" else "no";

  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s;

  linesOf = raw:
    map stripCr (builtins.filter builtins.isString (builtins.split "\n" raw));

  dropChars = s: k:
    let n = builtins.stringLength s; in
    if k >= n then "" else builtins.substring k (n - k) s;

  isWs = c: c == " " || c == "\t" || c == "\r";
  isLetter = c: (c >= "a" && c <= "z") || (c >= "A" && c <= "Z");
  isDigitC = c: c >= "0" && c <= "9";
  identStart = c: isLetter c || c == "_";
  mutualIdent = c: isLetter c || isDigitC c || c == "_" || c == "?" || c == "'";
  topIdent = c: isLetter c || isDigitC c || c == "_" || c == "'";

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
    in
    if right.at <= left.at then "" else builtins.substring left.at (right.at - left.at) s;

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
            if mutualIdent c then st // { acc = st.acc + c; }
            else { done = true; had = true; acc = st.acc; }
          else if identStart c then { done = false; had = true; acc = c; }
          else if c == " " || c == "\t" then st
          else { done = true; had = false; acc = ""; }
      ) { done = false; had = false; acc = ""; } (builtins.genList (i: i) n);
    in fin.acc;

  wordsOf = s:
    builtins.filter (w: builtins.isString w && w != "")
      (builtins.split "[ \t\r\n]+" s);

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

  takeBy = s: identAfterBy (wordsOf s);

  isNatLit = s: s != "" && builtins.match "[0-9]+" s != null;
  isStringLit = s:
    let n = builtins.stringLength s; in
    n >= 2 && builtins.substring 0 1 s == "\"" && builtins.substring (n - 1) 1 s == "\"";
  isKeyword = s: builtins.elem s keywords;
  isIdent = s: s != "" && !isKeyword s && !isNatLit s && !isStringLit s;

  lineTokens = line:
    builtins.filter (p: builtins.isString p && p != "")
      (builtins.split "[ \t\r]+" line);

  hkStringLitDef = toks:
    builtins.length toks == 6
    && builtins.elemAt toks 0 == "def"
    && isIdent (builtins.elemAt toks 1)
    && builtins.elemAt toks 2 == ":"
    && builtins.elemAt toks 3 == "String"
    && builtins.elemAt toks 4 == ":="
    && isStringLit (builtins.elemAt toks 5);

  # SlakeCheckSource.acceptKeptStringLitDef stepper. One line.
  stepStringLine = blk0: line:
    let
      n = builtins.stringLength line;
      fin = builtins.foldl' (st: i:
        if st.stop then st
        else if st.skip > 0 then st // { skip = st.skip - 1; }
        else
          let
            c = builtins.substring i 1 line;
            nxt = if i + 1 >= n then "" else builtins.substring (i + 1) 1 line;
          in
          if st.blk then
            if st.dash && c == "/" then st // { blk = false; dash = false; str = false; esc = false; }
            else if c == "-" then st // { blk = true; dash = true; str = false; esc = false; }
            else st // { blk = true; dash = false; str = false; esc = false; }
          else if st.esc then
            st // { blk = false; dash = false; str = true; esc = false; acc = st.acc + c; }
          else if st.str && c == "\\" then
            st // { esc = true; }
          else if st.str && c == "\"" then
            st // { blk = false; dash = false; str = false; esc = false; acc = st.acc + "\""; }
          else if st.str then
            st // { acc = st.acc + c; }
          else if c == "-" && nxt == "-" then
            st // { stop = true; blk = false; }
          else if c == "/" && nxt == "-" then
            st // { blk = true; dash = false; str = false; esc = false; skip = 1; }
          else if c == "\"" then
            st // { str = true; acc = st.acc + "\""; }
          else
            st // { acc = st.acc + c; }
      ) { blk = blk0; dash = false; str = false; esc = false; acc = ""; stop = false; skip = 0; }
        (builtins.genList (i: i) n);
    in { blk = fin.blk; code = fin.acc; };

  acceptKeptStringLitDef = src:
    let
      fin = builtins.foldl' (st: line:
        if st.done then st
        else
          let
            stepped = stepStringLine st.blk line;
            toks = lineTokens stepped.code;
            head = if toks == [ ] then "" else builtins.head toks;
          in
          if toks == [ ] then st // { blk = stepped.blk; }
          else if head == "import" || head == "open" || head == "private" || head == "example" then
            st // { blk = stepped.blk; }
          else if head == "namespace" && builtins.length toks == 2 && isIdent (builtins.elemAt toks 1) then
            st // { blk = stepped.blk; }
          else { done = true; blk = stepped.blk; yes = hkStringLitDef toks; }
      ) { done = false; blk = false; yes = false; } (linesOf src);
    in fin.yes;

  # --- rejectClosed: first theorem ascription, plus decide! ---
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
    else if builtins.substring 0 2 t == ":=" then null
    else if builtins.substring 0 1 t == ":" then
      let body = trim (untilAssign (trim (dropChars t 1))); in
      if body == "" then null else body
    else null;

  takeIdentTop = s:
    let
      n = builtins.stringLength s;
      fin = builtins.foldl' (st: i:
        if st.done then st
        else
          let c = builtins.substring i 1 s; in
          if st.had then
            if topIdent c then st // { acc = st.acc + c; }
            else { done = true; acc = st.acc; }
          else if identStart c then { done = false; had = true; acc = c; }
          else { done = true; had = false; acc = ""; }
      ) { done = false; had = false; acc = ""; } (builtins.genList (i: i) n);
    in fin.acc;

  thmAscription = src:
    builtins.foldl' (cur: line:
      if cur != null then cur
      else
        let t = skipMods 8 (trim (stripCr line)); in
        if startsWord t "theorem" then
          let
            rest = trim (dropChars t 7);
            nm = firstIdent rest;
          in
          if nm == "" then cur
          else
            let more = dropChars rest (builtins.stringLength nm); in
            let ty = colonType more; in
            if ty == null then cur else ty
        else cur
    ) null (linesOf src);

  scanBad = s: pred:
    let
      n = builtins.stringLength s;
      go = builtins.foldl' (st: i:
        if st.hit then st else
          let c = builtins.substring i 1 s; in
          pred st i c
      ) { hit = false; i = 0; } (builtins.genList (i: i) n);
    in go.hit;

  hasBeq = s:
    let n = builtins.stringLength s; in
    builtins.foldl' (st: i:
      if st then true
      else if i + 2 < n && builtins.substring i 3 s == "===" then false
      else if i + 1 < n && builtins.substring i 2 s == "==" then true
      else false
    ) false (builtins.genList (i: i) n);

  # === must not count as ==. The fold above returns true on the first
  # == even when it is the start of ===, because it does not skip.
  # Re-scan with an index skip via a recursive function on a short ascription.
  hasBeqSkip = s:
    let
      n = builtins.stringLength s;
      go = i:
        if i >= n then false
        else if i + 2 < n && builtins.substring i 3 s == "===" then go (i + 3)
        else if i + 1 < n && builtins.substring i 2 s == "==" then true
        else go (i + 1);
    in go 0;

  hasBne = s:
    let n = builtins.stringLength s; in
    let go = i:
      if i + 1 >= n then false
      else if builtins.substring i 2 s == "!=" then true
      else go (i + 1);
    in if n == 0 then false else go 0;

  hasArrow = s:
    let
      n = builtins.stringLength s;
      go = i:
        if i + 1 >= n then false
        else if i + 1 < n && builtins.substring i 2 s == "!=" then go (i + 2)
        else if i + 1 < n && builtins.substring i 2 s == "==" then go (i + 2)
        else if builtins.substring i 2 s == "=>" then true
        else go (i + 1);
    in if n == 0 then false else go 0;

  hasOrInfix = s: hasPair s "||";
  hasAndInfix = s: hasPair s "&&";
  hasXorInfix = s: hasPair s "^^";
  hasPair = s: pair:
    let
      n = builtins.stringLength s;
      go = i:
        if i + 1 >= n then false
        else if builtins.substring i 2 s == pair then true
        else go (i + 1);
    in if n == 0 then false else go 0;

  hasBoundedWord = s: w: rejectBang:
    let
      wl = builtins.stringLength w;
      n = builtins.stringLength s;
      go = i:
        if i > n - wl || wl == 0 || n == 0 then false
        else
          let
            prev = if i == 0 then "" else builtins.substring (i - 1) 1 s;
            chunk = builtins.substring i wl s;
            next = if i + wl >= n then "" else builtins.substring (i + wl) 1 s;
            prevOk = prev == "" || !mutualIdent prev;
            nextIdent = next != "" && mutualIdent next;
            blocked = nextIdent || (rejectBang && next == "!");
          in
          if prevOk && chunk == w && !blocked then true else go (i + 1);
    in go 0;

  identPieces = s:
    builtins.filter (p: builtins.isString p && p != "")
      (builtins.split "[^A-Za-z0-9_?']+" s);

  hasWordSeq = s: ws:
    let
      ps = identPieces s;
      go = ps: ws:
        if ws == [ ] then true
        else if ps == [ ] then false
        else if builtins.head ps == builtins.head ws then go (builtins.tail ps) (builtins.tail ws)
        else go (builtins.tail ps) ws;
    in go ps ws;

  hasNotPrefix = s:
    let
      n = builtins.stringLength s;
      go = i:
        if i >= n then false
        else
          let
            c = builtins.substring i 1 s;
            nxt = if i + 1 >= n then "" else builtins.substring (i + 1) 1 s;
          in
          if c == "!" && nxt == "=" then go (i + 2)
          else if c == "!" then true
          else if identStart c then
            let
              fin = builtins.foldl' (st: j:
                if st.done then st
                else if j < i then st
                else if mutualIdent (builtins.substring j 1 s) then st
                else { done = true; at = j; }
              ) { done = false; at = n; } (builtins.genList (j: j) n);
            in go fin.at
          else go (i + 1);
    in if n == 0 then false else go 0;

  ascriptionBad = ty:
    ty != null && (
      hasBeqSkip ty || hasBne ty || hasArrow ty
      || hasWordSeq ty [ "if" "then" "else" ]
      || hasBoundedWord ty "ite" false
      || hasBoundedWord ty "decide" true
      || hasBoundedWord ty "cond" false
      || hasBoundedWord ty "dite" false
      || hasBoundedWord ty "bif" false
      || hasBoundedWord ty "dcond" false
      || hasBoundedWord ty "or" false
      || hasBoundedWord ty "and" false
      || hasBoundedWord ty "not" false
      || hasBoundedWord ty "xor" false
      || hasBoundedWord ty "strictOr" false
      || hasBoundedWord ty "strictAnd" false
      || hasBoundedWord ty "bne" false
      || hasBoundedWord ty "beq" false
      || hasNotPrefix ty
      || hasOrInfix ty || hasAndInfix ty || hasXorInfix ty
    );

  isDecideBang = w:
    builtins.stringLength w >= 7 && builtins.substring 0 7 w == "decide!";

  decideBang = src:
    let
      ws = wordsOf src;
      fin = builtins.foldl' (st: w:
        if st.done then st
        else if st.saw then { done = true; saw = true; hit = isDecideBang w; }
        else if w == "by" then { done = false; saw = true; hit = false; }
        else st
      ) { done = false; saw = false; hit = false; } ws;
    in fin.hit;

  rejectClosed = src:
    !decideBang src && !ascriptionBad (thmAscription src);

  thmHasDecide = want: src:
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

  # --- MutualForm code lines, then walkKept / typesOf ---
  emptyScan = {
    mode = 0; rawN = 0; seen = 0; blkN = 0;
    dash = false; slash = false; taking = false; acc = "";
  };

  push = sc: c: if sc.taking then sc // { acc = sc.acc + c; } else sc;

  identTail = acc:
    let n = builtins.stringLength acc; in
    n > 0 && mutualIdent (builtins.substring (n - 1) 1 acc);

  pushHashes = sc: k:
    if k <= 0 then sc else pushHashes (push sc "#") (k - 1);

  afterCode = sc: c:
    if c == "-" then sc // { mode = 8; }
    else if c == "/" then sc // { mode = 9; }
    else if c == "r" then sc // { mode = 6; }
    else if c == "\"" then sc // { mode = 3; dash = false; taking = false; }
    else if c == "'" then
      if sc.taking && identTail sc.acc then push sc "'"
      else sc // { mode = 10; seen = 0; }
    else push (sc // { mode = 0; }) c;

  eatChar = sc: c:
    if sc.mode == 1 then sc
    else if sc.mode == 2 then
      if sc.slash && c == "-" then sc // { blkN = sc.blkN + 1; slash = false; dash = false; }
      else if sc.slash && c == "/" then sc // { slash = true; }
      else if sc.slash then sc // { slash = false; dash = c == "-"; }
      else if sc.dash && c == "/" then
        if sc.blkN == 0 then sc // { mode = 0; dash = false; slash = false; }
        else sc // { blkN = sc.blkN - 1; dash = false; }
      else if sc.dash then sc // { dash = c == "-"; slash = c == "/"; }
      else if c == "-" then sc // { dash = true; }
      else if c == "/" then sc // { slash = true; }
      else sc
    else if sc.mode == 3 then
      if sc.dash then sc // { dash = false; }
      else if c == "\\" then sc // { dash = true; }
      else if c == "\"" then sc // { mode = 0; dash = false; }
      else sc
    else if sc.mode == 4 then
      if c == "\"" then sc // { mode = 5; seen = 0; }
      else sc
    else if sc.mode == 5 then
      if c == "#" then
        if sc.seen + 1 == sc.rawN then sc // { mode = 0; rawN = 0; seen = 0; }
        else sc // { seen = sc.seen + 1; }
      else if c == "\"" then sc // { seen = 0; }
      else sc // { mode = 4; seen = 0; }
    else if sc.mode == 6 then
      if c == "#" then sc // { mode = 7; rawN = 1; }
      else afterCode (push (sc // { mode = 0; }) "r") c
    else if sc.mode == 7 then
      if c == "#" then sc // { rawN = sc.rawN + 1; }
      else if c == "\"" then sc // { mode = 4; taking = false; seen = 0; }
      else
        let
          k = sc.rawN;
          base = sc // { mode = 0; rawN = 0; seen = 0; };
        in afterCode (pushHashes (push base "r") k) c
    else if sc.mode == 8 then
      if c == "-" then sc // { mode = 1; taking = false; }
      else afterCode (push (sc // { mode = 0; }) "-") c
    else if sc.mode == 9 then
      if c == "-" then sc // { mode = 2; blkN = 0; dash = false; slash = false; taking = false; }
      else afterCode (push (sc // { mode = 0; }) "/") c
    else if sc.mode == 10 then
      if sc.seen == 0 && c == "\\" then sc // { seen = 1; }
      else if sc.seen == 1 then sc // { seen = 2; }
      else if sc.seen == 0 then sc // { seen = 2; }
      else if c == "'" then sc // { mode = 0; seen = 0; }
      else afterCode (sc // { mode = 0; seen = 0; }) c
    else afterCode sc c;

  flushPending = sc:
    if sc.mode == 8 then push (sc // { mode = 0; }) "-"
    else if sc.mode == 9 then push (sc // { mode = 0; }) "/"
    else if sc.mode == 6 then push (sc // { mode = 0; }) "r"
    else if sc.mode == 7 then
      let k = sc.rawN; base = sc // { mode = 0; rawN = 0; seen = 0; }; in
      pushHashes (push base "r") k
    else sc;

  endLine = sc:
    if sc.mode == 1 then
      sc // { mode = 0; dash = false; slash = false; taking = false; acc = ""; }
    else sc // { taking = false; acc = ""; };

  eatLine = sc: line:
    let
      n = builtins.stringLength line;
      started = sc.mode == 0;
      begun = sc // { taking = started; acc = ""; };
      eaten = builtins.foldl' (st: i: eatChar st (builtins.substring i 1 line)) begun
        (builtins.genList (i: i) n);
      flushed = flushPending eaten;
      code = if started then flushed.acc else "";
    in { code = code; sc = endLine flushed; };

  isKw = w:
    builtins.elem w [
      "theorem" "def" "example" "mutual" "end" "namespace" "import" "open"
      "structure" "inductive" "instance" "class" "where" "set_option"
      "if" "then" "else" "match" "fun" "do" "let" "have"
    ];

  isBareEnd = s:
    s == "end" || (startsWord s "end" && trim (dropChars s 3) == "");

  emptyAcc = {
    inMut = false; leftN = ""; rightN = ""; thmN = "";
    proof = ""; defN = ""; tacN = ""; waitBy = false;
  };

  withTac = st: w:
    if w == "" then st // { waitBy = true; }
    else
      let
        proof = if st.proof == "" then "by " + w else st.proof;
        tac = if st.tacN == "" then w else st.tacN;
      in st // { proof = proof; tacN = tac; waitBy = false; };

  addMut = st: nm:
    if !st.inMut || nm == "" then st
    else if st.leftN == "" then st // { leftN = nm; }
    else if st.rightN == "" then st // { rightN = nm; }
    else st;

  onTheorem = st: rest:
    let
      nm = firstIdent rest;
      st1 = if st.thmN == "" && nm != "" then st // { thmN = nm; } else st;
      st2 = addMut st1 nm;
      w = takeBy rest;
    in if w == null then st2 else withTac st2 w;

  onDef = st: rest:
    let nm = firstIdent rest; in
    if nm == "" then st
    else
      let st1 = if st.defN == "" then st // { defN = nm; } else st; in
      addMut st1 nm;

  onExample = st: rest:
    let w = takeBy rest; in
    if w == null then st else withTac st w;

  classifyLine = st: raw:
    let s = trim (stripCr raw); in
    if s == "" then st
    else if st.waitBy then
      let w = firstIdent s; in
      if w == "" || isKw w then st // { waitBy = false; }
      else withTac (st // { waitBy = false; }) w
    else if startsWord s "mutual" then st // { inMut = true; }
    else if isBareEnd s then
      if st.inMut then st // { inMut = false; } else st
    else
      let t = skipMods 8 s; in
      if startsWord t "theorem" then onTheorem st (trim (dropChars t 7))
      else if startsWord t "def" then onDef st (trim (dropChars t 3))
      else if startsWord t "example" then onExample st (trim (dropChars t 7))
      else if startsWord t "by" then
        let w = takeBy t; in
        if w == null then st else withTac st w
      else
        let w = takeBy t; in
        if w == null then st else withTac st w;

  scanMutual = src:
    let
      rawLines = linesOf src;
      fin = builtins.foldl' (st: line:
        let ate = eatLine st.sc line; in
        {
          sc = ate.sc;
          acc = if st.sc.mode == 0 then classifyLine st.acc ate.code else st.acc;
          codes = st.codes ++ [ ate.code ];
        }
      ) { sc = emptyScan; acc = emptyAcc; codes = [ ]; } rawLines;
    in fin;

  hitOf = acc: sc:
    if sc.mode != 0 then null
    else if acc.leftN == "" || acc.rightN == "" then null
    else if acc.thmN == "" || acc.defN == "" || acc.tacN == "" then null
    else {
      left = acc.leftN; right = acc.rightN; thm = acc.thmN;
      defn = acc.defN; tac = acc.tacN;
    };

  hasLinear = nm:
    builtins.match ".*[lL]inear.*" nm != null
    || builtins.elem nm [
      "typesFixtureMintId" "programFixtureMintId" "graphFixtureMintId"
      "compilePathFixtureMintId" "extractFixtureMintId" "applyFixtureMintId"
      "bodyFixtureMintId" "composeFixtureMintId" "multFixtureMintId"
      "planFixtureMintId"
    ];

  hasEqSign = s: builtins.match ".*=.*" s != null;

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
      else if firstIdent t == t && t != "" && identStart (builtins.substring 0 1 t) then
        { k = "named"; n = t; }
      else null;

  tyEq = a: b:
    if a == null || b == null then false
    else if a.k != b.k then false
    else if a.k == "option" then tyEq a.a b.a
    else if a.k == "named" then a.n == b.n
    else true;

  hostTypeOk = t:
    if t == null then false
    else if t.k == "option" then hostTypeOk t.a
    else if t.k == "named" then t.n != ""
    else true;

  indexOfIdent = s: name:
    let
      n = builtins.stringLength s;
      wn = builtins.stringLength name;
      go = i:
        if wn == 0 || i > n - wn then null
        else
          let
            prev = if i == 0 then "" else builtins.substring (i - 1) 1 s;
            nxt = if i + wn >= n then "" else builtins.substring (i + wn) 1 s;
            prevOk = prev == "" || !mutualIdent prev;
            nxtOk = nxt == "" || !mutualIdent nxt;
          in
          if prevOk && nxtOk && builtins.substring i wn s == name then i
          else go (i + 1);
    in if n == 0 then null else go 0;

  ascriptionOnLine = name: line:
    let i = indexOfIdent line name; in
    if i == null then null
    else colonType (dropChars line (i + builtins.stringLength name));

  grab = lines: name:
    builtins.foldl' (cur: line:
      if cur != null then cur else ascriptionOnLine name line
    ) null lines;

  typesOfNames = lines: closed: thm: left: right: lin:
    if !closed then null
    else
      let
        tt = parseHostType 32 (grab lines thm);
        lt = parseHostType 32 (grab lines left);
        rt = parseHostType 32 (grab lines right);
        dt = parseHostType 32 (grab lines lin);
      in
      if tt == null || lt == null || rt == null || dt == null then null
      else { thmTy = tt; leftTy = lt; rightTy = rt; linTy = dt; };

  distinctFour = h:
    h.defn != h.left && h.defn != h.right && h.thm != h.left
    && h.thm != h.right && h.thm != h.defn && h.left != h.right;

  typedPass = h: src: lines: closed:
    h != null
    && h.left != "" && h.right != "" && h.thm != "" && h.defn != "" && h.tac != ""
    && distinctFour h
    && h.tac == "decide"
    && hasLinear h.defn
    && rejectClosed src
    && (
      let ty = typesOfNames lines closed h.thm h.left h.right h.defn; in
      ty != null
      && tyEq ty.thmTy boolTy
      && hostTypeOk ty.leftTy
      && tyEq ty.leftTy ty.rightTy
      && tyEq ty.leftTy optionHost
      && tyEq ty.linTy natTy
    );

  kernelYes = scanned: src:
    typedPass (hitOf scanned.acc scanned.sc) src scanned.codes (scanned.sc.mode == 0);

  rewriteNames = [
    "programFixtureMintId"
    "compilePathFixtureMintId"
    "extractFixtureMintId"
    "multFixtureMintId"
    "planFixtureMintId"
  ];

  keptRejectYes = scanned: src:
    let h = hitOf scanned.acc scanned.sc; in
    kernelYes scanned src
    || (
      h != null
      && hasLinear h.defn
      && builtins.elem h.defn rewriteNames
      && (
        let
          src2 = builtins.replaceStrings rewriteNames
            [ "typesFixtureMintId" "typesFixtureMintId" "typesFixtureMintId" "typesFixtureMintId" "typesFixtureMintId" ]
            src;
          h2 = h // { defn = "typesFixtureMintId"; };
          scanned2 = scanMutual src2;
        in typedPass h2 src2 scanned2.codes (scanned2.sc.mode == 0)
      )
    );

  fixtureYes = scanned: src: arm:
    thmHasDecide arm.thm src
    && rejectClosed src
    && (
      let
        closed = scanned.sc.mode == 0;
        ty = typesOfNames scanned.codes closed arm.thm arm.left arm.right arm.lin;
        wantLeft = if arm.leftKind == "bool" then boolTy else optionHost;
      in
      ty != null
      && tyEq ty.thmTy boolTy
      && hostTypeOk ty.leftTy
      && tyEq ty.leftTy ty.rightTy
      && tyEq ty.leftTy wantLeft
      && tyEq ty.linTy natTy
    );

  # --- TopScan for parseTheoremSurface ---
  startsAny = t: prefs:
    builtins.any (p: builtins.substring 0 (builtins.stringLength p) t == p) prefs;

  isStart = t:
    t == "end" || t == "mutual" || startsAny t [
      "def " "theorem " "example" "structure " "import " "namespace "
      "end " "axiom " "inductive " "set_option " "mutual " "abbrev "
      "instance " "class " "private " "noncomputable " "protected "
      "partial " "unsafe " "@" "#" "section" "variable " "open "
    ];

  unAttr = t:
    if builtins.substring 0 2 t != "@[" then t
    else
      let
        n = builtins.stringLength t;
        fin = builtins.foldl' (st: i:
          if st.done then st
          else if builtins.substring i 1 t == "]" then { done = true; at = i + 1; }
          else st
        ) { done = false; at = 0; } (builtins.genList (i: i) n);
      in if fin.done then trim (dropChars t fin.at) else t;

  dropLead = s: pre:
    let p = pre + " "; in
    if builtins.substring 0 (builtins.stringLength p) s == p
    then trim (dropChars s (builtins.stringLength p))
    else null;

  dropMods = fuel: s:
    if fuel <= 0 then s
    else
      let a = dropLead s "private"; in
      if a != null then dropMods (fuel - 1) a
      else
        let b = dropLead s "noncomputable"; in
        if b != null then dropMods (fuel - 1) b
        else
          let c = dropLead s "protected"; in
          if c != null then dropMods (fuel - 1) c
          else
            let d = dropLead s "partial"; in
            if d != null then dropMods (fuel - 1) d
            else
              let e = dropLead s "unsafe"; in
              if e != null then dropMods (fuel - 1) e
              else s;

  joinSp = xs:
    if xs == [ ] then ""
    else builtins.concatStringsSep " " xs;

  hasSuffix = s: suf:
    let
      n = builtins.stringLength s;
      m = builtins.stringLength suf;
    in m <= n && builtins.substring (n - m) m s == suf;

  assignParts = flat:
    let
      n = builtins.stringLength flat;
      fin = builtins.foldl' (st: i:
        if st.hit != null then st
        else if i + 1 >= n then st
        else if builtins.substring i 2 flat == ":=" then { hit = i; }
        else st
      ) { hit = null; } (builtins.genList (i: i) n);
    in
    if fin.hit == null then null
    else {
      pre = builtins.substring 0 fin.hit flat;
      rhs = dropChars flat (fin.hit + 2);
    };

  retKind = flat:
    let p = assignParts flat; in
    if p == null then null
    else
      let t = trim p.pre; in
      if hasSuffix t "String" then "str"
      else if hasSuffix t "Bool" then "bool"
      else null;

  exactBool = t: if t == "true" then true else if t == "false" then false else null;

  asStringLit = rhs:
    let t = trim rhs; in
    if isStringLit t && builtins.match "\"([^\\\\\"]|\\\\.)*\"[ \t]*" t != null then t
    else if isStringLit t && builtins.length (lineTokens t) == 1 then t
    else null;

  chunkBool = lines:
    builtins.foldl' (st: line:
      if st.done then st
      else
        let p = assignParts line; in
        if p != null then
          let t = trim p.rhs; in
          if t == "" then st // { waiting = true; }
          else { done = true; waiting = false; val = exactBool t; }
        else if st.waiting then
          let t = trim line; in
          if t == "" then st
          else { done = true; waiting = false; val = exactBool t; }
        else st
    ) { done = false; waiting = false; val = null; } lines;

  chunkStr = lines:
    builtins.foldl' (st: line:
      if st.done then st
      else
        let p = assignParts line; in
        if p != null then
          let t = trim p.rhs; in
          if t == "" then st // { waiting = true; }
          else { done = true; waiting = false; val = if isStringLit t && trim (dropChars t (builtins.stringLength t)) == "" then "lit" else null; }
        else if st.waiting then
          let t = trim line; in
          if t == "" then st
          else { done = true; waiting = false; val = if isStringLit t then "lit" else null; }
        else st
    ) { done = false; waiting = false; val = null; } lines;

  emptySurface = {
    ns = [ ]; ends = [ ]; theoremN = 0; mainN = 0; structN = 0;
    bools = [ ]; strs = 0; cur = null; mode = "code"; depth = 0;
    rawN = 0; seen = 0; line = ""; ok = true;
  };

  classifyChunk = b: lines:
    let
      flat = joinSp lines;
      body = dropMods 6 flat;
    in
    if startsWord body "import" || builtins.substring 0 7 body == "import " then b
    else if builtins.substring 0 10 body == "namespace " then
      let m = trim (dropChars body 10); in
      if m == "" then b else b // { ns = b.ns ++ [ m ]; }
    else if body == "end" then b
    else if builtins.substring 0 4 body == "end " then
      let m = trim (dropChars body 4); in
      if m == "" then b else b // { ends = b.ends ++ [ m ]; }
    else if builtins.substring 0 8 body == "theorem " then
      b // { theoremN = b.theoremN + 1; }
    else if builtins.substring 0 7 body == "example" then b
    else if builtins.substring 0 10 body == "structure " then
      b // { structN = b.structN + 1; }
    else if builtins.substring 0 4 body == "def " then
      let
        rest = trim (dropChars body 4);
        name = takeIdentTop rest;
      in
      if name == "main" then b // { mainN = b.mainN + 1; }
      else if name == "" then b
      else
        let kind = retKind flat; in
        if kind == "bool" then
          let got = chunkBool lines; in
          if got.val == true || got.val == false then
            b // { bools = b.bools ++ [ { name = name; v = got.val; } ]; }
          else b
        else if kind == "str" then
          let got = chunkStr lines; in
          if got.val != null then b // { strs = b.strs + 1; }
          else b
        else b
    else b;

  flushChunkLine = b:
    let t = unAttr (trim b.line); in
    if t == "" then b // { line = ""; }
    else if isStart t then
      let b2 = if b.cur == null then b else classifyChunk b b.cur; in
      b2 // { cur = [ t ]; line = ""; }
    else if b.cur == null then b // { line = ""; }
    else b // { cur = b.cur ++ [ t ]; line = ""; };

  finishSurface = b:
    let
      b1 = if b.line != "" then flushChunkLine b else b;
      b2 = if b1.cur == null then b1 else classifyChunk b1 b1.cur;
    in b2;

  # TopScan.walk, simplified to the modes parseTheoremSurface needs.
  # Char literals and raw strings follow TopScan.lean walk.
  eatSurfaceChar = b: c: nxt:
    if !b.ok then b
    else if b.mode == "line" then
      if c == "\n" then flushChunkLine (b // { mode = "code"; })
      else b
    else if b.mode == "blk" then
      if c == "/" && nxt == "-" then b // { depth = b.depth + 1; skip = 1; }
      else if b.skip or 0 > 0 then b // { skip = 0; }
      else if c == "-" && nxt == "/" then
        let d = b.depth - 1; in
        if b.depth <= 1 then b // { mode = "code"; depth = 0; skip = 1; }
        else b // { depth = d; skip = 1; }
      else if c == "\n" then flushChunkLine b
      else b
    else if b.mode == "esc" then
      flushNote (b // { mode = "str"; }) c
    else if b.mode == "str" then
      if c == "\\" then b // { mode = "esc"; }
      else if c == "\"" then b // { mode = "code"; line = b.line + "\""; }
      else if c == "\n" then flushChunkLine (b // { line = b.line + "\n-split"; })
      else b // { line = b.line + c; }
    else if b.mode == "raw" then
      if c == "\"" && b.rawN == 0 then b // { mode = "code"; line = b.line + " RAW "; }
      else if c == "\"" then b // { mode = "rawClose"; seen = 0; }
      else if c == "\n" then flushChunkLine b
      else b
    else if b.mode == "rawClose" then
      if c == "#" && b.seen + 1 == b.rawN then b // { mode = "code"; line = b.line + " RAW "; rawN = 0; seen = 0; }
      else if c == "#" then b // { seen = b.seen + 1; }
      else if c == "\"" then b // { seen = 0; }
      else if c == "\n" then flushChunkLine (b // { mode = "raw"; seen = 0; })
      else b // { mode = "raw"; seen = 0; }
    else if b.mode == "rhash" then
      if c == "#" then b // { rawN = b.rawN + 1; }
      else if c == "\"" then b // { mode = "raw"; seen = 0; }
      else b // { mode = "code"; line = b.line + "r" + hashText b.rawN + c; rawN = 0; }
    else if c == "\n" then flushChunkLine b
    else if c == "-" && nxt == "-" then b // { mode = "line"; skip = 1; }
    else if c == "/" && nxt == "-" then b // { mode = "blk"; depth = 1; skip = 1; }
    else if c == "\"" then b // { mode = "str"; line = b.line + "\""; }
    else if c == "r" && nxt == "\"" then b // { mode = "raw"; rawN = 0; skip = 1; }
    else if c == "r" && nxt == "#" then b // { mode = "rhash"; rawN = 1; skip = 1; }
    else if c == "'" && nxt == "\\" then b // { skip = 3; } # char literal, dropped
    else if c == "'" && nxt != "" && builtins.substring 0 1 nxt != "'" then
      # 'x' is three chars when the third is a quote. Checked below via skip.
      b // { line = b.line + c; }
    else b // { line = b.line + c; };

  hashText = k: if k <= 0 then "" else hashText (k - 1) + "#";

  flushNote = b: c: b // { line = b.line + c; };

  # The char-literal arm above is incomplete. A dedicated walker replaces it.
  surfaceWalk = src:
    let
      n = builtins.stringLength src;
      fin = builtins.foldl' (st: i:
        if st.skip > 0 then st // { skip = st.skip - 1; }
        else if !st.ok then st
        else
          let
            c = builtins.substring i 1 src;
            n1 = if i + 1 >= n then "" else builtins.substring (i + 1) 1 src;
            n2 = if i + 2 >= n then "" else builtins.substring (i + 2) 1 src;
            n3 = if i + 3 >= n then "" else builtins.substring (i + 3) 1 src;
          in
          if st.mode == "line" then
            if c == "\n" then flushChunkLine (st // { mode = "code"; })
            else st
          else if st.mode == "blk" then
            if c == "/" && n1 == "-" then st // { depth = st.depth + 1; skip = 1; }
            else if c == "-" && n1 == "/" then
              if st.depth <= 1 then st // { mode = "code"; depth = 0; skip = 1; }
              else st // { depth = st.depth - 1; skip = 1; }
            else if c == "\n" then flushChunkLine st
            else st
          else if st.mode == "esc" then
            st // { mode = "str"; line = st.line + "\\" + c; }
          else if st.mode == "str" then
            if c == "\\" then st // { mode = "esc"; }
            else if c == "\"" then st // { mode = "code"; line = st.line + "\""; }
            else if c == "\n" then flushChunkLine (st // { line = st.line; })
            else st // { line = st.line + c; }
          else if st.mode == "raw" then
            if c == "\"" && st.rawN == 0 then st // { mode = "code"; line = st.line + " RAW "; }
            else if c == "\"" then st // { mode = "rawClose"; seen = 0; }
            else if c == "\n" then flushChunkLine st
            else st
          else if st.mode == "rawClose" then
            if c == "#" && st.seen + 1 == st.rawN then
              st // { mode = "code"; line = st.line + " RAW "; rawN = 0; seen = 0; }
            else if c == "#" then st // { seen = st.seen + 1; }
            else if c == "\"" then st // { seen = 0; }
            else if c == "\n" then flushChunkLine (st // { mode = "raw"; seen = 0; })
            else st // { mode = "raw"; seen = 0; }
          else if st.mode == "rhash" then
            if c == "#" then st // { rawN = st.rawN + 1; }
            else if c == "\"" then st // { mode = "raw"; seen = 0; }
            else st // { mode = "code"; line = st.line + "r" + hashText st.rawN + c; rawN = 0; }
          else if c == "\n" then flushChunkLine st
          else if c == "-" && n1 == "-" then st // { mode = "line"; skip = 1; }
          else if c == "/" && n1 == "-" then st // { mode = "blk"; depth = 1; skip = 1; }
          else if c == "'" && n1 == "\\" && n2 == "'" && n3 == "'" then st // { skip = 3; }
          else if c == "'" && n1 == "\\" && n3 == "'" then st // { skip = 3; }
          else if c == "'" && n2 == "'" && n1 != "" && n1 != "\\" then st // { skip = 2; }
          else if c == "\"" then st // { mode = "str"; line = st.line + "\""; }
          else if c == "r" && n1 == "\"" then st // { mode = "raw"; rawN = 0; skip = 1; }
          else if c == "r" && n1 == "#" then st // { mode = "rhash"; rawN = 1; skip = 1; }
          else st // { line = st.line + c; }
      ) (emptySurface // { skip = 0; }) (builtins.genList (i: i) n);
      done = finishSurface fin;
    in
    if fin.mode != "code" && fin.mode != "line" then null else done;

  boolSuf = sc: suf:
    let xs = builtins.filter (p: hasSuffix p.name suf) sc.bools; in
    if xs == [ ] then null
    else builtins.any (p: p.v == true) xs;

  surfaceYes = src:
    if builtins.match ".*namespace.*" src == null then false
    else if builtins.match ".*theorem.*" src == null then false
    else
      let sc = surfaceWalk src; in
      sc != null
      && builtins.length sc.ns > 0
      && sc.theoremN > 0
      && sc.mainN == 0
      && sc.structN == 0
      && (builtins.length sc.bools + sc.strs) == 0
      && boolSuf sc "FullHost" != true
      && boolSuf sc "OwnsPackageTypecheck" != true
      && rejectClosed src
      && builtins.head sc.ns != "";

  # Per source. Missing file is not yes.
  judge = src:
    if src == null then null
    else
      let scanned = scanMutual src; in
      {
        kernel = kernelYes scanned src;
        reject = keptRejectYes scanned src;
        surface = surfaceYes src;
        string = acceptKeptStringLitDef src;
        fixtures = map (arm: fixtureYes scanned src arm) fixtureArms;
      };

  armYes = j: name:
    if j == null then false
    else if name == "KeptHitKernel.acceptKept" then j.kernel
    else if name == "KeptReject.acceptKept" then j.reject
    else if name == "acceptKeptTheoremSurface" then j.surface
    else if name == "acceptKeptStringLitDef" then j.string
    else
      let
        paired = builtins.genList (i: {
          name = (builtins.elemAt fixtureArms i).name;
          yes = builtins.elemAt j.fixtures i;
        }) (builtins.length fixtureArms);
        hit = builtins.filter (p: p.name == name) paired;
      in if hit == [ ] then false else (builtins.head hit).yes;

  modPath = name:
    let
      parts = builtins.filter builtins.isString (builtins.split "\\." name);
      rel = builtins.concatStringsSep "/" parts;
    in repo + "/src/systems/${rel}.lean";

  load = name:
    let p = modPath name; in
    if builtins.pathExists p then builtins.readFile p else null;

  optionHostToy =
    "namespace N\n"
    + "def linearN : Nat := 2\n"
    + "mutual\n"
    + "def leftN : Option Host := none\n"
    + "def rightN : Option Host := none\n"
    + "end\n"
    + "theorem th : True := by decide\n"
    + "end N\n";

  keptToy =
    "namespace N\n"
    + "def linearN : Nat := 2\n"
    + "mutual\n"
    + "def leftN : Nat := 0\n"
    + "def rightN : Nat := 1\n"
    + "end\n"
    + "theorem th : True := by decide\n"
    + "end N\n";

  commentToy =
    "namespace N\n"
    + "-- mutual\n"
    + "-- theorem th : True := by decide\n"
    + "-- def linearN : Nat := 0\n"
    + "end N\n";

  beqToy =
    "namespace N\n"
    + "def linearN : Nat := 2\n"
    + "mutual\n"
    + "def leftN : Option Host := none\n"
    + "def rightN : Option Host := none\n"
    + "end\n"
    + "theorem th : 1 == 1 := by decide\n"
    + "end N\n";

  bangToy =
    "namespace N\n"
    + "def linearN : Nat := 2\n"
    + "mutual\n"
    + "def leftN : Option Host := none\n"
    + "def rightN : Option Host := none\n"
    + "end\n"
    + "theorem th : True := by decide!\n"
    + "end N\n";

  stringToy =
    "namespace N\n"
    + "def s : String := \"ok\"\n"
    + "end N\n";

  spacedToy =
    "namespace N\n"
    + "def s : String := \"hello world\"\n"
    + "end N\n";

  boolToy =
    "namespace N\n"
    + "def s : Bool := true\n"
    + "end N\n";

  hiddenToy =
    "namespace N\n"
    + "/-\n"
    + "def hidden : String := \"no\"\n"
    + "-/\n"
    + "def shown : Bool := true\n"
    + "end N\n";

  shownStringToy =
    "/-\n"
    + "def hidden : String := \"no\"\n"
    + "-/\n"
    + "namespace N\n"
    + "def shown : String := \"ok\"\n"
    + "end N\n";

  privateToy =
    "namespace N\n"
    + "private def s : String := \"ok\"\n"
    + "end N\n";

  surfaceToy =
    "namespace SystemsLean.SurfaceMatrix\n"
    + "theorem matrixSurfaceOk_true : matrixSurfaceOk = true := by decide\n"
    + "end SystemsLean.SurfaceMatrix\n";

  hollowToy = "namespace N\nend N\n";

  boolAndThm =
    "namespace N\n"
    + "def flag : Bool := true\n"
    + "theorem th : True := by decide\n"
    + "end N\n";

  structToy =
    "namespace N\n"
    + "structure Foo where\n"
    + "  x : Nat\n"
    + "theorem th : True := by decide\n"
    + "end N\n";

  mainToy =
    "namespace N\n"
    + "def main : Nat := 2\n"
    + "theorem th : True := by decide\n"
    + "end N\n";

  typesToy =
    "namespace SystemsLean.CompilePath\n"
    + "def typesFixtureMintId : Nat := 2\n"
    + "def typesFixtureKindMultOk : Bool := true\n"
    + "def typesFixtureProgramReady : Bool := true\n"
    + "theorem typesFixtureKindMultOk_true : typesFixtureKindMultOk = true := by decide\n"
    + "end SystemsLean.CompilePath\n";

  commentThm =
    "namespace N\n"
    + "/-\n"
    + "theorem t : True := by decide\n"
    + "-/\n"
    + "end N\n";

  must = name: cond: if cond then true else builtins.throw "self-test ${name}";

  jOpt = judge optionHostToy;
  jKept = judge keptToy;
  jTypes = judge typesToy;

  selfTest =
    must "string-yes" (acceptKeptStringLitDef stringToy)
    && must "string-bool" (!acceptKeptStringLitDef boolToy)
    && must "string-keyword" (!acceptKeptStringLitDef "kept reject")
    && must "string-space" (!acceptKeptStringLitDef spacedToy)
    && must "string-hidden-bool" (!acceptKeptStringLitDef hiddenToy)
    && must "string-shown" (acceptKeptStringLitDef shownStringToy)
    && must "string-private" (!acceptKeptStringLitDef privateToy)
    && must "string-kernel-toy" (!acceptKeptStringLitDef optionHostToy)
    && must "kernel-option" jOpt.kernel
    && must "kernel-nat" (!jKept.kernel)
    && must "kernel-comment" (!(judge commentToy).kernel)
    && must "kernel-beq" (!(judge beqToy).kernel)
    && must "kernel-bang" (!(judge bangToy).kernel)
    && must "surface-option" jOpt.surface
    && must "surface-toy" (surfaceYes surfaceToy)
    && must "surface-hollow" (!surfaceYes hollowToy)
    && must "surface-bool" (!surfaceYes boolAndThm)
    && must "surface-struct" (!surfaceYes structToy)
    && must "surface-main" (!surfaceYes mainToy)
    && must "surface-comment-thm" (!surfaceYes commentThm)
    && must "surface-no-ns" (!surfaceYes "theorem th : True := by decide\n")
    && must "types-yes" (builtins.elemAt jTypes.fixtures 0)
    && must "types-not-program" (!(builtins.elemAt jTypes.fixtures 1))
    && must "types-not-kernel" (!jTypes.kernel)
    && must "reject-option" jOpt.reject
    && must "bang-detect" (decideBang bangToy)
    && must "bang-plain" (!decideBang optionHostToy)
    && must "beq-detect" (hasBeqSkip "1 == 1")
    && must "beq-eq" (!hasBeqSkip "a = true")
    && must "beq-eqeqeq" (!hasBeqSkip "===");

  raw = builtins.readFile logPath;
  logLines = linesOf raw;
  doneLines = builtins.filter (l: builtins.match "WALK_DONE.*" l != null) logLines;
  doneLine =
    if doneLines == [ ] then "not sampled"
    else builtins.elemAt doneLines (builtins.length doneLines - 1);

  failNames =
    builtins.filter (n: n != null) (map (l:
      let m = builtins.match "RESULT=fail NAME=(.*)" l; in
      if m == null then null else builtins.head m
    ) logLines);

  failN = builtins.length failNames;
  need = builtins.div failN 2 + 1;

  emptyCounts = builtins.listToAttrs (map (a: {
    name = a.name;
    value = { yes = 0; no = 0; };
  }) armOrder);

  counted = builtins.foldl' (st: name:
    let
      src = load name;
      j = if src == null then null else judge src;
      any = j != null && builtins.any (a: armYes j a.name) armOrder;
    in {
      missing = st.missing + (if src == null then 1 else 0);
      anyYes = st.anyYes + (if any then 1 else 0);
      counts = builtins.foldl' (cs: a:
        let
          bit = if j == null then null else armYes j a.name;
          prev = cs.${a.name};
        in
        if bit == null then cs
        else if bit then cs // { ${a.name} = prev // { yes = prev.yes + 1; }; }
        else cs // { ${a.name} = prev // { no = prev.no + 1; }; }
      ) st.counts armOrder;
    }
  ) { missing = 0; anyYes = 0; counts = emptyCounts; } failNames;

  eligible = builtins.filter (a: a.live || a.before) armOrder;

  winner = builtins.foldl' (st: a:
    if st != null then st
    else
      let y = counted.counts.${a.name}.yes; in
      if y >= need then a.name else null
  ) null eligible;

  largest = builtins.foldl' (st: a:
    let y = counted.counts.${a.name}.yes; in
    if y > st.yes then { yes = y; name = a.name; } else st
  ) { yes = -1; name = "not sampled"; } armOrder;

  notYes = failN - counted.anyYes - counted.missing;

  one = a:
    let
      y = counted.counts.${a.name}.yes;
      n = counted.counts.${a.name}.no;
    in
    "arm ${a.name} yes=${toString y} no=${toString n} undecided=0 meetsNeed=${yn (y >= need)} liveShortCircuit=${yn a.live} returnsNoneBeforeAfterKept=${yn a.before}";

  text = builtins.concatStringsSep "\n" ([
    "walkDone ${doneLine}"
    "fail=${toString failN}"
    "need=${toString need}"
  ] ++ map one armOrder ++ [
    "missingFile=${toString counted.missing}"
    "yesAny=${toString counted.anyYes}"
    "undecided=${toString notYes}"
    "largestYes=${toString largest.yes}"
    "largestArm=${largest.name}"
    "verdict=${if winner == null then "BLOCKED" else winner}"
    "A Nix reading is not a Lean execution."
  ]) + "\n";
in
if !selfTest then builtins.throw "self-test refused"
else if doneLine == "not sampled" then builtins.throw "WALK_DONE not sampled"
else text
