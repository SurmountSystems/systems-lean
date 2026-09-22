/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeProducedElf.
  Short role: named driver for just slake-typecheck-slakeproducedelf.
  Ready is HostFrontLiveSlakeProducedElf parse plus HostKernel.kernelCheck
  of live SlakeProducedElf.lean, not := true, not lake build
  SystemsLean.SlakeProducedElf.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckSlakeProducedElf is not a prefix):
  SlakeTypecheckSlakeProducedElf
  HOST-SLAKE-TYPECHECK-SLAKE-PRODUCED-ELF
  SLAKE_TYPECHECK_SLAKE_PRODUCED_ELF_V0
  PARSE-LIVE-SLAKE-PRODUCED-ELF
  SLAKE-PRODUCED-ELF
  slake-typecheck-slakeproducedelf
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-slakeproducedelf,
  slakeTypecheckSlakeProducedElfReady,
  kernelCheckLiveSlakeProducedElfSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeProducedElf
  Checkable writer: just slake-typecheck-slakeproducedelf
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveSlakeProducedElf

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_PRODUCED_ELF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-PRODUCED-ELF"

/-- Named just recipe. Not lake build SystemsLean.SlakeProducedElf. -/
def justRecipeSlakeTypecheckSlakeProducedElf : String :=
  "slake-typecheck-slakeproducedelf"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeProducedElfRel : String :=
  SystemsLean.HostFrontLiveSlakeProducedElf.liveSlakeProducedElfRel

/-- Ready names HostFrontLiveSlakeProducedElf parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSlakeProducedElfReady,
    kernelCheckLiveSlakeProducedElfSource. -/
def slakeTypecheckSlakeProducedElfReady : Bool :=
  SystemsLean.HostFrontLiveSlakeProducedElf.hostFrontLiveSlakeProducedElfReady

/-- Honesty: this command is not lake build of SlakeProducedElf. -/
def slakeTypecheckSlakeProducedElfDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeProducedElfFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeProducedElfOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeProducedElf.lean.
    Ready is HostFrontLiveSlakeProducedElf.hostFrontLiveSlakeProducedElfReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveSlakeProducedElf.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeProducedElf} =="
  IO.println s!"  host={hostId} file={liveSlakeProducedElfRel}"
  unless (!slakeTypecheckSlakeProducedElfFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeProducedElfOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeProducedElf.main args
