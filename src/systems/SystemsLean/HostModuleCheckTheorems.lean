/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck HOST-MODULE-CHECK-THEOREM +
  HOST-MODULE-CHECK-SMOKE surface.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheck: theorems and smoke live
  here; seed surfaces, structural checks, readiness pins, and driver IO stay
  in HostModuleCheck. Same namespace SystemsLean.HostModuleCheck so theorem
  names stay unqualified under that namespace.

  Spec (readable):
  - HOST-MODULE-CHECK-THEOREM: loadOk / ready / without-Lake / Mult+Linear+
    Types+Program+Graph+Compose good accept / Mult fail-closed / ids /
    claims_false.
  - HOST-MODULE-CHECK-SMOKE: behavioral examples over the same pins.
  - Host compose expand: Mult+...+IrGraph+IrGraphTheorems+HostCompose+
    HostComposeTheorems.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HOST-MODULE-CHECK-THEOREM,
  HOST-MODULE-CHECK-SMOKE, hostModuleCheckReady_true, hostModuleCheckLoadOk_true,
  hostModuleCheckGoodLinear_accept, hostModuleCheckGoodTypes_accept,
  hostModuleCheckGoodIrProgram_accept, hostModuleCheckGoodIrGraph_accept,
  hostModuleCheckGoodHostCompose_accept,
  Host library seed expand continue, Host real module seed expand,
  Host theorem check expand, Host compose module expand, Host graph module expand,
  Host program module expand, Host module set expand,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems,
  HostModuleCheckTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.HostModuleCheckTheorems
  Greppable: MULT-0 (host Mult IR contract cite; theorems surface honesty).
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.HostModuleCheck

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

/-- Stage / host / recipe ids.
    Greppable: hostModuleCheck_ids_eq, HOST-MODULE-CHECK-THEOREM. -/
theorem hostModuleCheck_ids_eq :
    stageId = "SLAKE_HOST_MODULE_CHECK_V0"
      && hostId = "HOST-MODULE-CHECK"
      && lakeExeName = "slake-host-module-check"
      && justRecipe = "host-module-check"
      && justRecipeWithoutLake = "host-module-check-without-lake"
      && prebuiltHostModuleCheckRel
        = ".lake/build/bin/slake-host-module-check"
      && residualName = "First real host module check"
      && checkDepthPartial = "PARTIAL-STRUCTURAL" :=
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

/-! ### HOST-MODULE-CHECK-SMOKE (quick examples) -/

example : hostModuleCheckLoadOk = true := by native_decide
example : hostModuleCheckReady = true := by native_decide
example : hostModuleCheckWithoutLakeReady = true := by native_decide
example : hostModuleCheckFinishedClaimed = true := rfl
example : hostModuleCheckWithoutLakeFinished = true := rfl
example : hostModuleCheckHostElaboratorResidualRemains = true := rfl
example : hostModuleCheckHostFreeClaimed = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-module-check" := rfl
example : justRecipe = "host-module-check" := rfl
example : justRecipeWithoutLake = "host-module-check-without-lake" := rfl
example :
    prebuiltHostModuleCheckRel =
      ".lake/build/bin/slake-host-module-check" :=
  rfl
example : residualName = "First real host module check" := rfl
example : hostModuleCheckExpandSliceName = "Host library seed expand continue" :=
  rfl
example :
    hostModuleCheckSeedUnitsLabel =
      "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems" :=
  rfl
example : checkDepthPartial = "PARTIAL-STRUCTURAL" := rfl
example : hostModuleCheckGoodMult.isAccept = true := by native_decide
example : hostModuleCheckGoodMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodIrProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodIrProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodIrGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodIrGraphTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodHostCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodHostComposeTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodErasure.isAccept = true := by native_decide
example : hostModuleCheckGoodErasureTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodExtract.isAccept = true := by native_decide
example : hostModuleCheckGoodExtractTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodCompilePath.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelMult.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelLinearTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelTypesTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodJoinMap.isAccept = true := by native_decide
example : hostModuleCheckGoodJoinMapTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHost.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfHostTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSurfaceMatrix.isAccept = true := by native_decide
example : hostModuleCheckGoodSurfaceMatrixTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitMultScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitLinearScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitTypesScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitProgramScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitGraphScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitComposeScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitPlanScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitApplyScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBodyScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitErasureScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitExtractScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBannerScaffold.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelSelfApply.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelSelfApplyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitMult.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitPlan.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitApply.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBody.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodKernelEmitTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityMult.isAccept = true := by native_decide
example : hostModuleCheckGoodParityMultTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodParityLinearTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodParityTypesTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodParityProgramTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodParityEmit.isAccept = true := by native_decide
example : hostModuleCheckGoodParityEmitTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApply.isAccept = true := by native_decide
example : hostModuleCheckGoodSelfApplyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitLinear.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitTypes.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitProgram.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitGraph.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitCompose.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitErasure.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitExtract.isAccept = true := by native_decide
example : hostModuleCheckGoodEmitBanner.isAccept = true := by native_decide
example : hostModuleCheckGoodProductOutKernel.isAccept = true := by native_decide
example : hostModuleCheckGoodProductOutKernelTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodBootstrapHonesty.isAccept = true := by native_decide
example : hostModuleCheckGoodBootstrapHonestyTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterSurface.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathPlan.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathExec.isAccept = true := by native_decide
example : hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept = true := by native_decide
example :
    hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl
      = true := by
  native_decide
example :
    hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace
      = true := by
  native_decide
example :
    hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule = true := by
  native_decide
example :
    hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl
      = true := by
  native_decide

end SystemsLean.HostModuleCheck
