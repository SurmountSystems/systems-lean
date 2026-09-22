/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.FreestandingEmitMain.
  Short role: named driver for just slake-typecheck-freestandingemitmain.
  Ready is HostFrontLiveFreestandingEmitMain parse plus HostKernel.kernelCheck
  of live FreestandingEmitMain.lean, not := true, not lake build
  SystemsLean.FreestandingEmitMain.
  Not mill remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckFreestandingEmitMain is not a prefix):
  SlakeTypecheckFreestandingEmitMain
  HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-MAIN
  SLAKE_TYPECHECK_FREESTANDING_EMIT_MAIN_V0
  PARSE-LIVE-FREESTANDING-EMIT-MAIN
  FREESTANDING-EMIT-MAIN
  slake-typecheck-freestandingemitmain
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-freestandingemitmain,
  slakeTypecheckFreestandingEmitMainReady,
  kernelCheckLiveFreestandingEmitMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckFreestandingEmitMain
  Checkable writer: just slake-typecheck-freestandingemitmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveFreestandingEmitMain

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_FREESTANDING_EMIT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-FREESTANDING-EMIT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.FreestandingEmitMain. -/
def justRecipeSlakeTypecheckFreestandingEmitMain : String :=
  "slake-typecheck-freestandingemitmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFreestandingEmitMainRel : String :=
  SystemsLean.HostFrontLiveFreestandingEmitMain.liveFreestandingEmitMainRel

/-- Ready names HostFrontLiveFreestandingEmitMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckFreestandingEmitMainReady,
    kernelCheckLiveFreestandingEmitMainSource. -/
def slakeTypecheckFreestandingEmitMainReady : Bool :=
  SystemsLean.HostFrontLiveFreestandingEmitMain.hostFrontLiveFreestandingEmitMainReady

/-- Honesty: this command is not lake build of FreestandingEmitMain. -/
def slakeTypecheckFreestandingEmitMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckFreestandingEmitMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckFreestandingEmitMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live FreestandingEmitMain.lean.
    Ready is HostFrontLiveFreestandingEmitMain.hostFrontLiveFreestandingEmitMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveFreestandingEmitMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckFreestandingEmitMain} =="
  IO.println s!"  host={hostId} file={liveFreestandingEmitMainRel}"
  unless (!slakeTypecheckFreestandingEmitMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckFreestandingEmitMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveFreestandingEmitMain.main args
