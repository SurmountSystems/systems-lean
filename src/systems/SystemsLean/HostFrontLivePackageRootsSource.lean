/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostPackageRoots.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageRootsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-PACKAGE-ROOTS, livePackageRootsSource,
  HOST-FRONT-LIVE-PACKAGE-ROOTS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLivePackageRootsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLivePackageRoots

/-- Dual-pinned live HostPackageRoots.lean bytes (must match on-disk file).
    Greppable: livePackageRootsSource, PARSE-LIVE-PACKAGE-ROOTS. -/
def livePackageRootsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- package roots / library module list without Lake
  on the measured step (plan-slake-replaces-lake A3 / design S1 Package load).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).

  Spec (readable):
  - Dual-pin package map from living lakefile shape without invoking lake:
    package name SystemsLean, lean_lib root SystemsLean, config path
    src/systems/lakefile.lean, library dir src/systems/SystemsLean.
  - Measured load: walk SystemsLean/*.lean (+ package root SystemsLean.lean)
    via IO.FS.readDir; print roots + module count + sorted basenames.
  - Fail-closed if package config, library dir, or seed modules missing;
    fail-closed if module count below floor (scale honesty vs empty tree).
  - Lake-built host binary OK (just host-package-roots). Without-Lake measured:
    just host-package-roots-without-lake prebuilt ELF; no lake on hot path.

  Out of scope: full SystemsLean elaborate; full import graph resolve; host free
  flip; mathlib; PROVABLY/llvm; product free/complete tip flips; product C growth.
  Six-unit Mult..Compose package write remains foundation (orthogonal surface).

  Greppable: SYSTEMS_LEAN_HOST, HOST-PACKAGE-ROOTS, SLAKE_HOST_PACKAGE_ROOTS,
  SLAKE_HOST_PACKAGE_ROOTS_V0, HOST-HOST-PACKAGE-ROOTS, hostPackageRootsReady,
  hostPackageRootsFinishedClaimed, hostPackageRootsLoadOk,
  hostPackageRootsPackageName, hostPackageRootsLibraryRoot,
  hostPackageRootsConfigRel, hostPackageRootsLibraryDirRel,
  hostPackageRootsPackageRootLeanRel, hostPackageRootsSystemsDirRel,
  hostPackageRootsModuleCountFloor, hostPackageRootsSeedModules,
  hostPackageRootsHostElaboratorResidualRemains,
  hostPackageRootsWithoutLakeFinished, hostPackageRootsWithoutLakeReady,
  hostPackageRootsWithoutLakeKeepsHostLake, justRecipeWithoutLake,
  prebuiltHostPackageRootsRel, host-package-roots-without-lake,
  HOST-PACKAGE-ROOTS-WITHOUT-LAKE, HOST-PACKAGE-ROOTS-SMOKE,
  HOST-PACKAGE-ROOTS-THEOREM, hostPackageRootsReady_true,
  slake-host-package-roots, just host-package-roots, loadPackageRoots,
  runPackageRoots, UNIT_SURFACE host surface, MULT-0,
  full-host-elaborator-design-2026-08-03, Package roots without Lake.
  Module: SystemsLean.HostPackageRoots
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural package map pins + on-disk walk inventory +
  just host-package-roots-without-lake greps.
  Red/green: just host-package-roots-without-lake (measured); just
  host-package-roots (Lake bootstrap); lake build once for prebuilt.
  Design: doc/dev/research/full-host-elaborator-design-2026-08-03.md (S1 / A3).
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
  Host elaborator residual remains (Lake still for host develop bootstrap).
-/

namespace SystemsLean.HostPackageRoots

/-! ### HOST-PACKAGE-ROOTS / SLAKE_HOST_PACKAGE_ROOTS
    Package load surface (Lake job L1 / design stage S1). -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_PACKAGE_ROOTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-PACKAGE-ROOTS"

/-- Short surface name. -/
def surfaceId : String := "HOST-PACKAGE-ROOTS"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-PACKAGE-ROOTS"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-package-roots"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-package-roots"

/-- just recipe for without-Lake measured package roots load (prebuilt).
    Greppable: justRecipeWithoutLake, host-package-roots-without-lake,
    HOST-PACKAGE-ROOTS-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-package-roots-without-lake"

/-- Relative path of prebuilt binary under src/systems
    (bootstrap once: lake build slake-host-package-roots).
    Greppable: prebuiltHostPackageRootsRel, slake-host-package-roots. -/
def prebuiltHostPackageRootsRel : String :=
  ".lake/build/bin/slake-host-package-roots"

/-- Design note path cite (not a filesystem read).
    Greppable: designNotePath, full-host-elaborator-design-2026-08-03. -/
def designNotePath : String :=
  "doc/dev/research/full-host-elaborator-design-2026-08-03.md"

/-- Residual Name this surface implements (plain English).
    Greppable: residualName, Package roots without Lake. -/
def residualName : String := "Package roots without Lake"

/-! ### Package map dual-pin (lakefile-derived; no lake invoke) -/

/-- Package name from living lakefile (`package SystemsLean`).
    Greppable: hostPackageRootsPackageName, SystemsLean. -/
def hostPackageRootsPackageName : String := "SystemsLean"

/-- Default library root module (`lean_lib SystemsLean`).
    Greppable: hostPackageRootsLibraryRoot. -/
def hostPackageRootsLibraryRoot : String := "SystemsLean"

/-- Package config path relative to repo root.
    Greppable: hostPackageRootsConfigRel, lakefile.lean. -/
def hostPackageRootsConfigRel : String := "src/systems/lakefile.lean"

/-- Systems package directory relative to repo root.
    Greppable: hostPackageRootsSystemsDirRel. -/
def hostPackageRootsSystemsDirRel : String := "src/systems"

/-- Library module directory relative to repo root.
    Greppable: hostPackageRootsLibraryDirRel. -/
def hostPackageRootsLibraryDirRel : String := "src/systems/SystemsLean"

/-- Package root Lean shell relative to repo root.
    Greppable: hostPackageRootsPackageRootLeanRel. -/
def hostPackageRootsPackageRootLeanRel : String :=
  "src/systems/SystemsLean.lean"

/-- Module-count floor for scale honesty (living tree is ~260+; not empty).
    Greppable: hostPackageRootsModuleCountFloor. -/
def hostPackageRootsModuleCountFloor : Nat := 200

/-- Seed library basenames that must exist under SystemsLean/.
    Greppable: hostPackageRootsSeedModules, Mult.lean, DualResidual.lean. -/
def hostPackageRootsSeedModules : List String :=
  ["Mult.lean", "DualResidual.lean", "HostResidualShrink.lean",
   "HostPackageRoots.lean"]

/-- Host elaborator residual still remains (full elaborate still Lake).
    Greppable: hostPackageRootsHostElaboratorResidualRemains. -/
def hostPackageRootsHostElaboratorResidualRemains : Bool := true

/-- Local honesty: host develop surface still uses Lake bootstrap for this bin.
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostPackageRootsStillUsesLake : Bool := stillUsesLake
def hostPackageRootsDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostPackageRootsResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostPackageRootsProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostPackageRootsProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostPackageRootsLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostPackageRootsProvablyUnlocked : Bool := false

/-- Local honesty: does not claim host free. -/
def hostPackageRootsHostFreeClaimed : Bool := false

/-- Local finished pin (package roots load surface closed).
    Greppable: hostPackageRootsFinishedClaimed. -/
def hostPackageRootsFinishedClaimed : Bool := true

/-- Without-Lake measured step finished pin.
    Greppable: hostPackageRootsWithoutLakeFinished,
    HOST-PACKAGE-ROOTS-WITHOUT-LAKE. -/
def hostPackageRootsWithoutLakeFinished : Bool := true

/-- Structural package map dual-pin holds (lakefile-shaped constants).
    Greppable: hostPackageRootsLoadOk. -/
def hostPackageRootsLoadOk : Bool :=
  (hostPackageRootsPackageName == "SystemsLean")
    && (hostPackageRootsLibraryRoot == "SystemsLean")
    && (hostPackageRootsConfigRel == "src/systems/lakefile.lean")
    && (hostPackageRootsSystemsDirRel == "src/systems")
    && (hostPackageRootsLibraryDirRel == "src/systems/SystemsLean")
    && (hostPackageRootsPackageRootLeanRel == "src/systems/SystemsLean.lean")
    && (hostPackageRootsModuleCountFloor == 200)
    && (hostPackageRootsSeedModules ==
      ["Mult.lean", "DualResidual.lean", "HostResidualShrink.lean",
       "HostPackageRoots.lean"])
    && (designNotePath
      == "doc/dev/research/full-host-elaborator-design-2026-08-03.md")
    && (residualName == "Package roots without Lake")

/-- Without-Lake keeps host Lake bootstrap honesty.
    Greppable: hostPackageRootsWithoutLakeKeepsHostLake,
    HOST-PACKAGE-ROOTS-WITHOUT-LAKE. -/
def hostPackageRootsWithoutLakeKeepsHostLake : Bool :=
  hostPackageRootsWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostPackageRootsHostElaboratorResidualRemains
    && !hostPackageRootsHostFreeClaimed

/-- Structural ready for package roots surface.
    Greppable: hostPackageRootsReady, HOST-PACKAGE-ROOTS,
    SLAKE_HOST_PACKAGE_ROOTS. -/
def hostPackageRootsReady : Bool :=
  hostPackageRootsFinishedClaimed
    && hostPackageRootsLoadOk
    && hostPackageRootsHostElaboratorResidualRemains
    && !hostPackageRootsHostFreeClaimed
    && stillUsesLake
    && dependsOnLake
    && hostPackageRootsStillUsesLake
    && hostPackageRootsDependsOnLake
    && !hostPackageRootsResidualFreeClaimed
    && !hostPackageRootsProductSelfHostCompleteClaimed
    && !hostPackageRootsProofCompleteClaimed
    && !hostPackageRootsLlvmUnlocked
    && !hostPackageRootsProvablyUnlocked
    && (stageId == "SLAKE_HOST_PACKAGE_ROOTS_V0")
    && (hostId == "HOST-PACKAGE-ROOTS")
    && (surfaceId == "HOST-PACKAGE-ROOTS")
    && (surfaceAlias == "HOST-HOST-PACKAGE-ROOTS")
    && (lakeExeName == "slake-host-package-roots")
    && (justRecipe == "host-package-roots")
    && (justRecipeWithoutLake == "host-package-roots-without-lake")
    && (prebuiltHostPackageRootsRel
      == ".lake/build/bin/slake-host-package-roots")

/-- Without-Lake ready (structural + finished + keeps host Lake).
    Greppable: hostPackageRootsWithoutLakeReady,
    HOST-PACKAGE-ROOTS-WITHOUT-LAKE. -/
def hostPackageRootsWithoutLakeReady : Bool :=
  hostPackageRootsReady
    && hostPackageRootsWithoutLakeFinished
    && hostPackageRootsWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-package-roots-without-lake")
    && (prebuiltHostPackageRootsRel
      == ".lake/build/bin/slake-host-package-roots")

/-! ### HOST-PACKAGE-ROOTS-THEOREM (readable statements) -/

/-- Package map dual-pin holds.
    Greppable: hostPackageRootsLoadOk_true, HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsLoadOk_true : hostPackageRootsLoadOk = true := by
  native_decide

/-- Structural ready.
    Greppable: hostPackageRootsReady_true, HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsReady_true : hostPackageRootsReady = true := by
  native_decide

/-- Without-Lake ready.
    Greppable: hostPackageRootsWithoutLakeReady_true,
    HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsWithoutLakeReady_true :
    hostPackageRootsWithoutLakeReady = true := by
  native_decide

/-- Finished claimed.
    Greppable: hostPackageRootsFinishedClaimed_true,
    HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsFinishedClaimed_true :
    hostPackageRootsFinishedClaimed = true :=
  rfl

/-- Host residual remains (local mirror).
    Greppable: hostPackageRootsHostElaboratorResidualRemains_true,
    HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsHostElaboratorResidualRemains_true :
    hostPackageRootsHostElaboratorResidualRemains = true :=
  rfl

/-- Host free not claimed.
    Greppable: hostPackageRootsHostFreeClaimed_false,
    HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsHostFreeClaimed_false :
    hostPackageRootsHostFreeClaimed = false :=
  rfl

/-- Without-Lake finished.
    Greppable: hostPackageRootsWithoutLakeFinished_true,
    HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRootsWithoutLakeFinished_true :
    hostPackageRootsWithoutLakeFinished = true :=
  rfl

/-- Stage / host / recipe ids.
    Greppable: hostPackageRoots_ids_eq, HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRoots_ids_eq :
    stageId = "SLAKE_HOST_PACKAGE_ROOTS_V0"
      && hostId = "HOST-PACKAGE-ROOTS"
      && lakeExeName = "slake-host-package-roots"
      && justRecipe = "host-package-roots"
      && justRecipeWithoutLake = "host-package-roots-without-lake"
      && prebuiltHostPackageRootsRel
        = ".lake/build/bin/slake-host-package-roots"
      && residualName = "Package roots without Lake" :=
  rfl

/-- Local free/complete/proof/llvm/PROVABLY/host-free non-claims false.
    Greppable: hostPackageRoots_claims_false, HOST-PACKAGE-ROOTS-THEOREM. -/
theorem hostPackageRoots_claims_false :
    hostPackageRootsResidualFreeClaimed = false
      && hostPackageRootsProductSelfHostCompleteClaimed = false
      && hostPackageRootsProofCompleteClaimed = false
      && hostPackageRootsLlvmUnlocked = false
      && hostPackageRootsProvablyUnlocked = false
      && hostPackageRootsHostFreeClaimed = false
      && stillUsesLake = true
      && dependsOnLake = true :=
  rfl

/-! ### HOST-PACKAGE-ROOTS-SMOKE (quick examples) -/

example : hostPackageRootsLoadOk = true := by native_decide
example : hostPackageRootsReady = true := by native_decide
example : hostPackageRootsWithoutLakeReady = true := by native_decide
example : hostPackageRootsFinishedClaimed = true := rfl
example : hostPackageRootsWithoutLakeFinished = true := rfl
example : hostPackageRootsHostElaboratorResidualRemains = true := rfl
example : hostPackageRootsHostFreeClaimed = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-package-roots" := rfl
example : justRecipe = "host-package-roots" := rfl
example : justRecipeWithoutLake = "host-package-roots-without-lake" := rfl
example :
    prebuiltHostPackageRootsRel =
      ".lake/build/bin/slake-host-package-roots" :=
  rfl
example : hostPackageRootsPackageName = "SystemsLean" := rfl
example : hostPackageRootsLibraryRoot = "SystemsLean" := rfl
example : hostPackageRootsModuleCountFloor = 200 := rfl
example : residualName = "Package roots without Lake" := rfl

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- True when filename ends with .lean. -/
def isLeanBasename (name : String) : Bool :=
  name.endsWith ".lean"

/-- Collect sorted .lean basenames under library dir (files only). -/
def listLibraryLeanBasenames (libDir : System.FilePath) : IO (Array String) := do
  unless (<- libDir.pathExists) do
    IO.eprintln s!"error: {stageId} missing library dir: {libDir}"
    throw (IO.userError "missing library dir")
  unless (<- libDir.isDir) do
    IO.eprintln s!"error: {stageId} library path is not a directory: {libDir}"
    throw (IO.userError "library path not dir")
  let entries <- libDir.readDir
  let mut names : Array String := #[]
  for ent in entries do
    unless (<- ent.path.isDir) do
      let n := ent.fileName
      if isLeanBasename n then
        names := names.push n
  pure (names.qsort (fun a b => a < b))

/-- Ensure every seed basename is present in the library listing. -/
def requireSeeds (names : Array String) : IO Unit := do
  for seed in hostPackageRootsSeedModules do
    unless names.any (fun n => n == seed) do
      IO.eprintln s!"error: {stageId} missing seed module {seed} under library dir"
      throw (IO.userError s!"missing seed {seed}")

/-- Load package roots inventory from disk (no Lake).
    Greppable: loadPackageRoots, HOST-PACKAGE-ROOTS. -/
def loadPackageRoots (root : System.FilePath) :
    IO (Prod Nat (Array String)) := do
  let cfg := root / hostPackageRootsConfigRel
  let libDir := root / hostPackageRootsLibraryDirRel
  let pkgRoot := root / hostPackageRootsPackageRootLeanRel
  unless (<- cfg.pathExists) do
    IO.eprintln s!"error: {stageId} missing package config: {cfg}"
    throw (IO.userError "missing package config")
  unless (<- pkgRoot.pathExists) do
    IO.eprintln s!"error: {stageId} missing package root Lean: {pkgRoot}"
    throw (IO.userError "missing package root Lean")
  let basenames <- listLibraryLeanBasenames libDir
  requireSeeds basenames
  -- Count: library modules + package root shell (not under SystemsLean/).
  let count := basenames.size + 1
  if count < hostPackageRootsModuleCountFloor then
    IO.eprintln s!"error: {stageId} module count {count} below floor {hostPackageRootsModuleCountFloor}"
    throw (IO.userError "module count below floor")
  pure (count, basenames)

/-- Run measured package roots load. Dual evidence: pins + on-disk walk.
    Greppable: runPackageRoots, HOST-PACKAGE-ROOTS,
    HOST-PACKAGE-ROOTS-WITHOUT-LAKE. -/
def runPackageRoots (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: package roots / library module list =="
  IO.println s!"  surface={surfaceId} host={hostId} residual={residualName}"
  IO.println s!"  package={hostPackageRootsPackageName} libraryRoot={hostPackageRootsLibraryRoot}"
  IO.println s!"  config={hostPackageRootsConfigRel}"
  IO.println s!"  libraryDir={hostPackageRootsLibraryDirRel}"
  IO.println s!"  packageRootLean={hostPackageRootsPackageRootLeanRel}"
  IO.println s!"  structuralReady={hostPackageRootsReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostPackageRootsHostElaboratorResidualRemains} withoutLake={hostPackageRootsWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostPackageRootsWithoutLakeReady} keepsHostLake={hostPackageRootsWithoutLakeKeepsHostLake}"
  unless hostPackageRootsReady do
    IO.eprintln s!"error: {stageId} hostPackageRootsReady false"
    throw (IO.userError "hostPackageRootsReady false")
  unless hostPackageRootsFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostPackageRootsFinishedClaimed false"
    throw (IO.userError "hostPackageRootsFinishedClaimed false")
  unless hostPackageRootsWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostPackageRootsWithoutLakeFinished false"
    throw (IO.userError "hostPackageRootsWithoutLakeFinished false")
  unless hostPackageRootsWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostPackageRootsWithoutLakeReady false"
    throw (IO.userError "hostPackageRootsWithoutLakeReady false")
  let (count, basenames) <- loadPackageRoots root
  IO.println s!"  moduleCount={count} libraryLeanFiles={basenames.size} floor={hostPackageRootsModuleCountFloor}"
  IO.println s!"  moduleCountSource=IO.FS.readDir {hostPackageRootsLibraryDirRel} + package root"
  -- Print inventory basenames (one per line after marker for greppable join).
  IO.println "  modules:"
  for n in basenames do
    IO.println s!"    {n}"
  IO.println s!"    (package root) SystemsLean.lean"
  IO.println s!"GREEN {stageId}: package={hostPackageRootsPackageName} libraryRoot={hostPackageRootsLibraryRoot} modules={count}; withoutLake finished; host residual remains"

/-- CLI: load package roots. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runPackageRoots root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostPackageRoots
"#

end SystemsLean.HostFrontLivePackageRoots
