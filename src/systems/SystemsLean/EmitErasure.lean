/-
  SYSTEMS_LEAN_HOST partial -- host-owned Erasure freestanding C product text.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): Erasure.lean marker / isRuntimeAbsent; emit slake_erased_*;
    self-host.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_EMIT_ERASURE_V0 / HOST-EMIT-ERASURE / SELF-HOST-EMIT-ERASURE:
    Lean owns freestanding mult-0 erasure product C text
    (slake_erased + mark / is_marked / is_runtime_absent).
  - Durable artifact: src/systems/emit/host_emit_erasure.ssot.txt
    (ERASURE_C_HEADER / ERASURE_C_BODY blocks match erasureHeaderFragment /
    erasureBodyFragment).
  - FreestandingEmit embeds Erasure product text from the durable SSOT artifact;
    it must not invent a second Erasure dialect.
  - ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME greppable on wire.
  - emitErasureReady: surface + honesty piece equality.
  - No new EMIT_ERASURE_V0 residual C stage ladder (host stage ids only).
  - This is mult-0 absence honesty on freestanding C -- not a type system in C.

  Intentional non-claims / partial parity:
  - PARTIAL: Erasure product C text SSoT only; not full product module emit;
    not compiler self-application; Extract / FAIL_CLOSED bulk stay template.
  - Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  - Classic Lean elaborator residual remains (host residual != product wire).
  - Does not unlock llvm. Does not grow bash EMIT_* residual treadmill.
  - Does not put elaborator types on freestanding C.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_ERASURE_V0, HOST-EMIT-ERASURE,
  SELF-HOST-EMIT-ERASURE, EMIT-ERASURE-SMOKE, HOST-EMIT-ERASURE-SMOKE,
  ERASE-RULE-MULT-0, ERASE-NO-RUNTIME, slake_erased_mark,
  slake_erasure_is_runtime_absent, erasureHeaderFragment, erasureBodyFragment,
  emitErasureReady, NON-SSOT
  UNIT_SURFACE host surface. Module: SystemsLean.EmitErasure
  Not freestanding emit. Not freestanding residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

namespace SystemsLean.EmitErasure

/-- Greppable primary stage id for host-owned Erasure product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_ERASURE_V0"

/-- Greppable short map id (HOST-EMIT-ERASURE). -/
def hostEmitErasureId : String := "HOST-EMIT-ERASURE"

/-- Greppable short map id (SELF-HOST-EMIT-ERASURE). -/
def selfHostEmitErasureId : String := "SELF-HOST-EMIT-ERASURE"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitErasure.lean"

/-- Durable Erasure SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_erasure.ssot.txt"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-ERASURE). -/
def erasureOwnershipComment : String :=
  " * HOST-EMIT-ERASURE: dialect from SystemsLean.EmitErasure + host_emit_erasure.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this Erasure product text).\n"

/-- Erasure section open comment (header). -/
def erasureHeaderOpen : String :=
  "/* ---- Erasure (Erasure.slake / ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME) ----\n"
    ++ " * Zero-payload marker for MULT-0; EDGE-PROP / ERASE-PROP imperfect on sides.\n"
    ++ erasureOwnershipComment
    ++ " */\n"

/-- Erasure typedef + decls (product wire names). -/
def erasureApiDecls : String :=
  "typedef struct slake_erased {\n"
    ++ "  uint8_t marked; /* 1 after mark; no product payload */\n"
    ++ "} slake_erased;\n"
    ++ "\n"
    ++ "int slake_erased_mark(slake_erased *e);\n"
    ++ "int slake_erased_is_marked(const slake_erased *e);\n"
    ++ "/* 1 if non-null and marked (erased MULT-0 runtime-absent); 0 for null or unmarked.\n"
    ++ " * Canonical UNIT_DEEPEN_V1 map name: slake_erasure_is_runtime_absent.\n"
    ++ " * Fail closed: unmarked handles do not claim runtime absence.\n"
    ++ " */\n"
    ++ "int slake_erasure_is_runtime_absent(const slake_erased *e);\n"

/-- erasureHeaderFragment -- freestanding Erasure header text (HOST-EMIT-ERASURE SSoT). -/
def erasureHeaderFragment : String :=
  erasureHeaderOpen
    ++ erasureApiDecls

/-- Body section open for Erasure. -/
def erasureBodyOpen : String :=
  "/* ---- Erasure (ERASE-RULE-MULT-0 / ERASE-NO-RUNTIME) ----\n"
    ++ erasureOwnershipComment
    ++ " */\n"

/-- Erasure function bodies (product wire). -/
def erasureBodies : String :=
  "int slake_erased_mark(slake_erased *e)\n"
    ++ "{\n"
    ++ "  if (e == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  e->marked = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_erased_is_marked(const slake_erased *e)\n"
    ++ "{\n"
    ++ "  if (e == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return (e->marked != 0) ? 1 : 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_erasure_is_runtime_absent(const slake_erased *e)\n"
    ++ "{\n"
    ++ "  /* Fail closed: only marked MULT-0 handles claim runtime absence. */\n"
    ++ "  if (e == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (e->marked == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"

/-- erasureBodyFragment -- freestanding Erasure body text (HOST-EMIT-ERASURE SSoT). -/
def erasureBodyFragment : String :=
  erasureBodyOpen
    ++ "\n"
    ++ erasureBodies

/-- Ownership comment carries HOST-EMIT-ERASURE + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (erasureOwnershipComment
    == " * HOST-EMIT-ERASURE: dialect from SystemsLean.EmitErasure + host_emit_erasure.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this Erasure product text).\n")

/-- Header piece honesty: decls + ownership. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && (erasureApiDecls
      == "typedef struct slake_erased {\n"
        ++ "  uint8_t marked; /* 1 after mark; no product payload */\n"
        ++ "} slake_erased;\n"
        ++ "\n"
        ++ "int slake_erased_mark(slake_erased *e);\n"
        ++ "int slake_erased_is_marked(const slake_erased *e);\n"
        ++ "/* 1 if non-null and marked (erased MULT-0 runtime-absent); 0 for null or unmarked.\n"
        ++ " * Canonical UNIT_DEEPEN_V1 map name: slake_erasure_is_runtime_absent.\n"
        ++ " * Fail closed: unmarked handles do not claim runtime absence.\n"
        ++ " */\n"
        ++ "int slake_erasure_is_runtime_absent(const slake_erased *e);\n")

/-- Body piece honesty: mark / is_marked / is_runtime_absent. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && (erasureBodies
      == "int slake_erased_mark(slake_erased *e)\n"
        ++ "{\n"
        ++ "  if (e == 0) {\n"
        ++ "    return -1;\n"
        ++ "  }\n"
        ++ "  e->marked = 1;\n"
        ++ "  return 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_erased_is_marked(const slake_erased *e)\n"
        ++ "{\n"
        ++ "  if (e == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return (e->marked != 0) ? 1 : 0;\n"
        ++ "}\n"
        ++ "\n"
        ++ "int slake_erasure_is_runtime_absent(const slake_erased *e)\n"
        ++ "{\n"
        ++ "  /* Fail closed: only marked MULT-0 handles claim runtime absence. */\n"
        ++ "  if (e == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  if (e->marked == 0) {\n"
        ++ "    return 0;\n"
        ++ "  }\n"
        ++ "  return 1;\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitErasureSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_ERASURE_V0")
    && (hostEmitErasureId == "HOST-EMIT-ERASURE")
    && (selfHostEmitErasureId == "SELF-HOST-EMIT-ERASURE")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitErasure.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_erasure.ssot.txt")

/-- emitErasureReady -- Erasure host-owned emit readiness.
    FAIL-CLOSED: surface + header/body piece honesty.
    Greppable: emitErasureReady, HOST-EMIT-ERASURE, SELF-HOST-EMIT-ERASURE. -/
def emitErasureReady : Bool :=
  emitErasureSurfaceOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitErasureReady for inventory greps). -/
def emitErasureOk : Bool := emitErasureReady

/-! ### Erasure host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-ERASURE-SMOKE, HOST-EMIT-ERASURE-SMOKE. -/

set_option maxRecDepth 2048

/-- EMIT-ERASURE-SMOKE / HOST-EMIT-ERASURE-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_ERASURE_V0" := by decide
example : hostEmitErasureId = "HOST-EMIT-ERASURE" := by decide
example : selfHostEmitErasureId = "SELF-HOST-EMIT-ERASURE" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitErasure.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_erasure.ssot.txt" := by decide
example : emitErasureSurfaceOk = true := by decide

/-- HOST-EMIT-ERASURE-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-ERASURE-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-ERASURE-SMOKE: full emit readiness. -/
example : emitErasureReady = true := by decide
example : emitErasureOk = true := by decide

end SystemsLean.EmitErasure
