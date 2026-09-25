/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathLinearTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathLinearTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathLinearTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCompilePathExtractTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHLINEARTERM,
  liveHostModuleCheckCompilePathLinearTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHLINEARTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm

/-- Dual-pinned live HostModuleCheckCompilePathLinearTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathLinearTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHLINEARTERM. -/
def liveHostModuleCheckCompilePathLinearTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathLinear L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathLinear dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathLinear L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathLinearTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathLinearTermSurfaceOk.

  Intentional non-claims:
  - CompilePathLinear pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathLinearTerm, TERM-SURFACE, CompilePathLinear-only,
  ILL-TYPED-TERM, checkCompilePathLinearTermDialect,
  hostModuleCheckCompilePathLinearTermDialectOk,
  hostModuleCheckCompilePathLinearTermSurfaceDualOk,
  hostModuleCheckCompilePathLinearTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathLinearTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathLinearTerm;
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

/-! ### CompilePathLinear L2 term-surface dual-ok pins (CompilePathLinear-only) -/

def checkDepthCompilePathLinearTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathLinearTermSurfaceScope : String := "CompilePathLinear-only"
def hostModuleCheckCompilePathLinearTermSurfaceDualOk : Bool := true

def compilePathLinearEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitLinear.emitLinearReady"

def compilePathLinearResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathLinearCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathLinearReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && linearFixtureProgramReady && linearFixtureComposeReady && linearFixtureComposeRawUnready && linearFixtureMintConsumeOk && linearFixtureEmitPathOk && !linearFixtureResidualFreeClaimed && !linearFixtureProductSelfHostCompleteClaimed && !linearFixtureProofCompleteClaimed && !linearFixtureLlvmUnlocked"

def checkCompilePathLinearTermDialect (content : String) : Option String :=
  if !compilePathLinearEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathLinearResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathLinearCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathLinearReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathLinearWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathLinearTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathLinearTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathLinearTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathLinearTermGoodMid : String :=
  "def linearFixtureProgramReady : Bool := true\n" ++
  "def linearFixtureComposeReady : Bool := true\n" ++
  "def linearFixtureEmitPathOk : Bool := EmitLinear.emitLinearReady\n" ++
  "def linearFixtureCompilePathReady : Bool := gradeSurfaceOk && linearFixtureProgramReady && linearFixtureComposeReady && linearFixtureComposeRawUnready && linearFixtureMintConsumeOk && linearFixtureEmitPathOk && !linearFixtureResidualFreeClaimed && !linearFixtureProductSelfHostCompleteClaimed && !linearFixtureProofCompleteClaimed && !linearFixtureLlvmUnlocked\n" ++
  "def linearFixtureResidualFreeClaimed : Bool := false\n" ++
  "def linearFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathLinearTermText : String :=
  hostModuleCheckCompilePathLinearTermSkeletonPrefix
    ++ hostModuleCheckCompilePathLinearTermGoodMid
    ++ hostModuleCheckCompilePathLinearTermSkeletonSuffix

def hostModuleCheckBadCompilePathLinearResidualText : String :=
  hostModuleCheckCompilePathLinearTermSkeletonPrefix ++
  "def linearFixtureProgramReady : Bool := true\n" ++
  "def linearFixtureComposeReady : Bool := true\n" ++
  "def linearFixtureEmitPathOk : Bool := EmitLinear.emitLinearReady\n" ++
  "def linearFixtureCompilePathReady : Bool := gradeSurfaceOk && linearFixtureProgramReady && linearFixtureComposeReady && linearFixtureComposeRawUnready && linearFixtureMintConsumeOk && linearFixtureEmitPathOk && !linearFixtureResidualFreeClaimed && !linearFixtureProductSelfHostCompleteClaimed && !linearFixtureProofCompleteClaimed && !linearFixtureLlvmUnlocked\n" ++
  "def linearFixtureResidualFreeClaimed : Bool := true\n" ++
  "def linearFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathLinearTermSkeletonSuffix

def hostModuleCheckBadCompilePathLinearEmitText : String :=
  hostModuleCheckCompilePathLinearTermSkeletonPrefix ++
  "def linearFixtureProgramReady : Bool := true\n" ++
  "def linearFixtureComposeReady : Bool := true\n" ++
  "def linearFixtureEmitPathOk : Bool := true\n" ++
  "def linearFixtureCompilePathReady : Bool := gradeSurfaceOk && linearFixtureProgramReady && linearFixtureComposeReady && linearFixtureComposeRawUnready && linearFixtureMintConsumeOk && linearFixtureEmitPathOk && !linearFixtureResidualFreeClaimed && !linearFixtureProductSelfHostCompleteClaimed && !linearFixtureProofCompleteClaimed && !linearFixtureLlvmUnlocked\n" ++
  "def linearFixtureResidualFreeClaimed : Bool := false\n" ++
  "def linearFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathLinearTermSkeletonSuffix

def hostModuleCheckBadCompilePathLinearReadyText : String :=
  hostModuleCheckCompilePathLinearTermSkeletonPrefix ++
  "def linearFixtureProgramReady : Bool := true\n" ++
  "def linearFixtureComposeReady : Bool := true\n" ++
  "def linearFixtureEmitPathOk : Bool := EmitLinear.emitLinearReady\n" ++
  "def linearFixtureCompilePathReady : Bool := true\n" ++
  "def linearFixtureResidualFreeClaimed : Bool := false\n" ++
  "def linearFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathLinearTermSkeletonSuffix

def hostModuleCheckBadCompilePathLinearCompleteText : String :=
  hostModuleCheckCompilePathLinearTermSkeletonPrefix ++
  "def linearFixtureProgramReady : Bool := true\n" ++
  "def linearFixtureComposeReady : Bool := true\n" ++
  "def linearFixtureEmitPathOk : Bool := EmitLinear.emitLinearReady\n" ++
  "def linearFixtureCompilePathReady : Bool := gradeSurfaceOk && linearFixtureProgramReady && linearFixtureComposeReady && linearFixtureComposeRawUnready && linearFixtureMintConsumeOk && linearFixtureEmitPathOk && !linearFixtureResidualFreeClaimed && !linearFixtureProductSelfHostCompleteClaimed && !linearFixtureProofCompleteClaimed && !linearFixtureLlvmUnlocked\n" ++
  "def linearFixtureResidualFreeClaimed : Bool := false\n" ++
  "def linearFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathLinearTermSkeletonSuffix

def compilePathLinearTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathLinear"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathLinearResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathLinearTermSurfaceFrom
      hostModuleCheckBadCompilePathLinearResidualText)
    compilePathExpectedNamespace compilePathLinearRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathLinearResidualDialectReject : Bool :=
  match checkCompilePathLinearTermDialect hostModuleCheckBadCompilePathLinearResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathLinearEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathLinearTermSurfaceFrom
      hostModuleCheckBadCompilePathLinearEmitText)
    compilePathExpectedNamespace compilePathLinearRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathLinearEmitDialectReject : Bool :=
  match checkCompilePathLinearTermDialect hostModuleCheckBadCompilePathLinearEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathLinearReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathLinearTermSurfaceFrom
      hostModuleCheckBadCompilePathLinearReadyText)
    compilePathExpectedNamespace compilePathLinearRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathLinearReadyDialectReject : Bool :=
  match checkCompilePathLinearTermDialect hostModuleCheckBadCompilePathLinearReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathLinearCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathLinearTermSurfaceFrom
      hostModuleCheckBadCompilePathLinearCompleteText)
    compilePathExpectedNamespace compilePathLinearRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathLinearCompleteDialectReject : Bool :=
  match checkCompilePathLinearTermDialect hostModuleCheckBadCompilePathLinearCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathLinearTermDialectOk : Bool :=
  (checkCompilePathLinearTermDialect hostModuleCheckGoodCompilePathLinearTermText).isNone

def hostModuleCheckCompilePathLinearTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathLinearTermSurfaceDualOk
    && (checkDepthCompilePathLinearTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathLinearTermSurfaceScope == "CompilePathLinear-only")
    && hostModuleCheckCompilePathLinearTermDialectOk
    && hostModuleCheckBadCompilePathLinearResidualDialectReject
    && hostModuleCheckBadCompilePathLinearEmitDialectReject
    && hostModuleCheckBadCompilePathLinearReadyDialectReject
    && hostModuleCheckBadCompilePathLinearCompleteDialectReject
    && hostModuleCheckBadCompilePathLinearResidualL0Accept
    && hostModuleCheckBadCompilePathLinearEmitL0Accept
    && hostModuleCheckBadCompilePathLinearReadyL0Accept
    && hostModuleCheckBadCompilePathLinearCompleteL0Accept

theorem hostModuleCheckCompilePathLinearTermSurfaceOk_true :
    hostModuleCheckCompilePathLinearTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathLinear_term_surface_ids_eq :
    checkDepthCompilePathLinearTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathLinearTermSurfaceScope = "CompilePathLinear-only"
      && hostModuleCheckCompilePathLinearTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathLinearTerm
