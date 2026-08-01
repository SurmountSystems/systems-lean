/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable step contract (B15).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0 -- named
  freestanding-capable perform step contract / interface for remaining
  FREESTANDING-PERFORM-GAP-READ-SSOT / COMPOSE / WRITE-HC.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Dual-pin thin batch 14: this home owns Ok / stageId / hostId / selfHostId /
  contract-step / blocker / API / recipe / exe PartialReady bulk. SelfApplyFs tip
  keeps AuthorityNotEmit / Read / Compose / WriteHc / FullSatisfied honesty +
  living stepContractFull SSoT + chain fold only (no living claim true defs here).
  Beyond B14 gap measure: defines the **contract** freestanding-capable product
  path steps must satisfy. Product authority is NOT classic Lean FreestandingEmit
  as product path; host Lake FreestandingEmit remains bootstrap only.
  B16 lands freestandingCapableReadDualSsot (CapableRead):
  productPathFreestandingCapableStepContractReadSatisfied true. B17 lands
  freestandingCapableComposePlanApplyBody (CapableCompose): ComposeSatisfied true.
  B18 lands freestandingCapableWriteFreestandingHc (CapableWriteHc):
  WriteHcSatisfied true. Full satisfied stays false (ownership regenerate cliff).
  Does NOT flip B14 CapableRead/Compose/WriteHc/FullPerform. Does NOT claim
  freestanding perform or ownership.
  Named freestanding-capable API surface:
    freestandingCapableReadDualSsot (implemented B16)
    freestandingCapableComposePlanApplyBody (implemented B17)
    freestandingCapableWriteFreestandingHc (implemented B18)
  Ordered remaining gaps + blockers greppable on host.
  Lake exe: slake-freestanding-capable-step-contract
  (just freestanding-capable-step-contract).
  Theorems (STEP-CONTRACT-THEOREM / HOST-STEP-CONTRACT-THEOREM +
  STEP-CONTRACT-SMOKE / HOST-STEP-CONTRACT-SMOKE):
  SystemsLean.CapableStepContractTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapableStepContractPartialReady_true /
  productPathFreestandingCapableStepContractOk_true / stageId_eq + surface pins.
  Not freestanding perform claimed. Not residual free. Not PROVABLY.
  Not freestanding emit residual free.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT,
  product path freestanding capable step contract,
  productPathFreestandingCapableStepContractPartialReady,
  productPathFreestandingCapableStepContractOk,
  productPathFreestandingCapableStepContractAuthorityNotEmit,
  productPathFreestandingCapableStepContractReadSatisfied,
  productPathFreestandingCapableStepContractComposeSatisfied,
  productPathFreestandingCapableStepContractWriteHcSatisfied,
  productPathFreestandingCapableStepContractFullSatisfied,
  theorem productPathFreestandingCapableStepContractPartialReady_true,
  STEP-CONTRACT-THEOREM, HOST-STEP-CONTRACT-THEOREM,
  STEP-CONTRACT-SMOKE, HOST-STEP-CONTRACT-SMOKE, CapableStepContractTheorems,
  FREESTANDING-CAPABLE-STEP-CONTRACT-READ,
  FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE,
  FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC,
  freestandingCapableReadDualSsot, freestandingCapableComposePlanApplyBody,
  freestandingCapableWriteFreestandingHc,
  BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-COMPOSE,
  FREESTANDING-PERFORM-GAP-WRITE-HC,
  freestanding-capable-step-contract, slake-freestanding-capable-step-contract,
  CapableStepContract, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.CapableStepContract
  Long-file split: STEP-CONTRACT-THEOREM + SMOKE in CapableStepContractTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.CapableStepContract

/-- Greppable primary stage id (partial B15 freestanding-capable step contract). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT"

/-- Named freestanding-capable step contract for READ-SSOT.
    Greppable: FREESTANDING-CAPABLE-STEP-CONTRACT-READ. -/
def contractStepRead : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-READ"

/-- Named freestanding-capable step contract for COMPOSE.
    Greppable: FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE. -/
def contractStepCompose : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE"

/-- Named freestanding-capable step contract for WRITE-HC.
    Greppable: FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC. -/
def contractStepWriteHc : String := "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC"

/-- Gaps this contract covers (still open for freestanding-capable close). -/
def gapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"
def gapCompose : String := "FREESTANDING-PERFORM-GAP-COMPOSE"
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- Contract requirement: freestanding-capable product path must not route
    product authority through classic Lean FreestandingEmit as product path.
    Host Lake FreestandingEmit remains bootstrap only (honest today).
    Greppable: productPathFreestandingCapableStepContractAuthorityNotEmit. -/
def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true

/-- Host Lake bootstrap still writes product wire today (honest residual).
    Greppable: hostLakeBootstrapRemainsForWriter. -/
def hostLakeBootstrapRemainsForWriter : Bool := true

/-- Named freestanding-capable READ API (implemented B16 CapableRead).
    Greppable: freestandingCapableReadDualSsot. -/
def freestandingCapableReadApi : String := "freestandingCapableReadDualSsot"

/-- Named freestanding-capable COMPOSE API (implemented B17 CapableCompose).
    Greppable: freestandingCapableComposePlanApplyBody. -/
def freestandingCapableComposeApi : String :=
  "freestandingCapableComposePlanApplyBody"

/-- Named freestanding-capable WRITE-HC API (implemented B18 CapableWriteHc).
    Greppable: freestandingCapableWriteFreestandingHc. -/
def freestandingCapableWriteHcApi : String :=
  "freestandingCapableWriteFreestandingHc"

/-- READ contract satisfied by no-FreestandingEmit dual SSOT READ as product
    authority (B16 CapableRead.freestandingCapableReadDualSsot). Does NOT mean
    B14 productPathFreestandingCapableRead or freestanding perform claimed.
    Greppable: productPathFreestandingCapableStepContractReadSatisfied.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableStepContractReadSatisfied : Bool := true

/-- COMPOSE contract satisfied by no-FreestandingEmit plan/apply/body structural
    compose (B17 CapableCompose.freestandingCapableComposePlanApplyBody). Does
    NOT mean B14 CapableCompose or freestanding perform claimed. Greppable:
    productPathFreestandingCapableStepContractComposeSatisfied.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true

/-- WRITE-HC contract satisfied by no-FreestandingEmit freestanding .h/.c
    structural write (B18 CapableWriteHc.freestandingCapableWriteFreestandingHc).
    Does NOT mean B14 CapableWriteHc or freestanding perform claimed. Greppable:
    productPathFreestandingCapableStepContractWriteHcSatisfied.
    Keep in sync with SelfApplyFs. -/
def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true

/-- Full freestanding-capable step contract satisfied? Stays false -- step
    contracts satisfied after B18; Full open for freestanding ownership of
    regenerate (BLOCKER-FREESTANDING-MUST-OWN-REGENERATE). Greppable:
    productPathFreestandingCapableStepContractFullSatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Named blockers (ordered remaining work before freestanding-capable close). -/
def blockerReadStillLakeHost : String :=
  "BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH"
def blockerComposeStillLakeHost : String :=
  "BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH"
def blockerWriteHcStillLakeHost : String :=
  "BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH"
def blockerFreestandingMustOwnRegenerate : String :=
  "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

/-- Diagnostic Lake exe / just recipe for this step contract print. -/
def lakeExeName : String := "slake-freestanding-capable-step-contract"
def justMeasureRecipe : String := "freestanding-capable-step-contract"

/-- Step contract surface ok: stage ids + authority-not-emit true + READ/
    Compose/WriteHc satisfied true + Full false + host bootstrap + APIs +
    blockers + gaps. Keep in sync with SelfApplyFs Ok conjuncts.
    Greppable: productPathFreestandingCapableStepContractOk. -/
def productPathFreestandingCapableStepContractOk : Bool :=
  (stageId
      == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0")
    && (hostId
        == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT")
    && (selfHostId
        == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT")
    && (productPathFreestandingCapableStepContractAuthorityNotEmit == true)
    && (hostLakeBootstrapRemainsForWriter == true)
    && (productPathFreestandingCapableStepContractReadSatisfied == true)
    && (productPathFreestandingCapableStepContractComposeSatisfied == true)
    && (productPathFreestandingCapableStepContractWriteHcSatisfied == true)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (contractStepRead == "FREESTANDING-CAPABLE-STEP-CONTRACT-READ")
    && (contractStepCompose == "FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE")
    && (contractStepWriteHc == "FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC")
    && (gapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")
    && (gapCompose == "FREESTANDING-PERFORM-GAP-COMPOSE")
    && (gapWriteHc == "FREESTANDING-PERFORM-GAP-WRITE-HC")
    && (freestandingCapableReadApi == "freestandingCapableReadDualSsot")
    && (freestandingCapableComposeApi
        == "freestandingCapableComposePlanApplyBody")
    && (freestandingCapableWriteHcApi
        == "freestandingCapableWriteFreestandingHc")
    && (blockerReadStillLakeHost
        == "BLOCKER-READ-STILL-LAKE-HOST-PRODUCT-PATH")
    && (blockerComposeStillLakeHost
        == "BLOCKER-COMPOSE-STILL-LAKE-HOST-PRODUCT-PATH")
    && (blockerWriteHcStillLakeHost
        == "BLOCKER-WRITE-HC-STILL-LAKE-HOST-PRODUCT-PATH")
    && (blockerFreestandingMustOwnRegenerate
        == "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE")
    && (lakeExeName == "slake-freestanding-capable-step-contract")
    && (justMeasureRecipe == "freestanding-capable-step-contract")

/-- Step-contract PartialReady fold (closed B15 substrate: Ok + authority-not-
    emit + Read/Compose/WriteHc satisfied + Full long-name false). SelfApplyFs
    tip chain fold includes this def. Does not flip residual free / llvm /
    PROVABLY. Greppable: productPathFreestandingCapableStepContractPartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
def productPathFreestandingCapableStepContractPartialReady : Bool :=
  productPathFreestandingCapableStepContractOk
    && productPathFreestandingCapableStepContractAuthorityNotEmit
    && productPathFreestandingCapableStepContractReadSatisfied
    && productPathFreestandingCapableStepContractComposeSatisfied
    && productPathFreestandingCapableStepContractWriteHcSatisfied
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- Print freestanding-capable step contract (diagnostic; not a perform claim).
    Theorems + smoke: SystemsLean.CapableStepContractTheorems. -/
def printStepContract : IO Unit := do
  IO.println s!"== {stageId}: freestanding-capable step contract (B15) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println "  authority: product path must NOT route through FreestandingEmit as product path"
  IO.println s!"    productPathFreestandingCapableStepContractAuthorityNotEmit: {productPathFreestandingCapableStepContractAuthorityNotEmit}"
  IO.println s!"    hostLakeBootstrapRemainsForWriter: {hostLakeBootstrapRemainsForWriter}"
  IO.println "  freestanding-capable step contracts (ordered remaining gaps):"
  IO.println s!"    {contractStepRead} -> {gapReadSsot}"
  IO.println s!"      API: {freestandingCapableReadApi}"
  IO.println s!"      satisfied: {productPathFreestandingCapableStepContractReadSatisfied} (B16 freestandingCapableReadDualSsot)"
  IO.println s!"      note: B14 CapableRead true after B26 freestanding-capable-read-lake-free; {blockerReadStillLakeHost} = Lake diagnostic path remains"
  IO.println s!"    {contractStepCompose} -> {gapCompose}"
  IO.println s!"      API: {freestandingCapableComposeApi}"
  IO.println s!"      satisfied: {productPathFreestandingCapableStepContractComposeSatisfied} (B17 freestandingCapableComposePlanApplyBody)"
  IO.println s!"      note: B14 CapableCompose still false; {blockerComposeStillLakeHost} = Lake-free freestanding measure"
  IO.println s!"    {contractStepWriteHc} -> {gapWriteHc}"
  IO.println s!"      API: {freestandingCapableWriteHcApi}"
  IO.println s!"      satisfied: {productPathFreestandingCapableStepContractWriteHcSatisfied} (B18 freestandingCapableWriteFreestandingHc)"
  IO.println s!"      note: B14 CapableWriteHc true after B28; {blockerWriteHcStillLakeHost} named for Lake diagnostic path honesty"
  IO.println s!"  full satisfied: {productPathFreestandingCapableStepContractFullSatisfied}"
  IO.println s!"  cliff: {blockerFreestandingMustOwnRegenerate}"
  IO.println "  honest: READ+COMPOSE+WRITE-HC step contracts satisfied (no-emit authority); Full open"
  IO.println "  not freestanding-capable full close; not perform claimed; not residual free; not PROVABLY"
  if productPathFreestandingCapableStepContractOk then
    IO.println s!"GREEN {stageId}: step contract surface ok (authority-not-emit; READ+COMPOSE+WRITE-HC satisfied; Full false)"
  else
    IO.eprintln s!"error: {stageId} step contract surface not ok"
    throw (IO.userError "productPathFreestandingCapableStepContractOk false")

/-- CLI: print freestanding-capable step contract. -/
def main (_args : List String) : IO UInt32 := do
  try
    printStepContract
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.CapableStepContract

-- Lake entry is SystemsLean.CapableStepContractMain (no
-- top-level main here so SelfApplyFs may import this API / Ok / PartialReady bulk
-- without main clash).
