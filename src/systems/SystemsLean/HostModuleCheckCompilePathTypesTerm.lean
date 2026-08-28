/-
  SYSTEMS_LEAN_HOST partial -- CompilePathTypes L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathTypes dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathTypes L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathTypesTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathTypesTermSurfaceOk.

  Intentional non-claims:
  - CompilePathTypes pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathTypesTerm, TERM-SURFACE, CompilePathTypes-only,
  ILL-TYPED-TERM, checkCompilePathTypesTermDialect,
  hostModuleCheckCompilePathTypesTermDialectOk,
  hostModuleCheckCompilePathTypesTermSurfaceDualOk,
  hostModuleCheckCompilePathTypesTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathTypesTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathTypesTerm;
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

/-! ### CompilePathTypes L2 term-surface dual-ok pins (CompilePathTypes-only) -/

def checkDepthCompilePathTypesTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathTypesTermSurfaceScope : String := "CompilePathTypes-only"
def hostModuleCheckCompilePathTypesTermSurfaceDualOk : Bool := true

def compilePathTypesEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitTypes.emitTypesReady"

def compilePathTypesResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathTypesCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathTypesReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && typesFixtureKindMultOk && typesFixtureProgramReady && typesFixtureComposeReady && typesFixtureComposeRawUnready && typesFixtureEmitPathOk && !typesFixtureResidualFreeClaimed && !typesFixtureProductSelfHostCompleteClaimed && !typesFixtureProofCompleteClaimed && !typesFixtureLlvmUnlocked"

def checkCompilePathTypesTermDialect (content : String) : Option String :=
  if !compilePathTypesEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathTypesResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathTypesCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathTypesReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathTypesWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathTypesTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathTypesTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathTypesTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathTypesTermGoodMid : String :=
  "def typesFixtureProgramReady : Bool := true\n" ++
  "def typesFixtureComposeReady : Bool := true\n" ++
  "def typesFixtureEmitPathOk : Bool := EmitTypes.emitTypesReady\n" ++
  "def typesFixtureCompilePathReady : Bool := gradeSurfaceOk && typesFixtureKindMultOk && typesFixtureProgramReady && typesFixtureComposeReady && typesFixtureComposeRawUnready && typesFixtureEmitPathOk && !typesFixtureResidualFreeClaimed && !typesFixtureProductSelfHostCompleteClaimed && !typesFixtureProofCompleteClaimed && !typesFixtureLlvmUnlocked\n" ++
  "def typesFixtureResidualFreeClaimed : Bool := false\n" ++
  "def typesFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathTypesTermText : String :=
  hostModuleCheckCompilePathTypesTermSkeletonPrefix
    ++ hostModuleCheckCompilePathTypesTermGoodMid
    ++ hostModuleCheckCompilePathTypesTermSkeletonSuffix

def hostModuleCheckBadCompilePathTypesResidualText : String :=
  hostModuleCheckCompilePathTypesTermSkeletonPrefix ++
  "def typesFixtureProgramReady : Bool := true\n" ++
  "def typesFixtureComposeReady : Bool := true\n" ++
  "def typesFixtureEmitPathOk : Bool := EmitTypes.emitTypesReady\n" ++
  "def typesFixtureCompilePathReady : Bool := gradeSurfaceOk && typesFixtureKindMultOk && typesFixtureProgramReady && typesFixtureComposeReady && typesFixtureComposeRawUnready && typesFixtureEmitPathOk && !typesFixtureResidualFreeClaimed && !typesFixtureProductSelfHostCompleteClaimed && !typesFixtureProofCompleteClaimed && !typesFixtureLlvmUnlocked\n" ++
  "def typesFixtureResidualFreeClaimed : Bool := true\n" ++
  "def typesFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathTypesTermSkeletonSuffix

def hostModuleCheckBadCompilePathTypesEmitText : String :=
  hostModuleCheckCompilePathTypesTermSkeletonPrefix ++
  "def typesFixtureProgramReady : Bool := true\n" ++
  "def typesFixtureComposeReady : Bool := true\n" ++
  "def typesFixtureEmitPathOk : Bool := true\n" ++
  "def typesFixtureCompilePathReady : Bool := gradeSurfaceOk && typesFixtureKindMultOk && typesFixtureProgramReady && typesFixtureComposeReady && typesFixtureComposeRawUnready && typesFixtureEmitPathOk && !typesFixtureResidualFreeClaimed && !typesFixtureProductSelfHostCompleteClaimed && !typesFixtureProofCompleteClaimed && !typesFixtureLlvmUnlocked\n" ++
  "def typesFixtureResidualFreeClaimed : Bool := false\n" ++
  "def typesFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathTypesTermSkeletonSuffix

def hostModuleCheckBadCompilePathTypesReadyText : String :=
  hostModuleCheckCompilePathTypesTermSkeletonPrefix ++
  "def typesFixtureProgramReady : Bool := true\n" ++
  "def typesFixtureComposeReady : Bool := true\n" ++
  "def typesFixtureEmitPathOk : Bool := EmitTypes.emitTypesReady\n" ++
  "def typesFixtureCompilePathReady : Bool := true\n" ++
  "def typesFixtureResidualFreeClaimed : Bool := false\n" ++
  "def typesFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathTypesTermSkeletonSuffix

def hostModuleCheckBadCompilePathTypesCompleteText : String :=
  hostModuleCheckCompilePathTypesTermSkeletonPrefix ++
  "def typesFixtureProgramReady : Bool := true\n" ++
  "def typesFixtureComposeReady : Bool := true\n" ++
  "def typesFixtureEmitPathOk : Bool := EmitTypes.emitTypesReady\n" ++
  "def typesFixtureCompilePathReady : Bool := gradeSurfaceOk && typesFixtureKindMultOk && typesFixtureProgramReady && typesFixtureComposeReady && typesFixtureComposeRawUnready && typesFixtureEmitPathOk && !typesFixtureResidualFreeClaimed && !typesFixtureProductSelfHostCompleteClaimed && !typesFixtureProofCompleteClaimed && !typesFixtureLlvmUnlocked\n" ++
  "def typesFixtureResidualFreeClaimed : Bool := false\n" ++
  "def typesFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathTypesTermSkeletonSuffix

def compilePathTypesTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathTypes"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathTypesResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathTypesTermSurfaceFrom
      hostModuleCheckBadCompilePathTypesResidualText)
    compilePathExpectedNamespace compilePathTypesRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathTypesResidualDialectReject : Bool :=
  match checkCompilePathTypesTermDialect hostModuleCheckBadCompilePathTypesResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathTypesEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathTypesTermSurfaceFrom
      hostModuleCheckBadCompilePathTypesEmitText)
    compilePathExpectedNamespace compilePathTypesRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathTypesEmitDialectReject : Bool :=
  match checkCompilePathTypesTermDialect hostModuleCheckBadCompilePathTypesEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathTypesReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathTypesTermSurfaceFrom
      hostModuleCheckBadCompilePathTypesReadyText)
    compilePathExpectedNamespace compilePathTypesRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathTypesReadyDialectReject : Bool :=
  match checkCompilePathTypesTermDialect hostModuleCheckBadCompilePathTypesReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathTypesCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathTypesTermSurfaceFrom
      hostModuleCheckBadCompilePathTypesCompleteText)
    compilePathExpectedNamespace compilePathTypesRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathTypesCompleteDialectReject : Bool :=
  match checkCompilePathTypesTermDialect hostModuleCheckBadCompilePathTypesCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathTypesTermDialectOk : Bool :=
  (checkCompilePathTypesTermDialect hostModuleCheckGoodCompilePathTypesTermText).isNone

def hostModuleCheckCompilePathTypesTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathTypesTermSurfaceDualOk
    && (checkDepthCompilePathTypesTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathTypesTermSurfaceScope == "CompilePathTypes-only")
    && hostModuleCheckCompilePathTypesTermDialectOk
    && hostModuleCheckBadCompilePathTypesResidualDialectReject
    && hostModuleCheckBadCompilePathTypesEmitDialectReject
    && hostModuleCheckBadCompilePathTypesReadyDialectReject
    && hostModuleCheckBadCompilePathTypesCompleteDialectReject
    && hostModuleCheckBadCompilePathTypesResidualL0Accept
    && hostModuleCheckBadCompilePathTypesEmitL0Accept
    && hostModuleCheckBadCompilePathTypesReadyL0Accept
    && hostModuleCheckBadCompilePathTypesCompleteL0Accept

theorem hostModuleCheckCompilePathTypesTermSurfaceOk_true :
    hostModuleCheckCompilePathTypesTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathTypes_term_surface_ids_eq :
    checkDepthCompilePathTypesTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathTypesTermSurfaceScope = "CompilePathTypes-only"
      && hostModuleCheckCompilePathTypesTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
