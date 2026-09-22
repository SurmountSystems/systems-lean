/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductPathPerformStep.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathPerformStepSource. Not occupancy name 50. Not mill 70.
  This wrap parses ProductPathPerformStep.lean only.
  Not ProductPathPerformStepTheorems.lean.
  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathPerformStepSource
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_V0
  Greppable: SYSTEMS_LEAN_HOST, liveProductPathPerformStepSource,
  liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathPerformStepSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathPerformStep

/-- Dual-pinned live ProductPathPerformStep.lean bytes (must match on-disk file).
    Greppable: liveProductPathPerformStepSource, PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP. -/
def liveProductPathPerformStepSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform STEP (B10).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0 -- Lake-free install-only
  perform step substrate.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Lake-free install-only entrypoint (`just install-freestanding-c-out`) copies
  emit wire slake_freestanding.{h,c} into out/freestanding-c/ without lake
  build/exe when emit present. Process-glue cp only -- not a Lean Lake exe.
  Read/compose/write still need classic Lean Lake FreestandingEmit
  (productPathPerformStepDependsOnLake true). Install entrypoint alone does NOT
  flip freestanding perform claimed. Not residual free. Not PROVABLY.
  Not freestanding emit residual free.
  Dual-pin thin batch 9: historical stage/Ok/moduleCite/recipe/gap dual-pins
  home-primary; tip keeps chain fold + InstallLakeFreeEntrypointClaimed only.
  Living tip owns claim-bool SSoT; land-time module does NOT define those
  claim bools true (emit-wire forbid).
  Theorems (PERFORM-STEP-THEOREM / HOST-PERFORM-STEP-THEOREM +
  PERFORM-STEP-SMOKE / HOST-PERFORM-STEP-SMOKE):
  SystemsLean.ProductPathPerformStepTheorems (same namespace; long-file split).
  theorem productPathPerformStepPartialReady_true /
  productPathPerformStepOk_true / stageId_eq + surface pins.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP, SELF-HOST-PRODUCT-PATH-PERFORM-STEP,
  product path perform step, install-freestanding-c-out,
  productPathPerformInstallLakeFreeEntrypointClaimed,
  productPathPerformInstallLakeFreeEntrypointRecipe,
  productPathPerformInstallStepLakeFreeCapable,
  productPathPerformStepDependsOnLake,
  productPathPerformStepOk, productPathPerformStepPartialReady,
  theorem productPathPerformStepPartialReady_true,
  PERFORM-STEP-THEOREM, HOST-PERFORM-STEP-THEOREM,
  PERFORM-STEP-SMOKE, HOST-PERFORM-STEP-SMOKE,
  ProductPathPerformStepTheorems,
  WRITER-PATH-STEP-INSTALL-OUT, FREESTANDING-PERFORM-GAP-READ-SSOT,
  FREESTANDING-PERFORM-GAP-COMPOSE, FREESTANDING-PERFORM-GAP-WRITE-HC,
  RUNTIME-FS, UNIT_SURFACE host surface, ProductPathPerformStep.
  Module: SystemsLean.ProductPathPerformStep
  Long-file split: PERFORM-STEP-THEOREM + SMOKE in ProductPathPerformStepTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathPerformStep

/-- Greppable primary stage id (partial B10 install STEP perform substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-PERFORM-STEP"

/-- Ordered B6 plan step id this substrate isolates (install Out). Greppable:
    WRITER-PATH-STEP-INSTALL-OUT. -/
def writerPathStepInstallOut : String := "WRITER-PATH-STEP-INSTALL-OUT"

/-- just recipe name for Lake-free install-only entrypoint. Greppable:
    install-freestanding-c-out. -/
def justRecipeName : String := "install-freestanding-c-out"

/-- Module cite. Greppable: ProductPathPerformStep. -/
def stepModuleCite : String := "ProductPathPerformStep"

/-- Named remaining perform gaps (read/compose/write still Lake). Greppable:
    FREESTANDING-PERFORM-GAP-*. -/
def gapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"
def gapCompose : String := "FREESTANDING-PERFORM-GAP-COMPOSE"
def gapWriteHc : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- productPathPerformInstallLakeFreeEntrypointClaimed -- true when a real
    Lake-free install-only product entrypoint exists (B10:
    `just install-freestanding-c-out` copies emit -> Out without lake build/exe
    when emit present). Full regenerate `just build` still runs Lake emit first.
    Install-only is NOT freestanding perform claimed. Land-time honesty pin
    (true). Greppable: productPathPerformInstallLakeFreeEntrypointClaimed,
    SELF-HOST-PRODUCT-PATH-PERFORM-STEP, install-freestanding-c-out. -/
def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true

/-- Lake-free install-only recipe name (B10 entrypoint). Greppable:
    productPathPerformInstallLakeFreeEntrypointRecipe, install-freestanding-c-out,
    SELF-HOST-PRODUCT-PATH-PERFORM-STEP. -/
def productPathPerformInstallLakeFreeEntrypointRecipe : String :=
  "install-freestanding-c-out"

/-- productPathPerformInstallStepLakeFreeCapable -- install Out step mechanism
    (WRITER-PATH-STEP-INSTALL-OUT): when emit slake_freestanding.{h,c} already
    exist, the copy half is process glue cp (not Lake elaborator). Land-time
    honesty pin (true). Greppable: productPathPerformInstallStepLakeFreeCapable,
    SELF-HOST-PRODUCT-PATH-PERFORM-STEP. -/
def productPathPerformInstallStepLakeFreeCapable : Bool := true

/-- productPathPerformStepDependsOnLake -- full regenerate perform still depends
    on Lake elaborating FreestandingEmit for read/compose/write. Install-only is
    Lake-free; STEP bar does not claim freestanding product path owns regenerate.
    Land-time honesty pin (true). Greppable:
    productPathPerformStepDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-STEP. -/
def productPathPerformStepDependsOnLake : Bool := true

/-- productPathPerformStepOk -- B10 stage ids + install Lake-free entrypoint
    claimed + recipe cite + install step-mechanism capable + DependsOnLake for
    read/compose/write + gap tokens + module cite. Land-time surface only (no
    living-tip perform/ownership/complete claim bools -- emit-wire forbid).
    Greppable: productPathPerformStepOk, SELF-HOST-PRODUCT-PATH-PERFORM-STEP,
    product path perform step. -/
def productPathPerformStepOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_STEP_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM-STEP")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM-STEP")
    && (productPathPerformInstallLakeFreeEntrypointClaimed == true)
    && (productPathPerformInstallLakeFreeEntrypointRecipe
        == "install-freestanding-c-out")
    && (justRecipeName == "install-freestanding-c-out")
    && (stepModuleCite == "ProductPathPerformStep")
    && (productPathPerformInstallStepLakeFreeCapable == true)
    && (productPathPerformStepDependsOnLake == true)
    && (writerPathStepInstallOut == "WRITER-PATH-STEP-INSTALL-OUT")
    && (gapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")
    && (gapCompose == "FREESTANDING-PERFORM-GAP-COMPOSE")
    && (gapWriteHc == "FREESTANDING-PERFORM-GAP-WRITE-HC")

/-- STEP PartialReady fold (closed B10 substrate: Ok + entrypoint claimed +
    install step Lake-free capable + DependsOnLake for read/compose/write).
    SelfApplyFs living tip re-exports a chain fold that includes this def.
    Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathPerformStepPartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM-STEP, product path perform step. -/
def productPathPerformStepPartialReady : Bool :=
  productPathPerformStepOk
    && productPathPerformInstallLakeFreeEntrypointClaimed
    && productPathPerformInstallStepLakeFreeCapable
    && productPathPerformStepDependsOnLake

/- Theorems + smoke live in SystemsLean.ProductPathPerformStepTheorems
   (same namespace SystemsLean.ProductPathPerformStep; long-file split).
   Parent keeps stage / cites / Ok / PartialReady only -- do not import
   ProductPathPerformStepTheorems here (import cycle).
   Greppable: theorem productPathPerformStepPartialReady_true,
   PERFORM-STEP-THEOREM, ProductPathPerformStepTheorems. -/

end SystemsLean.ProductPathPerformStep

-- Theorems + smoke: SystemsLean.ProductPathPerformStepTheorems (same namespace).
-- No Lake exe for B10 (process-glue just install-freestanding-c-out only).
-- No top-level main so SelfApplyFs may import Ok / PartialReady bulk without
-- main clash.
"#

/-- Live file basename. Bare basename only. Not a path. -/
def liveRel : String := "ProductPathPerformStep.lean"

end SystemsLean.HostFrontLiveProductPathPerformStep
