# SPDX-License-Identifier: Unlicense
# Pure Nix home for the just recipe freestanding-capable-compose-lake-free
# (just/freestanding-capable.just). Three plan/apply/body dual SSOT files
# under src/systems/emit: each must exist, be non-empty, and contain the
# token plus HEADER/BODY begin and end markers (fixed substrings, same as
# grep -F). Then CapableCompose.lean must name four ordered markers.
# Presence only. Does not call lake. Does not invent extra tokens.
# Does not fold into systems-emit-wire (that gate does not require END
# markers or these ordered compose markers). Substring tests use
# nix/string-contains.nix (fixed string). lib.hasInfix is a regex match
# and can stack-overflow on large files.
#
#   import ./freestanding-capable-compose-lake-free.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  hostRel = "src/systems/SystemsLean/CapableCompose.lean";
  has = import ./string-contains.nix;

  # basename, token, header block, body block. Order matches the just recipe.
  # Body token is HOST-EMIT-BODY (compose list), not HOST-EMIT-SSOT.
  specs = [
    { base = "host_emit_plan.ssot.txt"; token = "HOST-EMIT-PLAN"; header = "PLAN_C_HEADER"; body = "PLAN_C_BODY"; }
    { base = "host_emit_apply.ssot.txt"; token = "HOST-EMIT-APPLY"; header = "APPLY_C_HEADER"; body = "APPLY_C_BODY"; }
    { base = "host_emit_body_fragment.ssot.txt"; token = "HOST-EMIT-BODY"; header = "BODY_C_HEADER"; body = "BODY_C_BODY"; }
  ];

  hostMarkers = [
    "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"
    "FREESTANDING-PERFORM-GAP-COMPOSE"
    "freestandingCapableComposePlanApplyBody"
  ];

  emitDir = root + "/${emitRel}";
  emitDirExists = builtins.pathExists emitDir;
  hostPath = root + "/${hostRel}";
  hostExists = builtins.pathExists hostPath;

  absent = rel: kind: [ "${rel}: ${kind}" ];

  markerMiss =
    rel: content: kind: needle:
    if has needle content then [ ] else absent rel "${kind} ${needle}";

  checkSpec =
    spec:
    let
      rel = "${emitRel}/${spec.base}";
      path = root + "/${rel}";
      exists = builtins.pathExists path;
      content = if exists then builtins.readFile path else "";
      empty = exists && content == "";
    in
    if !exists then
      { passed = false; fileViolations = absent rel "missing file"; }
    else if empty then
      { passed = false; fileViolations = absent rel "empty file"; }
    else
      let
        fileViolations =
          markerMiss rel content "missing token" spec.token
          ++ markerMiss rel content "missing header begin" "# ${spec.header}_BEGIN"
          ++ markerMiss rel content "missing header end" "# ${spec.header}_END"
          ++ markerMiss rel content "missing body begin" "# ${spec.body}_BEGIN"
          ++ markerMiss rel content "missing body end" "# ${spec.body}_END";
      in
      {
        passed = fileViolations == [ ];
        inherit fileViolations;
      };

  # Bash exits before the spec loop when the emit directory is missing.
  dirViolations =
    if emitDirExists then [ ] else absent emitRel "missing directory";

  results = if emitDirExists then map checkSpec specs else [ ];

  hostContent =
    if emitDirExists && hostExists then builtins.readFile hostPath else "";

  hostViolations =
    if !emitDirExists then
      [ ]
    else if !hostExists then
      absent hostRel "missing file"
    else
      lib.concatMap
        (marker: markerMiss hostRel hostContent "missing ordered marker" marker)
        hostMarkers;

  violations =
    dirViolations
    ++ lib.concatMap (r: r.fileViolations) results
    ++ hostViolations;
  checked = builtins.length (lib.filter (r: r.passed) results);
  violationCount = builtins.length violations;
  ok = violations == [ ] && checked == 3;
  summary =
    if ok then
      "freestanding-capable-compose-lake-free: check passed; count is 3"
    else
      "freestanding-capable-compose-lake-free: check failed; violation count is ${toString violationCount}";
in
{
  inherit
    ok
    violations
    summary
    checked
    ;
}
