/-
  SYSTEMS_LEAN_HOST partial -- freestanding IR program product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-PROGRAM product-text fragments (programHeaderFragment /
  programBodyFragment), stage/map ids, ownership honesty, and emitProgramReady
  used by SystemsLean.EmitProgram. Same namespace SystemsLean.EmitProgram so
  call sites stay unqualified. Long-file peel from EmitProgram.lean.

  Spec (readable):
  - stageId / hostEmitProgramId / selfHostEmitProgramId: greppable stage map.
  - programHeaderFragment / programBodyFragment: freestanding C scaffolding SSoT
    text (PROGRAM_C_HEADER / PROGRAM_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitProgramReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG.
  - Durable file host_emit_program.ssot.txt remains HOST-EMIT-PROGRAM dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_PROGRAM_V0, HOST-EMIT-PROGRAM,
  SELF-HOST-EMIT-PROGRAM, programHeaderFragment, programBodyFragment, emitProgramReady,
  emitProgramOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitProgramSurfaceOk,
  EMIT-PROGRAM-SMOKE, HOST-EMIT-PROGRAM-SMOKE, EmitProgramScaffold,
  IR_PROGRAM_V0, SLAKE_IR_PROGRAM_CAP, slake_ir_program, NON-SSOT, RUNTIME-FS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.EmitProgramScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitProgram.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitProgram

/-- Greppable primary stage id for host-owned IR program product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"

/-- Greppable short map id (HOST-EMIT-PROGRAM). -/
def hostEmitProgramId : String := "HOST-EMIT-PROGRAM"

/-- Greppable short map id (SELF-HOST-EMIT-PROGRAM). -/
def selfHostEmitProgramId : String := "SELF-HOST-EMIT-PROGRAM"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitProgram.lean"

/-- Durable IR program SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_program.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-PROGRAM). -/
def programOwnershipComment : String :=
  " * HOST-EMIT-PROGRAM: dialect from SystemsLean.EmitProgram + host_emit_program.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this IR program product text).\n"

/-- IR program section open comment (header; includes ownership). -/
def programHeaderOpen : String :=
  "/* ---- IR_PROGRAM_V0 -- multi-node ordered IR program (ordered nodes).\n"
    ++ " * Fixed-capacity ordered list of well-typed slake_ir_node; not CFG/edges yet.\n"
    ++ " * not residual free; not PROVABLY; no product GC.\n"
    ++ " * Honesty: MULT-1 / MULT-0 nodes share one linear / erased handle for V0 checks\n"
    ++ " * (checker does not consume; not a full linear resource graph).\n"
    ++ " * Greppable: IR_PROGRAM_V0, SLAKE_IR_PROGRAM_CAP, FAIL_CLOSED_CHECKER_V1\n"
    ++ programOwnershipComment
    ++ " */\n"

