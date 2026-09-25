/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathExtractTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathExtractTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathExtractTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM,
  liveHostModuleCheckCompilePathExtractTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm

/-- Dual-pinned live HostModuleCheckCompilePathExtractTerm.lean bytes.
    One part. Not split. 207 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathExtractTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHEXTRACTTERM. -/
def liveHostModuleCheckCompilePathExtractTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathExtract L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathExtract dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathExtract L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathExtractTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathExtractTermSurfaceOk.

  Intentional non-claims:
  - CompilePathExtract pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathExtractTerm, TERM-SURFACE, CompilePathExtract-only,
  ILL-TYPED-TERM, checkCompilePathExtractTermDialect,
  hostModuleCheckCompilePathExtractTermDialectOk,
  hostModuleCheckCompilePathExtractTermSurfaceDualOk,
  hostModuleCheckCompilePathExtractTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathExtractTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathExtractTerm;
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

/-! ### CompilePathExtract L2 term-surface dual-ok pins (CompilePathExtract-only) -/

def checkDepthCompilePathExtractTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathExtractTermSurfaceScope : String := "CompilePathExtract-only"
def hostModuleCheckCompilePathExtractTermSurfaceDualOk : Bool := true

def extractMultGateBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFixtureExtractGateOk" with
  | none => false
  | some body => body == "match lowerMultFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc"

def extractProgramGateBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programFixtureExtractGateOk" with
  | none => false
  | some body => body == "match lowerProgramFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc"

def extractGateReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractRuntimeFsGateReady" with
  | none => false
  | some body => body == "multFixtureExtractGateOk && programFixtureExtractGateOk && multFixtureExtractRawReject && programFixtureExtractRawReject && !extractRuntimeFsResidualFreeClaimed && !extractRuntimeFsProductSelfHostCompleteClaimed && !extractRuntimeFsProofCompleteClaimed && !extractRuntimeFsLlvmUnlocked"

def extractResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractRuntimeFsResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def checkCompilePathExtractTermDialect (content : String) : Option String :=
  if !extractMultGateBodyOk content then some reasonIllTypedTerm
  else if !extractProgramGateBodyOk content then some reasonIllTypedTerm
  else if !extractGateReadyBodyOk content then some reasonIllTypedTerm
  else if !extractResidualFreeBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathExtractWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathExtractTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathExtractTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathExtractTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathExtractTermGoodMid : String :=
  "def multFixtureExtractGateOk : Bool := match lowerMultFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def programFixtureExtractGateOk : Bool := match lowerProgramFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def extractRuntimeFsGateReady : Bool := multFixtureExtractGateOk && programFixtureExtractGateOk && multFixtureExtractRawReject && programFixtureExtractRawReject && !extractRuntimeFsResidualFreeClaimed && !extractRuntimeFsProductSelfHostCompleteClaimed && !extractRuntimeFsProofCompleteClaimed && !extractRuntimeFsLlvmUnlocked\n" ++
  "def extractRuntimeFsResidualFreeClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathExtractTermText : String :=
  hostModuleCheckCompilePathExtractTermSkeletonPrefix
    ++ hostModuleCheckCompilePathExtractTermGoodMid
    ++ hostModuleCheckCompilePathExtractTermSkeletonSuffix

def hostModuleCheckBadCompilePathExtractResidualText : String :=
  hostModuleCheckCompilePathExtractTermSkeletonPrefix ++
  "def multFixtureExtractGateOk : Bool := match lowerMultFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def programFixtureExtractGateOk : Bool := match lowerProgramFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def extractRuntimeFsGateReady : Bool := multFixtureExtractGateOk && programFixtureExtractGateOk && multFixtureExtractRawReject && programFixtureExtractRawReject && !extractRuntimeFsResidualFreeClaimed && !extractRuntimeFsProductSelfHostCompleteClaimed && !extractRuntimeFsProofCompleteClaimed && !extractRuntimeFsLlvmUnlocked\n" ++
  "def extractRuntimeFsResidualFreeClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathExtractTermSkeletonSuffix

def hostModuleCheckBadCompilePathExtractEmitText : String :=
  hostModuleCheckCompilePathExtractTermSkeletonPrefix ++
  "def multFixtureExtractGateOk : Bool := true\n" ++
  "def programFixtureExtractGateOk : Bool := match lowerProgramFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def extractRuntimeFsGateReady : Bool := multFixtureExtractGateOk && programFixtureExtractGateOk && multFixtureExtractRawReject && programFixtureExtractRawReject && !extractRuntimeFsResidualFreeClaimed && !extractRuntimeFsProductSelfHostCompleteClaimed && !extractRuntimeFsProofCompleteClaimed && !extractRuntimeFsLlvmUnlocked\n" ++
  "def extractRuntimeFsResidualFreeClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathExtractTermSkeletonSuffix

def hostModuleCheckBadCompilePathExtractReadyText : String :=
  hostModuleCheckCompilePathExtractTermSkeletonPrefix ++
  "def multFixtureExtractGateOk : Bool := match lowerMultFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def programFixtureExtractGateOk : Bool := match lowerProgramFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def extractRuntimeFsGateReady : Bool := true\n" ++
  "def extractRuntimeFsResidualFreeClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathExtractTermSkeletonSuffix

def hostModuleCheckBadCompilePathExtractCompleteText : String :=
  hostModuleCheckCompilePathExtractTermSkeletonPrefix ++
  "def multFixtureExtractGateOk : Bool := match lowerMultFixtureCompose with | none => false | some hc => fixtureExtractGateOk hc\n" ++
  "def programFixtureExtractGateOk : Bool := true\n" ++
  "def extractRuntimeFsGateReady : Bool := multFixtureExtractGateOk && programFixtureExtractGateOk && multFixtureExtractRawReject && programFixtureExtractRawReject && !extractRuntimeFsResidualFreeClaimed && !extractRuntimeFsProductSelfHostCompleteClaimed && !extractRuntimeFsProofCompleteClaimed && !extractRuntimeFsLlvmUnlocked\n" ++
  "def extractRuntimeFsResidualFreeClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathExtractTermSkeletonSuffix

def compilePathExtractTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathExtract"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathExtractResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathExtractTermSurfaceFrom
      hostModuleCheckBadCompilePathExtractResidualText)
    compilePathExpectedNamespace compilePathExtractRequiredDecls (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadCompilePathExtractResidualDialectReject : Bool :=
  match checkCompilePathExtractTermDialect hostModuleCheckBadCompilePathExtractResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathExtractEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathExtractTermSurfaceFrom
      hostModuleCheckBadCompilePathExtractEmitText)
    compilePathExpectedNamespace compilePathExtractRequiredDecls (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadCompilePathExtractEmitDialectReject : Bool :=
  match checkCompilePathExtractTermDialect hostModuleCheckBadCompilePathExtractEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathExtractReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathExtractTermSurfaceFrom
      hostModuleCheckBadCompilePathExtractReadyText)
    compilePathExpectedNamespace compilePathExtractRequiredDecls (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadCompilePathExtractReadyDialectReject : Bool :=
  match checkCompilePathExtractTermDialect hostModuleCheckBadCompilePathExtractReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathExtractCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathExtractTermSurfaceFrom
      hostModuleCheckBadCompilePathExtractCompleteText)
    compilePathExpectedNamespace compilePathExtractRequiredDecls (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadCompilePathExtractCompleteDialectReject : Bool :=
  match checkCompilePathExtractTermDialect hostModuleCheckBadCompilePathExtractCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathExtractTermDialectOk : Bool :=
  (checkCompilePathExtractTermDialect hostModuleCheckGoodCompilePathExtractTermText).isNone

def hostModuleCheckCompilePathExtractTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathExtractTermSurfaceDualOk
    && (checkDepthCompilePathExtractTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathExtractTermSurfaceScope == "CompilePathExtract-only")
    && hostModuleCheckCompilePathExtractTermDialectOk
    && hostModuleCheckBadCompilePathExtractResidualDialectReject
    && hostModuleCheckBadCompilePathExtractEmitDialectReject
    && hostModuleCheckBadCompilePathExtractReadyDialectReject
    && hostModuleCheckBadCompilePathExtractCompleteDialectReject
    && hostModuleCheckBadCompilePathExtractResidualL0Accept
    && hostModuleCheckBadCompilePathExtractEmitL0Accept
    && hostModuleCheckBadCompilePathExtractReadyL0Accept
    && hostModuleCheckBadCompilePathExtractCompleteL0Accept

theorem hostModuleCheckCompilePathExtractTermSurfaceOk_true :
    hostModuleCheckCompilePathExtractTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathExtract_term_surface_ids_eq :
    checkDepthCompilePathExtractTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathExtractTermSurfaceScope = "CompilePathExtract-only"
      && hostModuleCheckCompilePathExtractTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathExtractTerm
