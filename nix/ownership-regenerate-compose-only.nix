# SPDX-License-Identifier: Unlicense
# ownership-regenerate-compose-only. Three plan/apply/body dual SSOT files
# under src/systems/emit must exist, be non-empty, and contain the named
# token (fixed string, same as grep -F). Presence and token only.
# No HEADER/BODY markers. Body file token is HOST-EMIT-BODY, not
# HOST-EMIT-SSOT. Does not call lake. Does not run a binary.
# Substring tests use nix/string-contains.nix.
#   import ./ownership-regenerate-compose-only.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  has = import ./string-contains.nix;
  pair = base: token: { inherit base token; };
  pairs = [
    (pair "host_emit_plan.ssot.txt" "HOST-EMIT-PLAN")
    (pair "host_emit_apply.ssot.txt" "HOST-EMIT-APPLY")
    (pair "host_emit_body_fragment.ssot.txt" "HOST-EMIT-BODY")
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
  ok = violations == [ ] && checked == 3;
  summary =
    if ok then "ownership-regenerate-compose-only: check passed; count is 3"
    else "ownership-regenerate-compose-only: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
