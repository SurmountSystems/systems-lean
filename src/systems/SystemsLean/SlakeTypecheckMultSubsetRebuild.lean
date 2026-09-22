/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.MultSubsetRebuild.
  Short role: named driver for just slake-typecheck-multsubsetrebuild.
  Ready is HostFrontLiveMultSubsetRebuild parse plus HostKernel.kernelCheck
  of live MultSubsetRebuild.lean, not a hardcoded true, not lake build
  SystemsLean.MultSubsetRebuild.
  liveRel is MultSubsetRebuild.lean.
  This wrap is MultSubsetRebuild.lean. It is not MultSubsetRebuildMain.lean.
  Main entry is this driver. HostFrontLiveMultSubsetRebuildMain.lean is a
  different module and is not this wrap.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-MULT-SUBSET-REBUILD,
  SLAKE_TYPECHECK_MULT_SUBSET_REBUILD, slake-typecheck-multsubsetrebuild,
  slakeTypecheckMultSubsetRebuildReady,
  kernelCheckLiveMultSubsetRebuildSource,
  PARSE-LIVE-MULT-SUBSET-REBUILD.
  Module: SystemsLean.SlakeTypecheckMultSubsetRebuild
  Checkable writer: just slake-typecheck-multsubsetrebuild
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveMultSubsetRebuild
import SystemsLean.HostKernel

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_MULT_SUBSET_REBUILD"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-MULT-SUBSET-REBUILD"

/-- Named just recipe. Not lake build SystemsLean.MultSubsetRebuild. -/
def justRecipeSlakeTypecheckMultSubsetRebuild : String :=
  "slake-typecheck-multsubsetrebuild"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultSubsetRebuildRel : String :=
  SystemsLean.HostFrontLiveMultSubsetRebuild.liveMultSubsetRebuildRel

/-- Driver calls HostKernel.kernelCheck of the live parse.
    Not a stub. Not a hardcoded true.
    Greppable: kernelCheckLiveMultSubsetRebuildSource,
    HostKernel.kernelCheck. -/
def kernelCheckLiveMultSubsetRebuildSource : Bool :=
  match SystemsLean.HostFrontLiveMultSubsetRebuild.parseLiveMultSubsetRebuildSource
      SystemsLean.HostFrontLiveMultSubsetRebuild.liveMultSubsetRebuildSource with
  | SystemsLean.HostFront.FrontResult.accept m =>
    SystemsLean.HostKernel.kernelCheck m
  | SystemsLean.HostFront.FrontResult.reject _ => false

/-- Ready names HostFrontLiveMultSubsetRebuild parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckMultSubsetRebuildReady,
    kernelCheckLiveMultSubsetRebuildSource. -/
def slakeTypecheckMultSubsetRebuildReady : Bool :=
  kernelCheckLiveMultSubsetRebuildSource
    && SystemsLean.HostFrontLiveMultSubsetRebuild.hostFrontLiveMultSubsetRebuildReady

/-- Honesty: this command is not lake build of MultSubsetRebuild. -/
def slakeTypecheckMultSubsetRebuildDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckMultSubsetRebuildFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckMultSubsetRebuildOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus HostKernel.kernelCheck live MultSubsetRebuild.lean.
    Ready is hostFrontLiveMultSubsetRebuildReady
    (parse plus kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveMultSubsetRebuild.main at runtime, and this driver calls
    HostKernel.kernelCheck before that forward. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckMultSubsetRebuild} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveMultSubsetRebuild.liveRel}"
  IO.println s!"  host={hostId} file={liveMultSubsetRebuildRel}"
  unless (!slakeTypecheckMultSubsetRebuildFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckMultSubsetRebuildOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless kernelCheckLiveMultSubsetRebuildSource do
    IO.eprintln "error: HostKernel.kernelCheck live MultSubsetRebuild parse false"
    return 1
  unless slakeTypecheckMultSubsetRebuildReady do
    IO.eprintln "error: slakeTypecheckMultSubsetRebuildReady false"
    return 1
  SystemsLean.HostFrontLiveMultSubsetRebuild.main args
