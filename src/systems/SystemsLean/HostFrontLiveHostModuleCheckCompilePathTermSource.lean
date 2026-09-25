/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCompilePathProgramTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHTERM,
  liveHostModuleCheckCompilePathTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm

/-- Dual-pinned live HostModuleCheckCompilePathTerm.lean bytes.
    One part. Not split. 226 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHTERM. -/
def liveHostModuleCheckCompilePathTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePath L2 term-surface (S2 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePath dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePath L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_COMPILE_PATH_V1".
  - hostCompilePathId body "HOST-COMPILE-PATH".
  - checkHost body HostCompose.checkFailClosed hc.
  - extractFsOk body HostCompose.extractOkFs hc.
  - compileReady body extractFsOk hc.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathTermSurfaceOk.

  Intentional non-claims:
  - CompilePath pilot only -- not package elaborate, not FullHost re-true.
  - Mult..ProductOutKernel TERM-SURFACE dual-ok unchanged.
  - CompilePath* unit peels (Mult..Extract) stay L0 until optional S8.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathTerm, TERM-SURFACE, CompilePath-only,
  ILL-TYPED-TERM, checkCompilePathTermDialect,
  hostModuleCheckBadCompilePathStageIdText,
  hostModuleCheckBadCompilePathHostIdText,
  hostModuleCheckBadCompilePathCompileReadyText,
  hostModuleCheckBadCompilePathExtractFsText,
  hostModuleCheckCompilePathTermDialectOk,
  hostModuleCheckCompilePathTermSurfaceDualOk,
  hostModuleCheckCompilePathTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### CompilePath L2 term-surface dual-ok pins (CompilePath-only) -/

def checkDepthCompilePathTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathTermSurfaceScope : String := "CompilePath-only"
def hostModuleCheckCompilePathTermSurfaceDualOk : Bool := true

def compilePathStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_COMPILE_PATH_V1\""

def compilePathHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostCompilePathId" with
  | none => false
  | some body => body == "\"HOST-COMPILE-PATH\""

def compilePathCheckHostBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "checkHost" with
  | none => false
  | some body => body == "HostCompose.checkFailClosed hc"

def compilePathExtractFsBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractFsOk" with
  | none => false
  | some body => body == "HostCompose.extractOkFs hc"

def compilePathCompileReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "compileReady" with
  | none => false
  | some body => body == "extractFsOk hc"

def checkCompilePathTermDialect (content : String) : Option String :=
  if !compilePathStageIdBodyOk content then some reasonIllTypedTerm
  else if !compilePathHostIdBodyOk content then some reasonIllTypedTerm
  else if !compilePathCheckHostBodyOk content then some reasonIllTypedTerm
  else if !compilePathExtractFsBodyOk content then some reasonIllTypedTerm
  else if !compilePathCompileReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathTermSkeletonPrefix : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathTermGoodMid : String :=
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := HostCompose.checkFailClosed hc\n" ++
  "def extractFsOk (hc : Nat) : Bool := HostCompose.extractOkFs hc\n" ++
  "def compileReady (hc : Nat) : Bool := extractFsOk hc\n"

def hostModuleCheckGoodCompilePathTermText : String :=
  hostModuleCheckCompilePathTermSkeletonPrefix
    ++ hostModuleCheckCompilePathTermGoodMid
    ++ hostModuleCheckCompilePathTermSkeletonSuffix

def hostModuleCheckBadCompilePathStageIdText : String :=
  hostModuleCheckCompilePathTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := HostCompose.checkFailClosed hc\n" ++
  "def extractFsOk (hc : Nat) : Bool := HostCompose.extractOkFs hc\n" ++
  "def compileReady (hc : Nat) : Bool := extractFsOk hc\n" ++
  hostModuleCheckCompilePathTermSkeletonSuffix

def hostModuleCheckBadCompilePathHostIdText : String :=
  hostModuleCheckCompilePathTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"WRONG_HOST\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := HostCompose.checkFailClosed hc\n" ++
  "def extractFsOk (hc : Nat) : Bool := HostCompose.extractOkFs hc\n" ++
  "def compileReady (hc : Nat) : Bool := extractFsOk hc\n" ++
  hostModuleCheckCompilePathTermSkeletonSuffix

def hostModuleCheckBadCompilePathCompileReadyText : String :=
  hostModuleCheckCompilePathTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := HostCompose.checkFailClosed hc\n" ++
  "def extractFsOk (hc : Nat) : Bool := HostCompose.extractOkFs hc\n" ++
  "def compileReady (hc : Nat) : Bool := true\n" ++
  hostModuleCheckCompilePathTermSkeletonSuffix

def hostModuleCheckBadCompilePathExtractFsText : String :=
  hostModuleCheckCompilePathTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPILE_PATH_V1\"\n" ++
  "def hostCompilePathId : String := \"HOST-COMPILE-PATH\"\n" ++
  "def gradeSurfaceOk : Bool := true\n" ++
  "def checkHost (hc : Nat) : Bool := HostCompose.checkFailClosed hc\n" ++
  "def extractFsOk (hc : Nat) : Bool := true\n" ++
  "def compileReady (hc : Nat) : Bool := extractFsOk hc\n" ++
  hostModuleCheckCompilePathTermSkeletonSuffix

def compilePathTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePath"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathStageIdL0Accept : Bool :=
  (checkNamedSurface (compilePathTermSurfaceFrom
      hostModuleCheckBadCompilePathStageIdText)
    compilePathExpectedNamespace compilePathRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathHostIdL0Accept : Bool :=
  (checkNamedSurface (compilePathTermSurfaceFrom
      hostModuleCheckBadCompilePathHostIdText)
    compilePathExpectedNamespace compilePathRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathCompileReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathTermSurfaceFrom
      hostModuleCheckBadCompilePathCompileReadyText)
    compilePathExpectedNamespace compilePathRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathExtractFsL0Accept : Bool :=
  (checkNamedSurface (compilePathTermSurfaceFrom
      hostModuleCheckBadCompilePathExtractFsText)
    compilePathExpectedNamespace compilePathRequiredDecls none).isAccept

def hostModuleCheckCompilePathTermDialectOk : Bool :=
  (checkCompilePathTermDialect hostModuleCheckGoodCompilePathTermText).isNone

def hostModuleCheckBadCompilePathStageIdDialectReject : Bool :=
  match checkCompilePathTermDialect hostModuleCheckBadCompilePathStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathHostIdDialectReject : Bool :=
  match checkCompilePathTermDialect hostModuleCheckBadCompilePathHostIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathCompileReadyDialectReject : Bool :=
  match checkCompilePathTermDialect hostModuleCheckBadCompilePathCompileReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathExtractFsDialectReject : Bool :=
  match checkCompilePathTermDialect hostModuleCheckBadCompilePathExtractFsText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathTermSurfaceDualOk
    && (checkDepthCompilePathTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathTermSurfaceScope == "CompilePath-only")
    && hostModuleCheckCompilePathTermDialectOk
    && hostModuleCheckBadCompilePathStageIdDialectReject
    && hostModuleCheckBadCompilePathHostIdDialectReject
    && hostModuleCheckBadCompilePathCompileReadyDialectReject
    && hostModuleCheckBadCompilePathExtractFsDialectReject
    && hostModuleCheckBadCompilePathStageIdL0Accept
    && hostModuleCheckBadCompilePathHostIdL0Accept
    && hostModuleCheckBadCompilePathCompileReadyL0Accept
    && hostModuleCheckBadCompilePathExtractFsL0Accept

theorem hostModuleCheckCompilePathTermSurfaceOk_true :
    hostModuleCheckCompilePathTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compile_path_term_surface_ids_eq :
    checkDepthCompilePathTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathTermSurfaceScope = "CompilePath-only"
      && hostModuleCheckCompilePathTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathTerm
