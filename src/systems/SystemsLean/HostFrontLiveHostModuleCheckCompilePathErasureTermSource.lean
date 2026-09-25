/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathErasureTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathErasureTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathErasureTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHERASURETERM,
  liveHostModuleCheckCompilePathErasureTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHERASURETERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm

/-- Dual-pinned live HostModuleCheckCompilePathErasureTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathErasureTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHERASURETERM. -/
def liveHostModuleCheckCompilePathErasureTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathErasure L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathErasure dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathErasure L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathErasureTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathErasureTermSurfaceOk.

  Intentional non-claims:
  - CompilePathErasure pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathErasureTerm, TERM-SURFACE, CompilePathErasure-only,
  ILL-TYPED-TERM, checkCompilePathErasureTermDialect,
  hostModuleCheckCompilePathErasureTermDialectOk,
  hostModuleCheckCompilePathErasureTermSurfaceDualOk,
  hostModuleCheckCompilePathErasureTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathErasureTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathErasureTerm;
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

/-! ### CompilePathErasure L2 term-surface dual-ok pins (CompilePathErasure-only) -/

def checkDepthCompilePathErasureTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathErasureTermSurfaceScope : String := "CompilePathErasure-only"
def hostModuleCheckCompilePathErasureTermSurfaceDualOk : Bool := true

def compilePathErasureEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitErasure.emitErasureReady"

def compilePathErasureResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathErasureCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathErasureReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && erasureFixtureProgramReady && erasureFixtureComposeReady && erasureFixtureComposeRawUnready && erasureFixtureMarkedOk && erasureFixtureEmitPathOk && !erasureFixtureResidualFreeClaimed && !erasureFixtureProductSelfHostCompleteClaimed && !erasureFixtureProofCompleteClaimed && !erasureFixtureLlvmUnlocked"

def checkCompilePathErasureTermDialect (content : String) : Option String :=
  if !compilePathErasureEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathErasureResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathErasureCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathErasureReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathErasureWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathErasureTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathErasureTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathErasureTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathErasureTermGoodMid : String :=
  "def erasureFixtureProgramReady : Bool := true\n" ++
  "def erasureFixtureComposeReady : Bool := true\n" ++
  "def erasureFixtureEmitPathOk : Bool := EmitErasure.emitErasureReady\n" ++
  "def erasureFixtureCompilePathReady : Bool := gradeSurfaceOk && erasureFixtureProgramReady && erasureFixtureComposeReady && erasureFixtureComposeRawUnready && erasureFixtureMarkedOk && erasureFixtureEmitPathOk && !erasureFixtureResidualFreeClaimed && !erasureFixtureProductSelfHostCompleteClaimed && !erasureFixtureProofCompleteClaimed && !erasureFixtureLlvmUnlocked\n" ++
  "def erasureFixtureResidualFreeClaimed : Bool := false\n" ++
  "def erasureFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathErasureTermText : String :=
  hostModuleCheckCompilePathErasureTermSkeletonPrefix
    ++ hostModuleCheckCompilePathErasureTermGoodMid
    ++ hostModuleCheckCompilePathErasureTermSkeletonSuffix

def hostModuleCheckBadCompilePathErasureResidualText : String :=
  hostModuleCheckCompilePathErasureTermSkeletonPrefix ++
  "def erasureFixtureProgramReady : Bool := true\n" ++
  "def erasureFixtureComposeReady : Bool := true\n" ++
  "def erasureFixtureEmitPathOk : Bool := EmitErasure.emitErasureReady\n" ++
  "def erasureFixtureCompilePathReady : Bool := gradeSurfaceOk && erasureFixtureProgramReady && erasureFixtureComposeReady && erasureFixtureComposeRawUnready && erasureFixtureMarkedOk && erasureFixtureEmitPathOk && !erasureFixtureResidualFreeClaimed && !erasureFixtureProductSelfHostCompleteClaimed && !erasureFixtureProofCompleteClaimed && !erasureFixtureLlvmUnlocked\n" ++
  "def erasureFixtureResidualFreeClaimed : Bool := true\n" ++
  "def erasureFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathErasureTermSkeletonSuffix

def hostModuleCheckBadCompilePathErasureEmitText : String :=
  hostModuleCheckCompilePathErasureTermSkeletonPrefix ++
  "def erasureFixtureProgramReady : Bool := true\n" ++
  "def erasureFixtureComposeReady : Bool := true\n" ++
  "def erasureFixtureEmitPathOk : Bool := true\n" ++
  "def erasureFixtureCompilePathReady : Bool := gradeSurfaceOk && erasureFixtureProgramReady && erasureFixtureComposeReady && erasureFixtureComposeRawUnready && erasureFixtureMarkedOk && erasureFixtureEmitPathOk && !erasureFixtureResidualFreeClaimed && !erasureFixtureProductSelfHostCompleteClaimed && !erasureFixtureProofCompleteClaimed && !erasureFixtureLlvmUnlocked\n" ++
  "def erasureFixtureResidualFreeClaimed : Bool := false\n" ++
  "def erasureFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathErasureTermSkeletonSuffix

def hostModuleCheckBadCompilePathErasureReadyText : String :=
  hostModuleCheckCompilePathErasureTermSkeletonPrefix ++
  "def erasureFixtureProgramReady : Bool := true\n" ++
  "def erasureFixtureComposeReady : Bool := true\n" ++
  "def erasureFixtureEmitPathOk : Bool := EmitErasure.emitErasureReady\n" ++
  "def erasureFixtureCompilePathReady : Bool := true\n" ++
  "def erasureFixtureResidualFreeClaimed : Bool := false\n" ++
  "def erasureFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathErasureTermSkeletonSuffix

def hostModuleCheckBadCompilePathErasureCompleteText : String :=
  hostModuleCheckCompilePathErasureTermSkeletonPrefix ++
  "def erasureFixtureProgramReady : Bool := true\n" ++
  "def erasureFixtureComposeReady : Bool := true\n" ++
  "def erasureFixtureEmitPathOk : Bool := EmitErasure.emitErasureReady\n" ++
  "def erasureFixtureCompilePathReady : Bool := gradeSurfaceOk && erasureFixtureProgramReady && erasureFixtureComposeReady && erasureFixtureComposeRawUnready && erasureFixtureMarkedOk && erasureFixtureEmitPathOk && !erasureFixtureResidualFreeClaimed && !erasureFixtureProductSelfHostCompleteClaimed && !erasureFixtureProofCompleteClaimed && !erasureFixtureLlvmUnlocked\n" ++
  "def erasureFixtureResidualFreeClaimed : Bool := false\n" ++
  "def erasureFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathErasureTermSkeletonSuffix

def compilePathErasureTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathErasure"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathErasureResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathErasureTermSurfaceFrom
      hostModuleCheckBadCompilePathErasureResidualText)
    compilePathExpectedNamespace compilePathErasureRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathErasureResidualDialectReject : Bool :=
  match checkCompilePathErasureTermDialect hostModuleCheckBadCompilePathErasureResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathErasureEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathErasureTermSurfaceFrom
      hostModuleCheckBadCompilePathErasureEmitText)
    compilePathExpectedNamespace compilePathErasureRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathErasureEmitDialectReject : Bool :=
  match checkCompilePathErasureTermDialect hostModuleCheckBadCompilePathErasureEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathErasureReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathErasureTermSurfaceFrom
      hostModuleCheckBadCompilePathErasureReadyText)
    compilePathExpectedNamespace compilePathErasureRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathErasureReadyDialectReject : Bool :=
  match checkCompilePathErasureTermDialect hostModuleCheckBadCompilePathErasureReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathErasureCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathErasureTermSurfaceFrom
      hostModuleCheckBadCompilePathErasureCompleteText)
    compilePathExpectedNamespace compilePathErasureRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathErasureCompleteDialectReject : Bool :=
  match checkCompilePathErasureTermDialect hostModuleCheckBadCompilePathErasureCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathErasureTermDialectOk : Bool :=
  (checkCompilePathErasureTermDialect hostModuleCheckGoodCompilePathErasureTermText).isNone

def hostModuleCheckCompilePathErasureTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathErasureTermSurfaceDualOk
    && (checkDepthCompilePathErasureTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathErasureTermSurfaceScope == "CompilePathErasure-only")
    && hostModuleCheckCompilePathErasureTermDialectOk
    && hostModuleCheckBadCompilePathErasureResidualDialectReject
    && hostModuleCheckBadCompilePathErasureEmitDialectReject
    && hostModuleCheckBadCompilePathErasureReadyDialectReject
    && hostModuleCheckBadCompilePathErasureCompleteDialectReject
    && hostModuleCheckBadCompilePathErasureResidualL0Accept
    && hostModuleCheckBadCompilePathErasureEmitL0Accept
    && hostModuleCheckBadCompilePathErasureReadyL0Accept
    && hostModuleCheckBadCompilePathErasureCompleteL0Accept

theorem hostModuleCheckCompilePathErasureTermSurfaceOk_true :
    hostModuleCheckCompilePathErasureTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathErasure_term_surface_ids_eq :
    checkDepthCompilePathErasureTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathErasureTermSurfaceScope = "CompilePathErasure-only"
      && hostModuleCheckCompilePathErasureTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathErasureTerm
