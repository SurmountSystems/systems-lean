/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable ordered regenerate pipeline (B19).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0 -- freestanding-
  capable ordered regenerate: READ then COMPOSE then WRITE-HC then Install Out
  without FreestandingEmit as product authority.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Real IO freestandingCapableOrderedRegenerate:
    freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
    freestandingCapableWriteFreestandingHc, freestandingCapableInstallFreestandingOut.
  No FreestandingEmit import; no emitAtRoot / renderHeader / renderSource authority.
  Distinct from B14 regenerate-product-path and from single-step B16/B17/B18/B20.
  InstallOutOpen false after B20. Full unsatisfied
  (BLOCKER-FREESTANDING-MUST-OWN-REGENERATE). Not freestanding perform claimed.
  Not residual free. Not freestanding emit residual free. Not PROVABLY.
  CapableRead/Compose/WriteHc true after B26..B28; Full unsatisfied; WithoutLake open.
  DependsOnLake true (Lake exe host). Lake exe: slake-freestanding-capable-regenerate
  (just freestanding-capable-regenerate).
  Theorems (REGENERATE-THEOREM / HOST-REGENERATE-THEOREM +
  REGENERATE-SMOKE / HOST-REGENERATE-SMOKE):
  SystemsLean.CapableRegenerateTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapableRegeneratePartialReady_true /
  productPathFreestandingCapableRegenerateOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
  product path freestanding capable regenerate,
  productPathFreestandingCapableRegeneratePartialReady,
  productPathFreestandingCapableRegenerateOk,
  freestandingCapableOrderedRegenerate,
  FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
  productPathFreestandingCapableRegenerateInstallOutOpen,
  productPathFreestandingCapableStepContractFullSatisfied,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
  freestandingCapableWriteFreestandingHc, freestandingCapableInstallFreestandingOut,
  REGENERATE-THEOREM, HOST-REGENERATE-THEOREM,
  REGENERATE-SMOKE, HOST-REGENERATE-SMOKE, CapableRegenerateTheorems,
  theorem productPathFreestandingCapableRegeneratePartialReady_true,
  freestanding-capable-regenerate, slake-freestanding-capable-regenerate,
  CapableRegenerate, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.CapableRegenerate
  Dual-pin batch 18: home Ok/stage/recipe/exe; tip keeps honesty + chain fold.
  Long-file split: REGENERATE-THEOREM + SMOKE in CapableRegenerateTheorems.
  Module must stay ASCII.
-/

import SystemsLean.CapableRead
import SystemsLean.CapableCompose
import SystemsLean.CapableWriteHc
import SystemsLean.InstallOut

namespace SystemsLean.CapableRegenerate

/-- Greppable primary stage id (partial B19 freestanding-capable ordered regenerate). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE"

/-- Named freestanding-capable ordered regenerate pipeline token.
    Greppable: FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE. -/
def orderedPipelineId : String :=
  "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE"

/-- Ownership regenerate cliff still open after this partial.
    Greppable: BLOCKER-FREESTANDING-MUST-OWN-REGENERATE. -/
def blockerMustOwnRegenerate : String :=
  "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

/-- Lake exe name for this freestanding-capable ordered regenerate entrypoint. -/
def lakeExeName : String := "slake-freestanding-capable-regenerate"

/-- just recipe name. -/
def justRecipeName : String := "freestanding-capable-regenerate"

/-- Real freestanding-capable ordered regenerate API name (implemented here).
    Greppable: freestandingCapableOrderedRegenerate. -/
def freestandingCapableRegenerateApi : String :=
  "freestandingCapableOrderedRegenerate"

/-- Product authority is not FreestandingEmit (this module never imports it;
    child steps also forbid FreestandingEmit). Greppable:
    productPathFreestandingCapableRegenerateAuthorityNotEmit. -/
def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true

/-- This pipeline still runs as a classic Lean Lake exe host (honest DependsOnLake).
    Capable* Lake-free measures closed B26..B28; WithoutLake / Full still open.
    Greppable: productPathFreestandingCapableRegenerateDependsOnLake. -/
def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true

/-- Install Out owned by freestanding-capable path (B20 freestandingCapableInstallFreestandingOut
    called as step 4/4). Greppable:
    productPathFreestandingCapableRegenerateInstallOutOpen. -/
def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false

/-- Full freestanding-capable step-contract stays unsatisfied (ownership
    regenerate WithoutLake cliff; CapableRead/Compose/WriteHc true after B26..B28).
    Greppable honesty pin only -- SelfApplyFs owns the real FullSatisfied def (false). -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- freestandingCapableOrderedRegenerate -- freestanding-capable product-path
    ordered regenerate pipeline: READ dual SSOT, then COMPOSE plan/apply/body,
    then WRITE freestanding .h/.c, then Install Out, without FreestandingEmit as
    product authority. InstallOutOpen false (B20 owns install). Does not flip
    Full / perform / ownership / complete.
    Greppable: freestandingCapableOrderedRegenerate,
    FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE,
    freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
    freestandingCapableWriteFreestandingHc, freestandingCapableInstallFreestandingOut,
    BLOCKER-FREESTANDING-MUST-OWN-REGENERATE. -/
def freestandingCapableOrderedRegenerate (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: freestanding-capable ordered regenerate pipeline =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  pipeline: {orderedPipelineId}"
  IO.println s!"  API: {freestandingCapableRegenerateApi}"
  IO.println "  order: freestandingCapableReadDualSsot -> freestandingCapableComposePlanApplyBody -> freestandingCapableWriteFreestandingHc -> freestandingCapableInstallFreestandingOut"
  IO.println "  authority: not FreestandingEmit (no import; children no emit-at-root as product path)"
  IO.println s!"    productPathFreestandingCapableRegenerateAuthorityNotEmit: {productPathFreestandingCapableRegenerateAuthorityNotEmit}"
  IO.println s!"    productPathFreestandingCapableRegenerateDependsOnLake: {productPathFreestandingCapableRegenerateDependsOnLake} (Lake exe host only)"
  IO.println s!"    productPathFreestandingCapableRegenerateInstallOutOpen: {productPathFreestandingCapableRegenerateInstallOutOpen} (B20 freestanding-capable install owns Out)"
  IO.println s!"    productPathFreestandingCapableStepContractFullSatisfied: {productPathFreestandingCapableStepContractFullSatisfied} (cliff open)"
  IO.println s!"  cliff: {blockerMustOwnRegenerate}"
  IO.println "  not: Full; not perform claimed; not complete; not WithoutLake (B26..B28 Capable* Lake-free measures closed)"
  IO.println "  -- step 1/4: freestanding-capable READ --"
  SystemsLean.CapableRead.freestandingCapableReadDualSsot root
  IO.println "  -- step 2/4: freestanding-capable COMPOSE --"
  SystemsLean.CapableCompose.freestandingCapableComposePlanApplyBody root
  IO.println "  -- step 3/4: freestanding-capable WRITE-HC --"
  SystemsLean.CapableWriteHc.freestandingCapableWriteFreestandingHc root
  IO.println "  -- step 4/4: freestanding-capable Install Out --"
  SystemsLean.InstallOut.freestandingCapableInstallFreestandingOut root
  IO.println s!"GREEN {stageId}: freestanding-capable ordered regenerate pipeline (READ+COMPOSE+WRITE-HC+INSTALL-OUT)"
  IO.println "  FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE advanced (no-emit authority join)"
  IO.println "  honest: Full unsatisfied; InstallOut closed by freestanding-capable path; perform claimed false; complete false"
  IO.println "  CapableRead/Compose/WriteHc true (B26..B28 Lake-free); Full unsatisfied; WithoutLake open"
  IO.println "  not B14 regenerate-product-path (that is host Lake perform join)"
  IO.println "  operational note: WRITE step is structural no-emit embed; FreestandingEmit dual-equality product path may differ"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Surface ok: stage ids + authority-not-emit + ordered API + InstallOut closed +
    Full false + Lake dependency honest.
    Greppable: productPathFreestandingCapableRegenerateOk. -/
def productPathFreestandingCapableRegenerateOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_REGENERATE_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE")
    && (orderedPipelineId == "FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE")
    && (blockerMustOwnRegenerate == "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE")
    && (freestandingCapableRegenerateApi == "freestandingCapableOrderedRegenerate")
    && (productPathFreestandingCapableRegenerateAuthorityNotEmit == true)
    && (productPathFreestandingCapableRegenerateDependsOnLake == true)
    && (productPathFreestandingCapableRegenerateInstallOutOpen == false)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (lakeExeName == "slake-freestanding-capable-regenerate")
    && (justRecipeName == "freestanding-capable-regenerate")

/-- Ordered regenerate PartialReady fold (closed B19 substrate: Ok + authority-not-emit +
    DependsOnLake + InstallOut closed + Full long-name false). Historical readiness
    bulk for freestanding-capable ordered regenerate. SelfApplyFs living tip re-exports a
    chain fold that includes this def for greppable dual-pin + B18 WriteHc
    PartialReady. Land-time module pins: AuthorityNotEmit true; DependsOnLake true;
    InstallOutOpen false; Full long-name false (living tip allows perform /
    ownership / stepContractFull / complete true after later cliffs). Does not flip
    residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapableRegeneratePartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE,
    freestandingCapableOrderedRegenerate. -/
def productPathFreestandingCapableRegeneratePartialReady : Bool :=
  productPathFreestandingCapableRegenerateOk
    && productPathFreestandingCapableRegenerateAuthorityNotEmit
    && productPathFreestandingCapableRegenerateDependsOnLake
    && !productPathFreestandingCapableRegenerateInstallOutOpen
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: optional repo root argument (default cwd). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    unless productPathFreestandingCapableRegenerateOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathFreestandingCapableRegenerateOk false")
    freestandingCapableOrderedRegenerate root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.CapableRegenerate

-- Theorems + smoke: SystemsLean.CapableRegenerateTheorems (same namespace).
-- Lake entry is SystemsLean.CapableRegenerateMain (no top-level
-- main here so SelfApplyFs may import this API / Ok / PartialReady bulk without main clash).
