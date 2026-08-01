# SPDX-License-Identifier: Unlicense
# Skeleton docs/slake + Lake pin + Mult..SelfHostBody host ladder paths.
# Imported by ./specs.nix thin join. No bash.
{
# Skeleton docs/slake + Lake pin + Mult..SelfHostBody host ladder.
requiredFiles = [
  "src/systems/README.md"
  "src/systems/types.md"
  "src/systems/mult.md"
  "src/systems/linear.md"
  "src/systems/erasure.md"
  "src/systems/extract.md"
  "src/systems/host-partial-inventory.md"
  "src/systems/surface-matrix.md"
  "src/systems/self-host.md"
  "src/systems/Types.slake"
  "src/systems/Mult.slake"
  "src/systems/Linear.slake"
  "src/systems/Erasure.slake"
  "src/systems/Extract.slake"
  "src/systems/lakefile.toml"
  "src/systems/lean-toolchain"
  "src/systems/lake-manifest.json"
  "src/systems/SystemsLean.lean"
  "src/systems/SystemsLean/Mult.lean"
  # Long-file split: MULT-THEOREM + HOST-MULT-THEOREM (same namespace Mult).
  "src/systems/SystemsLean/MultTheorems.lean"
  "src/systems/SystemsLean/Linear.lean"
  "src/systems/SystemsLean/LinearTheorems.lean"
  "src/systems/SystemsLean/Types.lean"
  # Long-file split: TYPES-THEOREM + HOST-TYPES-THEOREM (same namespace Types).
  "src/systems/SystemsLean/TypesTheorems.lean"
  "src/systems/SystemsLean/IrProgram.lean"
  # Long-file split: IR-PROGRAM-THEOREM (same namespace IrProgram).
  "src/systems/SystemsLean/IrProgramTheorems.lean"
  "src/systems/SystemsLean/Erasure.lean"
  # Long-file split: ERASURE-THEOREM + HOST-ERASURE-THEOREM (same namespace Erasure).
  "src/systems/SystemsLean/ErasureTheorems.lean"
  "src/systems/SystemsLean/Extract.lean"
  # Long-file split: EXTRACT-THEOREM + HOST-EXTRACT-THEOREM (same namespace Extract).
  "src/systems/SystemsLean/ExtractTheorems.lean"
  "src/systems/SystemsLean/IrGraph.lean"
  # Long-file peel: IR-GRAPH-THEOREM + IR-GRAPH-SMOKE (same namespace IrGraph).
  "src/systems/SystemsLean/IrGraphTheorems.lean"
  "src/systems/SystemsLean/HostCompose.lean"
  # Long-file peel: COMPOSE-THEOREM + HOST-SMOKE (same namespace HostCompose).
  "src/systems/SystemsLean/HostComposeTheorems.lean"
  "src/systems/SystemsLean/EmitPlan.lean"
  # Long-file peel: HOST-EMIT-PLAN scaffolding (same namespace EmitPlan).
  "src/systems/SystemsLean/EmitPlanScaffold.lean"
  "src/systems/SystemsLean/EmitApply.lean"
  # Long-file peel: HOST-EMIT-APPLY scaffolding (same namespace EmitApply).
  "src/systems/SystemsLean/EmitApplyScaffold.lean"
  "src/systems/SystemsLean/EmitBody.lean"
  # Long-file peel: HOST-EMIT-BODY scaffolding (same namespace EmitBody).
  "src/systems/SystemsLean/EmitBodyScaffold.lean"
  "src/systems/SystemsLean/EmitBanner.lean"
  # Long-file split: HOST-EMIT-BANNER scaffolding (same namespace EmitBanner).
  "src/systems/SystemsLean/EmitBannerScaffold.lean"
  "src/systems/SystemsLean/CompilePath.lean"
  # Bootstrap S1 first compiler surface (Mult unit -> structural readiness).
  "src/systems/SystemsLean/FirstSurface.lean"
  "src/systems/SystemsLean/FirstSurfaceMain.lean"
  "src/systems/SystemsLean/MultSubsetEmit.lean"
  "src/systems/SystemsLean/MultSubsetEmitMain.lean"
  "src/systems/SystemsLean/MultSubsetRebuild.lean"
  "src/systems/SystemsLean/MultSubsetRebuildMain.lean"
  "src/systems/SystemsLean/MultFsDeepen.lean"
  "src/systems/SystemsLean/MultFsWriteMain.lean"
  "src/systems/SystemsLean/MultFsWriteTool.lean"
  "src/systems/SystemsLean/MultFsWriteToolMain.lean"
  "src/systems/SystemsLean/LinearSubsetEmit.lean"
  "src/systems/SystemsLean/LinearSubsetEmitMain.lean"
  "src/systems/SystemsLean/LinearSubsetRebuild.lean"
  "src/systems/SystemsLean/LinearSubsetRebuildMain.lean"
  "src/systems/SystemsLean/TypesSubsetEmit.lean"
  "src/systems/SystemsLean/TypesSubsetEmitMain.lean"
  "src/systems/SystemsLean/TypesSubsetRebuild.lean"
  "src/systems/SystemsLean/TypesSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ProgramSubsetEmit.lean"
  "src/systems/SystemsLean/ProgramSubsetEmitMain.lean"
  "src/systems/SystemsLean/ProgramSubsetRebuild.lean"
  "src/systems/SystemsLean/ProgramSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ExtractSubsetEmit.lean"
  "src/systems/SystemsLean/ExtractSubsetEmitMain.lean"
  "src/systems/SystemsLean/ExtractSubsetRebuild.lean"
  "src/systems/SystemsLean/ExtractSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ErasureSubsetEmit.lean"
  "src/systems/SystemsLean/ErasureSubsetEmitMain.lean"
  "src/systems/SystemsLean/ErasureSubsetRebuild.lean"
  "src/systems/SystemsLean/ErasureSubsetRebuildMain.lean"
  "src/systems/SystemsLean/GraphSubsetEmit.lean"
  "src/systems/SystemsLean/GraphSubsetEmitMain.lean"
  "src/systems/SystemsLean/GraphSubsetRebuild.lean"
  "src/systems/SystemsLean/GraphSubsetRebuildMain.lean"
  "src/systems/SystemsLean/ComposeSubsetEmit.lean"
  "src/systems/SystemsLean/ComposeSubsetEmitMain.lean"
  "src/systems/SystemsLean/ComposeSubsetRebuild.lean"
  "src/systems/SystemsLean/ComposeSubsetRebuildMain.lean"
  "src/systems/SystemsLean/JoinMap.lean"
  # Long-file peel: JOIN-MAP-THEOREM + JOIN-MAP-SMOKE (same namespace JoinMap).
  "src/systems/SystemsLean/JoinMapTheorems.lean"
  "src/systems/SystemsLean/SelfHost.lean"
  # Long-file split: SELF-HOST-THEOREM + SELF-HOST-SMOKE (same namespace SelfHost).
  "src/systems/SystemsLean/SelfHostTheorems.lean"
  "src/systems/SystemsLean/SurfaceMatrix.lean"
  # Long-file peel: SURFACE-MATRIX-THEOREM + SURFACE-MATRIX-SMOKE (same namespace SurfaceMatrix).
  "src/systems/SystemsLean/SurfaceMatrixTheorems.lean"
  "src/systems/SystemsLean/KernelMult.lean"
  # Long-file split: KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE (same namespace KernelMult).
  "src/systems/SystemsLean/KernelMultTheorems.lean"
  "src/systems/SystemsLean/EmitMult.lean"
  # Long-file split: HOST-EMIT-MULT scaffolding (same namespace EmitMult).
  "src/systems/SystemsLean/EmitMultScaffold.lean"
  "src/systems/SystemsLean/EmitLinear.lean"
  # Long-file peel: HOST-EMIT-LINEAR scaffolding (same namespace EmitLinear).
  "src/systems/SystemsLean/EmitLinearScaffold.lean"
  "src/systems/SystemsLean/EmitErasure.lean"
  # Long-file split: HOST-EMIT-ERASURE scaffolding (same namespace EmitErasure).
  "src/systems/SystemsLean/EmitErasureScaffold.lean"
  "src/systems/SystemsLean/EmitExtract.lean"
  # Long-file peel: HOST-EMIT-EXTRACT scaffolding (same namespace EmitExtract).
  "src/systems/SystemsLean/EmitExtractScaffold.lean"
  "src/systems/SystemsLean/EmitTypes.lean"
  # Long-file peel: HOST-EMIT-TYPES scaffolding (same namespace EmitTypes).
  "src/systems/SystemsLean/EmitTypesScaffold.lean"
  "src/systems/SystemsLean/EmitProgram.lean"
  # Long-file peel: HOST-EMIT-PROGRAM scaffolding (same namespace EmitProgram).
  "src/systems/SystemsLean/EmitProgramScaffold.lean"
  "src/systems/SystemsLean/EmitGraph.lean"
  # Long-file peel: HOST-EMIT-GRAPH scaffolding (same namespace EmitGraph).
  "src/systems/SystemsLean/EmitGraphScaffold.lean"
  "src/systems/SystemsLean/EmitCompose.lean"
  # Long-file peel: HOST-EMIT-COMPOSE scaffolding (same namespace EmitCompose).
  "src/systems/SystemsLean/EmitComposeScaffold.lean"
  "src/systems/SystemsLean/FreestandingEmit.lean"
  "src/systems/SystemsLean/FreestandingEmitLoad.lean"
  # Long-file peel: Mult..Apply unit SSOT loaders (same namespace FreestandingEmit).
  "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean"
  # Thin Lake root for slake-emit-freestanding-c (B13-supporting main split).
  "src/systems/SystemsLean/FreestandingEmitMain.lean"
  # Dual-equality WRITE API load/assemble peel (same namespace DualEqWriteApi).
  "src/systems/SystemsLean/DualEqWriteLoad.lean"
  # Capable WRITE-HC load/assemble peel (same namespace CapableWriteHc).
  "src/systems/SystemsLean/CapableWriteHcLoad.lean"
  # Long-file split: STEP-CONTRACT-THEOREM + SMOKE (same namespace CapableStepContract).
  "src/systems/SystemsLean/CapableStepContractTheorems.lean"
  # Long-file split: CAPABLE-GAP-THEOREM + SMOKE (same namespace Capable).
  "src/systems/SystemsLean/CapableTheorems.lean"
  # Long-file split: PERFORM-EVIDENCE-THEOREM + SMOKE (same namespace PerformEvidence).
  "src/systems/SystemsLean/PerformEvidenceTheorems.lean"
  # Long-file split: COMPOSE-PLAN-THEOREM + SMOKE (same namespace ProductPathComposePlan).
  "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean"
  # Long-file split: READ-SSOT-THEOREM + SMOKE (same namespace ProductPathReadSsot).
  "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean"
  # Long-file split: WRITE-HC-THEOREM + SMOKE (same namespace ProductPathWriteHc).
  "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean"
  # Long-file split: WRITER-PATH-EXEC-THEOREM + SMOKE (same namespace ProductPathWriterPathExec).
  "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean"
  # Long-file split: PERFORM-STEP-THEOREM + SMOKE (same namespace ProductPathPerformStep).
  "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean"
  # Long-file split: PERFORM-THEOREM + SMOKE (same namespace ProductPathPerform).
  "src/systems/SystemsLean/ProductPathPerformTheorems.lean"
  # Long-file split: PRODUCT-OUT-THEOREM + SMOKE (same namespace ProductOutKernel).
  "src/systems/SystemsLean/ProductOutKernelTheorems.lean"
  # Long-file split: KERNEL-SELF-APPLY-THEOREM + SMOKE (same namespace KernelSelfApply).
  "src/systems/SystemsLean/KernelSelfApplyTheorems.lean"
  # Long-file split: WRITER-SURFACE-THEOREM + SMOKE (same namespace ProductPathWriterSurface).
  "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean"
  # Long-file split: FULL-BAR-THEOREM + SMOKE (same namespace CapableFullBar).
  "src/systems/SystemsLean/CapableFullBarTheorems.lean"
  # Long-file split: REGENERATE-THEOREM + SMOKE (same namespace CapableRegenerate).
  "src/systems/SystemsLean/CapableRegenerateTheorems.lean"
  # Long-file split: INSTALL-OUT-THEOREM + SMOKE (same namespace InstallOut).
  "src/systems/SystemsLean/InstallOutTheorems.lean"
  # Long-file split: READ-THEOREM + READ-SMOKE (same namespace CapableRead).
  "src/systems/SystemsLean/CapableReadTheorems.lean"
  # Long-file split: COMPOSE-THEOREM + COMPOSE-SMOKE (same namespace CapableCompose).
  "src/systems/SystemsLean/CapableComposeTheorems.lean"
  "src/systems/SystemsLean/ParityMult.lean"
  # Long-file peel: PARITY-MULT-THEOREM + PARITY-MULT-SMOKE (same namespace ParityMult).
  "src/systems/SystemsLean/ParityMultTheorems.lean"
  "src/systems/SystemsLean/KernelLinear.lean"
  # Long-file split: KERNEL-LINEAR-THEOREM + KERNEL-LINEAR-SMOKE (same namespace KernelLinear).
  "src/systems/SystemsLean/KernelLinearTheorems.lean"
  "src/systems/SystemsLean/ParityLinear.lean"
  # Long-file split: PARITY-LINEAR-THEOREM + PARITY-LINEAR-SMOKE (same namespace ParityLinear).
  "src/systems/SystemsLean/ParityLinearTheorems.lean"
  "src/systems/SystemsLean/KernelTypes.lean"
  # Long-file peel: KERNEL-TYPES-THEOREM + KERNEL-TYPES-SMOKE (same namespace KernelTypes).
  "src/systems/SystemsLean/KernelTypesTheorems.lean"
  "src/systems/SystemsLean/ParityTypes.lean"
  # Long-file split: PARITY-TYPES-THEOREM + PARITY-TYPES-SMOKE (same namespace ParityTypes).
  "src/systems/SystemsLean/ParityTypesTheorems.lean"
  "src/systems/SystemsLean/KernelProgram.lean"
  # Long-file peel: KERNEL-PROGRAM-THEOREM + KERNEL-PROGRAM-SMOKE (same namespace KernelProgram).
  "src/systems/SystemsLean/KernelProgramTheorems.lean"
  "src/systems/SystemsLean/ParityProgram.lean"
  # Long-file peel: PARITY-PROGRAM-THEOREM + PARITY-PROGRAM-SMOKE (same namespace ParityProgram).
  "src/systems/SystemsLean/ParityProgramTheorems.lean"
  "src/systems/SystemsLean/KernelEmit.lean"
  # Long-file peel: KERNEL-EMIT-THEOREM + KERNEL-EMIT-SMOKE (same namespace KernelEmit).
  "src/systems/SystemsLean/KernelEmitTheorems.lean"
  "src/systems/SystemsLean/ParityEmit.lean"
  # Long-file peel: PARITY-EMIT-THEOREM + PARITY-EMIT-SMOKE (same namespace ParityEmit).
  "src/systems/SystemsLean/ParityEmitTheorems.lean"
  "src/systems/SystemsLean/SelfApply.lean"
  # Long-file split: theorems + smoke (same namespace SelfApply).
  "src/systems/SystemsLean/SelfApplyTheorems.lean"
  "src/systems/SystemsLean/SelfApplyFs.lean"
  "src/systems/SystemsLean/SelfHostComplete.lean"
  "src/systems/SystemsLean/LlvmHold.lean"
  # Long-file split: theorems + smoke (same namespace LlvmHold).
  "src/systems/SystemsLean/LlvmHoldTheorems.lean"
  "src/systems/SystemsLean/InventoryClose.lean"
  # Long-file split: theorems + smoke (same namespace InventoryClose).
  "src/systems/SystemsLean/InventoryCloseTheorems.lean"
  "src/systems/SystemsLean/ProductPath.lean"
  # Long-file peel: freestanding path bars (same namespace ProductPath).
  "src/systems/SystemsLean/ProductPathBars.lean"
  # Long-file peel: theorems + smoke (same namespace ProductPath).
  "src/systems/SystemsLean/ProductPathTheorems.lean"
  "src/systems/SystemsLean/DualResidual.lean"
  # Long-file peel: theorems + smoke (same namespace DualResidual).
  "src/systems/SystemsLean/DualResidualTheorems.lean"
  "src/systems/SystemsLean/ProbeWire.lean"
  # Long-file peel: theorems + smoke (same namespace ProbeWire).
  "src/systems/SystemsLean/ProbeWireTheorems.lean"
  "src/systems/SystemsLean/SpecProof.lean"
  # Long-file peel: theorems + smoke (same namespace SpecProof).
  "src/systems/SystemsLean/SpecProofTheorems.lean"
  "src/systems/SystemsLean/SelfHostBody.lean"
  # Long-file peel: theorems + smoke (same namespace SelfHostBody).
  "src/systems/SystemsLean/SelfHostBodyTheorems.lean"
  # HOST-EMIT-SSOT durable empty-compose / dialect artifact (P2).
  "src/systems/emit/host_emit_body_fragment.ssot.txt"
  # HOST-EMIT-MULT durable Mult product text (SH2).
  "src/systems/emit/host_emit_mult.ssot.txt"
  # HOST-EMIT-LINEAR durable Linear product text.
  "src/systems/emit/host_emit_linear.ssot.txt"
  # HOST-EMIT-ERASURE durable Erasure product text.
  "src/systems/emit/host_emit_erasure.ssot.txt"
  # HOST-EMIT-EXTRACT durable Extract + FAIL_CLOSED product text.
  "src/systems/emit/host_emit_extract.ssot.txt"
  # HOST-EMIT-TYPES durable Types/TYPED_IR product text.
  "src/systems/emit/host_emit_types.ssot.txt"
  # HOST-EMIT-PROGRAM durable IR program product text.
  "src/systems/emit/host_emit_program.ssot.txt"
  # HOST-EMIT-GRAPH durable IR graph product text.
  "src/systems/emit/host_emit_graph.ssot.txt"
  # HOST-EMIT-COMPOSE durable host compose product text.
  "src/systems/emit/host_emit_compose.ssot.txt"
  # HOST-EMIT-PLAN durable emit plan product text.
  "src/systems/emit/host_emit_plan.ssot.txt"
  # HOST-EMIT-APPLY durable emit apply product text.
  "src/systems/emit/host_emit_apply.ssot.txt"
  # HOST-EMIT-BANNER durable banner / version product text.
  "src/systems/emit/host_emit_banner.ssot.txt"
];
}
