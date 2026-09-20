# SPDX-License-Identifier: Unlicense
# Pure Nix mill extras-fit: HostModuleCheck extras must live in a file the
# mill helper can read, so the reconstructed just line stays mill-class.
# Packed 130 names as argv is the skip (mill 66 class is 582 bytes / 34 extras).
# Named bound millJustLineMax = 2048 is mill-class, not live getconf ARG_MAX.
# Closed extras count is 130 (hub 114 plus 16 transitive; include RealModule).
# No bash-in-Nix. No Python. Does not mill. Does not claim 69 of 69. Does not claim Lake-gone.
#
#   import ./systems-mill-extras-fit { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary }
{ lib, root }:
let
  extrasRel = "src/systems/mill-extras-host-module-check.txt";
  helperRel = "just/first-host-tool.just";
  inventoryName = "slake-host-module-check";
  bodyName = "HostModuleCheck";
  mainName = "HostModuleCheckMain";
  realModule = "HostModuleCheckRealModule";
  logName = "command-host-module-check.log";
  millJustLineMax = 2048;
  expectedClosedExtras = 130;

  exists = rel: builtins.pathExists (root + "/${rel}");
  readRel =
    rel:
    if exists rel then
      builtins.readFile (root + "/${rel}")
    else
      null;

  has = import ../string-contains.nix;

  helperContent = readRel helperRel;

  helperTokens = [
    "_compile-inventory-exe"
    "--extras-file"
    "SLAKE_MILL_EXTRAS_FILE"
  ];

  helperViolations =
    if helperContent == null then
      [ "missing file: ${helperRel}" ]
    else
      lib.concatMap (
        t: if has t helperContent then [ ] else [ "${helperRel}: missing token ${t}" ]
      ) helperTokens;

  extrasPath = root + "/${extrasRel}";
  extrasContent = readRel extrasRel;

  rawLines =
    if extrasContent == null then
      [ ]
    else
      lib.splitString "\n" extrasContent;

  extrasNames = lib.filter (
    line:
    line != "" && !(lib.hasPrefix "#" line)
  ) rawLines;

  extrasCount = builtins.length extrasNames;

  fileFormJustLine = lib.concatStringsSep " " [
    "just"
    "_compile-inventory-exe"
    inventoryName
    bodyName
    logName
    "--extras-file"
    extrasRel
  ];

  fileFormBytes = builtins.stringLength fileFormJustLine;

  basenameOk =
    name:
    builtins.match "[A-Za-z0-9_]+" name != null;

  extrasFileViolations =
    if extrasContent == null then
      [ "missing extras file: ${extrasRel}" ]
    else
      (
        if extrasCount == expectedClosedExtras then
          [ ]
        else
          [
            "${extrasRel}: extras count ${toString extrasCount} != closed ${toString expectedClosedExtras}"
          ]
      )
      ++ (if lib.elem bodyName extrasNames then [ "${extrasRel}: must not list body ${bodyName}" ] else [ ])
      ++ (if lib.elem mainName extrasNames then [ "${extrasRel}: must not list Main ${mainName}" ] else [ ])
      ++ (
        if lib.elem realModule extrasNames then
          [ ]
        else
          [ "${extrasRel}: must include ${realModule}" ]
      )
      ++ (lib.concatMap (
        name:
        if basenameOk name then
          if exists "src/systems/SystemsLean/${name}.lean" then
            [ ]
          else
            [ "${extrasRel}: missing Lean src/systems/SystemsLean/${name}.lean" ]
        else
          [ "${extrasRel}: bad basename ${name}" ]
      ) extrasNames);

  justLineViolations =
    if fileFormBytes <= millJustLineMax then
      [ ]
    else
      [
        "file-form just-line ${toString fileFormBytes} bytes exceeds millJustLineMax ${toString millJustLineMax}"
      ];

  violations = helperViolations ++ extrasFileViolations ++ justLineViolations;
  ok = violations == [ ];
  maxShow = 40;
  shown = lib.take maxShow violations;
  more =
    let
      n = builtins.length violations;
    in
    if n > maxShow then "\n... and ${toString (n - maxShow)} more" else "";
  summary =
    if ok then
      "systems-mill-extras-fit OK (extras=${toString extrasCount}; file-form just-line ${toString fileFormBytes} bytes <= ${toString millJustLineMax}; occupancy 49; mill metric 68 of 69 after MultFsWrite ELF GREEN)"
    else
      "systems-mill-extras-fit FAILED:\n" + lib.concatStringsSep "\n" shown + more;
in
{
  inherit
    ok
    violations
    summary
    extrasRel
    millJustLineMax
    expectedClosedExtras
    fileFormJustLine
    fileFormBytes
    extrasCount
    ;
}
