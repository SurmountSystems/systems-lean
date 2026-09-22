/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductPathPerform.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathPerformSource. Not occupancy name 50. Not mill 70.
  This wrap parses ProductPathPerform.lean only.
  Not ProductPathPerformTheorems.lean.
  Unique needles (own line, no THEOREMS suffix):
  HostFrontLiveProductPathPerformSource
  PARSE-LIVE-PRODUCT-PATH-PERFORM
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_V0
  Greppable: SYSTEMS_LEAN_HOST, liveProductPathPerformSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathPerformSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathPerform

/-- Dual-pinned live ProductPathPerform.lean bytes (must match on-disk file).
    Greppable: liveProductPathPerformSource, PARSE-LIVE-PRODUCT-PATH-PERFORM. -/
def liveProductPathPerformSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path perform gap (B9).
  SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0 -- perform gap + install step-mechanism
  substrate.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Freestanding-capable **perform gap** naming: product path regenerate perform
  still depends on Lake elaborating FreestandingEmit for read/compose/write
  (productPathPerformDependsOnLake true). Install Out **cp half** is Lake-free
  step mechanism when emit .h/.c already exist
  (productPathPerformInstallStepLakeFreeCapable true). Lake-free install-only
  entrypoint isolation is B10 (ProductPathPerformStep /
  just install-freestanding-c-out). Named remaining gaps FREESTANDING-PERFORM-GAP-*.
  Living tip SelfApplyFs owns claim-bool SSoT (perform/ownership/complete).
  This land-time module does NOT define those claim bools true (emit-wire forbid).
  Dual-pin thin batch 8: historical stage/gap/Lake-writer/moduleCite dual-pins
  home-primary; tip keeps chain fold + perform claimed + DependsOnLake only.
  Not residual free. Not PROVABLY. Not freestanding emit residual free.
  Theorems (PERFORM-THEOREM / HOST-PERFORM-THEOREM +
  PERFORM-SMOKE / HOST-PERFORM-SMOKE):
  SystemsLean.ProductPathPerformTheorems (same namespace; long-file split).
  theorem productPathPerformPartialReady_true.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM, SELF-HOST-PRODUCT-PATH-PERFORM,
  product path perform, productPathPerformOk, productPathPerformPartialReady,
  productPathPerformDependsOnLake, productPathPerformInstallStepLakeFreeCapable,
  productPathPerformLakeWriterCite, productPathPerformLakeExeCite,
  productPathPerformInstallRecipeCite, productPathPerformGapReadSsot,
  productPathPerformGapCompose, productPathPerformGapWriteWire,
  FREESTANDING-PERFORM-GAP-READ-SSOT, FREESTANDING-PERFORM-GAP-COMPOSE,
  FREESTANDING-PERFORM-GAP-WRITE-HC, FreestandingEmit, slake-emit-freestanding-c,
  just build, theorem productPathPerformPartialReady_true,
  PERFORM-THEOREM, HOST-PERFORM-THEOREM, PERFORM-SMOKE, HOST-PERFORM-SMOKE,
  ProductPathPerformTheorems,
  RUNTIME-FS, UNIT_SURFACE host surface, ProductPathPerform.
  Module: SystemsLean.ProductPathPerform
  Long-file split: PERFORM-THEOREM + SMOKE in ProductPathPerformTheorems.
  Not freestanding emit residual free. Not residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.ProductPathPerform

/-- Greppable primary stage id (partial B9 perform gap substrate). -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-SELF-HOST-PRODUCT-PATH-PERFORM"

/-- Greppable short map id. -/
def selfHostId : String := "SELF-HOST-PRODUCT-PATH-PERFORM"

/-- Module cite. Greppable: ProductPathPerform. -/
def performModuleCite : String := "ProductPathPerform"

/-- productPathPerformDependsOnLake -- product path regenerate perform still
    depends on Lake elaborating FreestandingEmit for read/compose/write.
    Land-time honesty pin (true). Greppable: productPathPerformDependsOnLake,
    SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformDependsOnLake : Bool := true

/-- productPathPerformInstallStepLakeFreeCapable -- install Out **step mechanism**
    (WRITER-PATH-STEP-INSTALL-OUT): when emit slake_freestanding.{h,c} already
    exist, the copy half is process glue cp (not Lake elaborator). Land-time
    honesty pin (true). Greppable: productPathPerformInstallStepLakeFreeCapable,
    SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformInstallStepLakeFreeCapable : Bool := true

/-- Lake writer still performs read/compose/write today. Greppable:
    productPathPerformLakeWriterCite, FreestandingEmit. -/
def productPathPerformLakeWriterCite : String := "FreestandingEmit"

/-- Lake emit exe still product writer entry. Greppable:
    productPathPerformLakeExeCite, slake-emit-freestanding-c. -/
def productPathPerformLakeExeCite : String := "slake-emit-freestanding-c"

/-- Full-path install recipe cite (cp half of just build; full
    recipe still chains Lake). Greppable: productPathPerformInstallRecipeCite,
    just build. -/
def productPathPerformInstallRecipeCite : String := "build"

/-- Named remaining perform gaps (read/compose/write still need freestanding-
    capable performer; not claimed closed). Greppable: productPathPerformGap*,
    FREESTANDING-PERFORM-GAP-*. -/
def productPathPerformGapReadSsot : String := "FREESTANDING-PERFORM-GAP-READ-SSOT"
def productPathPerformGapCompose : String := "FREESTANDING-PERFORM-GAP-COMPOSE"
def productPathPerformGapWriteWire : String := "FREESTANDING-PERFORM-GAP-WRITE-HC"

/-- productPathPerformOk -- B9 stage ids + Lake dependency + install
    step-mechanism capable + Lake writer cites + remaining gap tokens + module
    cite. Land-time surface only (no living-tip perform/ownership/complete claim
    bools on this module -- emit-wire forbids those true defs here). Greppable:
    productPathPerformOk, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0")
    && (hostId == "HOST-SELF-HOST-PRODUCT-PATH-PERFORM")
    && (selfHostId == "SELF-HOST-PRODUCT-PATH-PERFORM")
    && (performModuleCite == "ProductPathPerform")
    && (productPathPerformDependsOnLake == true)
    && (productPathPerformInstallStepLakeFreeCapable == true)
    && (productPathPerformLakeWriterCite == "FreestandingEmit")
    && (productPathPerformLakeExeCite == "slake-emit-freestanding-c")
    && (productPathPerformInstallRecipeCite == "build")
    && (productPathPerformGapReadSsot == "FREESTANDING-PERFORM-GAP-READ-SSOT")
    && (productPathPerformGapCompose == "FREESTANDING-PERFORM-GAP-COMPOSE")
    && (productPathPerformGapWriteWire == "FREESTANDING-PERFORM-GAP-WRITE-HC")

/-- PERFORM gap PartialReady fold (closed B9 substrate: Ok + DependsOnLake +
    install step Lake-free capable). Historical readiness bulk for perform gap.
    SelfApplyFs living tip re-exports a chain fold that includes this def for
    greppable dual-pin + B8 ownership PartialReady chain. Land-time module pins:
    DependsOnLake true; InstallStepLakeFreeCapable true (living tip allows
    perform / ownership / stepContractFull / complete true after later cliffs).
    Does not flip residual free / llvm / PROVABLY.
    Greppable: productPathPerformPartialReady,
    SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformPartialReady : Bool :=
  productPathPerformOk
    && productPathPerformDependsOnLake
    && productPathPerformInstallStepLakeFreeCapable

/- Theorems + smoke live in SystemsLean.ProductPathPerformTheorems
   (same namespace SystemsLean.ProductPathPerform; long-file split).
   Parent keeps stage / Lake pins / Ok / PartialReady only -- do not import
   ProductPathPerformTheorems here (import cycle).
   Greppable: theorem productPathPerformPartialReady_true,
   PERFORM-THEOREM, ProductPathPerformTheorems. -/

end SystemsLean.ProductPathPerform

-- Theorems + smoke: SystemsLean.ProductPathPerformTheorems (same namespace).
-- No Lake exe for B9 (gap naming + honesty pins only).
-- No top-level main so SelfApplyFs may import Ok / PartialReady bulk without
-- main clash.
"#

end SystemsLean.HostFrontLiveProductPathPerform