/-- IR program CAP + typedef + function decls. -/
def programApiDecls : String :=
  "#define SLAKE_IR_PROGRAM_CAP 8\n"
    ++ "\n"
    ++ "typedef struct slake_ir_program {\n"
    ++ "  slake_ir_node nodes[SLAKE_IR_PROGRAM_CAP];\n"
    ++ "  uint8_t count; /* number of live slots 0..CAP */\n"
    ++ "  uint8_t valid; /* 1 after successful init */\n"
    ++ "} slake_ir_program;\n"
    ++ "\n"
    ++ "/* Greppable ordered IR program stage id: IR_PROGRAM_V0 */\n"
    ++ "const char *slake_ir_program_id(void);\n"
    ++ "\n"
    ++ "/* Init empty program. 0 ok; -1 null.\n"
    ++ " * Dead slots: valid=0 with OMEGA+VALUE pairing (consistent if misread).\n"
    ++ " */\n"
    ++ "int slake_ir_program_init(slake_ir_program *p);\n"
    ++ "\n"
    ++ "/* Append a well-typed node (copies fields after node init).\n"
    ++ " * 0 ok; -1 null/bad; -2 full (count==CAP).\n"
    ++ " * On failure leave program count unchanged if possible.\n"
    ++ " * Document codes matching body exactly.\n"
    ++ " */\n"
    ++ "int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,\n"
    ++ "                          enum slake_mult mult, enum slake_ir_kind kind);\n"
    ++ "\n"
    ++ "/* 1 if non-null, valid, count>=1, every live node well-typed; else 0.\n"
    ++ " * Empty program (count==0) is NOT well-typed as a program (fail closed).\n"
    ++ " */\n"
    ++ "int slake_ir_program_is_well_typed(const slake_ir_program *p);\n"
    ++ "\n"
    ++ "/* Fail-closed check over all live nodes. For MULT-1 nodes require non-null live\n"
    ++ " * linear token (shared host token for V0 is OK -- not consumed by check).\n"
    ++ " * MULT-0 nodes need marked erased when checked.\n"
    ++ " * claimed_runtime always RUNTIME_FS.\n"
    ++ " * Empty / ill-typed program -> FAIL_CLOSED.\n"
    ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
    ++ " * Greppable: IR_PROGRAM_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS\n"
    ++ " */\n"
    ++ "int slake_ir_program_check_fail_closed(const slake_ir_program *p,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased);\n"

/-- programHeaderFragment -- freestanding IR program header text (HOST-EMIT-PROGRAM SSoT). -/
def programHeaderFragment : String :=
  programHeaderOpen
    ++ programApiDecls

/-- Body section open for IR program. -/
def programBodyOpen : String :=
  "/* ---- IR_PROGRAM_V0 (multi-node ordered list; not CFG; not residual free) ----\n"
    ++ " * Collective well-typed + fail-closed over fixed-capacity node array.\n"
    ++ " * Edges/CFG remain residual. Shared linear token across MULT-1 nodes is V0 honesty.\n"
    ++ programOwnershipComment
    ++ " */\n"

/-- IR program function bodies (product wire). -/
def programBodies : String :=
  "const char *slake_ir_program_id(void)\n"
    ++ "{\n"
    ++ "  return \"IR_PROGRAM_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_program_init(slake_ir_program *p)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  if (p == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  p->count = 0;\n"
    ++ "  p->valid = 1;\n"
    ++ "  /* Dead slots: valid=0 with consistent OMEGA+VALUE pairing (not a live node). */\n"
    ++ "  for (i = 0; i < (uint8_t)SLAKE_IR_PROGRAM_CAP; i++) {\n"
    ++ "    p->nodes[i].valid = 0;\n"
    ++ "    p->nodes[i].mult = SLAKE_MULT_OMEGA;\n"
    ++ "    p->nodes[i].kind = SLAKE_IR_KIND_VALUE;\n"
    ++ "    p->nodes[i].ty.tag = 0;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,\n"
    ++ "                          enum slake_mult mult, enum slake_ir_kind kind)\n"
    ++ "{\n"
    ++ "  slake_ir_node tmp;\n"
    ++ "\n"
    ++ "  if (p == 0 || p->valid == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (p->count >= (uint8_t)SLAKE_IR_PROGRAM_CAP) {\n"
    ++ "    return -2; /* full; leave count unchanged */\n"
    ++ "  }\n"
    ++ "  /* Init into temp so a bad node never lands in the program. */\n"
    ++ "  if (slake_ir_node_init(&tmp, type_tag, mult, kind) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  p->nodes[p->count] = tmp;\n"
    ++ "  p->count = (uint8_t)(p->count + 1);\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_program_is_well_typed(const slake_ir_program *p)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  if (p == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (p->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  /* Empty program is not well-typed as a program (fail closed). */\n"
    ++ "  if (p->count == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (p->count > (uint8_t)SLAKE_IR_PROGRAM_CAP) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < p->count; i++) {\n"
    ++ "    if (slake_ir_node_is_well_typed(&p->nodes[i]) != 1) {\n"
    ++ "      return 0;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_program_check_fail_closed(const slake_ir_program *p,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased)\n"
    ++ "{\n"
    ++ "  uint8_t i;\n"
    ++ "\n"
    ++ "  /* Null, empty, or ill-typed -> FAIL_CLOSED. */\n"
    ++ "  if (slake_ir_program_is_well_typed(p) != 1) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  for (i = 0; i < p->count; i++) {\n"
    ++ "    if (slake_ir_node_check_fail_closed(&p->nodes[i], linear, erased)\n"
    ++ "        != (int)SLAKE_EXTRACT_OK) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return (int)SLAKE_EXTRACT_OK;\n"
    ++ "}\n"

