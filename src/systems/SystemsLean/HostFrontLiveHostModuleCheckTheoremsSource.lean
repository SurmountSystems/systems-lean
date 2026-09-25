/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckTheoremsSource. Not occupancy name 50.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckTheoremsSource,
  HOST-MODULE-CHECK-THEOREMS, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a claim-bool flip. FullHost stays false.
  Occupancy stays 49. Mill stays 69 of 69.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckTheorems

/-- Dual-pinned live HostModuleCheckTheorems.lean bytes (must match on-disk file).
    Greppable: liveHostModuleCheckTheoremsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS. -/
def liveHostModuleCheckTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck HOST-MODULE-CHECK-THEOREM surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheck: readable theorems live
  here; HOST-MODULE-CHECK-SMOKE examples live in HostModuleCheckSmoke; seed
  surfaces, structural checks, readiness pins, and driver IO stay in
  HostModuleCheck. Same namespace SystemsLean.HostModuleCheck so theorem
  names stay unqualified under that namespace.
  Sub-1-KLOC: keep under ~900 preferred (must stay under 1000) for U1 TERM
  theorem growth room.

  Spec (readable):
  - HOST-MODULE-CHECK-THEOREM: loadOk / ready / without-Lake / Mult+Linear+
    Types+Program+Graph+Compose good accept / Mult fail-closed / ids /
    claims_false.
  - Host compose expand: Mult+...+IrGraph+IrGraphTheorems+HostCompose+
    HostComposeTheorems.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - FOUNDATION-KIND-SURFACE deepen (Mult..Extract) still not full elaborate.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HOST-MODULE-CHECK-THEOREM,
  HostModuleCheckSmoke, hostModuleCheckReady_true, hostModuleCheckLoadOk_true,
  hostModuleCheckGoodLinear_accept, hostModuleCheckGoodTypes_accept,
  hostModuleCheckGoodIrProgram_accept, hostModuleCheckGoodIrGraph_accept,
  hostModuleCheckGoodHostCompose_accept,
  Check depth deepen continue, FOUNDATION-KIND-SURFACE, checkDepthDeepenBar,
  hostModuleCheckBadMissingAxiom_missing, hostModuleCheckBadMissingStructure_missing,
  hostModuleCheckBadMissingProgramStructure_missing,
  hostModuleCheckBadMissingErasedStructure_missing,
  hostModuleCheckBadMissingKernelReady_missing,
  hostModuleCheckBadMissingPlanStructure_missing,
  hostModuleCheckBadMissingParityReady_missing,
  Host library seed expand continue, Host real module seed expand,
  Host theorem check expand, Host compose module expand, Host graph module expand,
  Host program module expand, Host module set expand,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems,
  HostModuleCheckTheorems, HostModuleCheckSmoke, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckTheorems
  Greppable: MULT-0 (host Mult IR contract cite; theorems surface honesty).
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckTheorems;
  lake build SystemsLean.HostModuleCheckSmoke.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostModuleCheck

-- native_decide over expanded FOUNDATION-KIND-SURFACE fixtures needs room.
set_option maxRecDepth 16384

namespace SystemsLean.HostModuleCheck

/-! ### HOST-MODULE-CHECK-THEOREM (readable statements) -/

/-- Mult seed dual-pin + fail-closed holds.
    Greppable: hostModuleCheckLoadOk_true, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckLoadOk_true : hostModuleCheckLoadOk = true := by
  native_decide

/-- Structural ready.
    Greppable: hostModuleCheckReady_true, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckReady_true : hostModuleCheckReady = true := by
  native_decide

/-- Without-Lake ready.
    Greppable: hostModuleCheckWithoutLakeReady_true,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckWithoutLakeReady_true :
    hostModuleCheckWithoutLakeReady = true := by
  native_decide

/-- Finished claimed.
    Greppable: hostModuleCheckFinishedClaimed_true,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckFinishedClaimed_true :
    hostModuleCheckFinishedClaimed = true :=
  rfl

/-- Host residual remains (local mirror).
    Greppable: hostModuleCheckHostElaboratorResidualRemains_true,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckHostElaboratorResidualRemains_true :
    hostModuleCheckHostElaboratorResidualRemains = true :=
  rfl

/-- Host free not claimed.
    Greppable: hostModuleCheckHostFreeClaimed_false,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckHostFreeClaimed_false :
    hostModuleCheckHostFreeClaimed = false :=
  rfl

/-- Without-Lake finished.
    Greppable: hostModuleCheckWithoutLakeFinished_true,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckWithoutLakeFinished_true :
    hostModuleCheckWithoutLakeFinished = true :=
  rfl

/-- Good Mult accepts.
    Greppable: hostModuleCheckGoodMult_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodMult_accept :
    hostModuleCheckGoodMult.isAccept = true := by
  native_decide

/-- Good MultTheorems accepts.
    Greppable: hostModuleCheckGoodMultTheorems_accept,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodMultTheorems_accept :
    hostModuleCheckGoodMultTheorems.isAccept = true := by
  native_decide

/-- Good Linear accepts.
    Greppable: hostModuleCheckGoodLinear_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodLinear_accept :
    hostModuleCheckGoodLinear.isAccept = true := by
  native_decide

/-- Good Types accepts.
    Greppable: hostModuleCheckGoodTypes_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodTypes_accept :
    hostModuleCheckGoodTypes.isAccept = true := by
  native_decide

/-- Good IrProgram accepts (Program unit).
    Greppable: hostModuleCheckGoodIrProgram_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodIrProgram_accept :
    hostModuleCheckGoodIrProgram.isAccept = true := by
  native_decide

/-- Good IrProgramTheorems accepts.
    Greppable: hostModuleCheckGoodIrProgramTheorems_accept,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodIrProgramTheorems_accept :
    hostModuleCheckGoodIrProgramTheorems.isAccept = true := by
  native_decide

/-- Good IrGraph accepts (Graph unit).
    Greppable: hostModuleCheckGoodIrGraph_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodIrGraph_accept :
    hostModuleCheckGoodIrGraph.isAccept = true := by
  native_decide

/-- Good IrGraphTheorems accepts.
    Greppable: hostModuleCheckGoodIrGraphTheorems_accept,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodIrGraphTheorems_accept :
    hostModuleCheckGoodIrGraphTheorems.isAccept = true := by
  native_decide

/-- Good HostCompose accepts (Compose unit).
    Greppable: hostModuleCheckGoodHostCompose_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodHostCompose_accept :
    hostModuleCheckGoodHostCompose.isAccept = true := by
  native_decide

/-- Good HostComposeTheorems accepts.
    Greppable: hostModuleCheckGoodHostComposeTheorems_accept,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodHostComposeTheorems_accept :
    hostModuleCheckGoodHostComposeTheorems.isAccept = true := by
  native_decide

/-- Good Erasure accepts.
    Greppable: hostModuleCheckGoodErasure_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodErasure_accept :
    hostModuleCheckGoodErasure.isAccept = true := by
  native_decide

/-- Good Extract accepts.
    Greppable: hostModuleCheckGoodExtract_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodExtract_accept :
    hostModuleCheckGoodExtract.isAccept = true := by
  native_decide

/-- Good CompilePath accepts.
    Greppable: hostModuleCheckGoodCompilePath_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodCompilePath_accept :
    hostModuleCheckGoodCompilePath.isAccept = true := by
  native_decide

/-- Good KernelMult accepts.
    Greppable: hostModuleCheckGoodKernelMult_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelMult_accept :
    hostModuleCheckGoodKernelMult.isAccept = true := by
  native_decide

/-- Good KernelLinear accepts.
    Greppable: hostModuleCheckGoodKernelLinear_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelLinear_accept :
    hostModuleCheckGoodKernelLinear.isAccept = true := by
  native_decide

/-- Good KernelTypes accepts.
    Greppable: hostModuleCheckGoodKernelTypes_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelTypes_accept :
    hostModuleCheckGoodKernelTypes.isAccept = true := by
  native_decide

/-- Good KernelProgram accepts.
    Greppable: hostModuleCheckGoodKernelProgram_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelProgram_accept :
    hostModuleCheckGoodKernelProgram.isAccept = true := by
  native_decide

/-- Good KernelMultTheorems accepts.
    Greppable: hostModuleCheckGoodKernelMultTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelMultTheorems_accept :
    hostModuleCheckGoodKernelMultTheorems.isAccept = true := by
  native_decide

/-- Good KernelLinearTheorems accepts.
    Greppable: hostModuleCheckGoodKernelLinearTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelLinearTheorems_accept :
    hostModuleCheckGoodKernelLinearTheorems.isAccept = true := by
  native_decide

/-- Good KernelTypesTheorems accepts.
    Greppable: hostModuleCheckGoodKernelTypesTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelTypesTheorems_accept :
    hostModuleCheckGoodKernelTypesTheorems.isAccept = true := by
  native_decide

/-- Good KernelProgramTheorems accepts.
    Greppable: hostModuleCheckGoodKernelProgramTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodKernelProgramTheorems_accept :
    hostModuleCheckGoodKernelProgramTheorems.isAccept = true := by
  native_decide

/-- Good JoinMap accepts.
    Greppable: hostModuleCheckGoodJoinMap_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodJoinMap_accept :
    hostModuleCheckGoodJoinMap.isAccept = true := by
  native_decide

/-- Good JoinMapTheorems accepts.
    Greppable: hostModuleCheckGoodJoinMapTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodJoinMapTheorems_accept :
    hostModuleCheckGoodJoinMapTheorems.isAccept = true := by
  native_decide

/-- Good SelfHost accepts.
    Greppable: hostModuleCheckGoodSelfHost_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodSelfHost_accept :
    hostModuleCheckGoodSelfHost.isAccept = true := by
  native_decide

/-- Good SelfHostTheorems accepts.
    Greppable: hostModuleCheckGoodSelfHostTheorems_accept, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodSelfHostTheorems_accept :
    hostModuleCheckGoodSelfHostTheorems.isAccept = true := by
  native_decide

/-- Missing inductive fails closed.
    Greppable: hostModuleCheckBadMissingInductive_missing,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingInductive_missing :
    hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing namespace fails closed.
    Greppable: hostModuleCheckBadMissingNamespace_missing,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingNamespace_missing :
    hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace
      = true := by
  native_decide

/-- Empty module fails closed.
    Greppable: hostModuleCheckBadEmpty_empty, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadEmpty_empty :
    hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule = true := by
  native_decide

/-- Missing theorem fails closed.
    Greppable: hostModuleCheckBadMissingTheorem_missing,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingTheorem_missing :
    hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing Linear axiom fails closed (A56 FOUNDATION-KIND-SURFACE).
    Greppable: hostModuleCheckBadMissingAxiom_missing, Check depth deepen,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingAxiom_missing :
    hostModuleCheckBadMissingAxiom.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing Types structure fails closed (A56 FOUNDATION-KIND-SURFACE).
    Greppable: hostModuleCheckBadMissingStructure_missing, Check depth deepen,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingStructure_missing :
    hostModuleCheckBadMissingStructure.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing IrProgram structure Program fails closed (A57 deepen continue).
    Greppable: hostModuleCheckBadMissingProgramStructure_missing,
    Check depth deepen continue, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingProgramStructure_missing :
    hostModuleCheckBadMissingProgramStructure.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing Erasure structure Erased fails closed (A58 deepen continue).
    Greppable: hostModuleCheckBadMissingErasedStructure_missing,
    Check depth deepen continue, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMissingErasedStructure_missing :
    hostModuleCheckBadMissingErasedStructure.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing Kernel readiness fails closed (Kind-surface Kernel band).
    Greppable: hostModuleCheckBadMissingKernelReady_missing,
    Check depth deepen continue, HOST-MODULE-CHECK-THEOREM,
    Kind-surface Kernel band. -/
theorem hostModuleCheckBadMissingKernelReady_missing :
    hostModuleCheckBadMissingKernelReady.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing EmitPlan structure Plan fails closed (Kind-surface second band).
    Greppable: hostModuleCheckBadMissingPlanStructure_missing,
    Check depth deepen continue, HOST-MODULE-CHECK-THEOREM,
    Kind-surface second band. -/
theorem hostModuleCheckBadMissingPlanStructure_missing :
    hostModuleCheckBadMissingPlanStructure.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Missing ParityMult multParityReady fails closed (Kind-surface third band).
    Greppable: hostModuleCheckBadMissingParityReady_missing,
    Check depth deepen continue, HOST-MODULE-CHECK-THEOREM,
    Kind-surface third band. -/
theorem hostModuleCheckBadMissingParityReady_missing :
    hostModuleCheckBadMissingParityReady.isRejectWith reasonMissingDecl
      = true := by
  native_decide

/-- Mult L2 good term fixture accepts.
    Greppable: hostModuleCheckGoodMultTerm_accept, TERM-SURFACE,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodMultTerm_accept :
    hostModuleCheckGoodMultTerm.isAccept = true := by
  native_decide

/-- Mult T2 wrong name return type fails closed under L2.
    Greppable: hostModuleCheckBadMultNameReturnType_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMultNameReturnType_illTyped :
    hostModuleCheckBadMultNameReturnType.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Mult T3 ill-typed multIsValid app fails closed under L2.
    Greppable: hostModuleCheckBadMultIsValidApp_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMultIsValidApp_illTyped :
    hostModuleCheckBadMultIsValidApp.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Mult T5 wrong isValid arm type fails closed under L2.
    Greppable: hostModuleCheckBadMultIsValidArm_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMultIsValidArm_illTyped :
    hostModuleCheckBadMultIsValidArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Mult L2 dual-pin (good + T2/T3/T5 + L0 still accept twins).
    Greppable: hostModuleCheckMultTermSurfaceOk_true, TERM-SURFACE, Mult-only,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckMultTermSurfaceOk_true :
    hostModuleCheckMultTermSurfaceOk = true := by
  native_decide

/-- Mult KERNEL-CHECK dual-pin (HostTerm fixture + G1 + ill-typed rejects).
    Greppable: hostModuleCheckMultKernelOk_true, KERNEL-CHECK, Mult-only,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckMultKernelOk_true :
    hostModuleCheckMultKernelOk = true := by
  native_decide

/-- TERM-SURFACE Mult-only pins.
    Greppable: hostModuleCheck_term_surface_ids_eq, TERM-SURFACE, Mult-only. -/
theorem hostModuleCheck_term_surface_ids_eq :
    checkDepthTermSurfaceBar = "TERM-SURFACE"
      && checkDepthTermSurfaceScope = "Mult-only"
      && hostModuleCheckTermSurfaceDualOk = true :=
  rfl

/-- MultTheorems L3 good proof fixture accepts.
    Greppable: hostModuleCheckGoodMultTheoremsProof_accept, PROOF-SURFACE,
    HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodMultTheoremsProof_accept :
    hostModuleCheckGoodMultTheoremsProof.isAccept = true := by
  native_decide

/-- MultTheorems P1 wrong ofNat?_zero statement fails closed under L3.
    Greppable: hostModuleCheckBadMultThmWrongStmt_illTyped, PROOF-SURFACE,
    ILL-TYPED-PROOF, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMultThmWrongStmt_illTyped :
    hostModuleCheckBadMultThmWrongStmt.isRejectWith reasonIllTypedProof
      = true := by
  native_decide

/-- MultTheorems P2 by sorry fails closed under L3.
    Greppable: hostModuleCheckBadMultThmSorry_illTyped, PROOF-SURFACE,
    ILL-TYPED-PROOF, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadMultThmSorry_illTyped :
    hostModuleCheckBadMultThmSorry.isRejectWith reasonIllTypedProof
      = true := by
  native_decide

/-- MultTheorems L3 dual-pin (good + P1/P2 + L0 still accept twins).
    Greppable: hostModuleCheckMultProofSurfaceOk_true, PROOF-SURFACE,
    MultTheorems-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckMultProofSurfaceOk_true :
    hostModuleCheckMultProofSurfaceOk = true := by
  native_decide

/-- PROOF-SURFACE MultTheorems-only pins.
    Greppable: hostModuleCheck_proof_surface_ids_eq, PROOF-SURFACE,
    MultTheorems-only. -/
theorem hostModuleCheck_proof_surface_ids_eq :
    checkDepthProofSurfaceBar = "PROOF-SURFACE"
      && checkDepthProofSurfaceScope = "MultTheorems-only"
      && hostModuleCheckProofSurfaceDualOk = true :=
  rfl

/-- Linear L2 good term fixture accepts.
    Greppable: hostModuleCheckGoodLinearTerm_accept, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodLinearTerm_accept :
    hostModuleCheckGoodLinearTerm.isAccept = true := by
  native_decide

/-- Linear LT1 wrong shareNat return type fails closed under L2.
    Greppable: hostModuleCheckBadLinearShareNatReturnType_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearShareNatReturnType_illTyped :
    hostModuleCheckBadLinearShareNatReturnType.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Linear LT2 wrong polyId body fails closed under L2.
    Greppable: hostModuleCheckBadLinearPolyIdBody_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearPolyIdBody_illTyped :
    hostModuleCheckBadLinearPolyIdBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Linear LT3 wrong mult0ClassId fails closed under L2.
    Greppable: hostModuleCheckBadLinearMult0ClassId_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearMult0ClassId_illTyped :
    hostModuleCheckBadLinearMult0ClassId.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Linear LT4 wrong roundTrip body fails closed under L2.
    Greppable: hostModuleCheckBadLinearRoundTripBody_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearRoundTripBody_illTyped :
    hostModuleCheckBadLinearRoundTripBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Linear LT1 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadLinearShareNatReturnType_l0Accept, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearShareNatReturnType_l0Accept :
    hostModuleCheckBadLinearShareNatReturnTypeL0Accept = true := by
  native_decide

/-- Linear LT2 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadLinearPolyIdBody_l0Accept, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearPolyIdBody_l0Accept :
    hostModuleCheckBadLinearPolyIdBodyL0Accept = true := by
  native_decide

/-- Linear LT3 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadLinearMult0ClassId_l0Accept, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearMult0ClassId_l0Accept :
    hostModuleCheckBadLinearMult0ClassIdL0Accept = true := by
  native_decide

/-- Linear LT4 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadLinearRoundTripBody_l0Accept, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadLinearRoundTripBody_l0Accept :
    hostModuleCheckBadLinearRoundTripBodyL0Accept = true := by
  native_decide

/-- Linear L2 dual-pin (good + LT1..LT4 + L0 still accept twins).
    Greppable: hostModuleCheckLinearTermSurfaceOk_true, TERM-SURFACE,
    Linear-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckLinearTermSurfaceOk_true :
    hostModuleCheckLinearTermSurfaceOk = true := by
  native_decide

/-- TERM-SURFACE Linear-only pins.
    Greppable: hostModuleCheck_linear_term_surface_ids_eq, TERM-SURFACE,
    Linear-only. -/
theorem hostModuleCheck_linear_term_surface_ids_eq :
    checkDepthLinearTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLinearTermSurfaceScope = "Linear-only"
      && hostModuleCheckLinearTermSurfaceDualOk = true :=
  rfl

/-- Types L2 good term fixture accepts.
    Greppable: hostModuleCheckGoodTypesTerm_accept, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckGoodTypesTerm_accept :
    hostModuleCheckGoodTypesTerm.isAccept = true := by
  native_decide

/-- Types TT1 wrong name arm fails closed under L2.
    Greppable: hostModuleCheckBadTypesNameArm_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesNameArm_illTyped :
    hostModuleCheckBadTypesNameArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Types TT2 wrong expectedMult arm fails closed under L2.
    Greppable: hostModuleCheckBadTypesExpectedMultArm_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesExpectedMultArm_illTyped :
    hostModuleCheckBadTypesExpectedMultArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Types TT3 wrong kindMultOk body fails closed under L2.
    Greppable: hostModuleCheckBadTypesKindMultOkBody_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesKindMultOkBody_illTyped :
    hostModuleCheckBadTypesKindMultOkBody.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Types TT4 wrong ofKindTag arm fails closed under L2.
    Greppable: hostModuleCheckBadTypesOfKindTagArm_illTyped, TERM-SURFACE,
    ILL-TYPED-TERM, Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesOfKindTagArm_illTyped :
    hostModuleCheckBadTypesOfKindTagArm.isRejectWith reasonIllTypedTerm
      = true := by
  native_decide

/-- Types TT1 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadTypesNameArm_l0Accept, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesNameArm_l0Accept :
    hostModuleCheckBadTypesNameArmL0Accept = true := by
  native_decide

/-- Types TT2 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadTypesExpectedMultArm_l0Accept, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesExpectedMultArm_l0Accept :
    hostModuleCheckBadTypesExpectedMultArmL0Accept = true := by
  native_decide

/-- Types TT3 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadTypesKindMultOkBody_l0Accept, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesKindMultOkBody_l0Accept :
    hostModuleCheckBadTypesKindMultOkBodyL0Accept = true := by
  native_decide

/-- Types TT4 still accepted at L0/L1 (tokens only).
    Greppable: hostModuleCheckBadTypesOfKindTagArm_l0Accept, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckBadTypesOfKindTagArm_l0Accept :
    hostModuleCheckBadTypesOfKindTagArmL0Accept = true := by
  native_decide

/-- Types L2 dual-pin (good + TT1..TT4 + L0 still accept twins).
    Greppable: hostModuleCheckTypesTermSurfaceOk_true, TERM-SURFACE,
    Types-only, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheckTypesTermSurfaceOk_true :
    hostModuleCheckTypesTermSurfaceOk = true := by
  native_decide

/-- TERM-SURFACE Types-only pins.
    Greppable: hostModuleCheck_types_term_surface_ids_eq, TERM-SURFACE,
    Types-only. -/
theorem hostModuleCheck_types_term_surface_ids_eq :
    checkDepthTypesTermSurfaceBar = "TERM-SURFACE"
      && checkDepthTypesTermSurfaceScope = "Types-only"
      && hostModuleCheckTypesTermSurfaceDualOk = true :=
  rfl


/-- IrProgram L2 dual-pin. Greppable: hostModuleCheckIrProgramTermSurfaceOk_true. -/
theorem hostModuleCheckIrProgramTermSurfaceOk_true :
    hostModuleCheckIrProgramTermSurfaceOk = true := by native_decide

/-- TERM-SURFACE IrProgram-only. Greppable: hostModuleCheck_irprogram_term_surface_ids_eq. -/
theorem hostModuleCheck_irprogram_term_surface_ids_eq :
    checkDepthIrProgramTermSurfaceBar = "TERM-SURFACE"
      && checkDepthIrProgramTermSurfaceScope = "IrProgram-only"
      && hostModuleCheckIrProgramTermSurfaceDualOk = true := rfl

theorem hostModuleCheckIrGraphTermSurfaceOk_true :
    hostModuleCheckIrGraphTermSurfaceOk = true := by native_decide
theorem hostModuleCheck_irgraph_term_surface_ids_eq :
    checkDepthIrGraphTermSurfaceBar = "TERM-SURFACE"
      && checkDepthIrGraphTermSurfaceScope = "IrGraph-only"
      && hostModuleCheckIrGraphTermSurfaceDualOk = true := rfl
theorem hostModuleCheckHostComposeTermSurfaceOk_true :
    hostModuleCheckHostComposeTermSurfaceOk = true := by native_decide
theorem hostModuleCheck_hostcompose_term_surface_ids_eq :
    checkDepthHostComposeTermSurfaceBar = "TERM-SURFACE"
      && checkDepthHostComposeTermSurfaceScope = "HostCompose-only"
      && hostModuleCheckHostComposeTermSurfaceDualOk = true := rfl

/-- Stage / host / recipe ids + A58 deepen continue bar (Mult..Extract).
    Greppable: hostModuleCheck_ids_eq, HOST-MODULE-CHECK-THEOREM,
    FOUNDATION-KIND-SURFACE, Check depth deepen continue. -/
theorem hostModuleCheck_ids_eq :
    stageId = "SLAKE_HOST_MODULE_CHECK_V0"
      && hostId = "HOST-MODULE-CHECK"
      && lakeExeName = "slake-host-module-check"
      && justRecipe = "host-module-check"
      && justRecipeWithoutLake = "host-module-check-without-lake"
      && prebuiltHostModuleCheckRel
        = ".lake/build/bin/slake-host-module-check"
      && residualName = "First real host module check"
      && checkDepthPartial = "PARTIAL-STRUCTURAL"
      && checkDepthDeepenBar = "FOUNDATION-KIND-SURFACE"
      && checkDepthDeepenSliceName = "Check depth deepen continue" :=
  rfl

/-- Named deepen band Mult..Extract (A58). Split from ids_eq to keep
    And-chain elaborator depth honest. Greppable: hostModuleCheck_deepen_band_eq,
    checkDepthDeepenBand, Check depth deepen continue. -/
theorem hostModuleCheck_deepen_band_eq :
    checkDepthDeepenBand
      = "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+KernelEmitTheorems+EmitPlan+EmitApply+EmitBody+ParityMult+ParityLinear+ParityTypes+ParityProgram+ParityEmit+ParityMultTheorems+ParityLinearTheorems+ParityTypesTheorems+ParityProgramTheorems+ParityEmitTheorems" :=
  rfl

/-- Local free/complete/proof/llvm/PROVABLY/host-free non-claims false.
    Greppable: hostModuleCheck_claims_false, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheck_claims_false :
    hostModuleCheckResidualFreeClaimed = false
      && hostModuleCheckProductSelfHostCompleteClaimed = false
      && hostModuleCheckProofCompleteClaimed = false
      && hostModuleCheckLlvmUnlocked = false
      && hostModuleCheckProvablyUnlocked = false
      && hostModuleCheckHostFreeClaimed = false
      && stillUsesLake = true
      && dependsOnLake = true :=
  rfl


end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckTheorems
