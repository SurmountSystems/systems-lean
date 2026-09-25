/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmComposeTextMain.
  Short role: named driver for just slake-typecheck-llvmcomposetextmain.
  Ready is HostFrontLiveLlvmComposeTextMain parse plus HostKernel.kernelCheck
  of live LlvmComposeTextMain.lean, not := true, not lake build
  SystemsLean.LlvmComposeTextMain.
  Not mill 60 remill. Not occupancy name 50. Not FullHost.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Unique needles (trailing newline so SlakeTypecheckLlvmComposeTextMain is not a prefix):
  SlakeTypecheckLlvmComposeTextMain
  HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-TEXT-MAIN
  SLAKE_TYPECHECK_LLVM_COMPOSE_TEXT_MAIN_V0
  slake-typecheck-llvmcomposetextmain
  PARSE-LIVE-LLVM-COMPOSE-TEXT-MAIN
  LLVM-COMPOSE-TEXT-MAIN
  HOST-LLVM-COMPOSE-TEXT-MAIN
  Greppable: SYSTEMS_LEAN_HOST, slake-typecheck-llvmcomposetextmain,
  slakeTypecheckLlvmComposeTextMainReady,
  kernelCheckLiveLlvmComposeTextMainSource,
  SKELETON.
  Module: SystemsLean.SlakeTypecheckLlvmComposeTextMain
  Checkable writer: just slake-typecheck-llvmcomposetextmain
  (lean --run; no mill; no lake). Dests skipped this slice.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_COMPOSE_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-COMPOSE-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmComposeTextMain. -/
def justRecipeSlakeTypecheckLlvmComposeTextMain : String :=
  "slake-typecheck-llvmcomposetextmain"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmComposeTextMain.liveLlvmComposeTextMainRel

/-- Ready names HostFrontLiveLlvmComposeTextMain parse plus kernelCheck,
    not := true.
    Greppable: slakeTypecheckLlvmComposeTextMainReady,
    kernelCheckLiveLlvmComposeTextMainSource. -/
def slakeTypecheckLlvmComposeTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmComposeTextMain.hostFrontLiveLlvmComposeTextMainReady

/-- Honesty: this command is not lake build of LlvmComposeTextMain. -/
def slakeTypecheckLlvmComposeTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmComposeTextMainFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not an LLVM backend claim. -/
def slakeTypecheckLlvmComposeTextMainFullBackend : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmComposeTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmComposeTextMain.lean.
    Ready is HostFrontLiveLlvmComposeTextMain.hostFrontLiveLlvmComposeTextMainReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveLlvmComposeTextMain.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmComposeTextMain} =="
  IO.println s!"  host={hostId} file={liveLlvmComposeTextMainRel}"
  unless (!slakeTypecheckLlvmComposeTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeTextMainFullBackend) do
    IO.eprintln "error: FullBackend must stay false"
    return 1
  unless (!slakeTypecheckLlvmComposeTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmComposeTextMain.main args
