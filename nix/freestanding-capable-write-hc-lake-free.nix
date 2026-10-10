# SPDX-License-Identifier: Unlicense
# freestanding-capable-write-hc-lake-free. Twelve dual SSOT files must exist,
# be non-empty, and contain the token plus HEADER/BODY begin and end markers.
# Two templates must be non-empty. Two wire files must contain
# SLAKE_EMIT_FREESTANDING_C_V0. CapableWriteHc.lean must name six markers.
# Presence only. Does not call lake. Fixed strings via nix/string-contains.nix.
# Body token is HOST-EMIT-BODY, not HOST-EMIT-SSOT.
#   import ./freestanding-capable-write-hc-lake-free.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  emitRel = "src/systems/emit";
  hostRel = "src/systems/SystemsLean/CapableWriteHc.lean";
  stage = "SLAKE_EMIT_FREESTANDING_C_V0";
  has = import ./string-contains.nix;
  spec = base: token: header: body: { inherit base token header body; };
  specs = [
    (spec "host_emit_banner.ssot.txt" "HOST-EMIT-BANNER" "BANNER_C_HEADER" "BANNER_C_BODY")
    (spec "host_emit_mult.ssot.txt" "HOST-EMIT-MULT" "MULT_C_HEADER" "MULT_C_BODY")
    (spec "host_emit_linear.ssot.txt" "HOST-EMIT-LINEAR" "LINEAR_C_HEADER" "LINEAR_C_BODY")
    (spec "host_emit_erasure.ssot.txt" "HOST-EMIT-ERASURE" "ERASURE_C_HEADER" "ERASURE_C_BODY")
    (spec "host_emit_extract.ssot.txt" "HOST-EMIT-EXTRACT" "EXTRACT_C_HEADER" "EXTRACT_C_BODY")
    (spec "host_emit_types.ssot.txt" "HOST-EMIT-TYPES" "TYPES_C_HEADER" "TYPES_C_BODY")
    (spec "host_emit_program.ssot.txt" "HOST-EMIT-PROGRAM" "PROGRAM_C_HEADER" "PROGRAM_C_BODY")
    (spec "host_emit_graph.ssot.txt" "HOST-EMIT-GRAPH" "GRAPH_C_HEADER" "GRAPH_C_BODY")
    (spec "host_emit_compose.ssot.txt" "HOST-EMIT-COMPOSE" "COMPOSE_C_HEADER" "COMPOSE_C_BODY")
    (spec "host_emit_plan.ssot.txt" "HOST-EMIT-PLAN" "PLAN_C_HEADER" "PLAN_C_BODY")
    (spec "host_emit_apply.ssot.txt" "HOST-EMIT-APPLY" "APPLY_C_HEADER" "APPLY_C_BODY")
    (spec "host_emit_body_fragment.ssot.txt" "HOST-EMIT-BODY" "BODY_C_HEADER" "BODY_C_BODY")
  ];
  templates = [ "template_slake_freestanding.h.in" "template_slake_freestanding.c.in" ];
  wires = [ "slake_freestanding.h" "slake_freestanding.c" ];
  hostMarkers = [
    "WRITER-PATH-STEP-WRITE-FREESTANDING-HC"
    "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"
    "FREESTANDING-PERFORM-GAP-WRITE-HC"
    "freestandingCapableWriteFreestandingHc"
    "slake_freestanding.h"
    "slake_freestanding.c"
  ];
  emitDirExists = builtins.pathExists (root + "/${emitRel}");
  hostExists = builtins.pathExists (root + "/${hostRel}");
  absent = rel: kind: [ "${rel}: ${kind}" ];
  miss = rel: content: kind: needle:
    if has needle content then [ ] else absent rel "${kind} ${needle}";
  presence = rel:
    let
      path = root + "/${rel}";
      exists = builtins.pathExists path;
      content = if exists then builtins.readFile path else "";
      empty = exists && content == "";
      v =
        if !exists then absent rel "missing file"
        else if empty then absent rel "empty file"
        else [ ];
    in
    { inherit rel content; inherit v; };
  markers = s: t:
    miss t.rel t.content "missing token" s.token
    ++ miss t.rel t.content "missing header begin" "# ${s.header}_BEGIN"
    ++ miss t.rel t.content "missing header end" "# ${s.header}_END"
    ++ miss t.rel t.content "missing body begin" "# ${s.body}_BEGIN"
    ++ miss t.rel t.content "missing body end" "# ${s.body}_END";
  checkSpec = s:
    let
      t = presence "${emitRel}/${s.base}";
      fileViolations = t.v ++ (if t.v == [ ] then markers s t else [ ]);
    in
    { passed = fileViolations == [ ]; inherit fileViolations; };
  # Bash exits before later checks when the emit directory is missing.
  results = if emitDirExists then map checkSpec specs else [ ];
  named = bases: extra:
    lib.concatMap (
      base:
      let t = presence "${emitRel}/${base}"; in
      t.v ++ (if t.v == [ ] then extra t else [ ])
    ) bases;
  templateViolations = if emitDirExists then named templates (_: [ ]) else [ ];
  wireViolations =
    if emitDirExists then
      named wires (t: miss t.rel t.content "missing stage token" stage)
    else [ ];
  hostContent =
    if emitDirExists && hostExists then builtins.readFile (root + "/${hostRel}") else "";
  hostViolations =
    if !emitDirExists then [ ]
    else if !hostExists then absent hostRel "missing file"
    else lib.concatMap (m: miss hostRel hostContent "missing write substrate marker" m) hostMarkers;
  violations =
    (if emitDirExists then [ ] else absent emitRel "missing directory")
    ++ lib.concatMap (r: r.fileViolations) results
    ++ templateViolations
    ++ wireViolations
    ++ hostViolations;
  checked = builtins.length (lib.filter (r: r.passed) results);
  ok = violations == [ ] && checked == 12;
  summary =
    if ok then "freestanding-capable-write-hc-lake-free: check passed; count is 12"
    else "freestanding-capable-write-hc-lake-free: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
