/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathPlanTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathPlanTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathPlanTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCompilePathLinearTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHPLANTERM,
  liveHostModuleCheckCompilePathPlanTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHPLANTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm

/-- Dual-pinned live HostModuleCheckCompilePathPlanTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathPlanTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHPLANTERM. -/
def liveHostModuleCheckCompilePathPlanTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathPlan L2 term-surface (Plan/Apply/Body TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathPlan dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathPlan L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - compile-path ready compose matches product (includes planFixturePlanOk).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathPlanTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathPlanTermSurfaceOk.

  Intentional non-claims:
  - CompilePathPlan pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathPlanTerm, TERM-SURFACE, CompilePathPlan-only,
  ILL-TYPED-TERM, checkCompilePathPlanTermDialect,
  hostModuleCheckCompilePathPlanTermDialectOk,
  hostModuleCheckCompilePathPlanTermSurfaceDualOk,
  hostModuleCheckCompilePathPlanTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathPlanTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathPlanTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### CompilePathPlan L2 term-surface dual-ok pins (CompilePathPlan-only) -/

def checkDepthCompilePathPlanTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathPlanTermSurfaceScope : String := "CompilePathPlan-only"
def hostModuleCheckCompilePathPlanTermSurfaceDualOk : Bool := true

def compilePathPlanEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitPlan.emitPlanReady"

def compilePathPlanResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathPlanCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathPlanReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "planFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && planFixtureProgramReady && planFixtureComposeReady && planFixtureComposeRawUnready && planFixturePlanOk && planFixtureEmitPathOk && !planFixtureResidualFreeClaimed && !planFixtureProductSelfHostCompleteClaimed && !planFixtureProofCompleteClaimed && !planFixtureLlvmUnlocked"

def checkCompilePathPlanTermDialect (content : String) : Option String :=
  if !compilePathPlanEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathPlanResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathPlanCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathPlanReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathPlanWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathPlanTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathPlanTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathPlanTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathPlanTermGoodMid : String :=
  "def planFixtureProgramReady : Bool := true\n" ++
  "def planFixtureComposeReady : Bool := true\n" ++
  "def planFixtureEmitPathOk : Bool := EmitPlan.emitPlanReady\n" ++
  "def planFixtureCompilePathReady : Bool := gradeSurfaceOk && planFixtureProgramReady && planFixtureComposeReady && planFixtureComposeRawUnready && planFixturePlanOk && planFixtureEmitPathOk && !planFixtureResidualFreeClaimed && !planFixtureProductSelfHostCompleteClaimed && !planFixtureProofCompleteClaimed && !planFixtureLlvmUnlocked\n" ++
  "def planFixtureResidualFreeClaimed : Bool := false\n" ++
  "def planFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathPlanTermText : String :=
  hostModuleCheckCompilePathPlanTermSkeletonPrefix
    ++ hostModuleCheckCompilePathPlanTermGoodMid
    ++ hostModuleCheckCompilePathPlanTermSkeletonSuffix

def hostModuleCheckBadCompilePathPlanResidualText : String :=
  hostModuleCheckCompilePathPlanTermSkeletonPrefix ++
  "def planFixtureProgramReady : Bool := true\n" ++
  "def planFixtureComposeReady : Bool := true\n" ++
  "def planFixtureEmitPathOk : Bool := EmitPlan.emitPlanReady\n" ++
  "def planFixtureCompilePathReady : Bool := gradeSurfaceOk && planFixtureProgramReady && planFixtureComposeReady && planFixtureComposeRawUnready && planFixturePlanOk && planFixtureEmitPathOk && !planFixtureResidualFreeClaimed && !planFixtureProductSelfHostCompleteClaimed && !planFixtureProofCompleteClaimed && !planFixtureLlvmUnlocked\n" ++
  "def planFixtureResidualFreeClaimed : Bool := true\n" ++
  "def planFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathPlanTermSkeletonSuffix

def hostModuleCheckBadCompilePathPlanEmitText : String :=
  hostModuleCheckCompilePathPlanTermSkeletonPrefix ++
  "def planFixtureProgramReady : Bool := true\n" ++
  "def planFixtureComposeReady : Bool := true\n" ++
  "def planFixtureEmitPathOk : Bool := true\n" ++
  "def planFixtureCompilePathReady : Bool := gradeSurfaceOk && planFixtureProgramReady && planFixtureComposeReady && planFixtureComposeRawUnready && planFixturePlanOk && planFixtureEmitPathOk && !planFixtureResidualFreeClaimed && !planFixtureProductSelfHostCompleteClaimed && !planFixtureProofCompleteClaimed && !planFixtureLlvmUnlocked\n" ++
  "def planFixtureResidualFreeClaimed : Bool := false\n" ++
  "def planFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathPlanTermSkeletonSuffix

def hostModuleCheckBadCompilePathPlanReadyText : String :=
  hostModuleCheckCompilePathPlanTermSkeletonPrefix ++
  "def planFixtureProgramReady : Bool := true\n" ++
  "def planFixtureComposeReady : Bool := true\n" ++
  "def planFixtureEmitPathOk : Bool := EmitPlan.emitPlanReady\n" ++
  "def planFixtureCompilePathReady : Bool := true\n" ++
  "def planFixtureResidualFreeClaimed : Bool := false\n" ++
  "def planFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathPlanTermSkeletonSuffix

def hostModuleCheckBadCompilePathPlanCompleteText : String :=
  hostModuleCheckCompilePathPlanTermSkeletonPrefix ++
  "def planFixtureProgramReady : Bool := true\n" ++
  "def planFixtureComposeReady : Bool := true\n" ++
  "def planFixtureEmitPathOk : Bool := EmitPlan.emitPlanReady\n" ++
  "def planFixtureCompilePathReady : Bool := gradeSurfaceOk && planFixtureProgramReady && planFixtureComposeReady && planFixtureComposeRawUnready && planFixturePlanOk && planFixtureEmitPathOk && !planFixtureResidualFreeClaimed && !planFixtureProductSelfHostCompleteClaimed && !planFixtureProofCompleteClaimed && !planFixtureLlvmUnlocked\n" ++
  "def planFixtureResidualFreeClaimed : Bool := false\n" ++
  "def planFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathPlanTermSkeletonSuffix

def compilePathPlanTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathPlan"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathPlanResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathPlanTermSurfaceFrom
      hostModuleCheckBadCompilePathPlanResidualText)
    compilePathExpectedNamespace compilePathPlanRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathPlanResidualDialectReject : Bool :=
  match checkCompilePathPlanTermDialect hostModuleCheckBadCompilePathPlanResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathPlanEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathPlanTermSurfaceFrom
      hostModuleCheckBadCompilePathPlanEmitText)
    compilePathExpectedNamespace compilePathPlanRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathPlanEmitDialectReject : Bool :=
  match checkCompilePathPlanTermDialect hostModuleCheckBadCompilePathPlanEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathPlanReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathPlanTermSurfaceFrom
      hostModuleCheckBadCompilePathPlanReadyText)
    compilePathExpectedNamespace compilePathPlanRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathPlanReadyDialectReject : Bool :=
  match checkCompilePathPlanTermDialect hostModuleCheckBadCompilePathPlanReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathPlanCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathPlanTermSurfaceFrom
      hostModuleCheckBadCompilePathPlanCompleteText)
    compilePathExpectedNamespace compilePathPlanRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathPlanCompleteDialectReject : Bool :=
  match checkCompilePathPlanTermDialect hostModuleCheckBadCompilePathPlanCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathPlanTermDialectOk : Bool :=
  (checkCompilePathPlanTermDialect hostModuleCheckGoodCompilePathPlanTermText).isNone

def hostModuleCheckCompilePathPlanTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathPlanTermSurfaceDualOk
    && (checkDepthCompilePathPlanTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathPlanTermSurfaceScope == "CompilePathPlan-only")
    && hostModuleCheckCompilePathPlanTermDialectOk
    && hostModuleCheckBadCompilePathPlanResidualDialectReject
    && hostModuleCheckBadCompilePathPlanEmitDialectReject
    && hostModuleCheckBadCompilePathPlanReadyDialectReject
    && hostModuleCheckBadCompilePathPlanCompleteDialectReject
    && hostModuleCheckBadCompilePathPlanResidualL0Accept
    && hostModuleCheckBadCompilePathPlanEmitL0Accept
    && hostModuleCheckBadCompilePathPlanReadyL0Accept
    && hostModuleCheckBadCompilePathPlanCompleteL0Accept

theorem hostModuleCheckCompilePathPlanTermSurfaceOk_true :
    hostModuleCheckCompilePathPlanTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathPlan_term_surface_ids_eq :
    checkDepthCompilePathPlanTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathPlanTermSurfaceScope = "CompilePathPlan-only"
      && hostModuleCheckCompilePathPlanTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathPlanTerm
