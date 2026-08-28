# SPDX-License-Identifier: Unlicense
# Dynamic unit walk: *.lean / *.slake under unitWalkRoot for systems-emit-wire.
# Cold eval only; hostPin family scanners stay in default.nix.
# No bash, no ripgrep, no Python.
{
  lib,
  root,
  readRel,
  has,
  unitWalkRoot,
  unitWalkSkipDirs,
  unitWalkExtensions,
  unitSurfaceRequiredAny,
  unitSurfaceNotEmitAny,
  unitSurfaceModuleAny,
}:
rec {
  hasExt =
    name: lib.any (ext: lib.hasSuffix ext name) unitWalkExtensions;

  # Recurse; return list of relative paths from repo root.
  # unitWalkSkipDirs (.lake, .git, ...) from specs -- avoid Lake build noise.
  walkUnits =
    rel:
    let
      abs = root + "/${rel}";
    in
    if !(builtins.pathExists abs) then
      [ ]
    else
      let
        entries = builtins.readDir abs;
      in
      lib.concatMap (
        name:
        let
          ty = entries.${name};
          child = "${rel}/${name}";
        in
        if ty == "directory" then
          if lib.elem name unitWalkSkipDirs then
            [ ]
          else
            walkUnits child
        else if ty == "regular" && hasExt name then
          [ child ]
        else
          [ ]
      ) (builtins.attrNames entries);

  unitPaths = walkUnits unitWalkRoot;

  unitFileViolations = lib.concatMap (
    rel:
    let
      content = readRel rel;
      hasUs = content != null && has "UNIT_SURFACE" content;
      hasSk = content != null && has "SKELETON" content;
    in
    if content == null then
      [ "unit walk: unreadable ${rel}" ]
    else if !hasUs && !hasSk then
      [ "${rel}: missing SKELETON or UNIT_SURFACE honesty marker" ]
    else if hasUs then
      (if lib.any (t: has t content) unitSurfaceModuleAny then
        [ ]
      else
        [ "${rel}: UNIT_SURFACE missing module/namespace name" ])
      ++ (
        if lib.any (t: has t content) unitSurfaceNotEmitAny then
          [ ]
        else
          [
            "${rel}: UNIT_SURFACE missing not-emit honesty (Not freestanding emit | not freestanding C)"
          ]
      )
      ++ (
        if lib.any (t: has t content) unitSurfaceRequiredAny then
          [ ]
        else
          [
            "${rel}: UNIT_SURFACE missing IR contract id (MULT-* / JOIN-ALG / erasure / extract / ...)"
          ]
      )
    else
      [ ]
  ) unitPaths;

  unitSurfaceCount = lib.length (
    lib.filter (
      rel:
      let
        c = readRel rel;
      in
      c != null && has "UNIT_SURFACE" c
    ) unitPaths
  );

  unitCountViolations =
    if unitPaths == [ ] then
      [ ]
    else if unitSurfaceCount == 0 then
      [ "unit walk: at least one UNIT_SURFACE freestanding unit required (beyond pure SKELETON)" ]
    else
      [ ];
}
