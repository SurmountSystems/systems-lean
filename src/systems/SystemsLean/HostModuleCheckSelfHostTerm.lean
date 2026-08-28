/-
  SYSTEMS_LEAN_HOST partial -- SelfHost L2 term-surface (S4 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SelfHost dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  SelfHost L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SELF_HOST_V0".
  - hostSelfHostId body "HOST-SELF-HOST".
  - selfHostId body "SELF-HOST".
  - packageRootPath body "src/systems/SystemsLean.lean".
  - hostModulePath body "src/systems/SystemsLean/SelfHost.lean".

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSelfHostTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSelfHostTermSurfaceOk.

  Intentional non-claims:
  - SelfHost direction readiness dialect only -- not claim B complete re-open.
  - Not freestanding product self-host complete flip. Not FullHost re-true.
  - Mult..JoinMap TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSelfHostTerm, TERM-SURFACE, SelfHost-only,
  ILL-TYPED-TERM, checkSelfHostTermDialect,
  hostModuleCheckBadSelfHostStageIdText,
  hostModuleCheckBadSelfHostHostIdText,
  hostModuleCheckBadSelfHostMapIdText,
  hostModuleCheckBadSelfHostPathText,
  hostModuleCheckSelfHostTermDialectOk,
  hostModuleCheckSelfHostTermSurfaceDualOk,
  hostModuleCheckSelfHostTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSelfHostTerm
  Red/green: lake build SystemsLean.HostModuleCheckSelfHostTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### SelfHost L2 term-surface dual-ok pins (SelfHost-only) -/

def checkDepthSelfHostTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSelfHostTermSurfaceScope : String := "SelfHost-only"
def hostModuleCheckSelfHostTermSurfaceDualOk : Bool := true

def selfHostStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SELF_HOST_V0\""

def selfHostHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostSelfHostId" with
  | none => false
  | some body => body == "\"HOST-SELF-HOST\""

def selfHostMapIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "selfHostId" with
  | none => false
  | some body => body == "\"SELF-HOST\""

def selfHostPackagePathBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "packageRootPath" with
  | none => false
  | some body => body == "\"src/systems/SystemsLean.lean\""

def selfHostModulePathBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostModulePath" with
  | none => false
  | some body => body == "\"src/systems/SystemsLean/SelfHost.lean\""

def checkSelfHostTermDialect (content : String) : Option String :=
  if !selfHostStageIdBodyOk content then some reasonIllTypedTerm
  else if !selfHostHostIdBodyOk content then some reasonIllTypedTerm
  else if !selfHostMapIdBodyOk content then some reasonIllTypedTerm
  else if !selfHostPackagePathBodyOk content then some reasonIllTypedTerm
  else if !selfHostModulePathBodyOk content then some reasonIllTypedTerm
  else none

def refineSelfHostWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSelfHostTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSelfHostTermSkeletonPrefix : String :=
  "import SystemsLean.JoinMap\n" ++
  "namespace SystemsLean.SelfHost\n"

def hostModuleCheckSelfHostTermSkeletonSuffix : String :=
  "end SystemsLean.SelfHost\n"

def hostModuleCheckSelfHostTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def packageRootPath : String := \"src/systems/SystemsLean.lean\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SelfHost.lean\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n"

def hostModuleCheckGoodSelfHostTermText : String :=
  hostModuleCheckSelfHostTermSkeletonPrefix
    ++ hostModuleCheckSelfHostTermGoodMid
    ++ hostModuleCheckSelfHostTermSkeletonSuffix

def hostModuleCheckBadSelfHostStageIdText : String :=
  hostModuleCheckSelfHostTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def packageRootPath : String := \"src/systems/SystemsLean.lean\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SelfHost.lean\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSelfHostTermSkeletonSuffix

def hostModuleCheckBadSelfHostHostIdText : String :=
  hostModuleCheckSelfHostTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"WRONG_HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def packageRootPath : String := \"src/systems/SystemsLean.lean\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SelfHost.lean\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSelfHostTermSkeletonSuffix

def hostModuleCheckBadSelfHostMapIdText : String :=
  hostModuleCheckSelfHostTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"WRONG_MAP\"\n" ++
  "def packageRootPath : String := \"src/systems/SystemsLean.lean\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SelfHost.lean\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSelfHostTermSkeletonSuffix

def hostModuleCheckBadSelfHostPathText : String :=
  hostModuleCheckSelfHostTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SELF_HOST_V0\"\n" ++
  "def hostSelfHostId : String := \"HOST-SELF-HOST\"\n" ++
  "def selfHostId : String := \"SELF-HOST\"\n" ++
  "def packageRootPath : String := \"src/systems/SystemsLean.lean\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/Wrong.lean\"\n" ++
  "def hostSurfaceOk : Bool := true\n" ++
  "def selfHostUnitReady (hc : Nat) : Bool := true\n" ++
  "def selfHostProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSelfHostTermSkeletonSuffix

def selfHostTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SelfHost"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadSelfHostStageIdL0Accept : Bool :=
  (checkNamedSurface (selfHostTermSurfaceFrom
      hostModuleCheckBadSelfHostStageIdText)
    selfHostExpectedNamespace selfHostRequiredDecls none).isAccept

def hostModuleCheckBadSelfHostHostIdL0Accept : Bool :=
  (checkNamedSurface (selfHostTermSurfaceFrom
      hostModuleCheckBadSelfHostHostIdText)
    selfHostExpectedNamespace selfHostRequiredDecls none).isAccept

def hostModuleCheckBadSelfHostMapIdL0Accept : Bool :=
  (checkNamedSurface (selfHostTermSurfaceFrom
      hostModuleCheckBadSelfHostMapIdText)
    selfHostExpectedNamespace selfHostRequiredDecls none).isAccept

def hostModuleCheckBadSelfHostPathL0Accept : Bool :=
  (checkNamedSurface (selfHostTermSurfaceFrom
      hostModuleCheckBadSelfHostPathText)
    selfHostExpectedNamespace selfHostRequiredDecls none).isAccept

def hostModuleCheckSelfHostTermDialectOk : Bool :=
  (checkSelfHostTermDialect hostModuleCheckGoodSelfHostTermText).isNone

def hostModuleCheckBadSelfHostStageIdDialectReject : Bool :=
  match checkSelfHostTermDialect hostModuleCheckBadSelfHostStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSelfHostHostIdDialectReject : Bool :=
  match checkSelfHostTermDialect hostModuleCheckBadSelfHostHostIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSelfHostMapIdDialectReject : Bool :=
  match checkSelfHostTermDialect hostModuleCheckBadSelfHostMapIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSelfHostPathDialectReject : Bool :=
  match checkSelfHostTermDialect hostModuleCheckBadSelfHostPathText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckSelfHostTermSurfaceOk : Bool :=
  hostModuleCheckSelfHostTermSurfaceDualOk
    && (checkDepthSelfHostTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSelfHostTermSurfaceScope == "SelfHost-only")
    && hostModuleCheckSelfHostTermDialectOk
    && hostModuleCheckBadSelfHostStageIdDialectReject
    && hostModuleCheckBadSelfHostHostIdDialectReject
    && hostModuleCheckBadSelfHostMapIdDialectReject
    && hostModuleCheckBadSelfHostPathDialectReject
    && hostModuleCheckBadSelfHostStageIdL0Accept
    && hostModuleCheckBadSelfHostHostIdL0Accept
    && hostModuleCheckBadSelfHostMapIdL0Accept
    && hostModuleCheckBadSelfHostPathL0Accept

theorem hostModuleCheckSelfHostTermSurfaceOk_true :
    hostModuleCheckSelfHostTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_self_host_term_surface_ids_eq :
    checkDepthSelfHostTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSelfHostTermSurfaceScope = "SelfHost-only"
      && hostModuleCheckSelfHostTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
