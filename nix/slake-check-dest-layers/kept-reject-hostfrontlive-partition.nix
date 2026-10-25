# SPDX-License-Identifier: Unlicense
# Partition kept-reject names that start with SystemsLean.HostFrontLive.
# Counts come from logPath via builtins.readFile. This file does not
# store a walk total. Not wired into flake.nix.
#
# Kept-reject selection matches kept-reject-name-groups.nix.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept
# reject only when the pending layer line is exactly "kept reject".
#
# Set: that NAME starts with SystemsLean.HostFrontLive.
# Stem: the next camel piece (one capital, then lowercase). No such
# piece is other. Second piece: the next camel piece, or end, or tail.
# Suffix: TheoremsSource, MainSource, Source, or other, from the end.
# The log does not name a parser. path is lines are counted only while
# a HostFrontLive false-for is open.
#
#   nix eval --impure --raw --expr 'import ./nix/slake-check-dest-layers/kept-reject-hostfrontlive-partition.nix { logPath = "/path/to.log"; }'
{ logPath }:
let
  raw = builtins.readFile logPath;
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
      isFalse = builtins.match "slake-check checker returned false for (.*)" line;
      isTrue = builtins.match "(slake-check checker returned true) for .*" line;
      isExit = builtins.match "EXIT=([0-9]+) NAME=(.*)" line;
      isPath = builtins.match "path is (.*)" line;
    in
    if line == "" then st
    else if isBanner then st // { expectLayer = false; pending = null; watchPath = false; }
    else if isExit != null then
      let
        kept = builtins.elemAt isExit 0 == "1" && st.pending == "kept reject";
        name = builtins.elemAt isExit 1;
        restM = builtins.match "SystemsLean\\.HostFrontLive(.*)" name;
        inSet = kept && restM != null;
        p = pieces (if restM == null then "" else builtins.head restM);
        prevN = st.names.${name} or 0;
        nextN = prevN + 1;
      in st // {
        expectLayer = false; pending = null; watchPath = false;
        total = st.total + (if inSet then 1 else 0);
        stems = if inSet then bump st.stems p.stem else st.stems;
        pairs = if inSet then bump st.pairs "${p.stem}/${p.second}" else st.pairs;
        suffixes = if inSet then bump st.suffixes (suffixOf name) else st.suffixes;
        crosses = if inSet then bump st.crosses "${suffixOf name}/${p.stem}" else st.crosses;
        names = if inSet then st.names // { ${name} = nextN; } else st.names;
        maxNameCount = if inSet && nextN > st.maxNameCount then nextN else st.maxNameCount;
        maxName = if inSet && nextN > st.maxNameCount then name else st.maxName;
        stemExample =
          if inSet && !(st.stemExample ? ${p.stem})
          then st.stemExample // { ${p.stem} = name; }
          else st.stemExample;
      }
    else if isFalse != null then
      st // {
        expectLayer = true;
        watchPath = builtins.match "SystemsLean\\.HostFrontLive.*" (builtins.head isFalse) != null;
      }
    else if st.expectLayer then st // { expectLayer = false; pending = line; }
    else if isPath != null && st.watchPath && st.pending == "kept reject" then
      st // { paths = bump st.paths (builtins.head isPath); }
    else if isTrue != null then st // { pending = builtins.head isTrue; }
    else st;
  empty = {
    expectLayer = false; pending = null; watchPath = false;
    total = 0; stems = { }; pairs = { }; suffixes = { }; crosses = { };
    paths = { }; names = { }; maxNameCount = 0; maxName = "none"; stemExample = { };
  };
  fin = builtins.foldl' step empty lines;
  rowsOf = groups:
    let names = builtins.attrNames groups; rows = map (n: { name = n; count = groups.${n}; }) names; in
    builtins.sort (a: b: if a.count != b.count then a.count > b.count else a.name < b.name) rows;
  stemRows = rowsOf fin.stems;
  sufRows = rowsOf fin.suffixes;
  total = fin.total;
  sumOf = rows: builtins.foldl' (s: r: s + r.count) 0 rows;
  halfFloor = builtins.div total 2;
  more = c: c > halfFloor;
  headRow = rows: if rows == [ ] then { name = "none"; count = 0; } else builtins.head rows;
  under = prefix: rows:
    let n = builtins.stringLength prefix; in
    builtins.filter (r: builtins.substring 0 n r.name == prefix) rows;
  topN = k: rows:
    let n = if builtins.length rows < k then builtins.length rows else k; in
    builtins.concatStringsSep "\n" (map (r: "${toString r.count} ${r.name}") (builtins.genList (i: builtins.elemAt rows i) n));
  largest = headRow stemRows;
  largestSecond = headRow (under "${largest.name}/" (rowsOf fin.pairs));
  largestSuf = headRow sufRows;
  largestCross = headRow (under "${largestSuf.name}/" (rowsOf fin.crosses));
  yn = b: if b then "yes" else "no";
  text =
    "hostFrontLive=${toString total}\n"
    + "halfFloor=${toString halfFloor}\n"
    + "need=${toString (halfFloor + 1)}\n"
    + "distinctNames=${toString (builtins.length (builtins.attrNames fin.names))}\n"
    + "maxNameCount=${toString fin.maxNameCount}\n"
    + "maxName=${fin.maxName}\n"
    + "stemSum=${toString (sumOf stemRows)}\n"
    + "stemKinds=${toString (builtins.length stemRows)}\n"
    + "largestStem=${largest.name}\n"
    + "largestStemCount=${toString largest.count}\n"
    + "largestStemMoreThanHalf=${yn (more largest.count)}\n"
    + "largestStemExample=${fin.stemExample.${largest.name} or "none"}\n"
    + "largestSecond=${largestSecond.name}\n"
    + "largestSecondCount=${toString largestSecond.count}\n"
    + "largestSecondMoreThanHalf=${yn (more largestSecond.count)}\n"
    + "largestSuffix=${largestSuf.name}\n"
    + "largestSuffixCount=${toString largestSuf.count}\n"
    + "largestSuffixMoreThanHalf=${yn (more largestSuf.count)}\n"
    + "largestSuffixStem=${largestCross.name}\n"
    + "largestSuffixStemCount=${toString largestCross.count}\n"
    + "largestSuffixStemMoreThanHalf=${yn (more largestCross.count)}\n"
    + "pathKinds=${toString (builtins.length (builtins.attrNames fin.paths))}\n"
    + "topPaths\n" + (topN 4 (rowsOf fin.paths)) + "\n"
    + "topStems\n" + (topN 20 stemRows) + "\n"
    + "topSeconds\n" + (topN 12 (under "${largest.name}/" (rowsOf fin.pairs))) + "\n"
    + "topSuffixes\n" + (topN 8 sufRows) + "\n";
in
if sumOf stemRows == total && sumOf sufRows == total then text
else builtins.throw "partition sum != hostFrontLive ${toString total}"
