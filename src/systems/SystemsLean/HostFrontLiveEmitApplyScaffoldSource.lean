/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitApplyScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitApplyScaffoldSource. Not occupancy name 50. Not mill 70.
  This wrap parses EmitApplyScaffold.lean.
  HostFrontLiveEmitApply does not exist; needles use trailing newline
  so that name is not a prefix hit.
  Occupancy leftover HostModuleCheckEmitApplyScaffoldTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveEmitApply is not a prefix):
  HostFrontLiveEmitApplyScaffoldSource
  PARSE-LIVE-EMIT-APPLY-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-APPLY-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, liveEmitApplyScaffoldSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitApplyScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitApplyScaffold

/-- Dual-pinned live EmitApplyScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitApplyScaffoldSource, PARSE-LIVE-EMIT-APPLY-SCAFFOLD. -/
def liveEmitApplyScaffoldSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- freestanding emit apply product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-APPLY product-text fragments (applyHeaderFragment /
  applyBodyFragment), stage/map ids, ownership honesty, and emitApplyReady used by
  SystemsLean.EmitApply. Core apply tag dialect (Apply, packTag, applyFromCompose,
  theorems, EMIT-APPLY-SMOKE) stays in EmitApply. Same namespace
  SystemsLean.EmitApply so call sites stay unqualified.

  Spec (readable):
  - productStageId / hostEmitApplyId / selfHostEmitApplyId: greppable stage map.
  - applyHeaderFragment / applyBodyFragment: freestanding C scaffolding SSoT text
    (APPLY_C_HEADER / APPLY_C_BODY map; FreestandingEmit embeds durable SSOT file).
  - emitApplyReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG/SSA.
  - Durable file host_emit_apply.ssot.txt remains HOST-EMIT-APPLY dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_APPLY_V0, HOST-EMIT-APPLY,
  SELF-HOST-EMIT-APPLY, applyHeaderFragment, applyBodyFragment, emitApplyReady,
  emitApplyOk, applyHeaderHonestyOk, applyBodyHonestyOk, emitApplySurfaceOk,
  EMIT-APPLY-PRODUCT-SMOKE, HOST-EMIT-APPLY-SMOKE, EmitApplyScaffold,
  UNIT_SURFACE host surface, NON-SSOT, RUNTIME-FS.
  Module: SystemsLean.EmitApplyScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitApply.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitApply

/-! ### Host-owned freestanding emit apply product C (HOST-EMIT-APPLY)
    Greppable: HOST-EMIT-APPLY, SELF-HOST-EMIT-APPLY, SLAKE_SELF_HOST_EMIT_APPLY_V0,
    applyHeaderFragment, applyBodyFragment, emitApplyReady.
    maxHeartbeats raised: apply bodies need room for decide honesty. -/

/-- Greppable primary stage id for host-owned emit apply product emit. -/
def productStageId : String := "SLAKE_SELF_HOST_EMIT_APPLY_V0"

/-- Greppable short map id (HOST-EMIT-APPLY). -/
def hostEmitApplyId : String := "HOST-EMIT-APPLY"

/-- Greppable short map id (SELF-HOST-EMIT-APPLY). -/
def selfHostEmitApplyId : String := "SELF-HOST-EMIT-APPLY"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def productAcceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite for product ownership (not a filesystem read). -/
def productHostModulePath : String := "src/systems/SystemsLean/EmitApply.lean"

/-- Durable emit apply SSOT artifact path cite (not a filesystem read). -/
def applySsotArtifactPath : String := "src/systems/emit/host_emit_apply.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-APPLY). -/
def applyOwnershipComment : String :=
  " * HOST-EMIT-APPLY: dialect from SystemsLean.EmitApply + host_emit_apply.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this emit apply product text).\n"

/-- Emit apply section open comment (header; includes ownership). -/
def applyHeaderOpen : String :=
  "/* ---- EMIT_APPLY_V0 -- apply plan tags into fixed buffer (not residual free).\n"
    ++ " * Serialisation of live node mult/kind tags from a checked host compose.\n"
    ++ " * Not full product C body codegen; not CFG/SSA; not residual free; no product GC.\n"
    ++ " * Greppable: EMIT_APPLY_V0, EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS\n"
    ++ " *\n"
    ++ " * Tag packing (one byte per live program node, order = program node order):\n"
    ++ " *   tag = (uint8_t)(((unsigned)mult & 0xFu) << 4 | ((unsigned)kind & 0xFu))\n"
    ++ " * Mult codes (high nibble): MULT_0=0, MULT_1=1, MULT_OMEGA=2 (enum slake_mult).\n"
    ++ " * Kind codes (low nibble): VALUE=0, LINEAR=1, ERASED=2 (enum slake_ir_kind).\n"
    ++ " *\n"
    ++ " * Capacity honesty: SLAKE_EMIT_APPLY_CAP (32) is defensive headroom above\n"
    ++ " * SLAKE_IR_PROGRAM_CAP (8). Honest compose mutators (push_node) cannot grow\n"
    ++ " * live node count past PROGRAM_CAP, so the apply overflow branch is unreachable\n"
    ++ " * via public APIs today; retained for poisoned prog.count and future program growth.\n"
    ++ " * APPLY_CAP is not a claim that apply supports 32 live nodes while the program\n"
    ++ " * still caps at 8.\n"
    ++ applyOwnershipComment
    ++ " */\n"

/-- Emit apply CAP + typedef + function decls. -/
def applyApiDecls : String :=
  "#define SLAKE_EMIT_APPLY_CAP 32\n"
    ++ "\n"
    ++ "typedef struct slake_emit_apply {\n"
    ++ "  uint8_t tags[SLAKE_EMIT_APPLY_CAP]; /* packed: mult high nibble, kind low */\n"
    ++ "  uint8_t count; /* number of tags written */\n"
    ++ "  uint8_t valid; /* 1 after successful apply */\n"
    ++ "} slake_emit_apply;\n"
    ++ "\n"
    ++ "const char *slake_emit_apply_id(void); /* exact \"EMIT_APPLY_V0\" */\n"
    ++ "\n"
    ++ "/* Apply from host compose: requires compose check_fail_closed OK.\n"
    ++ " * Walks live program nodes in order; for each node writes one tag byte.\n"
    ++ " * 0 ok; -1 null out or null/invalid/ill-typed compose or check fails or\n"
    ++ " * count would exceed SLAKE_EMIT_APPLY_CAP (defensive; see CAP honesty above --\n"
    ++ " * live count is bounded by SLAKE_IR_PROGRAM_CAP via honest mutators).\n"
    ++ " * On failure if out non-null: set valid=0 and count=0 (tags left unspecified).\n"
    ++ " * Empty well-typed ready compose (0 nodes) is OK: count=0, valid=1.\n"
    ++ " * Greppable: EMIT_APPLY_V0, EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS\n"
    ++ " * Honesty: not residual free; not full C body emit; not CFG/SSA.\n"
    ++ " */\n"
    ++ "int slake_emit_apply_from_compose(const slake_host_compose *hc,\n"
    ++ "    slake_emit_apply *out);\n"
    ++ "\n"
    ++ "/* Thin: 1 if non-null and valid; else 0 */\n"
    ++ "int slake_emit_apply_is_valid(const slake_emit_apply *a);\n"

/-- applyHeaderFragment -- freestanding emit apply header text (HOST-EMIT-APPLY SSoT). -/
def applyHeaderFragment : String :=
  applyHeaderOpen
    ++ applyApiDecls

/-- Body section open for emit apply. -/
def applyBodyOpen : String :=
  "/* ---- EMIT_APPLY_V0 (apply plan tags from host compose; not residual free) ----\n"
    ++ " * Serialisation of live node mult/kind into a fixed buffer. Not full C body emit.\n"
    ++ " * Greppable: EMIT_APPLY_V0, EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS.\n"
    ++ " * Tag: high nibble = mult (0/1/2), low nibble = kind (0/1/2).\n"
    ++ " * CAP honesty: APPLY_CAP 32 is defensive headroom above PROGRAM_CAP 8;\n"
    ++ " * overflow branch unreachable via honest push_node (see header comment).\n"
    ++ applyOwnershipComment
    ++ " */\n"

/-- Emit apply function bodies (product wire). -/
def applyBodies : String :=
  "const char *slake_emit_apply_id(void)\n"
    ++ "{\n"
    ++ "  return \"EMIT_APPLY_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_apply_from_compose(const slake_host_compose *hc,\n"
    ++ "    slake_emit_apply *out)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  uint8_t n;\n"
    ++ "\n"
    ++ "  if (out == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  /* Fail closed: clear count/valid before further checks. */\n"
    ++ "  out->count = 0;\n"
    ++ "  out->valid = 0;\n"
    ++ "\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_host_compose_is_well_typed(hc) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_OK) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  n = hc->graph.prog.count;\n"
    ++ "  /* Defensive: APPLY_CAP (32) > PROGRAM_CAP (8); honest mutators cannot hit this. */\n"
    ++ "  if (n > (uint8_t)SLAKE_EMIT_APPLY_CAP) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  for (i = 0; i < n; i++) {\n"
    ++ "    enum slake_mult mult;\n"
    ++ "    enum slake_ir_kind kind;\n"
    ++ "    mult = hc->graph.prog.nodes[i].mult;\n"
    ++ "    kind = hc->graph.prog.nodes[i].kind;\n"
    ++ "    /* Pack: mult high nibble, kind low nibble (codes match enums 0/1/2). */\n"
    ++ "    out->tags[i] = (uint8_t)((((unsigned)mult & 0xFu) << 4)\n"
    ++ "        | ((unsigned)kind & 0xFu));\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  out->count = n;\n"
    ++ "  out->valid = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_apply_is_valid(const slake_emit_apply *a)\n"
    ++ "{\n"
    ++ "  if (a == 0 || a->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"

/-- applyBodyFragment -- freestanding emit apply body text (HOST-EMIT-APPLY SSoT). -/
def applyBodyFragment : String :=
  applyBodyOpen
    ++ "\n"
    ++ applyBodies

/-- Ownership comment carries HOST-EMIT-APPLY + FreestandingEmit embed honesty. -/
def applyOwnershipHonestyOk : Bool :=
  (applyOwnershipComment
    == " * HOST-EMIT-APPLY: dialect from SystemsLean.EmitApply + host_emit_apply.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this emit apply product text).\n")

/-- Header piece honesty: emit apply decls + ownership. -/
def applyHeaderHonestyOk : Bool :=
  applyOwnershipHonestyOk
    && (applyApiDecls
      == "#define SLAKE_EMIT_APPLY_CAP 32\n"
        ++ "\n"
        ++ "typedef struct slake_emit_apply {\n"
        ++ "  uint8_t tags[SLAKE_EMIT_APPLY_CAP]; /* packed: mult high nibble, kind low */\n"
        ++ "  uint8_t count; /* number of tags written */\n"
        ++ "  uint8_t valid; /* 1 after successful apply */\n"
        ++ "} slake_emit_apply;\n"
        ++ "\n"
        ++ "const char *slake_emit_apply_id(void); /* exact \"EMIT_APPLY_V0\" */\n"
        ++ "\n"
        ++ "/* Apply from host compose: requires compose check_fail_closed OK.\n"
        ++ " * Walks live program nodes in order; for each node writes one tag byte.\n"
        ++ " * 0 ok; -1 null out or null/invalid/ill-typed compose or check fails or\n"
        ++ " * count would exceed SLAKE_EMIT_APPLY_CAP (defensive; see CAP honesty above --\n"
        ++ " * live count is bounded by SLAKE_IR_PROGRAM_CAP via honest mutators).\n"
        ++ " * On failure if out non-null: set valid=0 and count=0 (tags left unspecified).\n"
        ++ " * Empty well-typed ready compose (0 nodes) is OK: count=0, valid=1.\n"
        ++ " * Greppable: EMIT_APPLY_V0, EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS\n"
        ++ " * Honesty: not residual free; not full C body emit; not CFG/SSA.\n"
        ++ " */\n"
        ++ "int slake_emit_apply_from_compose(const slake_host_compose *hc,\n"
        ++ "    slake_emit_apply *out);\n"
        ++ "\n"
        ++ "/* Thin: 1 if non-null and valid; else 0 */\n"
        ++ "int slake_emit_apply_is_valid(const slake_emit_apply *a);\n")

