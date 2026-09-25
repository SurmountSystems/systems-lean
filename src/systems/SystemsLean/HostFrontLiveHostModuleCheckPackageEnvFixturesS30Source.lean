/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckPackageEnvFixturesS30.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckPackageEnvFixturesS30.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckPackageEnvFixturesS30Source,
  PARSE-LIVE-HOST-MODULE-CHECK-PACKAGE-ENV-FIXTURES-S30.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvFixturesS30.lean"

/-- Pinned live HostModuleCheckPackageEnvFixturesS30.lean bytes. -/
def liveHostModuleCheckPackageEnvFixturesS30Source : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 S30 env fixtures.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: S30 PE76 Host fragment graph plus S31 PE77 LLVM Linear
  text plus S32 PE78 Mult package writer tool plus S33 PE79 FrontMultPackage
  plus S34 PE80 SubsetPackageJoin plus S35 PE81 LLVM Types text fixtures after
  FixturesLater (S17..S29). Shared Mult..S29 builders stay in
  HostModuleCheckPackageEnvFixturesLater. S36.. later farms stay in
  HostModuleCheckPackageEnvFixturesTail. Same namespace
  SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - Not a new harness TERM companion. Harness stays 137. TERM stays 82.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvFixturesS30, PACKAGE-ELABORATE,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
  hostModuleCheckGoodPackageEnvS30Text,
  hostModuleCheckGoodPackageEnvS31Text,
  hostModuleCheckGoodPackageEnvS32Text,
  hostModuleCheckGoodPackageEnvS33Text,
  hostModuleCheckGoodPackageEnvS34Text,
  hostModuleCheckGoodPackageEnvS35Text,
  hostModuleCheckBadPackageEnvIllTypedHostGraphText,
  hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText,
  hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText,
  hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText,
  hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText,
  hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvFixturesS30
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvFixturesS30;
  lake build SystemsLean.HostModuleCheckPackageEnv;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnvFixturesLater
import SystemsLean.HostModuleCheckHostGraphTerm
import SystemsLean.HostModuleCheckLlvmLinearTextTerm
import SystemsLean.HostModuleCheckMultFsWriteToolTerm
import SystemsLean.HostModuleCheckFrontMultPackageTerm
import SystemsLean.HostModuleCheckSubsetPackageJoinTerm
import SystemsLean.HostModuleCheckLlvmTypesTextTerm

namespace SystemsLean.HostModuleCheck

/-! ### S30 package-env Host fragment graph TERM (PE76) -/

/-- HostGraph env body: TERM goods + multi-line hostGraphReady (real
    module shape). Collapse must accept this, not only a same-line after `:=`
    body. Soft J2 import is SystemsLean.Mult (already in env; living HostGraph
    imports HostFront + HostTerm). Mult-first host fragment graph, same class
    as HostFront / HostCheck. Not emit, not rebuild / self-apply, not LLVM
    Mult text. Living ready is hostGraphReady, not hostCheckReady.
    Greppable: packageEnvHostGraphTermBodyGood. -/
def packageEnvHostGraphTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostGraph\n" ++
  "def stageId : String := \"SLAKE_HOST_GRAPH_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH\"\n" ++
  "def surfaceId : String := \"HOST-GRAPH\"\n" ++
  "def justRecipe : String := \"host-graph\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostGraphHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostGraphDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostGraphResidualFreeClaimed : Bool := false\n" ++
  "def hostGraphProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostGraphProofCompleteClaimed : Bool := false\n" ++
  "def hostGraphLlvmUnlocked : Bool := false\n" ++
  "def hostGraphProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodHostGraphReadyMultilineText ++
  hostModuleCheckHostGraphTermSkeletonSuffix

/-- HostGraph module good (TERM soft J5; import Mult).
    Greppable: packageEnvHostGraphTermModuleGood. -/
def packageEnvHostGraphTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.HostGraph"
    packageEnvHostGraphTermBodyGood

/-- Canonical E-good Mult..S29 + S30 Host fragment graph TERM.
    Greppable: hostModuleCheckGoodPackageEnvS30Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS30Text : String :=
  hostModuleCheckGoodPackageEnvS29Text ++
  packageEnvHostGraphTermModuleGood

/-- Prefix through S29 for S30 E-bad twins.
    Greppable: packageEnvMultThroughS29ForS30. -/
def packageEnvMultThroughS29ForS30 : String :=
  hostModuleCheckGoodPackageEnvS29Text

/-- HostGraph env body with residual-free claimed true (PE76).
    Mult only (already in env; no CompilePathHostGraph; no emit-module farm).
    Greppable: packageEnvHostGraphTermBodyBadResidual. -/
def packageEnvHostGraphTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.HostGraph\n" ++
  "def stageId : String := \"SLAKE_HOST_GRAPH_V0\"\n" ++
  "def hostId : String := \"HOST-GRAPH\"\n" ++
  "def surfaceId : String := \"HOST-GRAPH\"\n" ++
  "def justRecipe : String := \"host-graph\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def hostGraphHostElaboratorResidualRemains : Bool := true\n" ++
  "def hostGraphDoesNotClaimPeerGreen : Bool := true\n" ++
  "def hostGraphResidualFreeClaimed : Bool := true\n" ++
  "def hostGraphProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def hostGraphProofCompleteClaimed : Bool := false\n" ++
  "def hostGraphLlvmUnlocked : Bool := false\n" ++
  "def hostGraphProvablyUnlocked : Bool := false\n" ++
  "def hostGraphReady : Bool := " ++ hostGraphReadyTermBody ++ "\n" ++
  hostModuleCheckHostGraphTermSkeletonSuffix

/-- E-bad PE76: HostGraph residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostGraphText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedHostGraphText : String :=
  packageEnvMultThroughS29ForS30 ++
  packageEnvModuleSection "SystemsLean.HostGraph"
    packageEnvHostGraphTermBodyBadResidual

/-! ### S31 package-env LLVM Linear text TERM (PE77) -/

/-- LLVM Linear text env body: TERM goods + multi-line llvmLinearTextReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is SystemsLean.Mult (already in env). LLVM IR
    Linear text writer, same class as LLVM Mult text. Not HostFront, not emit,
    not rebuild / self-apply. Living ready is llvmLinearTextReady, not
    hostFrontReady, not hostGraphReady.
    Greppable: packageEnvLlvmLinearTextTermBodyGood. -/
def packageEnvLlvmLinearTextTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.LlvmLinearText\n" ++
  "def stageId : String := \"SLAKE_LLVM_LINEAR_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-linear-text\"\n" ++
  "def llvmLinearTextLlvmUnlocked : Bool := false\n" ++
  "def llvmLinearTextResidualFreeClaimed : Bool := false\n" ++
  "def llvmLinearTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmLinearTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmLinearTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmLinearTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmLinearTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmLinearTextLlvmAsClaimed : Bool := false\n" ++
  hostModuleCheckGoodLlvmLinearTextReadyMultilineText ++
  hostModuleCheckLlvmLinearTextTermSkeletonSuffix

/-- LLVM Linear text module good (TERM soft J5; import Mult).
    Greppable: packageEnvLlvmLinearTextTermModuleGood. -/
def packageEnvLlvmLinearTextTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LlvmLinearText"
    packageEnvLlvmLinearTextTermBodyGood

/-- Canonical E-good Mult..S30 + S31 LLVM Linear text TERM.
    Greppable: hostModuleCheckGoodPackageEnvS31Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS31Text : String :=
  hostModuleCheckGoodPackageEnvS30Text ++
  packageEnvLlvmLinearTextTermModuleGood

/-- Prefix through S30 for S31 E-bad twins.
    Greppable: packageEnvMultThroughS30ForS31. -/
def packageEnvMultThroughS30ForS31 : String :=
  hostModuleCheckGoodPackageEnvS30Text

/-- LLVM Linear text env body with residual-free claimed true (PE77).
    Mult only (already in env; no CompilePathLlvmLinearText; no emit-module farm).
    Greppable: packageEnvLlvmLinearTextTermBodyBadResidual. -/
def packageEnvLlvmLinearTextTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.LlvmLinearText\n" ++
  "def stageId : String := \"SLAKE_LLVM_LINEAR_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-LINEAR-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-linear-text\"\n" ++
  "def llvmLinearTextLlvmUnlocked : Bool := false\n" ++
  "def llvmLinearTextResidualFreeClaimed : Bool := true\n" ++
  "def llvmLinearTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmLinearTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmLinearTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmLinearTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmLinearTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmLinearTextLlvmAsClaimed : Bool := false\n" ++
  "def llvmLinearTextReady : Bool := " ++ llvmLinearTextReadyTermBody ++ "\n" ++
  hostModuleCheckLlvmLinearTextTermSkeletonSuffix

/-- E-bad PE77: LLVM Linear text residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText : String :=
  packageEnvMultThroughS30ForS31 ++
  packageEnvModuleSection "SystemsLean.LlvmLinearText"
    packageEnvLlvmLinearTextTermBodyBadResidual

/-! ### S32 package-env Mult package writer tool TERM (PE78) -/

/-- MultFsWriteTool env body: TERM goods + multi-line multFsWriteToolReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is SystemsLean.Mult (already in env). Mult
    package freestanding writer, same class as LLVM Mult / Linear text. Not
    HostFront, not LLVM IR text, not rebuild / self-apply. Living ready is
    multFsWriteToolReady, not hostFrontReady, not llvmLinearTextReady.
    Greppable: packageEnvMultFsWriteToolTermBodyGood. -/
def packageEnvMultFsWriteToolTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.MultFsWriteTool\n" ++
  "def stageId : String := \"SLAKE_MULT_FS_WRITE_TOOL_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-FS-WRITE-TOOL\"\n" ++
  "def surfaceId : String := \"MULT-FS-WRITE-TOOL\"\n" ++
  "def justRecipeWriteTool : String := \"mult-subset-freestanding-write\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def multFsWriteToolNativeIo : Bool := true\n" ++
  "def multFsWriteToolPrintsFullHelperC : Bool := false\n" ++
  "def multFsWriteToolResidualFreeClaimed : Bool := false\n" ++
  "def multFsWriteToolProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def multFsWriteToolProofCompleteClaimed : Bool := false\n" ++
  "def multFsWriteToolLlvmUnlocked : Bool := false\n" ++
  "def multFsWriteToolProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodMultFsWriteToolReadyMultilineText ++
  hostModuleCheckMultFsWriteToolTermSkeletonSuffix

/-- Mult package writer tool module good (TERM soft J5; import Mult).
    Greppable: packageEnvMultFsWriteToolTermModuleGood. -/
def packageEnvMultFsWriteToolTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.MultFsWriteTool"
    packageEnvMultFsWriteToolTermBodyGood

/-- Canonical E-good Mult..S31 + S32 Mult package writer tool TERM.
    Greppable: hostModuleCheckGoodPackageEnvS32Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS32Text : String :=
  hostModuleCheckGoodPackageEnvS31Text ++
  packageEnvMultFsWriteToolTermModuleGood

/-- Prefix through S31 for S32 E-bad twins.
    Greppable: packageEnvMultThroughS31ForS32. -/
def packageEnvMultThroughS31ForS32 : String :=
  hostModuleCheckGoodPackageEnvS31Text

/-- Mult package writer tool env body with residual-free claimed true (PE78).
    Mult only (already in env; no CompilePathMultFsWriteTool; no emit-module farm).
    Greppable: packageEnvMultFsWriteToolTermBodyBadResidual. -/
def packageEnvMultFsWriteToolTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.MultFsWriteTool\n" ++
  "def stageId : String := \"SLAKE_MULT_FS_WRITE_TOOL_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-FS-WRITE-TOOL\"\n" ++
  "def surfaceId : String := \"MULT-FS-WRITE-TOOL\"\n" ++
  "def justRecipeWriteTool : String := \"mult-subset-freestanding-write\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def multFsWriteToolNativeIo : Bool := true\n" ++
  "def multFsWriteToolPrintsFullHelperC : Bool := false\n" ++
  "def multFsWriteToolResidualFreeClaimed : Bool := true\n" ++
  "def multFsWriteToolProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def multFsWriteToolProofCompleteClaimed : Bool := false\n" ++
  "def multFsWriteToolLlvmUnlocked : Bool := false\n" ++
  "def multFsWriteToolProvablyUnlocked : Bool := false\n" ++
  "def multFsWriteToolReady : Bool := " ++ multFsWriteToolReadyTermBody ++ "\n" ++
  hostModuleCheckMultFsWriteToolTermSkeletonSuffix

/-- E-bad PE78: Mult package writer tool residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText : String :=
  packageEnvMultThroughS31ForS32 ++
  packageEnvModuleSection "SystemsLean.MultFsWriteTool"
    packageEnvMultFsWriteToolTermBodyBadResidual

/-! ### S33 package-env FrontMultPackage TERM (PE79) -/

