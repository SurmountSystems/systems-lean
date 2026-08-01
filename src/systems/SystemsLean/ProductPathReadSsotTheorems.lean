/-
  SYSTEMS_LEAN_HOST partial -- ProductPathReadSsot READ-SSOT-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ProductPathReadSsot: theorems and behavioral
  smoke live here; stage ids, claim Bools, recipe/exe/module cites, Ok /
  PartialReady folds, DualSsotSpec helpers, readDualSsotAtRoot, and
  diagnostic main stay in ProductPathReadSsot. Same namespace
  SystemsLean.ProductPathReadSsot so theorem names stay unqualified under
  that namespace.

  Spec (readable):
  - READ-SSOT-THEOREM / HOST-READ-SSOT-THEOREM: stageId_eq /
    hostId_eq / selfHostId_eq /
    productPathPerformReadOk_true /
    productPathPerformReadPartialReady_true +
    DependsOnLake true / EntrypointClaimed true + gap / recipe / exe /
    module / fn cites.
  - READ-SSOT-SMOKE / HOST-READ-SSOT-SMOKE: stage / map / Ok /
    PartialReady / claim bool behavioral examples (lake build fails if
    example fails).

  These READ-SSOT theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time ReadDependsOnLake stays true; EntrypointClaimed
  true is substrate only (not freestanding perform claimed). Complete true
  lives on tip / SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - READ-SSOT surface honesty only -- NOT freestanding residual free.
  - NOT freestanding perform claimed flip here.
  - NOT free / llvm / PROVABLY unlock.
  - NOT HEADER/BODY parse or DUAL-SSOT-EQUALITY (stays FreestandingEmit /
    CapableRead depth).
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, READ-SSOT-THEOREM,
  HOST-READ-SSOT-THEOREM, READ-SSOT-SMOKE,
  HOST-READ-SSOT-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathPerformReadOk_true,
  productPathPerformReadPartialReady_true,
  productPathPerformReadDependsOnLake_true,
  productPathPerformReadEntrypointClaimed_true,
  gapReadSsot_eq, lakeExeName_eq, justRecipeName_eq,
  readModuleCite_eq, readFnCite_eq,
  ProductPathReadSsotTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-READ,
  FREESTANDING-PERFORM-GAP-READ-SSOT,
  read-product-ssot, slake-read-product-ssot,
  readDualSsotAtRoot, ProductPathReadSsot.
  Module: SystemsLean.ProductPathReadSsotTheorems
  Red/green: just systems-host; lake build SystemsLean.ProductPathReadSsotTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.ProductPathReadSsot

namespace SystemsLean.ProductPathReadSsot

/-! ### READ-SSOT-THEOREM / HOST-READ-SSOT-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B11
  READ-SSOT perform substrate surface honesty only. Does not flip residual
  free / llvm / PROVABLY; DependsOnLake stays true; EntrypointClaimed true
  is substrate only (not freestanding perform claimed).
-/

/-- Primary stage id is greppable
    SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0.
    Greppable: stageId_eq, READ-SSOT-THEOREM,
    HOST-READ-SSOT-THEOREM. -/
theorem stageId_eq :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0" :=
  rfl

/-- Host map id is greppable
    HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ.
    Greppable: hostId_eq, READ-SSOT-THEOREM. -/
theorem hostId_eq :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ" :=
  rfl

/-- Short map id is greppable
    SELF-HOST-PRODUCT-PATH-PERFORM-READ.
    Greppable: selfHostId_eq, READ-SSOT-THEOREM. -/
theorem selfHostId_eq :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-READ" :=
  rfl

/-- READ step still DependsOnLake (classic Lean Lake host exe).
    Greppable: productPathPerformReadDependsOnLake_true,
    READ-SSOT-THEOREM. -/
theorem productPathPerformReadDependsOnLake_true :
    productPathPerformReadDependsOnLake = true :=
  rfl

/-- READ entrypoint claimed (just read-product-ssot /
    lake exe slake-read-product-ssot / readDualSsotAtRoot).
    NOT freestanding perform claimed.
    Greppable: productPathPerformReadEntrypointClaimed_true,
    READ-SSOT-THEOREM. -/
theorem productPathPerformReadEntrypointClaimed_true :
    productPathPerformReadEntrypointClaimed = true :=
  rfl

/-- READ surface Ok fold holds.
    Greppable: productPathPerformReadOk_true,
    READ-SSOT-THEOREM, HOST-READ-SSOT-THEOREM. -/
theorem productPathPerformReadOk_true :
    productPathPerformReadOk = true := by
  decide

/-- READ PartialReady fold holds (closed B11).
    Greppable: productPathPerformReadPartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-READ,
    READ-SSOT-THEOREM, HOST-READ-SSOT-THEOREM. -/
theorem productPathPerformReadPartialReady_true :
    productPathPerformReadPartialReady = true := by
  decide

/-- Named READ-SSOT gap token greppable. -/
theorem gapReadSsot_eq :
    gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := rfl

/-- just recipe name greppable. -/
theorem justRecipeName_eq :
    justRecipeName = "read-product-ssot" := rfl

/-- Lake exe name greppable. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-read-product-ssot" := rfl

/-- Module cite greppable. -/
theorem readModuleCite_eq :
    readModuleCite = "ProductPathReadSsot" := rfl

/-- Read entry function cite greppable. -/
theorem readFnCite_eq :
    readFnCite = "readDualSsotAtRoot" := rfl

/-! ### READ-SSOT-SMOKE / HOST-READ-SSOT-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_READ_V0" := by
  decide
example :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-READ" := by
  decide
example :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-READ" := by
  decide
example : productPathPerformReadDependsOnLake = true := by decide
example : productPathPerformReadEntrypointClaimed = true := by decide
example : productPathPerformReadOk = true := by decide
example : productPathPerformReadPartialReady = true := by decide
example : gapReadSsot = "FREESTANDING-PERFORM-GAP-READ-SSOT" := by decide
example : justRecipeName = "read-product-ssot" := by decide
example : lakeExeName = "slake-read-product-ssot" := by decide
example : readModuleCite = "ProductPathReadSsot" := by decide
example : readFnCite = "readDualSsotAtRoot" := by decide

end SystemsLean.ProductPathReadSsot
