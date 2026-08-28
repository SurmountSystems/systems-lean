/-
  SYSTEMS_LEAN_HOST partial -- CompilePathBody L2 term-surface (Plan/Apply/Body TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: CompilePathBody dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  CompilePathBody L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit/path gate body matches product fixture.
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - compile-path ready compose matches product (includes bodyFixtureBodyOk).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckCompilePathBodyTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckCompilePathBodyTermSurfaceOk.

  Intentional non-claims:
  - CompilePathBody pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckCompilePathBodyTerm, TERM-SURFACE, CompilePathBody-only,
  ILL-TYPED-TERM, checkCompilePathBodyTermDialect,
  hostModuleCheckCompilePathBodyTermDialectOk,
  hostModuleCheckCompilePathBodyTermSurfaceDualOk,
  hostModuleCheckCompilePathBodyTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCompilePathBodyTerm
  Red/green: lake build SystemsLean.HostModuleCheckCompilePathBodyTerm;
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

/-! ### CompilePathBody L2 term-surface dual-ok pins (CompilePathBody-only) -/

def checkDepthCompilePathBodyTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthCompilePathBodyTermSurfaceScope : String := "CompilePathBody-only"
def hostModuleCheckCompilePathBodyTermSurfaceDualOk : Bool := true

def compilePathBodyEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyFixtureEmitPathOk" with
  | none => false
  | some body => body == "EmitBody.emitBodyReady"

def compilePathBodyResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyFixtureResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def compilePathBodyCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyFixtureProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def compilePathBodyReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "bodyFixtureCompilePathReady" with
  | none => false
  | some body => body == "gradeSurfaceOk && bodyFixtureProgramReady && bodyFixtureComposeReady && bodyFixtureComposeRawUnready && bodyFixtureBodyOk && bodyFixtureEmitPathOk && !bodyFixtureResidualFreeClaimed && !bodyFixtureProductSelfHostCompleteClaimed && !bodyFixtureProofCompleteClaimed && !bodyFixtureLlvmUnlocked"

def checkCompilePathBodyTermDialect (content : String) : Option String :=
  if !compilePathBodyEmitBodyOk content then some reasonIllTypedTerm
  else if !compilePathBodyResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !compilePathBodyCompleteBodyOk content then some reasonIllTypedTerm
  else if !compilePathBodyReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineCompilePathBodyWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkCompilePathBodyTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckCompilePathBodyTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePath\n" ++
  "namespace SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathBodyTermSkeletonSuffix : String :=
  "end SystemsLean.CompilePath\n"

def hostModuleCheckCompilePathBodyTermGoodMid : String :=
  "def bodyFixtureProgramReady : Bool := true\n" ++
  "def bodyFixtureComposeReady : Bool := true\n" ++
  "def bodyFixtureEmitPathOk : Bool := EmitBody.emitBodyReady\n" ++
  "def bodyFixtureCompilePathReady : Bool := gradeSurfaceOk && bodyFixtureProgramReady && bodyFixtureComposeReady && bodyFixtureComposeRawUnready && bodyFixtureBodyOk && bodyFixtureEmitPathOk && !bodyFixtureResidualFreeClaimed && !bodyFixtureProductSelfHostCompleteClaimed && !bodyFixtureProofCompleteClaimed && !bodyFixtureLlvmUnlocked\n" ++
  "def bodyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def bodyFixtureProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodCompilePathBodyTermText : String :=
  hostModuleCheckCompilePathBodyTermSkeletonPrefix
    ++ hostModuleCheckCompilePathBodyTermGoodMid
    ++ hostModuleCheckCompilePathBodyTermSkeletonSuffix

def hostModuleCheckBadCompilePathBodyResidualText : String :=
  hostModuleCheckCompilePathBodyTermSkeletonPrefix ++
  "def bodyFixtureProgramReady : Bool := true\n" ++
  "def bodyFixtureComposeReady : Bool := true\n" ++
  "def bodyFixtureEmitPathOk : Bool := EmitBody.emitBodyReady\n" ++
  "def bodyFixtureCompilePathReady : Bool := gradeSurfaceOk && bodyFixtureProgramReady && bodyFixtureComposeReady && bodyFixtureComposeRawUnready && bodyFixtureBodyOk && bodyFixtureEmitPathOk && !bodyFixtureResidualFreeClaimed && !bodyFixtureProductSelfHostCompleteClaimed && !bodyFixtureProofCompleteClaimed && !bodyFixtureLlvmUnlocked\n" ++
  "def bodyFixtureResidualFreeClaimed : Bool := true\n" ++
  "def bodyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathBodyTermSkeletonSuffix

def hostModuleCheckBadCompilePathBodyEmitText : String :=
  hostModuleCheckCompilePathBodyTermSkeletonPrefix ++
  "def bodyFixtureProgramReady : Bool := true\n" ++
  "def bodyFixtureComposeReady : Bool := true\n" ++
  "def bodyFixtureEmitPathOk : Bool := true\n" ++
  "def bodyFixtureCompilePathReady : Bool := gradeSurfaceOk && bodyFixtureProgramReady && bodyFixtureComposeReady && bodyFixtureComposeRawUnready && bodyFixtureBodyOk && bodyFixtureEmitPathOk && !bodyFixtureResidualFreeClaimed && !bodyFixtureProductSelfHostCompleteClaimed && !bodyFixtureProofCompleteClaimed && !bodyFixtureLlvmUnlocked\n" ++
  "def bodyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def bodyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathBodyTermSkeletonSuffix

def hostModuleCheckBadCompilePathBodyReadyText : String :=
  hostModuleCheckCompilePathBodyTermSkeletonPrefix ++
  "def bodyFixtureProgramReady : Bool := true\n" ++
  "def bodyFixtureComposeReady : Bool := true\n" ++
  "def bodyFixtureEmitPathOk : Bool := EmitBody.emitBodyReady\n" ++
  "def bodyFixtureCompilePathReady : Bool := true\n" ++
  "def bodyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def bodyFixtureProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckCompilePathBodyTermSkeletonSuffix

def hostModuleCheckBadCompilePathBodyCompleteText : String :=
  hostModuleCheckCompilePathBodyTermSkeletonPrefix ++
  "def bodyFixtureProgramReady : Bool := true\n" ++
  "def bodyFixtureComposeReady : Bool := true\n" ++
  "def bodyFixtureEmitPathOk : Bool := EmitBody.emitBodyReady\n" ++
  "def bodyFixtureCompilePathReady : Bool := gradeSurfaceOk && bodyFixtureProgramReady && bodyFixtureComposeReady && bodyFixtureComposeRawUnready && bodyFixtureBodyOk && bodyFixtureEmitPathOk && !bodyFixtureResidualFreeClaimed && !bodyFixtureProductSelfHostCompleteClaimed && !bodyFixtureProofCompleteClaimed && !bodyFixtureLlvmUnlocked\n" ++
  "def bodyFixtureResidualFreeClaimed : Bool := false\n" ++
  "def bodyFixtureProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckCompilePathBodyTermSkeletonSuffix

def compilePathBodyTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.CompilePathBody"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadCompilePathBodyResidualL0Accept : Bool :=
  (checkNamedSurface (compilePathBodyTermSurfaceFrom
      hostModuleCheckBadCompilePathBodyResidualText)
    compilePathExpectedNamespace compilePathBodyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathBodyResidualDialectReject : Bool :=
  match checkCompilePathBodyTermDialect hostModuleCheckBadCompilePathBodyResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathBodyEmitL0Accept : Bool :=
  (checkNamedSurface (compilePathBodyTermSurfaceFrom
      hostModuleCheckBadCompilePathBodyEmitText)
    compilePathExpectedNamespace compilePathBodyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathBodyEmitDialectReject : Bool :=
  match checkCompilePathBodyTermDialect hostModuleCheckBadCompilePathBodyEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathBodyReadyL0Accept : Bool :=
  (checkNamedSurface (compilePathBodyTermSurfaceFrom
      hostModuleCheckBadCompilePathBodyReadyText)
    compilePathExpectedNamespace compilePathBodyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathBodyReadyDialectReject : Bool :=
  match checkCompilePathBodyTermDialect hostModuleCheckBadCompilePathBodyReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadCompilePathBodyCompleteL0Accept : Bool :=
  (checkNamedSurface (compilePathBodyTermSurfaceFrom
      hostModuleCheckBadCompilePathBodyCompleteText)
    compilePathExpectedNamespace compilePathBodyRequiredDecls none).isAccept

def hostModuleCheckBadCompilePathBodyCompleteDialectReject : Bool :=
  match checkCompilePathBodyTermDialect hostModuleCheckBadCompilePathBodyCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckCompilePathBodyTermDialectOk : Bool :=
  (checkCompilePathBodyTermDialect hostModuleCheckGoodCompilePathBodyTermText).isNone

def hostModuleCheckCompilePathBodyTermSurfaceOk : Bool :=
  hostModuleCheckCompilePathBodyTermSurfaceDualOk
    && (checkDepthCompilePathBodyTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthCompilePathBodyTermSurfaceScope == "CompilePathBody-only")
    && hostModuleCheckCompilePathBodyTermDialectOk
    && hostModuleCheckBadCompilePathBodyResidualDialectReject
    && hostModuleCheckBadCompilePathBodyEmitDialectReject
    && hostModuleCheckBadCompilePathBodyReadyDialectReject
    && hostModuleCheckBadCompilePathBodyCompleteDialectReject
    && hostModuleCheckBadCompilePathBodyResidualL0Accept
    && hostModuleCheckBadCompilePathBodyEmitL0Accept
    && hostModuleCheckBadCompilePathBodyReadyL0Accept
    && hostModuleCheckBadCompilePathBodyCompleteL0Accept

theorem hostModuleCheckCompilePathBodyTermSurfaceOk_true :
    hostModuleCheckCompilePathBodyTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_compilePathBody_term_surface_ids_eq :
    checkDepthCompilePathBodyTermSurfaceBar = "TERM-SURFACE"
      && checkDepthCompilePathBodyTermSurfaceScope = "CompilePathBody-only"
      && hostModuleCheckCompilePathBodyTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
