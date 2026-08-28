/-
  SYSTEMS_LEAN_HOST partial -- LinearTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LinearTheorems dialect proof checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LinearTheorems L3 dialect subset (documented; not full Lean 4 tactic elaborator):
  - shareNat_zero: statement must be shareNat 0 = 0 (reject : True);
    proof body after := must be rfl (reject by sorry / trivial).
  - mult0ClassId_eq: statement mult0ClassId = "MULT-0"; proof body rfl.
  Other LinearTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLinearProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLinearProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke folds SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - LinearTheorems pilot only -- not package elaborate L4, not TypesTheorems L3.
  - MultTheorems PROOF-SURFACE MultTheorems-only dual-ok unchanged
    (HostModuleCheckMultProof).
  - Mult..Extract L2 TERM-SURFACE dual-ok pins unchanged.
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for LinearTheorems is LinearTheorems-only when
    E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckLinearProof,
  PROOF-SURFACE, LinearTheorems-only, ILL-TYPED-PROOF,
  checkLinearTheoremsProofDialect, refineLinearTheoremsWithProofSurface,
  hostModuleCheckBadLinearThmWrongStmtText,
  hostModuleCheckBadLinearThmSorryText,
  hostModuleCheckLinearProofSurfaceOk, LinearTheorems proof-surface pilot,
  hostModuleCheckLinearProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckLinearProof
  Red/green: lake build SystemsLean.HostModuleCheckLinearProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### LinearTheorems L3 proof-surface dual-ok pins (LinearTheorems-only) -/

/-- Named proof-surface depth bar reused for LinearTheorems L3 pilot honesty.
    Greppable: checkDepthLinearProofSurfaceBar, PROOF-SURFACE,
    LinearTheorems-only. -/
def checkDepthLinearProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: LinearTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthLinearProofSurfaceScope, LinearTheorems-only,
    PROOF-SURFACE. -/
def checkDepthLinearProofSurfaceScope : String := "LinearTheorems-only"

/-- Dual-ok when LinearTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckLinearProofSurfaceDualOk, PROOF-SURFACE,
    LinearTheorems-only. -/
def hostModuleCheckLinearProofSurfaceDualOk : Bool := true

/-! ### LinearTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- shareNat_zero statement is shareNat 0 = 0 (not True).
    Greppable: linearThmShareNatZeroStmtOk, PROOF-SURFACE. -/
def linearThmShareNatZeroStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "shareNat_zero" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "shareNat_zero"
    let n := collapseWsProof stmt
    (n.splitOn "shareNat 0 = 0").length > 1
      && !((n.splitOn "True").length > 1)

/-- shareNat_zero proof body is exactly rfl.
    Greppable: linearThmShareNatZeroProofOk, PROOF-SURFACE. -/
def linearThmShareNatZeroProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "shareNat_zero" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- mult0ClassId_eq statement cites mult0ClassId and MULT-0 (not True).
    Greppable: linearThmMult0ClassIdStmtOk, PROOF-SURFACE. -/
def linearThmMult0ClassIdStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "mult0ClassId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "mult0ClassId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "mult0ClassId").length > 1
      && (n.splitOn "MULT-0").length > 1
      && !((n.splitOn "True").length > 1)

/-- mult0ClassId_eq proof body is exactly rfl.
    Greppable: linearThmMult0ClassIdProofOk, PROOF-SURFACE. -/
def linearThmMult0ClassIdProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "mult0ClassId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- LinearTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkLinearTheoremsProofDialect, PROOF-SURFACE,
    LinearTheorems proof-surface pilot. -/
def checkLinearTheoremsProofDialect (content : String) : Option String :=
  if !linearThmShareNatZeroStmtOk content then some reasonIllTypedProof
  else if !linearThmShareNatZeroProofOk content then some reasonIllTypedProof
  else if !linearThmMult0ClassIdStmtOk content then some reasonIllTypedProof
  else if !linearThmMult0ClassIdProofOk content then some reasonIllTypedProof
  else none

/-- Apply LinearTheorems L3 after a structural LinearTheorems accept.
    Greppable: refineLinearTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineLinearTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLinearTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### LinearTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed LinearTheorems L3 good text (shareNat_zero + mult0ClassId_eq rfl
    pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodLinearTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodLinearTheoremsProofText : String :=
  "import SystemsLean.Linear\n" ++
  "namespace SystemsLean.Linear\n" ++
  "theorem shareNat_eq (n : Nat) : shareNat n = n + n := rfl\n" ++
  "theorem shareNat_zero : shareNat 0 = 0 := rfl\n" ++
  "theorem shareNat_succ (n : Nat) : shareNat (n + 1) = (n + 1) + (n + 1) := rfl\n" ++
  "theorem polyId_id {a : Type} (x : a) : polyId x = x := rfl\n" ++
  "theorem mult0ClassId_eq : mult0ClassId = \"MULT-0\" := rfl\n" ++
  "theorem mult1ClassId_eq : mult1ClassId = \"MULT-1\" := rfl\n" ++
  "theorem multOmegaClassId_eq : multOmegaClassId = \"MULT-OMEGA\" := rfl\n" ++
  "theorem linearAxiomInventoryOk_true : linearAxiomInventoryOk = true := rfl\n" ++
  "theorem shareNat_reuse (n : Nat) : True := trivial\n" ++
  "theorem linearExactOnceId_eq : linearExactOnceId = \"LINEAR-EXACT-ONCE\" := rfl\n" ++
  "theorem linearAxiomsRemainId_eq : linearAxiomsRemainId = \"LINEAR-AXIOMS-REMAIN\" := rfl\n" ++
  "theorem affineNotFirstClassId_eq : affineNotFirstClassId = \"AFFINE-NOT-FIRST-CLASS\" := rfl\n" ++
  "end SystemsLean.Linear\n"

/-! ### Ill-typed LinearTheorems twins (P1/P2). L0 tokens present; L3 must reject. -/

/-- Shared LinearTheorems body with shareNat_zero / mult0ClassId_eq slots.
    Keeps 12 required theorem names for L0 accept dual-pin. -/
def linearTheoremsTwinSkeleton (shareNatZeroLine : String)
    (mult0ClassIdLine : String) : String :=
  "import SystemsLean.Linear\n" ++
  "namespace SystemsLean.Linear\n" ++
  "theorem shareNat_eq (n : Nat) : shareNat n = n + n := rfl\n" ++
  shareNatZeroLine ++ "\n" ++
  "theorem shareNat_succ (n : Nat) : shareNat (n + 1) = (n + 1) + (n + 1) := rfl\n" ++
  "theorem polyId_id {a : Type} (x : a) : polyId x = x := rfl\n" ++
  mult0ClassIdLine ++ "\n" ++
  "theorem mult1ClassId_eq : mult1ClassId = \"MULT-1\" := rfl\n" ++
  "theorem multOmegaClassId_eq : multOmegaClassId = \"MULT-OMEGA\" := rfl\n" ++
  "theorem linearAxiomInventoryOk_true : linearAxiomInventoryOk = true := rfl\n" ++
  "theorem shareNat_reuse (n : Nat) : True := trivial\n" ++
  "theorem linearExactOnceId_eq : linearExactOnceId = \"LINEAR-EXACT-ONCE\" := rfl\n" ++
  "theorem linearAxiomsRemainId_eq : linearAxiomsRemainId = \"LINEAR-AXIOMS-REMAIN\" := rfl\n" ++
  "theorem affineNotFirstClassId_eq : affineNotFirstClassId = \"AFFINE-NOT-FIRST-CLASS\" := rfl\n" ++
  "end SystemsLean.Linear\n"

/-- P1: wrong statement on shareNat_zero (True / trivial). L0 still has
    theorem:shareNat_zero.
    Greppable: hostModuleCheckBadLinearThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmWrongStmtText : String :=
  linearTheoremsTwinSkeleton
    "theorem shareNat_zero : True := trivial"
    "theorem mult0ClassId_eq : mult0ClassId = \"MULT-0\" := rfl"

/-- P2: by sorry on shareNat_zero where real proof is rfl. L0 still has
    theorem:shareNat_zero.
    Greppable: hostModuleCheckBadLinearThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmSorryText : String :=
  linearTheoremsTwinSkeleton
    "theorem shareNat_zero : shareNat 0 = 0 := by sorry"
    "theorem mult0ClassId_eq : mult0ClassId = \"MULT-0\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from LinearTheorems twin text for L0 dual-pin. -/
def linearTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LinearTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadLinearThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (linearTheoremsProofSurfaceFrom hostModuleCheckBadLinearThmWrongStmtText)
    linearExpectedNamespace linearTheoremsRequiredDecls
    (some "SystemsLean.Linear")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadLinearThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (linearTheoremsProofSurfaceFrom hostModuleCheckBadLinearThmSorryText)
    linearExpectedNamespace linearTheoremsRequiredDecls
    (some "SystemsLean.Linear")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckLinearProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckLinearProofDialectOk : Bool :=
  (checkLinearTheoremsProofDialect
    hostModuleCheckGoodLinearTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadLinearThmWrongStmtDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmWrongStmtDialectReject : Bool :=
  match checkLinearTheoremsProofDialect hostModuleCheckBadLinearThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadLinearThmSorryDialectReject, PROOF-SURFACE. -/
def hostModuleCheckBadLinearThmSorryDialectReject : Bool :=
  match checkLinearTheoremsProofDialect hostModuleCheckBadLinearThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined LinearTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone).
    Greppable: hostModuleCheckLinearProofSurfaceOk, PROOF-SURFACE,
    LinearTheorems-only. -/
def hostModuleCheckLinearProofSurfaceOk : Bool :=
  hostModuleCheckLinearProofSurfaceDualOk
    && (checkDepthLinearProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthLinearProofSurfaceScope == "LinearTheorems-only")
    && hostModuleCheckLinearProofDialectOk
    && hostModuleCheckBadLinearThmWrongStmtDialectReject
    && hostModuleCheckBadLinearThmSorryDialectReject
    && hostModuleCheckBadLinearThmWrongStmtL0Accept
    && hostModuleCheckBadLinearThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckLinearProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckLinearProofSurfaceOk_true :
    hostModuleCheckLinearProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_linear_proof_surface_ids_eq :
    checkDepthLinearProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthLinearProofSurfaceScope = "LinearTheorems-only"
      && hostModuleCheckLinearProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
