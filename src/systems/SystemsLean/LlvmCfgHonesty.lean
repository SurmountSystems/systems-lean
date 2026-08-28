/-
  SYSTEMS_LEAN_HOST partial -- LLVM CFG fixture honesty pins (long-file split).
  Claim pins and stage ids for SystemsLean.LlvmCfgFixture surface.
  Production CFG tables live in LlvmCfgMultProduction / LlvmCfgUnitProduction /
  LlvmCfgMultDf / LlvmCfgGeneral. Join + surface ready: LlvmCfgFixture.
  Option A-light (2026-08-10): fixture tip fullBackend may be true when
  progressive bar (1)-(7) under path B is met. Production opt / DominanceClaimed
  stay false. Product decision path B: full DF pipeline is NOT required for
  bar item (2); Mult DF partial + unit Mult..Graph CFG + iterative multi-node
  IR walk meet bar (2). Pin dominancePipelineRequiredForFullBackend stays false.
  Progressive bar evidence partial lives in LlvmCfgGeneral
  (fullLlvmBarEvidencePartial) -- not a fullBackend synonym; progressive pins
  stay independent of tip polarity.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-CFG-FIXTURE, SLAKE_LLVM_CFG_FIXTURE,
  SLAKE_LLVM_CFG_FIXTURE_V0, llvmCfgFixtureFullBackendClaimed,
  llvmCfgFixtureProductionOptClaimed, llvmCfgFixtureDominanceClaimed,
  dominancePipelineRequiredForFullBackend, llvmCfgFixturePartialClaimed,
  MULT-CFG-FIXTURE, ORDERED-IR-PROGRAM, SSA-SHAPED.
  Module: SystemsLean.LlvmCfgHonesty
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Same namespace SystemsLean.LlvmCfgFixture (role split; not a second product claim).
  Module must stay ASCII. Not freestanding emit. Host elaborator residual remains.
-/

import SystemsLean.Mult
import SystemsLean.LlvmHold
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmCfgFixture

open SystemsLean.Mult

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_LLVM_CFG_FIXTURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-CFG-FIXTURE"

/-- Surface id. -/
def surfaceId : String := "HOST-LLVM-CFG-FIXTURE"

/-- Fixture name (Mult band CFG only).
    Greppable: multCfgFixtureName, MULT-CFG-FIXTURE. -/
def multCfgFixtureName : String := "MULT-CFG-FIXTURE"

/-- Ordered IR / Mult kernel cites. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"
def ssaShapedId : String := "SSA-SHAPED"
def kernelMultId : String := "SELF-HOST-KERNEL-MULT"

/-- Local inventory finished. -/
def llvmCfgFixtureFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. -/
def llvmCfgFixtureLlvmUnlocked : Bool := false

/-- Local unlock false alias. -/
def llvmCfgFixtureLocalUnlockFalse : Bool := !llvmCfgFixtureLlvmUnlocked

/-- Keeps llvm locked at this module (local pin false). -/
def llvmCfgFixtureKeepsLlvmLocked : Bool := !llvmCfgFixtureLlvmUnlocked

/-- Does not unlock llvm. -/
def llvmCfgFixtureDoesNotUnlockLlvm : Bool :=
  llvmCfgFixtureKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmMultSsa.llvmMultSsaKeepsLlvmLocked

/-- Partial Mult CFG fixture claim only. -/
def llvmCfgFixturePartialClaimed : Bool := true

/-- Full backend claim (fixture tip). Option A-light 2026-08-10: true when
    progressive bar (1)-(7) under path B is met with lake proof. Not an alias of
    unlock / fullLlvmBarEvidencePartial / Mult..Graph foreign / rustIrInterop*.
    Band-local Mult..Graph SSA and foreign *FullBackendClaimed stay false.
    Production opt / DominanceClaimed stay false. -/
def llvmCfgFixtureFullBackendClaimed : Bool := true

/-- Production optimization claim -- MUST stay false. -/
def llvmCfgFixtureProductionOptClaimed : Bool := false

/-- Full dominance pipeline claim -- MUST stay false.
    Product bar item (2) does not require this pin true (path B 2026-08-10):
    Mult DF partial + unit Mult..Graph CFG + iterative multi-node IR walk
    are enough. Greppable: llvmCfgFixtureDominanceClaimed. -/
def llvmCfgFixtureDominanceClaimed : Bool := false

/-- Whether a full dominance pipeline (DominanceClaimed true) is required
    before progressive bar (2) is met or before any fullBackend honesty review.
    Product decision 2026-08-10 path B: false -- Mult DF partial + unit
    Mult..Graph dual-pin + iterative multi-node IR CFG walk satisfy bar (2)
    without DominanceClaimed. Does NOT flip fullBackend true.
    Greppable: dominancePipelineRequiredForFullBackend,
    DOMINANCE-PIPELINE-REQUIRED-FOR-FULL-BACKEND. -/
def dominancePipelineRequiredForFullBackend : Bool := false

/-- Local honesty non-claims. -/
def llvmCfgFixtureResidualFreeClaimed : Bool := false
def llvmCfgFixtureRustNativeLinkClaimed : Bool := false
def llvmCfgFixtureLlvmAsClaimed : Bool := false

/-- Mult grade names. -/
def multGrade0Name : String := Mult.name Mult.mult0
def multGrade1Name : String := Mult.name Mult.mult1
def multGradeOmegaName : String := Mult.name Mult.multOmega

end SystemsLean.LlvmCfgFixture
