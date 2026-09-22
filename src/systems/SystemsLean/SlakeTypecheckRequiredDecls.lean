/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.HostModuleCheckRequiredDecls.
  Short role: named driver for just slake-typecheck-requireddecls.
  Ready is HostFrontLiveRequiredDecls parse plus HostKernel.kernelCheck of live
  HostModuleCheckRequiredDecls.lean, not := true, not lake build
  SystemsLean.HostModuleCheckRequiredDecls.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-REQUIRED-DECLS,
  SLAKE_TYPECHECK_REQUIRED_DECLS_V0, slake-typecheck-requireddecls,
  slakeTypecheckRequiredDeclsReady, kernelCheckLiveRequiredDeclsSource,
  PARSE-LIVE-REQUIRED-DECLS, SKELETON.
  Module: SystemsLean.SlakeTypecheckRequiredDecls
  Checkable writer: just slake-typecheck-requireddecls (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveRequiredDecls

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_REQUIRED_DECLS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-REQUIRED-DECLS"

/-- Named just recipe. Not lake build SystemsLean.HostModuleCheckRequiredDecls. -/
def justRecipeSlakeTypecheckRequiredDecls : String :=
  "slake-typecheck-requireddecls"

/-- Live file relative to repo root. Dual-pin path. -/
def liveRequiredDeclsRel : String :=
  SystemsLean.HostFrontLiveRequiredDecls.liveRequiredDeclsRel

/-- Ready names HostFrontLiveRequiredDecls parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckRequiredDeclsReady,
    kernelCheckLiveRequiredDeclsSource. -/
def slakeTypecheckRequiredDeclsReady : Bool :=
  SystemsLean.HostFrontLiveRequiredDecls.hostFrontLiveRequiredDeclsReady

/-- Honesty: this command is not lake build of HostModuleCheckRequiredDecls. -/
def slakeTypecheckRequiredDeclsDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckRequiredDeclsFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckRequiredDeclsOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live HostModuleCheckRequiredDecls.lean.
    Ready is HostFrontLiveRequiredDecls.hostFrontLiveRequiredDeclsReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveRequiredDecls.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckRequiredDecls} =="
  IO.println s!"  host={hostId} file={liveRequiredDeclsRel}"
  unless (!slakeTypecheckRequiredDeclsFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckRequiredDeclsOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveRequiredDecls.main args
