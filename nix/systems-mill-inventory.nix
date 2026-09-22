# SPDX-License-Identifier: Unlicense
# Pure Nix mill inventory fence: lakefile lean_exe count, later-host-tools
# mill-69 recipe tokens, helper tokens. Presence only. Does not mill.
# Does not rewrite just N-host-tool compile. Does not read dest ELFs.
# Living fence is 69 of 69. Occupancy stays 49. FullHost stays false.
# Does not claim Lake-gone. Does not fold into systems-host-presence.
#
#   import ./systems-mill-inventory.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, expectedLeanExe, leanExeCount }
{ lib, root }:
let
  lakeRel = "src/systems/lakefile.lean";
  laterRel = "just/later-host-tools.just";
  helperRel = "just/first-host-tool.just";
  inventoryRel = "src/systems/host-tools-inventory.md";
  expectedLeanExe = 69;
  leanExeMarker = "lean_exe \"";

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;
  has = import ./string-contains.nix;

  missingFile = rel: if exists rel then [ ] else [ "missing file: ${rel}" ];

  tokenMiss =
    rel: content: tokens:
    if content == null then
      [ ]
    else
      lib.concatMap (
        t: if has t content then [ ] else [ "${rel}: missing token ${t}" ]
      ) tokens;

  lakeContent = readRel lakeRel;
  laterContent = readRel laterRel;
  helperContent = readRel helperRel;
  inventoryContent = readRel inventoryRel;

  leanExeCount =
    if lakeContent == null then
      0
    else
      builtins.length (lib.splitString leanExeMarker lakeContent) - 1;

  countViolations =
    if lakeContent == null then
      [ ]
    else if leanExeCount == expectedLeanExe then
      [ ]
    else
      [
        "${lakeRel}: lean_exe quoted rows ${toString leanExeCount} != fence ${toString expectedLeanExe}"
      ];

  lakeTokens = [
    "slake-freestanding-self-host-complete"
    "slake-host-module-check"
    "slake-mult-fs-write"
    "SelfHostCompleteMain"
  ];

  laterTokens = [
    "sixty-ninth-host-tool"
    "sixty-eighth-host-tool"
    "sixty-seventh-host-tool"
    "69 of 69"
    "Do not mill mill 69"
    "slake-freestanding-self-host-complete"
    "SelfHostComplete"
    "_compile-inventory-exe"
    "Never lake"
  ];

  helperTokens = [
    "_compile-inventory-exe"
    "log_run lean"
    "log_run leanc"
    "Never lake"
    "69 of 69"
    "Do not mill mill 69"
    "build/first-host-tool"
  ];

  inventoryTokens = [
    "69 of 69"
    "just sixty-ninth-host-tool"
    "slake-freestanding-self-host-complete"
    "Do not mill mill 69"
    "SelfHostComplete"
  ];

  violations =
    missingFile lakeRel
    ++ missingFile laterRel
    ++ missingFile helperRel
    ++ missingFile inventoryRel
    ++ countViolations
    ++ tokenMiss lakeRel lakeContent lakeTokens
    ++ tokenMiss laterRel laterContent laterTokens
    ++ tokenMiss helperRel helperContent helperTokens
    ++ tokenMiss inventoryRel inventoryContent inventoryTokens;

  ok = violations == [ ];
  summary =
    if ok then
      "systems-mill-inventory OK (lean_exe=${toString leanExeCount} of ${toString expectedLeanExe}; mill 69 recipe present; not remill; occupancy 49)"
    else
      "systems-mill-inventory FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    expectedLeanExe
    leanExeCount
    lakeRel
    laterRel
    helperRel
    inventoryRel
    ;
}
