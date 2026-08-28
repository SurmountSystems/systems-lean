/-
  SYSTEMS_LEAN_HOST partial -- KernelProgramTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelProgramTheorems dialect proof checks only. Same
  namespace SystemsLean.HostModuleCheck.

  KernelProgramTheorems L3 dialect subset (documented; not full Lean 4 tactic
  elaborator):
  - stageId_eq: statement must be stageId = "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0"
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - kernelProgramId_eq: statement kernelProgramId = "SELF-HOST-KERNEL-PROGRAM";
    proof body rfl.
  Other KernelProgramTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelProgramProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelProgramProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelProgramTheorems pilot only -- not package elaborate L4, not
    KernelEmitTheorems L3.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckMultProof / LinearProof / TypesProof).
  - KernelMultTheorems + KernelLinearTheorems + KernelTypesTheorems L3
    PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckKernelMultProof / KernelLinearProof / KernelTypesProof).
  - KernelProgram L2 TERM-SURFACE KernelProgram-only dual-ok unchanged
    (HostModuleCheckKernelProgramTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for KernelProgramTheorems is KernelProgramTheorems-only
    when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelProgramProof, PROOF-SURFACE, KernelProgramTheorems-only,
  ILL-TYPED-PROOF, checkKernelProgramTheoremsProofDialect,
  refineKernelProgramTheoremsWithProofSurface,
  hostModuleCheckBadKernelProgramThmWrongStmtText,
  hostModuleCheckBadKernelProgramThmSorryText,
  hostModuleCheckKernelProgramProofSurfaceOk,
  KernelProgramTheorems proof-surface pilot,
  hostModuleCheckKernelProgramProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelProgramProof
  Red/green: lake build SystemsLean.HostModuleCheckKernelProgramProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### KernelProgramTheorems L3 proof-surface dual-ok pins (KernelProgramTheorems-only) -/

/-- Named proof-surface depth bar for KernelProgramTheorems L3 pilot honesty.
    Greppable: checkDepthKernelProgramProofSurfaceBar, PROOF-SURFACE,
    KernelProgramTheorems-only. -/
def checkDepthKernelProgramProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: KernelProgramTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthKernelProgramProofSurfaceScope, KernelProgramTheorems-only,
    PROOF-SURFACE. -/
def checkDepthKernelProgramProofSurfaceScope : String := "KernelProgramTheorems-only"

/-- Dual-ok when KernelProgramTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckKernelProgramProofSurfaceDualOk, PROOF-SURFACE,
    KernelProgramTheorems-only. -/
def hostModuleCheckKernelProgramProofSurfaceDualOk : Bool := true

/-! ### KernelProgramTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- stageId_eq statement is stageId = "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0" (not True).
    Greppable: kernelProgramThmStageIdEqStmtOk, PROOF-SURFACE. -/
def kernelProgramThmStageIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "stageId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "stageId").length > 1
      && (n.splitOn "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0").length > 1
      && !((n.splitOn "True").length > 1)

/-- stageId_eq proof body is exactly rfl.
    Greppable: kernelProgramThmStageIdEqProofOk, PROOF-SURFACE. -/
def kernelProgramThmStageIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- kernelProgramId_eq statement cites kernelProgramId and SELF-HOST-KERNEL-PROGRAM.
    Greppable: kernelProgramThmIdEqStmtOk, PROOF-SURFACE. -/
def kernelProgramThmIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelProgramId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "kernelProgramId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "kernelProgramId").length > 1
      && (n.splitOn "SELF-HOST-KERNEL-PROGRAM").length > 1
      && !((n.splitOn "True").length > 1)

/-- kernelProgramId_eq proof body is exactly rfl.
    Greppable: kernelProgramThmIdEqProofOk, PROOF-SURFACE. -/
def kernelProgramThmIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelProgramId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- KernelProgramTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkKernelProgramTheoremsProofDialect, PROOF-SURFACE,
    KernelProgramTheorems proof-surface pilot. -/
def checkKernelProgramTheoremsProofDialect (content : String) : Option String :=
  if !kernelProgramThmStageIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelProgramThmStageIdEqProofOk content then some reasonIllTypedProof
  else if !kernelProgramThmIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelProgramThmIdEqProofOk content then some reasonIllTypedProof
  else none

/-- Apply KernelProgramTheorems L3 after a structural KernelProgramTheorems accept.
    Greppable: refineKernelProgramTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineKernelProgramTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelProgramTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelProgramTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed KernelProgramTheorems L3 good text (stageId_eq + kernelProgramId_eq
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodKernelProgramTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelProgramTheoremsProofText : String :=
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\" := rfl\n" ++
  "theorem kernelProgramId_eq : kernelProgramId = \"SELF-HOST-KERNEL-PROGRAM\" := rfl\n" ++
  "theorem programKernelReady_true : programKernelReady = true := by decide\n" ++
  "theorem programKernelOk_true : programKernelOk = true := by decide\n" ++
  "theorem lowerProgramKernel_isSome : lowerProgramKernel.isSome = true := by decide\n" ++
  "theorem programPathReady_true : programPathReady = true := by decide\n" ++
  "theorem programKernelProgram_length_three : True := trivial\n" ++
  "theorem programKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelProgramId_eq : True := trivial\n" ++
  "theorem programGraphPathReady_true : True := trivial\n" ++
  "theorem programComposePathReady_true : True := trivial\n" ++
  "theorem lowerProgramKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelProgram\n"

/-! ### Ill-typed KernelProgramTheorems twins (P1/P2). L0 tokens present; L3 reject. -/

/-- Shared KernelProgramTheorems body with stageId_eq / kernelProgramId_eq slots.
    Keeps 12 required theorem names for L0 accept dual-pin. -/
def kernelProgramTheoremsTwinSkeleton (stageIdLine : String)
    (kernelProgramIdLine : String) : String :=
  "import SystemsLean.KernelProgram\n" ++
  "namespace SystemsLean.KernelProgram\n" ++
  stageIdLine ++ "\n" ++
  kernelProgramIdLine ++ "\n" ++
  "theorem programKernelReady_true : programKernelReady = true := by decide\n" ++
  "theorem programKernelOk_true : programKernelOk = true := by decide\n" ++
  "theorem lowerProgramKernel_isSome : lowerProgramKernel.isSome = true := by decide\n" ++
  "theorem programPathReady_true : programPathReady = true := by decide\n" ++
  "theorem programKernelProgram_length_three : True := trivial\n" ++
  "theorem programKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelProgramId_eq : True := trivial\n" ++
  "theorem programGraphPathReady_true : True := trivial\n" ++
  "theorem programComposePathReady_true : True := trivial\n" ++
  "theorem lowerProgramKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelProgram\n"

/-- P1: wrong statement on stageId_eq (True / trivial). L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelProgramThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmWrongStmtText : String :=
  kernelProgramTheoremsTwinSkeleton
    "theorem stageId_eq : True := trivial"
    "theorem kernelProgramId_eq : kernelProgramId = \"SELF-HOST-KERNEL-PROGRAM\" := rfl"

/-- P2: by sorry on stageId_eq where real proof is rfl. L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelProgramThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmSorryText : String :=
  kernelProgramTheoremsTwinSkeleton
    "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_PROGRAM_V0\" := by sorry"
    "theorem kernelProgramId_eq : kernelProgramId = \"SELF-HOST-KERNEL-PROGRAM\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelProgramTheorems twin text for L0 dual-pin. -/
def kernelProgramTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelProgramTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadKernelProgramThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (kernelProgramTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelProgramThmWrongStmtText)
    kernelProgramExpectedNamespace kernelProgramTheoremsRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadKernelProgramThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (kernelProgramTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelProgramThmSorryText)
    kernelProgramExpectedNamespace kernelProgramTheoremsRequiredDecls
    (some "SystemsLean.KernelProgram")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelProgramProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckKernelProgramProofDialectOk : Bool :=
  (checkKernelProgramTheoremsProofDialect
    hostModuleCheckGoodKernelProgramTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadKernelProgramThmWrongStmtDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmWrongStmtDialectReject : Bool :=
  match checkKernelProgramTheoremsProofDialect
      hostModuleCheckBadKernelProgramThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadKernelProgramThmSorryDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelProgramThmSorryDialectReject : Bool :=
  match checkKernelProgramTheoremsProofDialect
      hostModuleCheckBadKernelProgramThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined KernelProgramTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelProgramProofSurfaceOk, PROOF-SURFACE,
    KernelProgramTheorems-only. -/
def hostModuleCheckKernelProgramProofSurfaceOk : Bool :=
  hostModuleCheckKernelProgramProofSurfaceDualOk
    && (checkDepthKernelProgramProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthKernelProgramProofSurfaceScope == "KernelProgramTheorems-only")
    && hostModuleCheckKernelProgramProofDialectOk
    && hostModuleCheckBadKernelProgramThmWrongStmtDialectReject
    && hostModuleCheckBadKernelProgramThmSorryDialectReject
    && hostModuleCheckBadKernelProgramThmWrongStmtL0Accept
    && hostModuleCheckBadKernelProgramThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelProgramProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckKernelProgramProofSurfaceOk_true :
    hostModuleCheckKernelProgramProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_program_proof_surface_ids_eq :
    checkDepthKernelProgramProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthKernelProgramProofSurfaceScope = "KernelProgramTheorems-only"
      && hostModuleCheckKernelProgramProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
