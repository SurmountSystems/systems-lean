/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphMods.lean bytes, second half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphModsSource01. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostImportGraphMods.lean only, second half.
  Do not steal HostFrontLiveHostImportGraphModel (liveRel is
  HostImportGraphModel.lean).
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-IMPORT-GRAPH-MODS,
  liveHostImportGraphModsSource1, HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostImportGraphModsSource01
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostImportGraphMods

/-- Dual-pinned live HostImportGraphMods.lean bytes, second half.
    Concatenate liveHostImportGraphModsSource0 then liveHostImportGraphModsSource1
    before parse. Greppable: liveHostImportGraphModsSource1,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS. -/
def liveHostImportGraphModsSource1 : String := r#"/-- ParityLinear freestanding path (KernelLinear + ParityMult).
    Greppable: parityLinearMod. -/
def parityLinearMod : RealMod :=
  { name := "SystemsLean.ParityLinear"
    imports :=
      ["SystemsLean.KernelLinear", "SystemsLean.ParityMult"] }

/-- ParityLinearTheorems companion (same deps + ParityLinear; namespace ParityLinear).
    Greppable: parityLinearTheoremsMod. -/
def parityLinearTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityLinearTheorems"
    imports :=
      ["SystemsLean.KernelLinear", "SystemsLean.ParityMult",
       "SystemsLean.ParityLinear"] }

/-- ParityTypes freestanding path (KernelTypes + ParityLinear).
    Greppable: parityTypesMod. -/
def parityTypesMod : RealMod :=
  { name := "SystemsLean.ParityTypes"
    imports :=
      ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear"] }

/-- ParityTypesTheorems companion (same deps + ParityTypes; namespace ParityTypes).
    Greppable: parityTypesTheoremsMod. -/
def parityTypesTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityTypesTheorems"
    imports :=
      ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear",
       "SystemsLean.ParityTypes"] }

/-- ParityProgram freestanding path (KernelProgram + ParityTypes).
    Greppable: parityProgramMod. -/
def parityProgramMod : RealMod :=
  { name := "SystemsLean.ParityProgram"
    imports :=
      ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes"] }

/-- ParityProgramTheorems companion (same deps + ParityProgram; namespace ParityProgram).
    Greppable: parityProgramTheoremsMod. -/
def parityProgramTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityProgramTheorems"
    imports :=
      ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes",
       "SystemsLean.ParityProgram"] }

/-- ParityEmit freestanding path (KernelEmit + ParityProgram + EmitMult).
    Greppable: parityEmitMod. -/
def parityEmitMod : RealMod :=
  { name := "SystemsLean.ParityEmit"
    imports :=
      ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
       "SystemsLean.EmitMult"] }

/-- ParityEmitTheorems companion (same deps + ParityEmit; namespace ParityEmit).
    Greppable: parityEmitTheoremsMod. -/
def parityEmitTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityEmitTheorems"
    imports :=
      ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
       "SystemsLean.EmitMult", "SystemsLean.ParityEmit"] }

/-- SelfApply host structural SH5 path (ParityMult + KernelLinear + KernelTypes +
    KernelProgram + KernelEmit). Not freestanding product (that is SelfApplyFs).
    Greppable: selfApplyMod. -/
def selfApplyMod : RealMod :=
  { name := "SystemsLean.SelfApply"
    imports :=
      ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
       "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
       "SystemsLean.KernelEmit"] }

/-- SelfApplyTheorems companion (same deps + SelfApply; namespace SelfApply).
    Greppable: selfApplyTheoremsMod. -/
def selfApplyTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfApplyTheorems"
    imports :=
      ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
       "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
       "SystemsLean.KernelEmit", "SystemsLean.SelfApply"] }

/-- EmitLinear product shell (imports EmitLinearScaffold only).
    Greppable: emitLinearMod. -/
def emitLinearMod : RealMod :=
  { name := "SystemsLean.EmitLinear"
    imports := ["SystemsLean.EmitLinearScaffold"] }

/-- EmitTypes product shell (imports EmitTypesScaffold only).
    Greppable: emitTypesMod. -/
def emitTypesMod : RealMod :=
  { name := "SystemsLean.EmitTypes"
    imports := ["SystemsLean.EmitTypesScaffold"] }

/-- EmitProgram product shell (imports EmitProgramScaffold only).
    Greppable: emitProgramMod. -/
