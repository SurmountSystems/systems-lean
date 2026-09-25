/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.LlvmMultTextMain.
  Short role: named driver for just slake-typecheck-lvmmulttextmain.
  Ready is HostFrontLiveLlvmMultTextMainSource parse plus HostKernel.kernelCheck
  of live LlvmMultTextMain.lean, not a hardcoded true, not lake build
  SystemsLean.LlvmMultTextMain.
  liveRel is LlvmMultTextMain.lean.
  This wrap is LlvmMultTextMain.lean. It is not LlvmMultText.lean.
  The checker accepts the Main source. The forwarder only calls the neighbor.
  Not a remill. Not occupancy name 50. Not FullHost.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69.
  Occupancy stays 49. Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-LLVM-MULT-TEXT-MAIN,
  SLAKE_TYPECHECK_LLVM_MULT_TEXT_MAIN_V0,
  slake-typecheck-lvmmulttextmain,
  slakeTypecheckLlvmMultTextMainReady,
  kernelCheckLiveLlvmMultTextMainSource,
  PARSE-LIVE-LLVM-MULT-TEXT-MAIN.
  Module: SystemsLean.SlakeTypecheckLlvmMultTextMain
  Checkable writer: just slake-typecheck-lvmmulttextmain
  (lean --run; no mill; no lake).
-/

import SystemsLean.HostFrontLiveLlvmMultTextMainSource

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_LLVM_MULT_TEXT_MAIN_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-LLVM-MULT-TEXT-MAIN"

/-- Named just recipe. Not lake build SystemsLean.LlvmMultTextMain. -/
def justRecipeSlakeTypecheckLlvmMultTextMain : String :=
  "slake-typecheck-lvmmulttextmain"

/-- Live file bare name. Same string as liveRel. Not a path. -/
def liveLlvmMultTextMainRel : String :=
  SystemsLean.HostFrontLiveLlvmMultTextMainSource.liveRel

/-- Ready names HostFrontLiveLlvmMultTextMainSource parse plus kernelCheck,
    not a hardcoded true.
    Greppable: slakeTypecheckLlvmMultTextMainReady,
    kernelCheckLiveLlvmMultTextMainSource. -/
def slakeTypecheckLlvmMultTextMainReady : Bool :=
  SystemsLean.HostFrontLiveLlvmMultTextMainSource.hostFrontLiveLlvmMultTextMainReady

/-- Honesty: this command is not lake build of LlvmMultTextMain. -/
def slakeTypecheckLlvmMultTextMainDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckLlvmMultTextMainFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckLlvmMultTextMainOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live LlvmMultTextMain.lean.
    Ready is HostFrontLiveLlvmMultTextMainSource.hostFrontLiveLlvmMultTextMainReady
    (parse plus HostKernel.kernelCheck), not a hardcoded true. Evaluated inside
    HostFrontLiveLlvmMultTextMainSource.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckLlvmMultTextMain} =="
  IO.println s!"liveRel={SystemsLean.HostFrontLiveLlvmMultTextMainSource.liveRel}"
  IO.println s!"  host={hostId} file={liveLlvmMultTextMainRel}"
  unless (!slakeTypecheckLlvmMultTextMainFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckLlvmMultTextMainOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveLlvmMultTextMainSource.main args
