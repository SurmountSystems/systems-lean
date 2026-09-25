/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathMultTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathMultTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathMultTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHMULTTERM,
  liveHostModuleCheckCompilePathMultTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHMULTTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm

/-- Dual-pinned live HostModuleCheckCompilePathMultTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathMultTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHMULTTERM. -/
def liveHostModuleCheckCompilePathMultTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathMult L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathMult dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathMult L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathMultTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathMultTermSurfaceOk.

  Intentional non-claims:
  - CompilePathMult pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathMultTerm, TERM-SURFACE, CompilePathMult-only,
  ILL-TYPED-TERM, checkCompilePathMultTermDialect,
  hostModuleCheckCompilePathMultTermDialectOk,
  hostModuleCheckCompilePathMultTermSurfaceDualOk,
  hostModuleCheckCompilePathMultTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathMultTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathMultTerm;
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

/-! ### CompilePathMult L2 term-surface dual-ok pins (CompilePathMult-only) -/

def checkDepthCompilePathMultTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathMultTermSurfaceScope : String := "CompilePathMult-only"
def hostModuleCheckCompilePathMultTermSurfaceDualOk : Bool := true

def compilePathMultEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitMult.emitMultReady"

def compilePathMultResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathMultCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathMultReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && multFixtureProgramReady && multFixtureComposeReady && multFixtureComposeRawUnready && multFixtureEmitPathOk && !multFixtureResidualFreeClaimed && !multFixtureProductSelfHostCompleteClaimed && !multFixtureProofCompleteClaimed && !multFixtureLlvmUnlocked"

def checkCompilePathMultTermDialect (content : String) : Option String :=
  if !compilePathMultEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathMultResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathMultCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathMultReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathMultWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathMultTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathMultTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathMultTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathMultTermGoodMid : String :=
  "def multFixtureProgramReady : Bool := true\n" ++
  "def multFixtureComposeReady : Bool := true\n" ++
  "def multFixtureEmitPathOk : Bool := EmitMult.emitMultReady\n" ++
  "def multFixtureCompilePathReady : Bool := gradeSurfaceOk && multFixtureProgramReady && multFixtureComposeReady && multFixtureComposeRawUnready && multFixtureEmitPathOk && !multFixtureResidualFreeClaimed && !multFixtureProductSelfHostCompleteClaimed && !multFixtureProofCompleteClaimed && !multFixtureLlvmUnlocked\n" ++
  "def multFixtureResidualFreeClaimed : Bool := false\n" ++
  "def multFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathMultTermText : String :=
  hostModuleCheckCompilePathMultTermSkeletonPrefix
    ++ hostModuleCheckCompilePathMultTermGoodMid
    ++ hostModuleCheckCompilePathMultTermSkeletonSuffix

def hostModuleCheckBadCompilePathMultResidualText : String :=
  hostModuleCheckCompilePathMultTermSkeletonPrefix ++
  "def multFixtureProgramReady : Bool := true\n" ++
  "def multFixtureComposeReady : Bool := true\n" ++
  "def multFixtureEmitPathOk : Bool := EmitMult.emitMultReady\n" ++
  "def multFixtureCompilePathReady : Bool := gradeSurfaceOk && multFixtureProgramReady && multFixtureComposeReady && multFixtureComposeRawUnready && multFixtureEmitPathOk && !multFixtureResidualFreeClaimed && !multFixtureProductSelfHostCompleteClaimed && !multFixtureProofCompleteClaimed && !multFixtureLlvmUnlocked\n" ++
  "def multFixtureResidualFreeClaimed : Bool := true\n" ++
  "def multFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathMultTermSkeletonSuffix

def hostModuleCheckBadCompilePathMultEmitText : String :=
  hostModuleCheckCompilePathMultTermSkeletonPrefix ++
  "def multFixtureProgramReady : Bool := true\n" ++
  "def multFixtureComposeReady : Bool := true\n" ++
  "def multFixtureEmitPathOk : Bool := true\n" ++
  "def multFixtureCompilePathReady : Bool := gradeSurfaceOk && multFixtureProgramReady && multFixtureComposeReady && multFixtureComposeRawUnready && multFixtureEmitPathOk && !multFixtureResidualFreeClaimed && !multFixtureProductSelfHostCompleteClaimed && !multFixtureProofCompleteClaimed && !multFixtureLlvmUnlocked\n" ++
  "def multFixtureResidualFreeClaimed : Bool := false\n" ++
  "def multFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathMultTermSkeletonSuffix

def hostModuleCheckBadCompilePathMultReadyText : String :=
  hostModuleCheckCompilePathMultTermSkeletonPrefix ++
  "def multFixtureProgramReady : Bool := true\n" ++
  "def multFixtureComposeReady : Bool := true\n" ++
  "def multFixtureEmitPathOk : Bool := EmitMult.emitMultReady\n" ++
  "def multFixtureCompilePathReady : Bool := true\n" ++
  "def multFixtureResidualFreeClaimed : Bool := false\n" ++
  "def multFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathMultTermSkeletonSuffix

def hostModuleCheckBadCompilePathMultCompleteText : String :=
  hostModuleCheckCompilePathMultTermSkeletonPrefix ++
  "def multFixtureProgramReady : Bool := true\n" ++
  "def multFixtureComposeReady : Bool := true\n" ++
  "def multFixtureEmitPathOk : Bool := EmitMult.emitMultReady\n" ++
  "def multFixtureCompilePathReady : Bool := gradeSurfaceOk && multFixtureProgramReady && multFixtureComposeReady && multFixtureComposeRawUnready && multFixtureEmitPathOk && !multFixtureResidualFreeClaimed && !multFixtureProductSelfHostCompleteClaimed && !multFixtureProofCompleteClaimed && !multFixtureLlvmUnlocked\n" ++
  "def multFixtureResidualFreeClaimed : Bool := false\n" ++
  "def multFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathMultTermSkeletonSuffix

def compilePathMultTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathMult"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathMultResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathMultTermSurfaceFrom
      hostModuleCheckBadCompilePathMultResidualText)
    compilePathExpectedNamespace compilePathMultRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathMultResidualDialectReject : Bool :=
  match checkCompilePathMultTermDialect hostModuleCheckBadCompilePathMultResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathMultEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathMultTermSurfaceFrom
      hostModuleCheckBadCompilePathMultEmitText)
    compilePathExpectedNamespace compilePathMultRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathMultEmitDialectReject : Bool :=
  match checkCompilePathMultTermDialect hostModuleCheckBadCompilePathMultEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathMultReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathMultTermSurfaceFrom
      hostModuleCheckBadCompilePathMultReadyText)
    compilePathExpectedNamespace compilePathMultRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathMultReadyDialectReject : Bool :=
  match checkCompilePathMultTermDialect hostModuleCheckBadCompilePathMultReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathMultCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathMultTermSurfaceFrom
      hostModuleCheckBadCompilePathMultCompleteText)
    compilePathExpectedNamespace compilePathMultRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathMultCompleteDialectReject : Bool :=
  match checkCompilePathMultTermDialect hostModuleCheckBadCompilePathMultCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathMultTermDialectOk : Bool :=
  (checkCompilePathMultTermDialect hostModuleCheckGoodCompilePathMultTermText).isNone

def hostModuleCheckCompilePathMultTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathMultTermSurfaceDualOk
    && (checkDepthCompilePathMultTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathMultTermSurfaceScope == "CompilePathMult-only")
    && hostModuleCheckCompilePathMultTermDialectOk
    && hostModuleCheckBadCompilePathMultResidualDialectReject
    && hostModuleCheckBadCompilePathMultEmitDialectReject
    && hostModuleCheckBadCompilePathMultReadyDialectReject
    && hostModuleCheckBadCompilePathMultCompleteDialectReject
    && hostModuleCheckBadCompilePathMultResidualL0Accept
    && hostModuleCheckBadCompilePathMultEmitL0Accept
    && hostModuleCheckBadCompilePathMultReadyL0Accept
    && hostModuleCheckBadCompilePathMultCompleteL0Accept

theorem hostModuleCheckCompilePathMultTermSurfaceOk_true :
    hostModuleCheckCompilePathMultTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathMult_term_surface_ids_eq :
    checkDepthCompilePathMultTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathMultTermSurfaceScope = "CompilePathMult-only"
      && hostModuleCheckCompilePathMultTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathMultTerm
