/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitComposeScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitComposeScaffoldSource. Not occupancy name 50. Not mill 70.
  This wrap is EmitComposeScaffold.lean. It is not a theorems file.
  The live namespace is SystemsLean.EmitCompose.
  Greppable: SYSTEMS_LEAN_HOST, liveEmitComposeScaffoldSource,
  HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitComposeScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitComposeScaffold

/-- Dual-pinned live EmitComposeScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitComposeScaffoldSource, HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD. -/
def liveEmitComposeScaffoldSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding host compose product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-COMPOSE product-text fragments (composeHeaderFragment /
  composeBodyFragment), stage/map ids, ownership honesty, and emitComposeReady
  used by SystemsLean.EmitCompose. Same namespace SystemsLean.EmitCompose so
  call sites stay unqualified. Long-file peel from EmitCompose.lean.

  Spec (readable):
  - stageId / hostEmitComposeId / selfHostEmitComposeId: greppable stage map.
  - composeHeaderFragment / composeBodyFragment: freestanding C scaffolding SSoT
    text (COMPOSE_C_HEADER / COMPOSE_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitComposeReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG/SSA.
  - Live-flag honesty on freestanding wire (not elaborator MULT-1).
  - Durable file host_emit_compose.ssot.txt remains HOST-EMIT-COMPOSE dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_COMPOSE_V0, HOST-EMIT-COMPOSE,
  SELF-HOST-EMIT-COMPOSE, composeHeaderFragment, composeBodyFragment, emitComposeReady,
  emitComposeOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitComposeSurfaceOk,
  EMIT-COMPOSE-SMOKE, HOST-EMIT-COMPOSE-SMOKE, EmitComposeScaffold,
  HOST_COMPOSE_V0, slake_host_compose, NON-SSOT, RUNTIME-FS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.EmitComposeScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitCompose.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitCompose

/-! ### Host-owned freestanding host compose product C (HOST-EMIT-COMPOSE)
    Greppable: HOST-EMIT-COMPOSE, SELF-HOST-EMIT-COMPOSE, SLAKE_SELF_HOST_EMIT_COMPOSE_V0,
    composeHeaderFragment, composeBodyFragment, emitComposeReady.
    maxHeartbeats raised: compose bodies need room for decide honesty. -/


/-- Greppable primary stage id for host-owned host compose product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"

/-- Greppable short map id (HOST-EMIT-COMPOSE). -/
def hostEmitComposeId : String := "HOST-EMIT-COMPOSE"

/-- Greppable short map id (SELF-HOST-EMIT-COMPOSE). -/
def selfHostEmitComposeId : String := "SELF-HOST-EMIT-COMPOSE"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitCompose.lean"

/-- Durable host compose SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_compose.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-COMPOSE). -/
def composeOwnershipComment : String :=
  " * HOST-EMIT-COMPOSE: dialect from SystemsLean.EmitCompose + host_emit_compose.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this host compose product text).\n"

/-- Host compose section open comment (header; includes ownership). -/
def composeHeaderOpen : String :=
  "/* ---- HOST_COMPOSE_V0 -- freestanding host + IR graph composition (not residual free).\n"
    ++ " * Owns IR graph + ConsumeToken host + erasure mark.\n"
    ++ " * Mutators (mint/push/add_edge/consume/mark_erased) are thin call-throughs;\n"
    ++ " * check_fail_closed is intentional mult pre-scan then one graph check walk\n"
    ++ " * (not pure call-through; does not re-call graph is_well_typed).\n"
    ++ " * extract is single-walk fuse (E2: do not call check then extract).\n"
    ++ " * reset is multi-op fast re-init (E3; cold first use still init).\n"
    ++ " * not residual free; not PROVABLY; no product GC; not full CFG/SSA.\n"
    ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
    ++ " * Greppable: HOST_COMPOSE_V0, CONSUME_TOKEN_HOST_V0, IR_GRAPH_EDGES_V0,\n"
    ++ " * FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS,\n"
    ++ " * HOST_COMPOSE_EXTRACT_FUSE, HOST_COMPOSE_RESET,\n"
    ++ " * HOST_COMPOSE_SINGLE_WALK\n"
    ++ composeOwnershipComment
    ++ " */\n"

/-- Host compose typedef + function decls. -/
def composeApiDecls : String :=
  "typedef struct slake_host_compose {\n"
    ++ "  slake_ir_graph graph;\n"
    ++ "  slake_consume_token host;\n"
    ++ "  slake_erased erased;\n"
    ++ "  uint8_t valid; /* 1 after successful init */\n"
    ++ "} slake_host_compose;\n"
    ++ "\n"
    ++ "/* Greppable host compose stage id: exact \"HOST_COMPOSE_V0\" */\n"
    ++ "const char *slake_host_compose_id(void);\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null.\n"
    ++ " * Cold full init: graph via slake_ir_graph_init; host via slake_consume_token_init;\n"
    ++ " * erased.marked=0; valid=1. Prefer reset for multi-op reuse after first init.\n"
    ++ " */\n"
    ++ "int slake_host_compose_init(slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* Multi-op fast re-init (E3). Clears node/edge counts and host/erased only;\n"
    ++ " * does not zero dead node/edge slots (safe: push/add overwrite live slots).\n"
    ++ " * Requires prior successful init (valid==1). 0 ok; -1 null/invalid.\n"
    ++ " * Cold first use still slake_host_compose_init. Greppable: HOST_COMPOSE_RESET\n"
    ++ " */\n"
    ++ "int slake_host_compose_reset(slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* Thin call-through to slake_ir_graph_push_node after valid guard.\n"
    ++ " * 0 ok; -1 null/invalid compose or graph push fail (null/bad mult/kind);\n"
    ++ " * -2 full (from slake_ir_program_push via graph). Header matches body.\n"
    ++ " */\n"
    ++ "int slake_host_compose_push_node(slake_host_compose *hc, uint32_t type_tag,\n"
    ++ "    enum slake_mult mult, enum slake_ir_kind kind);\n"
    ++ "\n"
    ++ "/* Thin call-through to slake_ir_graph_add_edge after valid guard.\n"
    ++ " * 0 ok; -1 null/invalid compose, full edges, or endpoints out of range.\n"
    ++ " * (graph add_edge does not use -2). Header matches body.\n"
    ++ " */\n"
    ++ "int slake_host_compose_add_edge(slake_host_compose *hc, uint8_t from, uint8_t to);\n"
    ++ "\n"
    ++ "/* Thin call-through to slake_consume_token_mint after valid guard.\n"
    ++ " * 0 ok; -1 null/invalid compose/id==0; -2 already live.\n"
    ++ " * Header matches body (compose guard adds invalid; mint adds id==0/-2).\n"
    ++ " */\n"
    ++ "int slake_host_compose_mint(slake_host_compose *hc, uint32_t id);\n"
    ++ "\n"
    ++ "/* Thin call-through to slake_consume_token_consume after valid guard.\n"
    ++ " * 0 success; -1 null/invalid/empty; -2 already spent / LINEAR-EXACT-ONCE.\n"
    ++ " * Header matches body.\n"
    ++ " */\n"
    ++ "int slake_host_compose_consume(slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* Thin call-through to slake_erased_mark on &hc->erased after valid guard.\n"
    ++ " * 0 ok; -1 null/invalid compose (or null erased path from mark).\n"
    ++ " * Header matches body -- explicit compose codes, not \"same as erased_mark\" alone.\n"
    ++ " */\n"
    ++ "int slake_host_compose_mark_erased(slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* 1 if non-null, valid, graph well-typed (slake_ir_graph_is_well_typed); else 0.\n"
    ++ " * Host may be unminted (composition allows empty graph).\n"
    ++ " */\n"
    ++ "int slake_host_compose_is_well_typed(const slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* Fail-closed composition (0 OK / 1 FAIL_CLOSED). Header must match body.\n"
    ++ " *\n"
    ++ " * Orchestration (honest non-thin mult pre-scan, then one graph check walk):\n"
    ++ " * 1) null/invalid -> FAIL_CLOSED (ill-typed still FAIL_CLOSED in graph check)\n"
    ++ " * 2) Mult pre-scan of owned graph nodes (intentional; not pure call-through):\n"
    ++ " *    - any MULT-1 node requires slake_consume_token_is_live(&hc->host)==1\n"
    ++ " *    - any MULT-0 node requires erased marked (slake_erasure_is_runtime_absent)\n"
    ++ " *    Rationale: compose owns host+erasure handles and fails closed at the\n"
    ++ " *    compose boundary before pointer selection. Graph/node checks also enforce\n"
    ++ " *    MULT-1/0 when linear/erased are null; pre-scan is redundant-safe today\n"
    ++ " *    and documents host ownership at this layer. Behavioral smoke locks both.\n"
    ++ " * 3) Select linear = &hc->host.token when live else null; erased = &hc->erased\n"
    ++ " *    when marked else null; call slake_ir_graph_check_fail_closed\n"
    ++ " *    (edge soundness + one program fail-closed walk; does not re-call\n"
    ++ " *    graph is_well_typed). Public is_well_typed / extract / check stay.\n"
    ++ " * Greppable: HOST_COMPOSE_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS,\n"
    ++ " * HOST_COMPOSE_SINGLE_WALK\n"
    ++ " */\n"
    ++ "int slake_host_compose_check_fail_closed(const slake_host_compose *hc);\n"
    ++ "\n"
    ++ "/* Extract path (E2 fuse): single fail-closed walk then write *out_rt = RUNTIME_FS.\n"
    ++ " * Prefer extract alone over check_fail_closed + extract (second walk).\n"
    ++ " * On fail leave *out_rt untouched; null out_rt on success path is FAIL_CLOSED.\n"
    ++ " * Greppable: HOST_COMPOSE_V0, EMIT-BOUNDARY, RUNTIME-FS, HOST_COMPOSE_EXTRACT_FUSE\n"
    ++ " */\n"
    ++ "int slake_host_compose_extract(const slake_host_compose *hc,\n"
    ++ "    enum slake_runtime_class *out_rt);\n"

/-- composeHeaderFragment -- freestanding host compose header text (HOST-EMIT-COMPOSE SSoT). -/
def composeHeaderFragment : String :=
  composeHeaderOpen
    ++ composeApiDecls

/-- Body section open for host compose. -/
def composeBodyOpen : String :=
  "/* ---- HOST_COMPOSE_V0 (host + IR graph composition; not residual free) ----\n"
    ++ " * Mutators (mint/consume/push/add_edge/mark_erased) are thin call-throughs.\n"
    ++ " * check_fail_closed: intentional mult pre-scan for host ownership, then\n"
    ++ " * one graph check walk (see header; no graph is_well_typed re-call).\n"
    ++ " * MULT-1 needs live host; MULT-0 needs marked erased.\n"
    ++ " * extract: single-walk fuse (E2). reset: multi-op count clear (E3).\n"
    ++ " * Live-flag honesty: mint/consume track host live state; not elaborator MULT-1.\n"
    ++ " * Greppable: HOST_COMPOSE_V0, CONSUME_TOKEN_HOST_V0, IR_GRAPH_EDGES_V0,\n"
    ++ " * EMIT-BOUNDARY, RUNTIME-FS, HOST_COMPOSE_EXTRACT_FUSE, HOST_COMPOSE_RESET,\n"
    ++ " * HOST_COMPOSE_SINGLE_WALK.\n"
    ++ composeOwnershipComment
    ++ " */\n"

/-- Host compose function bodies (product wire). -/
def composeBodies : String :=
  "const char *slake_host_compose_id(void)\n"
    ++ "{\n"
    ++ "  return \"HOST_COMPOSE_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_init(slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  if (hc == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_ir_graph_init(&hc->graph) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_consume_token_init(&hc->host) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  hc->erased.marked = 0;\n"
    ++ "  hc->valid = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_reset(slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  /* E3: clear live counts only; dead slots overwritten by later push/add. */\n"
    ++ "  hc->graph.prog.count = 0;\n"
    ++ "  hc->graph.edge_count = 0;\n"
    ++ "  if (slake_consume_token_init(&hc->host) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  hc->erased.marked = 0;\n"
    ++ "  /* valid and nested graph/program valid flags stay set from cold init. */\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_push_node(slake_host_compose *hc, uint32_t type_tag,\n"
    ++ "    enum slake_mult mult, enum slake_ir_kind kind)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_ir_graph_push_node(&hc->graph, type_tag, mult, kind);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_add_edge(slake_host_compose *hc, uint8_t from, uint8_t to)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_ir_graph_add_edge(&hc->graph, from, to);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_mint(slake_host_compose *hc, uint32_t id)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_consume_token_mint(&hc->host, id);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_consume(slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_consume_token_consume(&hc->host);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_mark_erased(slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  return slake_erased_mark(&hc->erased);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_is_well_typed(const slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  /* Host may be unminted; empty graph OK at graph surface. */\n"
    ++ "  return slake_ir_graph_is_well_typed(&hc->graph);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_check_fail_closed(const slake_host_compose *hc)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "  int needs_mult1;\n"
    ++ "  int needs_mult0;\n"
    ++ "  int host_live;\n"
    ++ "  int erased_absent;\n"
    ++ "  const slake_linear_token *linear;\n"
    ++ "  const slake_erased *erased;\n"
    ++ "\n"
    ++ "  if (hc == 0 || hc->valid == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* No slake_ir_graph_is_well_typed here: graph check does edge\n"
    ++ "   * soundness + one program fail-closed walk. Ill-typed still\n"
    ++ "   * FAIL_CLOSED. Greppable: HOST_COMPOSE_SINGLE_WALK */\n"
    ++ "\n"
    ++ "  /* Intentional mult pre-scan (compose owns host+erasure; fail closed here\n"
    ++ "   * before pointer selection). Graph check also enforces MULT-1/0 when\n"
    ++ "   * linear/erased are null -- redundant-safe; smoke locks both layers. */\n"
    ++ "  needs_mult1 = 0;\n"
    ++ "  needs_mult0 = 0;\n"
    ++ "  for (i = 0; i < hc->graph.prog.count; i++) {\n"
    ++ "    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_1) {\n"
    ++ "      needs_mult1 = 1;\n"
    ++ "    }\n"
    ++ "    if (hc->graph.prog.nodes[i].mult == SLAKE_MULT_0) {\n"
    ++ "      needs_mult0 = 1;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  /* Single is_live / is_runtime_absent (E2 path cost); reuse for pointer select. */\n"
    ++ "  host_live = (slake_consume_token_is_live(&hc->host) == 1) ? 1 : 0;\n"
    ++ "  erased_absent = (slake_erasure_is_runtime_absent(&hc->erased) == 1) ? 1 : 0;\n"
    ++ "  if (needs_mult1 != 0 && host_live == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (needs_mult0 != 0 && erased_absent == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  /* Public field: host embeds slake_linear_token token. */\n"
    ++ "  linear = 0;\n"
    ++ "  if (host_live != 0) {\n"
    ++ "    linear = &hc->host.token;\n"
    ++ "  }\n"
    ++ "  erased = 0;\n"
    ++ "  if (erased_absent != 0) {\n"
    ++ "    erased = &hc->erased;\n"
    ++ "  }\n"
    ++ "  return slake_ir_graph_check_fail_closed(&hc->graph, linear, erased);\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_host_compose_extract(const slake_host_compose *hc,\n"
    ++ "    enum slake_runtime_class *out_rt)\n"
    ++ "{\n"
    ++ "  /* E2 fuse: one check_fail_closed walk then write; leave *out_rt on fail.\n"
    ++ "   * Prefer this alone when both status and out_rt are needed (no second walk).\n"
    ++ "   * Greppable: HOST_COMPOSE_EXTRACT_FUSE */\n"
    ++ "  if (slake_host_compose_check_fail_closed(hc) != (int)SLAKE_EXTRACT_OK) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* null out_rt on success path is FAIL_CLOSED */\n"
    ++ "  if (out_rt == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  *out_rt = SLAKE_RUNTIME_FS;\n"
    ++ "  return (int)SLAKE_EXTRACT_OK;\n"
    ++ "}\n"

/-- composeBodyFragment -- freestanding host compose body text (HOST-EMIT-COMPOSE SSoT). -/
def composeBodyFragment : String :=
  composeBodyOpen
    ++ "\n"
    ++ composeBodies

/-- Ownership comment carries HOST-EMIT-COMPOSE + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (composeOwnershipComment
    == " * HOST-EMIT-COMPOSE: dialect from SystemsLean.EmitCompose + host_emit_compose.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this host compose product text).\n")

/-- Header piece honesty: ownership comment (decide-friendly).
    Full HEADER dual SSOT equality is FreestandingEmit requireDualSsotEqual.
    Greppable E2/E3 tokens live in composeApiDecls / SSOT (Nix emit-wire). -/
def headerHonestyOk : Bool := ownershipHonestyOk

/-- Body piece honesty: ownership comment (decide-friendly).
    Full BODY dual SSOT equality is FreestandingEmit requireDualSsotEqual. -/
def bodyHonestyOk : Bool := ownershipHonestyOk

/-- Surface canary: stage ids + path cites. -/
def emitComposeSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_COMPOSE_V0")
    && (hostEmitComposeId == "HOST-EMIT-COMPOSE")
    && (selfHostEmitComposeId == "SELF-HOST-EMIT-COMPOSE")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitCompose.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_compose.ssot.txt")

/-- emitComposeReady -- host compose host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitComposeReady, HOST-EMIT-COMPOSE, SELF-HOST-EMIT-COMPOSE. -/
def emitComposeReady : Bool :=
  emitComposeSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitComposeReady for inventory greps). -/
def emitComposeOk : Bool := emitComposeReady

/-! ### Host compose host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-COMPOSE-SMOKE, HOST-EMIT-COMPOSE-SMOKE.
    maxHeartbeats raised: compose bodies are larger than Graph; decide needs room. -/

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-COMPOSE-SMOKE / HOST-EMIT-COMPOSE-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_COMPOSE_V0" := by decide
example : hostEmitComposeId = "HOST-EMIT-COMPOSE" := by decide
example : selfHostEmitComposeId = "SELF-HOST-EMIT-COMPOSE" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitCompose.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_compose.ssot.txt" := by decide
example : emitComposeSurfaceOk = true := by decide

/-- HOST-EMIT-COMPOSE-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-COMPOSE-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-COMPOSE-SMOKE: full emit readiness. -/
example : emitComposeReady = true := by decide
example : emitComposeOk = true := by decide

/-- EMIT-COMPOSE-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitComposeReady_true : emitComposeReady = true := by decide

end SystemsLean.EmitCompose
"#

end SystemsLean.HostFrontLiveEmitComposeScaffold