/-- FrontMultPackage env body: TERM goods + multi-line frontMultPackageReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is SystemsLean.Mult (already in env; living
    FrontMultPackage imports SubsetFront + MultSubsetEmit + MultSubsetRebuild).
    HostFront-class front-end Mult package path: SubsetFront accepts Mult
    golden G1, then Mult unit package write. Not IO.FS.writeFile writer. Not
    LLVM IR text. Not rebuild / self-apply. Living ready is
    frontMultPackageReady, not hostFrontReady, not multFsWriteToolReady.
    Greppable: packageEnvFrontMultPackageTermBodyGood. -/
def packageEnvFrontMultPackageTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.FrontMultPackage\n" ++
  "def stageId : String := \"SLAKE_FRONT_MULT_PACKAGE_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT-MULT-PACKAGE\"\n" ++
  "def surfaceId : String := \"FRONT-MULT-PACKAGE\"\n" ++
  "def justRecipeFrontMultPackage : String := \"front-mult-package\"\n" ++
  "def justRecipe : String := \"front-mult-package\"\n" ++
  "def lakeExeName : String := \"slake-front-mult-package\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def frontMultPackageResidualFreeClaimed : Bool := false\n" ++
  "def frontMultPackageProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def frontMultPackageProofCompleteClaimed : Bool := false\n" ++
  "def frontMultPackageLlvmUnlocked : Bool := false\n" ++
  "def frontMultPackageProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodFrontMultPackageReadyMultilineText ++
  hostModuleCheckFrontMultPackageTermSkeletonSuffix

/-- FrontMultPackage module good (TERM soft J5; import Mult).
    Greppable: packageEnvFrontMultPackageTermModuleGood. -/
def packageEnvFrontMultPackageTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.FrontMultPackage"
    packageEnvFrontMultPackageTermBodyGood

/-- Canonical E-good Mult..S32 + S33 FrontMultPackage TERM.
    Greppable: hostModuleCheckGoodPackageEnvS33Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS33Text : String :=
  hostModuleCheckGoodPackageEnvS32Text ++
  packageEnvFrontMultPackageTermModuleGood

/-- Prefix through S32 for S33 E-bad twins.
    Greppable: packageEnvMultThroughS32ForS33. -/
def packageEnvMultThroughS32ForS33 : String :=
  hostModuleCheckGoodPackageEnvS32Text

/-- FrontMultPackage env body with residual-free claimed true (PE79).
    Mult only (already in env; no CompilePathHostFront; no emit-module farm).
    Greppable: packageEnvFrontMultPackageTermBodyBadResidual. -/
def packageEnvFrontMultPackageTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.FrontMultPackage\n" ++
  "def stageId : String := \"SLAKE_FRONT_MULT_PACKAGE_V0\"\n" ++
  "def hostId : String := \"HOST-FRONT-MULT-PACKAGE\"\n" ++
  "def surfaceId : String := \"FRONT-MULT-PACKAGE\"\n" ++
  "def justRecipeFrontMultPackage : String := \"front-mult-package\"\n" ++
  "def justRecipe : String := \"front-mult-package\"\n" ++
  "def lakeExeName : String := \"slake-front-mult-package\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def frontMultPackageResidualFreeClaimed : Bool := true\n" ++
  "def frontMultPackageProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def frontMultPackageProofCompleteClaimed : Bool := false\n" ++
  "def frontMultPackageLlvmUnlocked : Bool := false\n" ++
  "def frontMultPackageProvablyUnlocked : Bool := false\n" ++
  "def frontMultPackageReady : Bool := " ++ frontMultPackageReadyTermBody ++ "\n" ++
  hostModuleCheckFrontMultPackageTermSkeletonSuffix

/-- E-bad PE79: FrontMultPackage residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText : String :=
  packageEnvMultThroughS32ForS33 ++
  packageEnvModuleSection "SystemsLean.FrontMultPackage"
    packageEnvFrontMultPackageTermBodyBadResidual

/-! ### S34 package-env SubsetPackageJoin TERM (PE80) -/

/-- SubsetPackageJoin env body: TERM goods + multi-line subsetPackageJoinReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is SystemsLean.Mult (already in env; living
    SubsetPackageJoin imports Mult..Compose SubsetRebuild). Join of subset
    packages: measured Mult..Compose subset-package rebuild join plus
    without-Lake multi-unit join. Not HostFront-class. Not MultFsWriteTool
    writer. Not LLVM IR text. Not rebuild / self-apply. Living ready is
    subsetPackageJoinReady, not frontMultPackageReady, not hostFrontReady.
    Greppable: packageEnvSubsetPackageJoinTermBodyGood. -/
