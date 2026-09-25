/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphLoadOkLater.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphLoadOkLaterSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostImportGraphLoadOkLater.lean only.
  Do not steal HostFrontLiveHostImportGraphLoadOk (that liveRel is
  HostImportGraphLoadOk.lean). Do not steal occupancy leftover
  HostFrontLiveImportLoadOkLater. Do not steal HostFrontLiveHostImportGraph.
  Do not steal mill wrap HostFrontLiveHostImportGraphMain.
  Unique needles (each id is the whole line, so the shorter LoadOk id is not):
  HostFrontLiveHostImportGraphLoadOkLaterSource
  HostFrontLiveHostImportGraphLoadOkLater
  PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK-LATER
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-LOADOK-LATER
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_LOADOK_LATER_V0
  Greppable: SYSTEMS_LEAN_HOST, liveHostImportGraphLoadOkLaterSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostImportGraphLoadOkLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostImportGraphLoadOkLater

/-- Dual-pinned live HostImportGraphLoadOkLater.lean bytes (must match on-disk file).
    Greppable: liveHostImportGraphLoadOkLaterSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-LOADOK-LATER. -/
def liveHostImportGraphLoadOkLaterSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph LoadOk import-edge dual-pins.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel from SystemsLean.HostImportGraphLoadOk: per-module import edge
  checks for expand seed (multLeafMod..specProofTheoremsMod).
  Same namespace SystemsLean.HostImportGraph so names stay unqualified.
  Sub-1-KLOC: do not grow past 1000.

  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphLoadOkLater,
  hostImportGraphLoadOkImportEdges, HOST-IMPORT-GRAPH-WITHOUT-LAKE.
  Module: SystemsLean.HostImportGraphLoadOkLater
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphLoadOkLater; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphModsLater
namespace SystemsLean.HostImportGraph
/-- Expand-seed per-module import edge dual-pins (LoadOk later fold).
    Greppable: hostImportGraphLoadOkImportEdges, HostImportGraphLoadOkLater. -/
def hostImportGraphLoadOkImportEdges : Bool :=
  (multLeafMod.imports == [])
    && (multTheoremsMod.imports == ["SystemsLean.Mult"])
    && (linearLeafMod.imports == [])
    && (linearTheoremsMod.imports == ["SystemsLean.Linear"])
    && (typesMod.imports == ["SystemsLean.Mult"])
    && (typesTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.MultTheorems", "SystemsLean.Types"])
    && (irProgramMod.imports == ["SystemsLean.Types"])
    && (irProgramTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"])
    && (irGraphMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"])
    && (irGraphTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph"])
    && (erasureMod.imports == ["SystemsLean.Mult"])
    && (erasureTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure"])
    && (extractMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure"])
    && (extractTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure", "SystemsLean.Extract"])
    && (hostComposeMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
          "SystemsLean.Erasure", "SystemsLean.Extract"])
    && (hostComposeTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
          "SystemsLean.IrGraphTheorems", "SystemsLean.Erasure",
          "SystemsLean.ErasureTheorems", "SystemsLean.Extract",
          "SystemsLean.HostCompose"])
    && (compilePathMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.Extract"])
    && (kernelMultMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath"])
    && (kernelLinearMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.HostCompose", "SystemsLean.CompilePath"])
    && (kernelTypesMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath"])
    && (kernelProgramMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath"])
    && (kernelMultTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath", "SystemsLean.KernelMult"])
    && (kernelLinearTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.KernelLinear"])
    && (kernelTypesTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath", "SystemsLean.KernelTypes"])
    && (kernelProgramTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.KernelProgram"])
    && (joinMapMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath"])
    && (joinMapTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.Types",
          "SystemsLean.IrProgram", "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.JoinMap"])
    && (selfHostMod.imports
      == ["SystemsLean.IrProgram", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.JoinMap"])
    && (selfHostTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.JoinMap",
          "SystemsLean.SelfHost"])
    && (surfaceMatrixMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.JoinMap", "SystemsLean.SelfHost"])
    && (surfaceMatrixTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.JoinMap", "SystemsLean.SelfHost", "SystemsLean.SurfaceMatrix"])
    && (emitMultScaffoldMod.imports == ["SystemsLean.Mult"])
    && (emitLinearScaffoldMod.imports == [])
    && (emitTypesScaffoldMod.imports == [])
    && (emitProgramScaffoldMod.imports == [])
    && (emitGraphScaffoldMod.imports == [])
    && (emitComposeScaffoldMod.imports == [])
    && (emitPlanScaffoldMod.imports == [])
    && (emitApplyScaffoldMod.imports == [])
    && (emitBodyScaffoldMod.imports == [])
    && (emitErasureScaffoldMod.imports == [])
    && (emitExtractScaffoldMod.imports == [])
    && (emitBannerScaffoldMod.imports == [])
    && (kernelSelfApplyMod.imports == [])
    && (kernelSelfApplyTheoremsMod.imports == ["SystemsLean.KernelSelfApply"])
    && (emitMultMod.imports == ["SystemsLean.EmitMultScaffold"])
    && (emitPlanMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitPlanScaffold"])
    && (emitApplyMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitApplyScaffold"])
    && (emitBodyMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitPlan", "SystemsLean.EmitApply",
          "SystemsLean.EmitBodyScaffold"])
    && (kernelEmitMod.imports
      == ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
          "SystemsLean.KernelProgram"])
    && (kernelEmitTheoremsMod.imports
      == ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
          "SystemsLean.KernelProgram", "SystemsLean.KernelEmit"])
    && (parityMultMod.imports
      == ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult"])
    && (parityMultTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult",
          "SystemsLean.ParityMult"])
    && (parityLinearMod.imports
      == ["SystemsLean.KernelLinear", "SystemsLean.ParityMult"])
    && (parityLinearTheoremsMod.imports
      == ["SystemsLean.KernelLinear", "SystemsLean.ParityMult",
          "SystemsLean.ParityLinear"])
    && (parityTypesMod.imports
      == ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear"])
    && (parityTypesTheoremsMod.imports
      == ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear",
          "SystemsLean.ParityTypes"])
    && (parityProgramMod.imports
      == ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes"])
    && (parityProgramTheoremsMod.imports
      == ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes",
          "SystemsLean.ParityProgram"])
    && (parityEmitMod.imports
      == ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
          "SystemsLean.EmitMult"])
    && (parityEmitTheoremsMod.imports
      == ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
          "SystemsLean.EmitMult", "SystemsLean.ParityEmit"])
    && (selfApplyMod.imports
      == ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
          "SystemsLean.KernelEmit"])
    && (selfApplyTheoremsMod.imports
      == ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
          "SystemsLean.KernelEmit", "SystemsLean.SelfApply"])
    && (emitLinearMod.imports == ["SystemsLean.EmitLinearScaffold"])
    && (emitTypesMod.imports == ["SystemsLean.EmitTypesScaffold"])
    && (emitProgramMod.imports == ["SystemsLean.EmitProgramScaffold"])
    && (emitGraphMod.imports == ["SystemsLean.EmitGraphScaffold"])
    && (emitComposeMod.imports == ["SystemsLean.EmitComposeScaffold"])
    && (emitErasureMod.imports == ["SystemsLean.EmitErasureScaffold"])
    && (emitExtractMod.imports == ["SystemsLean.EmitExtractScaffold"])
    && (emitBannerMod.imports == ["SystemsLean.EmitBannerScaffold"])
    && (productOutKernelMod.imports == [])
    && (productOutKernelTheoremsMod.imports
      == ["SystemsLean.ProductOutKernel"])
    && (bootstrapHonestyMod.imports == [])
    && (bootstrapHonestyTheoremsMod.imports
      == ["SystemsLean.BootstrapHonesty"])
    && (productPathWriterSurfaceMod.imports == [])
    && (productPathWriterSurfaceTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterSurface"])
    && (productPathWriterPathPlanMod.imports == [])
    && (productPathWriterPathPlanTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterPathPlan"])
    && (productPathWriterPathExecMod.imports == [])
    && (productPathWriterPathExecTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterPathExec"])
    && (productPathOwnershipInputsMod.imports == [])
    && (productPathOwnershipInputsTheoremsMod.imports
      == ["SystemsLean.ProductPathOwnershipInputs"])
    && (productPathPerformMod.imports == [])
    && (productPathPerformTheoremsMod.imports
      == ["SystemsLean.ProductPathPerform"])
    && (productPathPerformStepMod.imports == [])
    && (productPathPerformStepTheoremsMod.imports
      == ["SystemsLean.ProductPathPerformStep"])
    && (productPathReadSsotMod.imports == [])
    && (productPathReadSsotTheoremsMod.imports
      == ["SystemsLean.ProductPathReadSsot"])
    && (productPathComposePlanMod.imports == [])
    && (productPathComposePlanTheoremsMod.imports
      == ["SystemsLean.ProductPathComposePlan"])
    && (capableMod.imports == [])
    && (capableTheoremsMod.imports
      == ["SystemsLean.Capable"])
    && (capableStepContractMod.imports == [])
    && (capableStepContractTheoremsMod.imports
      == ["SystemsLean.CapableStepContract"])
    && (installOutMod.imports == [])
    && (installOutTheoremsMod.imports
      == ["SystemsLean.InstallOut"])
    && (officialPathMod.imports == [])
    && (officialPathTheoremsMod.imports
      == ["SystemsLean.OfficialPath"])
    && (performEvidenceMod.imports == [])
    && (performEvidenceTheoremsMod.imports
      == ["SystemsLean.PerformEvidence"])
    && (capableReadMod.imports == [])
    && (capableReadTheoremsMod.imports
      == ["SystemsLean.CapableRead"])
    && (capableComposeMod.imports == [])
    && (capableComposeTheoremsMod.imports
      == ["SystemsLean.CapableCompose"])
    && (capableFullBarMod.imports == [])
    && (capableFullBarTheoremsMod.imports
      == ["SystemsLean.CapableFullBar"])
    && (dualEqWriteCapableGapMod.imports == [])
    && (dualEqWriteCapableGapTheoremsMod.imports
      == ["SystemsLean.DualEqWriteCapableGap"])
    && (dualEqWriteClosePathMod.imports == [])
    && (dualEqWriteClosePathTheoremsMod.imports
      == ["SystemsLean.DualEqWriteClosePath"])
    && (dualEqWriteParityMod.imports == [])
    && (dualEqWriteParityTheoremsMod.imports
      == ["SystemsLean.DualEqWriteParity"])
    && (officialRetireMod.imports == [])
    && (officialRetireTheoremsMod.imports
      == ["SystemsLean.OfficialRetire"])
    && (ownershipClaimedMod.imports == [])
    && (ownershipClaimedTheoremsMod.imports
      == ["SystemsLean.OwnershipClaimed"])
    && (performClaimedMod.imports == [])
    && (performClaimedTheoremsMod.imports
      == ["SystemsLean.PerformClaimed"])
    && (stepContractFullMod.imports == [])
    && (stepContractFullTheoremsMod.imports
      == ["SystemsLean.StepContractFull"])
    && (selfHostCompleteMod.imports == [])
    && (selfHostCompleteTheoremsMod.imports
      == ["SystemsLean.SelfHostComplete"])
    && (officialPathAlternateMod.imports == [])
    && (officialPathAlternateTheoremsMod.imports
      == ["SystemsLean.OfficialPathAlternate"])
    && (productPathOwnershipRegenerateMod.imports == [])
    && (productPathOwnershipRegenerateTheoremsMod.imports
      == ["SystemsLean.ProductPathOwnershipRegenerate"])
    && (capableWriteHcLoadMod.imports == emitProductStackImports)
    && (dualEqWriteLoadMod.imports == emitProductStackImports)
    && (capableWriteHcMod.imports
      == "SystemsLean.CapableWriteHcLoad" :: emitProductStackImports)
    && (dualEqWriteApiMod.imports
      == "SystemsLean.DualEqWriteLoad" :: emitProductStackImports)
    && (llvmHoldMod.imports == ["SystemsLean.SelfApply"])
    && (llvmHoldTheoremsMod.imports
      == ["SystemsLean.SelfApply", "SystemsLean.LlvmHold"])
    && (capableRegenerateMod.imports
      == ["SystemsLean.CapableRead", "SystemsLean.CapableCompose",
          "SystemsLean.CapableWriteHc", "SystemsLean.InstallOut"])
    && (capableRegenerateTheoremsMod.imports
      == ["SystemsLean.CapableRegenerate"])
    && (freestandingEmitLoadMod.imports == [])
    && (freestandingEmitLoadScaffoldMod.imports
      == ["SystemsLean.FreestandingEmitLoad"])
    && (lakeRetireInventoryMod.imports == [])
    && (hostPackageRootsMod.imports == [])
    && (freestandingEmitMod.imports
      == ["SystemsLean.FreestandingEmitLoad",
          "SystemsLean.FreestandingEmitLoadScaffold",
          "SystemsLean.EmitBanner",
          "SystemsLean.EmitMult",
          "SystemsLean.EmitLinear",
          "SystemsLean.EmitErasure",
          "SystemsLean.EmitExtract",
          "SystemsLean.EmitExtractScaffold",
          "SystemsLean.EmitTypes",
          "SystemsLean.EmitTypesScaffold",
          "SystemsLean.EmitProgram",
          "SystemsLean.EmitProgramScaffold",
          "SystemsLean.EmitGraph",
          "SystemsLean.EmitGraphScaffold",
          "SystemsLean.EmitCompose",
          "SystemsLean.EmitComposeScaffold",
          "SystemsLean.EmitPlan",
          "SystemsLean.EmitPlanScaffold",
          "SystemsLean.EmitApply",
          "SystemsLean.EmitApplyScaffold",
          "SystemsLean.EmitBody",
          "SystemsLean.EmitBodyScaffold"])
    && (productPathWriteHcMod.imports
      == ["SystemsLean.FreestandingEmit"])
    && (productPathWriteHcTheoremsMod.imports
      == ["SystemsLean.ProductPathWriteHc"])
    && (compilePathMultMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitMult"])
    && (compilePathLinearMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitLinear"])
    && (compilePathTypesMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitTypes"])
    && (compilePathProgramMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitProgram"])
    && (compilePathGraphMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitGraph"])
    && (compilePathComposeMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitCompose"])
    && (compilePathPlanMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitPlan",
          "SystemsLean.EmitPlanScaffold"])
    && (compilePathApplyMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitApply",
          "SystemsLean.EmitApplyScaffold"])
    && (compilePathBodyMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitBody",
          "SystemsLean.EmitBodyScaffold"])
    && (compilePathErasureMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.EmitErasure",
          "SystemsLean.Erasure"])
    && (compilePathExtractMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.CompilePathMult",
          "SystemsLean.CompilePathProgram"])
    && (productWireWriteToolMod.imports
      == ["SystemsLean.CapableWriteHc", "SystemsLean.InstallOut"])
    && (hostTermMod.imports == ["SystemsLean.Mult"])
    && (llvmEmitPathMod.imports == ["SystemsLean.LlvmHold"])
    && (subsetFrontMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.IrProgram",
          "SystemsLean.Types", "SystemsLean.Mult"])
    && (firstSurfaceMod.imports == ["SystemsLean.CompilePathMult"])
    && (linearSubsetEmitMod.imports
      == ["SystemsLean.CompilePathLinear", "SystemsLean.EmitLinear"])
    && (typesSubsetEmitMod.imports
      == ["SystemsLean.CompilePathTypes", "SystemsLean.EmitTypes"])
    && (programSubsetEmitMod.imports
      == ["SystemsLean.CompilePathProgram", "SystemsLean.EmitProgram"])
    && (graphSubsetEmitMod.imports
      == ["SystemsLean.CompilePathGraph", "SystemsLean.EmitGraph"])
    && (composeSubsetEmitMod.imports
      == ["SystemsLean.CompilePathCompose", "SystemsLean.EmitCompose"])
    && (erasureSubsetEmitMod.imports
      == ["SystemsLean.CompilePathErasure", "SystemsLean.EmitErasure"])
    && (extractSubsetEmitMod.imports
      == ["SystemsLean.CompilePathExtract", "SystemsLean.EmitExtract"])
    && (multSubsetEmitMod.imports
      == ["SystemsLean.FirstSurface", "SystemsLean.EmitMult"])
    && (multSubsetRebuildMod.imports == ["SystemsLean.MultSubsetEmit"])
    && (linearSubsetRebuildMod.imports == ["SystemsLean.LinearSubsetEmit"])
    && (typesSubsetRebuildMod.imports == ["SystemsLean.TypesSubsetEmit"])
    && (programSubsetRebuildMod.imports == ["SystemsLean.ProgramSubsetEmit"])
    && (graphSubsetRebuildMod.imports == ["SystemsLean.GraphSubsetEmit"])
    && (composeSubsetRebuildMod.imports == ["SystemsLean.ComposeSubsetEmit"])
    && (erasureSubsetRebuildMod.imports == ["SystemsLean.ErasureSubsetEmit"])
    && (extractSubsetRebuildMod.imports == ["SystemsLean.ExtractSubsetEmit"])
    && (hostFrontMod.imports
      == ["SystemsLean.HostTerm", "SystemsLean.Mult"])
    && (llvmMultTextMod.imports
      == ["SystemsLean.Mult", "SystemsLean.LlvmHold", "SystemsLean.LlvmEmitPath"])
    && (hostFrontTheoremsMod.imports == ["SystemsLean.HostFront"])
    && (hostCheckMod.imports == ["SystemsLean.HostFront"])
    && (hostGraphMod.imports
      == ["SystemsLean.HostFront", "SystemsLean.HostTerm"])
    && (llvmLinearTextMod.imports
      == ["SystemsLean.Linear", "SystemsLean.LlvmHold",
          "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText"])
    && (multFsWriteToolMod.imports == ["SystemsLean.MultSubsetEmit"])
    && (frontMultPackageMod.imports
      == ["SystemsLean.SubsetFront", "SystemsLean.MultSubsetEmit",
          "SystemsLean.MultSubsetRebuild"])
    && (subsetPackageJoinMod.imports
      == ["SystemsLean.MultSubsetRebuild", "SystemsLean.LinearSubsetRebuild",
          "SystemsLean.TypesSubsetRebuild", "SystemsLean.ProgramSubsetRebuild",
          "SystemsLean.ExtractSubsetRebuild", "SystemsLean.ErasureSubsetRebuild",
          "SystemsLean.GraphSubsetRebuild", "SystemsLean.ComposeSubsetRebuild"])
    && (hostGraphTheoremsMod.imports == ["SystemsLean.HostGraph"])
    && (llvmTypesTextMod.imports
      == ["SystemsLean.Types", "SystemsLean.Mult", "SystemsLean.LlvmHold",
          "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
          "SystemsLean.LlvmLinearText"])
    && (multFsDeepenMod.imports
      == ["SystemsLean.MultSubsetRebuild", "SystemsLean.EmitMult",
          "SystemsLean.MultFsWriteTool"])
    && (hostPackageWriteMod.imports
      == ["SystemsLean.HostFront", "SystemsLean.HostGraph",
          "SystemsLean.MultSubsetEmit", "SystemsLean.LinearSubsetEmit",
          "SystemsLean.TypesSubsetEmit", "SystemsLean.ProgramSubsetEmit",
          "SystemsLean.GraphSubsetEmit", "SystemsLean.ComposeSubsetEmit"])
    && (hostPackageWriteTheoremsMod.imports == ["SystemsLean.HostPackageWrite"])
    && (llvmProgramTextMod.imports
      == ["SystemsLean.IrProgram", "SystemsLean.LlvmHold",
          "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
          "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText"])
    && (llvmGraphTextMod.imports
      == ["SystemsLean.IrGraph", "SystemsLean.LlvmHold",
          "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
          "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText",
          "SystemsLean.LlvmProgramText"])
    && (llvmComposeTextMod.imports
      == ["SystemsLean.HostCompose", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.LlvmHold",
          "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
          "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText",
          "SystemsLean.LlvmProgramText", "SystemsLean.LlvmGraphText"])
    && (selfApplyFsMod.imports
      == ["SystemsLean.SelfApply",
          "SystemsLean.ParityEmit",
          "SystemsLean.KernelEmit",
          "SystemsLean.HostCompose",
          "SystemsLean.EmitBody",
          "SystemsLean.EmitMult",
          "SystemsLean.KernelSelfApply",
          "SystemsLean.ProductOutKernel",
          "SystemsLean.BootstrapHonesty",
          "SystemsLean.ProductPathWriterSurface",
          "SystemsLean.ProductPathWriterPathPlan",
          "SystemsLean.ProductPathWriterPathExec",
          "SystemsLean.ProductPathOwnershipInputs",
          "SystemsLean.ProductPathPerform",
          "SystemsLean.ProductPathPerformStep",
          "SystemsLean.ProductPathReadSsot",
          "SystemsLean.ProductPathComposePlan",
          "SystemsLean.ProductPathWriteHc",
          "SystemsLean.Capable",
          "SystemsLean.CapableStepContract",
          "SystemsLean.CapableRead",
          "SystemsLean.CapableCompose",
          "SystemsLean.CapableWriteHc",
          "SystemsLean.CapableRegenerate",
          "SystemsLean.InstallOut",
          "SystemsLean.CapableFullBar",
          "SystemsLean.ProductPathOwnershipRegenerate",
          "SystemsLean.PerformEvidence",
          "SystemsLean.OfficialPath",
          "SystemsLean.OfficialPathAlternate",
          "SystemsLean.DualEqWriteParity",
          "SystemsLean.DualEqWriteClosePath",
          "SystemsLean.DualEqWriteApi",
          "SystemsLean.DualEqWriteCapableGap",
          "SystemsLean.OfficialRetire",
          "SystemsLean.PerformClaimed",
          "SystemsLean.OwnershipClaimed",
          "SystemsLean.StepContractFull",
          "SystemsLean.SelfHostComplete"])
    && (selfApplyFsTheoremsMod.imports == ["SystemsLean.SelfApplyFs"])
    && (inventoryCloseMod.imports
      == ["SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"])
    && (productPathBarsMod.imports
      == ["SystemsLean.CompilePath", "SystemsLean.KernelEmit",
          "SystemsLean.KernelProgram", "SystemsLean.HostCompose",
          "SystemsLean.IrProgram", "SystemsLean.JoinMap",
          "SystemsLean.SelfHost", "SystemsLean.SurfaceMatrix",
          "SystemsLean.SelfApplyFs"])
    && (inventoryCloseTheoremsMod.imports
      == ["SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
          "SystemsLean.InventoryClose"])
    && (productPathMod.imports
      == ["SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold", "SystemsLean.ProductPathBars"])
    && (productPathTheoremsMod.imports
      == ["SystemsLean.InventoryClose", "SystemsLean.CompilePath",
          "SystemsLean.KernelEmit", "SystemsLean.KernelProgram",
          "SystemsLean.HostCompose", "SystemsLean.IrProgram",
          "SystemsLean.JoinMap", "SystemsLean.SelfHost",
          "SystemsLean.SurfaceMatrix", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold", "SystemsLean.ProductPath"])
    && (dualResidualMod.imports
      == ["SystemsLean.ProductPath", "SystemsLean.InventoryClose",
          "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"])
    && (dualResidualTheoremsMod.imports
      == ["SystemsLean.ProductPath", "SystemsLean.InventoryClose",
          "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
          "SystemsLean.DualResidual"])
    && (probeWireMod.imports
      == ["SystemsLean.DualResidual", "SystemsLean.ProductPath",
          "SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold"])
    && (selfHostBodyMod.imports
      == ["SystemsLean.EmitMult", "SystemsLean.EmitLinear",
          "SystemsLean.EmitErasure", "SystemsLean.EmitExtract",
          "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
          "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
          "SystemsLean.EmitComposeScaffold", "SystemsLean.EmitPlan",
          "SystemsLean.EmitPlanScaffold", "SystemsLean.EmitApply",
          "SystemsLean.EmitApplyScaffold", "SystemsLean.EmitBody",
          "SystemsLean.EmitBodyScaffold", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold", "SystemsLean.DualResidual"])
    && (probeWireTheoremsMod.imports
      == ["SystemsLean.DualResidual", "SystemsLean.ProductPath",
          "SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold", "SystemsLean.ProbeWire"])
    && (selfHostBodyTheoremsMod.imports
      == ["SystemsLean.EmitMult", "SystemsLean.EmitLinear",
          "SystemsLean.EmitErasure", "SystemsLean.EmitExtract",
          "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
          "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
          "SystemsLean.EmitPlan", "SystemsLean.EmitApply",
          "SystemsLean.EmitBody", "SystemsLean.SelfApplyFs",
          "SystemsLean.LlvmHold", "SystemsLean.DualResidual",
          "SystemsLean.SelfHostBody"])
    && (specProofMod.imports
      == ["SystemsLean.ProbeWire", "SystemsLean.DualResidual",
          "SystemsLean.ProductPath", "SystemsLean.InventoryClose",
          "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"])
    && (specProofTheoremsMod.imports
      == ["SystemsLean.ProbeWire", "SystemsLean.DualResidual",
          "SystemsLean.ProductPath", "SystemsLean.InventoryClose",
          "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
          "SystemsLean.SpecProof"])

end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveHostImportGraphLoadOkLater
