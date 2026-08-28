/-
  SYSTEMS_LEAN_HOST partial -- TypesTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesTheorems dialect proof checks only. Same namespace
  SystemsLean.HostModuleCheck.

  TypesTheorems L3 dialect subset (documented; not full Lean 4 tactic elaborator):
  - ofKindTag?_zero: statement must be ofKindTag? 0 = some NodeKind.value
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - isValidKindTag_zero: statement isValidKindTag 0 = true; proof body rfl.
  Other TypesTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke folds SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - TypesTheorems pilot only -- not package elaborate L4.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged
    (HostModuleCheckMultProof).
  - LinearTheorems PROOF-SURFACE LinearTheorems-only dual-ok unchanged
    (HostModuleCheckLinearProof).
  - Mult..Extract L2 TERM-SURFACE dual-ok pins unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for TypesTheorems is TypesTheorems-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckTypesProof,
  PROOF-SURFACE, TypesTheorems-only, ILL-TYPED-PROOF,
  checkTypesTheoremsProofDialect, refineTypesTheoremsWithProofSurface,
  hostModuleCheckBadTypesThmWrongStmtText,
  hostModuleCheckBadTypesThmSorryText,
  hostModuleCheckTypesProofSurfaceOk, TypesTheorems proof-surface pilot,
  hostModuleCheckTypesProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesProof
  Red/green: lake build SystemsLean.HostModuleCheckTypesProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### TypesTheorems L3 proof-surface dual-ok pins (TypesTheorems-only) -/

/-- Named proof-surface depth bar reused for TypesTheorems L3 pilot honesty.
    Greppable: checkDepthTypesProofSurfaceBar, PROOF-SURFACE,
    TypesTheorems-only. -/
def checkDepthTypesProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: TypesTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthTypesProofSurfaceScope, TypesTheorems-only,
    PROOF-SURFACE. -/
def checkDepthTypesProofSurfaceScope : String := "TypesTheorems-only"

/-- Dual-ok when TypesTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckTypesProofSurfaceDualOk, PROOF-SURFACE,
    TypesTheorems-only. -/
def hostModuleCheckTypesProofSurfaceDualOk : Bool := true

/-! ### TypesTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- ofKindTag?_zero statement is ofKindTag? 0 = some NodeKind.value (not True).
    Greppable: typesThmOfKindTagZeroStmtOk, PROOF-SURFACE. -/
def typesThmOfKindTagZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofKindTag?_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "ofKindTag?_zero"
    let n := collapseWsProof stmt
    (n.splitOn "ofKindTag? 0 = some NodeKind.value").length > 1
      && !((n.splitOn "True").length > 1)

/-- ofKindTag?_zero proof body is exactly rfl.
    Greppable: typesThmOfKindTagZeroProofOk, PROOF-SURFACE. -/
def typesThmOfKindTagZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "ofKindTag?_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- isValidKindTag_zero statement is isValidKindTag 0 = true (not True).
    Greppable: typesThmIsValidKindTagZeroStmtOk, PROOF-SURFACE. -/
def typesThmIsValidKindTagZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "isValidKindTag_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "isValidKindTag_zero"
    let n := collapseWsProof stmt
    (n.splitOn "isValidKindTag 0 = true").length > 1
      && !((n.splitOn "True").length > 1)

/-- isValidKindTag_zero proof body is exactly rfl.
    Greppable: typesThmIsValidKindTagZeroProofOk, PROOF-SURFACE. -/
def typesThmIsValidKindTagZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "isValidKindTag_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- TypesTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkTypesTheoremsProofDialect, PROOF-SURFACE,
    TypesTheorems proof-surface pilot. -/
def checkTypesTheoremsProofDialect (content : String) : Option String :=
  if !typesThmOfKindTagZeroStmtOk content then some reasonIllTypedProof
  else if !typesThmOfKindTagZeroProofOk content then some reasonIllTypedProof
  else if !typesThmIsValidKindTagZeroStmtOk content then some reasonIllTypedProof
  else if !typesThmIsValidKindTagZeroProofOk content then some reasonIllTypedProof
  else none

/-- Apply TypesTheorems L3 after a structural TypesTheorems accept.
    Greppable: refineTypesTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineTypesTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### TypesTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed TypesTheorems L3 good text (ofKindTag?_zero + isValidKindTag_zero
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodTypesTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodTypesTheoremsProofText : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := rfl\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "theorem kindMultOk_value_omega : True := trivial\n" ++
  "theorem kindMultOk_linear_one : True := trivial\n" ++
  "theorem kindMultOk_erased_zero : True := trivial\n" ++
  "theorem expectedMult_value : True := trivial\n" ++
  "theorem expectedMult_linear : True := trivial\n" ++
  "theorem expectedMult_erased : True := trivial\n" ++
  "end SystemsLean.Types\n"

/-! ### Ill-typed TypesTheorems twins (P1/P2). L0 tokens present; L3 must reject. -/

/-- Shared TypesTheorems body with ofKindTag?_zero / isValidKindTag_zero slots.
    Keeps 14 required theorem names for L0 accept dual-pin. -/
def typesTheoremsTwinSkeleton (ofKindTagZeroLine : String)
    (isValidKindTagZeroLine : String) : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.Types\n" ++
  ofKindTagZeroLine ++ "\n" ++
  "theorem ofKindTag?_one : ofKindTag? 1 = some NodeKind.linear := rfl\n" ++
  "theorem ofKindTag?_two : ofKindTag? 2 = some NodeKind.erased := rfl\n" ++
  "theorem ofKindTag?_fail_closed (n : Nat) (h : 2 < n) : ofKindTag? n = none := by sorry\n" ++
  isValidKindTagZeroLine ++ "\n" ++
  "theorem isValidKindTag_one : isValidKindTag 1 = true := rfl\n" ++
  "theorem isValidKindTag_two : isValidKindTag 2 = true := rfl\n" ++
  "theorem isValidKindTag_fail_closed (n : Nat) (h : 2 < n) : isValidKindTag n = false := by sorry\n" ++
  "theorem kindMultOk_value_omega : True := trivial\n" ++
  "theorem kindMultOk_linear_one : True := trivial\n" ++
  "theorem kindMultOk_erased_zero : True := trivial\n" ++
  "theorem expectedMult_value : True := trivial\n" ++
  "theorem expectedMult_linear : True := trivial\n" ++
  "theorem expectedMult_erased : True := trivial\n" ++
  "end SystemsLean.Types\n"

/-- P1: wrong statement on ofKindTag?_zero (True / trivial). L0 still has
    theorem:ofKindTag?_zero.
    Greppable: hostModuleCheckBadTypesThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtText : String :=
  typesTheoremsTwinSkeleton
    "theorem ofKindTag?_zero : True := trivial"
    "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl"

/-- P2: by sorry on ofKindTag?_zero where real proof is rfl. L0 still has
    theorem:ofKindTag?_zero.
    Greppable: hostModuleCheckBadTypesThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryText : String :=
  typesTheoremsTwinSkeleton
    "theorem ofKindTag?_zero : ofKindTag? 0 = some NodeKind.value := by sorry"
    "theorem isValidKindTag_zero : isValidKindTag 0 = true := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from TypesTheorems twin text for L0 dual-pin. -/
def typesTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.TypesTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadTypesThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (typesTheoremsProofSurfaceFrom hostModuleCheckBadTypesThmWrongStmtText)
    typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadTypesThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (typesTheoremsProofSurfaceFrom hostModuleCheckBadTypesThmSorryText)
    typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckTypesProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckTypesProofDialectOk : Bool :=
  (checkTypesTheoremsProofDialect
    hostModuleCheckGoodTypesTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadTypesThmWrongStmtDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmWrongStmtDialectReject : Bool :=
  match checkTypesTheoremsProofDialect hostModuleCheckBadTypesThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadTypesThmSorryDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadTypesThmSorryDialectReject : Bool :=
  match checkTypesTheoremsProofDialect hostModuleCheckBadTypesThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined TypesTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone).
    Greppable: hostModuleCheckTypesProofSurfaceOk, PROOF-SURFACE,
    TypesTheorems-only. -/
def hostModuleCheckTypesProofSurfaceOk : Bool :=
  hostModuleCheckTypesProofSurfaceDualOk
    && (checkDepthTypesProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthTypesProofSurfaceScope == "TypesTheorems-only")
    && hostModuleCheckTypesProofDialectOk
    && hostModuleCheckBadTypesThmWrongStmtDialectReject
    && hostModuleCheckBadTypesThmSorryDialectReject
    && hostModuleCheckBadTypesThmWrongStmtL0Accept
    && hostModuleCheckBadTypesThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckTypesProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckTypesProofSurfaceOk_true :
    hostModuleCheckTypesProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_types_proof_surface_ids_eq :
    checkDepthTypesProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthTypesProofSurfaceScope = "TypesTheorems-only"
      && hostModuleCheckTypesProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
