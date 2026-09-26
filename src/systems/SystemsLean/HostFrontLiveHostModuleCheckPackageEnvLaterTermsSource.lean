/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckPackageEnvLaterTerms.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckPackageEnvLaterTerms.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckPackageEnvLaterTermsSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PACKAGE-ENV-LATER-TERMS.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain
open SystemsLean.HostTerm

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvLaterTerms.lean"

/-- Pinned live HostModuleCheckPackageEnvLaterTerms.lean bytes. -/
def liveHostModuleCheckPackageEnvLaterTermsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- package env later term imports.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split of HostModuleCheckPackageEnv. Role: the CompilePath
  through HostCheck term imports for the later package env bands.
  Same namespace SystemsLean.HostModuleCheck.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvLaterTerms, PACKAGE-ELABORATE.
  Module: SystemsLean.HostModuleCheckPackageEnvLaterTerms
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

import SystemsLean.HostModuleCheckCompilePathTerm
import SystemsLean.HostModuleCheckJoinMapTerm
import SystemsLean.HostModuleCheckSelfHostTerm
import SystemsLean.HostModuleCheckSurfaceMatrixTerm
import SystemsLean.HostModuleCheckSpecProofTerm
import SystemsLean.HostModuleCheckDualResidualTerm
import SystemsLean.HostModuleCheckCompilePathMultTerm
import SystemsLean.HostModuleCheckCompilePathLinearTerm
import SystemsLean.HostModuleCheckCompilePathTypesTerm
import SystemsLean.HostModuleCheckCompilePathProgramTerm
import SystemsLean.HostModuleCheckCompilePathGraphTerm
import SystemsLean.HostModuleCheckCompilePathComposeTerm
import SystemsLean.HostModuleCheckCompilePathErasureTerm
import SystemsLean.HostModuleCheckCompilePathExtractTerm
import SystemsLean.HostModuleCheckCompilePathPlanTerm
import SystemsLean.HostModuleCheckCompilePathApplyTerm
import SystemsLean.HostModuleCheckCompilePathBodyTerm
import SystemsLean.HostModuleCheckFirstSurfaceTerm
import SystemsLean.HostModuleCheckLinearSubsetEmitTerm
import SystemsLean.HostModuleCheckTypesSubsetEmitTerm
import SystemsLean.HostModuleCheckProgramSubsetEmitTerm
import SystemsLean.HostModuleCheckGraphSubsetEmitTerm
import SystemsLean.HostModuleCheckComposeSubsetEmitTerm
import SystemsLean.HostModuleCheckErasureSubsetEmitTerm
import SystemsLean.HostModuleCheckExtractSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetEmitTerm
import SystemsLean.HostModuleCheckMultSubsetRebuildTerm
import SystemsLean.HostModuleCheckLinearSubsetRebuildTerm
import SystemsLean.HostModuleCheckTypesSubsetRebuildTerm
import SystemsLean.HostModuleCheckProgramSubsetRebuildTerm
import SystemsLean.HostModuleCheckGraphSubsetRebuildTerm
import SystemsLean.HostModuleCheckComposeSubsetRebuildTerm
import SystemsLean.HostModuleCheckErasureSubsetRebuildTerm
import SystemsLean.HostModuleCheckExtractSubsetRebuildTerm
import SystemsLean.HostModuleCheckHostFrontTerm
import SystemsLean.HostModuleCheckLlvmMultTextTerm
import SystemsLean.HostModuleCheckHostCheckTerm

namespace SystemsLean.HostModuleCheck

end SystemsLean.HostModuleCheck
"#

/-- Column-0 import lines in the pinned text. Not a kernel command. -/
def countImportLines (src : String) : Nat :=
  (src.splitOn "\n").foldl (fun n line =>
    if line.startsWith "import " then n + 1 else n) 0

/-- Import commands the live parser kept. -/
def countImportCmds (cmds : List Cmd) : Nat :=
  cmds.foldl (fun n c =>
    match c with
    | Cmd.importModule _ => n + 1
    | _ => n) 0

/-- True when the live parse kept a namespace command. -/
def hasNamespaceCmd (cmds : List Cmd) : Bool :=
  cmds.any fun c =>
    match c with
    | Cmd.namespace _ => true
    | _ => false

/-- True when the live parse kept an end command. -/
def hasEndCmd (cmds : List Cmd) : Bool :=
  cmds.any fun c =>
    match c with
    | Cmd.endNamespace _ => true
    | _ => false

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckPackageEnvLaterTermsSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckPackageEnvLaterTermsSourceReady : Bool :=
  liveRel == "HostModuleCheckPackageEnvLaterTerms.lean"
    && kernelCheckLiveHostModuleCheckPackageEnvLaterTermsSource
      liveHostModuleCheckPackageEnvLaterTermsSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvLaterTermsSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckPackageEnvLaterTerms.lean")
  match parseLiveLlvmComposeTextMainSource disk with
  | FrontResult.reject _ =>
    IO.println "kept=0"
    IO.println "kernelCheck=false"
    throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvLaterTerms parse false")
  | FrontResult.accept m =>
    let kept := m.commands.length
    let imports := countImportCmds m.commands
    let lines := countImportLines disk
    IO.println s!"kept={kept}"
    IO.println s!"imports={imports}"
    let k := HostKernel.kernelCheck m
    IO.println s!"kernelCheck={k}"
    unless k do
      throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvLaterTerms parse false")
    unless imports == lines do
      throw (IO.userError s!"dropped import kept={imports} lines={lines}")
    unless hasNamespaceCmd m.commands && hasEndCmd m.commands do
      throw (IO.userError "namespace or end was not kept")
    unless kept == imports + 2 do
      throw (IO.userError s!"kept {kept} is not imports plus namespace plus end")
    unless kept <= kernelFuel do
      throw (IO.userError s!"kept list {kept} over kernelFuel {kernelFuel}")
    unless hostFrontLiveHostModuleCheckPackageEnvLaterTermsSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvLaterTermsSource
