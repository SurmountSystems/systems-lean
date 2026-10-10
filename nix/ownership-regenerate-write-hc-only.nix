# SPDX-License-Identifier: Unlicense
# ownership-regenerate-write-hc-only. Two freestanding wire files under
# src/systems/emit must exist, be non-empty, and contain
# SLAKE_EMIT_FREESTANDING_C_V0 (fixed string, same as grep -F).
# Presence and token only. Does not call lake. Does not run a binary.
# Substring tests use nix/string-contains.nix.
#   import ./ownership-regenerate-write-hc-only.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  has = import ./string-contains.nix;
  pair = base: token: { inherit base token; };
  pairs = [
    (pair "slake_freestanding.h" "SLAKE_EMIT_FREESTANDING_C_V0")
    (pair "slake_freestanding.c" "SLAKE_EMIT_FREESTANDING_C_V0")
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
  ok = violations == [ ] && checked == 2;
  summary =
    if ok then "ownership-regenerate-write-hc-only: check passed; count is 2"
    else "ownership-regenerate-write-hc-only: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
