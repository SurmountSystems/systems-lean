/-
  SYSTEMS_LEAN_HOST -- Slake typechecks live SystemsLean.ProductPathWriterPathExec.
  Short role: named driver for lean --run of live ProductPathWriterPathExec.lean parse.
  Ready is HostFrontLiveProductPathWriterPathExec parse plus HostKernel.kernelCheck of live
  ProductPathWriterPathExec.lean, not := true, not lake build SystemsLean.ProductPathWriterPathExec.
  Not mill. Not occupancy name 50. Not FullHost. Not mill remill of mill 69.
  slakeOwnsPackageTypecheck stays false. Mill stays 69 of 69. Occupancy stays 49.
  Not Lake-gone. Not the full src/systems package walk.
  Greppable: SYSTEMS_LEAN_HOST, HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-EXEC,
  SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_EXEC_V0, slake-typecheck-productpathwriterpathexec,
  slakeTypecheckProductPathWriterPathExecReady, kernelCheckLiveProductPathWriterPathExecSource,
  PARSE-LIVE-PRODUCT-PATH-WRITER-PATH-EXEC, SKELETON.
  Module: SystemsLean.SlakeTypecheckProductPathWriterPathExec
  Checkable writer: lean --run this file (no mill; no lake on the step).
-/

import SystemsLean.HostFrontLiveProductPathWriterPathExec

/-- Greppable stage id. -/
def stageId : String := "SLAKE_TYPECHECK_PRODUCT_PATH_WRITER_PATH_EXEC_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SLAKE-TYPECHECK-PRODUCT-PATH-WRITER-PATH-EXEC"

/-- Named just recipe string. Dest just module is not imported from the root justfile. -/
def justRecipeSlakeTypecheckProductPathWriterPathExec : String :=
  "slake-typecheck-productpathwriterpathexec"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathWriterPathExecRel : String :=
  SystemsLean.HostFrontLiveProductPathWriterPathExec.liveProductPathWriterPathExecRel

/-- Ready names HostFrontLiveProductPathWriterPathExec parse plus kernelCheck, not := true.
    Greppable: slakeTypecheckProductPathWriterPathExecReady,
    kernelCheckLiveProductPathWriterPathExecSource. -/
def slakeTypecheckProductPathWriterPathExecReady : Bool :=
  SystemsLean.HostFrontLiveProductPathWriterPathExec.hostFrontLiveProductPathWriterPathExecReady

/-- Honesty: this command is not lake build of ProductPathWriterPathExec. -/
def slakeTypecheckProductPathWriterPathExecDoesNotUseLake : Bool := true

/-- Honesty: FullHost stays false. -/
def slakeTypecheckProductPathWriterPathExecFullHost : Bool := false

/-- Honesty: package typecheck pin stays false. -/
def slakeTypecheckProductPathWriterPathExecOwnsPackageTypecheck : Bool := false

/-- lean --run entry: parse plus kernelCheck live ProductPathWriterPathExec.lean.
    Ready is HostFrontLiveProductPathWriterPathExec.hostFrontLiveProductPathWriterPathExecReady
    (parse plus kernelCheck), not := true. Evaluated inside
    HostFrontLiveProductPathWriterPathExec.main at runtime. -/
def main (args : List String) : IO UInt32 := do
  IO.println s!"== {stageId}: {justRecipeSlakeTypecheckProductPathWriterPathExec} =="
  IO.println s!"  host={hostId} liveRel={SystemsLean.HostFrontLiveProductPathWriterPathExec.liveRel} file={liveProductPathWriterPathExecRel}"
  unless (!slakeTypecheckProductPathWriterPathExecFullHost) do
    IO.eprintln "error: FullHost must stay false"
    return 1
  unless (!slakeTypecheckProductPathWriterPathExecOwnsPackageTypecheck) do
    IO.eprintln "error: slakeOwnsPackageTypecheck must stay false"
    return 1
  SystemsLean.HostFrontLiveProductPathWriterPathExec.main args
