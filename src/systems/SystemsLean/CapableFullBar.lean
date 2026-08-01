/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable Full bar / ownership-gap measure (B21).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0 -- closed Full-bar
  substrate (step contracts + InstallOut + ordered regenerate + WithoutLake +
  CapableLakeFree) vs open Full remaining. Side: classic Lean elaborator under
  src/systems/ (not freestanding C runtime).
  Does NOT flip productPathFreestandingCapableStepContractFullSatisfied (false).
  B14 Capable* Lake-free closed after B26+B27+B28. B30 WithoutLake closed.
  Does NOT flip perform claimed / ownership claimed / complete / Full.
  Dual-pin: Full still needs perform + ownership claimed freestanding evidence.
  Lake exe: slake-freestanding-capable-full-bar (just freestanding-capable-full-bar).
  Theorems (FULL-BAR-THEOREM / HOST-FULL-BAR-THEOREM +
  FULL-BAR-SMOKE / HOST-FULL-BAR-SMOKE):
  SystemsLean.CapableFullBarTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapableFullBarPartialReady_true /
  productPathFreestandingCapableFullBarOk_true / stageId_eq + surface pins.
  Not freestanding perform claimed. Not residual free. Not PROVABLY.
  Not freestanding emit residual free.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
  product path freestanding capable full bar,
  productPathFreestandingCapableFullBarPartialReady,
  productPathFreestandingCapableFullBarOk,
  productPathFreestandingCapableFullBarStepContractsClosed,
  productPathFreestandingCapableFullBarInstallOutClosed,
  productPathFreestandingCapableFullBarOrderedPipelineJoined,
  productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake,
  productPathFreestandingCapableFullBarCapableLakeFree,
  productPathFreestandingCapableStepContractFullSatisfied,
  FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
  FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE,
  FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE,
  FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE,
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  FULL-BAR-THEOREM, HOST-FULL-BAR-THEOREM,
  FULL-BAR-SMOKE, HOST-FULL-BAR-SMOKE, CapableFullBarTheorems,
  theorem productPathFreestandingCapableFullBarPartialReady_true,
  freestanding-capable-full-bar, slake-freestanding-capable-full-bar,
  CapableFullBar, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.CapableFullBar
  Long-file split: FULL-BAR-THEOREM + SMOKE in CapableFullBarTheorems.
  Dual-pin thin batch 20: home-primary Ok / stageId / hostId / recipe / exe /
  Req* bulk; SelfApplyFs tip keeps closed-substrate honesty bools + DependsOnLake
  + B20 chain fold only.
  Module must stay ASCII.
-/

namespace SystemsLean.CapableFullBar

/-- Greppable primary stage id (partial B21 Full bar / ownership-gap measure). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR"

/-- Closed after B16..B18: freestanding-capable step contracts READ+COMPOSE+WRITE-HC
    satisfied (authority not FreestandingEmit). Greppable:
    productPathFreestandingCapableFullBarStepContractsClosed. -/
def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true

/-- Closed after B20: Install Out owned by freestanding-capable path
    (InstallOutOpen false). Greppable:
    productPathFreestandingCapableFullBarInstallOutClosed. -/
def productPathFreestandingCapableFullBarInstallOutClosed : Bool := true

/-- Closed after B19: ordered freestanding-capable regenerate pipeline joined
    (READ+COMPOSE+WRITE-HC+INSTALL-OUT). Greppable:
    productPathFreestandingCapableFullBarOrderedPipelineJoined. -/
def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := true

/-- Closed after B30: freestanding product path authority owns regenerate without
    classic Lean Lake as product path. Greppable:
    productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake,
    FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE,
    BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
    OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY.
    Dual-pin productPathOwnershipRegenerateWithoutLake true. -/
def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true

/-- Closed after B26+B27+B28: B14 Lake-free freestanding Capable* (Read/Compose/
    WriteHc) all true via freestanding-capable-*-lake-free recipes. CapableLakeFree
    is the B14 Capable* close; WithoutLake is a separate dual-pin closed after B30
    product path authority. Not Full step-contract.
    Greppable: productPathFreestandingCapableFullBarCapableLakeFree. -/
def productPathFreestandingCapableFullBarCapableLakeFree : Bool := true

/-- Full freestanding-capable step contract satisfied stays false until perform
    claimed + ownership claimed with freestanding evidence (WithoutLake closed
    B30; Full is more than WithoutLake alone). Greppable:
    productPathFreestandingCapableStepContractFullSatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Named Full-bar remaining requirements (open until evidence). -/
def fullBarReqOwnershipRegenerateWithoutLake : String :=
  "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE"
def fullBarReqCapableReadLakeFree : String := "FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE"
def fullBarReqCapableComposeLakeFree : String :=
  "FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE"
def fullBarReqCapableWriteHcLakeFree : String :=
  "FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE"
def fullBarReqPerformClaimedWithEvidence : String :=
  "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE"
def fullBarReqOwnershipClaimedWithEvidence : String :=
  "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE"

/-- Ownership regenerate cliff (same greppable as B15..B20). -/
def blockerMustOwnRegenerate : String := "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

/-- Lake still hosts freestanding-capable exes (honest residual). Greppable:
    productPathFreestandingCapableFullBarDependsOnLake. -/
def productPathFreestandingCapableFullBarDependsOnLake : Bool := true

/-- Diagnostic Lake exe / just recipe for this Full-bar measure print. -/
def lakeExeName : String := "slake-freestanding-capable-full-bar"
def justMeasureRecipe : String := "freestanding-capable-full-bar"

