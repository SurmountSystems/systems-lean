/-
  SYSTEMS_LEAN_HOST partial -- ProductPathComposePlan COMPOSE-PLAN-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ProductPathComposePlan: theorems and behavioral
  smoke live here; stage ids, claim Bools, recipe/exe/module cites, Ok /
  PartialReady folds, DualSsotSpec helpers, composePlanApplyBodyAtRoot, and
  diagnostic main stay in ProductPathComposePlan. Same namespace
  SystemsLean.ProductPathComposePlan so theorem names stay unqualified under
  that namespace.

  Spec (readable):
  - COMPOSE-PLAN-THEOREM / HOST-COMPOSE-PLAN-THEOREM: stageId_eq /
    hostId_eq / selfHostId_eq /
    productPathPerformComposeOk_true /
    productPathPerformComposePartialReady_true +
    DependsOnLake true / EntrypointClaimed true + gap / writer step /
    recipe / exe / module / fn cites.
  - COMPOSE-PLAN-SMOKE / HOST-COMPOSE-PLAN-SMOKE: stage / map / Ok /
    PartialReady / claim bool behavioral examples (lake build fails if
    example fails).

  These COMPOSE-PLAN theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time ComposeDependsOnLake stays true; EntrypointClaimed
  true is substrate only (not freestanding perform claimed). Complete true
  lives on tip / SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - COMPOSE-PLAN surface honesty only -- NOT freestanding residual free.
  - NOT freestanding perform claimed flip here.
  - NOT free / llvm / PROVABLY unlock.
  - NOT full Mult..Apply template embed (stays FreestandingEmit).
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, COMPOSE-PLAN-THEOREM,
  HOST-COMPOSE-PLAN-THEOREM, COMPOSE-PLAN-SMOKE,
  HOST-COMPOSE-PLAN-SMOKE, stageId_eq, hostId_eq, selfHostId_eq,
  productPathPerformComposeOk_true,
  productPathPerformComposePartialReady_true,
  productPathPerformComposeDependsOnLake_true,
  productPathPerformComposeEntrypointClaimed_true,
  gapCompose_eq, writerPathStepCompose_eq,
  lakeExeName_eq, justRecipeName_eq,
  composeModuleCite_eq, composeFnCite_eq,
  ProductPathComposePlanTheorems, UNIT_SURFACE host surface,
  RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE,
  FREESTANDING-PERFORM-GAP-COMPOSE,
  WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY,
  compose-product-plan, slake-compose-product-plan,
  composePlanApplyBodyAtRoot, ProductPathComposePlan.
  Module: SystemsLean.ProductPathComposePlanTheorems
  Red/green: just systems-host; lake build SystemsLean.ProductPathComposePlanTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.ProductPathComposePlan

namespace SystemsLean.ProductPathComposePlan

/-! ### COMPOSE-PLAN-THEOREM / HOST-COMPOSE-PLAN-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B12
  COMPOSE perform substrate surface honesty only. Does not flip residual
  free / llvm / PROVABLY; DependsOnLake stays true; EntrypointClaimed true
  is substrate only (not freestanding perform claimed).
-/

/-- Primary stage id is greppable
    SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0.
    Greppable: stageId_eq, COMPOSE-PLAN-THEOREM,
    HOST-COMPOSE-PLAN-THEOREM. -/
theorem stageId_eq :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0" :=
  rfl

/-- Host map id is greppable
    HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE.
    Greppable: hostId_eq, COMPOSE-PLAN-THEOREM. -/
theorem hostId_eq :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE" :=
  rfl

/-- Short map id is greppable
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE.
    Greppable: selfHostId_eq, COMPOSE-PLAN-THEOREM. -/
theorem selfHostId_eq :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE" :=
  rfl

/-- COMPOSE step still DependsOnLake (classic Lean Lake host exe).
    Greppable: productPathPerformComposeDependsOnLake_true,
    COMPOSE-PLAN-THEOREM. -/
theorem productPathPerformComposeDependsOnLake_true :
    productPathPerformComposeDependsOnLake = true :=
  rfl

/-- COMPOSE entrypoint claimed (just compose-product-plan /
    lake exe slake-compose-product-plan / composePlanApplyBodyAtRoot).
    NOT freestanding perform claimed.
    Greppable: productPathPerformComposeEntrypointClaimed_true,
    COMPOSE-PLAN-THEOREM. -/
theorem productPathPerformComposeEntrypointClaimed_true :
    productPathPerformComposeEntrypointClaimed = true :=
  rfl

/-- COMPOSE surface Ok fold holds.
    Greppable: productPathPerformComposeOk_true,
    COMPOSE-PLAN-THEOREM, HOST-COMPOSE-PLAN-THEOREM. -/
theorem productPathPerformComposeOk_true :
    productPathPerformComposeOk = true := by
  decide

/-- COMPOSE PartialReady fold holds (closed B12).
    Greppable: productPathPerformComposePartialReady_true,
    SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE,
    COMPOSE-PLAN-THEOREM, HOST-COMPOSE-PLAN-THEOREM. -/
theorem productPathPerformComposePartialReady_true :
    productPathPerformComposePartialReady = true := by
  decide

/-- Named COMPOSE gap token greppable. -/
theorem gapCompose_eq :
    gapCompose = "FREESTANDING-PERFORM-GAP-COMPOSE" := rfl

/-- Named writer-path COMPOSE step token greppable. -/
theorem writerPathStepCompose_eq :
    writerPathStepCompose =
      "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY" := rfl

/-- just recipe name greppable. -/
theorem justRecipeName_eq :
    justRecipeName = "compose-product-plan" := rfl

/-- Lake exe name greppable. -/
theorem lakeExeName_eq :
    lakeExeName = "slake-compose-product-plan" := rfl

/-- Module cite greppable. -/
theorem composeModuleCite_eq :
    composeModuleCite = "ProductPathComposePlan" := rfl

/-- Compose entry function cite greppable. -/
theorem composeFnCite_eq :
    composeFnCite = "composePlanApplyBodyAtRoot" := rfl

/-! ### COMPOSE-PLAN-SMOKE / HOST-COMPOSE-PLAN-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example :
    stageId =
      "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_COMPOSE_V0" := by
  decide
example :
    hostId =
      "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE" := by
  decide
example :
    selfHostId =
      "SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE" := by
  decide
example : productPathPerformComposeDependsOnLake = true := by decide
example : productPathPerformComposeEntrypointClaimed = true := by decide
example : productPathPerformComposeOk = true := by decide
example : productPathPerformComposePartialReady = true := by decide
example : gapCompose = "FREESTANDING-PERFORM-GAP-COMPOSE" := by decide
example :
    writerPathStepCompose =
      "WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY" := by
  decide
example : justRecipeName = "compose-product-plan" := by decide
example : lakeExeName = "slake-compose-product-plan" := by decide
example : composeModuleCite = "ProductPathComposePlan" := by decide
example : composeFnCite = "composePlanApplyBodyAtRoot" := by decide

end SystemsLean.ProductPathComposePlan
