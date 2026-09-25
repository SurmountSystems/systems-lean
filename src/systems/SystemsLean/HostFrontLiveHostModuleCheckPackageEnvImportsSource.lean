/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckPackageEnvImports.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckPackageEnvImports.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckPackageEnvImportsSource,
  PARSE-LIVE-HOST-MODULE-CHECK-PACKAGE-ENV-IMPORTS.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckPackageEnvImports.lean"

/-- Pinned live HostModuleCheckPackageEnvImports.lean bytes. -/
def liveHostModuleCheckPackageEnvImportsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 Soft J2 import helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: packageBodyImports plus named import predicates
  (Mult / Types / Program / Graph / Erasure / HostCompose / CompilePath /
  Kernel* / JoinMap / SelfHost / SelfApply / SelfApplyFs / SurfaceMatrix /
  SpecProof / CompilePath unit helpers) plus section require helpers
  (packageEnvRequireSection).
  Same namespace SystemsLean.HostModuleCheck.
  Dialect tails stay in HostModuleCheckPackageEnv.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - Not a new harness TERM companion.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvImports, PACKAGE-ELABORATE,
  packageBodyImports, packageBodyImportsMult,
  packageBodyImportsCompilePathExtract, packageBodyImportsOptional,
  packageBodyImportsSelfApply, packageBodyImportsSelfApplyFs,
  packageBodyImportsInventoryClose, packageBodyImportsProductPath,
  packageBodyImportsDualResidual, packageBodyImportsEmitMult,
  packageBodyImportsProbeWire,
  packageEnvRequireSection, packageEnvSectionOk, PACKAGE-ENV-INCOMPLETE,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvImports
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvImports;
  lake build SystemsLean.HostModuleCheckPackageEnv;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckPackageElab

namespace SystemsLean.HostModuleCheck

/-- Import module names from a package module body (import lines only).
    Greppable: packageBodyImports. -/
def packageBodyImports (body : String) : List String :=
  (body.splitOn "\n").filterMap fun line =>
    let t := trim (stripLineComment line)
    if hasPrefix t "import " then
      some (trim (String.Slice.toString (t.drop "import ".length)))
    else
      none

/-- True when body lists import SystemsLean.Mult.
    Greppable: packageBodyImportsMult. -/
def packageBodyImportsMult (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.Mult"

/-- True when body lists import SystemsLean.Types.
    Greppable: packageBodyImportsTypes. -/
def packageBodyImportsTypes (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.Types"

/-- True when body lists import SystemsLean.IrProgram.
    Greppable: packageBodyImportsProgram. -/
def packageBodyImportsProgram (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.IrProgram"

/-- True when body lists import SystemsLean.IrGraph.
    Greppable: packageBodyImportsGraph. -/
def packageBodyImportsGraph (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.IrGraph"

/-- True when body lists import SystemsLean.Erasure.
    Greppable: packageBodyImportsErasure. -/
def packageBodyImportsErasure (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.Erasure"

/-- True when body lists import SystemsLean.HostCompose.
    Greppable: packageBodyImportsHostCompose. -/
def packageBodyImportsHostCompose (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.HostCompose"

/-- True when body lists import SystemsLean.CompilePath.
    Greppable: packageBodyImportsCompilePath. -/
def packageBodyImportsCompilePath (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePath"

/-- True when body lists import SystemsLean.KernelProgram.
    Greppable: packageBodyImportsKernelProgram. -/
def packageBodyImportsKernelProgram (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.KernelProgram"

/-- True when body lists import SystemsLean.KernelMult.
    Greppable: packageBodyImportsKernelMult. -/
def packageBodyImportsKernelMult (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.KernelMult"

/-- True when body lists import SystemsLean.KernelLinear.
    Greppable: packageBodyImportsKernelLinear. -/
def packageBodyImportsKernelLinear (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.KernelLinear"

/-- True when body lists import SystemsLean.KernelTypes.
    Greppable: packageBodyImportsKernelTypes. -/
def packageBodyImportsKernelTypes (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.KernelTypes"

/-- True when body lists import SystemsLean.KernelEmit.
    Greppable: packageBodyImportsKernelEmit. -/
def packageBodyImportsKernelEmit (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.KernelEmit"

/-- Soft J2 import predicate when unit TERM body has no required import.
    Greppable: packageBodyImportsOptional. -/
def packageBodyImportsOptional (_body : String) : Bool := true

/-- True when body lists import SystemsLean.JoinMap.
    Greppable: packageBodyImportsJoinMap. -/
def packageBodyImportsJoinMap (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.JoinMap"

/-- True when body lists import SystemsLean.SelfHost.
    Greppable: packageBodyImportsSelfHost. -/
def packageBodyImportsSelfHost (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.SelfHost"

/-- True when body lists import SystemsLean.SelfApply.
    Greppable: packageBodyImportsSelfApply. -/
def packageBodyImportsSelfApply (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.SelfApply"

/-- True when body lists import SystemsLean.SelfApplyFs.
    Soft J2 InventoryClose leftover: SelfApplyFs only (not SelfApply leftover,
    not SelfHost).
    Greppable: packageBodyImportsSelfApplyFs. -/
def packageBodyImportsSelfApplyFs (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.SelfApplyFs"

/-- True when body lists import SystemsLean.InventoryClose.
    Soft J2 ProductPath leftover: InventoryClose only (not SelfApplyFs leftover,
    not CompilePath leftover). ProductPath leftover first import is
    InventoryClose. DualResidual leftover Soft J2 invents
    packageBodyImportsProductPath (DualResidual first import is ProductPath).
    Greppable: packageBodyImportsInventoryClose. -/
def packageBodyImportsInventoryClose (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.InventoryClose"

/-- True when body lists import SystemsLean.ProductPath.
    Soft J2 DualResidual leftover: ProductPath only (not SpecProof leftover,
    not InventoryClose leftover, not SelfApplyFs leftover). DualResidual
    first import is SystemsLean.ProductPath. ProductPath leftover Soft J2
    stays packageBodyImportsInventoryClose.
    Greppable: packageBodyImportsProductPath. -/
def packageBodyImportsProductPath (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.ProductPath"

/-- True when body lists import SystemsLean.DualResidual.
    Soft J2 ProbeWire leftover: DualResidual only (not ProductPath leftover,
    not InventoryClose leftover, not SpecProof leftover, not SelfApplyFs).
    ProbeWire leftover first import is SystemsLean.DualResidual. SpecProof
    leftover Soft J2 invents packageBodyImportsProbeWire. DualResidual leftover
    Soft J2 stays packageBodyImportsProductPath.
    Greppable: packageBodyImportsDualResidual. -/
def packageBodyImportsDualResidual (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.DualResidual"

/-- True when body lists import SystemsLean.EmitMult.
    Soft J2 SelfHostBody leftover: EmitMult only (not Mult leftover, not
    DualResidual leftover, not ProductPath leftover). SelfHostBody leftover
    first import is SystemsLean.EmitMult. Do not invent
    packageBodyImportsSelfHostBody. ProbeWire leftover Soft J2 stays
    packageBodyImportsDualResidual. packageBodyImportsMult stays SystemsLean.Mult.
    Greppable: packageBodyImportsEmitMult. -/
def packageBodyImportsEmitMult (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.EmitMult"

/-- True when body lists import SystemsLean.ProbeWire.
    Soft J2 SpecProof leftover: ProbeWire only (not SurfaceMatrix S6, not
    DualResidual leftover, not SpecProof self-import). SpecProof leftover
    first import is SystemsLean.ProbeWire. Do not reuse
    packageBodyImportsSpecProof or packageBodyImportsSurfaceMatrix.
    ProbeWire leftover Soft J2 stays packageBodyImportsDualResidual.
    Greppable: packageBodyImportsProbeWire. -/
def packageBodyImportsProbeWire (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.ProbeWire"

/-- True when body lists import SystemsLean.SurfaceMatrix.
    Greppable: packageBodyImportsSurfaceMatrix. -/
def packageBodyImportsSurfaceMatrix (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.SurfaceMatrix"

/-- True when body lists import SystemsLean.SpecProof.
    Greppable: packageBodyImportsSpecProof. -/
def packageBodyImportsSpecProof (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.SpecProof"

/-- True when body lists import SystemsLean.CompilePathMult.
    Greppable: packageBodyImportsCompilePathMult. -/
def packageBodyImportsCompilePathMult (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathMult"

/-- True when body lists import SystemsLean.CompilePathLinear.
    Greppable: packageBodyImportsCompilePathLinear. -/
def packageBodyImportsCompilePathLinear (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathLinear"

/-- True when body lists import SystemsLean.CompilePathTypes.
    Greppable: packageBodyImportsCompilePathTypes. -/
def packageBodyImportsCompilePathTypes (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathTypes"

/-- True when body lists import SystemsLean.CompilePathProgram.
    Greppable: packageBodyImportsCompilePathProgram. -/
def packageBodyImportsCompilePathProgram (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathProgram"

/-- True when body lists import SystemsLean.CompilePathGraph.
    Soft J2 GraphSubsetEmit: CompilePathGraph only (no EmitGraph farm).
    Greppable: packageBodyImportsCompilePathGraph. -/
def packageBodyImportsCompilePathGraph (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathGraph"

/-- True when body lists import SystemsLean.CompilePathCompose.
    Soft J2 ComposeSubsetEmit / ComposeSubsetRebuild: CompilePathCompose only
    (no EmitCompose farm; no EmitRebuild farm).
    Greppable: packageBodyImportsCompilePathCompose. -/
def packageBodyImportsCompilePathCompose (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathCompose"

/-- True when body lists import SystemsLean.CompilePathErasure.
    Soft J2 ErasureSubsetEmit / ErasureSubsetRebuild: CompilePathErasure only
    (no EmitErasure farm; no EmitRebuild farm).
    Greppable: packageBodyImportsCompilePathErasure. -/
def packageBodyImportsCompilePathErasure (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathErasure"

/-- True when body lists import SystemsLean.CompilePathExtract.
    Soft J2 ExtractSubsetEmit / ExtractSubsetRebuild: CompilePathExtract only
    (no EmitExtract farm; no EmitRebuild farm).
    Greppable: packageBodyImportsCompilePathExtract. -/
def packageBodyImportsCompilePathExtract (body : String) : Bool :=
  (packageBodyImports body).any fun imp => imp == "SystemsLean.CompilePathExtract"

/-- Package-env incomplete reject (import/envelope; not unit inventory).
    Greppable: reasonPackageEnvIncomplete, PACKAGE-ENV-INCOMPLETE. -/
def reasonPackageEnvIncomplete : String := "PACKAGE-ENV-INCOMPLETE"

/-- Open marker for a named module section in a package env fixture.
    Greppable: packageModuleOpenMark. -/
def packageModuleOpenMark (name : String) : String :=
  "===module " ++ name ++ "==="

/-- Close marker for a module section.
    Greppable: packageModuleCloseMark. -/
def packageModuleCloseMark : String := "===end==="

/-- Body of named ===module Name=== ... ===end=== section, if present.
    Greppable: extractPackageModuleBody. -/
def extractPackageModuleBody (content name : String) : Option String :=
  let openMark := packageModuleOpenMark name
  let parts := content.splitOn openMark
  match parts with
  | _ :: afterOpen :: _ =>
    match afterOpen.splitOn packageModuleCloseMark with
    | body :: _ => some body
    | _ => none
  | _ => none

/-- True when every import in body has a matching ===module Name=== section.
    Soft J2 package import environment.
    Greppable: packageImportsResolved, packageBodyImportsMult. -/
def packageImportsResolved (content body : String) : Bool :=
  (packageBodyImports body).all fun imp =>
    packageInventoryHas content (packageModuleOpenMark imp)

/-- Soft J2 + J5 for one package module section.
    Greppable: packageEnvSectionOk. -/
def packageEnvSectionOk (content body : String) (needImport : String -> Bool)
    (dialect : String -> Option String) : Option String :=
  if !needImport body then some reasonPackageEnvIncomplete
  else if !packageImportsResolved content body then some reasonPackageEnvIncomplete
  else
    match dialect body with
    | some _ => some reasonIllTypedTerm
    | none => none

/-- Require named section with J2+J5, else incomplete or ill-typed.
    Greppable: packageEnvRequireSection. -/
def packageEnvRequireSection (content name : String)
    (needImport : String -> Bool) (dialect : String -> Option String) :
    Option String :=
  match extractPackageModuleBody content name with
  | none => some reasonPackageEnvIncomplete
  | some body => packageEnvSectionOk content body needImport dialect

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckPackageEnvImportsSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckPackageEnvImportsSourceReady : Bool :=
  liveRel == "HostModuleCheckPackageEnvImports.lean"
    && kernelCheckLiveHostModuleCheckPackageEnvImportsSource liveHostModuleCheckPackageEnvImportsSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvImportsSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckPackageEnvImports.lean")
  let k := kernelCheckLiveHostModuleCheckPackageEnvImportsSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvImports parse false")
  unless hostFrontLiveHostModuleCheckPackageEnvImportsSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvImportsSource
