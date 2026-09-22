/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitPlanScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitPlanScaffoldSource. Not occupancy name 50. Not mill 70.
  This wrap is EmitPlanScaffold.lean. It is not EmitPlan.lean.
  liveRel is EmitPlanScaffold.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveEmitPlanScaffoldSource,
  HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitPlanScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitPlanScaffold

/-- Live file basename. Exactly EmitPlanScaffold.lean. -/
def liveRel : String := "EmitPlanScaffold.lean"

/-- Dual-pinned live EmitPlanScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitPlanScaffoldSource, HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD. -/
def liveEmitPlanScaffoldSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding emit plan product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-PLAN product-text fragments (planHeaderFragment /
  planBodyFragment), stage/map ids, ownership honesty, and emitPlanReady used by
  SystemsLean.EmitPlan. Core plan dialect (Plan, planFromCompose, isReady,
  theorems, EMIT-PLAN-SMOKE) stays in EmitPlan. Same namespace
  SystemsLean.EmitPlan so call sites stay unqualified.

  Spec (readable):
  - productStageId / hostEmitPlanId / selfHostEmitPlanId: greppable stage map.
  - planHeaderFragment / planBodyFragment: freestanding C scaffolding SSoT text
    (PLAN_C_HEADER / PLAN_C_BODY map; FreestandingEmit embeds durable SSOT file).
  - emitPlanReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG/SSA.
  - Durable file host_emit_plan.ssot.txt remains HOST-EMIT-PLAN dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_PLAN_V0, HOST-EMIT-PLAN,
  SELF-HOST-EMIT-PLAN, planHeaderFragment, planBodyFragment, emitPlanReady,
  emitPlanOk, planHeaderHonestyOk, planBodyHonestyOk, emitPlanSurfaceOk,
  EMIT-PLAN-PRODUCT-SMOKE, HOST-EMIT-PLAN-SMOKE, EmitPlanScaffold,
  UNIT_SURFACE host surface, NON-SSOT, RUNTIME-FS.
  Module: SystemsLean.EmitPlanScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitPlan.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitPlan

/-! ### Host-owned freestanding emit plan product C (HOST-EMIT-PLAN)
    Greppable: HOST-EMIT-PLAN, SELF-HOST-EMIT-PLAN, SLAKE_SELF_HOST_EMIT_PLAN_V0,
    planHeaderFragment, planBodyFragment, emitPlanReady.
    maxHeartbeats raised: plan bodies need room for decide honesty. -/

/-- Greppable primary stage id for host-owned emit plan product emit. -/
def productStageId : String := "SLAKE_SELF_HOST_EMIT_PLAN_V0"

/-- Greppable short map id (HOST-EMIT-PLAN). -/
def hostEmitPlanId : String := "HOST-EMIT-PLAN"

/-- Greppable short map id (SELF-HOST-EMIT-PLAN). -/
def selfHostEmitPlanId : String := "SELF-HOST-EMIT-PLAN"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def productAcceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite for product ownership (not a filesystem read). -/
def productHostModulePath : String := "src/systems/SystemsLean/EmitPlan.lean"

/-- Durable emit plan SSOT artifact path cite (not a filesystem read). -/
def planSsotArtifactPath : String := "src/systems/emit/host_emit_plan.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-PLAN). -/
def planOwnershipComment : String :=
  " * HOST-EMIT-PLAN: dialect from SystemsLean.EmitPlan + host_emit_plan.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this emit plan product text).\n"

/-- Emit plan section open comment (header; includes ownership). -/
def planHeaderOpen : String :=
  "/* ---- EMIT_PLAN_V0 -- emit plan from host compose (not residual free; not CFG/SSA)\n"
    ++ " * Readiness inventory derived from a checked host compose. Not full product emit\n"
    ++ " * of IR bodies. not residual free; not PROVABLY; no product GC.\n"
    ++ " * Greppable: EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS, EMIT-BOUNDARY\n"
    ++ planOwnershipComment
    ++ " */\n"

/-- Emit plan typedef + function decls. -/
def planApiDecls : String :=
  "typedef struct slake_emit_plan {\n"
    ++ "  uint8_t node_count;     /* program node count */\n"
    ++ "  uint8_t edge_count;     /* graph edge count */\n"
    ++ "  uint8_t runtime_nodes;  /* count of MULT-1 + MULT-OMEGA nodes (survive product wire) */\n"
    ++ "  uint8_t erased_nodes;   /* count of MULT-0 nodes */\n"
    ++ "  uint8_t ready;          /* 1 if host_compose check_fail_closed would be OK */\n"
    ++ "  uint8_t valid;          /* 1 after successful plan build */\n"
    ++ "} slake_emit_plan;\n"
    ++ "\n"
    ++ "const char *slake_emit_plan_id(void); /* exact \"EMIT_PLAN_V0\" */\n"
    ++ "\n"
    ++ "/* Build plan from host compose.\n"
    ++ " * 0 ok; -1 null out or null/invalid/ill-typed compose, OR check_fail_closed fails.\n"
    ++ " * On failure: if out non-null, set valid=0 and leave other fields zeroed (fail closed).\n"
    ++ " * On success:\n"
    ++ " *   - node_count = hc->graph.prog.count\n"
    ++ " *   - edge_count = hc->graph.edge_count\n"
    ++ " *   - runtime_nodes / erased_nodes counted from live nodes' mult\n"
    ++ " *   - ready = 1\n"
    ++ " *   - valid = 1\n"
    ++ " * Greppable: EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS, EMIT-BOUNDARY\n"
    ++ " * Honesty: not residual free; plan is readiness inventory, not full product emit of IR bodies.\n"
    ++ " */\n"
    ++ "int slake_emit_plan_from_compose(const slake_host_compose *hc, slake_emit_plan *out);\n"
    ++ "\n"
    ++ "/* Optional thin: 1 if non-null and valid and ready; else 0 */\n"
    ++ "int slake_emit_plan_is_ready(const slake_emit_plan *plan);\n"

/-- planHeaderFragment -- freestanding emit plan header text (HOST-EMIT-PLAN SSoT). -/
def planHeaderFragment : String :=
  planHeaderOpen
    ++ planApiDecls

/-- Body section open for emit plan. -/
def planBodyOpen : String :=
  "/* ---- EMIT_PLAN_V0 (emit plan from host compose; not residual free; not CFG/SSA) ----\n"
    ++ " * Readiness inventory: node/edge counts + MULT-1/OMEGA runtime vs MULT-0 erased.\n"
    ++ " * Requires host_compose check_fail_closed OK. Not full product emit of IR bodies.\n"
    ++ " * Greppable: EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS, EMIT-BOUNDARY.\n"
    ++ planOwnershipComment
    ++ " */\n"

/-- Emit plan function bodies (product wire). -/
def planBodies : String :=
  "const char *slake_emit_plan_id(void)\n"
    ++ "{\n"
    ++ "  return \"EMIT_PLAN_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_plan_from_compose(const slake_host_compose *hc, slake_emit_plan *out)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  uint8_t runtime;\n"
    ++ "  uint8_t erased;\n"
    ++ "\n"
    ++ "  if (out == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  /* Fail closed: zero fields and valid=0 before any further checks. */\n"
    ++ "  out->node_count = 0;\n"
    ++ "  out->edge_count = 0;\n"
    ++ "  out->runtime_nodes = 0;\n"
    ++ "  out->erased_nodes = 0;\n"
    ++ "  out->ready = 0;\n"
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
    ++ "  runtime = 0;\n"
    ++ "  erased = 0;\n"
    ++ "  for (i = 0; i < hc->graph.prog.count; i++) {\n"
    ++ "    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_0) {\n"
    ++ "      erased = (uint8_t)(erased + 1);\n"
    ++ "    } else {\n"
    ++ "      /* MULT-1 and MULT-OMEGA survive product wire as runtime nodes */\n"
    ++ "      runtime = (uint8_t)(runtime + 1);\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  out->node_count = hc->graph.prog.count;\n"
    ++ "  out->edge_count = hc->graph.edge_count;\n"
    ++ "  out->runtime_nodes = runtime;\n"
    ++ "  out->erased_nodes = erased;\n"
    ++ "  out->ready = 1;\n"
    ++ "  out->valid = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_plan_is_ready(const slake_emit_plan *plan)\n"
    ++ "{\n"
    ++ "  if (plan == 0 || plan->valid == 0 || plan->ready == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"

/-- planBodyFragment -- freestanding emit plan body text (HOST-EMIT-PLAN SSoT). -/
def planBodyFragment : String :=
  planBodyOpen
    ++ "\n"
    ++ planBodies

/-- Ownership comment carries HOST-EMIT-PLAN + FreestandingEmit embed honesty. -/
def planOwnershipHonestyOk : Bool :=
  (planOwnershipComment
    == " * HOST-EMIT-PLAN: dialect from SystemsLean.EmitPlan + host_emit_plan.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this emit plan product text).\n")

/-- Header piece honesty: emit plan decls + ownership. -/
def planHeaderHonestyOk : Bool :=
  planOwnershipHonestyOk
    && (planApiDecls
      == "typedef struct slake_emit_plan {\n"
        ++ "  uint8_t node_count;     /* program node count */\n"
        ++ "  uint8_t edge_count;     /* graph edge count */\n"
        ++ "  uint8_t runtime_nodes;  /* count of MULT-1 + MULT-OMEGA nodes (survive product wire) */\n"
        ++ "  uint8_t erased_nodes;   /* count of MULT-0 nodes */\n"
        ++ "  uint8_t ready;          /* 1 if host_compose check_fail_closed would be OK */\n"
        ++ "  uint8_t valid;          /* 1 after successful plan build */\n"
        ++ "} slake_emit_plan;\n"
        ++ "\n"
        ++ "const char *slake_emit_plan_id(void); /* exact \"EMIT_PLAN_V0\" */\n"
        ++ "\n"
        ++ "/* Build plan from host compose.\n"
        ++ " * 0 ok; -1 null out or null/invalid/ill-typed compose, OR check_fail_closed fails.\n"
        ++ " * On failure: if out non-null, set valid=0 and leave other fields zeroed (fail closed).\n"
        ++ " * On success:\n"
        ++ " *   - node_count = hc->graph.prog.count\n"
        ++ " *   - edge_count = hc->graph.edge_count\n"
        ++ " *   - runtime_nodes / erased_nodes counted from live nodes' mult\n"
        ++ " *   - ready = 1\n"
        ++ " *   - valid = 1\n"
        ++ " * Greppable: EMIT_PLAN_V0, HOST_COMPOSE_V0, RUNTIME-FS, EMIT-BOUNDARY\n"
        ++ " * Honesty: not residual free; plan is readiness inventory, not full product emit of IR bodies.\n"
        ++ " */\n"
        ++ "int slake_emit_plan_from_compose(const slake_host_compose *hc, slake_emit_plan *out);\n"
        ++ "\n"
        ++ "/* Optional thin: 1 if non-null and valid and ready; else 0 */\n"
        ++ "int slake_emit_plan_is_ready(const slake_emit_plan *plan);\n")

/-- Body piece honesty: emit plan function bodies. -/
def planBodyHonestyOk : Bool :=
  planOwnershipHonestyOk
    && (planBodies
      == "const char *slake_emit_plan_id(void)\n"
        ++ "{\n"
        ++ "  return \"EMIT_PLAN_V0\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_emit_plan_from_compose(const slake_host_compose *hc, slake_emit_plan *out)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "  uint8_t runtime;\n"
        ++ "  uint8_t erased;\n"
        ++ "\n"
        ++ "  if (out == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  /* Fail closed: zero fields and valid=0 before any further checks. */\n"
        ++ "  out->node_count = 0;\n"
        ++ "  out->edge_count = 0;\n"
        ++ "  out->runtime_nodes = 0;\n"
        ++ "  out->erased_nodes = 0;\n"
        ++ "  out->ready = 0;\n"
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
        ++ "  runtime = 0;\n"
        ++ "  erased = 0;\n"
        ++ "  for (i = 0; i < hc->graph.prog.count; i++) {\n"
        ++ "    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_0) {\n"
        ++ "      erased = (uint8_t)(erased + 1);\n"
        ++ "    } else {\n"
        ++ "      /* MULT-1 and MULT-OMEGA survive product wire as runtime nodes */\n"
        ++ "      runtime = (uint8_t)(runtime + 1);\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "\n"
        ++ "  out->node_count = hc->graph.prog.count;\n"
        ++ "  out->edge_count = hc->graph.edge_count;\n"
        ++ "  out->runtime_nodes = runtime;\n"
        ++ "  out->erased_nodes = erased;\n"
        ++ "  out->ready = 1;\n"
        ++ "  out->valid = 1;\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_emit_plan_is_ready(const slake_emit_plan *plan)\n"
        ++ "{\n"
        ++ "  if (plan == 0 || plan->valid == 0 || plan->ready == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitPlanSurfaceOk : Bool :=
  (productStageId == "SLAKE_SELF_HOST_EMIT_PLAN_V0")
    && (hostEmitPlanId == "HOST-EMIT-PLAN")
    && (selfHostEmitPlanId == "SELF-HOST-EMIT-PLAN")
    && (productAcceptancePath == "src/systems/self-host.md")
    && (productHostModulePath == "src/systems/SystemsLean/EmitPlan.lean")
    && (planSsotArtifactPath == "src/systems/emit/host_emit_plan.ssot.txt")

/-- emitPlanReady -- emit plan host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitPlanReady, HOST-EMIT-PLAN, SELF-HOST-EMIT-PLAN. -/
def emitPlanReady : Bool :=
  emitPlanSurfaceOk && planHeaderHonestyOk && planBodyHonestyOk

/-- Full inventory ok (alias of emitPlanReady for inventory greps). -/
def emitPlanOk : Bool := emitPlanReady

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-PLAN-PRODUCT-SMOKE / HOST-EMIT-PLAN-SMOKE: stage / map ids. -/
example : productStageId = "SLAKE_SELF_HOST_EMIT_PLAN_V0" := by decide
example : hostEmitPlanId = "HOST-EMIT-PLAN" := by decide
example : selfHostEmitPlanId = "SELF-HOST-EMIT-PLAN" := by decide
example : productAcceptancePath = "src/systems/self-host.md" := by decide
example : productHostModulePath = "src/systems/SystemsLean/EmitPlan.lean" := by decide
example : planSsotArtifactPath = "src/systems/emit/host_emit_plan.ssot.txt" := by decide
example : emitPlanSurfaceOk = true := by decide

/-- HOST-EMIT-PLAN-SMOKE: ownership + header decls. -/
example : planOwnershipHonestyOk = true := by decide
example : planHeaderHonestyOk = true := by decide

/-- HOST-EMIT-PLAN-SMOKE: body piece honesty. -/
example : planBodyHonestyOk = true := by decide

/-- EMIT-PLAN-PRODUCT-SMOKE: full emit readiness. -/
example : emitPlanReady = true := by decide
example : emitPlanOk = true := by decide

/-- EMIT-PLAN-PRODUCT-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitPlanReady_true : emitPlanReady = true := by decide

end SystemsLean.EmitPlan
"#

end SystemsLean.HostFrontLiveEmitPlanScaffold
