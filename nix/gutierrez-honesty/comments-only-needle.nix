# SPDX-License-Identifier: Unlicense
# Gutierrez honesty comments-only C needle. Imports the fixture's
# toyCommentsOnly / toyBlockOnly strings from
# nix/slake-linear-fixture-c/specs.nix and treats them as the C input.
# Occupancy 49. FullHost false. Do not mill. Do not grow smoke C.
# Flake not wired.
#
# ok true would mean comments-only C counted as named allocate/free C.
# That must fail closed (ok false, missing definition / declaration).
{ lib }:
let
  specs = import ../slake-linear-fixture-c/specs.nix;
  inherit (specs)
    fixtureNames toyCommentsOnly toyBlockOnly;

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

  missing = kind: pred: label: text:
    map (n: "${label}: missing C ${kind} ${n}") (
      lib.filter (n: !(pred n (codeLines text))) fixtureNames
    );

  counted = pred: label: text:
    map (n: "${label}: comments-only C counted as ${n}") (
      lib.filter (n: pred n (codeLines text)) fixtureNames
    );

  commentDefMiss = missing "definition" hasDefn "comments-only needle" toyCommentsOnly;
  blockDefMiss = missing "definition" hasDefn "block-comment needle" toyBlockOnly;
  commentDeclMiss = missing "declaration" hasDecl "comments-only needle" toyCommentsOnly;
  commentDefCounted = counted hasDefn "comments-only needle" toyCommentsOnly;
  blockDefCounted = counted hasDefn "block-comment needle" toyBlockOnly;
  commentDeclCounted = counted hasDecl "comments-only needle" toyCommentsOnly;

  # Needle as product input: missing names are the fail-closed report.
  # Counted names mean the stripper treated comments as code.
  inputViolations = commentDefMiss ++ blockDefMiss ++ commentDeclMiss;
  countedViolations = commentDefCounted ++ blockDefCounted ++ commentDeclCounted;
  violations = inputViolations ++ countedViolations;
  # ok true only if comments-only would pass as named C (zero misses).
  # That is the greened lie. Expected false.
  ok = inputViolations == [ ];
  summary =
    if ok then
      "gutierrez-honesty comments-only needle greened (must fail closed)"
    else
      "gutierrez-honesty FAILED comments-only C:\n"
      + lib.concatStringsSep "\n" violations;
in
{
  inherit ok violations summary;
}
