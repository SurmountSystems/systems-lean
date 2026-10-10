# SPDX-License-Identifier: Unlicense
# Pure Nix home for the just recipe freestanding-capable-read-lake-free
# (just/freestanding-capable.just). Twelve dual SSOT files under
# src/systems/emit: each must exist, be non-empty, and contain the token
# plus HEADER/BODY begin and end markers (fixed substrings, same as grep -F).
# Presence only. Does not call lake. Does not invent extra tokens.
# Does not fold into systems-emit-wire (that gate does not require END markers).
# Substring tests use nix/string-contains.nix (fixed string). lib.hasInfix
# is a regex match and can stack-overflow on large files.
#
#   import ./freestanding-capable-read-lake-free.nix { inherit lib; root = novelSourceOrRepo; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  has = import ./string-contains.nix;

  # basename, token, header block, body block. Order matches the just recipe.
  specs = [
    { base = "host_emit_mult.ssot.txt"; token = "HOST-EMIT-MULT"; header = "MULT_C_HEADER"; body = "MULT_C_BODY"; }
    { base = "host_emit_linear.ssot.txt"; token = "HOST-EMIT-LINEAR"; header = "LINEAR_C_HEADER"; body = "LINEAR_C_BODY"; }
    { base = "host_emit_erasure.ssot.txt"; token = "HOST-EMIT-ERASURE"; header = "ERASURE_C_HEADER"; body = "ERASURE_C_BODY"; }
    { base = "host_emit_extract.ssot.txt"; token = "HOST-EMIT-EXTRACT"; header = "EXTRACT_C_HEADER"; body = "EXTRACT_C_BODY"; }
    { base = "host_emit_types.ssot.txt"; token = "HOST-EMIT-TYPES"; header = "TYPES_C_HEADER"; body = "TYPES_C_BODY"; }
    { base = "host_emit_program.ssot.txt"; token = "HOST-EMIT-PROGRAM"; header = "PROGRAM_C_HEADER"; body = "PROGRAM_C_BODY"; }
    { base = "host_emit_graph.ssot.txt"; token = "HOST-EMIT-GRAPH"; header = "GRAPH_C_HEADER"; body = "GRAPH_C_BODY"; }
    { base = "host_emit_compose.ssot.txt"; token = "HOST-EMIT-COMPOSE"; header = "COMPOSE_C_HEADER"; body = "COMPOSE_C_BODY"; }
    { base = "host_emit_plan.ssot.txt"; token = "HOST-EMIT-PLAN"; header = "PLAN_C_HEADER"; body = "PLAN_C_BODY"; }
    { base = "host_emit_apply.ssot.txt"; token = "HOST-EMIT-APPLY"; header = "APPLY_C_HEADER"; body = "APPLY_C_BODY"; }
    { base = "host_emit_body_fragment.ssot.txt"; token = "HOST-EMIT-SSOT"; header = "BODY_C_HEADER"; body = "BODY_C_BODY"; }
    { base = "host_emit_banner.ssot.txt"; token = "HOST-EMIT-BANNER"; header = "BANNER_C_HEADER"; body = "BANNER_C_BODY"; }
  ];

  emitDir = root + "/${emitRel}";
  emitDirExists = builtins.pathExists emitDir;

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
  violations =
    dirViolations ++ lib.concatMap (r: r.fileViolations) results;
  checked = builtins.length (lib.filter (r: r.passed) results);
  violationCount = builtins.length violations;
  ok = violations == [ ] && checked == 12;
  summary =
    if ok then
      "freestanding-capable-read-lake-free: check passed; count is 12"
    else
      "freestanding-capable-read-lake-free: check failed; violation count is ${toString violationCount}";
in
{
  inherit
    ok
    violations
    summary
    checked
    ;
}
