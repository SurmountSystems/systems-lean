/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitTypesScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitTypesScaffoldSource. Not occupancy name 50. Not mill 70.
  This wrap parses EmitTypesScaffold.lean.
  HostFrontLiveEmitTypes does not exist; needles use trailing newline
  so that name is not a prefix hit.
  Occupancy leftover HostModuleCheckEmitTypesScaffoldTerm is not this wrap.
  Unique needles (trailing newline so HostFrontLiveEmitTypes is not a prefix):
  HostFrontLiveEmitTypesScaffoldSource
  PARSE-LIVE-EMIT-TYPES-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-TYPES-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, liveEmitTypesScaffoldSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitTypesScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitTypesScaffold

/-- Dual-pinned live EmitTypesScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitTypesScaffoldSource, PARSE-LIVE-EMIT-TYPES-SCAFFOLD. -/
def liveEmitTypesScaffoldSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding Types product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-TYPES product-text fragments (typesHeaderFragment /
  typesBodyFragment), stage/map ids, ownership honesty, and emitTypesReady
  used by SystemsLean.EmitTypes. Same namespace SystemsLean.EmitTypes so
  call sites stay unqualified. Long-file peel from EmitTypes.lean.

  Spec (readable):
  - stageId / hostEmitTypesId / selfHostEmitTypesId: greppable stage map.
  - typesHeaderFragment / typesBodyFragment: freestanding C scaffolding SSoT
    text (TYPES_C_HEADER / TYPES_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitTypesReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / type checker.
  - Durable file host_emit_types.ssot.txt remains HOST-EMIT-TYPES dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_TYPES_V0, HOST-EMIT-TYPES,
  SELF-HOST-EMIT-TYPES, typesHeaderFragment, typesBodyFragment, emitTypesReady,
  emitTypesOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitTypesSurfaceOk,
  EMIT-TYPES-SMOKE, HOST-EMIT-TYPES-SMOKE, EmitTypesScaffold,
  TYPED_IR_V0, COMMON-UNIVERSE, slake_type_tag, slake_ir_node, NON-SSOT, RUNTIME-FS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.EmitTypesScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitTypes.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitTypes

/-! ### Host-owned freestanding Types product C (HOST-EMIT-TYPES)
    Greppable: HOST-EMIT-TYPES, SELF-HOST-EMIT-TYPES, SLAKE_SELF_HOST_EMIT_TYPES_V0,
    typesHeaderFragment, typesBodyFragment, emitTypesReady.
    maxHeartbeats raised: types bodies need room for decide honesty. -/

/-- Greppable primary stage id for host-owned Types product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_TYPES_V0"

/-- Greppable short map id (HOST-EMIT-TYPES). -/
def hostEmitTypesId : String := "HOST-EMIT-TYPES"

/-- Greppable short map id (SELF-HOST-EMIT-TYPES). -/
def selfHostEmitTypesId : String := "SELF-HOST-EMIT-TYPES"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitTypes.lean"

/-- Durable Types SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_types.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-TYPES). -/
def typesOwnershipComment : String :=
  " * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this Types product text).\n"

/-- Types section open comment (header; includes ownership). -/
def typesHeaderOpen : String :=
  "/* ---- Types (Types.slake / COMMON-UNIVERSE) ----\n"
    ++ " * Host elaborator residual is not product wire residual.\n"
    ++ " * Opaque tag only; no type checker body.\n"
    ++ typesOwnershipComment
    ++ " */\n"

/-- type_tag typedef + decls. -/
def typesTagDecls : String :=
  "typedef struct slake_type_tag {\n"
    ++ "  uint32_t tag;\n"
    ++ "} slake_type_tag;\n"
    ++ "\n"
    ++ "int slake_type_tag_init(slake_type_tag *t, uint32_t tag);\n"
    ++ "uint32_t slake_type_tag_get(const slake_type_tag *t);\n"

/-- TYPED_IR section open (header; includes ownership). -/
def typedIrHeaderOpen : String :=
  "/* ---- TYPED_IR_V0 -- richer typed IR surface behind checker/host.\n"
    ++ " * COMMON-UNIVERSE; not residual free; not full elaborator.\n"
    ++ " * Kind must match mult:\n"
    ++ " *   VALUE  <-> MULT-OMEGA\n"
    ++ " *   LINEAR <-> MULT-1\n"
    ++ " *   ERASED <-> MULT-0\n"
    ++ typesOwnershipComment
    ++ " */\n"

/-- TYPED_IR enum + slake_ir_node + function decls. -/
def typedIrApiDecls : String :=
  "enum slake_ir_kind {\n"
    ++ "  SLAKE_IR_KIND_VALUE = 0,   /* pairs with MULT-OMEGA */\n"
    ++ "  SLAKE_IR_KIND_LINEAR = 1,  /* pairs with MULT-1 */\n"
    ++ "  SLAKE_IR_KIND_ERASED = 2   /* pairs with MULT-0 */\n"
    ++ "};\n"
    ++ "\n"
    ++ "typedef struct slake_ir_node {\n"
    ++ "  slake_type_tag ty;\n"
    ++ "  enum slake_mult mult;\n"
    ++ "  enum slake_ir_kind kind;\n"
    ++ "  uint8_t valid; /* 1 after successful init */\n"
    ++ "} slake_ir_node;\n"
    ++ "\n"
    ++ "/* Greppable typed IR stage id: TYPED_IR_V0 */\n"
    ++ "const char *slake_typed_ir_id(void);\n"
    ++ "\n"
    ++ "/* 0 ok; -1 null or invalid mult/kind pairing or type init fail.\n"
    ++ " * Kind must match mult (VALUE/OMEGA, LINEAR/1, ERASED/0).\n"
    ++ " * On failure leave node invalid (valid=0) if non-null.\n"
    ++ " * Document codes matching body exactly.\n"
    ++ " */\n"
    ++ "int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,\n"
    ++ "                       enum slake_mult mult, enum slake_ir_kind kind);\n"
    ++ "\n"
    ++ "/* 1 if non-null, valid flag set, mult valid, kind matches mult; else 0 */\n"
    ++ "int slake_ir_node_is_well_typed(const slake_ir_node *n);\n"
    ++ "\n"
    ++ "/* Compose FAIL_CLOSED_CHECKER_V1 from IR node.\n"
    ++ " * MULT-1 requires non-null live linear; MULT-0 requires marked erased;\n"
    ++ " * MULT-OMEGA linear/erased may be null; claimed_runtime always RUNTIME_FS.\n"
    ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
    ++ " * Greppable: TYPED_IR_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS\n"
    ++ " */\n"
    ++ "int slake_ir_node_check_fail_closed(const slake_ir_node *n,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased);\n"

/-- typesHeaderFragment -- freestanding Types header text (HOST-EMIT-TYPES SSoT). -/
def typesHeaderFragment : String :=
  typesHeaderOpen
    ++ typesTagDecls
    ++ "\n"
    ++ typedIrHeaderOpen
    ++ typedIrApiDecls

/-- Body section open for Types (type_tag + TYPED_IR). -/
def typesBodyOpen : String :=
  "/* ---- Types (COMMON-UNIVERSE / TYPED_IR_V0) ----\n"
    ++ typesOwnershipComment
    ++ " */\n"

/-- type_tag function bodies. -/
def typesTagBodies : String :=
  "int slake_type_tag_init(slake_type_tag *t, uint32_t tag)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  t->tag = tag;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "uint32_t slake_type_tag_get(const slake_type_tag *t)\n"
    ++ "{\n"
    ++ "  if (t == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return t->tag;\n"
    ++ "}\n"

/-- TYPED_IR body open comment. -/
def typedIrBodyOpen : String :=
  "/* ---- TYPED_IR_V0 (richer typed IR; not residual free; not full elaborator) ----\n"
    ++ " * Kind/mult pairing fail-closed. Composes FAIL_CLOSED_CHECKER_V1 on check path.\n"
    ++ typesOwnershipComment
    ++ " */\n"

/-- TYPED_IR function bodies (product wire). -/
def typedIrBodies : String :=
  "const char *slake_typed_ir_id(void)\n"
    ++ "{\n"
    ++ "  return \"TYPED_IR_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Internal: 1 if kind pairs with mult under TYPED_IR_V0 rules; 0 otherwise. */\n"
    ++ "static int slake_ir_kind_matches_mult(enum slake_ir_kind kind, enum slake_mult mult)\n"
    ++ "{\n"
    ++ "  if (mult == SLAKE_MULT_OMEGA && kind == SLAKE_IR_KIND_VALUE) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (mult == SLAKE_MULT_1 && kind == SLAKE_IR_KIND_LINEAR) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  if (mult == SLAKE_MULT_0 && kind == SLAKE_IR_KIND_ERASED) {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,\n"
    ++ "                       enum slake_mult mult, enum slake_ir_kind kind)\n"
    ++ "{\n"
    ++ "  if (n == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  /* Fail closed first; leave invalid on any reject path. */\n"
    ++ "  n->valid = 0;\n"
    ++ "  n->mult = mult;\n"
    ++ "  n->kind = kind;\n"
    ++ "  n->ty.tag = 0;\n"
    ++ "  if (slake_mult_is_valid(mult) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_ir_kind_matches_mult(kind, mult) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_type_tag_init(&n->ty, type_tag) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  n->valid = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_node_is_well_typed(const slake_ir_node *n)\n"
    ++ "{\n"
    ++ "  if (n == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (n->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (slake_mult_is_valid(n->mult) != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (slake_ir_kind_matches_mult(n->kind, n->mult) != 1) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_ir_node_check_fail_closed(const slake_ir_node *n,\n"
    ++ "    const slake_linear_token *linear,\n"
    ++ "    const slake_erased *erased)\n"
    ++ "{\n"
    ++ "  slake_check_bundle b;\n"
    ++ "\n"
    ++ "  /* Well-typed IR required before composing FAIL_CLOSED_CHECKER_V1. */\n"
    ++ "  if (slake_ir_node_is_well_typed(n) != 1) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  b.mult = n->mult;\n"
    ++ "  b.linear = linear;\n"
    ++ "  b.erased = erased;\n"
    ++ "  b.claimed_runtime = SLAKE_RUNTIME_FS; /* product path always RUNTIME-FS */\n"
    ++ "  return slake_check_fail_closed(&b);\n"
    ++ "}\n"

/-- typesBodyFragment -- freestanding Types body text (HOST-EMIT-TYPES SSoT). -/
def typesBodyFragment : String :=
  typesBodyOpen
    ++ "\n"
    ++ typesTagBodies
    ++ "\n"
    ++ typedIrBodyOpen
    ++ "\n"
    ++ typedIrBodies

/-- Ownership comment carries HOST-EMIT-TYPES + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (typesOwnershipComment
    == " * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this Types product text).\n")

/-- Header piece honesty: type_tag + TYPED_IR decls + ownership. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && (typesTagDecls
      == "typedef struct slake_type_tag {\n"
        ++ "  uint32_t tag;\n"
        ++ "} slake_type_tag;\n"
        ++ "\n"
        ++ "int slake_type_tag_init(slake_type_tag *t, uint32_t tag);\n"
        ++ "uint32_t slake_type_tag_get(const slake_type_tag *t);\n")
    && (typedIrApiDecls
      == "enum slake_ir_kind {\n"
        ++ "  SLAKE_IR_KIND_VALUE = 0,   /* pairs with MULT-OMEGA */\n"
        ++ "  SLAKE_IR_KIND_LINEAR = 1,  /* pairs with MULT-1 */\n"
        ++ "  SLAKE_IR_KIND_ERASED = 2   /* pairs with MULT-0 */\n"
        ++ "};\n"
        ++ "\n"
        ++ "typedef struct slake_ir_node {\n"
        ++ "  slake_type_tag ty;\n"
        ++ "  enum slake_mult mult;\n"
        ++ "  enum slake_ir_kind kind;\n"
        ++ "  uint8_t valid; /* 1 after successful init */\n"
        ++ "} slake_ir_node;\n"
        ++ "\n"
        ++ "/* Greppable typed IR stage id: TYPED_IR_V0 */\n"
        ++ "const char *slake_typed_ir_id(void);\n"
        ++ "\n"
        ++ "/* 0 ok; -1 null or invalid mult/kind pairing or type init fail.\n"
        ++ " * Kind must match mult (VALUE/OMEGA, LINEAR/1, ERASED/0).\n"
        ++ " * On failure leave node invalid (valid=0) if non-null.\n"
        ++ " * Document codes matching body exactly.\n"
        ++ " */\n"
        ++ "int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,\n"
        ++ "                       enum slake_mult mult, enum slake_ir_kind kind);\n"
        ++ "\n"
        ++ "/* 1 if non-null, valid flag set, mult valid, kind matches mult; else 0 */\n"
        ++ "int slake_ir_node_is_well_typed(const slake_ir_node *n);\n"
        ++ "\n"
        ++ "/* Compose FAIL_CLOSED_CHECKER_V1 from IR node.\n"
        ++ " * MULT-1 requires non-null live linear; MULT-0 requires marked erased;\n"
        ++ " * MULT-OMEGA linear/erased may be null; claimed_runtime always RUNTIME_FS.\n"
        ++ " * Returns SLAKE_EXTRACT_OK (0) or FAIL_CLOSED (1). Header must match body.\n"
        ++ " * Greppable: TYPED_IR_V0, FAIL_CLOSED_CHECKER_V1, RUNTIME-FS\n"
        ++ " */\n"
        ++ "int slake_ir_node_check_fail_closed(const slake_ir_node *n,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased);\n")

/-- Body piece honesty: type_tag + TYPED_IR function bodies. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && (typesTagBodies
      == "int slake_type_tag_init(slake_type_tag *t, uint32_t tag)\n"
        ++ "{\n"
        ++ "  if (t == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  t->tag = tag;\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "uint32_t slake_type_tag_get(const slake_type_tag *t)\n"
        ++ "{\n"
        ++ "  if (t == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return t->tag;\n"
        ++ "}\n")
    && (typedIrBodies
      == "const char *slake_typed_ir_id(void)\n"
        ++ "{\n"
        ++ "  return \"TYPED_IR_V0\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "/* Internal: 1 if kind pairs with mult under TYPED_IR_V0 rules; 0 otherwise. */\n"
        ++ "static int slake_ir_kind_matches_mult(enum slake_ir_kind kind, enum slake_mult mult)\n"
        ++ "{\n"
        ++ "  if (mult == SLAKE_MULT_OMEGA && kind == SLAKE_IR_KIND_VALUE) {\n"
        ++ "    return 1;\n"
        ++ "  }\n"
        ++ "  if (mult == SLAKE_MULT_1 && kind == SLAKE_IR_KIND_LINEAR) {\n"
        ++ "    return 1;\n"
        ++ "  }\n"
        ++ "  if (mult == SLAKE_MULT_0 && kind == SLAKE_IR_KIND_ERASED) {\n"
        ++ "    return 1;\n"
        ++ "  }\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,\n"
        ++ "                       enum slake_mult mult, enum slake_ir_kind kind)\n"
        ++ "{\n"
        ++ "  if (n == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  /* Fail closed first; leave invalid on any reject path. */\n"
        ++ "  n->valid = 0;\n"
        ++ "  n->mult = mult;\n"
        ++ "  n->kind = kind;\n"
        ++ "  n->ty.tag = 0;\n"
        ++ "  if (slake_mult_is_valid(mult) != 1) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (slake_ir_kind_matches_mult(kind, mult) != 1) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  if (slake_type_tag_init(&n->ty, type_tag) != 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  n->valid = 1;\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_node_is_well_typed(const slake_ir_node *n)\n"
        ++ "{\n"
        ++ "  if (n == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (n->valid == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (slake_mult_is_valid(n->mult) != 1) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (slake_ir_kind_matches_mult(n->kind, n->mult) != 1) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_ir_node_check_fail_closed(const slake_ir_node *n,\n"
        ++ "    const slake_linear_token *linear,\n"
        ++ "    const slake_erased *erased)\n"
        ++ "{\n"
        ++ "  slake_check_bundle b;\n"
        ++ "\n"
        ++ "  /* Well-typed IR required before composing FAIL_CLOSED_CHECKER_V1. */\n"
        ++ "  if (slake_ir_node_is_well_typed(n) != 1) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  b.mult = n->mult;\n"
        ++ "  b.linear = linear;\n"
        ++ "  b.erased = erased;\n"
        ++ "  b.claimed_runtime = SLAKE_RUNTIME_FS; /* product path always RUNTIME-FS */\n"
        ++ "  return slake_check_fail_closed(&b);\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitTypesSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_TYPES_V0")
    && (hostEmitTypesId == "HOST-EMIT-TYPES")
    && (selfHostEmitTypesId == "SELF-HOST-EMIT-TYPES")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitTypes.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_types.ssot.txt")

/-- emitTypesReady -- Types host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitTypesReady, HOST-EMIT-TYPES, SELF-HOST-EMIT-TYPES. -/
def emitTypesReady : Bool :=
  emitTypesSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitTypesReady for inventory greps). -/
def emitTypesOk : Bool := emitTypesReady

/-! ### Types host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-TYPES-SMOKE, HOST-EMIT-TYPES-SMOKE. -/

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-TYPES-SMOKE / HOST-EMIT-TYPES-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_TYPES_V0" := by decide
example : hostEmitTypesId = "HOST-EMIT-TYPES" := by decide
example : selfHostEmitTypesId = "SELF-HOST-EMIT-TYPES" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitTypes.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_types.ssot.txt" := by decide
example : emitTypesSurfaceOk = true := by decide

/-- HOST-EMIT-TYPES-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-TYPES-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-TYPES-SMOKE: full emit readiness. -/
example : emitTypesReady = true := by decide
example : emitTypesOk = true := by decide

/-- EMIT-TYPES-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitTypesReady_true : emitTypesReady = true := by decide

end SystemsLean.EmitTypes
"#

end SystemsLean.HostFrontLiveEmitTypesScaffold
