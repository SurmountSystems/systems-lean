/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckPackageEnvCoreTerms.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckPackageEnvCoreTerms.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckPackageEnvCoreTermsSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PACKAGE-ENV-CORE-TERMS.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvCoreTerms.lean"

/-- Pinned live HostModuleCheckPackageEnvCoreTerms.lean bytes. -/
def liveHostModuleCheckPackageEnvCoreTermsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- package env core term imports.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split of HostModuleCheckPackageEnv. Role: the Mult through
  ProductOutKernel term imports for the package elaborate env band.
  Same namespace SystemsLean.HostModuleCheck.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvCoreTerms, PACKAGE-ELABORATE.
  Module: SystemsLean.HostModuleCheckPackageEnvCoreTerms
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostModuleCheckMultTerm
import SystemsLean.HostModuleCheckLinearTerm
import SystemsLean.HostModuleCheckTypesTerm
import SystemsLean.HostModuleCheckIrProgramTerm
import SystemsLean.HostModuleCheckIrGraphTerm
import SystemsLean.HostModuleCheckHostComposeTerm
import SystemsLean.HostModuleCheckErasureTerm
import SystemsLean.HostModuleCheckExtractTerm
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckEmitApplyTerm
import SystemsLean.HostModuleCheckEmitBodyTerm
import SystemsLean.HostModuleCheckKernelMultTerm
import SystemsLean.HostModuleCheckKernelLinearTerm
import SystemsLean.HostModuleCheckKernelTypesTerm
import SystemsLean.HostModuleCheckKernelProgramTerm
import SystemsLean.HostModuleCheckKernelEmitTerm
import SystemsLean.HostModuleCheckParityMultTerm
import SystemsLean.HostModuleCheckParityLinearTerm
import SystemsLean.HostModuleCheckParityTypesTerm
import SystemsLean.HostModuleCheckParityProgramTerm
import SystemsLean.HostModuleCheckParityEmitTerm
import SystemsLean.HostModuleCheckEmitMultScaffoldTerm
import SystemsLean.HostModuleCheckEmitLinearScaffoldTerm
import SystemsLean.HostModuleCheckEmitTypesScaffoldTerm
import SystemsLean.HostModuleCheckEmitProgramScaffoldTerm
import SystemsLean.HostModuleCheckEmitGraphScaffoldTerm
import SystemsLean.HostModuleCheckEmitComposeScaffoldTerm
import SystemsLean.HostModuleCheckEmitErasureScaffoldTerm
import SystemsLean.HostModuleCheckEmitExtractScaffoldTerm
import SystemsLean.HostModuleCheckEmitBannerScaffoldTerm
import SystemsLean.HostModuleCheckKernelSelfApplyTerm
import SystemsLean.HostModuleCheckProductOutKernelTerm

namespace SystemsLean.HostModuleCheck

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckPackageEnvCoreTermsSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckPackageEnvCoreTermsSourceReady : Bool :=
  liveRel == "HostModuleCheckPackageEnvCoreTerms.lean"
    && kernelCheckLiveHostModuleCheckPackageEnvCoreTermsSource liveHostModuleCheckPackageEnvCoreTermsSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvCoreTermsSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckPackageEnvCoreTerms.lean")
  match parseLiveLlvmComposeTextMainSource disk with
  | FrontResult.accept m =>
    IO.println s!"keptCmds={m.commands.length}"
  | FrontResult.reject _ =>
    IO.println "keptCmds=reject"
  let k := kernelCheckLiveHostModuleCheckPackageEnvCoreTermsSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvCoreTerms parse false")
  unless hostFrontLiveHostModuleCheckPackageEnvCoreTermsSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvCoreTermsSource
