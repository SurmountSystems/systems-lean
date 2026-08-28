/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 later S-level env fixtures.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: S17 PE63 ExtractSubsetEmit plus S18 PE64 MultSubsetEmit
  plus S19 PE65 MultSubsetRebuild plus S20 PE66 LinearSubsetRebuild plus S21
  PE67 TypesSubsetRebuild plus S22 PE68 ProgramSubsetRebuild plus S23 PE69
  GraphSubsetRebuild plus S24 PE70 ComposeSubsetRebuild plus S25 PE71
  ErasureSubsetRebuild plus S26 PE72 ExtractSubsetRebuild plus S27 PE73
  HostFront plus S28 PE74 LLVM Mult text plus S29 PE75 Host fragment check
  unit TERM fixtures after FixturesS5 (S5..S16). Shared Mult..S16
  builders stay in HostModuleCheckPackageEnvFixturesS5. Same namespace
  SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - Not a new harness TERM companion. Harness stays 122. TERM stays 68.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvFixturesLater, PACKAGE-ELABORATE,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
  hostModuleCheckGoodPackageEnvS17Text,
  hostModuleCheckGoodPackageEnvS18Text,
  hostModuleCheckGoodPackageEnvS19Text,
  hostModuleCheckGoodPackageEnvS20Text,
  hostModuleCheckGoodPackageEnvS21Text,
  hostModuleCheckGoodPackageEnvS22Text,
  hostModuleCheckGoodPackageEnvS23Text,
  hostModuleCheckGoodPackageEnvS24Text,
  hostModuleCheckGoodPackageEnvS25Text,
  hostModuleCheckGoodPackageEnvS26Text,
  hostModuleCheckGoodPackageEnvS27Text,
  hostModuleCheckGoodPackageEnvS28Text,
  hostModuleCheckGoodPackageEnvS29Text,
  hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitText,
  hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText,
  hostModuleCheckBadPackageEnvIllTypedHostFrontText,
  hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText,
  hostModuleCheckBadPackageEnvIllTypedHostCheckText,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvFixturesLater
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvFixturesLater;
  lake build SystemsLean.HostModuleCheckPackageEnv;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnvFixturesS5
import SystemsLean.HostModuleCheckExtractSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetRebuildTerm
import SystemsLean.HostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.HostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.HostModuleCheckProgramSubsetRebuildTerm
import SystemsLean.HostModuleCheckGraphSubsetRebuildTerm
import SystemsLean.HostModuleCheckComposeSubsetRebuildTerm
import SystemsLean.HostModuleCheckErasureSubsetRebuildTerm
import SystemsLean.HostModuleCheckExtractSubsetRebuildTerm
import SystemsLean.HostModuleCheckHostFrontTerm
import SystemsLean.HostModuleCheckLlvmMultTextTerm
import SystemsLean.HostModuleCheckHostCheckTerm

namespace SystemsLean.HostModuleCheck

/-! ### S17 package-env ExtractSubsetEmit TERM (PE63) -/

/-- ExtractSubsetEmit env body: TERM goods + multi-line extractSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathExtract (already in env).
    Greppable: packageEnvExtractSubsetEmitTermBodyGood. -/
def packageEnvExtractSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathExtract\n" ++
  "namespace SystemsLean.ExtractSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  hostModuleCheckGoodExtractSubsetEmitReadyMultilineText ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

/-- ExtractSubsetEmit module good (TERM soft J5; import CompilePathExtract).
    Greppable: packageEnvExtractSubsetEmitTermModuleGood. -/
def packageEnvExtractSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ExtractSubsetEmit"
    packageEnvExtractSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S16 + S17 ExtractSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS17Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS17Text : String :=
  hostModuleCheckGoodPackageEnvS16Text ++
  packageEnvExtractSubsetEmitTermModuleGood

/-- Prefix through S16 for S17 E-bad twins.
    Greppable: packageEnvMultThroughS16ForS17. -/
def packageEnvMultThroughS16ForS17 : String :=
  hostModuleCheckGoodPackageEnvS16Text

/-- ExtractSubsetEmit env body with residual-free claimed true (PE63).
    CompilePathExtract only (already in env; no EmitExtract import farm).
    Greppable: packageEnvExtractSubsetEmitTermBodyBadResidual. -/
def packageEnvExtractSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathExtract\n" ++
  "namespace SystemsLean.ExtractSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  "def extractSubsetEmitReady : Bool := " ++ extractSubsetEmitReadyTermBody ++ "\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

/-- E-bad PE63: ExtractSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText : String :=
  packageEnvMultThroughS16ForS17 ++
  packageEnvModuleSection "SystemsLean.ExtractSubsetEmit"
    packageEnvExtractSubsetEmitTermBodyBadResidual

/-! ### S18 package-env MultSubsetEmit TERM (PE64) -/

/-- MultSubsetEmit env body: TERM goods + multi-line multSubsetEmitReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathMult (already in env; no EmitMult
    farm). Greppable: packageEnvMultSubsetEmitTermBodyGood. -/
def packageEnvMultSubsetEmitTermBodyGood : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.MultSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  hostModuleCheckGoodMultSubsetEmitReadyMultilineText ++
  "def multSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

/-- MultSubsetEmit module good (TERM soft J5; import CompilePathMult).
    Greppable: packageEnvMultSubsetEmitTermModuleGood. -/
def packageEnvMultSubsetEmitTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.MultSubsetEmit"
    packageEnvMultSubsetEmitTermBodyGood

/-- Canonical E-good Mult..S17 + S18 MultSubsetEmit TERM.
    Greppable: hostModuleCheckGoodPackageEnvS18Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS18Text : String :=
  hostModuleCheckGoodPackageEnvS17Text ++
  packageEnvMultSubsetEmitTermModuleGood

/-- Prefix through S17 for S18 E-bad twins.
    Greppable: packageEnvMultThroughS17ForS18. -/
def packageEnvMultThroughS17ForS18 : String :=
  hostModuleCheckGoodPackageEnvS17Text

/-- MultSubsetEmit env body with residual-free claimed true (PE64).
    CompilePathMult only (already in env; no EmitMult import farm).
    Greppable: packageEnvMultSubsetEmitTermBodyBadResidual. -/
def packageEnvMultSubsetEmitTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.MultSubsetEmit\n" ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  "def multSubsetEmitReady : Bool := " ++ multSubsetEmitReadyTermBody ++ "\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

/-- E-bad PE64: MultSubsetEmit residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitText : String :=
  packageEnvMultThroughS17ForS18 ++
  packageEnvModuleSection "SystemsLean.MultSubsetEmit"
    packageEnvMultSubsetEmitTermBodyBadResidual

/-! ### S19 package-env MultSubsetRebuild TERM (PE65) -/

/-- MultSubsetRebuild env body: TERM goods + multi-line multSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathMult (already in env; no emit-module
    farm). Rebuild / self-apply, not emitMultReady. Greppable:
    packageEnvMultSubsetRebuildTermBodyGood. -/
def packageEnvMultSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.MultSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++
    multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++
    multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodMultSubsetRebuildReadyMultilineText ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

/-- MultSubsetRebuild module good (TERM soft J5; import CompilePathMult).
    Greppable: packageEnvMultSubsetRebuildTermModuleGood. -/
def packageEnvMultSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.MultSubsetRebuild"
    packageEnvMultSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S18 + S19 MultSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS19Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS19Text : String :=
  hostModuleCheckGoodPackageEnvS18Text ++
  packageEnvMultSubsetRebuildTermModuleGood

/-- Prefix through S18 for S19 E-bad twins.
    Greppable: packageEnvMultThroughS18ForS19. -/
def packageEnvMultThroughS18ForS19 : String :=
  hostModuleCheckGoodPackageEnvS18Text

/-- MultSubsetRebuild env body with residual-free claimed true (PE65).
    CompilePathMult only (already in env; no emit-module farm).
    Greppable: packageEnvMultSubsetRebuildTermBodyBadResidual. -/
def packageEnvMultSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.MultSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++
    multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++
    multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := " ++ multSubsetRebuildReadyTermBody ++ "\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

/-- E-bad PE65: MultSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildText : String :=
  packageEnvMultThroughS18ForS19 ++
  packageEnvModuleSection "SystemsLean.MultSubsetRebuild"
    packageEnvMultSubsetRebuildTermBodyBadResidual

/-! ### S20 package-env LinearSubsetRebuild TERM (PE66) -/

/-- LinearSubsetRebuild env body: TERM goods + multi-line linearSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathLinear (already in env; no emit-module
    farm). Rebuild / self-apply, not emitLinearReady. Greppable:
    packageEnvLinearSubsetRebuildTermBodyGood. -/
def packageEnvLinearSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++
    linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++
    linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

/-- LinearSubsetRebuild module good (TERM soft J5; import CompilePathLinear).
    Greppable: packageEnvLinearSubsetRebuildTermModuleGood. -/
def packageEnvLinearSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LinearSubsetRebuild"
    packageEnvLinearSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S19 + S20 LinearSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS20Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS20Text : String :=
  hostModuleCheckGoodPackageEnvS19Text ++
  packageEnvLinearSubsetRebuildTermModuleGood

/-- Prefix through S19 for S20 E-bad twins.
    Greppable: packageEnvMultThroughS19ForS20. -/
def packageEnvMultThroughS19ForS20 : String :=
  hostModuleCheckGoodPackageEnvS19Text

/-- LinearSubsetRebuild env body with residual-free claimed true (PE66).
    CompilePathLinear only (already in env; no emit-module farm).
    Greppable: packageEnvLinearSubsetRebuildTermBodyBadResidual. -/
def packageEnvLinearSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "namespace SystemsLean.LinearSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"linear-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetRebuildSelfApplyOk : Bool := " ++
    linearSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def linearSubsetRebuildWroteExpected : Bool := " ++
    linearSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def linearSubsetRebuildReady : Bool := " ++ linearSubsetRebuildReadyTermBody ++ "\n" ++
  "def linearSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def linearSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetRebuildTermSkeletonSuffix

/-- E-bad PE66: LinearSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildText : String :=
  packageEnvMultThroughS19ForS20 ++
  packageEnvModuleSection "SystemsLean.LinearSubsetRebuild"
    packageEnvLinearSubsetRebuildTermBodyBadResidual

/-! ### S21 package-env TypesSubsetRebuild TERM (PE67) -/

/-- TypesSubsetRebuild env body: TERM goods + multi-line typesSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathTypes (already in env; no emit-module
    farm). Rebuild / self-apply, not emitTypesReady. Greppable:
    packageEnvTypesSubsetRebuildTermBodyGood. -/
def packageEnvTypesSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++
    typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++
    typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodTypesSubsetRebuildReadyMultilineText ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

/-- TypesSubsetRebuild module good (TERM soft J5; import CompilePathTypes).
    Greppable: packageEnvTypesSubsetRebuildTermModuleGood. -/
def packageEnvTypesSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.TypesSubsetRebuild"
    packageEnvTypesSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S20 + S21 TypesSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS21Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS21Text : String :=
  hostModuleCheckGoodPackageEnvS20Text ++
  packageEnvTypesSubsetRebuildTermModuleGood

/-- Prefix through S20 for S21 E-bad twins.
    Greppable: packageEnvMultThroughS20ForS21. -/
def packageEnvMultThroughS20ForS21 : String :=
  hostModuleCheckGoodPackageEnvS20Text

/-- TypesSubsetRebuild env body with residual-free claimed true (PE67).
    CompilePathTypes only (already in env; no emit-module farm).
    Greppable: packageEnvTypesSubsetRebuildTermBodyBadResidual. -/
def packageEnvTypesSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "namespace SystemsLean.TypesSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"types-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetRebuildSelfApplyOk : Bool := " ++
    typesSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def typesSubsetRebuildWroteExpected : Bool := " ++
    typesSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def typesSubsetRebuildReady : Bool := " ++ typesSubsetRebuildReadyTermBody ++ "\n" ++
  "def typesSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetRebuildTermSkeletonSuffix

/-- E-bad PE67: TypesSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildText : String :=
  packageEnvMultThroughS20ForS21 ++
  packageEnvModuleSection "SystemsLean.TypesSubsetRebuild"
    packageEnvTypesSubsetRebuildTermBodyBadResidual

/-! ### S22 package-env ProgramSubsetRebuild TERM (PE68) -/

/-- ProgramSubsetRebuild env body: TERM goods + multi-line programSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathProgram (already in env; no emit-module
    farm). Rebuild / self-apply, not emitProgramReady. Greppable:
    packageEnvProgramSubsetRebuildTermBodyGood. -/
def packageEnvProgramSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++
    programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++
    programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

/-- ProgramSubsetRebuild module good (TERM soft J5; import CompilePathProgram).
    Greppable: packageEnvProgramSubsetRebuildTermModuleGood. -/
def packageEnvProgramSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ProgramSubsetRebuild"
    packageEnvProgramSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S21 + S22 ProgramSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS22Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS22Text : String :=
  hostModuleCheckGoodPackageEnvS21Text ++
  packageEnvProgramSubsetRebuildTermModuleGood

/-- Prefix through S21 for S22 E-bad twins.
    Greppable: packageEnvMultThroughS21ForS22. -/
def packageEnvMultThroughS21ForS22 : String :=
  hostModuleCheckGoodPackageEnvS21Text

/-- ProgramSubsetRebuild env body with residual-free claimed true (PE68).
    CompilePathProgram only (already in env; no emit-module farm).
    Greppable: packageEnvProgramSubsetRebuildTermBodyBadResidual. -/
def packageEnvProgramSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "namespace SystemsLean.ProgramSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++
    programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++
    programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := " ++ programSubsetRebuildReadyTermBody ++ "\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

/-- E-bad PE68: ProgramSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText : String :=
  packageEnvMultThroughS21ForS22 ++
  packageEnvModuleSection "SystemsLean.ProgramSubsetRebuild"
    packageEnvProgramSubsetRebuildTermBodyBadResidual

/-! ### S23 package-env GraphSubsetRebuild TERM (PE69) -/

/-- GraphSubsetRebuild env body: TERM goods + multi-line graphSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathGraph (already in env; no emit-module
    farm). Rebuild / self-apply, not emitGraphReady. Greppable:
    packageEnvGraphSubsetRebuildTermBodyGood. -/
def packageEnvGraphSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++
    graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++
    graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

/-- GraphSubsetRebuild module good (TERM soft J5; import CompilePathGraph).
    Greppable: packageEnvGraphSubsetRebuildTermModuleGood. -/
def packageEnvGraphSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.GraphSubsetRebuild"
    packageEnvGraphSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S22 + S23 GraphSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS23Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS23Text : String :=
  hostModuleCheckGoodPackageEnvS22Text ++
  packageEnvGraphSubsetRebuildTermModuleGood

/-- Prefix through S22 for S23 E-bad twins.
    Greppable: packageEnvMultThroughS22ForS23. -/
def packageEnvMultThroughS22ForS23 : String :=
  hostModuleCheckGoodPackageEnvS22Text

/-- GraphSubsetRebuild env body with residual-free claimed true (PE69).
    CompilePathGraph only (already in env; no emit-module farm).
    Greppable: packageEnvGraphSubsetRebuildTermBodyBadResidual. -/
def packageEnvGraphSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathGraph\n" ++
  "namespace SystemsLean.GraphSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_GRAPH_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"graph-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_graph_subset.h\"\n" ++
  "def graphSubsetRebuildSelfApplyOk : Bool := " ++
    graphSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def graphSubsetRebuildWroteExpected : Bool := " ++
    graphSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def graphSubsetRebuildReady : Bool := " ++ graphSubsetRebuildReadyTermBody ++ "\n" ++
  "def graphSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def graphSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckGraphSubsetRebuildTermSkeletonSuffix

/-- E-bad PE69: GraphSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText : String :=
  packageEnvMultThroughS22ForS23 ++
  packageEnvModuleSection "SystemsLean.GraphSubsetRebuild"
    packageEnvGraphSubsetRebuildTermBodyBadResidual

/-! ### S24 package-env ComposeSubsetRebuild TERM (PE70) -/

/-- ComposeSubsetRebuild env body: TERM goods + multi-line composeSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathCompose (already in env; no emit-module
    farm). Rebuild / self-apply, not emitComposeReady. Greppable:
    packageEnvComposeSubsetRebuildTermBodyGood. -/
def packageEnvComposeSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++
    composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++
    composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

/-- ComposeSubsetRebuild module good (TERM soft J5; import CompilePathCompose).
    Greppable: packageEnvComposeSubsetRebuildTermModuleGood. -/
def packageEnvComposeSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ComposeSubsetRebuild"
    packageEnvComposeSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S23 + S24 ComposeSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS24Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS24Text : String :=
  hostModuleCheckGoodPackageEnvS23Text ++
  packageEnvComposeSubsetRebuildTermModuleGood

/-- Prefix through S23 for S24 E-bad twins.
    Greppable: packageEnvMultThroughS23ForS24. -/
def packageEnvMultThroughS23ForS24 : String :=
  hostModuleCheckGoodPackageEnvS23Text

/-- ComposeSubsetRebuild env body with residual-free claimed true (PE70).
    CompilePathCompose only (already in env; no emit-module farm).
    Greppable: packageEnvComposeSubsetRebuildTermBodyBadResidual. -/
def packageEnvComposeSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "namespace SystemsLean.ComposeSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"compose-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetRebuildSelfApplyOk : Bool := " ++
    composeSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def composeSubsetRebuildWroteExpected : Bool := " ++
    composeSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def composeSubsetRebuildReady : Bool := " ++ composeSubsetRebuildReadyTermBody ++ "\n" ++
  "def composeSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def composeSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetRebuildTermSkeletonSuffix

/-- E-bad PE70: ComposeSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText : String :=
  packageEnvMultThroughS23ForS24 ++
  packageEnvModuleSection "SystemsLean.ComposeSubsetRebuild"
    packageEnvComposeSubsetRebuildTermBodyBadResidual

/-! ### S25 package-env ErasureSubsetRebuild TERM (PE71) -/

/-- ErasureSubsetRebuild env body: TERM goods + multi-line erasureSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathErasure (already in env; no emit-module
    farm). Rebuild / self-apply, not emitErasureReady. Greppable:
    packageEnvErasureSubsetRebuildTermBodyGood. -/
def packageEnvErasureSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++
    erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++
    erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

/-- ErasureSubsetRebuild module good (TERM soft J5; import CompilePathErasure).
    Greppable: packageEnvErasureSubsetRebuildTermModuleGood. -/
def packageEnvErasureSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ErasureSubsetRebuild"
    packageEnvErasureSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S24 + S25 ErasureSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS25Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS25Text : String :=
  hostModuleCheckGoodPackageEnvS24Text ++
  packageEnvErasureSubsetRebuildTermModuleGood

/-- Prefix through S24 for S25 E-bad twins.
    Greppable: packageEnvMultThroughS24ForS25. -/
def packageEnvMultThroughS24ForS25 : String :=
  hostModuleCheckGoodPackageEnvS24Text

/-- ErasureSubsetRebuild env body with residual-free claimed true (PE71).
    CompilePathErasure only (already in env; no emit-module farm).
    Greppable: packageEnvErasureSubsetRebuildTermBodyBadResidual. -/
def packageEnvErasureSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "namespace SystemsLean.ErasureSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"erasure-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetRebuildSelfApplyOk : Bool := " ++
    erasureSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def erasureSubsetRebuildWroteExpected : Bool := " ++
    erasureSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def erasureSubsetRebuildReady : Bool := " ++ erasureSubsetRebuildReadyTermBody ++ "\n" ++
  "def erasureSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def erasureSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetRebuildTermSkeletonSuffix

/-- E-bad PE71: ErasureSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText : String :=
  packageEnvMultThroughS24ForS25 ++
  packageEnvModuleSection "SystemsLean.ErasureSubsetRebuild"
    packageEnvErasureSubsetRebuildTermBodyBadResidual

/-! ### S26 package-env ExtractSubsetRebuild TERM (PE72) -/

/-- ExtractSubsetRebuild env body: TERM goods + multi-line extractSubsetRebuildReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is CompilePathExtract (already in env; no emit-module
    farm). Rebuild / self-apply, not emitExtractReady. Greppable:
    packageEnvExtractSubsetRebuildTermBodyGood. -/
def packageEnvExtractSubsetRebuildTermBodyGood : String :=
  "import SystemsLean.CompilePathExtract\n" ++
  "namespace SystemsLean.ExtractSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++
    extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++
    extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

/-- ExtractSubsetRebuild module good (TERM soft J5; import CompilePathExtract).
    Greppable: packageEnvExtractSubsetRebuildTermModuleGood. -/
def packageEnvExtractSubsetRebuildTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.ExtractSubsetRebuild"
    packageEnvExtractSubsetRebuildTermBodyGood

/-- Canonical E-good Mult..S25 + S26 ExtractSubsetRebuild TERM.
    Greppable: hostModuleCheckGoodPackageEnvS26Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS26Text : String :=
  hostModuleCheckGoodPackageEnvS25Text ++
  packageEnvExtractSubsetRebuildTermModuleGood

/-- Prefix through S25 for S26 E-bad twins.
    Greppable: packageEnvMultThroughS25ForS26. -/
def packageEnvMultThroughS25ForS26 : String :=
  hostModuleCheckGoodPackageEnvS25Text

/-- ExtractSubsetRebuild env body with residual-free claimed true (PE72).
    CompilePathExtract only (already in env; no emit-module farm).
    Greppable: packageEnvExtractSubsetRebuildTermBodyBadResidual. -/
def packageEnvExtractSubsetRebuildTermBodyBadResidual : String :=
  "import SystemsLean.CompilePathExtract\n" ++
  "namespace SystemsLean.ExtractSubsetRebuild\n" ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"extract-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetRebuildSelfApplyOk : Bool := " ++
    extractSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def extractSubsetRebuildWroteExpected : Bool := " ++
    extractSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def extractSubsetRebuildReady : Bool := " ++ extractSubsetRebuildReadyTermBody ++ "\n" ++
  "def extractSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def extractSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetRebuildTermSkeletonSuffix

/-- E-bad PE72: ExtractSubsetRebuild residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText : String :=
  packageEnvMultThroughS25ForS26 ++
  packageEnvModuleSection "SystemsLean.ExtractSubsetRebuild"
    packageEnvExtractSubsetRebuildTermBodyBadResidual

/-! ### S27 package-env HostFront TERM (PE73) -/

/-- HostFront env body: TERM goods + multi-line hostFrontReady (real module
    shape). Collapse must accept this, not only a same-line after `:=` body.
    Soft J2 import is SystemsLean.Mult (already in env; living HostFront also
    imports HostTerm + HostFrontGoldens). New unit class: Mult-first host
    fragment front-end. Not emitExtractReady. Not extractSubsetRebuildSelfApplyOk.
    Greppable: packageEnvHostFrontTermBodyGood. -/
def packageEnvHostFrontTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostFront\n" ++
  "def stageId : String := \"SLAKE_HOST_FRONT_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT\"\n" ++
  "def surfaceId : String := \"HOST-FRONT\"\n" ++
  "def justRecipe : String := \"host-front\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFrontHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostFrontDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostFrontResidualFreeClaimed : Bool := false\n" ++
  "def hostFrontProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostFrontProofCompleteClaimed : Bool := false\n" ++
  "def hostFrontLlvmUnlocked : Bool := false\n" ++
  "def hostFrontProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodHostFrontReadyMultilineText ++
  hostModuleCheckHostFrontTermSkeletonSuffix

/-- HostFront module good (TERM soft J5; import Mult).
    Greppable: packageEnvHostFrontTermModuleGood. -/
def packageEnvHostFrontTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.HostFront"
    packageEnvHostFrontTermBodyGood

/-- Canonical E-good Mult..S26 + S27 HostFront TERM.
    Greppable: hostModuleCheckGoodPackageEnvS27Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS27Text : String :=
  hostModuleCheckGoodPackageEnvS26Text ++
  packageEnvHostFrontTermModuleGood

/-- Prefix through S26 for S27 E-bad twins.
    Greppable: packageEnvMultThroughS26ForS27. -/
def packageEnvMultThroughS26ForS27 : String :=
  hostModuleCheckGoodPackageEnvS26Text

/-- HostFront env body with residual-free claimed true (PE73).
    Mult only (already in env; no CompilePathHostFront; no emit-module farm).
    Greppable: packageEnvHostFrontTermBodyBadResidual. -/
def packageEnvHostFrontTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostFront\n" ++
  "def stageId : String := \"SLAKE_HOST_FRONT_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT\"\n" ++
  "def surfaceId : String := \"HOST-FRONT\"\n" ++
  "def justRecipe : String := \"host-front\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFrontHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostFrontDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostFrontResidualFreeClaimed : Bool := true\n" ++
  "def hostFrontProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostFrontProofCompleteClaimed : Bool := false\n" ++
  "def hostFrontLlvmUnlocked : Bool := false\n" ++
  "def hostFrontProvablyUnlocked : Bool := false\n" ++
  "def hostFrontReady : Bool := " ++ hostFrontReadyTermBody ++ "\n" ++
  hostModuleCheckHostFrontTermSkeletonSuffix

/-- E-bad PE73: HostFront residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostFrontText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedHostFrontText : String :=
  packageEnvMultThroughS26ForS27 ++
  packageEnvModuleSection "SystemsLean.HostFront"
    packageEnvHostFrontTermBodyBadResidual

/-! ### S28 package-env LLVM Mult text TERM (PE74) -/

/-- LLVM Mult text env body: TERM goods + multi-line llvmMultTextReady (real
    module shape). Collapse must accept this, not only a same-line after `:=`
    body. Soft J2 import is SystemsLean.Mult (already in env; living
    LlvmMultText also imports LlvmHold + LlvmEmitPath). LLVM IR Mult text
    writer, not HostFront, not emit, not rebuild / self-apply.
    Greppable: packageEnvLlvmMultTextTermBodyGood. -/
def packageEnvLlvmMultTextTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.LlvmMultText\n" ++
  "def stageId : String := \"SLAKE_LLVM_MULT_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-mult-text\"\n" ++
  "def llvmMultTextLlvmUnlocked : Bool := false\n" ++
  "def llvmMultTextResidualFreeClaimed : Bool := false\n" ++
  "def llvmMultTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmMultTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmMultTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmMultTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmMultTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmMultTextLlvmAsClaimed : Bool := false\n" ++
  hostModuleCheckGoodLlvmMultTextReadyMultilineText ++
  hostModuleCheckLlvmMultTextTermSkeletonSuffix

/-- LLVM Mult text module good (TERM soft J5; import Mult).
    Greppable: packageEnvLlvmMultTextTermModuleGood. -/
def packageEnvLlvmMultTextTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LlvmMultText"
    packageEnvLlvmMultTextTermBodyGood

/-- Canonical E-good Mult..S27 + S28 LLVM Mult text TERM.
    Greppable: hostModuleCheckGoodPackageEnvS28Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS28Text : String :=
  hostModuleCheckGoodPackageEnvS27Text ++
  packageEnvLlvmMultTextTermModuleGood

/-- Prefix through S27 for S28 E-bad twins.
    Greppable: packageEnvMultThroughS27ForS28. -/
def packageEnvMultThroughS27ForS28 : String :=
  hostModuleCheckGoodPackageEnvS27Text

/-- LLVM Mult text env body with residual-free claimed true (PE74).
    Mult only (already in env; no CompilePathLlvmMultText; no emit-module farm).
    Greppable: packageEnvLlvmMultTextTermBodyBadResidual. -/
def packageEnvLlvmMultTextTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.LlvmMultText\n" ++
  "def stageId : String := \"SLAKE_LLVM_MULT_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-MULT-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-mult-text\"\n" ++
  "def llvmMultTextLlvmUnlocked : Bool := false\n" ++
  "def llvmMultTextResidualFreeClaimed : Bool := true\n" ++
  "def llvmMultTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmMultTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmMultTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmMultTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmMultTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmMultTextLlvmAsClaimed : Bool := false\n" ++
  "def llvmMultTextReady : Bool := " ++ llvmMultTextReadyTermBody ++ "\n" ++
  hostModuleCheckLlvmMultTextTermSkeletonSuffix

/-- E-bad PE74: LLVM Mult text residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText : String :=
  packageEnvMultThroughS27ForS28 ++
  packageEnvModuleSection "SystemsLean.LlvmMultText"
    packageEnvLlvmMultTextTermBodyBadResidual

/-! ### S29 package-env Host fragment check TERM (PE75) -/

/-- HostCheck env body: TERM goods + multi-line hostFragmentCheckReady (real
    module shape). Collapse must accept this, not only a same-line after `:=`
    body. Soft J2 import is SystemsLean.Mult (already in env; living HostCheck
    imports HostFront). Mult-first host fragment checker, same class as
    HostFront. Not emit, not rebuild / self-apply, not LLVM Mult text.
    Living ready is hostFragmentCheckReady, not hostCheckReady.
    Greppable: packageEnvHostCheckTermBodyGood. -/
def packageEnvHostCheckTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostCheck\n" ++
  "def stageId : String := \"SLAKE_HOST_FRAGMENT_CHECK_V0\"\n" ++
  "def hostId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def surfaceId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def justRecipe : String := \"host-fragment-check\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFragmentCheckHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostFragmentCheckDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostFragmentCheckResidualFreeClaimed : Bool := false\n" ++
  "def hostFragmentCheckProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostFragmentCheckProofCompleteClaimed : Bool := false\n" ++
  "def hostFragmentCheckLlvmUnlocked : Bool := false\n" ++
  "def hostFragmentCheckProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodHostCheckReadyMultilineText ++
  hostModuleCheckHostCheckTermSkeletonSuffix

/-- HostCheck module good (TERM soft J5; import Mult).
    Greppable: packageEnvHostCheckTermModuleGood. -/
def packageEnvHostCheckTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.HostCheck"
    packageEnvHostCheckTermBodyGood

/-- Canonical E-good Mult..S28 + S29 Host fragment check TERM.
    Greppable: hostModuleCheckGoodPackageEnvS29Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS29Text : String :=
  hostModuleCheckGoodPackageEnvS28Text ++
  packageEnvHostCheckTermModuleGood

/-- Prefix through S28 for S29 E-bad twins.
    Greppable: packageEnvMultThroughS28ForS29. -/
def packageEnvMultThroughS28ForS29 : String :=
  hostModuleCheckGoodPackageEnvS28Text

/-- HostCheck env body with residual-free claimed true (PE75).
    Mult only (already in env; no CompilePathHostCheck; no emit-module farm).
    Greppable: packageEnvHostCheckTermBodyBadResidual. -/
def packageEnvHostCheckTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostCheck\n" ++
  "def stageId : String := \"SLAKE_HOST_FRAGMENT_CHECK_V0\"\n" ++
  "def hostId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def surfaceId : String := \"HOST-FRAGMENT-CHECK\"\n" ++
  "def justRecipe : String := \"host-fragment-check\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostFragmentCheckHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostFragmentCheckDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostFragmentCheckResidualFreeClaimed : Bool := true\n" ++
  "def hostFragmentCheckProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostFragmentCheckProofCompleteClaimed : Bool := false\n" ++
  "def hostFragmentCheckLlvmUnlocked : Bool := false\n" ++
  "def hostFragmentCheckProvablyUnlocked : Bool := false\n" ++
  "def hostFragmentCheckReady : Bool := " ++ hostFragmentCheckReadyTermBody ++ "\n" ++
  hostModuleCheckHostCheckTermSkeletonSuffix

/-- E-bad PE75: HostCheck residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostCheckText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedHostCheckText : String :=
  packageEnvMultThroughS28ForS29 ++
  packageEnvModuleSection "SystemsLean.HostCheck"
    packageEnvHostCheckTermBodyBadResidual

end SystemsLean.HostModuleCheck
