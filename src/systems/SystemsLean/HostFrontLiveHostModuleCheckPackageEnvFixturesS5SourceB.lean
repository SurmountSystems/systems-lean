/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckPackageEnvFixturesS5.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesS5SourceB.
  Not occupancy name 50. Host tools stay 69 of 69. Not FullHost.
  Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  liveHostModuleCheckPackageEnvFixturesS5Source, liveRel,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5SourceB
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5

/-- Dual-pinned slice of HostModuleCheckPackageEnvFixturesS5.lean. -/
def liveHostModuleCheckPackageEnvFixturesS5SourceB : String := r#"  packageEnvModuleSection "SystemsLean.CompilePathCompose"
    hostModuleCheckBadCompilePathComposeResidualText ++
  packageEnvCompilePathErasureThroughExtractModulesGood

/-- E-bad PE51: CompilePathErasure residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughComposeModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathErasure"
    hostModuleCheckBadCompilePathErasureResidualText ++
  packageEnvCompilePathExtractTermModuleGood

/-- E-bad PE52: CompilePathExtract residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultThroughErasureModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathExtract"
    hostModuleCheckBadCompilePathExtractResidualText

/-! ### S9 package-env CompilePath Plan / Apply / Body TERM (PE53..PE55) -/

/-- CompilePathPlan module good (TERM soft J5; import CompilePath).
    Greppable: packageEnvCompilePathPlanTermModuleGood. -/
def packageEnvCompilePathPlanTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathPlan"
    hostModuleCheckGoodCompilePathPlanTermText

/-- CompilePathApply module good.
    Greppable: packageEnvCompilePathApplyTermModuleGood. -/
def packageEnvCompilePathApplyTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathApply"
    hostModuleCheckGoodCompilePathApplyTermText

/-- CompilePathBody module good.
    Greppable: packageEnvCompilePathBodyTermModuleGood. -/
def packageEnvCompilePathBodyTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.CompilePathBody"
    hostModuleCheckGoodCompilePathBodyTermText

/-- Apply through Body after Plan.
    Greppable: packageEnvCompilePathApplyThroughBodyModulesGood. -/
def packageEnvCompilePathApplyThroughBodyModulesGood : String :=
  packageEnvCompilePathApplyTermModuleGood ++
  packageEnvCompilePathBodyTermModuleGood

/-- Plan through Apply heads (Body last).
    Greppable: packageEnvCompilePathPlanThroughApplyModulesGood. -/
def packageEnvCompilePathPlanThroughApplyModulesGood : String :=
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyTermModuleGood

/-- Canonical E-good Mult..S8 + S9 CompilePath Plan / Apply / Body TERM.
    Greppable: hostModuleCheckGoodPackageEnvS9Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS9Text : String :=
  hostModuleCheckGoodPackageEnvS8Text ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- Prefix through S8 for S9 E-bad twins.
    Greppable: packageEnvMultThroughS8ForS9. -/
def packageEnvMultThroughS8ForS9 : String :=
  packageEnvMultThroughS6ForS8 ++
  packageEnvCompilePathMultTermModuleGood ++
  packageEnvCompilePathLinearThroughExtractModulesGood

/-- E-bad PE53: CompilePathPlan residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvModuleSection "SystemsLean.CompilePathPlan"
    hostModuleCheckBadCompilePathPlanResidualText ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- E-bad PE54: CompilePathApply residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvModuleSection "SystemsLean.CompilePathApply"
    hostModuleCheckBadCompilePathApplyResidualText ++
  packageEnvCompilePathBodyTermModuleGood

/-- E-bad PE55: CompilePathBody residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanThroughApplyModulesGood ++
  packageEnvModuleSection "SystemsLean.CompilePathBody"
    hostModuleCheckBadCompilePathBodyResidualText

/-! ### S10 package-env FirstSurface TERM (PE56) -/

/-- FirstSurface env body: TERM goods + multi-line firstSurfaceReady (real module
    shape). Collapse must accept this, not only a same-line after `:=` body.
    Greppable: packageEnvFirstSurfaceTermBodyGood. -/
def packageEnvFirstSurfaceTermBodyGood : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  hostModuleCheckGoodFirstSurfaceReadyMultilineText ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

/-- FirstSurface module good (TERM soft J5; import CompilePathMult).
    Greppable: packageEnvFirstSurfaceTermModuleGood. -/
def packageEnvFirstSurfaceTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.FirstSurface"
    packageEnvFirstSurfaceTermBodyGood

/-- Canonical E-good Mult..S9 + S10 FirstSurface TERM.
    Greppable: hostModuleCheckGoodPackageEnvS10Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS10Text : String :=
  hostModuleCheckGoodPackageEnvS9Text ++
  packageEnvFirstSurfaceTermModuleGood

/-- Prefix through S9 for S10 E-bad twins.
    Greppable: packageEnvMultThroughS9ForS10. -/
def packageEnvMultThroughS9ForS10 : String :=
  packageEnvMultThroughS8ForS9 ++
  packageEnvCompilePathPlanTermModuleGood ++
  packageEnvCompilePathApplyThroughBodyModulesGood

/-- E-bad PE56: FirstSurface residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText : String :=
  packageEnvMultThroughS9ForS10 ++
  packageEnvModuleSection "SystemsLean.FirstSurface"
    hostModuleCheckBadFirstSurfaceResidualText

/-! ### S11 package-env LinearSubsetEmit TERM (PE57) -/

/-- LinearSubsetEmit env body: TERM goods + multi-line linearSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathLinear (already in env).
    Greppable: packageEnvLinearSubsetEmitTermBodyGood. -/
def packageEnvLinearSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  hostModuleCheckGoodLinearSubsetEmitReadyMultilineText ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

/-- LinearSubsetEmit module good (TERM soft J5; import CompilePathLinear).
    Greppable: packageEnvLinearSubsetEmitTermModuleGood. -/
def packageEnvLinearSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LinearSubsetEmit"
    packageEnvLinearSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S10 + S11 LinearSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS11Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS11Text : String :=
  hostModuleCheckGoodPackageEnvS10Text ++
  packageEnvLinearSubsetEmitTermModuleGood

/-- Prefix through S10 for S11 E-bad twins.
    Greppable: packageEnvMultThroughS10ForS11. -/
def packageEnvMultThroughS10ForS11 : String :=
  packageEnvMultThroughS9ForS10 ++
  packageEnvFirstSurfaceTermModuleGood

/-- LinearSubsetEmit env body with residual-free claimed true (PE57).
    CompilePathLinear only (already in env; no EmitLinear import farm).
    Greppable: packageEnvLinearSubsetEmitTermBodyBadResidual. -/
def packageEnvLinearSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

/-- E-bad PE57: LinearSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText : String :=
  packageEnvMultThroughS10ForS11 ++
  packageEnvModuleSection "SystemsLean.LinearSubsetEmit"
    packageEnvLinearSubsetEmitTermBodyBadResidual

/-! ### S12 package-env TypesSubsetEmit TERM (PE58) -/

/-- TypesSubsetEmit env body: TERM goods + multi-line typesSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathTypes (already in env).
    Greppable: packageEnvTypesSubsetEmitTermBodyGood. -/
def packageEnvTypesSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  hostModuleCheckGoodTypesSubsetEmitReadyMultilineText ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

/-- TypesSubsetEmit module good (TERM soft J5; import CompilePathTypes).
    Greppable: packageEnvTypesSubsetEmitTermModuleGood. -/
def packageEnvTypesSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.TypesSubsetEmit"
    packageEnvTypesSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S11 + S12 TypesSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS12Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS12Text : String :=
  hostModuleCheckGoodPackageEnvS11Text ++
  packageEnvTypesSubsetEmitTermModuleGood

/-- Prefix through S11 for S12 E-bad twins.
    Greppable: packageEnvMultThroughS11ForS12. -/
def packageEnvMultThroughS11ForS12 : String :=
  packageEnvMultThroughS10ForS11 ++
  packageEnvLinearSubsetEmitTermModuleGood

/-- TypesSubsetEmit env body with residual-free claimed true (PE58).
    CompilePathTypes only (already in env; no EmitTypes import farm).
    Greppable: packageEnvTypesSubsetEmitTermBodyBadResidual. -/
def packageEnvTypesSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

/-- E-bad PE58: TypesSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText : String :=
  packageEnvMultThroughS11ForS12 ++
  packageEnvModuleSection "SystemsLean.TypesSubsetEmit"
    packageEnvTypesSubsetEmitTermBodyBadResidual

/-! ### S13 package-env ProgramSubsetEmit TERM (PE59) -/

/-- ProgramSubsetEmit env body: TERM goods + multi-line programSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathProgram (already in env).
    Greppable: packageEnvProgramSubsetEmitTermBodyGood. -/
def packageEnvProgramSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  hostModuleCheckGoodProgramSubsetEmitReadyMultilineText ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

/-- ProgramSubsetEmit module good (TERM soft J5; import CompilePathProgram).
    Greppable: packageEnvProgramSubsetEmitTermModuleGood. -/
def packageEnvProgramSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ProgramSubsetEmit"
    packageEnvProgramSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S12 + S13 ProgramSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS13Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS13Text : String :=
  hostModuleCheckGoodPackageEnvS12Text ++
  packageEnvProgramSubsetEmitTermModuleGood

/-- Prefix through S12 for S13 E-bad twins.
    Greppable: packageEnvMultThroughS12ForS13. -/
def packageEnvMultThroughS12ForS13 : String :=
  packageEnvMultThroughS11ForS12 ++
  packageEnvTypesSubsetEmitTermModuleGood

/-- ProgramSubsetEmit env body with residual-free claimed true (PE59).
    CompilePathProgram only (already in env; no EmitProgram import farm).
    Greppable: packageEnvProgramSubsetEmitTermBodyBadResidual. -/
def packageEnvProgramSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

/-- E-bad PE59: ProgramSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText : String :=
  packageEnvMultThroughS12ForS13 ++
  packageEnvModuleSection "SystemsLean.ProgramSubsetEmit"
    packageEnvProgramSubsetEmitTermBodyBadResidual

/-! ### S14 package-env GraphSubsetEmit TERM (PE60) -/

/-- GraphSubsetEmit env body: TERM goods + multi-line graphSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathGraph (already in env).
    Greppable: packageEnvGraphSubsetEmitTermBodyGood. -/
def packageEnvGraphSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  hostModuleCheckGoodGraphSubsetEmitReadyMultilineText ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

/-- GraphSubsetEmit module good (TERM soft J5; import CompilePathGraph).
    Greppable: packageEnvGraphSubsetEmitTermModuleGood. -/
def packageEnvGraphSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.GraphSubsetEmit"
    packageEnvGraphSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S13 + S14 GraphSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS14Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS14Text : String :=
  hostModuleCheckGoodPackageEnvS13Text ++
  packageEnvGraphSubsetEmitTermModuleGood

/-- Prefix through S13 for S14 E-bad twins.
    Greppable: packageEnvMultThroughS13ForS14. -/
def packageEnvMultThroughS13ForS14 : String :=
  packageEnvMultThroughS12ForS13 ++
  packageEnvProgramSubsetEmitTermModuleGood

/-- GraphSubsetEmit env body with residual-free claimed true (PE60).
    CompilePathGraph only (already in env; no EmitGraph import farm).
    Greppable: packageEnvGraphSubsetEmitTermBodyBadResidual. -/
def packageEnvGraphSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"graph-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetEmitGraphDialectOk : Bool := emitGraphReady\n" ++
  "def graphSubsetEmitReady : Bool := " ++ graphSubsetEmitReadyTermBody ++ "\n" ++
  "def graphSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetEmitTermSkeletonSuffix

/-- E-bad PE60: GraphSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText : String :=
  packageEnvMultThroughS13ForS14 ++
  packageEnvModuleSection "SystemsLean.GraphSubsetEmit"
    packageEnvGraphSubsetEmitTermBodyBadResidual

/-! ### S15 package-env ComposeSubsetEmit TERM (PE61) -/

/-- ComposeSubsetEmit env body: TERM goods + multi-line composeSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathCompose (already in env).
    Greppable: packageEnvComposeSubsetEmitTermBodyGood. -/
def packageEnvComposeSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  hostModuleCheckGoodComposeSubsetEmitReadyMultilineText ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

/-- ComposeSubsetEmit module good (TERM soft J5; import CompilePathCompose).
    Greppable: packageEnvComposeSubsetEmitTermModuleGood. -/
def packageEnvComposeSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ComposeSubsetEmit"
    packageEnvComposeSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S14 + S15 ComposeSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS15Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS15Text : String :=
  hostModuleCheckGoodPackageEnvS14Text ++
  packageEnvComposeSubsetEmitTermModuleGood

/-- Prefix through S14 for S15 E-bad twins.
    Greppable: packageEnvMultThroughS14ForS15. -/
def packageEnvMultThroughS14ForS15 : String :=
  packageEnvMultThroughS13ForS14 ++
  packageEnvGraphSubsetEmitTermModuleGood

/-- ComposeSubsetEmit env body with residual-free claimed true (PE61).
    CompilePathCompose only (already in env; no EmitCompose import farm).
    Greppable: packageEnvComposeSubsetEmitTermBodyBadResidual. -/
def packageEnvComposeSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

/-- E-bad PE61: ComposeSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText : String :=
  packageEnvMultThroughS14ForS15 ++
  packageEnvModuleSection "SystemsLean.ComposeSubsetEmit"
    packageEnvComposeSubsetEmitTermBodyBadResidual

/-! ### S16 package-env ErasureSubsetEmit TERM (PE62) -/

/-- ErasureSubsetEmit env body: TERM goods + multi-line erasureSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathErasure (already in env).
    Greppable: packageEnvErasureSubsetEmitTermBodyGood. -/
def packageEnvErasureSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  hostModuleCheckGoodErasureSubsetEmitReadyMultilineText ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

/-- ErasureSubsetEmit module good (TERM soft J5; import CompilePathErasure).
    Greppable: packageEnvErasureSubsetEmitTermModuleGood. -/
def packageEnvErasureSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ErasureSubsetEmit"
    packageEnvErasureSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S15 + S16 ErasureSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS16Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS16Text : String :=
  hostModuleCheckGoodPackageEnvS15Text ++
  packageEnvErasureSubsetEmitTermModuleGood

/-- Prefix through S15 for S16 E-bad twins.
    Greppable: packageEnvMultThroughS15ForS16. -/
def packageEnvMultThroughS15ForS16 : String :=
  packageEnvMultThroughS14ForS15 ++
  packageEnvComposeSubsetEmitTermModuleGood

/-- ErasureSubsetEmit env body with residual-free claimed true (PE62).
    CompilePathErasure only (already in env; no EmitErasure import farm).
    Greppable: packageEnvErasureSubsetEmitTermBodyBadResidual. -/
def packageEnvErasureSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

/-- E-bad PE62: ErasureSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText : String :=
  packageEnvMultThroughS15ForS16 ++
  packageEnvModuleSection "SystemsLean.ErasureSubsetEmit"
    packageEnvErasureSubsetEmitTermBodyBadResidual

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5

