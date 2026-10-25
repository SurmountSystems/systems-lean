# SPDX-License-Identifier: Unlicense
# Group failing checker lines in one slake-check walk log.
# Counts are parsed from logPath via builtins.readFile.
# This file does not store a walk total. Not wired into flake.nix.
# It does not import a derivation and it does not build slake.
#
# A fail line is RESULT=fail. A pass line is RESULT=pass.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>".
# Exact layer "kept reject" and exact layer "front reject"
# are groups. Any other layer, including a missing layer,
# is the remainder group. Those three groups add to the
# RESULT=fail count. A layer phrase is not a parser arm.
#
# decidedYes counts a fail block only when one of its lines is
# the full String literal def shape: def, an ident, colon,
# String, colon-equals, and one double-quoted literal.
# A bare keyword is not that shape. Checker status text is not
# that shape. Blocks without that line stay undecided.
# Undecided is not a match.
#
#   nix eval --impure --raw --expr 'import ./nix/slake-check-dest-layers/stop-at-decl-walk1-fail-groups.nix { logPath = "/path/to.log"; }'
{ logPath }:
let
  raw = builtins.readFile logPath;
  chunks = builtins.filter builtins.isString (builtins.split "\n" raw);
  stripCr = s:
    let
      n = builtins.stringLength s;
    in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then
      builtins.substring 0 (n - 1) s
    else s;
  lines = map stripCr chunks;

  firstHit = re:
    let
      hit = builtins.filter (l: builtins.match re l != null) lines;
    in
    if hit == [ ] then null else builtins.head hit;

  shown = v: if v == null then "not sampled" else v;

  stringLitRe = "def[ \t]+[A-Za-z_][A-Za-z0-9_']*[ \t]*:[ \t]*String[ \t]*:=[ \t]*\"(\\\\.|[^\"])*\"[ \t]*";
  isStringLitShape = line: builtins.match stringLitRe line != null;

  probeFull = "def mintName : String := \"ok\"";
  probeKeyword = "kept reject";
  probeBare = "def name : String := true";
  probeWord = b: if b then "yes" else "no";

  bump = acc: key: acc // { ${key} = (acc.${key} or 0) + 1; };

  takeSample = samples: line:
    if builtins.length samples < 3 then samples ++ [ line ] else samples;

  step = st: line:
    let
      isBanner = builtins.match "===.*" line != null;
      isFalse = builtins.match "slake-check checker returned false for (.*)" line;
      isResultFail = builtins.match "RESULT=fail NAME=(.*)" line != null;
      isResultPass = builtins.match "RESULT=pass NAME=(.*)" line != null;
      isExit1 = builtins.match "EXIT=1 NAME=.*" line != null;
      shaped = isStringLitShape line;
      base = if shaped && !isBanner then st // { sawStringLit = true; } else st;
    in
    if line == "" then base
    else if isBanner then
      base // {
        expectLayer = false;
        pending = null;
        sawStringLit = false;
      }
    else if isFalse != null then
      base // { expectLayer = true; falseCount = base.falseCount + 1; }
    else if base.expectLayer then
      base // { expectLayer = false; pending = line; }
    else if isResultFail then
      let
        kept = base.pending == "kept reject";
        front = base.pending == "front reject";
        remKey = if base.pending == null then "no layer line" else base.pending;
      in
      base // {
        fail = base.fail + 1;
        kept = base.kept + (if kept then 1 else 0);
        front = base.front + (if front then 1 else 0);
        remainder = base.remainder + (if kept || front then 0 else 1);
        remainderKeys =
          if kept || front then base.remainderKeys
          else bump base.remainderKeys remKey;
        decidedYes = base.decidedYes + (if base.sawStringLit then 1 else 0);
        samples = takeSample base.samples line;
        expectLayer = false;
        pending = null;
        sawStringLit = false;
      }
    else if isResultPass then
      base // { pass = base.pass + 1; }
    else if isExit1 then
      base // { exit1 = base.exit1 + 1; }
    else
      base;

  empty = {
    expectLayer = false;
    pending = null;
    sawStringLit = false;
    fail = 0;
    pass = 0;
    kept = 0;
    front = 0;
    remainder = 0;
    remainderKeys = { };
    decidedYes = 0;
    falseCount = 0;
    exit1 = 0;
    samples = [ ];
  };

  fin = builtins.foldl' step empty lines;
  sum = fin.kept + fin.front + fin.remainder;
  undecided = fin.fail - fin.decidedYes;
  needHalf = fin.fail / 2;
  need = needHalf + 1;
  agrees =
    if fin.exit1 == fin.fail && fin.falseCount == fin.fail then "yes" else "no";
  remNames = builtins.attrNames fin.remainderKeys;
  remBody =
    if remNames == [ ] then "remainderDetail=none"
    else builtins.concatStringsSep "\n"
      (map (n: "remainderDetail ${toString fin.remainderKeys.${n}} ${n}") remNames);
  sampleBody =
    if fin.samples == [ ] then "sample=not sampled"
    else builtins.concatStringsSep "\n"
      (map (s: "sample ${s}") fin.samples);
  text = builtins.concatStringsSep "\n" [
    "header ${shown (firstHit "ELF=.*")}"
    "header ${shown (firstHit "BYTE_COUNT=.*")}"
    "header ${shown (firstHit "MAGIC=.*")}"
    "header ${shown (firstHit "WALK=.*")}"
    "walkDone ${shown (firstHit "WALK_DONE.*")}"
    "resultPass=${toString fin.pass}"
    "resultFail=${toString fin.fail}"
    "returnedFalse=${toString fin.falseCount}"
    "exit1=${toString fin.exit1}"
    "exit1AndFalseAgree=${agrees}"
    "group kept reject=${toString fin.kept}"
    "group front reject=${toString fin.front}"
    "group remainder=${toString fin.remainder}"
    "addition ${toString fin.kept} + ${toString fin.front} + ${toString fin.remainder} = ${toString sum}"
    "decidedYes=${toString fin.decidedYes}"
    "undecided=${toString undecided}"
    "needHalf=${toString needHalf}"
    "need=${toString need}"
    "probeFullShapeMatches=${probeWord (isStringLitShape probeFull)}"
    "probeKeywordMatches=${probeWord (isStringLitShape probeKeyword)}"
    "probeBareKeywordMatches=${probeWord (isStringLitShape probeBare)}"
    remBody
    sampleBody
  ] + "\n";
in
if sum == fin.fail then text
else builtins.throw "group sum ${toString sum} != resultFail ${toString fin.fail}"
