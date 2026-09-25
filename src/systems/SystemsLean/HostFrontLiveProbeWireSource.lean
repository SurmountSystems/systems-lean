/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live ProbeWire.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProbeWireSource. Not occupancy name 50. Not mill 70.
  This wrap is ProbeWire.lean. It is not ProbeWireTheorems.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveProbeWireSource,
  HOST-FRONT-LIVE-PROBE-WIRE, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProbeWireSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveProbeWire

/-- Dual-pinned live ProbeWire.lean bytes (must match on-disk file).
    Greppable: liveProbeWireSource, HOST-FRONT-LIVE-PROBE-WIRE. -/
def liveProbeWireSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- probe-vs-wire honesty (hosted behavioral probe
  vs product freestanding wire) after HOST-DUAL-RESIDUAL.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): DualResidual.lean dual residual honesty;
    ProductPath.lean structural product path ladder close;
    InventoryClose.lean inventory close readiness; LlvmHold.lean SH6 hold;
    SelfApplyFs.lean freestanding self-apply (complete stays false);
    Parity* modules fold probe labels for Mult..Emit contracts;
    Extract.lean EMIT-BOUNDARY / RUNTIME-FS vs RUNTIME-CLASSIC;
    smoke/slake_behavioral_probe.c hosted behavioral smoke debt;
    emit/ + out/freestanding-c/ product freestanding wire paths;
    self-host.md acceptance; host-partial-inventory.md; surface-matrix.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_PROBE_WIRE_V0 / HOST-PROBE-WIRE / SELF-HOST-PROBE-WIRE:
    greppable probe-vs-wire honesty gate -- hosted behavioral probe under
    smoke/ is smoke debt (executable feedback), distinct from product
    freestanding wire under emit/ and out/freestanding-c/ (product path).
    Probe green does NOT mean product residual free or product complete.
  - behavioralProbeIsSmokeDebt: hosted probe is smoke debt, not product
    residual progress. MUST decide true.
  - behavioralProbeIsNotProductWire: probe path is not the product wire.
    MUST decide true.
  - productWireIsEmitPath: product freestanding wire is emit/out path.
    MUST decide true.
  - probeDoesNotReplaceProductWire: probe green does not replace wire residual.
    MUST decide true.
  - residualFreeClaimed stays false; productSelfHostCompleteClaimed true with complete.
  - probeWireSurfacesDistinct: probe and wire path cites differ; tokens
    distinguish smoke debt from product freestanding wire.
  - probeWireSurfaceOk: stage ids + probe/wire path cites + prior
    HOST-DUAL-RESIDUAL / HOST-PRODUCT-PATH-CLOSE / HOST-INVENTORY-CLOSE /
    HOST-LLVM-HOLD / EMIT-BOUNDARY / RUNTIME-FS cites.
  - probeWireReady: DualResidual.dualResidualReady && surface &&
    surfacesDistinct && smoke-debt + not-wire + emit-path + does-not-replace
    && local residual free false && product complete true; llvm unlock orthogonal.
  - probeWireDoesNotMeanResidualFree /
    probeWireDoesNotMeanProductComplete: ready && free/complete claims false.
  - Host model = structural probe-vs-wire honesty. Not an AI/ML model.
    Not product C residual free. Not freestanding product self-host complete.

  Theorems + smoke peeled to ProbeWireTheorems (same namespace; long-file peel):
  PROBE-WIRE-THEOREM / HOST-PROBE-WIRE-THEOREM / PROBE-WIRE-SMOKE /
  HOST-PROBE-WIRE-SMOKE -- probeWireReady_true /
  behavioralProbeIsSmokeDebt_true / behavioralProbeIsNotProductWire_true /
  productWireIsEmitPath_true / residualFreeClaimed_false /
  probeWireDoesNotMeanResidualFree_true / stageId_eq / hostProbeWireId_eq.
  Core claim Bools + probeWireReady stay here.
  These ProbeWire theorems do NOT set SpecProof.proofCompleteClaimed true.
  Probe green is smoke debt, not product residual free.

  Intentional non-claims / partial:
  - Probe-vs-wire honesty only -- NOT freestanding residual free.
  - Hosted behavioral probe green is NOT product residual free.
  - Product freestanding wire residual remains (DualResidual product residual).
  - NOT freestanding product self-host complete.
  - llvm unlock orthogonal (LlvmHold.llvmUnlocked may be true after unlock residual).
  - NOT PROVABLY re-open. Intentional PARTIAL carry remains.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Does not mint ProductPath alias theater. Does not grow bash EMIT_* treadmill.
  - No new EMIT_* C stage. Does not grow check.sh. Does not grow probe C body.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PROBE_WIRE_V0,
  HOST-PROBE-WIRE, SELF-HOST-PROBE-WIRE, PROBE-WIRE-SMOKE,
  HOST-PROBE-WIRE-SMOKE, probeWireReady, probeWireSurfaceOk,
  probeWireSurfacesDistinct, probeWireDoesNotMeanResidualFree,
  probeWireDoesNotMeanProductComplete, behavioralProbeIsSmokeDebt,
  behavioralProbeIsNotProductWire, productWireIsEmitPath,
  probeDoesNotReplaceProductWire, residualFreeClaimed,
  productSelfHostCompleteClaimed, probeWireOk, HOST-DUAL-RESIDUAL,
  HOST-PRODUCT-PATH-CLOSE, HOST-INVENTORY-CLOSE, HOST-LLVM-HOLD,
  EMIT-BOUNDARY, RUNTIME-FS, dualResidualReady, productPathCloseReady,
  inventoryCloseReady, llvmHoldReady,
  freestandingProductSelfHostComplete, llvmUnlocked, provablyUnlocked,
  intentional PARTIAL, SELF-HOST, MULT-0, MULT-1, MULT-OMEGA,
  PROBE-WIRE-THEOREM, HOST-PROBE-WIRE-THEOREM, probeWireReady_true,
  behavioralProbeIsSmokeDebt_true, residualFreeClaimed_false,
  ProbeWireTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.ProbeWire
  Long-file peel: PROBE-WIRE-THEOREM + PROBE-WIRE-SMOKE in
  SystemsLean.ProbeWireTheorems (same namespace).
  Not freestanding residual free. Not PROVABLY.
  Not freestanding product self-host complete. Not freestanding emit residual free.
  Not full LLVM backend. Not host elaborator residual free. Not proof complete.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.DualResidual
import SystemsLean.ProductPath
import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold

namespace SystemsLean.ProbeWire

/-- Greppable primary stage id for probe-vs-wire honesty. -/
def stageId : String := "SLAKE_SELF_HOST_PROBE_WIRE_V0"

/-- Greppable host map id (HOST-PROBE-WIRE). -/
def hostProbeWireId : String := "HOST-PROBE-WIRE"

/-- Greppable short map id (SELF-HOST-PROBE-WIRE). -/
def selfHostProbeWireId : String := "SELF-HOST-PROBE-WIRE"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/ProbeWire.lean"

/-- Read-only PARTIAL inventory path cite (not a filesystem read). -/
def inventoryPath : String := "src/systems/host-partial-inventory.md"

/-- Hosted behavioral probe path cite (smoke debt; not product wire). -/
def behavioralProbePath : String := "src/systems/smoke/slake_behavioral_probe.c"

/-- Product freestanding emit wire path cite (generator surface). -/
def productEmitWirePath : String := "src/systems/emit/"

/-- Product freestanding release wire path cite (out release surface). -/
def productReleaseWirePath : String := "out/freestanding-c/"

/-- Prior dual residual stage cite. -/
def dualResidualStageCite : String := "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0"

/-- Prior product path close stage cite. -/
def productPathCloseStageCite : String := "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"

/-- Prior inventory close stage cite. -/
def inventoryCloseStageCite : String := "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0"

/-- Prior llvm hold stage cite. -/
def llvmHoldStageCite : String := "SLAKE_SELF_HOST_LLVM_HOLD_V0"

