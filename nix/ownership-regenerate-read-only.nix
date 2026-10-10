# SPDX-License-Identifier: Unlicense
# ownership-regenerate-read-only. Twelve dual SSOT files under
# src/systems/emit must exist, be non-empty, and contain the named token
# (fixed string, same as grep -F). Presence and token only. No HEADER/BODY
# markers. Body file token is HOST-EMIT-SSOT, not HOST-EMIT-BODY.
# Does not call lake. Does not run a binary. Substring tests use
# nix/string-contains.nix.
#   import ./ownership-regenerate-read-only.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  has = import ./string-contains.nix;
  pair = base: token: { inherit base token; };
  pairs = [
    (pair "host_emit_mult.ssot.txt" "HOST-EMIT-MULT")
    (pair "host_emit_linear.ssot.txt" "HOST-EMIT-LINEAR")
    (pair "host_emit_erasure.ssot.txt" "HOST-EMIT-ERASURE")
    (pair "host_emit_extract.ssot.txt" "HOST-EMIT-EXTRACT")
    (pair "host_emit_types.ssot.txt" "HOST-EMIT-TYPES")
    (pair "host_emit_program.ssot.txt" "HOST-EMIT-PROGRAM")
    (pair "host_emit_graph.ssot.txt" "HOST-EMIT-GRAPH")
    (pair "host_emit_compose.ssot.txt" "HOST-EMIT-COMPOSE")
    (pair "host_emit_plan.ssot.txt" "HOST-EMIT-PLAN")
    (pair "host_emit_apply.ssot.txt" "HOST-EMIT-APPLY")
    (pair "host_emit_body_fragment.ssot.txt" "HOST-EMIT-SSOT")
    (pair "host_emit_banner.ssot.txt" "HOST-EMIT-BANNER")
  ];
  emitDirExists = builtins.pathExists (root + "/${emitRel}");
  absent = rel: kind: [ "${rel}: ${kind}" ];
  checkPair = p:
    let
      rel = "${emitRel}/${p.base}";
      path = root + "/${rel}";
      exists = builtins.pathExists path;
      content = if exists then builtins.readFile path else "";
      empty = exists && content == "";
      fileViolations =
        if !exists then absent rel "missing file"
        else if empty then absent rel "empty file"
        else if has p.token content then [ ]
        else absent rel "missing token ${p.token}";
    in
    { passed = fileViolations == [ ]; inherit fileViolations; };
  # Bash exits before the pair loop when the emit directory is missing.
  results = if emitDirExists then map checkPair pairs else [ ];
  violations =
    (if emitDirExists then [ ] else absent emitRel "missing directory")
    ++ lib.concatMap (r: r.fileViolations) results;
  checked = builtins.length (lib.filter (r: r.passed) results);
  ok = violations == [ ] && checked == 12;
  summary =
    if ok then "ownership-regenerate-read-only: check passed; count is 12"
    else "ownership-regenerate-read-only: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
