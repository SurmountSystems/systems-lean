/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckKernelEmitProof.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckKernelEmitProof.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckKernelEmitProofSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-EMIT-PROOF.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelEmitProofSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelEmitProofSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckKernelEmitProof.lean"

/-- Pinned live HostModuleCheckKernelEmitProof.lean bytes. -/
def liveHostModuleCheckKernelEmitProofSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelEmitTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelEmitTheorems dialect proof checks only. Same
  namespace SystemsLean.HostModuleCheck.

  KernelEmitTheorems L3 dialect subset (documented; not full Lean 4 tactic
  elaborator):
  - stageId_eq: statement must be stageId = "SLAKE_SELF_HOST_KERNEL_EMIT_V0"
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - kernelEmitId_eq: statement kernelEmitId = "SELF-HOST-KERNEL-EMIT";
    proof body rfl.
  Other KernelEmitTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelEmitProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelEmitProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelEmitTheorems pilot only -- not package elaborate L4.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckMultProof / LinearProof / TypesProof).
  - KernelMultTheorems + KernelLinearTheorems + KernelTypesTheorems +
    KernelProgramTheorems L3 PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckKernelMultProof / KernelLinearProof / KernelTypesProof /
    KernelProgramProof).
  - KernelEmit L2 TERM-SURFACE KernelEmit-only dual-ok unchanged
    (HostModuleCheckKernelEmitTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for KernelEmitTheorems is KernelEmitTheorems-only
    when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelEmitProof, PROOF-SURFACE, KernelEmitTheorems-only,
  ILL-TYPED-PROOF, checkKernelEmitTheoremsProofDialect,
  refineKernelEmitTheoremsWithProofSurface,
  hostModuleCheckBadKernelEmitThmWrongStmtText,
  hostModuleCheckBadKernelEmitThmSorryText,
  hostModuleCheckKernelEmitProofSurfaceOk,
  KernelEmitTheorems proof-surface pilot,
  hostModuleCheckKernelEmitProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelEmitProof
  Red/green: lake build SystemsLean.HostModuleCheckKernelEmitProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### KernelEmitTheorems L3 proof-surface dual-ok pins (KernelEmitTheorems-only) -/

/-- Named proof-surface depth bar for KernelEmitTheorems L3 pilot honesty.
    Greppable: checkDepthKernelEmitProofSurfaceBar, PROOF-SURFACE,
    KernelEmitTheorems-only. -/
def checkDepthKernelEmitProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: KernelEmitTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthKernelEmitProofSurfaceScope, KernelEmitTheorems-only,
    PROOF-SURFACE. -/
def checkDepthKernelEmitProofSurfaceScope : String := "KernelEmitTheorems-only"

/-- Dual-ok when KernelEmitTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckKernelEmitProofSurfaceDualOk, PROOF-SURFACE,
    KernelEmitTheorems-only. -/
def hostModuleCheckKernelEmitProofSurfaceDualOk : Bool := true

/-! ### KernelEmitTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- stageId_eq statement is stageId = "SLAKE_SELF_HOST_KERNEL_EMIT_V0" (not True).
    Greppable: kernelEmitThmStageIdEqStmtOk, PROOF-SURFACE. -/
def kernelEmitThmStageIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "stageId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "stageId").length > 1
      && (n.splitOn "SLAKE_SELF_HOST_KERNEL_EMIT_V0").length > 1
      && !((n.splitOn "True").length > 1)

/-- stageId_eq proof body is exactly rfl.
    Greppable: kernelEmitThmStageIdEqProofOk, PROOF-SURFACE. -/
def kernelEmitThmStageIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- kernelEmitId_eq statement cites kernelEmitId and SELF-HOST-KERNEL-EMIT.
    Greppable: kernelEmitThmIdEqStmtOk, PROOF-SURFACE. -/
def kernelEmitThmIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelEmitId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "kernelEmitId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "kernelEmitId").length > 1
      && (n.splitOn "SELF-HOST-KERNEL-EMIT").length > 1
      && !((n.splitOn "True").length > 1)

/-- kernelEmitId_eq proof body is exactly rfl.
    Greppable: kernelEmitThmIdEqProofOk, PROOF-SURFACE. -/
def kernelEmitThmIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelEmitId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- KernelEmitTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkKernelEmitTheoremsProofDialect, PROOF-SURFACE,
    KernelEmitTheorems proof-surface pilot. -/
def checkKernelEmitTheoremsProofDialect (content : String) : Option String :=
  if !kernelEmitThmStageIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelEmitThmStageIdEqProofOk content then some reasonIllTypedProof
  else if !kernelEmitThmIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelEmitThmIdEqProofOk content then some reasonIllTypedProof
  else none

/-- Apply KernelEmitTheorems L3 after a structural KernelEmitTheorems accept.
    Greppable: refineKernelEmitTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineKernelEmitTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelEmitTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelEmitTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed KernelEmitTheorems L3 good text (stageId_eq + kernelEmitId_eq
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodKernelEmitTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelEmitTheoremsProofText : String :=
  "import SystemsLean.KernelEmit\n" ++
  "namespace SystemsLean.KernelEmit\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\" := rfl\n" ++
  "theorem kernelEmitId_eq : kernelEmitId = \"SELF-HOST-KERNEL-EMIT\" := rfl\n" ++
  "theorem hostKernelEmitId_eq : True := trivial\n" ++
  "theorem emitKernelReady_true : True := trivial\n" ++
  "theorem emitKernelOk_true : True := trivial\n" ++
  "theorem emitPlanPathReady_true : True := trivial\n" ++
  "theorem emitApplyPathReady_true : True := trivial\n" ++
  "theorem emitBodyPathReady_true : True := trivial\n" ++
  "theorem lowerEmitCompose_isSome : True := trivial\n" ++
  "theorem lowerEmitCompose_plan_counts : True := trivial\n" ++
  "theorem lowerEmitCompose_apply_tags : True := trivial\n" ++
  "theorem lowerEmitCompose_body_fragment : True := trivial\n" ++
  "end SystemsLean.KernelEmit\n"

/-! ### Ill-typed KernelEmitTheorems twins (P1/P2). L0 tokens present; L3 reject. -/

/-- Shared KernelEmitTheorems body with stageId_eq / kernelEmitId_eq slots.
    Keeps 12 required theorem names for L0 accept dual-pin. -/
def kernelEmitTheoremsTwinSkeleton (stageIdLine : String)
    (kernelEmitIdLine : String) : String :=
  "import SystemsLean.KernelEmit\n" ++
  "namespace SystemsLean.KernelEmit\n" ++
  stageIdLine ++ "\n" ++
  kernelEmitIdLine ++ "\n" ++
  "theorem hostKernelEmitId_eq : True := trivial\n" ++
  "theorem emitKernelReady_true : True := trivial\n" ++
  "theorem emitKernelOk_true : True := trivial\n" ++
  "theorem emitPlanPathReady_true : True := trivial\n" ++
  "theorem emitApplyPathReady_true : True := trivial\n" ++
  "theorem emitBodyPathReady_true : True := trivial\n" ++
  "theorem lowerEmitCompose_isSome : True := trivial\n" ++
  "theorem lowerEmitCompose_plan_counts : True := trivial\n" ++
  "theorem lowerEmitCompose_apply_tags : True := trivial\n" ++
  "theorem lowerEmitCompose_body_fragment : True := trivial\n" ++
  "end SystemsLean.KernelEmit\n"

/-- P1: wrong statement on stageId_eq (True / trivial). L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelEmitThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmWrongStmtText : String :=
  kernelEmitTheoremsTwinSkeleton
    "theorem stageId_eq : True := trivial"
    "theorem kernelEmitId_eq : kernelEmitId = \"SELF-HOST-KERNEL-EMIT\" := rfl"

/-- P2: by sorry on stageId_eq where real proof is rfl. L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelEmitThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmSorryText : String :=
  kernelEmitTheoremsTwinSkeleton
    "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_EMIT_V0\" := by sorry"
    "theorem kernelEmitId_eq : kernelEmitId = \"SELF-HOST-KERNEL-EMIT\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelEmitTheorems twin text for L0 dual-pin. -/
def kernelEmitTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelEmitTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadKernelEmitThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (kernelEmitTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelEmitThmWrongStmtText)
    kernelEmitExpectedNamespace kernelEmitTheoremsRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadKernelEmitThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (kernelEmitTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelEmitThmSorryText)
    kernelEmitExpectedNamespace kernelEmitTheoremsRequiredDecls
    (some "SystemsLean.KernelEmit")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelEmitProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckKernelEmitProofDialectOk : Bool :=
  (checkKernelEmitTheoremsProofDialect
    hostModuleCheckGoodKernelEmitTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadKernelEmitThmWrongStmtDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmWrongStmtDialectReject : Bool :=
  match checkKernelEmitTheoremsProofDialect
      hostModuleCheckBadKernelEmitThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadKernelEmitThmSorryDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelEmitThmSorryDialectReject : Bool :=
  match checkKernelEmitTheoremsProofDialect
      hostModuleCheckBadKernelEmitThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined KernelEmitTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelEmitProofSurfaceOk, PROOF-SURFACE,
    KernelEmitTheorems-only. -/
def hostModuleCheckKernelEmitProofSurfaceOk : Bool :=
  hostModuleCheckKernelEmitProofSurfaceDualOk
    && (checkDepthKernelEmitProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthKernelEmitProofSurfaceScope == "KernelEmitTheorems-only")
    && hostModuleCheckKernelEmitProofDialectOk
    && hostModuleCheckBadKernelEmitThmWrongStmtDialectReject
    && hostModuleCheckBadKernelEmitThmSorryDialectReject
    && hostModuleCheckBadKernelEmitThmWrongStmtL0Accept
    && hostModuleCheckBadKernelEmitThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelEmitProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckKernelEmitProofSurfaceOk_true :
    hostModuleCheckKernelEmitProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_emit_proof_surface_ids_eq :
    checkDepthKernelEmitProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthKernelEmitProofSurfaceScope = "KernelEmitTheorems-only"
      && hostModuleCheckKernelEmitProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckKernelEmitProofSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckKernelEmitProofSourceReady : Bool :=
  liveRel == "HostModuleCheckKernelEmitProof.lean"
    && kernelCheckLiveHostModuleCheckKernelEmitProofSource liveHostModuleCheckKernelEmitProofSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckKernelEmitProofSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckKernelEmitProof.lean")
  let k := kernelCheckLiveHostModuleCheckKernelEmitProofSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckKernelEmitProof parse false")
  unless hostFrontLiveHostModuleCheckKernelEmitProofSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckKernelEmitProofSource
