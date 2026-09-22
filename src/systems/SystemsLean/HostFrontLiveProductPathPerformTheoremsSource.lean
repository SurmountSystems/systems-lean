/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProductPathPerformTheorems.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathPerformTheoremsSource. Not occupancy name 50. Not mill 70.
  This wrap parses ProductPathPerformTheorems.lean only.
  Unique needles (THEOREMS suffix plus trailing newline so a grep of a
  shorter ProductPathPerform wrap is not a prefix hit):
  HostFrontLiveProductPathPerformTheoremsSource
  PARSE-LIVE-PRODUCT-PATH-PERFORM-THEOREMS
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-THEOREMS
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_THEOREMS_V0
  Greppable: SYSTEMS_LEAN_HOST, liveProductPathPerformTheoremsSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathPerformTheoremsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProductPathPerformTheorems

/-- Dual-pinned live ProductPathPerformTheorems.lean bytes (must match on-disk file).
    Greppable: liveProductPathPerformTheoremsSource, PARSE-LIVE-PRODUCT-PATH-PERFORM-THEOREMS. -/
def liveProductPathPerformTheoremsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ProductPathPerform PERFORM-THEOREM + SMOKE.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file split from SystemsLean.ProductPathPerform: theorems and behavioral
  smoke live here; stage ids, Lake/install honesty pins, Ok / PartialReady folds
  stay in ProductPathPerform. Same namespace SystemsLean.ProductPathPerform so
  theorem names stay unqualified under that namespace.

  Spec (readable):
  - PERFORM-THEOREM / HOST-PERFORM-THEOREM:
    productPathPerformPartialReady_true.
  - PERFORM-SMOKE / HOST-PERFORM-SMOKE: PartialReady / DependsOnLake /
    InstallStepLakeFreeCapable / Lake writer cite behavioral examples
    (lake build fails if example fails).

  These PERFORM theorems do NOT flip freestanding residual free, llvm,
  or PROVABLY. Land-time module does not define living-tip complete / perform /
  ownership claim bools true (emit-wire forbid). Complete true lives on tip /
  SelfHostComplete / StepContractFull dual-pin, not here.

  Intentional non-claims:
  - PERFORM gap surface honesty only -- NOT freestanding residual free.
  - NOT freestanding product path complete flip here.
  - NOT free / llvm / PROVABLY unlock.
  - Host Lake FreestandingEmit + just build remain the live full-path performers.
  - Lake example smokes are NOT full proofs.

  Greppable: SYSTEMS_LEAN_HOST, PERFORM-THEOREM,
  HOST-PERFORM-THEOREM, PERFORM-SMOKE,
  HOST-PERFORM-SMOKE, productPathPerformPartialReady_true,
  theorem productPathPerformPartialReady_true,
  productPathPerformDependsOnLake, productPathPerformInstallStepLakeFreeCapable,
  productPathPerformLakeWriterCite, ProductPathPerformTheorems,
  UNIT_SURFACE host surface, RUNTIME-FS, SELF-HOST-PRODUCT-PATH-PERFORM,
  product path perform, SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_V0,
  HOST-SELF-HOST-PRODUCT-PATH-PERFORM, FreestandingEmit, ProductPathPerform.
  Module: SystemsLean.ProductPathPerformTheorems
  Red/green: just systems-host; lake build SystemsLean.ProductPathPerformTheorems.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Not freestanding emit. Not proof complete.
-/

import SystemsLean.ProductPathPerform

namespace SystemsLean.ProductPathPerform

/-! ### PERFORM-THEOREM / HOST-PERFORM-THEOREM

  Real Lean theorems (not only `example` Bool canaries). Scope is B9
  perform gap substrate surface honesty only. Does not flip residual
  free / llvm / PROVABLY; does not claim freestanding product path complete.
-/

/-- PERFORM gap PartialReady holds. Greppable:
    productPathPerformPartialReady_true,
    theorem productPathPerformPartialReady_true,
    PERFORM-THEOREM, HOST-PERFORM-THEOREM. -/
theorem productPathPerformPartialReady_true :
    productPathPerformPartialReady = true := by
  decide

/-! ### PERFORM-SMOKE / HOST-PERFORM-SMOKE

  Behavioral `example` canaries. Lake build fails if any example fails.
-/

example : productPathPerformPartialReady = true := by
  decide

example : productPathPerformDependsOnLake = true := by
  decide

example : productPathPerformInstallStepLakeFreeCapable = true := by
  decide

example : productPathPerformLakeWriterCite = "FreestandingEmit" := by
  decide

end SystemsLean.ProductPathPerform
"#

end SystemsLean.HostFrontLiveProductPathPerformTheorems
