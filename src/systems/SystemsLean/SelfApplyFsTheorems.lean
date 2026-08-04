/-
  SYSTEMS_LEAN_HOST partial -- SelfApplyFs SELF-APPLY-FS-THEOREM + SELF-APPLY-FS-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.SelfApplyFs: theorems and behavioral smoke
  live here; living claim SSoT, PartialReady chain folds, stage ids, and
  selfApplyFsOk stay in SelfApplyFs. Same namespace SystemsLean.SelfApplyFs so
  theorem names stay unqualified under that namespace.

  Spec (readable):
  - SELF-APPLY-FS-THEOREM / HOST-SELF-APPLY-FS-THEOREM: stageId_eq /
    hostSelfApplyFsId_eq / freestandingProductSelfHostComplete_true /
    freestandingSelfApplyReady_true / selfApplyFsDoesNotComplete_false /
    PartialReady chain theorems through complete dual-pin.
  - SELF-APPLY-FS-SMOKE / HOST-SELF-APPLY-FS-SMOKE: stage / map / surface /
    PartialReady / claim behavioral examples (lake build fails if example fails).

  Living claim values are SSoT on SelfApplyFs (complete true; perform/ownership/
  stepContractFull true). These tip theorems do NOT flip claim pins.

  Intentional non-claims:
  - Host structural freestanding self-apply deepen only on the tip compose.
  - NOT freestanding residual free (product free is DualResidual claim A).
  - NOT host elaborator residual free. Not proof complete.
  - Lake example smokes are NOT full proofs.
  - Not a second freestanding product self-host complete authority (tip + SelfHostComplete).

  Greppable: SYSTEMS_LEAN_HOST, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM,
  SELF-APPLY-FS-SMOKE, HOST-SELF-APPLY-FS-SMOKE, stageId_eq, hostSelfApplyFsId_eq,
  freestandingSelfApplyReady_true, freestandingProductSelfHostComplete_true,
  selfApplyFsDoesNotComplete_false, SelfApplyFsTheorems, UNIT_SURFACE host surface,
  HOST-SELF-APPLY-FS, SELF-HOST-SELF-APPLY-FS, SLAKE_SELF_HOST_SELF_APPLY_FS_V0.
  Module: SystemsLean.SelfApplyFsTheorems
  Red/green: just systems-host; lake build SystemsLean.SelfApplyFsTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding product.
  Not freestanding emit residual free. Not full LLVM backend.
  Not host elaborator residual free. Not proof complete.
-/

import SystemsLean.SelfApplyFs

namespace SystemsLean.SelfApplyFs

/-! ### SELF-APPLY-FS-THEOREM / HOST-SELF-APPLY-FS-THEOREM (readable statements, then proofs) (SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM). -/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_SELF_APPLY_FS_V0. Greppable: stageId_eq, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_SELF_APPLY_FS_V0" := rfl

/-- Host map id is greppable HOST-SELF-APPLY-FS. Greppable: hostSelfApplyFsId_eq, SELF-APPLY-FS-THEOREM. -/
theorem hostSelfApplyFsId_eq : hostSelfApplyFsId = "HOST-SELF-APPLY-FS" := rfl

/-- Living tip freestandingProductSelfHostComplete is true (claim B complete).
    Greppable: freestandingProductSelfHostComplete_true, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM. -/
theorem freestandingProductSelfHostComplete_true :
    freestandingProductSelfHostComplete = true := rfl

/-- Freestanding extract + body path ready on kernel emit compose. Greppable: freestandingSelfApplyPathReady_true, SELF-APPLY-FS-THEOREM. -/
theorem freestandingSelfApplyPathReady_true :
    freestandingSelfApplyPathReady = true := by decide

/-- SH5 freestanding deepen readiness holds (not product complete).
    Greppable: freestandingSelfApplyReady_true, HOST-SELF-APPLY-FS, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM. -/
theorem freestandingSelfApplyReady_true :
    freestandingSelfApplyReady = true := by decide

/-- Deepen ready does NOT complete freestanding product self-host. Greppable: selfApplyFsDoesNotComplete_false, SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM. -/
theorem selfApplyFsDoesNotComplete_false :
    selfApplyFsDoesNotComplete = false := by decide

/-- B2 partial product kernel self-application ready (PartialReady; living complete true).
    Greppable: productKernelSelfApplyPartialReady_true, SELF-HOST-KERNEL-SELF-APPLY, SELF-APPLY-FS-THEOREM. -/
theorem productKernelSelfApplyPartialReady_true :
    productKernelSelfApplyPartialReady = true := by decide

/-- B3 partial product Out kernel evidence ready (PartialReady; living complete true).
    Greppable: productOutKernelEvidencePartialReady_true, SELF-HOST-PRODUCT-OUT, SELF-APPLY-FS-THEOREM. -/
theorem productOutKernelEvidencePartialReady_true :
    productOutKernelEvidencePartialReady = true := by decide

/-- B4 partial product path Lake bootstrap honesty ready (PartialReady; living complete true).
    Greppable: productPathHostLakeBootstrapPartialReady_true, SELF-HOST-PRODUCT-PATH-BOOTSTRAP, SELF-APPLY-FS-THEOREM. -/
theorem productPathHostLakeBootstrapPartialReady_true :
    productPathHostLakeBootstrapPartialReady = true := by decide

/-- Host Lake bootstrap of product writer remains (honest residual; not complete).
    Greppable: productPathHostLakeBootstrapRemains_true, SELF-HOST-PRODUCT-PATH-BOOTSTRAP. -/
theorem productPathHostLakeBootstrapRemains_true :
    productPathHostLakeBootstrapRemains = true := by decide

/-- B5 partial product writer surface substrate ready (PartialReady; living complete true).
    Greppable: productWriterSurfacePartialReady_true, SELF-HOST-PRODUCT-WRITER-SURFACE, SELF-APPLY-FS-THEOREM. -/
theorem productWriterSurfacePartialReady_true :
    productWriterSurfacePartialReady = true := by decide

/-- B6 partial product writer path plan substrate ready (PartialReady; living complete true).
    Greppable: productWriterPathPlanPartialReady_true, SELF-HOST-PRODUCT-WRITER-PATH-PLAN, SELF-APPLY-FS-THEOREM. -/
theorem productWriterPathPlanPartialReady_true :
    productWriterPathPlanPartialReady = true := by decide

/-- B7 partial product writer path execution evidence ready (PartialReady; living complete true).
    Greppable: productWriterPathExecutionPartialReady_true, SELF-HOST-PRODUCT-WRITER-PATH-EXEC, SELF-APPLY-FS-THEOREM. -/
theorem productWriterPathExecutionPartialReady_true :
    productWriterPathExecutionPartialReady = true := by decide

/-- Living tip productPathFreestandingOwnershipClaimed is true (ownership claimed).
    Greppable: productPathFreestandingOwnershipClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingOwnershipClaimed_true :
    productPathFreestandingOwnershipClaimed = true := rfl

/-- B8 partial freestanding product path ownership inputs ready (PartialReady; living complete true).
    Greppable: productPathOwnershipInputsPartialReady_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP, SELF-APPLY-FS-THEOREM. -/
theorem productPathOwnershipInputsPartialReady_true :
    productPathOwnershipInputsPartialReady = true := by decide

/-- Living tip productPathFreestandingPerformClaimed is true (perform claimed).
    Greppable: productPathFreestandingPerformClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformClaimed_true :
    productPathFreestandingPerformClaimed = true := rfl

/-- productPathPerformDependsOnLake false after M6 (product path retired Lake).
    Greppable: productPathPerformDependsOnLake_false, SELF-HOST-PRODUCT-PATH-PERFORM. -/
theorem productPathPerformDependsOnLake_false :
    productPathPerformDependsOnLake = false := by decide

/-- productPathPerformInstallLakeFreeEntrypointClaimed is true (B10:
    Greppable: productPathPerformInstallLakeFreeEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM-STEP. -/
theorem productPathPerformInstallLakeFreeEntrypointClaimed_true :
    productPathPerformInstallLakeFreeEntrypointClaimed = true := by decide

/-- B9 partial freestanding product path perform gap ready (PartialReady; living complete true).
    Greppable: productPathPerformPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM, SELF-APPLY-FS-THEOREM. -/
theorem productPathPerformPartialReady_true :
    productPathPerformPartialReady = true := by decide

/-- B10 partial first perform step ready (Lake-free install-only entrypoint;
    Greppable: productPathPerformStepPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-STEP, SELF-APPLY-FS-THEOREM. -/
theorem productPathPerformStepPartialReady_true :
    productPathPerformStepPartialReady = true := by decide

/-- productPathPerformReadDependsOnLake stays true (READ still classic Lean Lake
    Greppable: productPathPerformReadDependsOnLake_true, SELF-HOST-PRODUCT-PATH-PERFORM-READ. -/
theorem productPathPerformReadDependsOnLake_true :
    productPathPerformReadDependsOnLake = true := by decide

/-- productPathPerformReadEntrypointClaimed is true (B11: just read-product-ssot
    Greppable: productPathPerformReadEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM-READ. -/
theorem productPathPerformReadEntrypointClaimed_true :
    productPathPerformReadEntrypointClaimed = true := by decide

/-- B11 partial READ-SSOT perform substrate ready (PartialReady; living complete true).
    Greppable: productPathPerformReadPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-READ, SELF-APPLY-FS-THEOREM. -/
theorem productPathPerformReadPartialReady_true :
    productPathPerformReadPartialReady = true := by decide

/-- productPathPerformComposeDependsOnLake stays true (COMPOSE still classic Lean Lake
    Greppable: productPathPerformComposeDependsOnLake_true, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE. -/
theorem productPathPerformComposeDependsOnLake_true :
    productPathPerformComposeDependsOnLake = true := by decide

/-- productPathPerformComposeEntrypointClaimed is true (B12: just compose-product-plan
    Greppable: productPathPerformComposeEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE. -/
theorem productPathPerformComposeEntrypointClaimed_true :
    productPathPerformComposeEntrypointClaimed = true := by decide

/-- B12 partial COMPOSE perform substrate ready (PartialReady; living complete true).
    Greppable: productPathPerformComposePartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, SELF-APPLY-FS-THEOREM. -/
theorem productPathPerformComposePartialReady_true :
    productPathPerformComposePartialReady = true := by decide

/-- productPathPerformWriteHcDependsOnLake stays true (WRITE-HC still classic Lean Lake
    Greppable: productPathPerformWriteHcDependsOnLake_true, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC. -/
theorem productPathPerformWriteHcDependsOnLake_true :
    productPathPerformWriteHcDependsOnLake = true := by decide

/-- productPathPerformWriteHcEntrypointClaimed is true (B13: just write-freestanding-hc
    Greppable: productPathPerformWriteHcEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC. -/
theorem productPathPerformWriteHcEntrypointClaimed_true :
    productPathPerformWriteHcEntrypointClaimed = true := by decide

/-- B13 partial WRITE-HC perform substrate ready (PartialReady; living complete true).
    Greppable: productPathPerformWriteHcPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, SELF-APPLY-FS-THEOREM. -/
theorem productPathPerformWriteHcPartialReady_true :
    productPathPerformWriteHcPartialReady = true := by decide

/-- INSTALL-OUT freestanding-capable (Lake-free) step is true (B10 / B14 measure).
    Greppable: productPathFreestandingCapableInstallOnly_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
theorem productPathFreestandingCapableInstallOnly_true :
    productPathFreestandingCapableInstallOnly = true := by decide

/-- READ freestanding-capable Lake-free measure true (partial B26). Greppable:
    Greppable: productPathFreestandingCapableRead_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
theorem productPathFreestandingCapableRead_true :
    productPathFreestandingCapableRead = true := rfl

/-- COMPOSE freestanding-capable Lake-free measure true (partial B27). Greppable:
    Greppable: productPathFreestandingCapableCompose_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
theorem productPathFreestandingCapableCompose_true :
    productPathFreestandingCapableCompose = true := rfl

/-- WRITE-HC freestanding-capable Lake-free measure true (partial B28). Greppable:
    Greppable: productPathFreestandingCapableWriteHc_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
theorem productPathFreestandingCapableWriteHc_true :
    productPathFreestandingCapableWriteHc = true := rfl

/-- Full freestanding-capable perform measure remains false (not full perform bar;
    living perform claimed is separate and true). Greppable: productPathFreestandingCapableFullPerform_false, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
theorem productPathFreestandingCapableFullPerform_false :
    productPathFreestandingCapableFullPerform = false := rfl

/-- B14 partial freestanding-capable gap measure ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapablePartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapablePartialReady_true :
    productPathFreestandingCapablePartialReady = true := by decide

/-- Authority-not-emit contract requirement is true (B15). Greppable:
    Greppable: productPathFreestandingCapableStepContractAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
theorem productPathFreestandingCapableStepContractAuthorityNotEmit_true :
    productPathFreestandingCapableStepContractAuthorityNotEmit = true := by decide

/-- READ freestanding-capable step contract satisfied (B16). Greppable:
    Greppable: productPathFreestandingCapableStepContractReadSatisfied_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
theorem productPathFreestandingCapableStepContractReadSatisfied_true :
    productPathFreestandingCapableStepContractReadSatisfied = true := by decide

/-- COMPOSE freestanding-capable step contract satisfied (B17). Greppable:
    Greppable: productPathFreestandingCapableStepContractComposeSatisfied_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
theorem productPathFreestandingCapableStepContractComposeSatisfied_true :
    productPathFreestandingCapableStepContractComposeSatisfied = true := by decide

/-- WRITE-HC freestanding-capable step contract satisfied (B18). Greppable:
    Greppable: productPathFreestandingCapableStepContractWriteHcSatisfied_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
theorem productPathFreestandingCapableStepContractWriteHcSatisfied_true :
    productPathFreestandingCapableStepContractWriteHcSatisfied = true := by decide

/-- Full freestanding-capable step contract not satisfied. Greppable:
    Greppable: productPathFreestandingCapableStepContractFullSatisfied_false, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- B15 partial freestanding-capable step contract ready (evolved B16..B18: READ,
    Greppable: productPathFreestandingCapableStepContractPartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableStepContractPartialReady_true :
    productPathFreestandingCapableStepContractPartialReady = true := by decide

/-- B16 freestanding-capable READ entrypoint claimed. Greppable:
    Greppable: productPathFreestandingCapableReadEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ. -/
theorem productPathFreestandingCapableReadEntrypointClaimed_true :
    productPathFreestandingCapableReadEntrypointClaimed = true := by decide

/-- B16 freestanding-capable READ authority is not FreestandingEmit. Greppable:
    Greppable: productPathFreestandingCapableReadAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ. -/
theorem productPathFreestandingCapableReadAuthorityNotEmit_true :
    productPathFreestandingCapableReadAuthorityNotEmit = true := by decide

/-- B16 freestanding-capable READ still Lake-hosted as exe (honest). Greppable:
    Greppable: productPathFreestandingCapableReadDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ. -/
theorem productPathFreestandingCapableReadDependsOnLake_true :
    productPathFreestandingCapableReadDependsOnLake = true := by decide

/-- B16 partial freestanding-capable READ ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableReadPartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableReadPartialReady_true :
    productPathFreestandingCapableReadPartialReady = true := by decide

/-- B17 freestanding-capable COMPOSE entrypoint claimed. Greppable:
    Greppable: productPathFreestandingCapableComposeEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE. -/
theorem productPathFreestandingCapableComposeEntrypointClaimed_true :
    productPathFreestandingCapableComposeEntrypointClaimed = true := by decide

/-- B17 freestanding-capable COMPOSE authority is not FreestandingEmit. Greppable:
    Greppable: productPathFreestandingCapableComposeAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE. -/
theorem productPathFreestandingCapableComposeAuthorityNotEmit_true :
    productPathFreestandingCapableComposeAuthorityNotEmit = true := by decide

/-- B17 freestanding-capable COMPOSE still Lake-hosted as exe (honest). Greppable:
    Greppable: productPathFreestandingCapableComposeDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE. -/
theorem productPathFreestandingCapableComposeDependsOnLake_true :
    productPathFreestandingCapableComposeDependsOnLake = true := by decide

/-- B17 partial freestanding-capable COMPOSE ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableComposePartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableComposePartialReady_true :
    productPathFreestandingCapableComposePartialReady = true := by decide

/-- B18 freestanding-capable WRITE-HC entrypoint claimed. Greppable:
    Greppable: productPathFreestandingCapableWriteHcEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC. -/
theorem productPathFreestandingCapableWriteHcEntrypointClaimed_true :
    productPathFreestandingCapableWriteHcEntrypointClaimed = true := by decide

/-- B18 freestanding-capable WRITE-HC authority is not FreestandingEmit. Greppable:
    Greppable: productPathFreestandingCapableWriteHcAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC. -/
theorem productPathFreestandingCapableWriteHcAuthorityNotEmit_true :
    productPathFreestandingCapableWriteHcAuthorityNotEmit = true := by decide

/-- B18 freestanding-capable WRITE-HC still Lake-hosted as exe (honest). Greppable:
    Greppable: productPathFreestandingCapableWriteHcDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC. -/
theorem productPathFreestandingCapableWriteHcDependsOnLake_true :
    productPathFreestandingCapableWriteHcDependsOnLake = true := by decide

/-- B18 partial freestanding-capable WRITE-HC ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableWriteHcPartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableWriteHcPartialReady_true :
    productPathFreestandingCapableWriteHcPartialReady = true := by decide

/-- B19 freestanding-capable ordered regenerate entrypoint claimed. Greppable:
    Greppable: productPathFreestandingCapableRegenerateEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE. -/
theorem productPathFreestandingCapableRegenerateEntrypointClaimed_true :
    productPathFreestandingCapableRegenerateEntrypointClaimed = true := by decide

/-- B19 freestanding-capable ordered regenerate authority is not FreestandingEmit.
    Greppable: productPathFreestandingCapableRegenerateAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE. -/
theorem productPathFreestandingCapableRegenerateAuthorityNotEmit_true :
    productPathFreestandingCapableRegenerateAuthorityNotEmit = true := by decide

/-- B19 freestanding-capable ordered regenerate still Lake-hosted as exe (honest).
    Greppable: productPathFreestandingCapableRegenerateDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE. -/
theorem productPathFreestandingCapableRegenerateDependsOnLake_true :
    productPathFreestandingCapableRegenerateDependsOnLake = true := by decide

/-- B19/B20 Install Out closed (owned by freestanding-capable install path). Greppable:
    Greppable: productPathFreestandingCapableRegenerateInstallOutOpen_false, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT. -/
theorem productPathFreestandingCapableRegenerateInstallOutOpen_false :
    productPathFreestandingCapableRegenerateInstallOutOpen = false := by decide

/-- B19 partial freestanding-capable ordered regenerate ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableRegeneratePartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableRegeneratePartialReady_true :
    productPathFreestandingCapableRegeneratePartialReady = true := by decide

/-- B20 freestanding-capable Install Out entrypoint claimed. Greppable:
    Greppable: productPathFreestandingCapableInstallOutEntrypointClaimed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT. -/
theorem productPathFreestandingCapableInstallOutEntrypointClaimed_true :
    productPathFreestandingCapableInstallOutEntrypointClaimed = true := by decide

/-- B20 freestanding-capable Install Out authority is not FreestandingEmit.
    Greppable: productPathFreestandingCapableInstallOutAuthorityNotEmit_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT. -/
theorem productPathFreestandingCapableInstallOutAuthorityNotEmit_true :
    productPathFreestandingCapableInstallOutAuthorityNotEmit = true := by decide

/-- B20 freestanding-capable Install Out still Lake-hosted as exe (honest).
    Greppable: productPathFreestandingCapableInstallOutDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT. -/
theorem productPathFreestandingCapableInstallOutDependsOnLake_true :
    productPathFreestandingCapableInstallOutDependsOnLake = true := by decide

/-- B20 partial freestanding-capable Install Out ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableInstallOutPartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableInstallOutPartialReady_true :
    productPathFreestandingCapableInstallOutPartialReady = true := by decide

/-- B21 Full-bar step contracts closed (B16..B18). Greppable:
    Greppable: productPathFreestandingCapableFullBarStepContractsClosed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarStepContractsClosed_true :
    productPathFreestandingCapableFullBarStepContractsClosed = true := by decide

/-- B21 Full-bar Install Out closed (B20). Greppable:
    Greppable: productPathFreestandingCapableFullBarInstallOutClosed_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarInstallOutClosed_true :
    productPathFreestandingCapableFullBarInstallOutClosed = true := by decide

/-- B21 Full-bar ordered regenerate joined (B19). Greppable:
    Greppable: productPathFreestandingCapableFullBarOrderedPipelineJoined_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarOrderedPipelineJoined_true :
    productPathFreestandingCapableFullBarOrderedPipelineJoined = true := by decide

/-- B21+B30 ownership regenerate without Lake closed (product path authority).
    Greppable: productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true :
    productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
      = true := rfl

/-- B21 B14 Capable* Lake-free closed after B26+B27+B28. Greppable:
    Greppable: productPathFreestandingCapableFullBarCapableLakeFree_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarCapableLakeFree_true :
    productPathFreestandingCapableFullBarCapableLakeFree = true := rfl

/-- B21 Full-bar measure still Lake-hosted diagnostic. Greppable:
    Greppable: productPathFreestandingCapableFullBarDependsOnLake_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/
theorem productPathFreestandingCapableFullBarDependsOnLake_true :
    productPathFreestandingCapableFullBarDependsOnLake = true := by decide

/-- B21+B30 partial Full-bar / ownership-gap measure ready (PartialReady; living complete true).
    Greppable: productPathFreestandingCapableFullBarPartialReady_true, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingCapableFullBarPartialReady_true :
    productPathFreestandingCapableFullBarPartialReady = true := by decide

/-- B22 ownership regenerate install step is Lake-free. Greppable:
    Greppable: productPathOwnershipRegenerateInstallLakeFree_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateInstallLakeFree_true :
    productPathOwnershipRegenerateInstallLakeFree = true := by decide

/-- B23 ownership regenerate READ Lake-free path piece. Greppable:
    Greppable: productPathOwnershipRegenerateReadLakeFree_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, OWNERSHIP-REGENERATE-READ-LAKE-FREE. -/
theorem productPathOwnershipRegenerateReadLakeFree_true :
    productPathOwnershipRegenerateReadLakeFree = true := by decide

/-- B23 ownership regenerate READ path claimed. Greppable: Greppable: productPathOwnershipRegenerateReadPathClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateReadPathClaimed_true :
    productPathOwnershipRegenerateReadPathClaimed = true := by decide

/-- B24 ownership regenerate COMPOSE Lake-free path piece. Greppable:
    Greppable: productPathOwnershipRegenerateComposeLakeFree_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, OWNERSHIP-REGENERATE-COMPOSE-LAKE-FREE. -/
theorem productPathOwnershipRegenerateComposeLakeFree_true :
    productPathOwnershipRegenerateComposeLakeFree = true := by decide

/-- B24 ownership regenerate COMPOSE path claimed. Greppable:
    Greppable: productPathOwnershipRegenerateComposePathClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateComposePathClaimed_true :
    productPathOwnershipRegenerateComposePathClaimed = true := by decide

/-- B25 ownership regenerate WRITE-HC Lake-free path piece. Greppable:
    Greppable: productPathOwnershipRegenerateWriteHcLakeFree_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, OWNERSHIP-REGENERATE-WRITE-HC-LAKE-FREE. -/
theorem productPathOwnershipRegenerateWriteHcLakeFree_true :
    productPathOwnershipRegenerateWriteHcLakeFree = true := by decide

/-- B25 ownership regenerate WRITE-HC path claimed. Greppable:
    Greppable: productPathOwnershipRegenerateWriteHcPathClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateWriteHcPathClaimed_true :
    productPathOwnershipRegenerateWriteHcPathClaimed = true := by decide

/-- B29 ordered Lake-free ownership regenerate join claimed. Greppable:
    Greppable: productPathOwnershipRegenerateLakeFreeJoinClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, OWNERSHIP-REGENERATE-LAKE-FREE-JOIN. -/
theorem productPathOwnershipRegenerateLakeFreeJoinClaimed_true :
    productPathOwnershipRegenerateLakeFreeJoinClaimed = true := by decide

/-- B30 freestanding product path authority claimed for ownership regenerate.
    Greppable: productPathOwnershipRegenerateProductPathAuthorityClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY. -/
theorem productPathOwnershipRegenerateProductPathAuthorityClaimed_true :
    productPathOwnershipRegenerateProductPathAuthorityClaimed = true := by decide

/-- B22..B30 full ownership regenerate without Lake closed (product path
    Greppable: productPathOwnershipRegenerateWithoutLake_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateWithoutLake_true :
    productPathOwnershipRegenerateWithoutLake = true := rfl

/-- B22..B30 overall ownership regenerate still DependsOnLake (measure Lake exe
    Greppable: productPathOwnershipRegenerateDependsOnLake_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateDependsOnLake_true :
    productPathOwnershipRegenerateDependsOnLake = true := by decide

/-- B22 Lake-free install path piece claimed. Greppable:
    Greppable: productPathOwnershipRegenerateInstallPathClaimed_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/
theorem productPathOwnershipRegenerateInstallPathClaimed_true :
    productPathOwnershipRegenerateInstallPathClaimed = true := by decide

/-- B22..B30 partial ownership regenerate substrate ready (PartialReady; living complete true).
    Greppable: productPathOwnershipRegeneratePartialReady_true, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, SELF-APPLY-FS-THEOREM. -/
theorem productPathOwnershipRegeneratePartialReady_true :
    productPathOwnershipRegeneratePartialReady = true := by decide

/-- B31 freestanding perform evidence claimed. Greppable: Greppable: productPathFreestandingPerformEvidenceClaimed_true, SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE. -/
theorem productPathFreestandingPerformEvidenceClaimed_true :
    productPathFreestandingPerformEvidenceClaimed = true := by decide

/-- B31 partial freestanding perform evidence ready. Greppable:
    Greppable: productPathFreestandingPerformEvidencePartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformEvidencePartialReady_true :
    productPathFreestandingPerformEvidencePartialReady = true := by decide

/-- B32 official-path gap measured. Greppable: Greppable: productPathFreestandingPerformOfficialPathGapMeasured_true, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH. -/
theorem productPathFreestandingPerformOfficialPathGapMeasured_true :
    productPathFreestandingPerformOfficialPathGapMeasured = true := by decide

/-- B32 partial official-path gap ready. Greppable:
    Greppable: productPathFreestandingPerformOfficialPathPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathPartialReady_true :
    productPathFreestandingPerformOfficialPathPartialReady = true := by decide

/-- B33 official-path alternate measured. Greppable:
    Greppable: productPathFreestandingPerformOfficialPathAlternateMeasured_true, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE. -/
theorem productPathFreestandingPerformOfficialPathAlternateMeasured_true :
    productPathFreestandingPerformOfficialPathAlternateMeasured = true := by decide

/-- B33 partial official-path alternate ready (living AlternateNotOfficial false
    Greppable: productPathFreestandingPerformOfficialPathAlternatePartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true :
    productPathFreestandingPerformOfficialPathAlternatePartialReady = true := by decide

/-- B34 dual-equality WRITE parity measured. Living tip honesty. Greppable: productPathFreestandingPerformDualEqualityWriteParityMeasured_true. -/
theorem productPathFreestandingPerformDualEqualityWriteParityMeasured_true :
    productPathFreestandingPerformDualEqualityWriteParityMeasured = true := by decide

/-- B34 partial dual-equality WRITE parity ready (living GapOpen false
    Greppable: productPathFreestandingPerformDualEqualityWriteParityPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true :
    productPathFreestandingPerformDualEqualityWriteParityPartialReady = true := by decide

/-- B35 dual-equality WRITE close path measured. Living tip honesty. Greppable: productPathFreestandingPerformDualEqualityWriteClosePathMeasured_true. -/
theorem productPathFreestandingPerformDualEqualityWriteClosePathMeasured_true :
    productPathFreestandingPerformDualEqualityWriteClosePathMeasured = true := by decide

/-- B35 partial dual-equality WRITE close path ready (living NotGapClosed false;
    Greppable: productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformDualEqualityWriteClosePathPartialReady_true :
    productPathFreestandingPerformDualEqualityWriteClosePathPartialReady = true := by decide

/-- B36 dual-equality WRITE API measured. Living tip honesty. Greppable: productPathFreestandingPerformDualEqualityWriteApiMeasured_true. -/
theorem productPathFreestandingPerformDualEqualityWriteApiMeasured_true :
    productPathFreestandingPerformDualEqualityWriteApiMeasured = true := by decide

/-- B36 partial dual-equality WRITE API ready (five honesty true; DependsOnLake true).
    Greppable: productPathFreestandingPerformDualEqualityWriteApiPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API, SELF-APPLY-FS-THEOREM. -/
theorem productPathFreestandingPerformDualEqualityWriteApiPartialReady_true :
    productPathFreestandingPerformDualEqualityWriteApiPartialReady = true := by decide

/-- B37 CAPABLE-GAP measured closed (Capable dual-eq; not perform claimed).
    Greppable: productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true, FREESTANDING-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP. -/
theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true :
    productPathFreestandingPerformDualEqualityWriteCapableGapMeasured = true := by decide

/-- B37 partial CAPABLE-GAP ready (PartialReady; living complete true; living perform claimed true).
    Greppable: productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true, SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP. -/
theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true :
    productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady = true := by decide

/-! ### Freestanding self-apply smoke (behavioral; lake build fails if example fails) -/

/-- SELF-APPLY-FS-SMOKE / HOST-SELF-APPLY-FS-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_SELF_APPLY_FS_V0" := by decide
example : hostSelfApplyFsId = "HOST-SELF-APPLY-FS" := by decide
example : selfHostSelfApplyFsId = "SELF-HOST-SELF-APPLY-FS" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/SelfApplyFs.lean" := by decide
example : selfApplyStageCite = "SLAKE_SELF_HOST_SELF_APPLY_V0" := by decide
example : emitKernelStageCite = "SLAKE_SELF_HOST_KERNEL_EMIT_V0" := by decide
example : parityEmitStageCite = "SLAKE_SELF_HOST_PARITY_EMIT_V0" := by decide
example : hostParityEmitCite = "HOST-PARITY-EMIT" := by decide
example : selfHostParityEmitCite = "SELF-HOST-PARITY-EMIT" := by decide
example : productEmitBodyId = "EMIT_BODY_V0" := by decide
example : productHostEmitSsotId = "HOST-EMIT-SSOT" := by decide
example : productHostEmitMultId = "HOST-EMIT-MULT" := by decide
example : runtimeFsMarker = "RUNTIME-FS" := by decide
example : emitBoundaryMarker = "EMIT-BOUNDARY" := by decide
example : selfApplyFsSurfaceOk = true := by decide

/-- SELF-APPLY-FS-SMOKE: freestanding extract path (empty / unminted / emit host). -/
example : freestandingExtractPathReady = true := by decide
example : HostCompose.extractOkFs HostCompose.empty = true := by decide
example : HostCompose.extractOkFs KernelEmit.unmintedEmitCompose = false := by decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc => HostCompose.extractOkFs hc
     | none => false) = true := by decide

/-- SELF-APPLY-FS-SMOKE: freestanding body path (empty / unminted / emit host). -/
example : freestandingBodyPathReady = true := by decide
example : EmitBody.bodyOk HostCompose.empty = true := by decide
example : EmitBody.bodyOk KernelEmit.unmintedEmitCompose = false := by decide
example : EmitMult.emitMultReady = true := by decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc =>
         let b := EmitBody.bodyFromCompose hc
         EmitBody.bodyOk hc && EmitBody.bodyIsValid b
           && EmitBody.bufHasRuntimeFsMarker b.buf
           && b.buf == KernelEmit.expectedBodyFragment
     | none => false) = true := by decide

/-- SELF-APPLY-FS-SMOKE: path ready compose. -/
example : freestandingSelfApplyPathReady = true := by decide

/-- SELF-APPLY-FS-SMOKE: freestanding Mult..Emit parity ladder compose. -/
example : freestandingParityLadderReady = true := by decide
example : freestandingEmitParityReady = true := by decide
example : ParityEmit.multLinearTypesProgramEmitParityReady = true := by decide
example : ParityEmit.emitParityReady = true := by decide

/-- SELF-APPLY-FS-SMOKE: complete flag false; deepen ready true; does not complete. -/
example : freestandingProductSelfHostComplete = true := by decide
example : SelfApply.selfApplyReady = true := by decide
example : freestandingSelfApplyReady = true := by decide
example : selfApplyFsDoesNotComplete = false := by decide
example : selfApplyFsOk = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-KERNEL-SELF-APPLY: B2 chain fold on tip.
    Historical stage/bar string examples live on KernelSelfApply. -/
example : productKernelSelfApplyPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-OUT: B3 chain fold on tip.
    Historical stage/path/API string examples live on ProductOutKernel. -/
example : productOutKernelEvidencePartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-BOOTSTRAP: B4 chain fold + remains.
    Historical stage/writer-path string examples live on BootstrapHonesty. -/
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathHostLakeBootstrapPartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-WRITER-SURFACE: B5 chain fold.
    Historical stage/API/ownership string examples live on
    ProductPathWriterSurfaceTheorems. -/
example : productWriterSurfacePartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-WRITER-PATH-PLAN: B6 partial writer path plan.
    Historical stage/step examples live on ProductPathWriterPathPlanTheorems. -/
example : productWriterPathPlanPartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productWriterSurfacePartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-WRITER-PATH-EXEC: B7 partial writer path exec.
    Historical stage/fn examples live on ProductPathWriterPathExecTheorems. -/
example : productWriterPathExecutionPartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productWriterPathPlanPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-OWNERSHIP: B8 ownership inputs.
    Historical stage/path/Ok examples live on ProductPathOwnershipInputsTheorems. -/
example : productPathOwnershipInputsPartialReady = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productWriterPathExecutionPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM: B9 perform gap. -/
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathPerformPartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathOwnershipInputsPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-STEP: B10 install step. -/
example : productPathPerformInstallLakeFreeEntrypointClaimed = true := by decide
example : productPathPerformStepPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathPerformPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-READ: B11 READ-SSOT. -/
example : productPathPerformReadEntrypointClaimed = true := by decide
example : productPathPerformReadDependsOnLake = true := by decide
example : productPathPerformReadPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathPerformStepPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE: B12 COMPOSE. -/
example : productPathPerformComposeEntrypointClaimed = true := by decide
example : productPathPerformComposeDependsOnLake = true := by decide
example : productPathPerformComposePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathPerformReadPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC: B13 WRITE-HC. -/
example : productPathPerformWriteHcEntrypointClaimed = true := by decide
example : productPathPerformWriteHcDependsOnLake = true := by decide
example : productPathPerformWriteHcPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathPerformComposePartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP: B14.
    Dual-pin thin batch 13: stage/recipe/exe/Ok/LakeFree smoke on Capable home. -/
example : productPathFreestandingCapableInstallOnly = true := by decide
example : productPathFreestandingCapableRead = true := by decide
example : productPathFreestandingCapableCompose = true := by decide
example : productPathFreestandingCapableWriteHc = true := by decide
example : productPathFreestandingCapableFullPerform = false := by decide
example : productPathFreestandingCapablePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathPerformWriteHcPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT: B15.
    Dual-pin thin batch 14: honesty + fold + claim chain only (stage/Ok/recipe home). -/
example : productPathFreestandingCapableStepContractAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableStepContractReadSatisfied = true := by decide
example : productPathFreestandingCapableStepContractComposeSatisfied = true := by decide
example : productPathFreestandingCapableStepContractWriteHcSatisfied = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : stepContractFull = true := by decide
example : productPathFreestandingCapableStepContractPartialReady = true := by decide
example : productPathFreestandingCapablePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathHostLakeBootstrapRemains = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ: B16.
    Dual-pin thin batch 15: honesty + fold + claim chain only (stage/Ok/recipe home). -/
example : productPathFreestandingCapableReadEntrypointClaimed = true := by decide
example : productPathFreestandingCapableReadAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableReadDependsOnLake = true := by decide
example : productPathFreestandingCapableReadPartialReady = true := by decide
example : productPathFreestandingCapableRead = true := by decide
example : productPathFreestandingCapableStepContractReadSatisfied = true := by decide
example : productPathFreestandingCapableStepContractPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE: B17.
    Dual-pin thin batch 16: stage/recipe/exe/Ok home-primary; tip honesty + fold. -/
example : productPathFreestandingCapableComposeEntrypointClaimed = true := by decide
example : productPathFreestandingCapableComposeAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableComposeDependsOnLake = true := by decide
example : productPathFreestandingCapableComposePartialReady = true := by decide
example : productPathFreestandingCapableCompose = true := by decide
example : productPathFreestandingCapableStepContractComposeSatisfied = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC: B18+B28.
    Dual-pin thin batch 17: stage/recipe/exe/Ok home-primary; tip honesty + fold. -/
example : productPathFreestandingCapableWriteHcEntrypointClaimed = true := by decide
example : productPathFreestandingCapableWriteHcAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableWriteHcDependsOnLake = true := by decide
example : productPathFreestandingCapableWriteHcPartialReady = true := by decide
example : productPathFreestandingCapableWriteHc = true := by decide
example : productPathFreestandingCapableStepContractWriteHcSatisfied = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE: B19.
    Dual-pin thin batch 18: stage/recipe/exe/Ok/pipeline home-primary; tip honesty + fold. -/
example : productPathFreestandingCapableRegenerateEntrypointClaimed = true := by decide
example : productPathFreestandingCapableRegenerateAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableRegenerateDependsOnLake = true := by decide
example : productPathFreestandingCapableRegenerateInstallOutOpen = false := by decide
example : productPathFreestandingCapableRegeneratePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT: B20.
    Dual-pin thin batch 19: stage/recipe/exe/Ok/cites home-primary; tip honesty + fold. -/
example : productPathFreestandingCapableInstallOutEntrypointClaimed = true := by decide
example : productPathFreestandingCapableInstallOutAuthorityNotEmit = true := by decide
example : productPathFreestandingCapableInstallOutDependsOnLake = true := by decide
example : productPathFreestandingCapableInstallOutPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR: B21.
    Dual-pin thin batch 20: stage/recipe/exe/Ok/Req* home-primary; tip honesty + fold. -/
example : productPathFreestandingCapableFullBarStepContractsClosed = true := by decide
example : productPathFreestandingCapableFullBarInstallOutClosed = true := by decide
example : productPathFreestandingCapableFullBarOrderedPipelineJoined = true := by decide
example : productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
    = true := by decide
example : productPathFreestandingCapableFullBarCapableLakeFree = true := by decide
example : productPathFreestandingCapableFullBarDependsOnLake = true := by decide
example : productPathFreestandingCapableFullBarPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE: B22..B30
    honesty + chain fold (dual-pin thin batch 21; stage/recipe/Ok home-primary). -/
example : productPathOwnershipRegenerateInstallLakeFree = true := by decide
example : productPathOwnershipRegenerateReadLakeFree = true := by decide
example : productPathOwnershipRegenerateComposeLakeFree = true := by decide
example : productPathOwnershipRegenerateWriteHcLakeFree = true := by decide
example : productPathOwnershipRegenerateLakeFreeJoinClaimed = true := by decide
example : productPathOwnershipRegenerateProductPathAuthorityClaimed
    = true := by decide
example : productPathOwnershipRegenerateWithoutLake = true := by decide
example : productPathOwnershipRegenerateDependsOnLake = true := by decide
example : productPathOwnershipRegenerateInstallPathClaimed = true := by decide
example : productPathOwnershipRegenerateReadPathClaimed = true := by decide
example : productPathOwnershipRegenerateComposePathClaimed = true := by decide
example : productPathOwnershipRegenerateWriteHcPathClaimed = true := by decide
example : productPathOwnershipRegeneratePartialReady = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
    = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE: B31 honesty +
    chain fold (dual-pin thin batch 22; stage/recipe/Ok home-primary). -/
example : productPathFreestandingPerformEvidenceClaimed = true := by decide
example : productPathFreestandingPerformEvidencePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathOwnershipRegeneratePartialReady = true := by decide
example : productPathOwnershipRegenerateProductPathAuthorityClaimed
    = true := by decide
example : productPathOwnershipRegenerateWithoutLake = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH: B32 honesty +
    chain fold (dual-pin thin batch 23; stage/recipe/Ok home-primary). -/
example : productPathFreestandingPerformOfficialPathGapMeasured = true := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathStillUsesLake = false := by decide
example : productPathOfficialPathRetireFreestandingEmitRequired = false := by decide
example : productPathFreestandingPerformOfficialPathPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathFreestandingPerformEvidenceClaimed = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE: B33.
    Dual-pin thin batch 24: fold/claim chain only (Ok/stage/recipe home-primary). -/
example : productPathFreestandingPerformOfficialPathAlternateMeasured = true := by decide
example : productPathOfficialPathAlternateWriterPresent = true := by decide
example : productPathOfficialPathAlternateNotOfficial = false := by decide
example : productPathOfficialPathDualEqualityBlocksRetirement = false := by decide
example : productPathFreestandingPerformOfficialPathAlternatePartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathRetireFreestandingEmitRequired = false := by decide
example : productPathFreestandingPerformOfficialPathGapMeasured = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-PARITY: B34.
    Dual-pin thin batch 25: honesty + PartialReady fold only (Ok/stage/recipe home). -/
example : productPathFreestandingPerformDualEqualityWriteParityMeasured = true := by decide
example : productPathDualEqualityWriteParityGapOpen = false := by decide
example : productPathCapableWriteStructuralNotDualEquality = false := by decide
example : productPathFreestandingPerformDualEqualityWriteParityPartialReady = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathPerformDependsOnLake = false := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathRetireFreestandingEmitRequired = false := by decide
example : productPathOfficialPathDualEqualityBlocksRetirement = false := by decide
example : productPathFreestandingPerformOfficialPathAlternateMeasured = true := by decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CLOSE-PATH: B35.
    Dual-pin thin batch 26: honesty + PartialReady fold only (Ok/stage/recipe home). -/
example : productPathFreestandingPerformDualEqualityWriteClosePathMeasured = true := by decide
example : productPathDualEqualityWriteClosePathNamed = true := by decide
example : productPathDualEqualityWriteClosePathNotGapClosed = false := by decide
example : productPathFreestandingPerformDualEqualityWriteClosePathPartialReady = true := by decide
example : productPathDualEqualityWriteParityGapOpen = false := by decide
example : productPathCapableWriteStructuralNotDualEquality = false := by decide
example : productPathFreestandingPerformClaimed = true := by decide
/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-API: B36.
    Dual-pin thin batch 27: honesty + PartialReady fold only (Ok/stage/recipe home). -/
example : productPathFreestandingPerformDualEqualityWriteApiMeasured = true := by decide
example : productPathDualEqualityWriteApiPresent = true := by decide
example : productPathDualEqualityWriteApiAuthorityNotEmit = true := by decide
example : productPathDualEqualityWriteApiNotOfficial = true := by decide
example : productPathDualEqualityWriteApiStepAdvanced = true := by decide
example : freestandingDualEqualityWriteApiCite
    = "freestandingDualEqualityWriteFreestandingHc" := by decide
example : productPathFreestandingPerformDualEqualityWriteApiPartialReady = true := by decide
example : productPathDualEqualityWriteParityGapOpen = false := by decide
example : productPathCapableWriteStructuralNotDualEquality = false := by decide
example : productPathFreestandingPerformClaimed = true := by decide

/-- SELF-APPLY-FS-SMOKE / SELF-HOST-PRODUCT-PATH-PERFORM-DUAL-EQUALITY-WRITE-CAPABLE-GAP: B37.
    Dual-pin thin batch 28: honesty + PartialReady fold only (Ok/stage/recipe home). -/
example : productPathFreestandingPerformDualEqualityWriteCapableGapMeasured = true := by decide
example : productPathDualEqualityWriteCapableGapClosed = true := by decide
example : productPathCapableWriteDualEqualityLive = true := by decide
example : productPathDualEqualityWriteCapableGapStepAdvanced = true := by decide
example : productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady = true := by decide
example : productPathDualEqualityWriteParityGapOpen = false := by decide
example : productPathCapableWriteStructuralNotDualEquality = false := by decide
example : productPathFreestandingPerformClaimed = true := by decide

example : productPathOfficialPathRetireOfficialMeasured = true := by decide
example : productPathOfficialPathUsesDualEqualityWrite = true := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathRetireOfficialPartialReady = true := by decide
theorem productPathOfficialPathRetireOfficialMeasured_true :
    productPathOfficialPathRetireOfficialMeasured = true := by decide
theorem productPathOfficialPathRetireOfficialPartialReady_true :
    productPathOfficialPathRetireOfficialPartialReady = true := by decide
theorem productPathOfficialPathUsesDualEqualityWrite_true :
    productPathOfficialPathUsesDualEqualityWrite = true := rfl

/-- SELF-APPLY-FS-SMOKE / B39 PERFORM-CLAIMED. -/
example : productPathFreestandingPerformClaimedMeasured = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathFreestandingPerformClaimedPartialReady = true := by decide
theorem productPathFreestandingPerformClaimedMeasured_true :
    productPathFreestandingPerformClaimedMeasured = true := by decide
theorem productPathFreestandingPerformClaimedPartialReady_true :
    productPathFreestandingPerformClaimedPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / B40 OWNERSHIP-CLAIMED. -/
example : productPathFreestandingOwnershipClaimedMeasured = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathFreestandingOwnershipClaimedPartialReady = true := by decide
theorem productPathFreestandingOwnershipClaimedPartialReady_true :
    productPathFreestandingOwnershipClaimedPartialReady = true := by decide
theorem productPathFreestandingOwnershipClaimedMeasured_true :
    productPathFreestandingOwnershipClaimedMeasured = true := by decide

/-- SELF-APPLY-FS-SMOKE / Full step-contract. -/
example : stepContractFullMeasured = true := by decide
example : stepContractFull = true := by decide
example : stepContractFullPartialReady = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
theorem stepContractFull_true : stepContractFull = true := rfl
theorem stepContractFullMeasured_true : stepContractFullMeasured = true := by decide
theorem stepContractFullPartialReady_true : stepContractFullPartialReady = true := by decide

/-- SELF-APPLY-FS-SMOKE / claim B freestanding product self-host complete. -/
example : freestandingProductSelfHostCompleteMeasured = true := by decide
example : freestandingProductSelfHostComplete = true := by decide
example : freestandingProductSelfHostCompletePartialReady = true := by decide
example : stepContractFull = true := by decide
example : productPathFreestandingOwnershipClaimed = true := by decide
example : productPathFreestandingPerformClaimed = true := by decide
example : productPathOfficialPathStillUsesFreestandingEmit = false := by decide
example : productPathOfficialPathUsesDualEqualityWrite = true := by decide
theorem freestandingProductSelfHostCompleteMeasured_true :
    freestandingProductSelfHostCompleteMeasured = true := by decide
theorem freestandingProductSelfHostCompletePartialReady_true :
    freestandingProductSelfHostCompletePartialReady = true := by decide


end SystemsLean.SelfApplyFs