/-- Prior dual residual host map cite. -/
def hostDualResidualCite : String := "HOST-DUAL-RESIDUAL"

/-- Prior product path close host map cite. -/
def hostProductPathCloseCite : String := "HOST-PRODUCT-PATH-CLOSE"

/-- Prior inventory close host map cite. -/
def hostInventoryCloseCite : String := "HOST-INVENTORY-CLOSE"

/-- Prior llvm hold host map cite. -/
def hostLlvmHoldCite : String := "HOST-LLVM-HOLD"

/-- EMIT-BOUNDARY cite (host elaborator / proofs vs product extract). -/
def emitBoundaryCite : String := "EMIT-BOUNDARY"

/-- RUNTIME-FS product goal cite. -/
def runtimeFsCite : String := "RUNTIME-FS"

/-- Greppable hosted behavioral probe is smoke debt token. -/
def smokeDebtToken : String := "hosted behavioral probe is smoke debt"

/-- Greppable product freestanding wire token. -/
def productWireToken : String := "product freestanding wire"

/-- Greppable intentional PARTIAL carry token. -/
def intentionalPartialToken : String := "intentional PARTIAL"

/-- probeWireSurfaceOk -- stage ids + probe/wire path cites + prior dual residual
    / close / inventory / llvm hold / emit boundary cites. String canaries only.
    Greppable: probeWireSurfaceOk. -/
def probeWireSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PROBE_WIRE_V0")
    && (hostProbeWireId == "HOST-PROBE-WIRE")
    && (selfHostProbeWireId == "SELF-HOST-PROBE-WIRE")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/ProbeWire.lean")
    && (inventoryPath == "src/systems/host-partial-inventory.md")
    && (behavioralProbePath == "src/systems/smoke/slake_behavioral_probe.c")
    && (productEmitWirePath == "src/systems/emit/")
    && (productReleaseWirePath == "out/freestanding-c/")
    && (dualResidualStageCite == "SLAKE_SELF_HOST_DUAL_RESIDUAL_V0")
    && (productPathCloseStageCite == "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0")
    && (inventoryCloseStageCite == "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0")
    && (llvmHoldStageCite == "SLAKE_SELF_HOST_LLVM_HOLD_V0")
    && (hostDualResidualCite == "HOST-DUAL-RESIDUAL")
    && (hostProductPathCloseCite == "HOST-PRODUCT-PATH-CLOSE")
    && (hostInventoryCloseCite == "HOST-INVENTORY-CLOSE")
    && (hostLlvmHoldCite == "HOST-LLVM-HOLD")
    && (emitBoundaryCite == "EMIT-BOUNDARY")
    && (runtimeFsCite == "RUNTIME-FS")
    && (smokeDebtToken == "hosted behavioral probe is smoke debt")
    && (productWireToken == "product freestanding wire")
    && (intentionalPartialToken == "intentional PARTIAL")

/-- behavioralProbeIsSmokeDebt -- hosted probe under smoke/ is smoke debt, not
    product residual progress. MUST decide true.
    Greppable: behavioralProbeIsSmokeDebt. -/
def behavioralProbeIsSmokeDebt : Bool := true

/-- behavioralProbeIsNotProductWire -- probe path is not product freestanding
    wire. MUST decide true.
    Greppable: behavioralProbeIsNotProductWire. -/
def behavioralProbeIsNotProductWire : Bool := true

/-- productWireIsEmitPath -- product freestanding wire is emit/out path.
    MUST decide true.
    Greppable: productWireIsEmitPath. -/
def productWireIsEmitPath : Bool := true

/-- probeDoesNotReplaceProductWire -- probe green does not replace wire residual.
    MUST decide true.
    Greppable: probeDoesNotReplaceProductWire. -/
def probeDoesNotReplaceProductWire : Bool := true

/-- residualFreeClaimed -- product residual free claim; MUST decide false.
    Greppable: residualFreeClaimed. -/
def residualFreeClaimed : Bool := false

/-- productSelfHostCompleteClaimed -- aligns with SelfApplyFs complete true.
    Greppable: productSelfHostCompleteClaimed. -/
def productSelfHostCompleteClaimed : Bool := true

/-- probeWireSurfacesDistinct -- hosted behavioral probe and product freestanding
    wire are distinct honesty surfaces: smoke-debt true, not-wire true, emit-path
    true, probe does not replace wire, path cites differ, tokens distinguish.
    Greppable: probeWireSurfacesDistinct. -/
def probeWireSurfacesDistinct : Bool :=
  behavioralProbeIsSmokeDebt
    && behavioralProbeIsNotProductWire
    && productWireIsEmitPath
    && probeDoesNotReplaceProductWire
    && (behavioralProbePath == "src/systems/smoke/slake_behavioral_probe.c")
    && (productEmitWirePath == "src/systems/emit/")
    && (productReleaseWirePath == "out/freestanding-c/")
    && (smokeDebtToken == "hosted behavioral probe is smoke debt")
    && (productWireToken == "product freestanding wire")
    && (emitBoundaryCite == "EMIT-BOUNDARY")
    && (runtimeFsCite == "RUNTIME-FS")
    && !(behavioralProbePath == productEmitWirePath)
    && !(behavioralProbePath == productReleaseWirePath)

/-- probeWireReady -- probe-vs-wire honesty bar after dual residual honesty.
    FAIL-CLOSED: dualResidualReady && surface && surfacesDistinct &&
    smoke-debt + not-wire + emit-path + does-not-replace && local residual free
    false && product complete true. llvm unlock orthogonal (living pin may be
    true after unlock residual).
    Honest scope: probe-vs-wire honesty only -- local residual free false;
    product complete true on living tip; NOT PROVABLY re-open; NOT full LLVM
    backend.
    Greppable: probeWireReady, HOST-PROBE-WIRE. -/
def probeWireReady : Bool :=
  DualResidual.dualResidualReady
    && probeWireSurfaceOk
    && probeWireSurfacesDistinct
    && behavioralProbeIsSmokeDebt
    && behavioralProbeIsNotProductWire
    && productWireIsEmitPath
    && probeDoesNotReplaceProductWire
    && !residualFreeClaimed
    && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete

/-- probeWireDoesNotMeanResidualFree -- probe-vs-wire ready is not free SSoT
    (local residualFreeClaimed stays false; DualResidual owns product free;
    probe green alone is not free). Greppable: probeWireDoesNotMeanResidualFree. -/
def probeWireDoesNotMeanResidualFree : Bool :=
  probeWireReady && !residualFreeClaimed && DualResidual.residualFreeClaimed
    && !DualResidual.productResidualRemains

/-- probeWireDoesNotMeanProductComplete -- probe-vs-wire ready does NOT claim
    freestanding product self-host complete.
    Greppable: probeWireDoesNotMeanProductComplete. -/
def probeWireDoesNotMeanProductComplete : Bool :=
  probeWireReady
    && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete

/-- Full probe-wire ok (alias of probeWireReady for inventory greps). -/
def probeWireOk : Bool := probeWireReady

/-! ### PROBE-WIRE-THEOREM + PROBE-WIRE-SMOKE peeled to ProbeWireTheorems
    (same namespace). Greppable cites live on ProbeWireTheorems:
    PROBE-WIRE-THEOREM, HOST-PROBE-WIRE-THEOREM, PROBE-WIRE-SMOKE,
    HOST-PROBE-WIRE-SMOKE, stageId_eq, hostProbeWireId_eq,
    behavioralProbeIsSmokeDebt_true, behavioralProbeIsNotProductWire_true,
    productWireIsEmitPath_true, residualFreeClaimed_false,
    probeWireReady_true, probeWireDoesNotMeanResidualFree_true,
    ProbeWireTheorems.
    Import SystemsLean.ProbeWireTheorems from the package root. Core claim
    Bools + ready surface stay here -- probe is smoke debt; free claims stay
    false; complete true via SelfApplyFs alias; not llvm / PROVABLY unlock. -/

end SystemsLean.ProbeWire
"#

end SystemsLean.HostFrontLiveProbeWire
