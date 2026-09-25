/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckKernelLinearProof.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckKernelLinearProofSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckKernelLinearProof.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckKernelLinearProofSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKKERNELLINEARPROOF, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProofSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof

/-- Dual-pinned live HostModuleCheckKernelLinearProof.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckKernelLinearProofSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKKERNELLINEARPROOF. -/
def liveHostModuleCheckKernelLinearProofSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelLinearTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelLinearTheorems dialect proof checks only. Same
  namespace SystemsLean.HostModuleCheck.

  KernelLinearTheorems L3 dialect subset (documented; not full Lean 4 tactic
  elaborator):
  - stageId_eq: statement must be stageId = "SLAKE_SELF_HOST_KERNEL_LINEAR_V0"
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - kernelLinearId_eq: statement kernelLinearId = "SELF-HOST-KERNEL-LINEAR";
    proof body rfl.
  Other KernelLinearTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelLinearProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelLinearProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelLinearTheorems pilot only -- not package elaborate L4, not
    KernelTypesTheorems / KernelProgramTheorems / KernelEmitTheorems L3.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckMultProof / LinearProof / TypesProof).
  - KernelMultTheorems L3 PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckKernelMultProof).
  - KernelLinear L2 TERM-SURFACE KernelLinear-only dual-ok unchanged
    (HostModuleCheckKernelLinearTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for KernelLinearTheorems is KernelLinearTheorems-only
    when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelLinearProof, PROOF-SURFACE, KernelLinearTheorems-only,
  ILL-TYPED-PROOF, checkKernelLinearTheoremsProofDialect,
  refineKernelLinearTheoremsWithProofSurface,
  hostModuleCheckBadKernelLinearThmWrongStmtText,
  hostModuleCheckBadKernelLinearThmSorryText,
  hostModuleCheckKernelLinearProofSurfaceOk,
  KernelLinearTheorems proof-surface pilot,
  hostModuleCheckKernelLinearProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelLinearProof
  Red/green: lake build SystemsLean.HostModuleCheckKernelLinearProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### KernelLinearTheorems L3 proof-surface dual-ok pins (KernelLinearTheorems-only) -/

/-- Named proof-surface depth bar for KernelLinearTheorems L3 pilot honesty.
    Greppable: checkDepthKernelLinearProofSurfaceBar, PROOF-SURFACE,
    KernelLinearTheorems-only. -/
def checkDepthKernelLinearProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: KernelLinearTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthKernelLinearProofSurfaceScope, KernelLinearTheorems-only,
    PROOF-SURFACE. -/
def checkDepthKernelLinearProofSurfaceScope : String := "KernelLinearTheorems-only"

/-- Dual-ok when KernelLinearTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckKernelLinearProofSurfaceDualOk, PROOF-SURFACE,
    KernelLinearTheorems-only. -/
def hostModuleCheckKernelLinearProofSurfaceDualOk : Bool := true

/-! ### KernelLinearTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- stageId_eq statement is stageId = "SLAKE_SELF_HOST_KERNEL_LINEAR_V0" (not True).
    Greppable: kernelLinearThmStageIdEqStmtOk, PROOF-SURFACE. -/
def kernelLinearThmStageIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "stageId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "stageId").length > 1
      && (n.splitOn "SLAKE_SELF_HOST_KERNEL_LINEAR_V0").length > 1
      && !((n.splitOn "True").length > 1)

/-- stageId_eq proof body is exactly rfl.
    Greppable: kernelLinearThmStageIdEqProofOk, PROOF-SURFACE. -/
def kernelLinearThmStageIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- kernelLinearId_eq statement cites kernelLinearId and SELF-HOST-KERNEL-LINEAR.
    Greppable: kernelLinearThmIdEqStmtOk, PROOF-SURFACE. -/
def kernelLinearThmIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelLinearId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "kernelLinearId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "kernelLinearId").length > 1
      && (n.splitOn "SELF-HOST-KERNEL-LINEAR").length > 1
      && !((n.splitOn "True").length > 1)

/-- kernelLinearId_eq proof body is exactly rfl.
    Greppable: kernelLinearThmIdEqProofOk, PROOF-SURFACE. -/
def kernelLinearThmIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelLinearId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- KernelLinearTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkKernelLinearTheoremsProofDialect, PROOF-SURFACE,
    KernelLinearTheorems proof-surface pilot. -/
def checkKernelLinearTheoremsProofDialect (content : String) : Option String :=
  if !kernelLinearThmStageIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelLinearThmStageIdEqProofOk content then some reasonIllTypedProof
  else if !kernelLinearThmIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelLinearThmIdEqProofOk content then some reasonIllTypedProof
  else none

/-- Apply KernelLinearTheorems L3 after a structural KernelLinearTheorems accept.
    Greppable: refineKernelLinearTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineKernelLinearTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelLinearTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelLinearTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed KernelLinearTheorems L3 good text (stageId_eq + kernelLinearId_eq
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodKernelLinearTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelLinearTheoremsProofText : String :=
  "import SystemsLean.KernelLinear\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\" := rfl\n" ++
  "theorem kernelLinearId_eq : kernelLinearId = \"SELF-HOST-KERNEL-LINEAR\" := rfl\n" ++
  "theorem linearKernelReady_true : linearKernelReady = true := by decide\n" ++
  "theorem linearKernelOk_true : linearKernelOk = true := by decide\n" ++
  "theorem lowerLinearKernel_isSome : lowerLinearKernel.isSome = true := by decide\n" ++
  "theorem linearMismatchRejected_true : linearMismatchRejected = true := by decide\n" ++
  "theorem linearKernelProgram_length_one : True := trivial\n" ++
  "theorem linearKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelLinearId_eq : True := trivial\n" ++
  "theorem linearHostPathReady_true : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerLinearKernel_length_one : True := trivial\n" ++
  "end SystemsLean.KernelLinear\n"

/-! ### Ill-typed KernelLinearTheorems twins (P1/P2). L0 tokens present; L3 reject. -/

/-- Shared KernelLinearTheorems body with stageId_eq / kernelLinearId_eq slots.
    Keeps 12 required theorem names for L0 accept dual-pin. -/
def kernelLinearTheoremsTwinSkeleton (stageIdLine : String)
    (kernelLinearIdLine : String) : String :=
  "import SystemsLean.KernelLinear\n" ++
  "namespace SystemsLean.KernelLinear\n" ++
  stageIdLine ++ "\n" ++
  kernelLinearIdLine ++ "\n" ++
  "theorem linearKernelReady_true : linearKernelReady = true := by decide\n" ++
  "theorem linearKernelOk_true : linearKernelOk = true := by decide\n" ++
  "theorem lowerLinearKernel_isSome : lowerLinearKernel.isSome = true := by decide\n" ++
  "theorem linearMismatchRejected_true : linearMismatchRejected = true := by decide\n" ++
  "theorem linearKernelProgram_length_one : True := trivial\n" ++
  "theorem linearKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelLinearId_eq : True := trivial\n" ++
  "theorem linearHostPathReady_true : True := trivial\n" ++
  "theorem programCompileReady_empty_false : True := trivial\n" ++
  "theorem lowerLinearKernel_length_one : True := trivial\n" ++
  "end SystemsLean.KernelLinear\n"

/-- P1: wrong statement on stageId_eq (True / trivial). L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelLinearThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmWrongStmtText : String :=
  kernelLinearTheoremsTwinSkeleton
    "theorem stageId_eq : True := trivial"
    "theorem kernelLinearId_eq : kernelLinearId = \"SELF-HOST-KERNEL-LINEAR\" := rfl"

/-- P2: by sorry on stageId_eq where real proof is rfl. L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelLinearThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmSorryText : String :=
  kernelLinearTheoremsTwinSkeleton
    "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_LINEAR_V0\" := by sorry"
    "theorem kernelLinearId_eq : kernelLinearId = \"SELF-HOST-KERNEL-LINEAR\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelLinearTheorems twin text for L0 dual-pin. -/
def kernelLinearTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelLinearTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadKernelLinearThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (kernelLinearTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelLinearThmWrongStmtText)
    kernelLinearExpectedNamespace kernelLinearTheoremsRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadKernelLinearThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (kernelLinearTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelLinearThmSorryText)
    kernelLinearExpectedNamespace kernelLinearTheoremsRequiredDecls
    (some "SystemsLean.KernelLinear")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelLinearProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckKernelLinearProofDialectOk : Bool :=
  (checkKernelLinearTheoremsProofDialect
    hostModuleCheckGoodKernelLinearTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadKernelLinearThmWrongStmtDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmWrongStmtDialectReject : Bool :=
  match checkKernelLinearTheoremsProofDialect
      hostModuleCheckBadKernelLinearThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadKernelLinearThmSorryDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelLinearThmSorryDialectReject : Bool :=
  match checkKernelLinearTheoremsProofDialect
      hostModuleCheckBadKernelLinearThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined KernelLinearTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelLinearProofSurfaceOk, PROOF-SURFACE,
    KernelLinearTheorems-only. -/
def hostModuleCheckKernelLinearProofSurfaceOk : Bool :=
  hostModuleCheckKernelLinearProofSurfaceDualOk
    && (checkDepthKernelLinearProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthKernelLinearProofSurfaceScope == "KernelLinearTheorems-only")
    && hostModuleCheckKernelLinearProofDialectOk
    && hostModuleCheckBadKernelLinearThmWrongStmtDialectReject
    && hostModuleCheckBadKernelLinearThmSorryDialectReject
    && hostModuleCheckBadKernelLinearThmWrongStmtL0Accept
    && hostModuleCheckBadKernelLinearThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelLinearProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckKernelLinearProofSurfaceOk_true :
    hostModuleCheckKernelLinearProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_linear_proof_surface_ids_eq :
    checkDepthKernelLinearProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthKernelLinearProofSurfaceScope = "KernelLinearTheorems-only"
      && hostModuleCheckKernelLinearProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckKernelLinearProof
