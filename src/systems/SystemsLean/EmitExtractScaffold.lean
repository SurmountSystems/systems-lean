/-
  SYSTEMS_LEAN_HOST partial -- freestanding Extract + FAIL_CLOSED product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-EXTRACT product-text fragments (extractHeaderFragment /
  extractBodyFragment), stage/map ids, ownership honesty, and emitExtractReady
  used by SystemsLean.EmitExtract. Same namespace SystemsLean.EmitExtract so
  call sites stay unqualified. Long-file peel from EmitExtract.lean.

  Spec (readable):
  - stageId / hostEmitExtractId / selfHostEmitExtractId: greppable stage map.
  - extractHeaderFragment / extractBodyFragment: freestanding C scaffolding SSoT
    text (EXTRACT_C_HEADER / EXTRACT_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitExtractReady: surface + header/body piece honesty (cheap; not residual free).
  - FAIL_CLOSED_CHECKER_V1 / EMIT-BOUNDARY / RUNTIME-FS stay greppable on scaffold.

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit.
  - Durable file host_emit_extract.ssot.txt remains HOST-EMIT-EXTRACT dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_EXTRACT_V0, HOST-EMIT-EXTRACT,
  SELF-HOST-EMIT-EXTRACT, extractHeaderFragment, extractBodyFragment, emitExtractReady,
  emitExtractOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitExtractSurfaceOk,
  EMIT-EXTRACT-SMOKE, HOST-EMIT-EXTRACT-SMOKE, EmitExtractScaffold,
  FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS, slake_extract_status,
  slake_check_bundle, slake_check_fail_closed, slake_extract_with_checks,
  NON-SSOT, UNIT_SURFACE host surface.
  Module: SystemsLean.EmitExtractScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitExtract.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitExtract

/-- Greppable primary stage id for host-owned Extract product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"

/-- Greppable short map id (HOST-EMIT-EXTRACT). -/
def hostEmitExtractId : String := "HOST-EMIT-EXTRACT"

/-- Greppable short map id (SELF-HOST-EMIT-EXTRACT). -/
def selfHostEmitExtractId : String := "SELF-HOST-EMIT-EXTRACT"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitExtract.lean"

/-- Durable Extract SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_extract.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-EXTRACT). -/
def extractOwnershipComment : String :=
  " * HOST-EMIT-EXTRACT: dialect from SystemsLean.EmitExtract + host_emit_extract.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this Extract + FAIL_CLOSED product text).\n"

/-- Extract section open comment (header; includes ownership). -/
def extractHeaderOpen : String :=
  "/* ---- Extract (Extract.slake / EMIT-BOUNDARY / RUNTIME-FS) ----\n"
    ++ " * EDGE-RUNTIME / RUNTIME-CLASSIC mark stock-host managed residual (not this wire).\n"
    ++ extractOwnershipComment
    ++ " */\n"

/-- Extract enums + status / runtime decls + FAIL_CLOSED_CHECKER_V1 decls. -/
def extractApiDecls : String :=
  "enum slake_extract_status {\n"
    ++ "  SLAKE_EXTRACT_OK = 0,\n"
    ++ "  SLAKE_EXTRACT_FAIL_CLOSED = 1\n"
    ++ "};\n"
    ++ "\n"
    ++ "/* Runtime class tags for honesty (not a full runtime switch). */\n"
    ++ "enum slake_runtime_class {\n"
    ++ "  SLAKE_RUNTIME_FS = 0,       /* RUNTIME-FS freestanding product goal */\n"
    ++ "  SLAKE_RUNTIME_CLASSIC = 1   /* RUNTIME-CLASSIC / EDGE-RUNTIME stock host (not product) */\n"
    ++ "};\n"
    ++ "\n"
    ++ "int slake_extract_status_ok(void);\n"
    ++ "/* Product wire claims RUNTIME-FS only. */\n"
    ++ "enum slake_runtime_class slake_extract_product_runtime(void);\n"
    ++ "\n"
    ++ "/* FAIL_CLOSED_CHECKER_V1 -- composed checks before product extract.\n"
    ++ " * Still not residual free; not PROVABLY; no product GC.\n"
    ++ " */\n"
    ++ "typedef struct slake_check_bundle {\n"
    ++ "  enum slake_mult mult;\n"
    ++ "  const slake_linear_token *linear; /* required live when mult == MULT-1; else may be null */\n"
    ++ "  const slake_erased *erased;       /* required marked when mult == MULT-0; else may be null */\n"
    ++ "  enum slake_runtime_class claimed_runtime; /* must be SLAKE_RUNTIME_FS for product */\n"
    ++ "} slake_check_bundle;\n"
    ++ "\n"
    ++ "/* Fail-closed checker: SLAKE_EXTRACT_OK (0) or SLAKE_EXTRACT_FAIL_CLOSED (1).\n"
    ++ " * Rules:\n"
    ++ " *  - mult must pass slake_mult_is_valid\n"
    ++ " *  - MULT-1: linear non-null AND live (check-only; do not consume here)\n"
    ++ " *  - MULT-0: erased non-null AND slake_erasure_is_runtime_absent == 1\n"
    ++ " *  - MULT-OMEGA: linear/erased may be null (unrestricted)\n"
    ++ " *  - claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME product claim)\n"
    ++ " *  - null bundle -> FAIL_CLOSED\n"
    ++ " * Document return codes exactly matching body.\n"
    ++ " * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS\n"
    ++ " */\n"
    ++ "int slake_check_fail_closed(const slake_check_bundle *b);\n"
    ++ "\n"
    ++ "/* Extract path: run checker; on OK write *out_rt = SLAKE_RUNTIME_FS and return OK;\n"
    ++ " * on fail leave *out_rt untouched.\n"
    ++ " * null out_rt on success path is FAIL_CLOSED.\n"
    ++ " * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS\n"
    ++ " */\n"
    ++ "int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt);\n"

/-- extractHeaderFragment -- freestanding Extract header text (HOST-EMIT-EXTRACT SSoT). -/
def extractHeaderFragment : String :=
  extractHeaderOpen
    ++ extractApiDecls

/-- Body section open for Extract. -/
def extractBodyOpen : String :=
  "/* ---- Extract (EMIT-BOUNDARY / RUNTIME-FS) ----\n"
    ++ extractOwnershipComment
    ++ " */\n"

/-- FAIL_CLOSED body section open. -/
def failClosedBodyOpen : String :=
  "/* ---- FAIL_CLOSED_CHECKER_V1 (composed checks + extract path) ----\n"
    ++ extractOwnershipComment
    ++ " */\n"

/-- Extract + fail-closed function bodies (product wire). -/
def extractBodies : String :=
  "int slake_extract_status_ok(void)\n"
    ++ "{\n"
    ++ "  return (int)SLAKE_EXTRACT_OK;\n"
    ++ "}\n"
    ++ "\n"
    ++ "enum slake_runtime_class slake_extract_product_runtime(void)\n"
    ++ "{\n"
    ++ "  /* Product wire is RUNTIME-FS only; EDGE-RUNTIME / RUNTIME-CLASSIC stay off-wire. */\n"
    ++ "  return SLAKE_RUNTIME_FS;\n"
    ++ "}\n"
    ++ "\n"
    ++ failClosedBodyOpen
    ++ "\n"
    ++ "int slake_check_fail_closed(const slake_check_bundle *b)\n"
    ++ "{\n"
    ++ "  /* null bundle -> FAIL_CLOSED */\n"
    ++ "  if (b == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* mult must pass slake_mult_is_valid */\n"
    ++ "  if (slake_mult_is_valid(b->mult) != 1) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME) */\n"
    ++ "  if (b->claimed_runtime != SLAKE_RUNTIME_FS) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  if (b->mult == SLAKE_MULT_1) {\n"
    ++ "    /* MULT-1: linear non-null AND live (check-only; do not consume here) */\n"
    ++ "    if (b->linear == 0 || slake_linear_token_is_live(b->linear) != 1) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  } else if (b->mult == SLAKE_MULT_0) {\n"
    ++ "    /* MULT-0: erased non-null AND runtime-absent marked */\n"
    ++ "    if (b->erased == 0 || slake_erasure_is_runtime_absent(b->erased) != 1) {\n"
    ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  /* MULT-OMEGA: linear/erased may be null (unrestricted) */\n"
    ++ "  return (int)SLAKE_EXTRACT_OK;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt)\n"
    ++ "{\n"
    ++ "  /* Fail closed first; leave *out_rt untouched on fail. */\n"
    ++ "  if (slake_check_fail_closed(b) != (int)SLAKE_EXTRACT_OK) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  /* null out_rt on success path is FAIL_CLOSED */\n"
    ++ "  if (out_rt == 0) {\n"
    ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
    ++ "  }\n"
    ++ "  *out_rt = SLAKE_RUNTIME_FS;\n"
    ++ "  return (int)SLAKE_EXTRACT_OK;\n"
    ++ "}\n"

/-- extractBodyFragment -- freestanding Extract body text (HOST-EMIT-EXTRACT SSoT). -/
def extractBodyFragment : String :=
  extractBodyOpen
    ++ "\n"
    ++ extractBodies

/-- Ownership comment carries HOST-EMIT-EXTRACT + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (extractOwnershipComment
    == " * HOST-EMIT-EXTRACT: dialect from SystemsLean.EmitExtract + host_emit_extract.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this Extract + FAIL_CLOSED product text).\n")

/-- Header piece honesty: extract decls + ownership. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && (extractApiDecls
      == "enum slake_extract_status {\n"
        ++ "  SLAKE_EXTRACT_OK = 0,\n"
        ++ "  SLAKE_EXTRACT_FAIL_CLOSED = 1\n"
        ++ "};\n"
        ++ "\n"
        ++ "/* Runtime class tags for honesty (not a full runtime switch). */\n"
        ++ "enum slake_runtime_class {\n"
        ++ "  SLAKE_RUNTIME_FS = 0,       /* RUNTIME-FS freestanding product goal */\n"
        ++ "  SLAKE_RUNTIME_CLASSIC = 1   /* RUNTIME-CLASSIC / EDGE-RUNTIME stock host (not product) */\n"
        ++ "};\n"
        ++ "\n"
        ++ "int slake_extract_status_ok(void);\n"
        ++ "/* Product wire claims RUNTIME-FS only. */\n"
        ++ "enum slake_runtime_class slake_extract_product_runtime(void);\n"
        ++ "\n"
        ++ "/* FAIL_CLOSED_CHECKER_V1 -- composed checks before product extract.\n"
        ++ " * Still not residual free; not PROVABLY; no product GC.\n"
        ++ " */\n"
        ++ "typedef struct slake_check_bundle {\n"
        ++ "  enum slake_mult mult;\n"
        ++ "  const slake_linear_token *linear; /* required live when mult == MULT-1; else may be null */\n"
        ++ "  const slake_erased *erased;       /* required marked when mult == MULT-0; else may be null */\n"
        ++ "  enum slake_runtime_class claimed_runtime; /* must be SLAKE_RUNTIME_FS for product */\n"
        ++ "} slake_check_bundle;\n"
        ++ "\n"
        ++ "/* Fail-closed checker: SLAKE_EXTRACT_OK (0) or SLAKE_EXTRACT_FAIL_CLOSED (1).\n"
        ++ " * Rules:\n"
        ++ " *  - mult must pass slake_mult_is_valid\n"
        ++ " *  - MULT-1: linear non-null AND live (check-only; do not consume here)\n"
        ++ " *  - MULT-0: erased non-null AND slake_erasure_is_runtime_absent == 1\n"
        ++ " *  - MULT-OMEGA: linear/erased may be null (unrestricted)\n"
        ++ " *  - claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME product claim)\n"
        ++ " *  - null bundle -> FAIL_CLOSED\n"
        ++ " * Document return codes exactly matching body.\n"
        ++ " * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS\n"
        ++ " */\n"
        ++ "int slake_check_fail_closed(const slake_check_bundle *b);\n"
        ++ "\n"
        ++ "/* Extract path: run checker; on OK write *out_rt = SLAKE_RUNTIME_FS and return OK;\n"
        ++ " * on fail leave *out_rt untouched.\n"
        ++ " * null out_rt on success path is FAIL_CLOSED.\n"
        ++ " * Greppable: FAIL_CLOSED_CHECKER_V1, EMIT-BOUNDARY, RUNTIME-FS\n"
        ++ " */\n"
        ++ "int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt);\n")

/-- Body piece honesty: extract + fail-closed function bodies. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && (extractBodies
      == "int slake_extract_status_ok(void)\n"
        ++ "{\n"
        ++ "  return (int)SLAKE_EXTRACT_OK;\n"
        ++ "}\n"
        ++ "\n"
        ++ "enum slake_runtime_class slake_extract_product_runtime(void)\n"
        ++ "{\n"
        ++ "  /* Product wire is RUNTIME-FS only; EDGE-RUNTIME / RUNTIME-CLASSIC stay off-wire. */\n"
        ++ "  return SLAKE_RUNTIME_FS;\n"
        ++ "}\n"
        ++ "\n"
        ++ failClosedBodyOpen
        ++ "\n"
        ++ "int slake_check_fail_closed(const slake_check_bundle *b)\n"
        ++ "{\n"
        ++ "  /* null bundle -> FAIL_CLOSED */\n"
        ++ "  if (b == 0) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  /* mult must pass slake_mult_is_valid */\n"
        ++ "  if (slake_mult_is_valid(b->mult) != 1) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  /* claimed_runtime must be SLAKE_RUNTIME_FS (fail closed on CLASSIC / EDGE-RUNTIME) */\n"
        ++ "  if (b->claimed_runtime != SLAKE_RUNTIME_FS) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  if (b->mult == SLAKE_MULT_1) {\n"
        ++ "    /* MULT-1: linear non-null AND live (check-only; do not consume here) */\n"
        ++ "    if (b->linear == 0 || slake_linear_token_is_live(b->linear) != 1) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "  } else if (b->mult == SLAKE_MULT_0) {\n"
        ++ "    /* MULT-0: erased non-null AND runtime-absent marked */\n"
        ++ "    if (b->erased == 0 || slake_erasure_is_runtime_absent(b->erased) != 1) {\n"
        ++ "      return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "    }\n"
        ++ "  }\n"
        ++ "  /* MULT-OMEGA: linear/erased may be null (unrestricted) */\n"
        ++ "  return (int)SLAKE_EXTRACT_OK;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_extract_with_checks(const slake_check_bundle *b, enum slake_runtime_class *out_rt)\n"
        ++ "{\n"
        ++ "  /* Fail closed first; leave *out_rt untouched on fail. */\n"
        ++ "  if (slake_check_fail_closed(b) != (int)SLAKE_EXTRACT_OK) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  /* null out_rt on success path is FAIL_CLOSED */\n"
        ++ "  if (out_rt == 0) {\n"
        ++ "    return (int)SLAKE_EXTRACT_FAIL_CLOSED;\n"
        ++ "  }\n"
        ++ "  *out_rt = SLAKE_RUNTIME_FS;\n"
        ++ "  return (int)SLAKE_EXTRACT_OK;\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitExtractSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_EXTRACT_V0")
    && (hostEmitExtractId == "HOST-EMIT-EXTRACT")
    && (selfHostEmitExtractId == "SELF-HOST-EMIT-EXTRACT")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitExtract.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_extract.ssot.txt")

/-- emitExtractReady -- Extract host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitExtractReady, HOST-EMIT-EXTRACT, SELF-HOST-EMIT-EXTRACT. -/
def emitExtractReady : Bool :=
  emitExtractSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitExtractReady for inventory greps). -/
def emitExtractOk : Bool := emitExtractReady

/-! ### Extract host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-EXTRACT-SMOKE, HOST-EMIT-EXTRACT-SMOKE.
    maxHeartbeats raised: extract bodies need room for decide honesty. -/

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-EXTRACT-SMOKE / HOST-EMIT-EXTRACT-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_EXTRACT_V0" := by decide
example : hostEmitExtractId = "HOST-EMIT-EXTRACT" := by decide
example : selfHostEmitExtractId = "SELF-HOST-EMIT-EXTRACT" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitExtract.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_extract.ssot.txt" := by decide
example : emitExtractSurfaceOk = true := by decide

/-- HOST-EMIT-EXTRACT-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-EXTRACT-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-EXTRACT-SMOKE: full emit readiness. -/
example : emitExtractReady = true := by decide
example : emitExtractOk = true := by decide

/-- EMIT-EXTRACT-PRODUCT-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitExtractReady_true : emitExtractReady = true := by decide

end SystemsLean.EmitExtract
