/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckPackageWriteKernel.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckPackageWriteKernel.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckPackageWriteKernelSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PACKAGE-WRITE-KERNEL.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckPackageWriteKernel.lean"

/-- Pinned live HostModuleCheckPackageWriteKernel.lean bytes. -/
def liveHostModuleCheckPackageWriteKernelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck kernel path for HostPackageWrite.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: PackageWrite KERNEL-CHECK only. Same namespace
  SystemsLean.HostModuleCheck.

  What this adds:
  - HostFrontLivePackageWrite parse of live HostPackageWrite.lean then kernelCheck
    (PARSE-LIVE-PACKAGEWRITE).
  Live HostPackageWrite.lean parse is SystemsLean.HostFrontLivePackageWrite, not
  the Mult fixture.

  Intentional non-claims:
  - Not full Lean 4 elaborator. Not FullHostElaborateRemains.
  - Not leftover isolation-test files. Not OccupancyProbe. Not mill.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock. Not FullHost.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckPackageWriteKernel,
  KERNEL-CHECK, PackageWrite-only, checkPackageWriteKernel,
  hostModuleCheckPackageWriteKernelOk, hostModuleCheckLivePackageWriteParseOk,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostModuleCheckPackageWriteKernel
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckPackageWriteKernel
  when on surmount-1. Not Lake GREEN. Not surmount-1 package typecheck GREEN.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostKernel
import SystemsLean.HostFrontLivePackageWrite

namespace SystemsLean.HostModuleCheck

open SystemsLean.HostKernel
open SystemsLean.HostFrontLivePackageWrite

/-! ### PackageWrite KERNEL-CHECK pins (live HostPackageWrite.lean, not Mult fixture) -/

/-- Named kernel depth bar for PackageWrite. Greppable: checkDepthPackageWriteKernelBar,
    KERNEL-CHECK, PackageWrite-only. -/
def checkDepthPackageWriteKernelBar : String := "KERNEL-CHECK"

/-- Honesty scope: SystemsLean.HostPackageWrite live parse only.
    Greppable: checkDepthPackageWriteKernelScope, PackageWrite-only, KERNEL-CHECK. -/
def checkDepthPackageWriteKernelScope : String := "PackageWrite-only"

/-- Dual-ok claim pin (gate truth is hostModuleCheckPackageWriteKernelOk).
    Greppable: hostModuleCheckPackageWriteKernelDualOk, KERNEL-CHECK,
    PackageWrite-only. -/
def hostModuleCheckPackageWriteKernelDualOk : Bool := true

/-- Live HostPackageWrite.lean parse kernel-checks. Not the HostTerm Mult fixture.
    Greppable: hostModuleCheckLivePackageWriteParseOk, PARSE-LIVE-PACKAGEWRITE. -/
def hostModuleCheckLivePackageWriteParseOk : Bool :=
  kernelCheckLivePackageWriteSource livePackageWriteSource
    && hostFrontLivePackageWriteReady

/-- Kernel check entry (live PackageWrite parse + HostKernel ready).
    Greppable: checkPackageWriteKernel, KERNEL-CHECK, PARSE-LIVE-PACKAGEWRITE. -/
def checkPackageWriteKernel : Bool :=
  hostKernelReady && hostModuleCheckLivePackageWriteParseOk

/-- Combined PackageWrite kernel dual-pin.
    Greppable: hostModuleCheckPackageWriteKernelOk, KERNEL-CHECK, PackageWrite-only. -/
def hostModuleCheckPackageWriteKernelOk : Bool :=
  hostModuleCheckPackageWriteKernelDualOk
    && (checkDepthPackageWriteKernelBar == "KERNEL-CHECK")
    && (checkDepthPackageWriteKernelScope == "PackageWrite-only")
    && checkPackageWriteKernel

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckPackageWriteKernelSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckPackageWriteKernelSourceReady : Bool :=
  liveRel == "HostModuleCheckPackageWriteKernel.lean"
    && kernelCheckLiveHostModuleCheckPackageWriteKernelSource liveHostModuleCheckPackageWriteKernelSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageWriteKernelSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckPackageWriteKernel.lean")
  let k := kernelCheckLiveHostModuleCheckPackageWriteKernelSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckPackageWriteKernel parse false")
  unless hostFrontLiveHostModuleCheckPackageWriteKernelSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckPackageWriteKernelSource
