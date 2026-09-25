/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathComposeTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathComposeTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathComposeTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM,
  liveHostModuleCheckCompilePathComposeTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm

/-- Dual-pinned live HostModuleCheckCompilePathComposeTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathComposeTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHCOMPOSETERM. -/
def liveHostModuleCheckCompilePathComposeTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathCompose L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathCompose dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathCompose L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathComposeTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathComposeTermSurfaceOk.

  Intentional non-claims:
  - CompilePathCompose pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathComposeTerm, TERM-SURFACE, CompilePathCompose-only,
  ILL-TYPED-TERM, checkCompilePathComposeTermDialect,
  hostModuleCheckCompilePathComposeTermDialectOk,
  hostModuleCheckCompilePathComposeTermSurfaceDualOk,
  hostModuleCheckCompilePathComposeTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathComposeTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathComposeTerm;
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

/-! ### CompilePathCompose L2 term-surface dual-ok pins (CompilePathCompose-only) -/

def checkDepthCompilePathComposeTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathComposeTermSurfaceScope : String := "CompilePathCompose-only"
def hostModuleCheckCompilePathComposeTermSurfaceDualOk : Bool := true

def compilePathComposeEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitCompose.emitComposeReady"

def compilePathComposeResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathComposeCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathComposeReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && composeFixtureProgramReady && composeFixtureEdgesOk && composeFixtureComposeReady && composeFixtureComposeRawUnready && composeFixtureMintConsumeOk && composeFixtureEmitPathOk && !composeFixtureResidualFreeClaimed && !composeFixtureProductSelfHostCompleteClaimed && !composeFixtureProofCompleteClaimed && !composeFixtureLlvmUnlocked"

def checkCompilePathComposeTermDialect (content : String) : Option String :=
  if !compilePathComposeEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathComposeResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathComposeCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathComposeReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathComposeWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathComposeTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathComposeTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathComposeTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathComposeTermGoodMid : String :=
  "def composeFixtureProgramReady : Bool := true\n" ++
  "def composeFixtureComposeReady : Bool := true\n" ++
  "def composeFixtureEmitPathOk : Bool := EmitCompose.emitComposeReady\n" ++
  "def composeFixtureCompilePathReady : Bool := gradeSurfaceOk && composeFixtureProgramReady && composeFixtureEdgesOk && composeFixtureComposeReady && composeFixtureComposeRawUnready && composeFixtureMintConsumeOk && composeFixtureEmitPathOk && !composeFixtureResidualFreeClaimed && !composeFixtureProductSelfHostCompleteClaimed && !composeFixtureProofCompleteClaimed && !composeFixtureLlvmUnlocked\n" ++
  "def composeFixtureResidualFreeClaimed : Bool := false\n" ++
  "def composeFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathComposeTermText : String :=
  hostModuleCheckCompilePathComposeTermSkeletonPrefix
    ++ hostModuleCheckCompilePathComposeTermGoodMid
    ++ hostModuleCheckCompilePathComposeTermSkeletonSuffix

def hostModuleCheckBadCompilePathComposeResidualText : String :=
  hostModuleCheckCompilePathComposeTermSkeletonPrefix ++
  "def composeFixtureProgramReady : Bool := true\n" ++
  "def composeFixtureComposeReady : Bool := true\n" ++
  "def composeFixtureEmitPathOk : Bool := EmitCompose.emitComposeReady\n" ++
  "def composeFixtureCompilePathReady : Bool := gradeSurfaceOk && composeFixtureProgramReady && composeFixtureEdgesOk && composeFixtureComposeReady && composeFixtureComposeRawUnready && composeFixtureMintConsumeOk && composeFixtureEmitPathOk && !composeFixtureResidualFreeClaimed && !composeFixtureProductSelfHostCompleteClaimed && !composeFixtureProofCompleteClaimed && !composeFixtureLlvmUnlocked\n" ++
  "def composeFixtureResidualFreeClaimed : Bool := true\n" ++
  "def composeFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathComposeTermSkeletonSuffix

def hostModuleCheckBadCompilePathComposeEmitText : String :=
  hostModuleCheckCompilePathComposeTermSkeletonPrefix ++
  "def composeFixtureProgramReady : Bool := true\n" ++
  "def composeFixtureComposeReady : Bool := true\n" ++
  "def composeFixtureEmitPathOk : Bool := true\n" ++
  "def composeFixtureCompilePathReady : Bool := gradeSurfaceOk && composeFixtureProgramReady && composeFixtureEdgesOk && composeFixtureComposeReady && composeFixtureComposeRawUnready && composeFixtureMintConsumeOk && composeFixtureEmitPathOk && !composeFixtureResidualFreeClaimed && !composeFixtureProductSelfHostCompleteClaimed && !composeFixtureProofCompleteClaimed && !composeFixtureLlvmUnlocked\n" ++
  "def composeFixtureResidualFreeClaimed : Bool := false\n" ++
  "def composeFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathComposeTermSkeletonSuffix

def hostModuleCheckBadCompilePathComposeReadyText : String :=
  hostModuleCheckCompilePathComposeTermSkeletonPrefix ++
  "def composeFixtureProgramReady : Bool := true\n" ++
  "def composeFixtureComposeReady : Bool := true\n" ++
  "def composeFixtureEmitPathOk : Bool := EmitCompose.emitComposeReady\n" ++
  "def composeFixtureCompilePathReady : Bool := true\n" ++
  "def composeFixtureResidualFreeClaimed : Bool := false\n" ++
  "def composeFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathComposeTermSkeletonSuffix

def hostModuleCheckBadCompilePathComposeCompleteText : String :=
  hostModuleCheckCompilePathComposeTermSkeletonPrefix ++
  "def composeFixtureProgramReady : Bool := true\n" ++
  "def composeFixtureComposeReady : Bool := true\n" ++
  "def composeFixtureEmitPathOk : Bool := EmitCompose.emitComposeReady\n" ++
  "def composeFixtureCompilePathReady : Bool := gradeSurfaceOk && composeFixtureProgramReady && composeFixtureEdgesOk && composeFixtureComposeReady && composeFixtureComposeRawUnready && composeFixtureMintConsumeOk && composeFixtureEmitPathOk && !composeFixtureResidualFreeClaimed && !composeFixtureProductSelfHostCompleteClaimed && !composeFixtureProofCompleteClaimed && !composeFixtureLlvmUnlocked\n" ++
  "def composeFixtureResidualFreeClaimed : Bool := false\n" ++
  "def composeFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathComposeTermSkeletonSuffix

def compilePathComposeTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathCompose"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathComposeResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathComposeTermSurfaceFrom
      hostModuleCheckBadCompilePathComposeResidualText)
    compilePathExpectedNamespace compilePathComposeRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathComposeResidualDialectReject : Bool :=
  match checkCompilePathComposeTermDialect hostModuleCheckBadCompilePathComposeResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathComposeEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathComposeTermSurfaceFrom
      hostModuleCheckBadCompilePathComposeEmitText)
    compilePathExpectedNamespace compilePathComposeRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathComposeEmitDialectReject : Bool :=
  match checkCompilePathComposeTermDialect hostModuleCheckBadCompilePathComposeEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathComposeReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathComposeTermSurfaceFrom
      hostModuleCheckBadCompilePathComposeReadyText)
    compilePathExpectedNamespace compilePathComposeRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathComposeReadyDialectReject : Bool :=
  match checkCompilePathComposeTermDialect hostModuleCheckBadCompilePathComposeReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathComposeCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathComposeTermSurfaceFrom
      hostModuleCheckBadCompilePathComposeCompleteText)
    compilePathExpectedNamespace compilePathComposeRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathComposeCompleteDialectReject : Bool :=
  match checkCompilePathComposeTermDialect hostModuleCheckBadCompilePathComposeCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathComposeTermDialectOk : Bool :=
  (checkCompilePathComposeTermDialect hostModuleCheckGoodCompilePathComposeTermText).isNone

def hostModuleCheckCompilePathComposeTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathComposeTermSurfaceDualOk
    && (checkDepthCompilePathComposeTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathComposeTermSurfaceScope == "CompilePathCompose-only")
    && hostModuleCheckCompilePathComposeTermDialectOk
    && hostModuleCheckBadCompilePathComposeResidualDialectReject
    && hostModuleCheckBadCompilePathComposeEmitDialectReject
    && hostModuleCheckBadCompilePathComposeReadyDialectReject
    && hostModuleCheckBadCompilePathComposeCompleteDialectReject
    && hostModuleCheckBadCompilePathComposeResidualL0Accept
    && hostModuleCheckBadCompilePathComposeEmitL0Accept
    && hostModuleCheckBadCompilePathComposeReadyL0Accept
    && hostModuleCheckBadCompilePathComposeCompleteL0Accept

theorem hostModuleCheckCompilePathComposeTermSurfaceOk_true :
    hostModuleCheckCompilePathComposeTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathCompose_term_surface_ids_eq :
    checkDepthCompilePathComposeTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathComposeTermSurfaceScope = "CompilePathCompose-only"
      && hostModuleCheckCompilePathComposeTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathComposeTerm
