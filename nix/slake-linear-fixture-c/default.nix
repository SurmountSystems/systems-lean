# SPDX-License-Identifier: Unlicense
# Pure Nix: fail closed when the four named linear fixture C functions
# exist only as comments (or are missing) on the product wire.
# Definitions in .c, declarations in .h. Occupancy 49. FullHost false.
# Not wired into flake.nix this slice (HITL). Do not mill. Do not regenerate.
#
#   import ./slake-linear-fixture-c { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
#
# Live impure eval (flake checks see only git-tracked paths):
#   nix eval --impure --raw --expr 'let lib = (import (builtins.getFlake "nixpkgs") {}).lib;
#     root = ./.; g = import ./nix/slake-linear-fixture-c { inherit lib root; };
#     in if g.ok then g.summary + "\n" else throw g.summary'
{ lib, root }:
let
  specs = import ./specs.nix;
  inherit (specs)
    fixtureNames defineRels declareRels
    toyCommentsOnly toyBlockOnly toyDefine toyDeclare;

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

  reDefn = name: "^[[:space:]]*int[[:space:]]+${name}[[:space:]]*\\(.*";
  reDecl = name: "^[[:space:]]*int[[:space:]]+${name}[[:space:]]*\\(.*\\);[[:space:]]*";
  isDecl = name: line: builtins.match (reDecl name) line != null;
  isDefn = name: line: builtins.match (reDefn name) line != null && !(isDecl name line);
  hasDefn = name: lines: lib.any (isDefn name) lines;
  hasDecl = name: lines: lib.any (isDecl name) lines;
  found = pred: names: lines: lib.filter (n: pred n lines) names;

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel = rel: if exists rel then builtins.readFile (root + "/${rel}") else null;

  fileMsgs = kind: pred: rel:
    let content = readRel rel;
    in if content == null then [ "missing file: ${rel}" ]
    else
      map (n: "${rel}: missing C ${kind} ${n}") (
        lib.filter (n: !(pred n (codeLines content))) fixtureNames
      );

  defineMsgs = lib.concatMap (fileMsgs "definition" hasDefn) defineRels;
  declareMsgs = lib.concatMap (fileMsgs "declaration" hasDecl) declareRels;

  selfMsgs =
    let
      cOnly = codeLines toyCommentsOnly;
      cBlock = codeLines toyBlockOnly;
      cGood = codeLines toyDefine;
      hGood = codeLines toyDeclare;
      miss = cond: msg: if cond then [ ] else [ msg ];
    in
    miss (found hasDefn fixtureNames cOnly == [ ])
      "self-check: comments-only must not count as definitions"
    ++ miss (found hasDefn fixtureNames cBlock == [ ])
      "self-check: block-comment names must not count as definitions"
    ++ miss (found hasDecl fixtureNames cOnly == [ ])
      "self-check: comments-only must not count as declarations"
    ++ miss (found hasDefn fixtureNames cGood == fixtureNames)
      "self-check: toy definitions must find all four names"
    ++ miss (found hasDecl fixtureNames hGood == fixtureNames)
      "self-check: toy declarations must find all four names";

  violations = defineMsgs ++ declareMsgs ++ selfMsgs;
  ok = violations == [ ];
  summary = if ok then
    "slake-linear-fixture-c OK (4 named linear fixture functions defined in .c and declared in .h; comments-only fails; occupancy 49; FullHost false)"
  else
    "slake-linear-fixture-c FAILED:\n" + lib.concatStringsSep "\n" violations;
in { inherit ok violations summary fixtureNames; }
