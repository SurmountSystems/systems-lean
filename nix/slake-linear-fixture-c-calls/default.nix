# SPDX-License-Identifier: Unlicense
# Pure Nix: fail closed when the four named linear fixture C functions
# exist only as comments (or only as defs) and are not called.
# Product .c call sites. Occupancy 49. FullHost false.
# Not wired into flake.nix this slice (HITL). Do not mill. Do not regenerate.
# Does not weaken nix/slake-linear-fixture-c (defs). Joins sibling violations.
#
#   import ./slake-linear-fixture-c-calls { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
#
# Live impure eval (flake checks see only git-tracked paths):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/slake-linear-fixture-c-calls { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
{ lib, root }:
let
  specs = import ./specs.nix;
  fixture = import ../slake-linear-fixture-c { inherit lib root; };
  inherit (specs)
    fixtureNames callRels
    toyCommentsOnly toyBlockOnly toyDefsOnly toyCalls;

  idxOf = needle: s:
    let parts = lib.splitString needle s;
    in if builtins.length parts < 2 then null else builtins.stringLength (builtins.head parts);

  stripLine = inBlock: line:
    if inBlock then
      let i = idxOf "*/" line;
      in if i == null then { code = ""; inBlock = true; }
      else stripLine false (builtins.substring (i + 2) (builtins.stringLength line - i - 2) line)
    else
      let
        iLine = idxOf "//" line;
        iBlock = idxOf "/*" line;
        lineFirst = iLine != null && (iBlock == null || iLine < iBlock);
        blockFirst = iBlock != null && (iLine == null || iBlock < iLine);
      in
      if lineFirst then { code = builtins.substring 0 iLine line; inBlock = false; }
      else if blockFirst then
        let
          pre = builtins.substring 0 iBlock line;
          after = builtins.substring (iBlock + 2) (builtins.stringLength line - iBlock - 2) line;
          inner = stripLine true after;
        in { code = pre + inner.code; inBlock = inner.inBlock; }
      else { code = line; inBlock = false; };

  codeLines = text:
    let
      walk = inBlock: xs:
        if xs == [ ] then [ ]
        else
          let
            line = lib.removeSuffix "\r" (builtins.head xs);
            r = stripLine inBlock line;
          in [ r.code ] ++ walk r.inBlock (lib.drop 1 xs);
    in walk false (lib.splitString "\n" text);

  reDefnOrDecl = name: "^[[:space:]]*int[[:space:]]+${name}[[:space:]]*\\(.*";
  reCall = name: ".*${name}[[:space:]]*\\(.*";
  isDefnOrDecl = name: line: builtins.match (reDefnOrDecl name) line != null;
  isCall = name: line:
    builtins.match (reCall name) line != null && !(isDefnOrDecl name line);
  hasCall = name: lines: lib.any (isCall name) lines;
  found = pred: names: lines: lib.filter (n: pred n lines) names;

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel = rel: if exists rel then builtins.readFile (root + "/${rel}") else null;

  fileMsgs = rel:
    let content = readRel rel;
    in if content == null then [ "missing file: ${rel}" ]
    else
      map (n: "${rel}: missing C call site ${n}") (
        lib.filter (n: !(hasCall n (codeLines content))) fixtureNames
      );

  callMsgs = lib.concatMap fileMsgs callRels;

  selfMsgs =
    let
      cOnly = codeLines toyCommentsOnly;
      cBlock = codeLines toyBlockOnly;
      cDefs = codeLines toyDefsOnly;
      cGood = codeLines toyCalls;
      miss = cond: msg: if cond then [ ] else [ msg ];
    in
    miss (found hasCall fixtureNames cOnly == [ ])
      "self-check: comments-only must not count as calls"
    ++ miss (found hasCall fixtureNames cBlock == [ ])
      "self-check: block-comment names must not count as calls"
    ++ miss (found hasCall fixtureNames cDefs == [ ])
      "self-check: definitions-only must not count as calls"
    ++ miss (found hasCall fixtureNames cGood == fixtureNames)
      "self-check: toy calls must find all four names";

  violations = fixture.violations ++ callMsgs ++ selfMsgs;
  ok = violations == [ ];
  summary = if ok then
    "slake-linear-fixture-c-calls OK (4 named linear fixture functions defined and called in product C; comments-only fails; defs-without-calls fails; occupancy 49; FullHost false)"
  else
    "slake-linear-fixture-c-calls FAILED:\n" + lib.concatStringsSep "\n" violations;
in { inherit ok violations summary fixtureNames; }
