# SPDX-License-Identifier: Unlicense
# Pure Nix histogram of one slake-check walk log.
# Counts are parsed from logPath at eval time. This file does not
# store a walk total. Not wired into flake.nix.
#
#   nix eval --impure --expr 'import ./nix/slake-check-dest-layers { logPath = "/path/to.log"; }'
#
# theoremSurfaceExit0 counts EXIT=0 names that contain the substring
# TheoremSurface. The log has no other shape field. A name that only
# ends in Theorems is other, not TheoremSurface.
{ logPath }:
let
  raw = builtins.readFile logPath;
  chunks = builtins.filter builtins.isString (builtins.split "\n" raw);
  stripCr = s:
    let
      n = builtins.stringLength s;
    in
    if n == 0 then
      s
    else if builtins.substring (n - 1) 1 s == "\r" then
      builtins.substring 0 (n - 1) s
    else
      s;
  lines = map stripCr chunks;

  firstHit = re:
    let
      hit = builtins.filter (l: builtins.match re l != null) lines;
    in
    if hit == [ ] then null else builtins.head hit;

  capture = re: line:
    let
      m = builtins.match re line;
    in
    if m == null then null else builtins.head m;

  shown = v: if v == null then "not sampled" else v;

  asInt = s:
    if builtins.isString s && builtins.match "[0-9]+" s != null then
      builtins.fromJSON s
    else
      s;

  elfLine = firstHit "ELF=(.*)";
  byteLine = firstHit "BYTE_COUNT=(.*)";
  walkLine = firstHit "WALK=([0-9]+)";

  doneLines = builtins.filter (l: builtins.match "WALK_DONE( .*)?" l != null) lines;
  doneLine =
    if doneLines == [ ] then null
    else builtins.elemAt doneLines (builtins.length doneLines - 1);

  kvFields = line:
    let
      parts = builtins.filter (p: builtins.isString p && p != "") (builtins.split " " line);
      one = p:
        let
          m = builtins.match "([A-Za-z0-9_]+)=(.*)" p;
        in
        if m == null then null else {
          name = builtins.elemAt m 0;
          value = builtins.elemAt m 1;
        };
      pairs = builtins.filter (x: x != null) (map one parts);
      get = n:
        let
          hs = builtins.filter (p: p.name == n) pairs;
        in
        if hs == [ ] then "not sampled" else (builtins.head hs).value;
    in
    {
      names = get "names";
      pass = get "pass";
      fail = get "fail";
    };

  done =
    if doneLine == null then
      { names = "not sampled"; pass = "not sampled"; fail = "not sampled"; }
    else
      kvFields doneLine;

  fin = import ./tally.nix lines;
in
{
  logPath = logPath;
  elf = shown (if elfLine == null then null else capture "ELF=(.*)" elfLine);
  byteCount = asInt (shown (if byteLine == null then null else capture "BYTE_COUNT=(.*)" byteLine));
  walk = asInt (shown (if walkLine == null then null else capture "WALK=([0-9]+)" walkLine));
  walkDoneLine = if doneLine == null then "not sampled" else doneLine;
  walkDoneNames = asInt done.names;
  walkDonePass = asInt done.pass;
  walkDoneFail = asInt done.fail;
  exit0 = fin.exit0;
  exit1 = fin.exit1;
  exitOther = fin.exitOther;
  lineBeforeExit = fin.lineBeforeExit;
  layer = fin.layer;
  theoremSurfaceExit0 = fin.theoremSurfaceExit0;
  otherExit0 = fin.otherExit0;
}