/-- Body piece honesty: emit apply function bodies. -/
def applyBodyHonestyOk : Bool :=
  applyOwnershipHonestyOk
    && (applyBodies
      == "const char *slake_emit_apply_id(void)\n"
        ++ "{\n"
        ++ "  return \"EMIT_APPLY_V0\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_emit_apply_from_compose(const slake_host_compose *hc,\n"
        ++ "    slake_emit_apply *out)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "  uint8_t n;\n"
        ++ "\n"
        ++ "  if (out == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  /* Fail closed: clear count/valid before further checks. */\n"
        ++ "  out->count = 0;\n"
        ++ "  out->valid = 0;\n"
        ++ "\n"
        ++ "  if (hc == 0 || hc->valid == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (slake_host_compose_is_well_typed(hc) != 1) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_OK) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "\n"
        ++ "  n = hc->graph.prog.count;\n"
        ++ "  /* Defensive: APPLY_CAP (32) > PROGRAM_CAP (8); honest mutators cannot hit this. */\n"
        ++ "  if (n > (uint8_t)SLAKE_EMIT_APPLY_CAP) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "\n"
        ++ "  for (i = 0; i < n; i++) {\n"
        ++ "    enum slake_mult mult;\n"
        ++ "    enum slake_ir_kind kind;\n"
        ++ "    mult = hc->graph.prog.nodes[i].mult;\n"
        ++ "    kind = hc->graph.prog.nodes[i].kind;\n"
        ++ "    /* Pack: mult high nibble, kind low nibble (codes match enums 0/1/2). */\n"
        ++ "    out->tags[i] = (uint8_t)((((unsigned)mult & 0xFu) << 4)\n"
        ++ "        | ((unsigned)kind & 0xFu));\n"
        ++ "  }\n"
        ++ "\n"
        ++ "  out->count = n;\n"
        ++ "  out->valid = 1;\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_emit_apply_is_valid(const slake_emit_apply *a)\n"
        ++ "{\n"
        ++ "  if (a == 0 || a->valid == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitApplySurfaceOk : Bool :=
  (productStageId == "SLAKE_SELF_HOST_EMIT_APPLY_V0")
    && (hostEmitApplyId == "HOST-EMIT-APPLY")
    && (selfHostEmitApplyId == "SELF-HOST-EMIT-APPLY")
    && (productAcceptancePath == "src/systems/self-host.md")
    && (productHostModulePath == "src/systems/SystemsLean/EmitApply.lean")
    && (applySsotArtifactPath == "src/systems/emit/host_emit_apply.ssot.txt")

/-- emitApplyReady -- emit apply host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitApplyReady, HOST-EMIT-APPLY, SELF-HOST-EMIT-APPLY. -/
def emitApplyReady : Bool :=
  emitApplySurfaceOk && applyHeaderHonestyOk && applyBodyHonestyOk

/-- Full inventory ok (alias of emitApplyReady for inventory greps). -/
def emitApplyOk : Bool := emitApplyReady

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-APPLY-PRODUCT-SMOKE / HOST-EMIT-APPLY-SMOKE: stage / map ids. -/
example : productStageId = "SLAKE_SELF_HOST_EMIT_APPLY_V0" := by decide
example : hostEmitApplyId = "HOST-EMIT-APPLY" := by decide
example : selfHostEmitApplyId = "SELF-HOST-EMIT-APPLY" := by decide
example : productAcceptancePath = "src/systems/self-host.md" := by decide
example : productHostModulePath = "src/systems/SystemsLean/EmitApply.lean" := by decide
example : applySsotArtifactPath = "src/systems/emit/host_emit_apply.ssot.txt" := by decide
example : emitApplySurfaceOk = true := by decide

/-- HOST-EMIT-APPLY-SMOKE: ownership + header decls. -/
example : applyOwnershipHonestyOk = true := by decide
example : applyHeaderHonestyOk = true := by decide

/-- HOST-EMIT-APPLY-SMOKE: body piece honesty. -/
example : applyBodyHonestyOk = true := by decide

/-- EMIT-APPLY-PRODUCT-SMOKE: full emit readiness. -/
example : emitApplyReady = true := by decide
example : emitApplyOk = true := by decide

/-- EMIT-APPLY-PRODUCT-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitApplyReady_true : emitApplyReady = true := by decide

end SystemsLean.EmitApply
"##

end SystemsLean.HostFrontLiveEmitApplyScaffold
