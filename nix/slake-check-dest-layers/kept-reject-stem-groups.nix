# SPDX-License-Identifier: Unlicense
# Groups kept-reject EXIT=1 names from one slake-check walk log by
# the leading camel-case stem. Counts come from logPath via
# builtins.readFile. This file does not store a walk total.
# Not wired into flake.nix.
#
# Kept-reject selection matches kept-reject-name-groups.nix.
# The reject layer is the next non-empty line after
# "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept
# reject only when the pending layer line is exactly "kept reject".
#
# Stem rule: strip the SystemsLean. prefix. The stem is the first
# capital letter plus the following lowercase letters, then stop.
# A character that is not a lowercase letter ends the stem (the next
# capital, a digit, a dot, or an underscore). HostFrontLiveFoo is
# Host. CompilePathLinear is Compile. CompilerSpec.Mutual is
# Compiler. If the identifier does not start with one capital letter,
# count it in the bucket named other. Do not drop it.
#
#   nix eval --impure --raw --expr 'import ./nix/slake-check-dest-layers/kept-reject-stem-groups.nix { logPath = "/path/to.log"; }'
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

  stemOf = name:
    let
      restM = builtins.match "SystemsLean\\.(.*)" name;
      ident = if restM == null then name else builtins.head restM;
      hit = builtins.match "([A-Z][a-z]*).*" ident;
    in
    if hit == null then "other" else builtins.head hit;

  bump = acc: key: acc // { ${key} = (acc.${key} or 0) + 1; };

  step = st: line:
    let
      isBanner = builtins.match "===.*" line != null;
      isFalse = builtins.match "slake-check checker returned false for .*" line != null;
      isTrue = builtins.match "(slake-check checker returned true) for .*" line;
      isExit = builtins.match "EXIT=([0-9]+) NAME=(.*)" line;
    in
    if line == "" then st
    else if isBanner then
      st // { expectLayer = false; pending = null; }
    else if isExit != null then
      let
        code = builtins.elemAt isExit 0;
        name = builtins.elemAt isExit 1;
        kept = code == "1" && st.pending == "kept reject";
        stem = stemOf name;
        groups = if kept then bump st.groups stem else st.groups;
        total = st.total + (if kept then 1 else 0);
        otherExample =
          if kept && stem == "other" && st.otherExample == null then name
          else st.otherExample;
      in
      st // {
        expectLayer = false;
        pending = null;
        groups = groups;
        total = total;
        otherExample = otherExample;
      }
    else if isFalse then
      st // { expectLayer = true; }
    else if st.expectLayer then
      st // { expectLayer = false; pending = line; }
    else if isTrue != null then
      st // { pending = builtins.head isTrue; }
    else
      st;

  empty = {
    expectLayer = false;
    pending = null;
    groups = { };
    total = 0;
    otherExample = null;
  };

  fin = builtins.foldl' step empty lines;
  groups = fin.groups;
  total = fin.total;
  names = builtins.attrNames groups;
  rows = map (n: { name = n; count = groups.${n}; }) names;
  sorted = builtins.sort (a: b:
    if a.count != b.count then a.count > b.count else a.name < b.name
  ) rows;
  sum = builtins.foldl' (s: r: s + r.count) 0 sorted;
  nTop = if builtins.length sorted < 15 then builtins.length sorted else 15;
  top = builtins.genList (i: builtins.elemAt sorted i) nTop;
  largest = if sorted == [ ] then { name = "none"; count = 0; } else builtins.head sorted;
  moreThanHalf = largest.count * 2 > total;
  otherShown = if fin.otherExample == null then "none" else fin.otherExample;
  otherCount = groups.other or 0;
  body = builtins.concatStringsSep "\n" (map (r: "${toString r.count} ${r.name}") top);
  text =
    "keptReject=${toString total}\n"
    + "stemSum=${toString sum}\n"
    + "otherCount=${toString otherCount}\n"
    + "otherExample=${otherShown}\n"
    + "largest=${largest.name}\n"
    + "largestCount=${toString largest.count}\n"
    + "strictlyMoreThanHalf=${if moreThanHalf then "yes" else "no"}\n"
    + "top15\n"
    + body
    + "\n";
in
if sum == total then text
else builtins.throw "stem sum ${toString sum} != keptReject ${toString total}"
