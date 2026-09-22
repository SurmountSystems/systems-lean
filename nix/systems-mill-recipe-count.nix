# SPDX-License-Identifier: Unlicense
# Pure Nix mill recipe-name fence: count living *-host-tool recipe
# definitions in just/first-host-tool.just plus just/later-host-tools.just.
# Presence only. Does not mill. Does not rewrite just N-host-tool compile.
# Does not count lakefile lean_exe rows (that is systems-mill-inventory).
# Does not count helper recipes that are not *-host-tool.
# Living mill fence is 69 of 69. Occupancy stays 49. FullHost stays false.
# Does not claim Lake-gone. Does not fold into systems-host-presence.
# Sibling of systems-mill-inventory (lean_exe count), not a clone.
#
#   import ./systems-mill-recipe-count.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, expectedCount, recipeCount, firstCount, laterCount }
{ lib, root }:
let
  firstRel = "just/first-host-tool.just";
  laterRel = "just/later-host-tools.just";
  expectedCount = 69;

  exists = rel: builtins.pathExists (root + "/${rel}");

  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;

  # Column-0 just recipe whose name ends in -host-tool. Comments, echoes,
  # and helpers such as _compile-inventory-exe do not match.
  recipeName =
    line:
    let
      m = builtins.match "([a-z0-9-]+-host-tool):.*" line;
    in
    if m == null then null else builtins.head m;

  namesFrom =
    content:
    if content == null then
      [ ]
    else
      lib.filter (n: n != null) (
        map recipeName (lib.splitString "\n" content)
      );

  firstContent = readRel firstRel;
  laterContent = readRel laterRel;
  firstNames = namesFrom firstContent;
  laterNames = namesFrom laterContent;
  allNames = firstNames ++ laterNames;
  firstCount = builtins.length firstNames;
  laterCount = builtins.length laterNames;
  recipeCount = builtins.length allNames;
  uniqueCount = builtins.length (lib.unique allNames);

  missingFirst =
    if firstContent == null then [ "missing file: ${firstRel}" ] else [ ];
  missingLater =
    if laterContent == null then [ "missing file: ${laterRel}" ] else [ ];

  countViolations =
    if firstContent == null || laterContent == null then
      [ ]
    else if recipeCount == expectedCount then
      [ ]
    else
      [
        "${firstRel} + ${laterRel}: living *-host-tool recipes ${toString recipeCount} != fence ${toString expectedCount} (first=${toString firstCount}; later=${toString laterCount})"
      ];

  uniqueViolations =
    if firstContent == null || laterContent == null then
      [ ]
    else if uniqueCount == recipeCount then
      [ ]
    else
      [
        "${firstRel} + ${laterRel}: duplicate *-host-tool recipe names (unique=${toString uniqueCount}; definitions=${toString recipeCount})"
      ];

  violations =
    missingFirst ++ missingLater ++ countViolations ++ uniqueViolations;

  ok = violations == [ ];
  summary =
    if ok then
      "systems-mill-recipe-count OK (living *-host-tool recipes=${toString recipeCount}; first=${toString firstCount}; later=${toString laterCount}; mill 69 of 69; not remill; occupancy 49)"
    else
      "systems-mill-recipe-count FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    firstRel
    laterRel
    expectedCount
    recipeCount
    firstCount
    laterCount
    uniqueCount
    ;
}
