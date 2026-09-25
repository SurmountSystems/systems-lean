/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.CapableComposeMain.
  Short role: named driver for just slake-typecheck-capablecomposemain.
  Ready is HostFrontLiveCapableComposeMainParse parse plus HostKernel.kernelCheck
  of live CapableComposeMain.lean, not a hardcoded true, not lake build
  SystemsLean.CapableComposeMain.
  liveRel is CapableComposeMain.lean.
  This wrap is CapableComposeMain.lean. It is not CapableCompose.lean.
  Not an LLVM backend. FullBackend stays false.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE-MAIN,
  SLAKE_TYPECHECK_CAPABLE_COMPOSE_MAIN, slake-typecheck-capablecomposemain,
  slakeTypecheckCapableComposeMainReady,
  kernelCheckLiveCapableComposeMainSource,
  PARSE-LIVE-CAPABLE-COMPOSE-MAIN.
  Module: SystemsLean.SlakeTypecheckCapableComposeMain
  Checkable writer: just slake-typecheck-capablecomposemain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveCapableComposeMainParse

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_CAPABLE_COMPOSE_MAIN"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-CAPABLE-COMPOSE-MAIN"

/-- Named just recipe. Not lake build SystemsLean.CapableComposeMain. -/
def justRecipeSlakeTypecheckCapableComposeMain : String :=
  "slake-typecheck-capablecomposemain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableComposeMainRel : String :=
  SystemsLean.HostFrontLiveCapableComposeMainParse.liveCapableComposeMainRel

/-- Ready names HostFrontLiveCapableComposeMainParse parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckCapableComposeMainReady,
    kernelCheckLiveCapableComposeMainSource. -/
def slakeTypecheckCapableComposeMainReady : Bool :=
  SystemsLean.HostFrontLiveCapableComposeMainParse.hostFrontLiveCapableComposeMainReady

/-- Honesty: this command is not lake build of CapableComposeMain. -/
def slakeTypecheckCapableComposeMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckCapableComposeMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend. -/
def slakeTypecheckCapableComposeMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckCapableComposeMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live CapableComposeMain.lean.
    Ready is HostFrontLiveCapableComposeMainParse.hostFrontLiveCapableComposeMainReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveCapableComposeMainParse.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckCapableComposeMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveCapableComposeMainParse.liveRel}"
  IO.println s!"  host={hostId} file={liveCapableComposeMainRel}"
  unless (!slakeTypecheckCapableComposeMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckCapableComposeMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveCapableComposeMainParse.main args
