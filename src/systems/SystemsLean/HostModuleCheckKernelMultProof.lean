/-
  SYSTEMS_LEAN_HOST partial -- KernelMultTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelMultTheorems dialect proof checks only. Same
  namespace SystemsLean.HostModuleCheck.

  KernelMultTheorems L3 dialect subset (documented; not full Lean 4 tactic
  elaborator):
  - stageId_eq: statement must be stageId = "SLAKE_SELF_HOST_KERNEL_MULT_V0"
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - kernelMultId_eq: statement kernelMultId = "SELF-HOST-KERNEL-MULT";
    proof body rfl.
  Other KernelMultTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelMultProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelMultProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelMultTheorems pilot only -- not package elaborate L4, not
    KernelLinearTheorems / KernelTypesTheorems / KernelProgramTheorems L3.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckMultProof / LinearProof / TypesProof).
  - KernelMult L2 TERM-SURFACE KernelMult-only dual-ok unchanged
    (HostModuleCheckKernelMultTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for KernelMultTheorems is KernelMultTheorems-only
    when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelMultProof, PROOF-SURFACE, KernelMultTheorems-only,
  ILL-TYPED-PROOF, checkKernelMultTheoremsProofDialect,
  refineKernelMultTheoremsWithProofSurface,
  hostModuleCheckBadKernelMultThmWrongStmtText,
  hostModuleCheckBadKernelMultThmSorryText,
  hostModuleCheckKernelMultProofSurfaceOk,
  KernelMultTheorems proof-surface pilot,
  hostModuleCheckKernelMultProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelMultProof
  Red/green: lake build SystemsLean.HostModuleCheckKernelMultProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### KernelMultTheorems L3 proof-surface dual-ok pins (KernelMultTheorems-only) -/

/-- Named proof-surface depth bar for KernelMultTheorems L3 pilot honesty.
    Greppable: checkDepthKernelMultProofSurfaceBar, PROOF-SURFACE,
    KernelMultTheorems-only. -/
def checkDepthKernelMultProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: KernelMultTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthKernelMultProofSurfaceScope, KernelMultTheorems-only,
    PROOF-SURFACE. -/
def checkDepthKernelMultProofSurfaceScope : String := "KernelMultTheorems-only"

/-- Dual-ok when KernelMultTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckKernelMultProofSurfaceDualOk, PROOF-SURFACE,
    KernelMultTheorems-only. -/
def hostModuleCheckKernelMultProofSurfaceDualOk : Bool := true

/-! ### KernelMultTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- stageId_eq statement is stageId = "SLAKE_SELF_HOST_KERNEL_MULT_V0" (not True).
    Greppable: kernelMultThmStageIdEqStmtOk, PROOF-SURFACE. -/
def kernelMultThmStageIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "stageId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "stageId").length > 1
      && (n.splitOn "SLAKE_SELF_HOST_KERNEL_MULT_V0").length > 1
      && !((n.splitOn "True").length > 1)

/-- stageId_eq proof body is exactly rfl.
    Greppable: kernelMultThmStageIdEqProofOk, PROOF-SURFACE. -/
def kernelMultThmStageIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- kernelMultId_eq statement cites kernelMultId and SELF-HOST-KERNEL-MULT.
    Greppable: kernelMultThmIdEqStmtOk, PROOF-SURFACE. -/
def kernelMultThmIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelMultId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "kernelMultId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "kernelMultId").length > 1
      && (n.splitOn "SELF-HOST-KERNEL-MULT").length > 1
      && !((n.splitOn "True").length > 1)

/-- kernelMultId_eq proof body is exactly rfl.
    Greppable: kernelMultThmIdEqProofOk, PROOF-SURFACE. -/
def kernelMultThmIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelMultId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- KernelMultTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkKernelMultTheoremsProofDialect, PROOF-SURFACE,
    KernelMultTheorems proof-surface pilot. -/
def checkKernelMultTheoremsProofDialect (content : String) : Option String :=
  if !kernelMultThmStageIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelMultThmStageIdEqProofOk content then some reasonIllTypedProof
  else if !kernelMultThmIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelMultThmIdEqProofOk content then some reasonIllTypedProof
  else none

/-- Apply KernelMultTheorems L3 after a structural KernelMultTheorems accept.
    Greppable: refineKernelMultTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineKernelMultTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelMultTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelMultTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed KernelMultTheorems L3 good text (stageId_eq + kernelMultId_eq
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodKernelMultTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelMultTheoremsProofText : String :=
  "import SystemsLean.KernelMult\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_MULT_V0\" := rfl\n" ++
  "theorem kernelMultId_eq : kernelMultId = \"SELF-HOST-KERNEL-MULT\" := rfl\n" ++
  "theorem multKernelReady_true : multKernelReady = true := by decide\n" ++
  "theorem kernelOk_true : kernelOk = true := by decide\n" ++
  "theorem lowerMultKernel_isSome : lowerMultKernel.isSome = true := by decide\n" ++
  "theorem unknownTagRejected_true : unknownTagRejected = true := by decide\n" ++
  "theorem multKernelProgram_length_three : True := trivial\n" ++
  "theorem multKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerMultKernel_length_three : True := trivial\n" ++
  "theorem lowerMultKernel_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelMult\n"

/-! ### Ill-typed KernelMultTheorems twins (P1/P2). L0 tokens present; L3 reject. -/

/-- Shared KernelMultTheorems body with stageId_eq / kernelMultId_eq slots.
    Keeps 11 required theorem names for L0 accept dual-pin. -/
def kernelMultTheoremsTwinSkeleton (stageIdLine : String)
    (kernelMultIdLine : String) : String :=
  "import SystemsLean.KernelMult\n" ++
  "namespace SystemsLean.KernelMult\n" ++
  stageIdLine ++ "\n" ++
  kernelMultIdLine ++ "\n" ++
  "theorem multKernelReady_true : multKernelReady = true := by decide\n" ++
  "theorem kernelOk_true : kernelOk = true := by decide\n" ++
  "theorem lowerMultKernel_isSome : lowerMultKernel.isSome = true := by decide\n" ++
  "theorem unknownTagRejected_true : unknownTagRejected = true := by decide\n" ++
  "theorem multKernelProgram_length_three : True := trivial\n" ++
  "theorem multKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerMultKernel_length_three : True := trivial\n" ++
  "theorem lowerMultKernel_isWellTyped : True := trivial\n" ++
  "end SystemsLean.KernelMult\n"

/-- P1: wrong statement on stageId_eq (True / trivial). L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelMultThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmWrongStmtText : String :=
  kernelMultTheoremsTwinSkeleton
    "theorem stageId_eq : True := trivial"
    "theorem kernelMultId_eq : kernelMultId = \"SELF-HOST-KERNEL-MULT\" := rfl"

/-- P2: by sorry on stageId_eq where real proof is rfl. L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelMultThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmSorryText : String :=
  kernelMultTheoremsTwinSkeleton
    "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_MULT_V0\" := by sorry"
    "theorem kernelMultId_eq : kernelMultId = \"SELF-HOST-KERNEL-MULT\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelMultTheorems twin text for L0 dual-pin. -/
def kernelMultTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelMultTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadKernelMultThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (kernelMultTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelMultThmWrongStmtText)
    kernelMultExpectedNamespace kernelMultTheoremsRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadKernelMultThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (kernelMultTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelMultThmSorryText)
    kernelMultExpectedNamespace kernelMultTheoremsRequiredDecls
    (some "SystemsLean.KernelMult")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelMultProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckKernelMultProofDialectOk : Bool :=
  (checkKernelMultTheoremsProofDialect
    hostModuleCheckGoodKernelMultTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadKernelMultThmWrongStmtDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmWrongStmtDialectReject : Bool :=
  match checkKernelMultTheoremsProofDialect
      hostModuleCheckBadKernelMultThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadKernelMultThmSorryDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelMultThmSorryDialectReject : Bool :=
  match checkKernelMultTheoremsProofDialect
      hostModuleCheckBadKernelMultThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined KernelMultTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelMultProofSurfaceOk, PROOF-SURFACE,
    KernelMultTheorems-only. -/
def hostModuleCheckKernelMultProofSurfaceOk : Bool :=
  hostModuleCheckKernelMultProofSurfaceDualOk
    && (checkDepthKernelMultProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthKernelMultProofSurfaceScope == "KernelMultTheorems-only")
    && hostModuleCheckKernelMultProofDialectOk
    && hostModuleCheckBadKernelMultThmWrongStmtDialectReject
    && hostModuleCheckBadKernelMultThmSorryDialectReject
    && hostModuleCheckBadKernelMultThmWrongStmtL0Accept
    && hostModuleCheckBadKernelMultThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelMultProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckKernelMultProofSurfaceOk_true :
    hostModuleCheckKernelMultProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_mult_proof_surface_ids_eq :
    checkDepthKernelMultProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthKernelMultProofSurfaceScope = "KernelMultTheorems-only"
      && hostModuleCheckKernelMultProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