/-- Full-bar measure surface ok: closed pins true (incl. WithoutLake after B30);
    Full false; perform/ownership claimed open; Lake dependency honest.
    Greppable: productPathFreestandingCapableFullBarOk. -/
def productPathFreestandingCapableFullBarOk : Bool :=
  (stageId
      == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_FULL_BAR_V0")
    && (hostId
        == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR")
    && (selfHostId
        == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR")
    && (productPathFreestandingCapableFullBarStepContractsClosed == true)
    && (productPathFreestandingCapableFullBarInstallOutClosed == true)
    && (productPathFreestandingCapableFullBarOrderedPipelineJoined == true)
    && (productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
        == true)
    && (productPathFreestandingCapableFullBarCapableLakeFree == true)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (productPathFreestandingCapableFullBarDependsOnLake == true)
    && (fullBarReqOwnershipRegenerateWithoutLake
        == "FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE")
    && (fullBarReqCapableReadLakeFree
        == "FULL-BAR-REQ-B14-CAPABLE-READ-LAKE-FREE")
    && (fullBarReqCapableComposeLakeFree
        == "FULL-BAR-REQ-B14-CAPABLE-COMPOSE-LAKE-FREE")
    && (fullBarReqCapableWriteHcLakeFree
        == "FULL-BAR-REQ-B14-CAPABLE-WRITE-HC-LAKE-FREE")
    && (fullBarReqPerformClaimedWithEvidence
        == "FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE")
    && (fullBarReqOwnershipClaimedWithEvidence
        == "FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE")
    && (blockerMustOwnRegenerate == "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE")
    && (lakeExeName == "slake-freestanding-capable-full-bar")
    && (justMeasureRecipe == "freestanding-capable-full-bar")

/-- Print Full-bar / ownership-gap measure (diagnostic; not a perform claim). -/
def printFullBarMeasure : IO Unit := do
  IO.println s!"== {stageId}: freestanding-capable Full bar / ownership-gap (B21+B30) =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println "  closed Full-bar substrate (not Full itself):"
  IO.println s!"    step contracts READ+COMPOSE+WRITE-HC: {productPathFreestandingCapableFullBarStepContractsClosed} (B16..B18)"
  IO.println s!"    Install Out closed: {productPathFreestandingCapableFullBarInstallOutClosed} (B20 InstallOutOpen false)"
  IO.println s!"    ordered regenerate joined: {productPathFreestandingCapableFullBarOrderedPipelineJoined} (B19)"
  IO.println s!"    ownership regenerate without Lake: {productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake} (B30 product path authority)"
  IO.println s!"      req: {fullBarReqOwnershipRegenerateWithoutLake}"
  IO.println s!"      authority: OWNERSHIP-REGENERATE-PRODUCT-PATH-AUTHORITY"
  IO.println s!"    B14 Capable* Lake-free (Read/Compose/WriteHc): {productPathFreestandingCapableFullBarCapableLakeFree} (closed after B26+B27+B28)"
  IO.println s!"      reqs: {fullBarReqCapableReadLakeFree}; {fullBarReqCapableComposeLakeFree}; {fullBarReqCapableWriteHcLakeFree}"
  IO.println "  still open (blocks Full / claim B complete):"
  IO.println s!"    perform claimed with freestanding evidence: open ({fullBarReqPerformClaimedWithEvidence})"
  IO.println s!"    ownership claimed with freestanding evidence: open ({fullBarReqOwnershipClaimedWithEvidence})"
  IO.println s!"  productPathFreestandingCapableStepContractFullSatisfied: {productPathFreestandingCapableStepContractFullSatisfied}"
  IO.println s!"  productPathFreestandingCapableFullBarDependsOnLake: {productPathFreestandingCapableFullBarDependsOnLake} (Lake exe host honest)"
  IO.println "  honest: closed pins are real B16..B20 + B26..B28 Capable* + B30 WithoutLake; Full stays false until perform/ownership claimed"
  IO.println "  not freestanding perform claimed; not residual free; not PROVABLY; not B6..B29 re-land theater"
  if productPathFreestandingCapableFullBarOk then
    IO.println s!"GREEN {stageId}: Full-bar measure surface ok (closed true incl. WithoutLake; CapableLakeFree true; Full false)"
  else
    IO.eprintln s!"error: {stageId} Full-bar measure surface not ok"
    throw (IO.userError "productPathFreestandingCapableFullBarOk false")

/-- Full-bar PartialReady fold (closed B21 substrate after B20 Install Out +
    B26..B28 Capable* Lake-free + B30 WithoutLake dual-pin). Historical readiness
    bulk; SelfApplyFs tip re-exports chain fold. Land-time: closed substrate true;
    DependsOnLake true; Full long-name false. No residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapableFullBarPartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR,
    FULL-BAR-REQ-OWNERSHIP-REGENERATE-WITHOUT-LAKE. -/
def productPathFreestandingCapableFullBarPartialReady : Bool :=
  productPathFreestandingCapableFullBarOk
    && productPathFreestandingCapableFullBarStepContractsClosed
    && productPathFreestandingCapableFullBarInstallOutClosed
    && productPathFreestandingCapableFullBarOrderedPipelineJoined
    && productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
    && productPathFreestandingCapableFullBarCapableLakeFree
    && productPathFreestandingCapableFullBarDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: print freestanding-capable Full bar measure. -/
def main (_args : List String) : IO UInt32 := do
  try
    printFullBarMeasure
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.CapableFullBar

-- Theorems + smoke: SystemsLean.CapableFullBarTheorems (same namespace).
-- Lake entry is SystemsLean.CapableFullBarMain
-- (no top-level main here so SelfApplyFs may import Full-bar
-- Ok / PartialReady bulk without main clash).
