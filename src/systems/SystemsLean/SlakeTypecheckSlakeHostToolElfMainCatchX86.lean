/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.SlakeHostToolElfMainCatchX86.
  Short role: named driver for lean --run of live SlakeHostToolElfMainCatchX86.lean parse.
  Ready is HostFrontLiveSlakeHostToolElfMainCatchX86 parse plus HostKernel.kernelCheck of live
  SlakeHostToolElfMainCatchX86.lean, not := true, not lake build SystemsLean.SlakeHostToolElfMainCatchX86.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. FullBackend stays false.
  Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86,
  SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_X86_V0, slake-typecheck-slakehosttoolelfmaincatchx86,
  slakeTypecheckSlakeHostToolElfMainCatchX86Ready, kernelCheckLiveSlakeHostToolElfMainCatchX86Source,
  PARSE-LIVE-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86, SKELETON.
  Module: SystemsLean.SlakeTypecheckSlakeHostToolElfMainCatchX86
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_SLAKE_HOST_TOOL_ELF_MAIN_CATCH_X86_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-SLAKE-HOST-TOOL-ELF-MAIN-CATCH-X86"

/-- Named just recipe string. Root justfile does not import this recipe. -/
def justRecipeSlakeTypecheckSlakeHostToolElfMainCatchX86 : String :=
  "slake-typecheck-slakehosttoolelfmaincatchx86"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSlakeHostToolElfMainCatchX86Rel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.liveSlakeHostToolElfMainCatchX86Rel

/-- Live basename. Greppable: liveRel. Must be SlakeHostToolElfMainCatchX86.lean. -/
def liveRel : String :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.liveRel

/-- Ready names HostFrontLiveSlakeHostToolElfMainCatchX86 parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckSlakeHostToolElfMainCatchX86Ready,
    kernelCheckLiveSlakeHostToolElfMainCatchX86Source. -/
def slakeTypecheckSlakeHostToolElfMainCatchX86Ready : Bool :=
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.hostFrontLiveSlakeHostToolElfMainCatchX86Ready

/-- Honesty: this command is not lake build of SlakeHostToolElfMainCatchX86. -/
def slakeTypecheckSlakeHostToolElfMainCatchX86DoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchX86FullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckSlakeHostToolElfMainCatchX86OwnsPackageTypecheck : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckSlakeHostToolElfMainCatchX86FullBackend : Bool := false

/-- lean --run entry: parse plus kernelCheck live SlakeHostToolElfMainCatchX86.lean.
    Ready is HostFrontLiveSlakeHostToolElfMainCatchX86.hostFrontLiveSlakeHostToolElfMainCatchX86Ready
    (parse plus HostKernel.kernelCheck), not a literal true. Evaluated inside
    HostFrontLiveSlakeHostToolElfMainCatchX86.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckSlakeHostToolElfMainCatchX86} =="
  IO.println s!"  host={hostId} file={liveSlakeHostToolElfMainCatchX86Rel} liveRel={liveRel}"
  unless (!slakeTypecheckSlakeHostToolElfMainCatchX86FullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMainCatchX86OwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  unless (!slakeTypecheckSlakeHostToolElfMainCatchX86FullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  SystemsLean.HostFrontLiveSlakeHostToolElfMainCatchX86.main args