def packageEnvSubsetPackageJoinTermBodyGood : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.SubsetPackageJoin\n" ++
  "def stageId : String := \"SLAKE_SUBSET_PACKAGE_JOIN_V0\"\n" ++
  "def hostId : String := \"HOST-SUBSET-PACKAGE-JOIN\"\n" ++
  "def surfaceId : String := \"SUBSET-PACKAGE-JOIN\"\n" ++
  "def justRecipeSubsetPackageJoin : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipe : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipeSubsetPackageJoinWithoutLake : String := \"subset-packages-rebuild-join-without-lake\"\n" ++
  "def prebuiltUnitRebuildBinDirRel : String := \".lake/build/bin\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def subsetPackageJoinResidualFreeClaimed : Bool := false\n" ++
  "def subsetPackageJoinProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def subsetPackageJoinProofCompleteClaimed : Bool := false\n" ++
  "def subsetPackageJoinLlvmUnlocked : Bool := false\n" ++
  "def subsetPackageJoinProvablyUnlocked : Bool := false\n" ++
  hostModuleCheckGoodSubsetPackageJoinReadyMultilineText ++
  hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

/-- SubsetPackageJoin module good (TERM soft J5; import Mult).
    Greppable: packageEnvSubsetPackageJoinTermModuleGood. -/
def packageEnvSubsetPackageJoinTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.SubsetPackageJoin"
    packageEnvSubsetPackageJoinTermBodyGood

/-- Canonical E-good Mult..S33 + S34 SubsetPackageJoin TERM.
    Greppable: hostModuleCheckGoodPackageEnvS34Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS34Text : String :=
  hostModuleCheckGoodPackageEnvS33Text ++
  packageEnvSubsetPackageJoinTermModuleGood

/-- Prefix through S33 for S34 E-bad twins.
    Greppable: packageEnvMultThroughS33ForS34. -/
def packageEnvMultThroughS33ForS34 : String :=
  hostModuleCheckGoodPackageEnvS33Text

/-- SubsetPackageJoin env body with residual-free claimed true (PE80).
    Mult only (already in env; no CompilePathHostFront; no emit-module farm).
    Greppable: packageEnvSubsetPackageJoinTermBodyBadResidual. -/
def packageEnvSubsetPackageJoinTermBodyBadResidual : String :=
  "import SystemsLean.Mult\n" ++
  "namespace SystemsLean.SubsetPackageJoin\n" ++
  "def stageId : String := \"SLAKE_SUBSET_PACKAGE_JOIN_V0\"\n" ++
  "def hostId : String := \"HOST-SUBSET-PACKAGE-JOIN\"\n" ++
  "def surfaceId : String := \"SUBSET-PACKAGE-JOIN\"\n" ++
  "def justRecipeSubsetPackageJoin : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipe : String := \"subset-packages-rebuild-join\"\n" ++
  "def justRecipeSubsetPackageJoinWithoutLake : String := \"subset-packages-rebuild-join-without-lake\"\n" ++
  "def prebuiltUnitRebuildBinDirRel : String := \".lake/build/bin\"\n" ++
  "def stillUsesLake : Bool := true\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def subsetPackageJoinResidualFreeClaimed : Bool := true\n" ++
  "def subsetPackageJoinProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def subsetPackageJoinProofCompleteClaimed : Bool := false\n" ++
  "def subsetPackageJoinLlvmUnlocked : Bool := false\n" ++
  "def subsetPackageJoinProvablyUnlocked : Bool := false\n" ++
  "def subsetPackageJoinReady : Bool := " ++ subsetPackageJoinReadyTermBody ++ "\n" ++
  hostModuleCheckSubsetPackageJoinTermSkeletonSuffix

/-- E-bad PE80: SubsetPackageJoin residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText : String :=
  packageEnvMultThroughS33ForS34 ++
  packageEnvModuleSection "SystemsLean.SubsetPackageJoin"
    packageEnvSubsetPackageJoinTermBodyBadResidual

/-! ### S35 package-env LLVM Types text TERM (PE81) -/

/-- LLVM Types text env body: TERM goods + multi-line llvmTypesTextReady
    (real module shape). Collapse must accept this, not only a same-line after
    `:=` body. Soft J2 import is SystemsLean.Types (already in env). LLVM IR
    Types text writer, same class as LLVM Mult / Linear text. Not HostFront,
    not join of subset packages, not MultFs writer. Living ready is
    llvmTypesTextReady, not subsetPackageJoinReady, not llvmLinearTextReady.
    Greppable: packageEnvLlvmTypesTextTermBodyGood. -/
def packageEnvLlvmTypesTextTermBodyGood : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.LlvmTypesText\n" ++
  "def stageId : String := \"SLAKE_LLVM_TYPES_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-types-text\"\n" ++
  "def llvmTypesTextLlvmUnlocked : Bool := false\n" ++
  "def llvmTypesTextResidualFreeClaimed : Bool := false\n" ++
  "def llvmTypesTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmTypesTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmTypesTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmTypesTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmTypesTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmTypesTextLlvmAsClaimed : Bool := false\n" ++
  hostModuleCheckGoodLlvmTypesTextReadyMultilineText ++
  hostModuleCheckLlvmTypesTextTermSkeletonSuffix

/-- LLVM Types text module good (TERM soft J5; import Types).
    Greppable: packageEnvLlvmTypesTextTermModuleGood. -/
def packageEnvLlvmTypesTextTermModuleGood : String :=
  packageEnvModuleSection "SystemsLean.LlvmTypesText"
    packageEnvLlvmTypesTextTermBodyGood

/-- Canonical E-good Mult..S34 + S35 LLVM Types text TERM.
    Greppable: hostModuleCheckGoodPackageEnvS35Text, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageEnvS35Text : String :=
  hostModuleCheckGoodPackageEnvS34Text ++
  packageEnvLlvmTypesTextTermModuleGood

/-- Prefix through S34 for S35 E-bad twins.
    Greppable: packageEnvMultThroughS34ForS35. -/
def packageEnvMultThroughS34ForS35 : String :=
  hostModuleCheckGoodPackageEnvS34Text

/-- LLVM Types text env body with residual-free claimed true (PE81).
    Types only (already in env; no CompilePathLlvmTypesText; no emit-module farm).
    Greppable: packageEnvLlvmTypesTextTermBodyBadResidual. -/
def packageEnvLlvmTypesTextTermBodyBadResidual : String :=
  "import SystemsLean.Types\n" ++
  "namespace SystemsLean.LlvmTypesText\n" ++
  "def stageId : String := \"SLAKE_LLVM_TYPES_TEXT_V0\"\n" ++
  "def hostId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def surfaceId : String := \"HOST-LLVM-TYPES-TEXT\"\n" ++
  "def justRecipe : String := \"llvm-types-text\"\n" ++
  "def llvmTypesTextLlvmUnlocked : Bool := false\n" ++
  "def llvmTypesTextResidualFreeClaimed : Bool := true\n" ++
  "def llvmTypesTextProductSelfHostCompleteClaimed : Bool := false\n" ++
  "def llvmTypesTextProofCompleteClaimed : Bool := false\n" ++
  "def llvmTypesTextProvablyUnlockWorkClaimed : Bool := false\n" ++
  "def llvmTypesTextProductionReadyClaimed : Bool := false\n" ++
  "def llvmTypesTextRustNativeLinkClaimed : Bool := false\n" ++
  "def llvmTypesTextLlvmAsClaimed : Bool := false\n" ++
  "def llvmTypesTextReady : Bool := " ++ llvmTypesTextReadyTermBody ++ "\n" ++
  hostModuleCheckLlvmTypesTextTermSkeletonSuffix

/-- E-bad PE81: LLVM Types text residual-free claimed true.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText, ILL-TYPED-TERM. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText : String :=
  packageEnvMultThroughS34ForS35 ++
  packageEnvModuleSection "SystemsLean.LlvmTypesText"
    packageEnvLlvmTypesTextTermBodyBadResidual

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckPackageEnvFixturesS30Source (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS30SourceReady : Bool :=
  liveRel == "HostModuleCheckPackageEnvFixturesS30.lean"
    && kernelCheckLiveHostModuleCheckPackageEnvFixturesS30Source liveHostModuleCheckPackageEnvFixturesS30Source

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvFixturesS30Source then
    throw (IO.userError "dual-pin mismatch HostModuleCheckPackageEnvFixturesS30.lean")
  let k := kernelCheckLiveHostModuleCheckPackageEnvFixturesS30Source disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvFixturesS30 parse false")
  unless hostFrontLiveHostModuleCheckPackageEnvFixturesS30SourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS30Source
