# SPDX-License-Identifier: Unlicense
# Split kept-reject names that start with SystemsLean.HostFrontLive.
# Counts come from logPath via builtins.readFile. This file does not
# store a walk total. Not wired into flake.nix.
#
# Kept-reject selection matches kept-reject-name-groups.nix.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept
# reject only when the pending layer line is exactly "kept reject".
#
# End rule: a name that matches the whole string against Source at
# the end is sourceEnd. Every other HostFrontLive kept-reject name
# is notSource. Last word: the final capital-then-lowercase piece.
# The log does not name a parser.
#
#   nix eval --impure --raw --expr 'import ./nix/slake-check-dest-layers/kept-reject-hostfrontlive-tail.nix { logPath = "/path/to.log"; }'
{ logPath }:
let
  raw = builtins.readFile logPath;
  chunks = builtins.filter builtins.isString (builtins.split "\n" raw);
  stripCr = s:
    let n = builtins.stringLength s; in
    if n == 0 then s
    else if builtins.substring (n - 1) 1 s == "\r" then
      builtins.substring 0 (n - 1) s
    else s;
  lines = map stripCr chunks;
  bump = acc: key: acc // { ${key} = (acc.${key} or 0) + 1; };
  lastWord = name:
    let hit = builtins.match ".*([A-Z][a-z]*)" name; in
    if hit == null then "other" else builtins.head hit;
  sourceEnd = name: builtins.match ".*Source" name != null;
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
        inSet = kept && builtins.match "SystemsLean\\.HostFrontLive.*" name != null;
        word = lastWord name;
        notSrc = inSet && !sourceEnd name;
      in st // {
        expectLayer = false;
        pending = null;
        total = st.total + (if inSet then 1 else 0);
        notSource = st.notSource + (if notSrc then 1 else 0);
        lasts = if inSet then bump st.lasts word else st.lasts;
        notLasts = if notSrc then bump st.notLasts word else st.notLasts;
        example =
          if notSrc && !(st.example ? ${word})
          then st.example // { ${word} = name; }
          else st.example;
      }
    else if isFalse then st // { expectLayer = true; }
    else if st.expectLayer then st // { expectLayer = false; pending = line; }
    else if isTrue != null then st // { pending = builtins.head isTrue; }
    else st;
  empty = {
    expectLayer = false;
    pending = null;
    total = 0;
    notSource = 0;
    lasts = { };
    notLasts = { };
    example = { };
  };
  fin = builtins.foldl' step empty lines;
  rowsOf = groups:
    let names = builtins.attrNames groups; in
    builtins.sort (a: b:
      if a.count != b.count then a.count > b.count else a.name < b.name
    ) (map (n: { name = n; count = groups.${n}; }) names);
  sumOf = rows: builtins.foldl' (s: r: s + r.count) 0 rows;
  lastRows = rowsOf fin.lasts;
  notRows = rowsOf fin.notLasts;
  total = fin.total;
  halfFloor = builtins.div total 2;
  more = c: c > halfFloor;
  headRow = rows: if rows == [ ] then { name = "none"; count = 0; } else builtins.head rows;
  largest = headRow notRows;
  topN = k: rows:
    let n = if builtins.length rows < k then builtins.length rows else k; in
    builtins.concatStringsSep "\n" (map (r: "${toString r.count} ${r.name}") (builtins.genList (i: builtins.elemAt rows i) n));
  exLines = builtins.concatStringsSep "\n" (map (r:
    "${r.name}=${fin.example.${r.name} or "none"}"
  ) (let n = if builtins.length notRows < 8 then builtins.length notRows else 8; in
     builtins.genList (i: builtins.elemAt notRows i) n));
  yn = b: if b then "yes" else "no";
  text =
    "hostFrontLive=${toString total}\n"
    + "halfFloor=${toString halfFloor}\n"
    + "need=${toString (halfFloor + 1)}\n"
    + "notSource=${toString fin.notSource}\n"
    + "notSourceMoreThanHalf=${yn (more fin.notSource)}\n"
    + "lastSum=${toString (sumOf lastRows)}\n"
    + "notLastSum=${toString (sumOf notRows)}\n"
    + "notLastKinds=${toString (builtins.length notRows)}\n"
    + "largestNotLast=${largest.name}\n"
    + "largestNotLastCount=${toString largest.count}\n"
    + "largestNotLastMoreThanHalf=${yn (more largest.count)}\n"
    + "topLast\n" + (topN 12 lastRows) + "\n"
    + "topNotSourceLast\n" + (topN 12 notRows) + "\n"
    + "examples\n" + exLines + "\n";
in
if sumOf lastRows == total && sumOf notRows == fin.notSource then text
else builtins.throw "tail sum != hostFrontLive"
