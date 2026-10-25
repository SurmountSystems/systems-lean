# SPDX-License-Identifier: Unlicense
# Novel Nix is Unlicense.
# Split ONLY the HostFrontLive kept-reject names whose suffix the
# partition called other. Counts come from the log via builtins.readFile.
# This file does not store a walk total. Not wired into flake.nix.
#
# Kept-reject selection matches kept-reject-hostfrontlive-partition.nix.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept
# reject only when the pending layer line is exactly "kept reject".
#
# Suffix rule, copied from that partition. Do not re-derive it.
# TheoremsSource, else MainSource, else Source, else other.
#
# Among those suffix-other names, the group is the next camel piece
# after HostFrontLive (the same stem rule as the partition). One
# capital, then lowercase letters. No such piece is the residual
# label other. A residual label such as other or Host is not a parser
# file. This reader does not invent a parser and does not name a
# .lean file as a land target.
#
# Majority means strictly more than half of this other-set.
# otherCount is N from the log. halfFloor is N/2 (integer division).
# need is halfFloor + 1. Compare largestStemCount versus need.
#
#   nix eval --impure --raw --option cores 8 --file nix/slake-check-dest-layers/kept-reject-hostfrontlive-other.nix text
let
  logPath = "/tmp/grok-goal-8f191f6eaf46/implementer/slake-check-stage1-sba0a8g6-1.log";
  walkExact = "WALK_DONE names=2801 pass=107 fail=2694";

  analyze = raw:
    let
      chunks = builtins.filter builtins.isString (builtins.split "\n" raw);
      stripCr = s:
        let n = builtins.stringLength s; in
        if n == 0 then s
        else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
        else s;
      lines = map stripCr chunks;
      bump = acc: key: acc // { ${key} = (acc.${key} or 0) + 1; };
      pieces = rest:
        let hit = builtins.match "([A-Z][a-z]*)(.*)" rest; in
        if hit == null then { stem = "other"; second = "none"; }
        else
          let
            stem = builtins.elemAt hit 0;
            tail = builtins.elemAt hit 1;
            secondHit = builtins.match "([A-Z][a-z]*).*" tail;
            second =
              if secondHit != null then builtins.head secondHit
              else if tail == "" then "end"
              else "tail";
          in { inherit stem second; };
      suffixOf = name:
        if builtins.match ".*TheoremsSource" name != null then "TheoremsSource"
        else if builtins.match ".*MainSource" name != null then "MainSource"
        else if builtins.match ".*Source" name != null then "Source"
        else "other";
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
            p = pieces (if restM == null then "" else builtins.head restM);
            suf = suffixOf name;
            inOther = inSet && suf == "other";
          in st // {
            expectLayer = false;
            pending = null;
            total = st.total + (if inSet then 1 else 0);
            suffixes = if inSet then bump st.suffixes suf else st.suffixes;
            stems = if inOther then bump st.stems p.stem else st.stems;
            seconds = if inOther then bump st.seconds "${p.stem}/${p.second}" else st.seconds;
            stemExample =
              if inOther && !(st.stemExample ? ${p.stem})
              then st.stemExample // { ${p.stem} = name; }
              else st.stemExample;
          }
        else if isFalse then st // { expectLayer = true; }
        else if st.expectLayer then st // { expectLayer = false; pending = line; }
        else if isTrue != null then st // { pending = builtins.head isTrue; }
        else st;
      empty = {
        expectLayer = false;
        pending = null;
        total = 0;
        suffixes = { };
        stems = { };
        seconds = { };
        stemExample = { };
      };
      fin = builtins.foldl' step empty lines;
      rowsOf = groups:
        let names = builtins.attrNames groups; in
        builtins.sort (a: b:
          if a.count != b.count then a.count > b.count else a.name < b.name
        ) (map (n: { name = n; count = groups.${n}; }) names);
      sumOf = rows: builtins.foldl' (s: r: s + r.count) 0 rows;
      stemRows = rowsOf fin.stems;
      sufRows = rowsOf fin.suffixes;
      total = fin.total;
      otherCount = fin.suffixes.other or 0;
      halfFloor = builtins.div otherCount 2;
      need = halfFloor + 1;
      headRow = rows: if rows == [ ] then { name = "none"; count = 0; } else builtins.head rows;
      largest = headRow stemRows;
      under = prefix: rows:
        let n = builtins.stringLength prefix; in
        builtins.filter (r: builtins.substring 0 n r.name == prefix) rows;
      largestSecond = headRow (under "${largest.name}/" (rowsOf fin.seconds));
      yn = b: if b then "yes" else "no";
      residual = largest.name == "other" || largest.name == "Host";
      topN = k: rows:
        let n = if builtins.length rows < k then builtins.length rows else k; in
        builtins.concatStringsSep "\n" (map (r:
          let ex = fin.stemExample.${r.name} or "none"; in
          "${toString r.count} ${r.name} ${ex}"
        ) (builtins.genList (i: builtins.elemAt rows i) n));
      sufLine = r: "${toString r.count} ${r.name}";
      text =
        "hostFrontLive=${toString total}\n"
        + "otherCount=${toString otherCount}\n"
        + "halfFloor=${toString halfFloor}\n"
        + "need=${toString need}\n"
        + "stemSum=${toString (sumOf stemRows)}\n"
        + "stemKinds=${toString (builtins.length stemRows)}\n"
        + "largestStem=${largest.name}\n"
        + "largestStemCount=${toString largest.count}\n"
        + "largestStemMoreThanHalf=${yn (largest.count > halfFloor)}\n"
        + "largestStemExample=${fin.stemExample.${largest.name} or "none"}\n"
        + "largestSecond=${largestSecond.name}\n"
        + "largestSecondCount=${toString largestSecond.count}\n"
        + "largestSecondMoreThanHalf=${yn (largestSecond.count > halfFloor)}\n"
        + "largestStemIsResidualLabel=${yn residual}\n"
        + "suffixSum=${toString (sumOf sufRows)}\n"
        + "suffixes\n"
        + builtins.concatStringsSep "\n" (map sufLine sufRows) + "\n"
        + "topStems\n"
        + topN 15 stemRows + "\n";
    in
    if sumOf sufRows != total || sumOf stemRows != otherCount then
      builtins.throw "other split sum diverged"
    else {
      inherit text total otherCount halfFloor need;
      largestName = largest.name;
      largestCount = largest.count;
    };

  syntheticLog = builtins.concatStringsSep "\n" [
    "=== [1] --slake-check SystemsLean.HostFrontLiveAlphaWidget ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveAlphaWidget"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveAlphaWidget"
    "=== [2] --slake-check SystemsLean.HostFrontLiveBetaWidget ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveBetaWidget"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveBetaWidget"
    "=== [3] --slake-check SystemsLean.HostFrontLiveGammaSource ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveGammaSource"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveGammaSource"
    "=== [4] --slake-check SystemsLean.HostFrontLiveDeltaTheoremsSource ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveDeltaTheoremsSource"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveDeltaTheoremsSource"
    "=== [5] --slake-check SystemsLean.HostFrontLiveEpsilonMainSource ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveEpsilonMainSource"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveEpsilonMainSource"
    "=== [6] --slake-check SystemsLean.HostFrontLiveZetaWidget ==="
    "slake-check checker returned false for SystemsLean.HostFrontLiveZetaWidget"
    "dropped layer"
    "EXIT=1 NAME=SystemsLean.HostFrontLiveZetaWidget"
    "=== [7] --slake-check SystemsLean.OtherKept ==="
    "slake-check checker returned false for SystemsLean.OtherKept"
    "kept reject"
    "EXIT=1 NAME=SystemsLean.OtherKept"
  ];

  flat = s: builtins.replaceStrings [ "\n" ] [ " " ] s;
  hasToken = s: token: builtins.match (".*" + token + ".*") (flat s) != null;
  syntheticPrintedForbidden = s:
    hasToken s "1354" || hasToken s "810" || hasToken s "2666";

  syn = analyze syntheticLog;
  synthetic = syn.text;
  syntheticOk =
    syn.otherCount == 2
    && syn.total == 5
    && syn.largestCount == 1
    && syn.largestName == "Alpha"
    && !syntheticPrintedForbidden synthetic;

  realRaw = builtins.readFile logPath;
  realChunks = builtins.filter builtins.isString (builtins.split "\n" realRaw);
  realLines = map (s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then builtins.substring 0 (n - 1) s
    else s
  ) realChunks;
  walkOk = builtins.any (l: l == walkExact) realLines;
  realBody =
    if !walkOk then builtins.throw "not sampled"
    else (analyze realRaw).text;

  rule =
    "rule=Among HostFrontLive kept-reject names whose suffix the partition called other, take the next camel piece after HostFrontLive, the same stem rule as the partition. A group counts toward a parser only if one existing .lean file under src/systems/SystemsLean has the parser function that would return a module for that group. If that file cannot be named, the group is not a land target. A residual label such as other or Host is not a parser file. Majority means strictly more than half of the other-set. otherCount is N from the log. halfFloor is N/2 using integer division. need is halfFloor + 1.\n";

  text =
    rule
    + "walkDone=${walkExact}\n"
    + realBody
    + "synthetic\n"
    + synthetic;
in
if !syntheticOk then builtins.throw "synthetic attr refused the inline log"
else {
  inherit text synthetic;
}
