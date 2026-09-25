/-
  SYSTEMS_LEAN_HOST partial -- live ProductPathOwnershipRegenerateMain.lean.
  The thin forwarder HostFrontLiveProductPathOwnershipRegenerateMain stays
  byte-for-byte and still calls the neighbor body. This module is the
  checker for the Main file. It does not retarget that neighbor.
  liveRel is ProductPathOwnershipRegenerateMain.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveProductPathOwnershipRegenerateMainSource,
  PARSE-LIVE-PRODUCT-PATH-OWNERSHIP-REGENERATE-MAIN.
  Module: SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMainSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource

namespace SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMainSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "ProductPathOwnershipRegenerateMain.lean"

/-- Pinned live ProductPathOwnershipRegenerateMain.lean bytes. -/
def liveProductPathOwnershipRegenerateMainSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- thin Lake exe main for ownership regenerate
  substrate (SKELETON). Root for lake exe
  slake-ownership-regenerate. Body lives in
  SystemsLean.ProductPathOwnershipRegenerate
  (Ok / PartialReady bulk). Thin main so SelfApplyFs may import the ownership
  regenerate bulk without top-level main clash (batch-13 SelfApplyFs split; same
  pattern as PerformEvidenceMain /
  OfficialPathMain /
  OfficialPathAlternateMain /
  DualEqWriteParityMain /
  DualEqWriteClosePathMain /
  DualEqWriteApiMain /
  DualEqWriteCapableGapMain /
  OfficialRetireMain / PerformClaimedMain / OwnershipClaimedMain /
  StepContractFullMain).
  Greppable: slake-ownership-regenerate,
  ProductPathOwnershipRegenerateMain,
  productPathOwnershipRegenerate,
  ProductPathOwnershipRegenerate,
  SYSTEMS_LEAN_HOST, SKELETON.
  Module must stay ASCII. Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.ProductPathOwnershipRegenerate

/-- Lake / lean --run entry: forward argv. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.ProductPathOwnershipRegenerate.main args
"#

/-- Accepted parse of the Main file calls HostKernel.kernelCheck.
    Not a constant true. The parser is the thin-main skip-fold used for
    the same import-plus-def-main shape. -/
def kernelCheckLiveProductPathOwnershipRegenerateMainSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned Main text. -/
def hostFrontLiveProductPathOwnershipRegenerateMainSourceReady : Bool :=
  liveRel == "ProductPathOwnershipRegenerateMain.lean"
    && kernelCheckLiveProductPathOwnershipRegenerateMainSource
      liveProductPathOwnershipRegenerateMainSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathOwnershipRegenerateMainSource then
    throw (IO.userError "dual-pin mismatch ProductPathOwnershipRegenerateMain.lean")
  let k := kernelCheckLiveProductPathOwnershipRegenerateMainSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live ProductPathOwnershipRegenerateMain parse false")
  unless hostFrontLiveProductPathOwnershipRegenerateMainSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathOwnershipRegenerateMainSource
