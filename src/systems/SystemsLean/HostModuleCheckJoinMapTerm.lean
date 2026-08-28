/-
  SYSTEMS_LEAN_HOST partial -- JoinMap L2 term-surface (S3 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: JoinMap dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  JoinMap L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_JOIN_MAP_V0".
  - hostJoinMapId body "HOST-JOIN-MAP".
  - joinMapId body "JOIN-MAP".
  - joinAlgId body "JOIN-ALG".
  - joinAlgUseId body "JOIN-ALG-USE".

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckJoinMapTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckJoinMapTermSurfaceOk.

  Intentional non-claims:
  - JoinMap pilot only -- not package elaborate, not FullHost re-true.
  - Not dual formal map complete (present-partial edges stay elsewhere).
  - Mult..ProductOutKernel TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckJoinMapTerm, TERM-SURFACE, JoinMap-only,
  ILL-TYPED-TERM, checkJoinMapTermDialect,
  hostModuleCheckBadJoinMapStageIdText,
  hostModuleCheckBadJoinMapHostIdText,
  hostModuleCheckBadJoinMapMapIdText,
  hostModuleCheckBadJoinMapAlgIdText,
  hostModuleCheckJoinMapTermDialectOk,
  hostModuleCheckJoinMapTermSurfaceDualOk,
  hostModuleCheckJoinMapTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckJoinMapTerm
  Red/green: lake build SystemsLean.HostModuleCheckJoinMapTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### JoinMap L2 term-surface dual-ok pins (JoinMap-only) -/

def checkDepthJoinMapTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthJoinMapTermSurfaceScope : String := "JoinMap-only"
def hostModuleCheckJoinMapTermSurfaceDualOk : Bool := true

def joinMapStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_JOIN_MAP_V0\""

def joinMapHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostJoinMapId" with
  | none => false
  | some body => body == "\"HOST-JOIN-MAP\""

def joinMapMapIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "joinMapId" with
  | none => false
  | some body => body == "\"JOIN-MAP\""

def joinMapAlgIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "joinAlgId" with
  | none => false
  | some body => body == "\"JOIN-ALG\""

def joinMapAlgUseIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "joinAlgUseId" with
  | none => false
  | some body => body == "\"JOIN-ALG-USE\""

def checkJoinMapTermDialect (content : String) : Option String :=
  if !joinMapStageIdBodyOk content then some reasonIllTypedTerm
  else if !joinMapHostIdBodyOk content then some reasonIllTypedTerm
  else if !joinMapMapIdBodyOk content then some reasonIllTypedTerm
  else if !joinMapAlgIdBodyOk content then some reasonIllTypedTerm
  else if !joinMapAlgUseIdBodyOk content then some reasonIllTypedTerm
  else none

def refineJoinMapWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkJoinMapTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckJoinMapTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.JoinMap\n"

def hostModuleCheckJoinMapTermSkeletonSuffix : String :=
  "end SystemsLean.JoinMap\n"

def hostModuleCheckJoinMapTermGoodMid : String :=
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgId : String := \"JOIN-ALG\"\n" ++
  "def joinAlgUseId : String := \"JOIN-ALG-USE\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Bool) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Bool) : Bool := true\n"

def hostModuleCheckGoodJoinMapTermText : String :=
  hostModuleCheckJoinMapTermSkeletonPrefix
    ++ hostModuleCheckJoinMapTermGoodMid
    ++ hostModuleCheckJoinMapTermSkeletonSuffix

def hostModuleCheckBadJoinMapStageIdText : String :=
  hostModuleCheckJoinMapTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgId : String := \"JOIN-ALG\"\n" ++
  "def joinAlgUseId : String := \"JOIN-ALG-USE\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Bool) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Bool) : Bool := true\n" ++
  hostModuleCheckJoinMapTermSkeletonSuffix

def hostModuleCheckBadJoinMapHostIdText : String :=
  hostModuleCheckJoinMapTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"WRONG_HOST\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgId : String := \"JOIN-ALG\"\n" ++
  "def joinAlgUseId : String := \"JOIN-ALG-USE\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Bool) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Bool) : Bool := true\n" ++
  hostModuleCheckJoinMapTermSkeletonSuffix

def hostModuleCheckBadJoinMapMapIdText : String :=
  hostModuleCheckJoinMapTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"WRONG_MAP\"\n" ++
  "def joinAlgId : String := \"JOIN-ALG\"\n" ++
  "def joinAlgUseId : String := \"JOIN-ALG-USE\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Bool) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Bool) : Bool := true\n" ++
  hostModuleCheckJoinMapTermSkeletonSuffix

def hostModuleCheckBadJoinMapAlgIdText : String :=
  hostModuleCheckJoinMapTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_JOIN_MAP_V0\"\n" ++
  "def hostJoinMapId : String := \"HOST-JOIN-MAP\"\n" ++
  "def joinMapId : String := \"JOIN-MAP\"\n" ++
  "def joinAlgId : String := \"WRONG_ALG\"\n" ++
  "def joinAlgUseId : String := \"JOIN-ALG-USE\"\n" ++
  "def joinAlgContractOk : Bool := true\n" ++
  "def joinUnitCompileReady (hc : Bool) : Bool := true\n" ++
  "def joinProgramCompileReady (p : Bool) : Bool := true\n" ++
  hostModuleCheckJoinMapTermSkeletonSuffix

def joinMapTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.JoinMap"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadJoinMapStageIdL0Accept : Bool :=
  (checkNamedSurface (joinMapTermSurfaceFrom
      hostModuleCheckBadJoinMapStageIdText)
    joinMapExpectedNamespace joinMapRequiredDecls none).isAccept

def hostModuleCheckBadJoinMapHostIdL0Accept : Bool :=
  (checkNamedSurface (joinMapTermSurfaceFrom
      hostModuleCheckBadJoinMapHostIdText)
    joinMapExpectedNamespace joinMapRequiredDecls none).isAccept

def hostModuleCheckBadJoinMapMapIdL0Accept : Bool :=
  (checkNamedSurface (joinMapTermSurfaceFrom
      hostModuleCheckBadJoinMapMapIdText)
    joinMapExpectedNamespace joinMapRequiredDecls none).isAccept

def hostModuleCheckBadJoinMapAlgIdL0Accept : Bool :=
  (checkNamedSurface (joinMapTermSurfaceFrom
      hostModuleCheckBadJoinMapAlgIdText)
    joinMapExpectedNamespace joinMapRequiredDecls none).isAccept

def hostModuleCheckJoinMapTermDialectOk : Bool :=
  (checkJoinMapTermDialect hostModuleCheckGoodJoinMapTermText).isNone

def hostModuleCheckBadJoinMapStageIdDialectReject : Bool :=
  match checkJoinMapTermDialect hostModuleCheckBadJoinMapStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadJoinMapHostIdDialectReject : Bool :=
  match checkJoinMapTermDialect hostModuleCheckBadJoinMapHostIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadJoinMapMapIdDialectReject : Bool :=
  match checkJoinMapTermDialect hostModuleCheckBadJoinMapMapIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadJoinMapAlgIdDialectReject : Bool :=
  match checkJoinMapTermDialect hostModuleCheckBadJoinMapAlgIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckJoinMapTermSurfaceOk : Bool :=
  hostModuleCheckJoinMapTermSurfaceDualOk
    && (checkDepthJoinMapTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthJoinMapTermSurfaceScope == "JoinMap-only")
    && hostModuleCheckJoinMapTermDialectOk
    && hostModuleCheckBadJoinMapStageIdDialectReject
    && hostModuleCheckBadJoinMapHostIdDialectReject
    && hostModuleCheckBadJoinMapMapIdDialectReject
    && hostModuleCheckBadJoinMapAlgIdDialectReject
    && hostModuleCheckBadJoinMapStageIdL0Accept
    && hostModuleCheckBadJoinMapHostIdL0Accept
    && hostModuleCheckBadJoinMapMapIdL0Accept
    && hostModuleCheckBadJoinMapAlgIdL0Accept

theorem hostModuleCheckJoinMapTermSurfaceOk_true :
    hostModuleCheckJoinMapTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_join_map_term_surface_ids_eq :
    checkDepthJoinMapTermSurfaceBar = "TERM-SURFACE"
      && checkDepthJoinMapTermSurfaceScope = "JoinMap-only"
      && hostModuleCheckJoinMapTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
