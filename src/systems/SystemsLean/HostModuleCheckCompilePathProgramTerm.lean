/-
  SYSTEMS_LEAN_HOST partial -- CompilePathProgram L2 term-surface (S8 CompilePath unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathProgram dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathProgram L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false (or extract twin gate).
  - compile-path / extract gate ready compose matches product.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathProgramTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathProgramTermSurfaceOk.

  Intentional non-claims:
  - CompilePathProgram pilot only -- not package elaborate, not FullHost re-true.
  - Mult..DualResidual TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathProgramTerm, TERM-SURFACE, CompilePathProgram-only,
  ILL-TYPED-TERM, checkCompilePathProgramTermDialect,
  hostModuleCheckCompilePathProgramTermDialectOk,
  hostModuleCheckCompilePathProgramTermSurfaceDualOk,
  hostModuleCheckCompilePathProgramTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathProgramTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathProgramTerm;
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

/-! ### CompilePathProgram L2 term-surface dual-ok pins (CompilePathProgram-only) -/

def checkDepthCompilePathProgramTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathProgramTermSurfaceScope : String := "CompilePathProgram-only"
def hostModuleCheckCompilePathProgramTermSurfaceDualOk : Bool := true

def compilePathProgramEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitProgram.emitProgramReady"

def compilePathProgramResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathProgramCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathProgramReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && programFixtureFoldOk && programFixtureProgramReady && programFixtureComposeReady && programFixtureComposeRawUnready && programFixtureEmitPathOk && !programFixtureResidualFreeClaimed && !programFixtureProductSelfHostCompleteClaimed && !programFixtureProofCompleteClaimed && !programFixtureLlvmUnlocked"

def checkCompilePathProgramTermDialect (content : String) : Option String :=
  if !compilePathProgramEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathProgramResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathProgramCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathProgramReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathProgramWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathProgramTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathProgramTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathProgramTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathProgramTermGoodMid : String :=
  "def programFixtureProgramReady : Bool := true\n" ++
  "def programFixtureComposeReady : Bool := true\n" ++
  "def programFixtureEmitPathOk : Bool := EmitProgram.emitProgramReady\n" ++
  "def programFixtureCompilePathReady : Bool := gradeSurfaceOk && programFixtureFoldOk && programFixtureProgramReady && programFixtureComposeReady && programFixtureComposeRawUnready && programFixtureEmitPathOk && !programFixtureResidualFreeClaimed && !programFixtureProductSelfHostCompleteClaimed && !programFixtureProofCompleteClaimed && !programFixtureLlvmUnlocked\n" ++
  "def programFixtureResidualFreeClaimed : Bool := false\n" ++
  "def programFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathProgramTermText : String :=
  hostModuleCheckCompilePathProgramTermSkeletonPrefix
    ++ hostModuleCheckCompilePathProgramTermGoodMid
    ++ hostModuleCheckCompilePathProgramTermSkeletonSuffix

def hostModuleCheckBadCompilePathProgramResidualText : String :=
  hostModuleCheckCompilePathProgramTermSkeletonPrefix ++
  "def programFixtureProgramReady : Bool := true\n" ++
  "def programFixtureComposeReady : Bool := true\n" ++
  "def programFixtureEmitPathOk : Bool := EmitProgram.emitProgramReady\n" ++
  "def programFixtureCompilePathReady : Bool := gradeSurfaceOk && programFixtureFoldOk && programFixtureProgramReady && programFixtureComposeReady && programFixtureComposeRawUnready && programFixtureEmitPathOk && !programFixtureResidualFreeClaimed && !programFixtureProductSelfHostCompleteClaimed && !programFixtureProofCompleteClaimed && !programFixtureLlvmUnlocked\n" ++
  "def programFixtureResidualFreeClaimed : Bool := true\n" ++
  "def programFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathProgramTermSkeletonSuffix

def hostModuleCheckBadCompilePathProgramEmitText : String :=
  hostModuleCheckCompilePathProgramTermSkeletonPrefix ++
  "def programFixtureProgramReady : Bool := true\n" ++
  "def programFixtureComposeReady : Bool := true\n" ++
  "def programFixtureEmitPathOk : Bool := true\n" ++
  "def programFixtureCompilePathReady : Bool := gradeSurfaceOk && programFixtureFoldOk && programFixtureProgramReady && programFixtureComposeReady && programFixtureComposeRawUnready && programFixtureEmitPathOk && !programFixtureResidualFreeClaimed && !programFixtureProductSelfHostCompleteClaimed && !programFixtureProofCompleteClaimed && !programFixtureLlvmUnlocked\n" ++
  "def programFixtureResidualFreeClaimed : Bool := false\n" ++
  "def programFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathProgramTermSkeletonSuffix

def hostModuleCheckBadCompilePathProgramReadyText : String :=
  hostModuleCheckCompilePathProgramTermSkeletonPrefix ++
  "def programFixtureProgramReady : Bool := true\n" ++
  "def programFixtureComposeReady : Bool := true\n" ++
  "def programFixtureEmitPathOk : Bool := EmitProgram.emitProgramReady\n" ++
  "def programFixtureCompilePathReady : Bool := true\n" ++
  "def programFixtureResidualFreeClaimed : Bool := false\n" ++
  "def programFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathProgramTermSkeletonSuffix

def hostModuleCheckBadCompilePathProgramCompleteText : String :=
  hostModuleCheckCompilePathProgramTermSkeletonPrefix ++
  "def programFixtureProgramReady : Bool := true\n" ++
  "def programFixtureComposeReady : Bool := true\n" ++
  "def programFixtureEmitPathOk : Bool := EmitProgram.emitProgramReady\n" ++
  "def programFixtureCompilePathReady : Bool := gradeSurfaceOk && programFixtureFoldOk && programFixtureProgramReady && programFixtureComposeReady && programFixtureComposeRawUnready && programFixtureEmitPathOk && !programFixtureResidualFreeClaimed && !programFixtureProductSelfHostCompleteClaimed && !programFixtureProofCompleteClaimed && !programFixtureLlvmUnlocked\n" ++
  "def programFixtureResidualFreeClaimed : Bool := false\n" ++
  "def programFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathProgramTermSkeletonSuffix

def compilePathProgramTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathProgram"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathProgramResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathProgramTermSurfaceFrom
      hostModuleCheckBadCompilePathProgramResidualText)
    compilePathExpectedNamespace compilePathProgramRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathProgramResidualDialectReject : Bool :=
  match checkCompilePathProgramTermDialect hostModuleCheckBadCompilePathProgramResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathProgramEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathProgramTermSurfaceFrom
      hostModuleCheckBadCompilePathProgramEmitText)
    compilePathExpectedNamespace compilePathProgramRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathProgramEmitDialectReject : Bool :=
  match checkCompilePathProgramTermDialect hostModuleCheckBadCompilePathProgramEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathProgramReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathProgramTermSurfaceFrom
      hostModuleCheckBadCompilePathProgramReadyText)
    compilePathExpectedNamespace compilePathProgramRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathProgramReadyDialectReject : Bool :=
  match checkCompilePathProgramTermDialect hostModuleCheckBadCompilePathProgramReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathProgramCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathProgramTermSurfaceFrom
      hostModuleCheckBadCompilePathProgramCompleteText)
    compilePathExpectedNamespace compilePathProgramRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathProgramCompleteDialectReject : Bool :=
  match checkCompilePathProgramTermDialect hostModuleCheckBadCompilePathProgramCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathProgramTermDialectOk : Bool :=
  (checkCompilePathProgramTermDialect hostModuleCheckGoodCompilePathProgramTermText).isNone

def hostModuleCheckCompilePathProgramTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathProgramTermSurfaceDualOk
    && (checkDepthCompilePathProgramTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathProgramTermSurfaceScope == "CompilePathProgram-only")
    && hostModuleCheckCompilePathProgramTermDialectOk
    && hostModuleCheckBadCompilePathProgramResidualDialectReject
    && hostModuleCheckBadCompilePathProgramEmitDialectReject
    && hostModuleCheckBadCompilePathProgramReadyDialectReject
    && hostModuleCheckBadCompilePathProgramCompleteDialectReject
    && hostModuleCheckBadCompilePathProgramResidualL0Accept
    && hostModuleCheckBadCompilePathProgramEmitL0Accept
    && hostModuleCheckBadCompilePathProgramReadyL0Accept
    && hostModuleCheckBadCompilePathProgramCompleteL0Accept

theorem hostModuleCheckCompilePathProgramTermSurfaceOk_true :
    hostModuleCheckCompilePathProgramTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathProgram_term_surface_ids_eq :
    checkDepthCompilePathProgramTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathProgramTermSurfaceScope = "CompilePathProgram-only"
      && hostModuleCheckCompilePathProgramTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
