/-
  SYSTEMS_LEAN_HOST partial -- freestanding-capable Install Out (B20).
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0 -- first freestanding-
  capable product-path Install Out that copies emit slake_freestanding.{h,c} into
  out/freestanding-c/ without classic Lean FreestandingEmit as product authority.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Real IO: freestandingCapableInstallFreestandingOut reads emit
  slake_freestanding.{h,c} via IO.FS.readFile (fail-closed if missing), creates
  out/freestanding-c as needed (IO.FS.createDirAll), writes installed copies via
  IO.FS.writeFile, then post-install greppable token honesty (stage / HOST-EMIT /
  product-wire subset) without importing FreestandingEmit.
  Does not import FreestandingEmit. Does not call emitAtRoot / renderHeader /
  renderSource as product authority. Does not regenerate emit (WRITE-HC is B18).
  Distinct from B10 just install-freestanding-c-out (Lake-free shell cp process
  glue): this is a Lean IO freestanding-capable install path. Deeper than
  re-documenting the B10 recipe alone.
  Not Full step-contract (productPathFreestandingCapableStepContractFullSatisfied
  stays false -- ownership regenerate cliff BLOCKER-FREESTANDING-MUST-OWN-REGENERATE
  still open beyond install). Not freestanding perform claimed. Not residual free.
  Not freestanding emit residual free. Not PROVABLY. CapableRead/Compose/WriteHc true after B26..B28; Full/WithoutLake open
  (this step still Lake-hosted as exe host).
  Lake exe: slake-freestanding-capable-install-out
  (just freestanding-capable-install-out).
  Theorems (INSTALL-OUT-THEOREM / HOST-INSTALL-OUT-THEOREM +
  INSTALL-OUT-SMOKE / HOST-INSTALL-OUT-SMOKE):
  SystemsLean.InstallOutTheorems (same namespace; long-file split).
  theorem productPathFreestandingCapableInstallOutPartialReady_true /
  productPathFreestandingCapableInstallOutOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST,
  SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0,
  HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
  SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
  product path freestanding capable install out,
  productPathFreestandingCapableInstallOutPartialReady,
  productPathFreestandingCapableInstallOutOk,
  theorem productPathFreestandingCapableInstallOutPartialReady_true,
  INSTALL-OUT-THEOREM, HOST-INSTALL-OUT-THEOREM,
  INSTALL-OUT-SMOKE, HOST-INSTALL-OUT-SMOKE, InstallOutTheorems,
  freestandingCapableInstallFreestandingOut,
  FREESTANDING-CAPABLE-INSTALL-OUT,
  WRITER-PATH-STEP-INSTALL-OUT,
  productPathFreestandingCapableRegenerateInstallOutOpen,
  productPathFreestandingCapableStepContractFullSatisfied,
  BLOCKER-FREESTANDING-MUST-OWN-REGENERATE,
  slake_freestanding.h, slake_freestanding.c, out/freestanding-c/,
  freestanding-capable-install-out, slake-freestanding-capable-install-out,
  InstallOut, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.InstallOut
  Dual-pin batch 19: home Ok/stage/recipe/exe; tip keeps honesty + chain fold.
  Long-file split: INSTALL-OUT-THEOREM + SMOKE in InstallOutTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.InstallOut

/-- Greppable primary stage id (partial B20 freestanding-capable Install Out). -/
def stageId : String :=
  "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"

/-- Greppable short map id. -/
def selfHostId : String :=
  "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT"

/-- Named freestanding-capable install step token.
    Greppable: FREESTANDING-CAPABLE-INSTALL-OUT. -/
def installOutId : String := "FREESTANDING-CAPABLE-INSTALL-OUT"

/-- Ordered B6 plan step id this substrate advances. Greppable:
    WRITER-PATH-STEP-INSTALL-OUT. -/
def writerPathStepInstallOut : String := "WRITER-PATH-STEP-INSTALL-OUT"

/-- Ownership regenerate cliff still open after this partial (install alone is
    not Full close). Greppable: BLOCKER-FREESTANDING-MUST-OWN-REGENERATE. -/
def blockerMustOwnRegenerate : String :=
  "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE"

/-- Lake exe name for this freestanding-capable Install Out entrypoint. -/
def lakeExeName : String := "slake-freestanding-capable-install-out"

/-- just recipe name. -/
def justRecipeName : String := "freestanding-capable-install-out"

/-- Real freestanding-capable Install Out API name (implemented in this module).
    Greppable: freestandingCapableInstallFreestandingOut. -/
def freestandingCapableInstallOutApi : String :=
  "freestandingCapableInstallFreestandingOut"

/-- Product authority is not FreestandingEmit (this module never imports it).
    Greppable: productPathFreestandingCapableInstallOutAuthorityNotEmit. -/
def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true

/-- This Install still runs as a classic Lean Lake exe host (honest).
    Greppable: productPathFreestandingCapableInstallOutDependsOnLake. -/
def productPathFreestandingCapableInstallOutDependsOnLake : Bool := true

/-- Install Out gap closed for freestanding-capable path (this module owns it).
    B19 regenerate InstallOutOpen flips false when ordered pipeline calls this.
    Greppable: productPathFreestandingCapableRegenerateInstallOutOpen. -/
def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false

/-- Full freestanding-capable step-contract stays unsatisfied (ownership
    regenerate WithoutLake cliff; Capable* true after B26..B28). Greppable honesty pin only. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- Emit workspace freestanding header basename. Greppable: slake_freestanding.h. -/
def emitHeaderBase : String := "slake_freestanding.h"

/-- Emit workspace freestanding source basename. Greppable: slake_freestanding.c. -/
def emitSourceBase : String := "slake_freestanding.c"

/-- Product Out relative path. Greppable: out/freestanding-c/. -/
def productOutRel : String := "out/freestanding-c/"

/-- True when s contains needle as a contiguous substring (empty needle => false). -/
def containsStr (s needle : String) : Bool :=
  if needle.isEmpty then false
  else (s.splitOn needle).length > 1

/-- Fail closed when path missing. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Greppable honesty after install: stable product-wire subset without importing
    FreestandingEmit. Host-EMIT markers plus stage / residual-free honesty. -/
def requireInstalledTokens (path : System.FilePath) (content : String)
    (tokens : List String) : IO Unit := do
  for tok in tokens do
    unless containsStr content tok do
      IO.eprintln s!"error: {path} missing greppable token {tok}"
      throw (IO.userError s!"missing token {tok} in {path}")

/-- Stable product-wire honesty tokens checked on installed .h and .c.
    Subset of freestanding product-wire contract; local list only (no import).
    Greppable: UNIT_TRANSLATION_V0, MULT-0, RUNTIME-FS, product residual free. -/
def productWireHonestyTokens : List String := [
  "UNIT_TRANSLATION_V0",
  "MULT-0", "MULT-1", "MULT-OMEGA",
  "RUNTIME-FS",
  "product residual free"
]

/-- freestandingCapableInstallFreestandingOut -- freestanding-capable product-path
    Install Out: copy emit slake_freestanding.{h,c} to out/freestanding-c/ without
    FreestandingEmit as product authority. Fail-closed if emit wire missing.
    Does not WRITE emit (B18); does not flip Full / perform / ownership / complete.
    Greppable: freestandingCapableInstallFreestandingOut,
    FREESTANDING-CAPABLE-INSTALL-OUT, WRITER-PATH-STEP-INSTALL-OUT,
    slake_freestanding.h, slake_freestanding.c, out/freestanding-c/,
    IO.FS.writeFile, IO.FS.createDirAll. -/
def freestandingCapableInstallFreestandingOut (root : System.FilePath) : IO Unit := do
  let emitDir := root / "src" / "systems" / "emit"
  let outDir := root / "out" / "freestanding-c"
  let srcH := emitDir / emitHeaderBase
  let srcC := emitDir / emitSourceBase
  let dstH := outDir / emitHeaderBase
  let dstC := outDir / emitSourceBase
  let readme := outDir / "README.md"
  IO.println s!"== {stageId}: freestanding-capable Install Out =="
  IO.println s!"  host: {hostId} / {selfHostId}"
  IO.println s!"  step: {installOutId} / {writerPathStepInstallOut}"
  IO.println s!"  API: {freestandingCapableInstallOutApi}"
  IO.println "  authority: not FreestandingEmit (no import; no emit-at-root as product path)"
  IO.println s!"    productPathFreestandingCapableInstallOutAuthorityNotEmit: {productPathFreestandingCapableInstallOutAuthorityNotEmit}"
  IO.println s!"    productPathFreestandingCapableInstallOutDependsOnLake: {productPathFreestandingCapableInstallOutDependsOnLake} (Lake exe host only)"
  IO.println s!"    productPathFreestandingCapableRegenerateInstallOutOpen: {productPathFreestandingCapableRegenerateInstallOutOpen} (install owned by freestanding-capable path)"
  IO.println s!"    productPathFreestandingCapableStepContractFullSatisfied: {productPathFreestandingCapableStepContractFullSatisfied} (cliff open)"
  IO.println s!"  cliff: {blockerMustOwnRegenerate}"
  IO.println s!"  depth: IO.FS.readFile emit -> createDirAll Out -> IO.FS.writeFile {productOutRel}"
  IO.println "  not: emit WRITE (B18); not Full; not perform claimed; not complete"
  requireFile srcH s!"emit header ({emitHeaderBase})"
  requireFile srcC s!"emit source ({emitSourceBase})"
  requireFile readme "product Out README (release surface marker)"
  let header <- IO.FS.readFile srcH
  let source <- IO.FS.readFile srcC
  if header.isEmpty || source.isEmpty then
    IO.eprintln "error: empty emit freestanding wire"
    throw (IO.userError "empty emit wire")
  IO.FS.createDirAll outDir
  IO.FS.writeFile dstH header
  IO.FS.writeFile dstC source
  let headerInstalled <- IO.FS.readFile dstH
  let sourceInstalled <- IO.FS.readFile dstC
  requireFile dstH s!"installed header ({emitHeaderBase})"
  requireFile dstC s!"installed source ({emitSourceBase})"
  requireInstalledTokens dstH headerInstalled ([
    "SLAKE_EMIT_FREESTANDING_C_V0",
    "HOST-EMIT-BANNER", "HOST-EMIT-MULT", "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE",
    "HOST-EMIT-EXTRACT", "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH",
    "HOST-EMIT-COMPOSE", "HOST-EMIT-PLAN", "HOST-EMIT-APPLY", "HOST-EMIT-BODY"
  ] ++ productWireHonestyTokens)
  requireInstalledTokens dstC sourceInstalled ([
    "HOST-EMIT-BANNER", "HOST-EMIT-MULT", "HOST-EMIT-LINEAR", "HOST-EMIT-ERASURE",
    "HOST-EMIT-EXTRACT", "HOST-EMIT-TYPES", "HOST-EMIT-PROGRAM", "HOST-EMIT-GRAPH",
    "HOST-EMIT-COMPOSE", "HOST-EMIT-PLAN", "HOST-EMIT-APPLY", "HOST-EMIT-BODY"
  ] ++ productWireHonestyTokens)
  IO.println s!"GREEN {stageId}: freestanding-capable installed Out under {outDir}/"
  IO.println s!"  installed: {dstH} ({headerInstalled.length} chars)"
  IO.println s!"  installed: {dstC} ({sourceInstalled.length} chars)"
  IO.println "  FREESTANDING-CAPABLE-INSTALL-OUT advanced (no-emit authority install)"
  IO.println "  honest: Full step-contract unsatisfied; perform claimed false; complete false"
  IO.println "  InstallOutOpen false (freestanding-capable path owns install)"
  IO.println "  not B10 shell cp alone; not FreestandingEmit product authority"
  IO.println "  operational: emit must exist (run freestanding-capable-write-hc or emit first)"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Surface ok: stage ids + authority-not-emit + named API + InstallOut closed +
    Full false + Lake dependency honest.
    Greppable: productPathFreestandingCapableInstallOutOk. -/
def productPathFreestandingCapableInstallOutOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT")
    && (installOutId == "FREESTANDING-CAPABLE-INSTALL-OUT")
    && (writerPathStepInstallOut == "WRITER-PATH-STEP-INSTALL-OUT")
    && (blockerMustOwnRegenerate == "BLOCKER-FREESTANDING-MUST-OWN-REGENERATE")
    && (freestandingCapableInstallOutApi == "freestandingCapableInstallFreestandingOut")
    && (productPathFreestandingCapableInstallOutAuthorityNotEmit == true)
    && (productPathFreestandingCapableInstallOutDependsOnLake == true)
    && (productPathFreestandingCapableRegenerateInstallOutOpen == false)
    && (productPathFreestandingCapableStepContractFullSatisfied == false)
    && (lakeExeName == "slake-freestanding-capable-install-out")
    && (justRecipeName == "freestanding-capable-install-out")
    && (emitHeaderBase == "slake_freestanding.h")
    && (emitSourceBase == "slake_freestanding.c")
    && (productOutRel == "out/freestanding-c/")

/-- Install Out PartialReady fold (closed B20: Ok + authority-not-emit +
    DependsOnLake + InstallOut closed + Full long-name false). Tip re-exports
    chain fold. Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathFreestandingCapableInstallOutPartialReady,
    SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT,
    freestandingCapableInstallFreestandingOut. -/
def productPathFreestandingCapableInstallOutPartialReady : Bool :=
  productPathFreestandingCapableInstallOutOk
    && productPathFreestandingCapableInstallOutAuthorityNotEmit
    && productPathFreestandingCapableInstallOutDependsOnLake
    && !productPathFreestandingCapableRegenerateInstallOutOpen
    && !productPathFreestandingCapableStepContractFullSatisfied

/-- CLI: optional repo root argument (default cwd). -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    unless productPathFreestandingCapableInstallOutOk do
      IO.eprintln s!"error: {stageId} surface not ok"
      throw (IO.userError "productPathFreestandingCapableInstallOutOk false")
    freestandingCapableInstallFreestandingOut root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.InstallOut

-- Lake entry is SystemsLean.InstallOutMain (no top-level main here so
-- regenerate and SelfApplyFs may import API / Ok / PartialReady without clash).
