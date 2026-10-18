# SPDX-License-Identifier: Unlicense
# Pure Nix: fail closed when novel Systems Lean calls String.drop / .drop n
# and uses that Slice with trim, toList, or splitOn without .copy.
# Lean 4.35.0 String.drop returns String.Slice. Proven fix is .copy.
# Does not chase String.mk. Does not scan ref/, skills/, .lake/.
# Occupancy 49. FullHost false. Not wired into flake.nix this slice (HITL).
#
#   import ./lean-string-slice-copy { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
#
# Live impure eval (flake checks see only git-tracked paths):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/lean-string-slice-copy { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs) walkRels skipDirs listDropSuffixes listDropExact methods;
  has = import ../string-contains.nix;
  isIdent = c: c != "" && builtins.match "[A-Za-z0-9_]" c != null;
  firstIdx = needle: hay:
    if needle == "" || !(has needle hay) then null
    else builtins.stringLength (builtins.head (lib.splitString "\n" (builtins.replaceStrings [ needle ] [ "\n" ] hay)));
  findTok = tok: hay:
    let
      tlen = builtins.stringLength tok;
      go = s: off:
        let i = firstIdx tok s;
        in if i == null then null
        else if isIdent (builtins.substring (i + tlen) 1 s) then
          let skip = i + tlen;
          in go (builtins.substring skip (builtins.stringLength s - skip) s) (off + skip)
        else off + i;
    in go hay 0;
  isListDrop = pre: lib.any (s: lib.hasSuffix s pre) listDropSuffixes || lib.elem pre listDropExact;
  stripComment = line: builtins.head (lib.splitString "--" line);
  interesting = code: has ".drop" code && (has "trim" code || has "toList" code || has "splitOn" code);
  cutSemi = s: let i = firstIdx ";" s; in if i == null then s else builtins.substring 0 i s;
  firstHit = suffix: lib.foldl (best: m:
    let i = findTok m.tok suffix;
    in if i == null then best else if best == null || i < best.idx then { inherit (m) kind; idx = i; } else best
  ) null methods;
  wrapBad = pre:
    let p = " " + pre;
    in builtins.match ".*[^A-Za-z0-9_]trim *\\(.*" p != null
    || builtins.match ".*[^A-Za-z0-9_]toList *\\(.*" p != null
    || builtins.match ".*[^A-Za-z0-9_]splitOn[^.(]*\\(.*" p != null;
  hasToString = pre: has "Slice.toString" pre || has "toString (" pre || has "toString(" pre;
  checkSite = rel: n: code: abs:
    let
      pre = builtins.substring 0 abs code;
      suffix = cutSemi (builtins.substring (abs + 5) (builtins.stringLength code - (abs + 5)) code);
      hit = firstHit suffix;
    in if isListDrop pre then [ ]
    else if hit != null && hit.kind == "copy" then [ ]
    else if hit != null && hit.kind == "bad" then
      [ "${rel}:${toString n}: String.drop/Slice used with trim|toList|splitOn without .copy" ]
    else if wrapBad pre && !(hasToString pre) then
      [ "${rel}:${toString n}: String.drop/Slice passed to trim|toList|splitOn without .copy" ]
    else [ ];
  dropSites = code:
    let
      go = s: off: acc:
        let i = findTok ".drop" s;
        in if i == null then acc
        else let skip = i + 5;
          in go (builtins.substring skip (builtins.stringLength s - skip) s) (off + skip) (acc ++ [ (off + i) ]);
    in go code 0 [ ];
  checkLine = rel: n: line:
    let code = stripComment line;
    in if !(interesting code) then [ ] else lib.concatMap (checkSite rel n code) (dropSites code);
  collectLeans = dir: rel:
    let entries = builtins.readDir dir;
    in lib.concatMap (name:
      let
        typ = entries.${name};
        childRel = if rel == "" then name else "${rel}/${name}";
        childPath = dir + "/${name}";
      in if typ == "directory" then
        if lib.elem name skipDirs then [ ] else collectLeans childPath childRel
      else if typ == "regular" && lib.hasSuffix ".lean" name then [ { path = childPath; rel = childRel; } ]
      else [ ]
    ) (builtins.attrNames entries);
  files = lib.concatMap (w:
    let p = root + "/${w}";
    in if builtins.pathExists p then collectLeans p w else [ ]
  ) walkRels;
  checkFile = { path, rel }:
    lib.concatLists (lib.imap1 (n: line: checkLine rel n line) (lib.splitString "\n" (builtins.readFile path)));
  violations = lib.concatMap checkFile files;
  ok = violations == [ ];
  shown = lib.take 40 violations;
  more = let n = builtins.length violations; in if n > 40 then "\n... and ${toString (n - 40)} more" else "";
  summary = if ok then
    "lean-string-slice-copy OK (${toString (builtins.length files)} lean files; String.drop/.drop then trim|toList|splitOn requires .copy; occupancy 49; FullHost false)"
  else "lean-string-slice-copy FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in { inherit ok violations summary files; }