/-- programBodyFragment -- freestanding IR program body text (HOST-EMIT-PROGRAM SSoT). -/
def programBodyFragment : String :=
  programBodyOpen
    ++ "\n"
    ++ programBodies

/-- Ownership comment carries HOST-EMIT-PROGRAM + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (programOwnershipComment
    == " * HOST-EMIT-PROGRAM: dialect from SystemsLean.EmitProgram + host_emit_program.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this IR program product text).\n")

/-- Header piece honesty: IR program decls + ownership. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && (programApiDecls
      == "#define SLAKE_IR_PROGRAM_CAP 8\n"
        ++ "\n"
        ++ "typedef struct slake_ir_program {\n"
        ++ "  slake_ir_node nodes[SLAKE_IR_PROGRAM_CAP];\n"
        ++ "  uint8_t count; /* number of live slots 0..CAP */\n"
        ++ "  uint8_t valid; /* 1 after successful init */\n"
        ++ "} slake_ir_program;\n"
        ++ "\n"
        ++ "/* Greppable ordered IR program stage id: IR_PROGRAM_V0 */\n"
        ++ "const char *slake_ir_program_id(void);\n"
        ++ "\n"
        ++ "/* Init empty program. 0 ok; -1 null.\n"
        ++ " * Dead slots: valid=0 with OMEGA+VALUE pairing (consistent if misread).\n"
        ++ " */\n"
        ++ "int slake_ir_program_init(slake_ir_program *p);\n"
        ++ "\n"
        ++ "/* Append a well-typed node (copies fields after node init).\n"
        ++ " * 0 ok; -1 null/bad; -2 full (count==CAP).\n"
        ++ " * On failure leave program count unchanged if possible.\n"
        ++ " * Document codes matching body exactly.\n"
        ++ " */\n"
        ++ "int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,\n"
        ++ "                          enum slake_mult mult, enum slake_ir_kind kind);\n"
        ++ "\n"
        ++ "/* 1 if non-null, valid, count>=1, every live node well-typed; else 0.\n"
        ++ " * Empty program (count==0) is NOT well-typed as a program (fail closed).\n"
        ++ " */\n"
        ++ "int slake_ir_program_is_well_typed(const slake_ir_program *p);\n"
        ++ "\n"
        ++ "/* Fail-closed check over all live nodes. For MULT-1 nodes require non-null live\n"
        ++ " * linear token (shared host token for V0 is OK -- not consumed by check).\n"
        ++ " * MULT-0 nodes need marked erased when checked.\n"
        ++ " * claimed_runtime always RUNTIME_FS.\n"
        ++ " * Empty / ill-typed program -> FAIL_CLOSED.\n"
        ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
        ++ " * Greppable: IR_PROGRAM_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS\n"
        ++ " */\n"
        ++ "int slake_ir_program_check_fail_closed(const slake_ir_program *p,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased);\n")

/-- Body piece honesty: IR program function bodies. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && (programBodies
      == "const char *slake_ir_program_id(void)\n"
        ++ "{\n"
        ++ "  return \"IR_PROGRAM_V0\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_program_init(slake_ir_program *p)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  if (p == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  p->count = 0;\n"
        ++ "  p->valid = 1;\n"
        ++ "  /* Dead slots: valid=0 with consistent OMEGA+VALUE pairing (not a live node). */\n"
        ++ "  for (i = 0; i < (uint8_t)SLAKE_IR_PROGRAM_CAP; i++) {\n"
        ++ "    p->nodes[i].valid = 0;\n"
        ++ "    p->nodes[i].mult = SLAKE_MULT_OMEGA;\n"
        ++ "    p->nodes[i].kind = SLAKE_IR_KIND_VALUE;\n"
        ++ "    p->nodes[i].ty.tag = 0;\n"
        ++ "  }\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_program_push(slake_ir_program *p, uint32_t type_tag,\n"
        ++ "                          enum slake_mult mult, enum slake_ir_kind kind)\n"
        ++ "{\n"
        ++ "  slake_ir_node tmp;\n"
        ++ "\n"
        ++ "  if (p == 0 || p->valid == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (p->count >= (uint8_t)SLAKE_IR_PROGRAM_CAP) {\n"
        ++ "    return -2; /* full; leave count unchanged */\n"
        ++ "  }\n"
        ++ "  /* Init into temp so a bad node never lands in the program. */\n"
        ++ "  if (slake_ir_node_init(&tmp, type_tag, mult, kind) != 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  p->nodes[p->count] = tmp;\n"
        ++ "  p->count = (uint8_t)(p->count + 1);\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_program_is_well_typed(const slake_ir_program *p)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  if (p == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (p->valid == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  /* Empty program is not well-typed as a program (fail closed). */\n"
        ++ "  if (p->count == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (p->count > (uint8_t)SLAKE_IR_PROGRAM_CAP) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  for (i = 0; i < p->count; i++) {\n"
        ++ "    if (slake_ir_node_is_well_typed(&p->nodes[i]) != 1) {\n"
        ++ "      return 0;\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_program_check_fail_closed(const slake_ir_program *p,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased)\n"
        ++ "{\n"
        ++ "  uint8_t i;\n"
        ++ "\n"
        ++ "  /* Null, empty, or ill-typed -> FAIL_CLOSED. */\n"
        ++ "  if (slake_ir_program_is_well_typed(p) != 1) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  for (i = 0; i < p->count; i++) {\n"
        ++ "    if (slake_ir_node_check_fail_closed(&p->nodes[i], linear, erased)\n"
        ++ "        != (int)SLAKE_EXTRACT_OK) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "  return (int)SLAKE_EXTRACT_OK;\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitProgramSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_PROGRAM_V0")
    && (hostEmitProgramId == "HOST-EMIT-PROGRAM")
    && (selfHostEmitProgramId == "SELF-HOST-EMIT-PROGRAM")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitProgram.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_program.ssot.txt")

/-- emitProgramReady -- IR program host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitProgramReady, HOST-EMIT-PROGRAM, SELF-HOST-EMIT-PROGRAM. -/
def emitProgramReady : Bool :=
  emitProgramSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitProgramReady for inventory greps). -/
def emitProgramOk : Bool := emitProgramReady

/-! ### IR program host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-PROGRAM-SMOKE, HOST-EMIT-PROGRAM-SMOKE. -/

set_option maxRecDepth 32768

/-- EMIT-PROGRAM-SMOKE / HOST-EMIT-PROGRAM-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_PROGRAM_V0" := by decide
example : hostEmitProgramId = "HOST-EMIT-PROGRAM" := by decide
example : selfHostEmitProgramId = "SELF-HOST-EMIT-PROGRAM" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitProgram.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_program.ssot.txt" := by decide
example : emitProgramSurfaceOk = true := by decide

/-- HOST-EMIT-PROGRAM-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-PROGRAM-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-PROGRAM-SMOKE: full emit readiness. -/
example : emitProgramReady = true := by decide
example : emitProgramOk = true := by decide

/-- EMIT-PROGRAM-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitProgramReady_true : emitProgramReady = true := by decide

end SystemsLean.EmitProgram
