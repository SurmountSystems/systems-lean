/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckKernelTypesProof.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckKernelTypesProof.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckKernelTypesProofSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-TYPES-PROOF.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckKernelTypesProof.lean"

/-- Pinned live HostModuleCheckKernelTypesProof.lean bytes. -/
def liveHostModuleCheckKernelTypesProofSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelTypesTheorems L3 proof-surface pilot.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelTypesTheorems dialect proof checks only. Same
  namespace SystemsLean.HostModuleCheck.

  KernelTypesTheorems L3 dialect subset (documented; not full Lean 4 tactic
  elaborator):
  - stageId_eq: statement must be stageId = "SLAKE_SELF_HOST_KERNEL_TYPES_V0"
    (reject : True); proof body after := must be rfl (reject by sorry / trivial).
  - kernelTypesId_eq: statement kernelTypesId = "SELF-HOST-KERNEL-TYPES";
    proof body rfl.
  Other KernelTypesTheorems theorems stay L0/L1 token presence only this pilot.
  Not a full proof elaborator (no tactic scripts, no goals, no mathlib).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelTypesProofSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelTypesProofSurfaceOk (E-good dialect +
    P1/P2 dialect reject + L0Accept). Driver smoke + LoadOk fold SurfaceOk,
    not bare dualOk alone.

  Intentional non-claims:
  - KernelTypesTheorems pilot only -- not package elaborate L4, not
    KernelProgramTheorems / KernelEmitTheorems L3.
  - Mult/Linear/Types PROOF-SURFACE dual-ok unchanged
    (HostModuleCheckMultProof / LinearProof / TypesProof).
  - KernelMultTheorems + KernelLinearTheorems L3 PROOF-SURFACE dual-ok
    unchanged (HostModuleCheckKernelMultProof / KernelLinearProof).
  - KernelTypes L2 TERM-SURFACE KernelTypes-only dual-ok unchanged
    (HostModuleCheckKernelTypesTerm).
  - Not full elaborator typecheck. Not FullHostElaborateRemains re-true.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - PROOF-SURFACE dual-ok for KernelTypesTheorems is KernelTypesTheorems-only
    when E-bad rejects land.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelTypesProof, PROOF-SURFACE, KernelTypesTheorems-only,
  ILL-TYPED-PROOF, checkKernelTypesTheoremsProofDialect,
  refineKernelTypesTheoremsWithProofSurface,
  hostModuleCheckBadKernelTypesThmWrongStmtText,
  hostModuleCheckBadKernelTypesThmSorryText,
  hostModuleCheckKernelTypesProofSurfaceOk,
  KernelTypesTheorems proof-surface pilot,
  hostModuleCheckKernelTypesProofSurfaceDualOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelTypesProof
  Red/green: lake build SystemsLean.HostModuleCheckKernelTypesProof;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultProof

namespace SystemsLean.HostModuleCheck

/-! ### KernelTypesTheorems L3 proof-surface dual-ok pins (KernelTypesTheorems-only) -/

/-- Named proof-surface depth bar for KernelTypesTheorems L3 pilot honesty.
    Greppable: checkDepthKernelTypesProofSurfaceBar, PROOF-SURFACE,
    KernelTypesTheorems-only. -/
def checkDepthKernelTypesProofSurfaceBar : String := "PROOF-SURFACE"

/-- Honesty scope: KernelTypesTheorems.lean pilot only (not package elaborate).
    Greppable: checkDepthKernelTypesProofSurfaceScope, KernelTypesTheorems-only,
    PROOF-SURFACE. -/
def checkDepthKernelTypesProofSurfaceScope : String := "KernelTypesTheorems-only"

/-- Dual-ok when KernelTypesTheorems L3 E-good/E-bad rejects work (pilot only).
    Greppable: hostModuleCheckKernelTypesProofSurfaceDualOk, PROOF-SURFACE,
    KernelTypesTheorems-only. -/
def hostModuleCheckKernelTypesProofSurfaceDualOk : Bool := true

/-! ### KernelTypesTheorems L3 dialect checks (reuse MultProof line helpers) -/

/-- stageId_eq statement is stageId = "SLAKE_SELF_HOST_KERNEL_TYPES_V0" (not True).
    Greppable: kernelTypesThmStageIdEqStmtOk, PROOF-SURFACE. -/
def kernelTypesThmStageIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "stageId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "stageId").length > 1
      && (n.splitOn "SLAKE_SELF_HOST_KERNEL_TYPES_V0").length > 1
      && !((n.splitOn "True").length > 1)

/-- stageId_eq proof body is exactly rfl.
    Greppable: kernelTypesThmStageIdEqProofOk, PROOF-SURFACE. -/
def kernelTypesThmStageIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "stageId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- kernelTypesId_eq statement cites kernelTypesId and SELF-HOST-KERNEL-TYPES.
    Greppable: kernelTypesThmIdEqStmtOk, PROOF-SURFACE. -/
def kernelTypesThmIdEqStmtOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelTypesId_eq" with
  | none => false
  | some line =>
    let stmt := theoremStatementAfterName line "kernelTypesId_eq"
    let n := collapseWsProof stmt
    (n.splitOn "kernelTypesId").length > 1
      && (n.splitOn "SELF-HOST-KERNEL-TYPES").length > 1
      && !((n.splitOn "True").length > 1)

/-- kernelTypesId_eq proof body is exactly rfl.
    Greppable: kernelTypesThmIdEqProofOk, PROOF-SURFACE. -/
def kernelTypesThmIdEqProofOk (content : String) : Bool :=
  match findTheoremHeaderLine content "kernelTypesId_eq" with
  | none => false
  | some line =>
    let body := collapseWsProof (proofBodyAfterAssign line)
    body == "rfl"

/-- KernelTypesTheorems L3 proof-surface check. None = ok; some reason = reject.
    Greppable: checkKernelTypesTheoremsProofDialect, PROOF-SURFACE,
    KernelTypesTheorems proof-surface pilot. -/
def checkKernelTypesTheoremsProofDialect (content : String) : Option String :=
  if !kernelTypesThmStageIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelTypesThmStageIdEqProofOk content then some reasonIllTypedProof
  else if !kernelTypesThmIdEqStmtOk content then some reasonIllTypedProof
  else if !kernelTypesThmIdEqProofOk content then some reasonIllTypedProof
  else none

/-- Apply KernelTypesTheorems L3 after a structural KernelTypesTheorems accept.
    Greppable: refineKernelTypesTheoremsWithProofSurface, PROOF-SURFACE. -/
def refineKernelTypesTheoremsWithProofSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelTypesTheoremsProofDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

/-! ### KernelTypesTheorems L3 well-typed good fixture (E-good; proof surface) -/

/-- Well-typed KernelTypesTheorems L3 good text (stageId_eq + kernelTypesId_eq
    rfl pins; remaining required theorem names present for L0).
    Greppable: hostModuleCheckGoodKernelTypesTheoremsProofText, PROOF-SURFACE. -/
def hostModuleCheckGoodKernelTypesTheoremsProofText : String :=
  "import SystemsLean.KernelTypes\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\" := rfl\n" ++
  "theorem kernelTypesId_eq : kernelTypesId = \"SELF-HOST-KERNEL-TYPES\" := rfl\n" ++
  "theorem typesKernelReady_true : typesKernelReady = true := by decide\n" ++
  "theorem typesKernelOk_true : typesKernelOk = true := by decide\n" ++
  "theorem lowerTypesKernel_isSome : lowerTypesKernel.isSome = true := by decide\n" ++
  "theorem unknownKindRejected_true : unknownKindRejected = true := by decide\n" ++
  "theorem typesKernelProgram_length_three : True := trivial\n" ++
  "theorem typesKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelTypesId_eq : True := trivial\n" ++
  "theorem typesProgramPathReady_true : True := trivial\n" ++
  "theorem kindMultMismatchRejected_true : True := trivial\n" ++
  "theorem lowerTypesKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelTypes\n"

/-! ### Ill-typed KernelTypesTheorems twins (P1/P2). L0 tokens present; L3 reject. -/

/-- Shared KernelTypesTheorems body with stageId_eq / kernelTypesId_eq slots.
    Keeps 12 required theorem names for L0 accept dual-pin. -/
def kernelTypesTheoremsTwinSkeleton (stageIdLine : String)
    (kernelTypesIdLine : String) : String :=
  "import SystemsLean.KernelTypes\n" ++
  "namespace SystemsLean.KernelTypes\n" ++
  stageIdLine ++ "\n" ++
  kernelTypesIdLine ++ "\n" ++
  "theorem typesKernelReady_true : typesKernelReady = true := by decide\n" ++
  "theorem typesKernelOk_true : typesKernelOk = true := by decide\n" ++
  "theorem lowerTypesKernel_isSome : lowerTypesKernel.isSome = true := by decide\n" ++
  "theorem unknownKindRejected_true : unknownKindRejected = true := by decide\n" ++
  "theorem typesKernelProgram_length_three : True := trivial\n" ++
  "theorem typesKernelProgram_isWellTyped : True := trivial\n" ++
  "theorem hostKernelTypesId_eq : True := trivial\n" ++
  "theorem typesProgramPathReady_true : True := trivial\n" ++
  "theorem kindMultMismatchRejected_true : True := trivial\n" ++
  "theorem lowerTypesKernel_length_three : True := trivial\n" ++
  "end SystemsLean.KernelTypes\n"

/-- P1: wrong statement on stageId_eq (True / trivial). L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelTypesThmWrongStmtText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmWrongStmtText : String :=
  kernelTypesTheoremsTwinSkeleton
    "theorem stageId_eq : True := trivial"
    "theorem kernelTypesId_eq : kernelTypesId = \"SELF-HOST-KERNEL-TYPES\" := rfl"

/-- P2: by sorry on stageId_eq where real proof is rfl. L0 still has
    theorem:stageId_eq.
    Greppable: hostModuleCheckBadKernelTypesThmSorryText, PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmSorryText : String :=
  kernelTypesTheoremsTwinSkeleton
    "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_KERNEL_TYPES_V0\" := by sorry"
    "theorem kernelTypesId_eq : kernelTypesId = \"SELF-HOST-KERNEL-TYPES\" := rfl"

/-! ### L0-only structural accept of ill-typed twins (tokens present) -/

/-- Surface from KernelTypesTheorems twin text for L0 dual-pin. -/
def kernelTypesTheoremsProofSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelTypesTheorems"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- L0/L1 still accept P1 when theorem names present.
    Greppable: hostModuleCheckBadKernelTypesThmWrongStmtL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmWrongStmtL0Accept : Bool :=
  (checkNamedSurface
    (kernelTypesTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelTypesThmWrongStmtText)
    kernelTypesExpectedNamespace kernelTypesTheoremsRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- L0/L1 still accept P2 when theorem names present.
    Greppable: hostModuleCheckBadKernelTypesThmSorryL0Accept, PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmSorryL0Accept : Bool :=
  (checkNamedSurface
    (kernelTypesTheoremsProofSurfaceFrom
      hostModuleCheckBadKernelTypesThmSorryText)
    kernelTypesExpectedNamespace kernelTypesTheoremsRequiredDecls
    (some "SystemsLean.KernelTypes")).isAccept

/-- Dialect-only good path (E-good without full checkRealModule).
    Greppable: hostModuleCheckKernelTypesProofDialectOk, PROOF-SURFACE. -/
def hostModuleCheckKernelTypesProofDialectOk : Bool :=
  (checkKernelTypesTheoremsProofDialect
    hostModuleCheckGoodKernelTypesTheoremsProofText).isNone

/-- Dialect rejects P1 wrong statement.
    Greppable: hostModuleCheckBadKernelTypesThmWrongStmtDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmWrongStmtDialectReject : Bool :=
  match checkKernelTypesTheoremsProofDialect
      hostModuleCheckBadKernelTypesThmWrongStmtText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Dialect rejects P2 by sorry.
    Greppable: hostModuleCheckBadKernelTypesThmSorryDialectReject,
    PROOF-SURFACE. -/
def hostModuleCheckBadKernelTypesThmSorryDialectReject : Bool :=
  match checkKernelTypesTheoremsProofDialect
      hostModuleCheckBadKernelTypesThmSorryText with
  | some r => r == reasonIllTypedProof
  | none => false

/-- Combined KernelTypesTheorems L3 dual-pin (good + two rejects + L0 still accept).
    Gate for dual-ok honesty (not bare dualOk alone). LoadOk + Driver use this.
    Greppable: hostModuleCheckKernelTypesProofSurfaceOk, PROOF-SURFACE,
    KernelTypesTheorems-only. -/
def hostModuleCheckKernelTypesProofSurfaceOk : Bool :=
  hostModuleCheckKernelTypesProofSurfaceDualOk
    && (checkDepthKernelTypesProofSurfaceBar == "PROOF-SURFACE")
    && (checkDepthKernelTypesProofSurfaceScope == "KernelTypesTheorems-only")
    && hostModuleCheckKernelTypesProofDialectOk
    && hostModuleCheckBadKernelTypesThmWrongStmtDialectReject
    && hostModuleCheckBadKernelTypesThmSorryDialectReject
    && hostModuleCheckBadKernelTypesThmWrongStmtL0Accept
    && hostModuleCheckBadKernelTypesThmSorryL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckKernelTypesProofSurfaceOk_true, PROOF-SURFACE. -/
theorem hostModuleCheckKernelTypesProofSurfaceOk_true :
    hostModuleCheckKernelTypesProofSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_types_proof_surface_ids_eq :
    checkDepthKernelTypesProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthKernelTypesProofSurfaceScope = "KernelTypesTheorems-only"
      && hostModuleCheckKernelTypesProofSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckKernelTypesProofSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckKernelTypesProofSourceReady : Bool :=
  liveRel == "HostModuleCheckKernelTypesProof.lean"
    && kernelCheckLiveHostModuleCheckKernelTypesProofSource liveHostModuleCheckKernelTypesProofSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckKernelTypesProofSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckKernelTypesProof.lean")
  let k := kernelCheckLiveHostModuleCheckKernelTypesProofSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckKernelTypesProof parse false")
  unless hostFrontLiveHostModuleCheckKernelTypesProofSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckKernelTypesProofSource
