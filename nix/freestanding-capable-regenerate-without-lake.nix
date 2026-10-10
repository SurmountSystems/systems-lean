# SPDX-License-Identifier: Unlicense
# freestanding-capable-regenerate-without-lake. Presence only.
# CapableRegenerate.lean must name the without-Lake pins. Four Bool defs
# must be true (same contract as the recipe's extended grep, whitespace
# ignored in a short window). Four freestanding wire files must exist and
# contain SLAKE_EMIT_FREESTANDING_C_V0, HOST-EMIT-MULT, HOST-EMIT-LINEAR,
# and HOST-EMIT-SSOT. Does not call lake. Does not run the prebuilt ELF.
# Fixed strings via nix/string-contains.nix. No whole-file regex.
#   import ./freestanding-capable-regenerate-without-lake.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  hostRel = "src/systems/SystemsLean/CapableRegenerate.lean";
  has = import ./string-contains.nix;
  pins = [
    "productWireWithoutLakeFinishedClaimed"
    "justRecipeProductWireWithoutLake"
    "freestanding-capable-regenerate-without-lake"
    "productWireWithoutLakeKeepsHostLake"
    "prebuiltCapableRegenerateRel"
    "stillUsesLake"
    "productWireWithoutLakeReady"
  ];
  trueDefs = [
    "productWireWithoutLakeFinishedClaimed"
    "stillUsesLake"
    "dependsOnLake"
    "productPathFreestandingCapableRegenerateDependsOnLake"
  ];
  wires = [
    "src/systems/emit/slake_freestanding.h"
    "src/systems/emit/slake_freestanding.c"
    "out/freestanding-c/slake_freestanding.h"
    "out/freestanding-c/slake_freestanding.c"
  ];
  tokens = [
    "SLAKE_EMIT_FREESTANDING_C_V0"
    "HOST-EMIT-MULT"
    "HOST-EMIT-LINEAR"
    "HOST-EMIT-SSOT"
  ];
  absent = rel: kind: [ "${rel}: ${kind}" ];
  hostPath = root + "/${hostRel}";
  hostExists = builtins.pathExists hostPath;
  hostContent = if hostExists then builtins.readFile hostPath else "";
  boolTrue = name: content:
    let
      parts = lib.splitString "def ${name}" content;
      rest = if builtins.length parts < 2 then "" else builtins.elemAt parts 1;
      window = builtins.substring 0 64 rest;
      compact = builtins.replaceStrings [ " " "\t" "\n" "\r" ] [ "" "" "" "" ] window;
    in
    lib.hasPrefix ":Bool:=true" compact;
  pinViolations =
    if !hostExists then [ ]
    else lib.concatMap (pin:
      if has pin hostContent then [ ] else absent hostRel "missing pin ${pin}"
    ) pins;
  defViolations =
    if !hostExists then [ ]
    else lib.concatMap (name:
      if boolTrue name hostContent then [ ] else absent hostRel "def ${name} is not Bool := true"
    ) trueDefs;
  load = rel:
    let
      path = root + "/${rel}";
      exists = builtins.pathExists path;
      content = if exists then builtins.readFile path else "";
    in
    { inherit rel exists content; };
  checkWire = rel:
    let
      t = load rel;
      fileViolations =
        if !t.exists then absent rel "missing file"
        else lib.concatMap (tok:
          if has tok t.content then [ ] else absent rel "missing token ${tok}"
        ) tokens;
    in
    { passed = fileViolations == [ ]; inherit fileViolations; };
  # Bash exits before the wire greps when the module is missing.
  wireResults = if hostExists then map checkWire wires else [ ];
  violations =
    (if hostExists then [ ] else absent hostRel "missing file")
    ++ pinViolations
    ++ defViolations
    ++ lib.concatMap (r: r.fileViolations) wireResults;
  checked = builtins.length (lib.filter (r: r.passed) wireResults);
  ok = violations == [ ] && checked == 4;
  summary =
    if ok then "freestanding-capable-regenerate-without-lake: check passed; count is 4"
    else "freestanding-capable-regenerate-without-lake: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
