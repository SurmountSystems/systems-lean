/-
  SYSTEMS_LEAN_HOST partial -- CapableRead READ-THEOREM + READ-SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.CapableRead: theorems and behavioral smoke
  live here; stage ids, dual-SSOT read IO, Ok / PartialReady folds, and
  main stay in CapableRead. Same namespace SystemsLean.CapableRead so
  theorem names stay unqualified under that namespace.

  Spec (readable):
  - READ-THEOREM / HOST-READ-THEOREM: stageId_eq / hostId_eq / selfHostId_eq /
    contractStepRead_eq / gapReadSsot_eq / freestandingCapableReadApi_eq /
    lakeExeName_eq / justRecipeName_eq /
    productPathFreestandingCapableReadLakeFreeRecipe_eq /
    productPathFreestandingCapableReadAuthorityNotEmit_true /
    productPathFreestandingCapableReadDependsOnLake_true /
    productPathFreestandingCapableStepContractFullSatisfied_false /
    productPathFreestandingCapableReadOk_true /
    productPathFreestandingCapableReadPartialReady_true.
  - READ-SMOKE / HOST-READ-SMOKE: stage / map / Ok / PartialReady /
    authority / Lake dependency / Full land-time false behavioral examples
    (lake build fails if example fails).

  These READ theorems do NOT set SpecProof.proofCompleteClaimed true.
  They do NOT flip residual free / llvm / PROVABLY. Land-time Full long-name
  pin stays false on this home; living tip stepContractFull is separate.

  Intentional non-claims:
  - READ surface honesty only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT llvm unlock. NOT freestanding emit residual free.
  - NOT freestanding perform claimed. NOT complete flip on this module.
  - Lake example smokes are NOT full proofs.
  - Lake-hosted diagnostic path remains DependsOnLake true (B14 CapableRead
    true after B26 Lake-free freestanding-capable-read-lake-free measure).

  Greppable: SYSTEMS_LEAN_HOST, READ-THEOREM, HOST-READ-THEOREM,
  READ-SMOKE, HOST-READ-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  contractStepRead_eq, gapReadSsot_eq, freestandingCapableReadApi_eq,
  lakeExeName_eq, justRecipeName_eq,
  productPathFreestandingCapableReadLakeFreeRecipe_eq,
  productPathFreestandingCapableReadAuthorityNotEmit_true,
  productPathFreestandingCapableReadDependsOnLake_true,
  productPathFreestandingCapableStepContractFullSatisfied_false,
  productPathFreestandingCapableReadOk_true,
  productPathFreestandingCapableReadPartialReady_true,
  CapableReadTheorems, UNIT_SURFACE host surface, RUNTIME-FS,
  FREESTANDING-CAPABLE-STEP-CONTRACT-READ, FREESTANDING-PERFORM-GAP-READ-SSOT,
  freestandingCapableReadDualSsot,
  freestanding-capable-read, slake-freestanding-capable-read,
  freestanding-capable-read-lake-free,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ.
  Module: SystemsLean.CapableReadTheorems
  Red/green: just systems-host; lake build SystemsLean.CapableReadTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.CapableRead

namespace SystemsLean.CapableRead

/-! ### READ-THEOREM / HOST-READ-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is freestanding-
  capable READ surface honesty only. Does not flip residual free / llvm /
  PROVABLY; does not claim freestanding perform or complete.
-/

/-- Primary stage id is greppable SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0.
    Greppable: stageId_eq, READ-THEOREM, HOST-READ-THEOREM. -/
theorem stageId_eq :
    stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0" := rfl

/-- Host map id is greppable HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ.
    Greppable: hostId_eq, READ-THEOREM. -/
theorem hostId_eq :
    hostId = "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ" := rfl

/-- Short map id is greppable SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ.
    Greppable: selfHostId_eq, READ-THEOREM. -/
theorem selfHostId_eq :
    selfHostId = "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ" := rfl

/-- Named freestanding-capable step contract READ token.
    Greppable: contractStepRead_eq, FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
    READ-THEOREM. -/
theorem contractStepRead_eq :
    contractStepRead = "FREESTANDING-CAPABLE-STEP-CONTRACT-READ" := rfl

/-- Named freestanding-capable READ gap token.
    Greppable: gapReadSsot_eq, FREESTANDING-PERFORM-GAP-READ-SSOT, READ-THEOREM. -/
theorem gapReadSsot_eq :
    gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := rfl

/-- Real freestanding-capable READ API name.
    Greppable: freestandingCapableReadApi_eq,
    freestandingCapableReadDualSsot, READ-THEOREM. -/
theorem freestandingCapableReadApi_eq :
    freestandingCapableReadApi = "freestandingCapableReadDualSsot" := rfl

/-- Lake exe name for READ diagnostic.
    Greppable: lakeExeName_eq, slake-freestanding-capable-read, READ-THEOREM. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-freestanding-capable-read" := rfl

/-- just recipe name (Lake-hosted diagnostic).
    Greppable: justRecipeName_eq, freestanding-capable-read, READ-THEOREM. -/
theorem justRecipeName_eq :
    justRecipeName = "freestanding-capable-read" := rfl

/-- Lake-free freestanding-capable READ recipe (B26 CapableRead measure).
    Greppable: productPathFreestandingCapableReadLakeFreeRecipe_eq,
    freestanding-capable-read-lake-free, READ-THEOREM. -/
theorem productPathFreestandingCapableReadLakeFreeRecipe_eq :
    productPathFreestandingCapableReadLakeFreeRecipe =
      "freestanding-capable-read-lake-free" := rfl

/-- Product authority is not FreestandingEmit.
    Greppable: productPathFreestandingCapableReadAuthorityNotEmit_true,
    READ-THEOREM, HOST-READ-THEOREM. -/
theorem productPathFreestandingCapableReadAuthorityNotEmit_true :
    productPathFreestandingCapableReadAuthorityNotEmit = true := rfl

/-- B16 READ Lake exe host diagnostic remains Lake-dependent.
    Greppable: productPathFreestandingCapableReadDependsOnLake_true,
    READ-THEOREM, HOST-READ-THEOREM. -/
theorem productPathFreestandingCapableReadDependsOnLake_true :
    productPathFreestandingCapableReadDependsOnLake = true := rfl

/-- Land-time Full step-contract long-name pin stays false on this home.
    Living tip stepContractFull is a separate SSoT. Greppable:
    productPathFreestandingCapableStepContractFullSatisfied_false,
    READ-THEOREM. -/
theorem productPathFreestandingCapableStepContractFullSatisfied_false :
    productPathFreestandingCapableStepContractFullSatisfied = false := rfl

/-- READ surface Ok fold holds.
    Greppable: productPathFreestandingCapableReadOk_true,
    READ-THEOREM, HOST-READ-THEOREM. -/
theorem productPathFreestandingCapableReadOk_true :
    productPathFreestandingCapableReadOk = true := by
  decide

/-- READ PartialReady fold holds (closed B16 substrate).
    Greppable: productPathFreestandingCapableReadPartialReady_true,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ, READ-THEOREM,
    HOST-READ-THEOREM. -/
theorem productPathFreestandingCapableReadPartialReady_true :
    productPathFreestandingCapableReadPartialReady = true := by
  decide

/-! ### READ-SMOKE / HOST-READ-SMOKE (behavioral; lake build fails if false)

  Stage / map / Ok / PartialReady / authority / Lake / Full land-time false.
  Does not complete SpecProof; does not claim residual free / PROVABLY / llvm.
-/

example : stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0" := by
  decide
example : hostId = "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ" := by
  decide
example : selfHostId = "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ" := by
  decide
example : contractStepRead = "FREESTANDING-CAPABLE-STEP-CONTRACT-READ" := by
  decide
example : gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := by
  decide
example : freestandingCapableReadApi = "freestandingCapableReadDualSsot" := by
  decide
example : lakeExeName = "slake-freestanding-capable-read" := by
  decide
example : justRecipeName = "freestanding-capable-read" := by
  decide
example :
    productPathFreestandingCapableReadLakeFreeRecipe =
      "freestanding-capable-read-lake-free" := by
  decide
example : productPathFreestandingCapableReadAuthorityNotEmit = true := by
  decide
example : productPathFreestandingCapableReadDependsOnLake = true := by
  decide
example : productPathFreestandingCapableStepContractFullSatisfied = false := by
  decide
example : productPathFreestandingCapableReadOk = true := by
  decide
example : productPathFreestandingCapableReadPartialReady = true := by
  decide

end SystemsLean.CapableRead
