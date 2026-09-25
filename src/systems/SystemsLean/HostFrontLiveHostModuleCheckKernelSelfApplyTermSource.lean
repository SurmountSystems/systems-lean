/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckKernelSelfApplyTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckKernelSelfApplyTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckKernelSelfApplyTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-KERNEL-SELF-APPLY-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckKernelSelfApplyTerm.lean"

/-- Pinned live HostModuleCheckKernelSelfApplyTerm.lean bytes. -/
def liveHostModuleCheckKernelSelfApplyTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- KernelSelfApply L2 term-surface (U1 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: KernelSelfApply dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  KernelSelfApply L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0".
  - hostId body "HOST-SELF-HOST-KERNEL-SELF-APPLY".
  - selfHostId body "SELF-HOST-KERNEL-SELF-APPLY".
  - productKernelSelfApplyModuleCite body "KernelSelfApply".
  - productKernelSelfApplyPartialReady definitional alias productKernelBarSurfaceOk.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckKernelSelfApplyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckKernelSelfApplyTermSurfaceOk.

  Intentional non-claims:
  - KernelSelfApply pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ParityEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckKernelSelfApplyTerm, TERM-SURFACE, KernelSelfApply-only,
  ILL-TYPED-TERM, checkKernelSelfApplyTermDialect,
  hostModuleCheckBadKernelSelfApplyStageIdText,
  hostModuleCheckBadKernelSelfApplyReadyText,
  hostModuleCheckBadKernelSelfApplyOkText,
  hostModuleCheckBadKernelSelfApplyCiteText,
  hostModuleCheckKernelSelfApplyTermDialectOk,
  hostModuleCheckKernelSelfApplyTermSurfaceDualOk,
  hostModuleCheckKernelSelfApplyTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckKernelSelfApplyTerm
  Red/green: lake build SystemsLean.HostModuleCheckKernelSelfApplyTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### KernelSelfApply L2 term-surface dual-ok pins (KernelSelfApply-only) -/

def checkDepthKernelSelfApplyTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthKernelSelfApplyTermSurfaceScope : String := "KernelSelfApply-only"
def hostModuleCheckKernelSelfApplyTermSurfaceDualOk : Bool := true

def kernelSelfApplyStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\""

def kernelSelfApplyHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostId" with
  | none => false
  | some body => body == "\"HOST-SELF-HOST-KERNEL-SELF-APPLY\""

def kernelSelfApplySelfHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostId" with
  | none => false
  | some body => body == "\"SELF-HOST-KERNEL-SELF-APPLY\""

def kernelSelfApplyCiteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "productKernelSelfApplyModuleCite" with
  | none => false
  | some body => body == "\"KernelSelfApply\""

def kernelSelfApplyReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "productKernelSelfApplyPartialReady" with
  | none => false
  | some body => body == "productKernelBarSurfaceOk"

def checkKernelSelfApplyTermDialect (content : String) : Option String :=
  if !kernelSelfApplyStageIdBodyOk content then some reasonIllTypedTerm
  else if !kernelSelfApplyHostIdBodyOk content then some reasonIllTypedTerm
  else if !kernelSelfApplySelfHostIdBodyOk content then some reasonIllTypedTerm
  else if !kernelSelfApplyCiteBodyOk content then some reasonIllTypedTerm
  else if !kernelSelfApplyReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineKernelSelfApplyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkKernelSelfApplyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckKernelSelfApplyTermSkeletonPrefix : String :=
  "namespace SystemsLean.KernelSelfApply\n"

def hostModuleCheckKernelSelfApplyTermSkeletonSuffix : String :=
  "end SystemsLean.KernelSelfApply\n"

def hostModuleCheckKernelSelfApplyTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"KernelSelfApply\"\n" ++
  "def productKernelBarMult : String := \"HOST-EMIT-MULT\"\n" ++
  "def productKernelBarLinear : String := \"HOST-EMIT-LINEAR\"\n" ++
  "def productKernelBarErasure : String := \"HOST-EMIT-ERASURE\"\n" ++
  "def productKernelBarTypes : String := \"HOST-EMIT-TYPES\"\n" ++
  "def productKernelBarProgram : String := \"HOST-EMIT-PROGRAM\"\n" ++
  "def acceptancePath : String := \"src/systems/self-host.md\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := productKernelBarSurfaceOk\n"

def hostModuleCheckGoodKernelSelfApplyTermText : String :=
  hostModuleCheckKernelSelfApplyTermSkeletonPrefix
    ++ hostModuleCheckKernelSelfApplyTermGoodMid
    ++ hostModuleCheckKernelSelfApplyTermSkeletonSuffix

def hostModuleCheckBadKernelSelfApplyStageIdText : String :=
  hostModuleCheckKernelSelfApplyTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"KernelSelfApply\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := productKernelBarSurfaceOk\n" ++
  hostModuleCheckKernelSelfApplyTermSkeletonSuffix

def hostModuleCheckBadKernelSelfApplyReadyText : String :=
  hostModuleCheckKernelSelfApplyTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"KernelSelfApply\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := true\n" ++
  hostModuleCheckKernelSelfApplyTermSkeletonSuffix

def hostModuleCheckBadKernelSelfApplyOkText : String :=
  hostModuleCheckKernelSelfApplyTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\"\n" ++
  "def hostId : String := \"WRONG_HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"KernelSelfApply\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := productKernelBarSurfaceOk\n" ++
  hostModuleCheckKernelSelfApplyTermSkeletonSuffix

def hostModuleCheckBadKernelSelfApplyCiteText : String :=
  hostModuleCheckKernelSelfApplyTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_KERNEL_SELF_APPLY_V0\"\n" ++
  "def hostId : String := \"HOST-SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def selfHostId : String := \"SELF-HOST-KERNEL-SELF-APPLY\"\n" ++
  "def productKernelSelfApplyModuleCite : String := \"WrongCite\"\n" ++
  "def productKernelBarSurfaceOk : Bool := true\n" ++
  "def productKernelSelfApplyPartialReady : Bool := productKernelBarSurfaceOk\n" ++
  hostModuleCheckKernelSelfApplyTermSkeletonSuffix

def kernelSelfApplyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.KernelSelfApply"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadKernelSelfApplyStageIdL0Accept : Bool :=
  (checkNamedSurface (kernelSelfApplyTermSurfaceFrom
      hostModuleCheckBadKernelSelfApplyStageIdText)
    kernelSelfApplyExpectedNamespace kernelSelfApplyRequiredDecls none).isAccept

def hostModuleCheckBadKernelSelfApplyReadyL0Accept : Bool :=
  (checkNamedSurface (kernelSelfApplyTermSurfaceFrom
      hostModuleCheckBadKernelSelfApplyReadyText)
    kernelSelfApplyExpectedNamespace kernelSelfApplyRequiredDecls none).isAccept

def hostModuleCheckBadKernelSelfApplyOkL0Accept : Bool :=
  (checkNamedSurface (kernelSelfApplyTermSurfaceFrom
      hostModuleCheckBadKernelSelfApplyOkText)
    kernelSelfApplyExpectedNamespace kernelSelfApplyRequiredDecls none).isAccept

def hostModuleCheckBadKernelSelfApplyCiteL0Accept : Bool :=
  (checkNamedSurface (kernelSelfApplyTermSurfaceFrom
      hostModuleCheckBadKernelSelfApplyCiteText)
    kernelSelfApplyExpectedNamespace kernelSelfApplyRequiredDecls none).isAccept

def hostModuleCheckKernelSelfApplyTermDialectOk : Bool :=
  (checkKernelSelfApplyTermDialect hostModuleCheckGoodKernelSelfApplyTermText).isNone

def hostModuleCheckBadKernelSelfApplyStageIdDialectReject : Bool :=
  match checkKernelSelfApplyTermDialect hostModuleCheckBadKernelSelfApplyStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadKernelSelfApplyReadyDialectReject : Bool :=
  match checkKernelSelfApplyTermDialect hostModuleCheckBadKernelSelfApplyReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadKernelSelfApplyOkDialectReject : Bool :=
  match checkKernelSelfApplyTermDialect hostModuleCheckBadKernelSelfApplyOkText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadKernelSelfApplyCiteDialectReject : Bool :=
  match checkKernelSelfApplyTermDialect hostModuleCheckBadKernelSelfApplyCiteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckKernelSelfApplyTermSurfaceOk : Bool :=
  hostModuleCheckKernelSelfApplyTermSurfaceDualOk
    && (checkDepthKernelSelfApplyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthKernelSelfApplyTermSurfaceScope == "KernelSelfApply-only")
    && hostModuleCheckKernelSelfApplyTermDialectOk
    && hostModuleCheckBadKernelSelfApplyStageIdDialectReject
    && hostModuleCheckBadKernelSelfApplyReadyDialectReject
    && hostModuleCheckBadKernelSelfApplyOkDialectReject
    && hostModuleCheckBadKernelSelfApplyCiteDialectReject
    && hostModuleCheckBadKernelSelfApplyStageIdL0Accept
    && hostModuleCheckBadKernelSelfApplyReadyL0Accept
    && hostModuleCheckBadKernelSelfApplyOkL0Accept
    && hostModuleCheckBadKernelSelfApplyCiteL0Accept

theorem hostModuleCheckKernelSelfApplyTermSurfaceOk_true :
    hostModuleCheckKernelSelfApplyTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_kernel_self_apply_term_surface_ids_eq :
    checkDepthKernelSelfApplyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthKernelSelfApplyTermSurfaceScope = "KernelSelfApply-only"
      && hostModuleCheckKernelSelfApplyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckKernelSelfApplyTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckKernelSelfApplyTermSourceReady : Bool :=
  liveRel == "HostModuleCheckKernelSelfApplyTerm.lean"
    && kernelCheckLiveHostModuleCheckKernelSelfApplyTermSource liveHostModuleCheckKernelSelfApplyTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckKernelSelfApplyTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckKernelSelfApplyTerm.lean")
  let k := kernelCheckLiveHostModuleCheckKernelSelfApplyTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckKernelSelfApplyTerm parse false")
  unless hostFrontLiveHostModuleCheckKernelSelfApplyTermSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckKernelSelfApplyTermSource
