/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathGraphTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathGraphTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathGraphTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHGRAPHTERM,
  liveHostModuleCheckCompilePathGraphTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHGRAPHTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm

/-- Dual-pinned live HostModuleCheckCompilePathGraphTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathGraphTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHGRAPHTERM. -/
def liveHostModuleCheckCompilePathGraphTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathGraph L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathGraph dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathGraph L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathGraphTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathGraphTermSurfaceOk.

  Intentional non-claims:
  - CompilePathGraph pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathGraphTerm, TERM-SURFACE, CompilePathGraph-only,
  ILL-TYPED-TERM, checkCompilePathGraphTermDialect,
  hostModuleCheckCompilePathGraphTermDialectOk,
  hostModuleCheckCompilePathGraphTermSurfaceDualOk,
  hostModuleCheckCompilePathGraphTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathGraphTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathGraphTerm;
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

/-! ### CompilePathGraph L2 term-surface dual-ok pins (CompilePathGraph-only) -/

def checkDepthCompilePathGraphTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathGraphTermSurfaceScope : String := "CompilePathGraph-only"
def hostModuleCheckCompilePathGraphTermSurfaceDualOk : Bool := true

def compilePathGraphEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitGraph.emitGraphReady"

def compilePathGraphResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathGraphCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathGraphReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "graphFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && graphFixtureGraphReady && graphFixtureComposeReady && graphFixtureComposeRawUnready && graphFixtureEmitPathOk && !graphFixtureResidualFreeClaimed && !graphFixtureProductSelfHostCompleteClaimed && !graphFixtureProofCompleteClaimed && !graphFixtureLlvmUnlocked"

def checkCompilePathGraphTermDialect (content : String) : Option String :=
  if !compilePathGraphEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathGraphResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathGraphCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathGraphReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathGraphWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathGraphTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathGraphTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathGraphTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathGraphTermGoodMid : String :=
  "def graphFixtureProgramReady : Bool := true\n" ++
  "def graphFixtureComposeReady : Bool := true\n" ++
  "def graphFixtureEmitPathOk : Bool := EmitGraph.emitGraphReady\n" ++
  "def graphFixtureCompilePathReady : Bool := gradeSurfaceOk && graphFixtureGraphReady && graphFixtureComposeReady && graphFixtureComposeRawUnready && graphFixtureEmitPathOk && !graphFixtureResidualFreeClaimed && !graphFixtureProductSelfHostCompleteClaimed && !graphFixtureProofCompleteClaimed && !graphFixtureLlvmUnlocked\n" ++
  "def graphFixtureResidualFreeClaimed : Bool := false\n" ++
  "def graphFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathGraphTermText : String :=
  hostModuleCheckCompilePathGraphTermSkeletonPrefix
    ++ hostModuleCheckCompilePathGraphTermGoodMid
    ++ hostModuleCheckCompilePathGraphTermSkeletonSuffix

def hostModuleCheckBadCompilePathGraphResidualText : String :=
  hostModuleCheckCompilePathGraphTermSkeletonPrefix ++
  "def graphFixtureProgramReady : Bool := true\n" ++
  "def graphFixtureComposeReady : Bool := true\n" ++
  "def graphFixtureEmitPathOk : Bool := EmitGraph.emitGraphReady\n" ++
  "def graphFixtureCompilePathReady : Bool := gradeSurfaceOk && graphFixtureGraphReady && graphFixtureComposeReady && graphFixtureComposeRawUnready && graphFixtureEmitPathOk && !graphFixtureResidualFreeClaimed && !graphFixtureProductSelfHostCompleteClaimed && !graphFixtureProofCompleteClaimed && !graphFixtureLlvmUnlocked\n" ++
  "def graphFixtureResidualFreeClaimed : Bool := true\n" ++
  "def graphFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathGraphTermSkeletonSuffix

def hostModuleCheckBadCompilePathGraphEmitText : String :=
  hostModuleCheckCompilePathGraphTermSkeletonPrefix ++
  "def graphFixtureProgramReady : Bool := true\n" ++
  "def graphFixtureComposeReady : Bool := true\n" ++
  "def graphFixtureEmitPathOk : Bool := true\n" ++
  "def graphFixtureCompilePathReady : Bool := gradeSurfaceOk && graphFixtureGraphReady && graphFixtureComposeReady && graphFixtureComposeRawUnready && graphFixtureEmitPathOk && !graphFixtureResidualFreeClaimed && !graphFixtureProductSelfHostCompleteClaimed && !graphFixtureProofCompleteClaimed && !graphFixtureLlvmUnlocked\n" ++
  "def graphFixtureResidualFreeClaimed : Bool := false\n" ++
  "def graphFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathGraphTermSkeletonSuffix

def hostModuleCheckBadCompilePathGraphReadyText : String :=
  hostModuleCheckCompilePathGraphTermSkeletonPrefix ++
  "def graphFixtureProgramReady : Bool := true\n" ++
  "def graphFixtureComposeReady : Bool := true\n" ++
  "def graphFixtureEmitPathOk : Bool := EmitGraph.emitGraphReady\n" ++
  "def graphFixtureCompilePathReady : Bool := true\n" ++
  "def graphFixtureResidualFreeClaimed : Bool := false\n" ++
  "def graphFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathGraphTermSkeletonSuffix

def hostModuleCheckBadCompilePathGraphCompleteText : String :=
  hostModuleCheckCompilePathGraphTermSkeletonPrefix ++
  "def graphFixtureProgramReady : Bool := true\n" ++
  "def graphFixtureComposeReady : Bool := true\n" ++
  "def graphFixtureEmitPathOk : Bool := EmitGraph.emitGraphReady\n" ++
  "def graphFixtureCompilePathReady : Bool := gradeSurfaceOk && graphFixtureGraphReady && graphFixtureComposeReady && graphFixtureComposeRawUnready && graphFixtureEmitPathOk && !graphFixtureResidualFreeClaimed && !graphFixtureProductSelfHostCompleteClaimed && !graphFixtureProofCompleteClaimed && !graphFixtureLlvmUnlocked\n" ++
  "def graphFixtureResidualFreeClaimed : Bool := false\n" ++
  "def graphFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathGraphTermSkeletonSuffix

def compilePathGraphTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathGraph"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathGraphResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathGraphTermSurfaceFrom
      hostModuleCheckBadCompilePathGraphResidualText)
    compilePathExpectedNamespace compilePathGraphRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathGraphResidualDialectReject : Bool :=
  match checkCompilePathGraphTermDialect hostModuleCheckBadCompilePathGraphResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathGraphEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathGraphTermSurfaceFrom
      hostModuleCheckBadCompilePathGraphEmitText)
    compilePathExpectedNamespace compilePathGraphRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathGraphEmitDialectReject : Bool :=
  match checkCompilePathGraphTermDialect hostModuleCheckBadCompilePathGraphEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathGraphReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathGraphTermSurfaceFrom
      hostModuleCheckBadCompilePathGraphReadyText)
    compilePathExpectedNamespace compilePathGraphRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathGraphReadyDialectReject : Bool :=
  match checkCompilePathGraphTermDialect hostModuleCheckBadCompilePathGraphReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathGraphCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathGraphTermSurfaceFrom
      hostModuleCheckBadCompilePathGraphCompleteText)
    compilePathExpectedNamespace compilePathGraphRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathGraphCompleteDialectReject : Bool :=
  match checkCompilePathGraphTermDialect hostModuleCheckBadCompilePathGraphCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathGraphTermDialectOk : Bool :=
  (checkCompilePathGraphTermDialect hostModuleCheckGoodCompilePathGraphTermText).isNone

def hostModuleCheckCompilePathGraphTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathGraphTermSurfaceDualOk
    && (checkDepthCompilePathGraphTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathGraphTermSurfaceScope == "CompilePathGraph-only")
    && hostModuleCheckCompilePathGraphTermDialectOk
    && hostModuleCheckBadCompilePathGraphResidualDialectReject
    && hostModuleCheckBadCompilePathGraphEmitDialectReject
    && hostModuleCheckBadCompilePathGraphReadyDialectReject
    && hostModuleCheckBadCompilePathGraphCompleteDialectReject
    && hostModuleCheckBadCompilePathGraphResidualL0Accept
    && hostModuleCheckBadCompilePathGraphEmitL0Accept
    && hostModuleCheckBadCompilePathGraphReadyL0Accept
    && hostModuleCheckBadCompilePathGraphCompleteL0Accept

theorem hostModuleCheckCompilePathGraphTermSurfaceOk_true :
    hostModuleCheckCompilePathGraphTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathGraph_term_surface_ids_eq :
    checkDepthCompilePathGraphTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathGraphTermSurfaceScope = "CompilePathGraph-only"
      && hostModuleCheckCompilePathGraphTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathGraphTerm
