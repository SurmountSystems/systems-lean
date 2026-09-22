/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProgramForeignLink.
  Short role: named driver for just slake-typecheck-programforeignlink.
  Ready is HostFrontLiveProgramForeignLink parse plus HostKernel.kernelCheck of live
  ProgramForeignLink.lean, not := true, not lake build SystemsLean.ProgramForeignLink.
  Not mill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PROGRAM-FOREIGN-LINK,
  SLAKE_TYPECHECK_PROGRAM_FOREIGN_LINK_V0, slake-typecheck-programforeignlink,
  slakeTypecheckProgramForeignLinkReady, kernelCheckLiveProgramForeignLinkSource,
  PARSE-LIVE-PROGRAM-FOREIGN-LINK, PROGRAM-FOREIGN-LINK, SKELETON.
  Module: SystemsLean.SlakeTypecheckProgramForeignLink
  Checkable writer: just slake-typecheck-programforeignlink (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveProgramForeignLink

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PROGRAM_FOREIGN_LINK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PROGRAM-FOREIGN-LINK"

/-- Named just recipe. Not lake build SystemsLean.ProgramForeignLink. -/
def justRecipeSlakeTypecheckProgramForeignLink : String :=
  "slake-typecheck-programforeignlink"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProgramForeignLinkRel : String :=
  SystemsLean.HostFrontLiveProgramForeignLink.liveProgramForeignLinkRel

/-- Ready names HostFrontLiveProgramForeignLink parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckProgramForeignLinkReady,
    kernelCheckLiveProgramForeignLinkSource. -/
def slakeTypecheckProgramForeignLinkReady : Bool :=
  SystemsLean.HostFrontLiveProgramForeignLink.hostFrontLiveProgramForeignLinkReady

/-- Honesty: this command is not lake build of ProgramForeignLink. -/
def slakeTypecheckProgramForeignLinkDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProgramForeignLinkFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProgramForeignLinkOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProgramForeignLink.lean.
    Ready is HostFrontLiveProgramForeignLink.hostFrontLiveProgramForeignLinkReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProgramForeignLink.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProgramForeignLink} =="
  IO.println s!"  host={hostId} file={liveProgramForeignLinkRel}"
  unless (!slakeTypecheckProgramForeignLinkFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProgramForeignLinkOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProgramForeignLink.main args
