/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckAccepts.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckAcceptsSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap parses HostModuleCheckAccepts.lean only.
  Do not retarget HostFrontLiveHostModuleCheck. That checker parses
  HostModuleCheck.lean only.
  Do not wrap the AcceptsGoods or AcceptsLater product files.
  Unique needles (trailing newline so HostFrontLiveHostModuleCheckAccepts
  is not a prefix of a longer checker name):
  HostFrontLiveHostModuleCheckAcceptsSource
  HostFrontLiveHostModuleCheckAccepts
  PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-ACCEPTS
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_ACCEPTS_V0
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckAcceptsSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckAcceptsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckAccepts

/-- Dual-pinned live HostModuleCheckAccepts.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckAcceptsSource, PARSE-LIVE-HOST-MODULE-CHECK-ACCEPTS. -/
def liveHostModuleCheckAcceptsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck dual-pinned accept results tip.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: early good accepts live in HostModuleCheckAcceptsGoods.
  Fail-closed bads and Mult..Extract TERM/PROOF twins live in
  HostModuleCheckAcceptsLater. This tip keeps OfficialRetire..SpecProofTheorems
  goods. Same namespace SystemsLean.HostModuleCheck.

  Spec (readable):
  - hostModuleCheckGood* accepts for later seed modules.
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.

  Intentional non-claims:
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckAccepts,
  HostModuleCheckAcceptsLater, hostModuleCheckGoodOfficialRetire,
  hostModuleCheckGoodHostCheck, PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckAccepts
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckAccepts;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckAcceptsGoods
import SystemsLean.HostModuleCheckAcceptsLater
import SystemsLean.HostModuleCheckSpecProofTerm
import SystemsLean.HostModuleCheckDualResidualTerm
import SystemsLean.HostModuleCheckFirstSurfaceTerm
import SystemsLean.HostModuleCheckLinearSubsetEmitTerm
import SystemsLean.HostModuleCheckTypesSubsetEmitTerm
import SystemsLean.HostModuleCheckProgramSubsetEmitTerm
import SystemsLean.HostModuleCheckGraphSubsetEmitTerm
import SystemsLean.HostModuleCheckComposeSubsetEmitTerm
import SystemsLean.HostModuleCheckErasureSubsetEmitTerm
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
import SystemsLean.HostModuleCheckHostGraphTerm
import SystemsLean.HostModuleCheckLlvmLinearTextTerm
import SystemsLean.HostModuleCheckMultFsWriteToolTerm
import SystemsLean.HostModuleCheckFrontMultPackageTerm
import SystemsLean.HostModuleCheckSubsetPackageJoinTerm
import SystemsLean.HostModuleCheckLlvmTypesTextTerm
import SystemsLean.HostModuleCheckMultFsDeepenTerm
import SystemsLean.HostModuleCheckHostPackageWriteTerm
import SystemsLean.HostModuleCheckLlvmProgramTextTerm
import SystemsLean.HostModuleCheckLlvmGraphTextTerm
import SystemsLean.HostModuleCheckLlvmComposeTextTerm
import SystemsLean.HostModuleCheckSelfApplyFsTerm
import SystemsLean.HostModuleCheckInventoryCloseTerm
import SystemsLean.HostModuleCheckProductPathBarsTerm
import SystemsLean.HostModuleCheckProductPathTerm
import SystemsLean.HostModuleCheckProbeWireTerm
import SystemsLean.HostModuleCheckSelfHostBodyTerm

namespace SystemsLean.HostModuleCheck

/-- Good OfficialRetire accepts.
    Greppable: hostModuleCheckGoodOfficialRetire. -/
def hostModuleCheckGoodOfficialRetire : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialRetire"
    hostModuleCheckGoodOfficialRetireText

/-- Good OfficialRetireTheorems accepts.
    Greppable: hostModuleCheckGoodOfficialRetireTheorems. -/
def hostModuleCheckGoodOfficialRetireTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialRetireTheorems"
    hostModuleCheckGoodOfficialRetireTheoremsText

/-- Good OwnershipClaimed accepts.
    Greppable: hostModuleCheckGoodOwnershipClaimed. -/
def hostModuleCheckGoodOwnershipClaimed : ModuleCheckResult :=
  checkRealModule "SystemsLean.OwnershipClaimed"
    hostModuleCheckGoodOwnershipClaimedText

/-- Good OwnershipClaimedTheorems accepts.
    Greppable: hostModuleCheckGoodOwnershipClaimedTheorems. -/
def hostModuleCheckGoodOwnershipClaimedTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.OwnershipClaimedTheorems"
    hostModuleCheckGoodOwnershipClaimedTheoremsText

/-- Good PerformClaimed accepts.
    Greppable: hostModuleCheckGoodPerformClaimed. -/
def hostModuleCheckGoodPerformClaimed : ModuleCheckResult :=
  checkRealModule "SystemsLean.PerformClaimed"
    hostModuleCheckGoodPerformClaimedText

/-- Good PerformClaimedTheorems accepts.
    Greppable: hostModuleCheckGoodPerformClaimedTheorems. -/
def hostModuleCheckGoodPerformClaimedTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.PerformClaimedTheorems"
    hostModuleCheckGoodPerformClaimedTheoremsText

/-- Good StepContractFull accepts.
    Greppable: hostModuleCheckGoodStepContractFull. -/
def hostModuleCheckGoodStepContractFull : ModuleCheckResult :=
  checkRealModule "SystemsLean.StepContractFull"
    hostModuleCheckGoodStepContractFullText

/-- Good StepContractFullTheorems accepts.
    Greppable: hostModuleCheckGoodStepContractFullTheorems. -/
def hostModuleCheckGoodStepContractFullTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.StepContractFullTheorems"
    hostModuleCheckGoodStepContractFullTheoremsText

/-- Good SelfHostComplete accepts.
    Greppable: hostModuleCheckGoodSelfHostComplete. -/
def hostModuleCheckGoodSelfHostComplete : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostComplete"
    hostModuleCheckGoodSelfHostCompleteText

/-- Good SelfHostCompleteTheorems accepts.
    Greppable: hostModuleCheckGoodSelfHostCompleteTheorems. -/
def hostModuleCheckGoodSelfHostCompleteTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostCompleteTheorems"
    hostModuleCheckGoodSelfHostCompleteTheoremsText

/-- Good OfficialPathAlternate accepts.
    Greppable: hostModuleCheckGoodOfficialPathAlternate. -/
def hostModuleCheckGoodOfficialPathAlternate : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialPathAlternate"
    hostModuleCheckGoodOfficialPathAlternateText

/-- Good OfficialPathAlternateTheorems accepts.
    Greppable: hostModuleCheckGoodOfficialPathAlternateTheorems. -/
def hostModuleCheckGoodOfficialPathAlternateTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.OfficialPathAlternateTheorems"
    hostModuleCheckGoodOfficialPathAlternateTheoremsText

/-- Good ProductPathOwnershipRegenerate accepts.
    Greppable: hostModuleCheckGoodProductPathOwnershipRegenerate. -/
def hostModuleCheckGoodProductPathOwnershipRegenerate : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathOwnershipRegenerate"
    hostModuleCheckGoodProductPathOwnershipRegenerateText

/-- Good ProductPathOwnershipRegenerateTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathOwnershipRegenerateTheorems. -/
def hostModuleCheckGoodProductPathOwnershipRegenerateTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathOwnershipRegenerateTheorems"
    hostModuleCheckGoodProductPathOwnershipRegenerateTheoremsText

/-- Good CapableWriteHcLoad accepts.
    Greppable: hostModuleCheckGoodCapableWriteHcLoad. -/
def hostModuleCheckGoodCapableWriteHcLoad : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableWriteHcLoad"
    hostModuleCheckGoodCapableWriteHcLoadText

/-- Good DualEqWriteLoad accepts.
    Greppable: hostModuleCheckGoodDualEqWriteLoad. -/
def hostModuleCheckGoodDualEqWriteLoad : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteLoad"
    hostModuleCheckGoodDualEqWriteLoadText

/-- Good CapableWriteHc accepts.
    Greppable: hostModuleCheckGoodCapableWriteHc. -/
def hostModuleCheckGoodCapableWriteHc : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableWriteHc"
    hostModuleCheckGoodCapableWriteHcText

/-- Good DualEqWriteApi accepts.
    Greppable: hostModuleCheckGoodDualEqWriteApi. -/
def hostModuleCheckGoodDualEqWriteApi : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualEqWriteApi"
    hostModuleCheckGoodDualEqWriteApiText

/-- Good LlvmHold accepts.
    Greppable: hostModuleCheckGoodLlvmHold. -/
def hostModuleCheckGoodLlvmHold : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmHold" hostModuleCheckGoodLlvmHoldText

/-- Good LlvmHoldTheorems accepts.
    Greppable: hostModuleCheckGoodLlvmHoldTheorems. -/
def hostModuleCheckGoodLlvmHoldTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmHoldTheorems"
    hostModuleCheckGoodLlvmHoldTheoremsText

/-- Good CapableRegenerate accepts.
    Greppable: hostModuleCheckGoodCapableRegenerate. -/
def hostModuleCheckGoodCapableRegenerate : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableRegenerate"
    hostModuleCheckGoodCapableRegenerateText

/-- Good CapableRegenerateTheorems accepts.
    Greppable: hostModuleCheckGoodCapableRegenerateTheorems. -/
def hostModuleCheckGoodCapableRegenerateTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.CapableRegenerateTheorems"
    hostModuleCheckGoodCapableRegenerateTheoremsText

/-- Good FreestandingEmitLoad accepts.
    Greppable: hostModuleCheckGoodFreestandingEmitLoad. -/
def hostModuleCheckGoodFreestandingEmitLoad : ModuleCheckResult :=
  checkRealModule "SystemsLean.FreestandingEmitLoad"
    hostModuleCheckGoodFreestandingEmitLoadText

/-- Good FreestandingEmitLoadScaffold accepts.
    Greppable: hostModuleCheckGoodFreestandingEmitLoadScaffold. -/
def hostModuleCheckGoodFreestandingEmitLoadScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.FreestandingEmitLoadScaffold"
    hostModuleCheckGoodFreestandingEmitLoadScaffoldText

/-- Good LakeRetireInventory accepts.
    Greppable: hostModuleCheckGoodLakeRetireInventory. -/
def hostModuleCheckGoodLakeRetireInventory : ModuleCheckResult :=
  checkRealModule "SystemsLean.LakeRetireInventory"
    hostModuleCheckGoodLakeRetireInventoryText

/-- Good HostPackageRoots accepts.
    Greppable: hostModuleCheckGoodHostPackageRoots. -/
def hostModuleCheckGoodHostPackageRoots : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostPackageRoots"
    hostModuleCheckGoodHostPackageRootsText

/-- Good FreestandingEmit accepts.
    Greppable: hostModuleCheckGoodFreestandingEmit. -/
def hostModuleCheckGoodFreestandingEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.FreestandingEmit"
    hostModuleCheckGoodFreestandingEmitText

/-- Good ProductPathWriteHc accepts.
    Greppable: hostModuleCheckGoodProductPathWriteHc. -/
def hostModuleCheckGoodProductPathWriteHc : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriteHc"
    hostModuleCheckGoodProductPathWriteHcText

/-- Good ProductPathWriteHcTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriteHcTheorems. -/
def hostModuleCheckGoodProductPathWriteHcTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriteHcTheorems"
    hostModuleCheckGoodProductPathWriteHcTheoremsText

/-- Good CompilePathMult accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathMult. -/
def hostModuleCheckGoodCompilePathMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathMult"
    hostModuleCheckGoodCompilePathMultTermText

/-- Good CompilePathLinear accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathLinear. -/
def hostModuleCheckGoodCompilePathLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathLinear"
    hostModuleCheckGoodCompilePathLinearTermText

/-- Good CompilePathTypes accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathTypes. -/
def hostModuleCheckGoodCompilePathTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathTypes"
    hostModuleCheckGoodCompilePathTypesTermText

/-- Good CompilePathProgram accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathProgram. -/
def hostModuleCheckGoodCompilePathProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathProgram"
    hostModuleCheckGoodCompilePathProgramTermText

/-- Good CompilePathGraph accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathGraph. -/
def hostModuleCheckGoodCompilePathGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathGraph"
    hostModuleCheckGoodCompilePathGraphTermText

/-- Good CompilePathCompose accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathCompose. -/
def hostModuleCheckGoodCompilePathCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathCompose"
    hostModuleCheckGoodCompilePathComposeTermText

/-- Good CompilePathPlan accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathPlan. -/
def hostModuleCheckGoodCompilePathPlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathPlan"
    hostModuleCheckGoodCompilePathPlanTermText

/-- Good CompilePathApply accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathApply. -/
def hostModuleCheckGoodCompilePathApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathApply"
    hostModuleCheckGoodCompilePathApplyTermText

/-- Good CompilePathBody accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathBody. -/
def hostModuleCheckGoodCompilePathBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathBody"
    hostModuleCheckGoodCompilePathBodyTermText

/-- Good CompilePathErasure accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathErasure. -/
def hostModuleCheckGoodCompilePathErasure : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathErasure"
    hostModuleCheckGoodCompilePathErasureTermText

/-- Good CompilePathExtract accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodCompilePathExtract. -/
def hostModuleCheckGoodCompilePathExtract : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePathExtract"
    hostModuleCheckGoodCompilePathExtractTermText

/-- Good ProductWireWriteTool accepts.
    Greppable: hostModuleCheckGoodProductWireWriteTool. -/
def hostModuleCheckGoodProductWireWriteTool : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductWireWriteTool"
    hostModuleCheckGoodProductWireWriteToolText

/-- Good HostTerm accepts.
    Greppable: hostModuleCheckGoodHostTerm. -/
def hostModuleCheckGoodHostTerm : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostTerm"
    hostModuleCheckGoodHostTermText

/-- Good LlvmEmitPath accepts.
    Greppable: hostModuleCheckGoodLlvmEmitPath. -/
def hostModuleCheckGoodLlvmEmitPath : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmEmitPath"
    hostModuleCheckGoodLlvmEmitPathText

/-- Good SubsetFront accepts.
    Greppable: hostModuleCheckGoodSubsetFront. -/
def hostModuleCheckGoodSubsetFront : ModuleCheckResult :=
  checkRealModule "SystemsLean.SubsetFront"
    hostModuleCheckGoodSubsetFrontText

/-- Good FirstSurface accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodFirstSurface. -/
def hostModuleCheckGoodFirstSurface : ModuleCheckResult :=
  checkRealModule "SystemsLean.FirstSurface"
    hostModuleCheckGoodFirstSurfaceTermText

/-- Good LinearSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLinearSubsetEmit. -/
def hostModuleCheckGoodLinearSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearSubsetEmit"
    hostModuleCheckGoodLinearSubsetEmitTermText

/-- Good TypesSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodTypesSubsetEmit. -/
def hostModuleCheckGoodTypesSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesSubsetEmit"
    hostModuleCheckGoodTypesSubsetEmitTermText

/-- Good ProgramSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodProgramSubsetEmit. -/
def hostModuleCheckGoodProgramSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProgramSubsetEmit"
    hostModuleCheckGoodProgramSubsetEmitTermText

/-- Good GraphSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodGraphSubsetEmit. -/
def hostModuleCheckGoodGraphSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.GraphSubsetEmit"
    hostModuleCheckGoodGraphSubsetEmitTermText

/-- Good ComposeSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodComposeSubsetEmit. -/
def hostModuleCheckGoodComposeSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ComposeSubsetEmit"
    hostModuleCheckGoodComposeSubsetEmitTermText

/-- Good ErasureSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodErasureSubsetEmit. -/
def hostModuleCheckGoodErasureSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ErasureSubsetEmit"
    hostModuleCheckGoodErasureSubsetEmitTermText

/-- Good ExtractSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodExtractSubsetEmit. -/
def hostModuleCheckGoodExtractSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ExtractSubsetEmit"
    hostModuleCheckGoodExtractSubsetEmitTermText

/-- Good MultSubsetEmit accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodMultSubsetEmit. -/
def hostModuleCheckGoodMultSubsetEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultSubsetEmit"
    hostModuleCheckGoodMultSubsetEmitTermText

/-- Good MultSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodMultSubsetRebuild. -/
def hostModuleCheckGoodMultSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultSubsetRebuild"
    hostModuleCheckGoodMultSubsetRebuildTermText

/-- Good LinearSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLinearSubsetRebuild. -/
def hostModuleCheckGoodLinearSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearSubsetRebuild"
    hostModuleCheckGoodLinearSubsetRebuildTermText

/-- Good TypesSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodTypesSubsetRebuild. -/
def hostModuleCheckGoodTypesSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesSubsetRebuild"
    hostModuleCheckGoodTypesSubsetRebuildTermText

/-- Good ProgramSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodProgramSubsetRebuild. -/
def hostModuleCheckGoodProgramSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProgramSubsetRebuild"
    hostModuleCheckGoodProgramSubsetRebuildTermText

/-- Good GraphSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodGraphSubsetRebuild. -/
def hostModuleCheckGoodGraphSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.GraphSubsetRebuild"
    hostModuleCheckGoodGraphSubsetRebuildTermText

/-- Good ComposeSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodComposeSubsetRebuild. -/
def hostModuleCheckGoodComposeSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.ComposeSubsetRebuild"
    hostModuleCheckGoodComposeSubsetRebuildTermText

/-- Good ErasureSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodErasureSubsetRebuild. -/
def hostModuleCheckGoodErasureSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.ErasureSubsetRebuild"
    hostModuleCheckGoodErasureSubsetRebuildTermText

/-- Good ExtractSubsetRebuild accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodExtractSubsetRebuild. -/
def hostModuleCheckGoodExtractSubsetRebuild : ModuleCheckResult :=
  checkRealModule "SystemsLean.ExtractSubsetRebuild"
    hostModuleCheckGoodExtractSubsetRebuildTermText

/-- Good HostFront accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodHostFront. -/
def hostModuleCheckGoodHostFront : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostFront"
    hostModuleCheckGoodHostFrontTermText

/-- Good LlvmMultText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmMultText. -/
def hostModuleCheckGoodLlvmMultText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmMultText"
    hostModuleCheckGoodLlvmMultTextTermText

/-- Good HostFrontTheorems accepts.
    Greppable: hostModuleCheckGoodHostFrontTheorems. -/
def hostModuleCheckGoodHostFrontTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostFrontTheorems"
    hostModuleCheckGoodHostFrontTheoremsText

/-- Good HostCheck accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodHostCheck. -/
def hostModuleCheckGoodHostCheck : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCheck"
    hostModuleCheckGoodHostCheckTermText

/-- Good HostGraph accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodHostGraph. -/
def hostModuleCheckGoodHostGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostGraph"
    hostModuleCheckGoodHostGraphTermText

/-- Good LlvmLinearText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmLinearText. -/
def hostModuleCheckGoodLlvmLinearText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmLinearText"
    hostModuleCheckGoodLlvmLinearTextTermText

/-- Good MultFsWriteTool accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodMultFsWriteTool. -/
def hostModuleCheckGoodMultFsWriteTool : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultFsWriteTool"
    hostModuleCheckGoodMultFsWriteToolTermText

/-- Good FrontMultPackage accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodFrontMultPackage. -/
def hostModuleCheckGoodFrontMultPackage : ModuleCheckResult :=
  checkRealModule "SystemsLean.FrontMultPackage"
    hostModuleCheckGoodFrontMultPackageTermText

/-- Good SubsetPackageJoin accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodSubsetPackageJoin. -/
def hostModuleCheckGoodSubsetPackageJoin : ModuleCheckResult :=
  checkRealModule "SystemsLean.SubsetPackageJoin"
    hostModuleCheckGoodSubsetPackageJoinTermText

/-- Good HostGraphTheorems accepts.
    Greppable: hostModuleCheckGoodHostGraphTheorems. -/
def hostModuleCheckGoodHostGraphTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostGraphTheorems"
    hostModuleCheckGoodHostGraphTheoremsText

/-- Good LlvmTypesText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmTypesText. -/
def hostModuleCheckGoodLlvmTypesText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmTypesText"
    hostModuleCheckGoodLlvmTypesTextTermText

/-- Good MultFsDeepen accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodMultFsDeepen. -/
def hostModuleCheckGoodMultFsDeepen : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultFsDeepen"
    hostModuleCheckGoodMultFsDeepenTermText

/-- Good HostPackageWrite accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodHostPackageWrite. -/
def hostModuleCheckGoodHostPackageWrite : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostPackageWrite"
    hostModuleCheckGoodHostPackageWriteTermText

/-- Good HostPackageWriteTheorems accepts.
    Greppable: hostModuleCheckGoodHostPackageWriteTheorems. -/
def hostModuleCheckGoodHostPackageWriteTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostPackageWriteTheorems"
    hostModuleCheckGoodHostPackageWriteTheoremsText

