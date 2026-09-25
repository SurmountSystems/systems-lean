/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCompilePathApplyTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCompilePathApplyTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCompilePathApplyTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCheckersLater.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHAPPLYTERM,
  liveHostModuleCheckCompilePathApplyTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPILEPATHAPPLYTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm

/-- Dual-pinned live HostModuleCheckCompilePathApplyTerm.lean bytes.
    One part. Not split. 217 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCompilePathApplyTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPILEPATHAPPLYTERM. -/
def liveHostModuleCheckCompilePathApplyTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- CompilePathApply L2 term-surface (Plan/Apply/Body TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathApply dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathApply L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - compile-path ready compose matches product (includes applyFixtureApplyOk).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathApplyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathApplyTermSurfaceOk.

  Intentional non-claims:
  - CompilePathApply pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathApplyTerm, TERM-SURFACE, CompilePathApply-only,
  ILL-TYPED-TERM, checkCompilePathApplyTermDialect,
  hostModuleCheckCompilePathApplyTermDialectOk,
  hostModuleCheckCompilePathApplyTermSurfaceDualOk,
  hostModuleCheckCompilePathApplyTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathApplyTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathApplyTerm;
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

/-! ### CompilePathApply L2 term-surface dual-ok pins (CompilePathApply-only) -/

def checkDepthCompilePathApplyTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathApplyTermSurfaceScope : String := "CompilePathApply-only"
def hostModuleCheckCompilePathApplyTermSurfaceDualOk : Bool := true

def compilePathApplyEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitApply.emitApplyReady"

def compilePathApplyResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathApplyCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathApplyReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "applyFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && applyFixtureProgramReady && applyFixtureComposeReady && applyFixtureComposeRawUnready && applyFixtureApplyOk && applyFixtureEmitPathOk && !applyFixtureResidualFreeClaimed && !applyFixtureProductSelfHostCompleteClaimed && !applyFixtureProofCompleteClaimed && !applyFixtureLlvmUnlocked"

def checkCompilePathApplyTermDialect (content : String) : Option String :=
  if !compilePathApplyEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathApplyResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathApplyCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathApplyReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathApplyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathApplyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathApplyTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathApplyTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathApplyTermGoodMid : String :=
  "def applyFixtureProgramReady : Bool := true\n" ++
  "def applyFixtureComposeReady : Bool := true\n" ++
  "def applyFixtureEmitPathOk : Bool := EmitApply.emitApplyReady\n" ++
  "def applyFixtureCompilePathReady : Bool := gradeSurfaceOk && applyFixtureProgramReady && applyFixtureComposeReady && applyFixtureComposeRawUnready && applyFixtureApplyOk && applyFixtureEmitPathOk && !applyFixtureResidualFreeClaimed && !applyFixtureProductSelfHostCompleteClaimed && !applyFixtureProofCompleteClaimed && !applyFixtureLlvmUnlocked\n" ++
  "def applyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def applyFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathApplyTermText : String :=
  hostModuleCheckCompilePathApplyTermSkeletonPrefix
    ++ hostModuleCheckCompilePathApplyTermGoodMid
    ++ hostModuleCheckCompilePathApplyTermSkeletonSuffix

def hostModuleCheckBadCompilePathApplyResidualText : String :=
  hostModuleCheckCompilePathApplyTermSkeletonPrefix ++
  "def applyFixtureProgramReady : Bool := true\n" ++
  "def applyFixtureComposeReady : Bool := true\n" ++
  "def applyFixtureEmitPathOk : Bool := EmitApply.emitApplyReady\n" ++
  "def applyFixtureCompilePathReady : Bool := gradeSurfaceOk && applyFixtureProgramReady && applyFixtureComposeReady && applyFixtureComposeRawUnready && applyFixtureApplyOk && applyFixtureEmitPathOk && !applyFixtureResidualFreeClaimed && !applyFixtureProductSelfHostCompleteClaimed && !applyFixtureProofCompleteClaimed && !applyFixtureLlvmUnlocked\n" ++
  "def applyFixtureResidualFreeClaimed : Bool := true\n" ++
  "def applyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathApplyTermSkeletonSuffix

def hostModuleCheckBadCompilePathApplyEmitText : String :=
  hostModuleCheckCompilePathApplyTermSkeletonPrefix ++
  "def applyFixtureProgramReady : Bool := true\n" ++
  "def applyFixtureComposeReady : Bool := true\n" ++
  "def applyFixtureEmitPathOk : Bool := true\n" ++
  "def applyFixtureCompilePathReady : Bool := gradeSurfaceOk && applyFixtureProgramReady && applyFixtureComposeReady && applyFixtureComposeRawUnready && applyFixtureApplyOk && applyFixtureEmitPathOk && !applyFixtureResidualFreeClaimed && !applyFixtureProductSelfHostCompleteClaimed && !applyFixtureProofCompleteClaimed && !applyFixtureLlvmUnlocked\n" ++
  "def applyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def applyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathApplyTermSkeletonSuffix

def hostModuleCheckBadCompilePathApplyReadyText : String :=
  hostModuleCheckCompilePathApplyTermSkeletonPrefix ++
  "def applyFixtureProgramReady : Bool := true\n" ++
  "def applyFixtureComposeReady : Bool := true\n" ++
  "def applyFixtureEmitPathOk : Bool := EmitApply.emitApplyReady\n" ++
  "def applyFixtureCompilePathReady : Bool := true\n" ++
  "def applyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def applyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathApplyTermSkeletonSuffix

def hostModuleCheckBadCompilePathApplyCompleteText : String :=
  hostModuleCheckCompilePathApplyTermSkeletonPrefix ++
  "def applyFixtureProgramReady : Bool := true\n" ++
  "def applyFixtureComposeReady : Bool := true\n" ++
  "def applyFixtureEmitPathOk : Bool := EmitApply.emitApplyReady\n" ++
  "def applyFixtureCompilePathReady : Bool := gradeSurfaceOk && applyFixtureProgramReady && applyFixtureComposeReady && applyFixtureComposeRawUnready && applyFixtureApplyOk && applyFixtureEmitPathOk && !applyFixtureResidualFreeClaimed && !applyFixtureProductSelfHostCompleteClaimed && !applyFixtureProofCompleteClaimed && !applyFixtureLlvmUnlocked\n" ++
  "def applyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def applyFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathApplyTermSkeletonSuffix

def compilePathApplyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathApply"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathApplyResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathApplyTermSurfaceFrom
      hostModuleCheckBadCompilePathApplyResidualText)
    compilePathExpectedNamespace compilePathApplyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathApplyResidualDialectReject : Bool :=
  match checkCompilePathApplyTermDialect hostModuleCheckBadCompilePathApplyResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathApplyEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathApplyTermSurfaceFrom
      hostModuleCheckBadCompilePathApplyEmitText)
    compilePathExpectedNamespace compilePathApplyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathApplyEmitDialectReject : Bool :=
  match checkCompilePathApplyTermDialect hostModuleCheckBadCompilePathApplyEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathApplyReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathApplyTermSurfaceFrom
      hostModuleCheckBadCompilePathApplyReadyText)
    compilePathExpectedNamespace compilePathApplyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathApplyReadyDialectReject : Bool :=
  match checkCompilePathApplyTermDialect hostModuleCheckBadCompilePathApplyReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathApplyCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathApplyTermSurfaceFrom
      hostModuleCheckBadCompilePathApplyCompleteText)
    compilePathExpectedNamespace compilePathApplyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathApplyCompleteDialectReject : Bool :=
  match checkCompilePathApplyTermDialect hostModuleCheckBadCompilePathApplyCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathApplyTermDialectOk : Bool :=
  (checkCompilePathApplyTermDialect hostModuleCheckGoodCompilePathApplyTermText).isNone

def hostModuleCheckCompilePathApplyTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathApplyTermSurfaceDualOk
    && (checkDepthCompilePathApplyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathApplyTermSurfaceScope == "CompilePathApply-only")
    && hostModuleCheckCompilePathApplyTermDialectOk
    && hostModuleCheckBadCompilePathApplyResidualDialectReject
    && hostModuleCheckBadCompilePathApplyEmitDialectReject
    && hostModuleCheckBadCompilePathApplyReadyDialectReject
    && hostModuleCheckBadCompilePathApplyCompleteDialectReject
    && hostModuleCheckBadCompilePathApplyResidualL0Accept
    && hostModuleCheckBadCompilePathApplyEmitL0Accept
    && hostModuleCheckBadCompilePathApplyReadyL0Accept
    && hostModuleCheckBadCompilePathApplyCompleteL0Accept

theorem hostModuleCheckCompilePathApplyTermSurfaceOk_true :
    hostModuleCheckCompilePathApplyTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathApply_term_surface_ids_eq :
    checkDepthCompilePathApplyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathApplyTermSurfaceScope = "CompilePathApply-only"
      && hostModuleCheckCompilePathApplyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCompilePathApplyTerm
