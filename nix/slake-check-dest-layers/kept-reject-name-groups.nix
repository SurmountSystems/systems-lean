# SPDX-License-Identifier: Unlicense
# Groups kept-reject EXIT=1 names from one slake-check walk log.
# Counts are parsed from logPath via builtins.readFile. This file does
# not store a walk total. Not wired into flake.nix.
#
# Prefix rule:
# Take the NAME value from an EXIT=1 line that the existing dest-layers
# classifier calls kept reject.
# If the NAME starts with SystemsLean. and contains another dot after
# that prefix, the group key is the segment between SystemsLean. and
# the next dot.
# If the NAME starts with SystemsLean. and has no further dot, the
# group key is the full NAME (the whole string).
# If the NAME does not start with SystemsLean., the group key is the
# full NAME.
# SystemsLean.Foo.Bar groups as Foo.
# SystemsLean.SurfaceMatrixTheorems groups as
# SystemsLean.SurfaceMatrixTheorems (no second dot).
# Other.Foo.Bar groups as Other.Foo.Bar.
#
# Kept-reject rule, copied from nix/slake-check-dest-layers/tally.nix.
# tally.nix returns layer counts, not names, so this file re-implements
# the same transitions. The reject layer is the next non-empty line
# after "slake-check checker returned false for <name>". A banner line
# matching === clears that pending layer. An EXIT=1 line is kept reject
# only when the pending layer line is exactly "kept reject".
#
#   nix eval --impure --raw --expr 'import ./nix/slake-check-dest-layers/kept-reject-name-groups.nix { logPath = "/path/to.log"; }'
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

  groupOf = name:
    let
      restM = builtins.match "SystemsLean\\.(.*)" name;
    in
    if restM == null then name
    else
      let
        seg = builtins.match "([^.]+)\\..*" (builtins.head restM);
      in
      if seg == null then name else builtins.head seg;

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
        groups = if kept then bump st.groups (groupOf name) else st.groups;
        total = st.total + (if kept then 1 else 0);
      in
      st // {
        expectLayer = false;
        pending = null;
        groups = groups;
        total = total;
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
  body = builtins.concatStringsSep "\n" (map (r: "${toString r.count} ${r.name}") sorted);
  text = "keptReject=${toString total}\ngroupSum=${toString sum}\n${body}\n";
in
if sum == total then text
else builtins.throw "group sum ${toString sum} != keptReject ${toString total}"