def emitProgramMod : RealMod :=
  { name := "SystemsLean.EmitProgram"
    imports := ["SystemsLean.EmitProgramScaffold"] }

/-- EmitGraph product shell (imports EmitGraphScaffold only).
    Greppable: emitGraphMod. -/
def emitGraphMod : RealMod :=
  { name := "SystemsLean.EmitGraph"
    imports := ["SystemsLean.EmitGraphScaffold"] }

/-- EmitCompose product shell (imports EmitComposeScaffold only).
    Greppable: emitComposeMod. -/
def emitComposeMod : RealMod :=
  { name := "SystemsLean.EmitCompose"
    imports := ["SystemsLean.EmitComposeScaffold"] }

/-- EmitErasure product shell (imports EmitErasureScaffold only).
    Greppable: emitErasureMod. -/
def emitErasureMod : RealMod :=
  { name := "SystemsLean.EmitErasure"
    imports := ["SystemsLean.EmitErasureScaffold"] }

/-- EmitExtract product shell (imports EmitExtractScaffold only).
    Greppable: emitExtractMod. -/
def emitExtractMod : RealMod :=
  { name := "SystemsLean.EmitExtract"
    imports := ["SystemsLean.EmitExtractScaffold"] }

/-- EmitBanner product shell (imports EmitBannerScaffold only).
    Greppable: emitBannerMod. -/
def emitBannerMod : RealMod :=
  { name := "SystemsLean.EmitBanner"
    imports := ["SystemsLean.EmitBannerScaffold"] }

/-- ProductOutKernel leaf (SelfApplyFs direct dep; no package imports).
    Greppable: productOutKernelMod. -/
def productOutKernelMod : RealMod :=
  { name := "SystemsLean.ProductOutKernel", imports := [] }

/-- ProductOutKernelTheorems (imports ProductOutKernel only).
    Greppable: productOutKernelTheoremsMod. -/
def productOutKernelTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductOutKernelTheorems"
    imports := ["SystemsLean.ProductOutKernel"] }

/-- BootstrapHonesty leaf (SelfApplyFs direct dep; no package imports).
    Greppable: bootstrapHonestyMod. -/
def bootstrapHonestyMod : RealMod :=
  { name := "SystemsLean.BootstrapHonesty", imports := [] }

/-- BootstrapHonestyTheorems (imports BootstrapHonesty only).
    Greppable: bootstrapHonestyTheoremsMod. -/
def bootstrapHonestyTheoremsMod : RealMod :=
  { name := "SystemsLean.BootstrapHonestyTheorems"
    imports := ["SystemsLean.BootstrapHonesty"] }

/-- ProductPathWriterSurface leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterSurfaceMod. -/
def productPathWriterSurfaceMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterSurface", imports := [] }

/-- ProductPathWriterSurfaceTheorems (imports ProductPathWriterSurface only).
    Greppable: productPathWriterSurfaceTheoremsMod. -/
def productPathWriterSurfaceTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterSurfaceTheorems"
    imports := ["SystemsLean.ProductPathWriterSurface"] }

/-- ProductPathWriterPathPlan leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathPlanMod. -/
def productPathWriterPathPlanMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathPlan", imports := [] }

/-- ProductPathWriterPathPlanTheorems (imports ProductPathWriterPathPlan only).
    Greppable: productPathWriterPathPlanTheoremsMod. -/
def productPathWriterPathPlanTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathPlanTheorems"
    imports := ["SystemsLean.ProductPathWriterPathPlan"] }

/-- ProductPathWriterPathExec leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathExecMod. -/
def productPathWriterPathExecMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathExec", imports := [] }

/-- ProductPathWriterPathExecTheorems (imports ProductPathWriterPathExec only).
    Greppable: productPathWriterPathExecTheoremsMod. -/
def productPathWriterPathExecTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathExecTheorems"
    imports := ["SystemsLean.ProductPathWriterPathExec"] }

/-- ProductPathOwnershipInputs leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathOwnershipInputsMod. -/
def productPathOwnershipInputsMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipInputs", imports := [] }

/-- ProductPathOwnershipInputsTheorems (imports ProductPathOwnershipInputs only).
    Greppable: productPathOwnershipInputsTheoremsMod. -/
def productPathOwnershipInputsTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipInputsTheorems"
    imports := ["SystemsLean.ProductPathOwnershipInputs"] }

/-- ProductPathPerform leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformMod. -/
def productPathPerformMod : RealMod :=
  { name := "SystemsLean.ProductPathPerform", imports := [] }

/-- ProductPathPerformTheorems (imports ProductPathPerform only).
    Greppable: productPathPerformTheoremsMod. -/
def productPathPerformTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformTheorems"
    imports := ["SystemsLean.ProductPathPerform"] }

/-- ProductPathPerformStep leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformStepMod. -/
def productPathPerformStepMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformStep", imports := [] }

/-- ProductPathPerformStepTheorems (imports ProductPathPerformStep only).
    Greppable: productPathPerformStepTheoremsMod. -/
def productPathPerformStepTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformStepTheorems"
    imports := ["SystemsLean.ProductPathPerformStep"] }

/-- ProductPathReadSsot leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathReadSsotMod. -/
def productPathReadSsotMod : RealMod :=
  { name := "SystemsLean.ProductPathReadSsot", imports := [] }

/-- ProductPathReadSsotTheorems (imports ProductPathReadSsot only).
    Greppable: productPathReadSsotTheoremsMod. -/
def productPathReadSsotTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathReadSsotTheorems"
    imports := ["SystemsLean.ProductPathReadSsot"] }

/-- ProductPathComposePlan leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathComposePlanMod. -/
def productPathComposePlanMod : RealMod :=
  { name := "SystemsLean.ProductPathComposePlan", imports := [] }

/-- ProductPathComposePlanTheorems (imports ProductPathComposePlan only).
    Greppable: productPathComposePlanTheoremsMod. -/
def productPathComposePlanTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathComposePlanTheorems"
    imports := ["SystemsLean.ProductPathComposePlan"] }

/-- Capable leaf (SelfApplyFs freestanding-capable gap pure leaf).
    Greppable: capableMod. -/
def capableMod : RealMod :=
  { name := "SystemsLean.Capable", imports := [] }

/-- CapableTheorems (imports Capable only).
    Greppable: capableTheoremsMod. -/
def capableTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableTheorems"
    imports := ["SystemsLean.Capable"] }

/-- CapableStepContract leaf (SelfApplyFs pure leaf).
    Greppable: capableStepContractMod. -/
def capableStepContractMod : RealMod :=
  { name := "SystemsLean.CapableStepContract", imports := [] }

/-- CapableStepContractTheorems (imports CapableStepContract only).
    Greppable: capableStepContractTheoremsMod. -/
def capableStepContractTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableStepContractTheorems"
    imports := ["SystemsLean.CapableStepContract"] }

/-- InstallOut leaf (SelfApplyFs pure leaf).
    Greppable: installOutMod. -/
def installOutMod : RealMod :=
  { name := "SystemsLean.InstallOut", imports := [] }

/-- InstallOutTheorems (imports InstallOut only).
    Greppable: installOutTheoremsMod. -/
def installOutTheoremsMod : RealMod :=
  { name := "SystemsLean.InstallOutTheorems"
    imports := ["SystemsLean.InstallOut"] }

/-- OfficialPath leaf (SelfApplyFs pure leaf).
    Greppable: officialPathMod. -/
def officialPathMod : RealMod :=
  { name := "SystemsLean.OfficialPath", imports := [] }

/-- OfficialPathTheorems (imports OfficialPath only).
    Greppable: officialPathTheoremsMod. -/
def officialPathTheoremsMod : RealMod :=
  { name := "SystemsLean.OfficialPathTheorems"
    imports := ["SystemsLean.OfficialPath"] }

/-- PerformEvidence leaf (SelfApplyFs pure leaf).
    Greppable: performEvidenceMod. -/
def performEvidenceMod : RealMod :=
  { name := "SystemsLean.PerformEvidence", imports := [] }

/-- PerformEvidenceTheorems (imports PerformEvidence only).
    Greppable: performEvidenceTheoremsMod. -/
def performEvidenceTheoremsMod : RealMod :=
  { name := "SystemsLean.PerformEvidenceTheorems"
    imports := ["SystemsLean.PerformEvidence"] }

/-- CapableRead leaf (SelfApplyFs pure leaf).
    Greppable: capableReadMod. -/
def capableReadMod : RealMod :=
  { name := "SystemsLean.CapableRead", imports := [] }

/-- CapableReadTheorems (imports CapableRead only).
    Greppable: capableReadTheoremsMod. -/
def capableReadTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableReadTheorems"
    imports := ["SystemsLean.CapableRead"] }

/-- CapableCompose leaf (SelfApplyFs pure leaf).
    Greppable: capableComposeMod. -/
def capableComposeMod : RealMod :=
  { name := "SystemsLean.CapableCompose", imports := [] }

/-- CapableComposeTheorems (imports CapableCompose only).
    Greppable: capableComposeTheoremsMod. -/
def capableComposeTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableComposeTheorems"
    imports := ["SystemsLean.CapableCompose"] }

/-- CapableFullBar leaf (SelfApplyFs pure leaf).
    Greppable: capableFullBarMod. -/
def capableFullBarMod : RealMod :=
  { name := "SystemsLean.CapableFullBar", imports := [] }

/-- CapableFullBarTheorems (imports CapableFullBar only).
    Greppable: capableFullBarTheoremsMod. -/
def capableFullBarTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableFullBarTheorems"
    imports := ["SystemsLean.CapableFullBar"] }

/-- DualEqWriteCapableGap leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteCapableGapMod. -/
def dualEqWriteCapableGapMod : RealMod :=
  { name := "SystemsLean.DualEqWriteCapableGap", imports := [] }

/-- DualEqWriteCapableGapTheorems (imports DualEqWriteCapableGap only).
    Greppable: dualEqWriteCapableGapTheoremsMod. -/
def dualEqWriteCapableGapTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteCapableGapTheorems"
    imports := ["SystemsLean.DualEqWriteCapableGap"] }

/-- DualEqWriteClosePath leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteClosePathMod. -/
def dualEqWriteClosePathMod : RealMod :=
  { name := "SystemsLean.DualEqWriteClosePath", imports := [] }

/-- DualEqWriteClosePathTheorems (imports DualEqWriteClosePath only).
    Greppable: dualEqWriteClosePathTheoremsMod. -/
def dualEqWriteClosePathTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteClosePathTheorems"
    imports := ["SystemsLean.DualEqWriteClosePath"] }

/-- DualEqWriteParity leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteParityMod. -/
def dualEqWriteParityMod : RealMod :=
  { name := "SystemsLean.DualEqWriteParity", imports := [] }

/-- DualEqWriteParityTheorems (imports DualEqWriteParity only).
    Greppable: dualEqWriteParityTheoremsMod. -/
def dualEqWriteParityTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteParityTheorems"
    imports := ["SystemsLean.DualEqWriteParity"] }


/-- OfficialRetire leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: officialRetireMod. -/
def officialRetireMod : RealMod :=
  { name := "SystemsLean.OfficialRetire", imports := [] }

/-- OfficialRetireTheorems (imports OfficialRetire only).
    Greppable: officialRetireTheoremsMod. -/
def officialRetireTheoremsMod : RealMod :=
  { name := "SystemsLean.OfficialRetireTheorems"
    imports := ["SystemsLean.OfficialRetire"] }

/-- OwnershipClaimed leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: ownershipClaimedMod. -/
def ownershipClaimedMod : RealMod :=
  { name := "SystemsLean.OwnershipClaimed", imports := [] }

/-- OwnershipClaimedTheorems (imports OwnershipClaimed only).
    Greppable: ownershipClaimedTheoremsMod. -/
def ownershipClaimedTheoremsMod : RealMod :=
  { name := "SystemsLean.OwnershipClaimedTheorems"
    imports := ["SystemsLean.OwnershipClaimed"] }

/-- PerformClaimed leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: performClaimedMod. -/
def performClaimedMod : RealMod :=
  { name := "SystemsLean.PerformClaimed", imports := [] }

/-- PerformClaimedTheorems (imports PerformClaimed only).
    Greppable: performClaimedTheoremsMod. -/
def performClaimedTheoremsMod : RealMod :=
  { name := "SystemsLean.PerformClaimedTheorems"
    imports := ["SystemsLean.PerformClaimed"] }

/-- StepContractFull leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: stepContractFullMod. -/
def stepContractFullMod : RealMod :=
  { name := "SystemsLean.StepContractFull", imports := [] }

/-- StepContractFullTheorems (imports StepContractFull only).
    Greppable: stepContractFullTheoremsMod. -/
def stepContractFullTheoremsMod : RealMod :=
  { name := "SystemsLean.StepContractFullTheorems"
    imports := ["SystemsLean.StepContractFull"] }
end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveHostImportGraphMods
