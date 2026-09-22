/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitMultScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitMultScaffoldSource. Not occupancy name 50. Not mill 70.
  Unique needles (trailing newline so HostFrontLiveEmit is not a prefix):
  HostFrontLiveEmitMultScaffoldSource
  PARSE-LIVE-EMIT-MULT-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD
  Greppable: SYSTEMS_LEAN_HOST, liveEmitMultScaffoldSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitMultScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitMultScaffold

/-- Dual-pinned live EmitMultScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitMultScaffoldSource, PARSE-LIVE-EMIT-MULT-SCAFFOLD. -/
def liveEmitMultScaffoldSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding Mult product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-MULT product-text fragments (multHeaderFragment /
  multBodyFragment), stage/map ids, ownership honesty, and emitMultReady
  used by SystemsLean.EmitMult. Same namespace SystemsLean.EmitMult so
  call sites stay unqualified. Long-file split from EmitMult.lean.

  Spec (readable):
  - stageId / hostEmitMultId / selfHostEmitMultId: greppable stage map.
  - multHeaderFragment / multBodyFragment: freestanding C scaffolding SSoT
    text (MULT_C_HEADER / MULT_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - Grade name strings derive from Mult.name (structural host model).
  - FAIL-CLOSED-UNKNOWN-GRADE: unknown raw grades return 0 / null on the wire.
  - emitMultReady: surface + grade names + header/body piece honesty
    (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit.
  - Durable file host_emit_mult.ssot.txt remains HOST-EMIT-MULT dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.
  - Closed-loop Mult parity is ParityMult (SH3); not compiler self-application.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_MULT_V0, HOST-EMIT-MULT,
  SELF-HOST-EMIT-MULT, multHeaderFragment, multBodyFragment, emitMultReady,
  emitMultOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitMultSurfaceOk,
  gradeNamesOk, EMIT-MULT-SMOKE, HOST-EMIT-MULT-SMOKE, EmitMultScaffold,
  MULT-0, MULT-1, MULT-OMEGA, FAIL-CLOSED-UNKNOWN-GRADE, slake_mult_is_valid,
  slake_mult_name, NON-SSOT, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.EmitMultScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitMult.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

import SystemsLean.Mult

namespace SystemsLean.EmitMult

open SystemsLean.Mult (Mult)

/-! ### Host-owned freestanding Mult product C (HOST-EMIT-MULT)
    Greppable: HOST-EMIT-MULT, SELF-HOST-EMIT-MULT, SLAKE_SELF_HOST_EMIT_MULT_V0,
    multHeaderFragment, multBodyFragment, emitMultReady.
    maxRecDepth raised: Mult ownership / API piece equality needs room for decide. -/

/-- Greppable primary stage id for host-owned Mult product emit (SH2). -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_MULT_V0"

/-- Greppable short map id (HOST-EMIT-MULT). -/
def hostEmitMultId : String := "HOST-EMIT-MULT"

/-- Greppable short map id (SELF-HOST-EMIT-MULT). -/
def selfHostEmitMultId : String := "SELF-HOST-EMIT-MULT"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitMult.lean"

/-- Durable Mult SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_mult.ssot.txt"

/-- Grade name strings from Mult.name (structural host model of Mult contracts). -/
def multName0 : String := Mult.name Mult.mult0
def multName1 : String := Mult.name Mult.mult1
def multNameOmega : String := Mult.name Mult.multOmega

/-- Product wire enum constant names (compatible frozen ABI). -/
def multC0 : String := "SLAKE_MULT_0"
def multC1 : String := "SLAKE_MULT_1"
def multCOmega : String := "SLAKE_MULT_OMEGA"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-MULT). -/
def multOwnershipComment : String :=
  " * HOST-EMIT-MULT: dialect from SystemsLean.EmitMult + host_emit_mult.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this Mult product text).\n"

/-- Header Mult grade line (uses Mult.name). -/
def multHeaderGradeLine : String :=
  " * " ++ multName0 ++ " / " ++ multName1 ++ " / " ++ multNameOmega
    ++ " only. FAIL-CLOSED-UNKNOWN-GRADE.\n"

/-- Enum body lines (Mult.name in comments). -/
def multEnumBody : String :=
  "  " ++ multC0 ++ " = 0,     /* " ++ multName0 ++ " */\n"
    ++ "  " ++ multC1 ++ " = 1,     /* " ++ multName1 ++ " */\n"
    ++ "  " ++ multCOmega ++ " = 2  /* " ++ multNameOmega ++ " */\n"

/-- Mult API declarations (product wire names). -/
def multApiDecls : String :=
  "int slake_mult_is_valid(enum slake_mult m);\n"
    ++ "/* Alias of slake_mult_is_valid (UNIT_TRANSLATION_V0 name). */\n"
    ++ "int slake_mult_is_known(enum slake_mult m);\n"
    ++ "\n"
    ++ "/* Greppable grade name: \"" ++ multName0 ++ "\" | \"" ++ multName1
    ++ "\" | \"" ++ multNameOmega ++ "\" | 0 if unknown. */\n"
    ++ "const char *slake_mult_name(enum slake_mult m);\n"

/-- multHeaderFragment -- freestanding Mult header text (HOST-EMIT-MULT SSoT).
    enum slake_mult + is_valid / is_known / name declarations.
    Grade comments derive from Mult.name. Compatible with frozen product wire. -/
def multHeaderFragment : String :=
  "/* ---- Mult (Mult.slake) ----\n"
    ++ multHeaderGradeLine
    ++ multOwnershipComment
    ++ " */\n"
    ++ "enum slake_mult {\n"
    ++ multEnumBody
    ++ "};\n"
    ++ "\n"
    ++ "/* 1 if m is one of " ++ multName0 ++ " / " ++ multName1 ++ " / "
    ++ multNameOmega ++ "; 0 otherwise (fail closed).\n"
    ++ " * Canonical UNIT_DEEPEN_V1 map name: slake_mult_is_valid (alias multIsValid).\n"
    ++ " */\n"
    ++ multApiDecls

/-- is_valid body (product wire Mult contracts). -/
def multIsValidBody : String :=
  "int slake_mult_is_valid(enum slake_mult m)\n"
    ++ "{\n"
    ++ "  if (m == " ++ multC0 ++ " || m == " ++ multC1 ++ " || m == "
    ++ multCOmega ++ ") {\n"
    ++ "    return 1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"

/-- is_known body (alias of is_valid). -/
def multIsKnownBody : String :=
  "int slake_mult_is_known(enum slake_mult m)\n"
    ++ "{\n"
    ++ "  return slake_mult_is_valid(m);\n"
    ++ "}\n"

/-- Fail-closed unknown return (FAIL-CLOSED-UNKNOWN-GRADE honesty). -/
def multFailClosedReturn : String :=
  "  return 0; /* unknown: fail closed; no silent coerce */\n"

/-- name body (returns Mult.name strings; unknown fails closed). -/
def multNameBody : String :=
  "const char *slake_mult_name(enum slake_mult m)\n"
    ++ "{\n"
    ++ "  if (m == " ++ multC0 ++ ") {\n"
    ++ "    return \"" ++ multName0 ++ "\";\n"
    ++ "  }\n"
    ++ "  if (m == " ++ multC1 ++ ") {\n"
    ++ "    return \"" ++ multName1 ++ "\";\n"
    ++ "  }\n"
    ++ "  if (m == " ++ multCOmega ++ ") {\n"
    ++ "    return \"" ++ multNameOmega ++ "\";\n"
    ++ "  }\n"
    ++ multFailClosedReturn
    ++ "}\n"

/-- multBodyFragment -- freestanding Mult body text (HOST-EMIT-MULT SSoT).
    is_valid / is_known / name implementations matching Mult contracts.
    Name returns use Mult.name; unknown fails closed (return 0). -/
def multBodyFragment : String :=
  "/* ---- Mult (FAIL-CLOSED-UNKNOWN-GRADE) ----\n"
    ++ multOwnershipComment
    ++ " */\n"
    ++ "\n"
    ++ multIsValidBody
    ++ "\n"
    ++ multIsKnownBody
    ++ "\n"
    ++ multNameBody

/-- Grade names match Mult.name (structural host model). -/
def gradeNamesOk : Bool :=
  (multName0 == "MULT-0")
    && (multName1 == "MULT-1")
    && (multNameOmega == "MULT-OMEGA")

/-- Ownership comment carries HOST-EMIT-MULT + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (multOwnershipComment
    == " * HOST-EMIT-MULT: dialect from SystemsLean.EmitMult + host_emit_mult.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this Mult product text).\n")

/-- Header piece honesty: grade line + API decls + ownership (no deep substr). -/
def headerHonestyOk : Bool :=
  gradeNamesOk
    && ownershipHonestyOk
    && (multHeaderGradeLine
      == " * MULT-0 / MULT-1 / MULT-OMEGA only. FAIL-CLOSED-UNKNOWN-GRADE.\n")
    && (multApiDecls
      == "int slake_mult_is_valid(enum slake_mult m);\n"
        ++ "/* Alias of slake_mult_is_valid (UNIT_TRANSLATION_V0 name). */\n"
        ++ "int slake_mult_is_known(enum slake_mult m);\n"
        ++ "\n"
        ++ "/* Greppable grade name: \"MULT-0\" | \"MULT-1\" | \"MULT-OMEGA\" | 0 if unknown. */\n"
        ++ "const char *slake_mult_name(enum slake_mult m);\n")

/-- Body piece honesty: fail-closed return + is_known alias + grade/ownership
    helpers (gradeNamesOk / ownershipHonestyOk). Mult.name return arms in
    multNameBody are covered by gradeNamesOk + enum smoke, not re-checked here.
    Closed-loop Mult host + product contracts are ParityMult (SH3). -/
def bodyHonestyOk : Bool :=
  gradeNamesOk
    && ownershipHonestyOk
    && (multFailClosedReturn
      == "  return 0; /* unknown: fail closed; no silent coerce */\n")
    && (multIsKnownBody
      == "int slake_mult_is_known(enum slake_mult m)\n"
        ++ "{\n"
        ++ "  return slake_mult_is_valid(m);\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitMultSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_MULT_V0")
    && (hostEmitMultId == "HOST-EMIT-MULT")
    && (selfHostEmitMultId == "SELF-HOST-EMIT-MULT")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitMult.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_mult.ssot.txt")

/-- emitMultReady -- SH2 Mult host-owned emit readiness.
    FAIL-CLOSED: surface + grade names + header/body piece honesty.
    Greppable: emitMultReady, HOST-EMIT-MULT, SELF-HOST-EMIT-MULT. -/
def emitMultReady : Bool :=
  emitMultSurfaceOk && gradeNamesOk && headerHonestyOk && bodyHonestyOk

/-- Full SH2 inventory ok (alias of emitMultReady for inventory greps). -/
def emitMultOk : Bool := emitMultReady

/-! ### Mult host emit smoke (behavioral; lake build fails if an example does not hold)
    Greppable: EMIT-MULT-SMOKE, HOST-EMIT-MULT-SMOKE.
    maxRecDepth raised for String.beq unfolds on Mult ownership / API piece equality. -/

set_option maxRecDepth 4096

/-- EMIT-MULT-SMOKE / HOST-EMIT-MULT-SMOKE: stage / map ids are greppable honesty. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_MULT_V0" := by decide
example : hostEmitMultId = "HOST-EMIT-MULT" := by decide
example : selfHostEmitMultId = "SELF-HOST-EMIT-MULT" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitMult.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_mult.ssot.txt" := by decide
example : emitMultSurfaceOk = true := by decide

/-- EMIT-MULT-SMOKE: grade names from Mult.name (structural host model). -/
example : multName0 = "MULT-0" := by decide
example : multName1 = "MULT-1" := by decide
example : multNameOmega = "MULT-OMEGA" := by decide
example : Mult.name Mult.mult0 = multName0 := by decide
example : Mult.name Mult.mult1 = multName1 := by decide
example : Mult.name Mult.multOmega = multNameOmega := by decide
example : gradeNamesOk = true := by decide

/-- HOST-EMIT-MULT-SMOKE: ownership + header piece honesty. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide
example : multHeaderGradeLine = " * MULT-0 / MULT-1 / MULT-OMEGA only. FAIL-CLOSED-UNKNOWN-GRADE.\n" := by
  decide

/-- HOST-EMIT-MULT-SMOKE: body piece honesty (fail-closed unknown + alias). -/
example : bodyHonestyOk = true := by decide
example :
    multFailClosedReturn = "  return 0; /* unknown: fail closed; no silent coerce */\n" := by
  decide

/-- EMIT-MULT-SMOKE: full emit readiness. -/
example : emitMultReady = true := by decide
example : emitMultOk = true := by decide

/-- EMIT-MULT-SMOKE: Mult.isValidTag 3 remains fail-closed (grade surface). -/
example : Mult.isValidTag 3 = false := by decide

/-- HOST-EMIT-MULT-SMOKE: fragments compose from Mult.name (structural, not AI). -/
example :
    (multEnumBody
      == "  SLAKE_MULT_0 = 0,     /* MULT-0 */\n"
        ++ "  SLAKE_MULT_1 = 1,     /* MULT-1 */\n"
        ++ "  SLAKE_MULT_OMEGA = 2  /* MULT-OMEGA */\n") = true := by decide

end SystemsLean.EmitMult
"#

end SystemsLean.HostFrontLiveEmitMultScaffold