/-- Good LlvmProgramText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmProgramText. -/
def hostModuleCheckGoodLlvmProgramText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmProgramText"
    hostModuleCheckGoodLlvmProgramTextTermText

/-- Good LlvmGraphText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmGraphText. -/
def hostModuleCheckGoodLlvmGraphText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmGraphText"
    hostModuleCheckGoodLlvmGraphTextTermText

/-- Good LlvmComposeText accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodLlvmComposeText. -/
def hostModuleCheckGoodLlvmComposeText : ModuleCheckResult :=
  checkRealModule "SystemsLean.LlvmComposeText"
    hostModuleCheckGoodLlvmComposeTextTermText

/-- Good SelfApplyFs accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodSelfApplyFs. -/
def hostModuleCheckGoodSelfApplyFs : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApplyFs"
    hostModuleCheckGoodSelfApplyFsTermText

/-- Good SelfApplyFsTheorems accepts.
    Greppable: hostModuleCheckGoodSelfApplyFsTheorems. -/
def hostModuleCheckGoodSelfApplyFsTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApplyFsTheorems"
    hostModuleCheckGoodSelfApplyFsTheoremsText

/-- Good InventoryClose accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodInventoryClose. -/
def hostModuleCheckGoodInventoryClose : ModuleCheckResult :=
  checkRealModule "SystemsLean.InventoryClose"
    hostModuleCheckGoodInventoryCloseTermText

/-- Good ProductPathBars accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodProductPathBars. -/
def hostModuleCheckGoodProductPathBars : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathBars"
    hostModuleCheckGoodProductPathBarsTermText

/-- Good InventoryCloseTheorems accepts.
    Greppable: hostModuleCheckGoodInventoryCloseTheorems. -/
def hostModuleCheckGoodInventoryCloseTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.InventoryCloseTheorems"
    hostModuleCheckGoodInventoryCloseTheoremsText

/-- Good ProductPath accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodProductPath. -/
def hostModuleCheckGoodProductPath : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPath"
    hostModuleCheckGoodProductPathTermText

/-- Good ProductPathTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathTheorems. -/
def hostModuleCheckGoodProductPathTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathTheorems"
    hostModuleCheckGoodProductPathTheoremsText

/-- Good DualResidual accepts (leftover TERM text; dialect after L0/L1).
    Greppable: hostModuleCheckGoodDualResidual. -/
def hostModuleCheckGoodDualResidual : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualResidual"
    hostModuleCheckGoodDualResidualTermText

/-- Good DualResidualTheorems accepts.
    Greppable: hostModuleCheckGoodDualResidualTheorems. -/
def hostModuleCheckGoodDualResidualTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.DualResidualTheorems"
    hostModuleCheckGoodDualResidualTheoremsText

/-- Good ProbeWire accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodProbeWire. -/
def hostModuleCheckGoodProbeWire : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProbeWire"
    hostModuleCheckGoodProbeWireTermText

/-- Good SelfHostBody accepts (TERM-SURFACE dialect bodies; not L0 stubs).
    Greppable: hostModuleCheckGoodSelfHostBody. -/
def hostModuleCheckGoodSelfHostBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostBody"
    hostModuleCheckGoodSelfHostBodyTermText

/-- Good ProbeWireTheorems accepts.
    Greppable: hostModuleCheckGoodProbeWireTheorems. -/
def hostModuleCheckGoodProbeWireTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProbeWireTheorems"
    hostModuleCheckGoodProbeWireTheoremsText

/-- Good SelfHostBodyTheorems accepts.
    Greppable: hostModuleCheckGoodSelfHostBodyTheorems. -/
def hostModuleCheckGoodSelfHostBodyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostBodyTheorems"
    hostModuleCheckGoodSelfHostBodyTheoremsText

/-- Good SpecProof accepts (S6 TERM text; dialect after L0/L1).
    Greppable: hostModuleCheckGoodSpecProof. -/
def hostModuleCheckGoodSpecProof : ModuleCheckResult :=
  checkRealModule "SystemsLean.SpecProof"
    hostModuleCheckGoodSpecProofTermText

/-- Good SpecProofTheorems accepts.
    Greppable: hostModuleCheckGoodSpecProofTheorems. -/
def hostModuleCheckGoodSpecProofTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SpecProofTheorems"
    hostModuleCheckGoodSpecProofTheoremsText

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckAccepts
