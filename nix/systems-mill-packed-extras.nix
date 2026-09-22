# SPDX-License-Identifier: Unlicense
# Pure Nix mill packed-extras fence: mill 66 packed 34 extras on the
# sixty-sixth-host-tool helper line, mill 68 packed 16 extras on the
# sixty-eighth-host-tool helper line, mill 69 packed 0 extras on the
# sixty-ninth-host-tool helper line. Presence only. Does not mill.
# Does not rewrite just N-host-tool compile. Does not read dest ELFs.
# Living mill fence is 69 of 69. Occupancy stays 49. FullHost stays false.
# Does not claim Lake-gone. Does not fold into systems-host-presence.
# Sibling of systems-mill-extras-fit (mill 67 extras-file), not a clone.
#
#   import ./systems-mill-packed-extras.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, mill66ExtrasCount, mill68ExtrasCount, mill69ExtrasCount }
{ lib, root }:
let
  laterRel = "just/later-host-tools.just";
  millJustLineMax = 2048;
  mill66ExpectedCount = 34;
  mill68ExpectedCount = 16;
  mill69ExpectedCount = 0;
  mill66Inventory = "slake-write-freestanding-hc";
  mill66Body = "ProductPathWriteHc";
  mill66Log = "command-write-freestanding-hc.log";
  mill68Inventory = "slake-mult-fs-write";
  mill68Body = "MultFsWrite";
  mill68Log = "command-mult-fs-write.log";
  mill69Inventory = "slake-freestanding-self-host-complete";
  mill69Body = "SelfHostComplete";
  mill69Log = "command-self-host-complete.log";
  mill66ExpectedExtras = [
    "Mult"
    "Types"
    "Erasure"
    "Extract"
    "IrProgram"
    "IrGraph"
    "HostCompose"
    "EmitBannerScaffold"
    "EmitBanner"
    "EmitMultScaffold"
    "EmitMult"
    "EmitLinearScaffold"
    "EmitLinear"
    "EmitErasureScaffold"
    "EmitErasure"
    "EmitExtractScaffold"
    "EmitExtract"
    "EmitTypesScaffold"
    "EmitTypes"
    "EmitProgramScaffold"
    "EmitProgram"
    "EmitGraphScaffold"
    "EmitGraph"
    "EmitComposeScaffold"
    "EmitCompose"
    "EmitPlanScaffold"
    "EmitPlan"
    "EmitApplyScaffold"
    "EmitApply"
    "EmitBodyScaffold"
    "EmitBody"
    "FreestandingEmitLoad"
    "FreestandingEmitLoadScaffold"
    "FreestandingEmit"
  ];
  mill68ExpectedExtras = [
    "Mult"
    "Types"
    "Erasure"
    "Extract"
    "IrProgram"
    "IrGraph"
    "HostCompose"
    "EmitMultScaffold"
    "EmitMult"
    "CompilePath"
    "CompilePathMult"
    "FirstSurface"
    "MultSubsetEmit"
    "MultSubsetRebuild"
    "MultFsWriteTool"
    "MultFsDeepen"
  ];

  exists = rel: builtins.pathExists (root + "/${rel}");
  has = import ./string-contains.nix;

  laterContent =
    if exists laterRel then builtins.readFile (root + "/${laterRel}") else null;

  tokensOf =
    line: lib.filter (t: t != "") (lib.splitString " " line);

  takeAfter =
    logName: tokens:
    let
      go =
        ts:
        if ts == [ ] then
          {
            found = false;
            rest = [ ];
          }
        else if builtins.head ts == logName then
          {
            found = true;
            rest = builtins.tail ts;
          }
        else
          go (builtins.tail ts);
    in
    go tokens;

  firstHit =
    marker: content:
    let
      hits = lib.filter (line: has marker line) (lib.splitString "\n" content);
    in
    if hits == [ ] then null else builtins.head hits;

  mill66Marker = "_compile-inventory-exe ${mill66Inventory}";
  mill68Marker = "_compile-inventory-exe ${mill68Inventory}";
  mill69Marker = "_compile-inventory-exe ${mill69Inventory}";

  mill66Line =
    if laterContent == null then null else firstHit mill66Marker laterContent;
  mill68Line =
    if laterContent == null then null else firstHit mill68Marker laterContent;
  mill69Line =
    if laterContent == null then null else firstHit mill69Marker laterContent;

  mill66Parsed =
    if mill66Line == null then
      {
        found = false;
        rest = [ ];
      }
    else
      takeAfter mill66Log (tokensOf mill66Line);
  mill68Parsed =
    if mill68Line == null then
      {
        found = false;
        rest = [ ];
      }
    else
      takeAfter mill68Log (tokensOf mill68Line);
  mill69Parsed =
    if mill69Line == null then
      {
        found = false;
        rest = [ ];
      }
    else
      takeAfter mill69Log (tokensOf mill69Line);

  mill66Extras = mill66Parsed.rest;
  mill68Extras = mill68Parsed.rest;
  mill69Extras = mill69Parsed.rest;
  mill66ExtrasCount = builtins.length mill66Extras;
  mill68ExtrasCount = builtins.length mill68Extras;
  mill69ExtrasCount = builtins.length mill69Extras;
  mill66LineBytes =
    if mill66Line == null then 0 else builtins.stringLength mill66Line;
  mill68LineBytes =
    if mill68Line == null then 0 else builtins.stringLength mill68Line;

  basenameOk = name: builtins.match "[A-Za-z0-9_]+" name != null;

  missingLater =
    if laterContent == null then [ "missing file: ${laterRel}" ] else [ ];

  mill66LineViolations =
    if laterContent == null then
      [ ]
    else if mill66Line == null then
      [ "${laterRel}: missing helper line ${mill66Marker}" ]
    else if !mill66Parsed.found then
      [ "${laterRel}: mill 66 helper line missing log ${mill66Log}" ]
    else
      (
        if mill66ExtrasCount == mill66ExpectedCount then
          [ ]
        else
          [
            "${laterRel}: mill 66 packed extras ${toString mill66ExtrasCount} != closed ${toString mill66ExpectedCount}"
          ]
      )
      ++ (
        if mill66Extras == mill66ExpectedExtras then
          [ ]
        else
          [ "${laterRel}: mill 66 packed extras list is not the closed 34-name list" ]
      )
      ++ (
        if lib.elem mill66Body mill66Extras then
          [ "${laterRel}: mill 66 must not pack body ${mill66Body}" ]
        else
          [ ]
      )
      ++ (
        if has "--extras-file" mill66Line then
          [ "${laterRel}: mill 66 must stay packed argv, not extras-file" ]
        else
          [ ]
      )
      ++ (
        if mill66LineBytes <= millJustLineMax then
          [ ]
        else
          [
            "${laterRel}: mill 66 just-line ${toString mill66LineBytes} bytes exceeds millJustLineMax ${toString millJustLineMax}"
          ]
      )
      ++ (lib.concatMap (
        name:
        if basenameOk name then
          if exists "src/systems/SystemsLean/${name}.lean" then
            [ ]
          else
            [ "mill 66 extra missing Lean src/systems/SystemsLean/${name}.lean" ]
        else
          [ "mill 66 extra bad basename ${name}" ]
      ) mill66Extras);

  mill68LineViolations =
    if laterContent == null then
      [ ]
    else if mill68Line == null then
      [ "${laterRel}: missing helper line ${mill68Marker}" ]
    else if !mill68Parsed.found then
      [ "${laterRel}: mill 68 helper line missing log ${mill68Log}" ]
    else
      (
        if mill68ExtrasCount == mill68ExpectedCount then
          [ ]
        else
          [
            "${laterRel}: mill 68 packed extras ${toString mill68ExtrasCount} != closed ${toString mill68ExpectedCount}"
          ]
      )
      ++ (
        if mill68Extras == mill68ExpectedExtras then
          [ ]
        else
          [ "${laterRel}: mill 68 packed extras list is not the closed 16-name list" ]
      )
      ++ (
        if lib.elem mill68Body mill68Extras then
          [ "${laterRel}: mill 68 must not pack body ${mill68Body}" ]
        else
          [ ]
      )
      ++ (
        if has "--extras-file" mill68Line then
          [ "${laterRel}: mill 68 must stay packed argv, not extras-file" ]
        else
          [ ]
      )
      ++ (
        if mill68LineBytes <= millJustLineMax then
          [ ]
        else
          [
            "${laterRel}: mill 68 just-line ${toString mill68LineBytes} bytes exceeds millJustLineMax ${toString millJustLineMax}"
          ]
      )
      ++ (lib.concatMap (
        name:
        if basenameOk name then
          if exists "src/systems/SystemsLean/${name}.lean" then
            [ ]
          else
            [ "mill 68 extra missing Lean src/systems/SystemsLean/${name}.lean" ]
        else
          [ "mill 68 extra bad basename ${name}" ]
      ) mill68Extras);

  mill69LineViolations =
    if laterContent == null then
      [ ]
    else if mill69Line == null then
      [ "${laterRel}: missing helper line ${mill69Marker}" ]
    else if !mill69Parsed.found then
      [ "${laterRel}: mill 69 helper line missing log ${mill69Log}" ]
    else if mill69ExtrasCount == mill69ExpectedCount then
      [ ]
    else
      [
        "${laterRel}: mill 69 packed extras ${toString mill69ExtrasCount} != closed ${toString mill69ExpectedCount}"
      ];

  laterTokens = [
    "sixty-sixth-host-tool"
    "sixty-eighth-host-tool"
    "sixty-ninth-host-tool"
    "Packed 16 extras"
    "Zero extras"
    "Do not mill mill 69"
    mill66Body
    mill68Body
    mill69Body
  ];

  laterTokenViolations =
    if laterContent == null then
      [ ]
    else
      lib.concatMap (
        t: if has t laterContent then [ ] else [ "${laterRel}: missing token ${t}" ]
      ) laterTokens;

  violations =
    missingLater
    ++ mill66LineViolations
    ++ mill68LineViolations
    ++ mill69LineViolations
    ++ laterTokenViolations;

  ok = violations == [ ];
  summary =
    if ok then
      "systems-mill-packed-extras OK (mill 66 packed extras=${toString mill66ExtrasCount}; mill 68 packed extras=${toString mill68ExtrasCount}; mill 69 packed extras=${toString mill69ExtrasCount}; mill 69 of 69; not remill; occupancy 49)"
    else
      "systems-mill-packed-extras FAILED:\n" + lib.concatStringsSep "\n" violations;
in
{
  inherit
    ok
    violations
    summary
    laterRel
    millJustLineMax
    mill66ExpectedCount
    mill68ExpectedCount
    mill69ExpectedCount
    mill66ExtrasCount
    mill68ExtrasCount
    mill69ExtrasCount
    mill66ExpectedExtras
    mill68ExpectedExtras
    mill66LineBytes
    mill68LineBytes
    ;
}
