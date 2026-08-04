/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path readiness
  (after HOST-INVENTORY-CLOSE).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Pair map (read-only): InventoryClose.lean inventory close readiness;
    CompilePath.lean unit/program compile bars; KernelEmit.lean lowerEmitCompose
    + emitPlanPathReady / emitApplyPathReady / emitBodyPathReady / emitKernelReady;
    SelfApplyFs.lean freestandingBodyPathReady (HOST-EMIT-SSOT body);
    KernelProgram.lean lowerProgramKernel; JoinMap.lean joinUnitCompileReady /
    joinProgramCompileReady; SelfHost.lean selfHostUnitReady /
    selfHostProgramReady (HOST-SELF-HOST); SurfaceMatrix.lean matrixUnitReady /
    matrixProgramReady (HOST-SURFACE-MATRIX); SelfApplyFs / LlvmHold complete
    and unlock flags; self-host.md acceptance; surface-matrix.md;
    host-partial-inventory.md.

  Spec (readable, separate from any future proof):
  - SLAKE_SELF_HOST_PRODUCT_PATH_V0 / HOST-PRODUCT-PATH /
    SELF-HOST-PRODUCT-PATH: greppable freestanding product path readiness gate
    beyond inventory close -- real Bool compose on CompilePath unit / program
    bars, KernelEmit plan/apply/body path, JoinMap unit + program join paths,
    SelfHost unit + program direction paths, SurfaceMatrix unit + program paths
    over empty HostCompose / unminted emit compose / lowered kernel emit compose
    (not docs-only canaries).
  - freestandingUnitProductPathReady: fail-closed unit product path honesty
    (RUNTIME-FS / HOST-COMPILE-PATH / extractOkFs):
      empty HostCompose unitCompileReady true + extractOkFs true;
      unminted emit compose unitCompileReady false + extractOkFs false;
      KernelEmit.lowerEmitCompose some + unitCompileReady true + extractOkFs
      true on that host.
  - freestandingProgramProductPathReady: sibling program path honesty
    (EMPTY-PROGRAM-FAIL-CLOSED):
      empty program programCompileReady false;
      KernelProgram.lowerProgramKernel some + programCompileReady true +
      isWellTyped true on that program.
  - freestandingEmitProductPathReady: freestanding emit product path honesty
    (HOST-KERNEL-EMIT / HOST-EMIT-SSOT / HOST-EMIT-MULT) -- reuses existing
    real path bars rather than duplicating theater:
      KernelEmit.emitPlanPathReady (empty/unminted/lowerEmitCompose plan);
      KernelEmit.emitApplyPathReady (empty/unminted/lowerEmitCompose apply);
      KernelEmit.emitBodyPathReady (empty/unminted/lowerEmitCompose body);
      KernelEmit.emitKernelReady (intentional re-assert: plan/apply/body +
      EmitMult.emitMultReady + program kernel + surface);
      SelfApplyFs.freestandingBodyPathReady (HOST-EMIT-SSOT body deepen +
      emitMultReady on same compose).
  - freestandingJoinProductPathReady: freestanding join *unit* product path
    honesty (HOST-JOIN-MAP / joinUnitCompileReady). Dual greppable alias
    freestandingJoinUnitProductPathReady == this def (joint name honesty with
    freestandingJoinProgramProductPathReady sibling):
      empty HostCompose joinUnitCompileReady true;
      unminted emit compose joinUnitCompileReady false;
      KernelEmit.lowerEmitCompose some + joinUnitCompileReady true.
  - freestandingJoinProgramProductPathReady: freestanding join *program*
    product path honesty (HOST-JOIN-MAP / joinProgramCompileReady; sibling of
    freestandingJoinProductPathReady; pattern after freestandingProgramProductPathReady):
      empty program joinProgramCompileReady false (EMPTY-PROGRAM-FAIL-CLOSED);
      KernelProgram.lowerProgramKernel some + joinProgramCompileReady true +
      isWellTyped true on that program.
  - freestandingSelfHostProductPathReady: freestanding self-host *direction*
    *unit* product path honesty (HOST-SELF-HOST / SLAKE_SELF_HOST_V0 /
    selfHostUnitReady). Dual greppable alias freestandingSelfHostUnitProductPathReady
    == this def (joint name honesty with freestandingSelfHostProgramProductPathReady
    sibling). Does NOT claim freestanding product self-host complete:
      empty HostCompose selfHostUnitReady true;
      unminted emit compose selfHostUnitReady false;
      KernelEmit.lowerEmitCompose some + selfHostUnitReady true.
  - freestandingSelfHostProgramProductPathReady: freestanding self-host
    *direction* *program* product path honesty (HOST-SELF-HOST /
    selfHostProgramReady; sibling of freestandingSelfHostProductPathReady):
      empty program selfHostProgramReady false (EMPTY-PROGRAM-FAIL-CLOSED);
      KernelProgram.lowerProgramKernel some + selfHostProgramReady true +
      isWellTyped true on that program.
    Does NOT claim freestanding product self-host complete.
  - freestandingMatrixUnitProductPathReady: freestanding surface-matrix *unit*
    product path honesty (HOST-SURFACE-MATRIX / SLAKE_SURFACE_MATRIX_V0 /
    matrixUnitReady). Open rows stay open; not day-one full Idris+Lean parity:
      empty HostCompose matrixUnitReady true;
      unminted emit compose matrixUnitReady false;
      KernelEmit.lowerEmitCompose some + matrixUnitReady true.
  - freestandingMatrixProgramProductPathReady: freestanding surface-matrix
    *program* product path honesty (HOST-SURFACE-MATRIX / matrixProgramReady;
    sibling of freestandingMatrixUnitProductPathReady):
      empty program matrixProgramReady false (EMPTY-PROGRAM-FAIL-CLOSED);
      KernelProgram.lowerProgramKernel some + matrixProgramReady true +
      isWellTyped true on that program.
  - freestandingProductPathReady: unit path && program path && emit path &&
    join unit path && join program path && self-host unit path && self-host
    program path && matrix unit path && matrix program path (joint freestanding
    product path bar; not freestanding product self-host complete).
  - productPathSurfaceOk: stage ids + product wire cites (RUNTIME-FS,
    EMIT-BOUNDARY, EMIT_BODY_V0, HOST-EMIT-SSOT, HOST-EMIT-MULT) + prior
    HOST-INVENTORY-CLOSE / HOST-SELF-APPLY-FS / HOST-COMPILE-PATH /
    HOST-KERNEL-EMIT / HOST-JOIN-MAP / HOST-SELF-HOST / HOST-SURFACE-MATRIX
    cites -- String canaries.
  - residualFreeClaimed stays false; productSelfHostCompleteClaimed true with complete.
  - productPathReady: InventoryClose.inventoryCloseReady &&
    freestandingUnitProductPathReady && freestandingProgramProductPathReady &&
    freestandingEmitProductPathReady && freestandingJoinProductPathReady &&
    freestandingJoinProgramProductPathReady && freestandingSelfHostProductPathReady &&
    freestandingSelfHostProgramProductPathReady &&
    freestandingMatrixUnitProductPathReady && freestandingMatrixProgramProductPathReady &&
    productPathSurfaceOk && !residual free claimed && product complete claimed
    true && SelfApplyFs.freestandingProductSelfHostComplete &&
    llvm unlock orthogonal (living pin may be true); PROVABLY may be true.
  - productPathDoesNotComplete / productPathDoesNotMeanResidualFree: ready with
    local residual free false; complete true on living tip (path readiness is
    not residual free re-open).
  - SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0 / HOST-PRODUCT-PATH-CLOSE /
    SELF-HOST-PRODUCT-PATH-CLOSE: structural freestanding product path ladder
    close -- documents unit/program/emit/join/self-host/matrix folds closed at
    productPathReady without forging residual free; complete true on living tip;
    llvm unlock orthogonal. Same module (no 32nd module); greppable close helpers.
  - productPathCloseSurfaceOk: close stage ids + structural ladder closed token
    + intentional PARTIAL carry cite (String canaries).
  - productPathFurtherAliasTheaterHeld: honesty canary -- further ProductPath
    conjunct-only re-asserts of inventoryCloseReady-implied kernel/parity bars
    alone are not residual progress (held as theater; not residual free claim).
  - productPathLadderClosedOk / productPathCloseReady: productPathReady &&
    productPathCloseSurfaceOk && productPathFurtherAliasTheaterHeld &&
    residual free false && product complete true; llvm unlock orthogonal.
  - productPathCloseDoesNotMeanResidualFree: close ready && !residual free.
  - Host model = structural freestanding product path honesty. Not an AI/ML
    model. Not product C residual free.

  Theorems + smoke (PRODUCT-PATH-THEOREM / HOST-PRODUCT-PATH-THEOREM /
  PRODUCT-PATH-SMOKE / PRODUCT-PATH-CLOSE-SMOKE) live in
  SystemsLean.ProductPathTheorems (same namespace). These theorems do NOT set
  SpecProof.proofCompleteClaimed true. residualFreeClaimed stays false; further
  alias theater held (not residual progress).

  Intentional non-claims / partial:
  - Product path readiness only -- NOT freestanding residual free.
  - Structural ladder close is NOT residual free re-open (close documents path
    folds; complete true on living tip via SelfApplyFs).
  - Self-host unit + program paths are direction honesty only; HOST-SELF-HOST
    cite alone does not re-prove complete.
  - NOT day-one full Idris+Lean surface parity (HOST-SURFACE-MATRIX open rows
    stay open; matrix path is progressive inventory honesty only).
  - llvm unlock orthogonal (LlvmHold.llvmUnlocked may be true after unlock residual).
  - NOT PROVABLY re-open. Intentional PARTIAL carry remains (host Bool path
    honesty vs full product freestanding C rebuild of Slake).
  - Further ProductPath alias theater of inventoryCloseReady-implied bars held
    (productPathFurtherAliasTheaterHeld); not residual progress.
  - Does not mint phantom modules. Does not grow bash EMIT_* residual treadmill.
  - No new EMIT_* C stage. Does not grow check.sh.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).

  Path bar assembly (unit/program/emit/join/self-host/matrix freestanding
  readiness + freestandingProductPathReady) lives in SystemsLean.ProductPathBars
  (same namespace). Theorems + PRODUCT-PATH-SMOKE / CLOSE-SMOKE live in
  SystemsLean.ProductPathTheorems (same namespace). This module owns surface
  cites, productPathReady, and ladder close defs.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_PRODUCT_PATH_V0,
  HOST-PRODUCT-PATH, SELF-HOST-PRODUCT-PATH, PRODUCT-PATH-SMOKE,
  HOST-PRODUCT-PATH-SMOKE, SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0,
  HOST-PRODUCT-PATH-CLOSE, SELF-HOST-PRODUCT-PATH-CLOSE,
  PRODUCT-PATH-CLOSE-SMOKE, HOST-PRODUCT-PATH-CLOSE-SMOKE,
  productPathReady, productPathSurfaceOk,
  freestandingUnitProductPathReady, freestandingProgramProductPathReady,
  freestandingEmitProductPathReady, freestandingJoinProductPathReady,
  freestandingJoinUnitProductPathReady, freestandingJoinProgramProductPathReady,
  freestandingSelfHostProductPathReady, freestandingSelfHostUnitProductPathReady,
  freestandingSelfHostProgramProductPathReady, freestandingMatrixUnitProductPathReady,
  freestandingMatrixProgramProductPathReady, freestandingProductPathReady,
  productPathDoesNotComplete, productPathDoesNotMeanResidualFree,
  productPathCloseReady, productPathLadderClosedOk, productPathCloseSurfaceOk,
  productPathCloseDoesNotMeanResidualFree, productPathFurtherAliasTheaterHeld,
  structural product path ladder closed, residualFreeClaimed,
  productSelfHostCompleteClaimed, productPathOk, productPathCloseOk,
  ProductPathBars, ProductPathTheorems, HOST-INVENTORY-CLOSE, HOST-SELF-APPLY-FS,
  HOST-COMPILE-PATH, HOST-KERNEL-EMIT, HOST-JOIN-MAP, HOST-SELF-HOST,
  HOST-SURFACE-MATRIX, HOST-EMIT-SSOT, HOST-EMIT-MULT, inventoryCloseReady,
  unitCompileReady, programCompileReady, extractOkFs, lowerEmitCompose,
  lowerProgramKernel, emitPlanPathReady, emitApplyPathReady, emitBodyPathReady,
  emitKernelReady, freestandingBodyPathReady, joinUnitCompileReady,
  joinProgramCompileReady, selfHostUnitReady, selfHostProgramReady,
  matrixUnitReady, matrixProgramReady, RUNTIME-FS, EMIT-BOUNDARY, EMIT_BODY_V0,
  EMPTY-PROGRAM-FAIL-CLOSED, freestandingProductSelfHostComplete, llvmUnlocked,
  provablyUnlocked, PRODUCT-PATH-THEOREM, HOST-PRODUCT-PATH-THEOREM,
  productPathReady_true, productPathCloseReady_true, residualFreeClaimed_false,
  productPathFurtherAliasTheaterHeld_true,
  SELF-HOST, SLAKE_SELF_HOST_V0, SURFACE-MATRIX, SLAKE_SURFACE_MATRIX_V0,
  UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPath
  Not freestanding residual free. Not PROVABLY.
  Not freestanding product self-host complete. Not freestanding emit residual free.
  Not full LLVM backend. Not day-one full Idris+Lean surface parity.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.InventoryClose
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.ProductPathBars

namespace SystemsLean.ProductPath

/-- Greppable primary stage id for freestanding product path readiness. -/
def stageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_V0"

/-- Greppable host map id (HOST-PRODUCT-PATH). -/
def hostProductPathId : String := "HOST-PRODUCT-PATH"

/-- Greppable short map id (SELF-HOST-PRODUCT-PATH). -/
def selfHostProductPathId : String := "SELF-HOST-PRODUCT-PATH"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/ProductPath.lean"

/-- Read-only PARTIAL inventory path cite (not a filesystem read). -/
def inventoryPath : String := "src/systems/host-partial-inventory.md"

/-- Prior inventory close stage cite. -/
def inventoryCloseStageCite : String := "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0"

/-- Prior freestanding self-apply stage cite. -/
def selfApplyFsStageCite : String := "SLAKE_SELF_HOST_SELF_APPLY_FS_V0"

/-- Prior compile-path stage cite. -/
def compilePathStageCite : String := "SLAKE_COMPILE_PATH_V1"

/-- Prior emit kernel stage cite. -/
def kernelEmitStageCite : String := "SLAKE_SELF_HOST_KERNEL_EMIT_V0"

/-- Prior join map stage cite. -/
def joinMapStageCite : String := "SLAKE_JOIN_MAP_V0"

/-- Prior self-host direction stage cite. -/
def selfHostStageCite : String := "SLAKE_SELF_HOST_V0"

/-- Prior surface-matrix stage cite. -/
def surfaceMatrixStageCite : String := "SLAKE_SURFACE_MATRIX_V0"

/-- Prior inventory close host map cite. -/
def hostInventoryCloseCite : String := "HOST-INVENTORY-CLOSE"

/-- Prior freestanding self-apply host map cite. -/
def hostSelfApplyFsCite : String := "HOST-SELF-APPLY-FS"

/-- Prior compile-path host map cite. -/
def hostCompilePathCite : String := "HOST-COMPILE-PATH"

/-- Prior emit kernel host map cite. -/
def hostKernelEmitCite : String := "HOST-KERNEL-EMIT"

/-- Prior join map host map cite. -/
def hostJoinMapCite : String := "HOST-JOIN-MAP"

/-- Prior self-host direction host map cite. -/
def hostSelfHostCite : String := "HOST-SELF-HOST"

/-- Prior surface-matrix host map cite. -/
def hostSurfaceMatrixCite : String := "HOST-SURFACE-MATRIX"

/-- Product wire cites (frozen; no new EMIT_* C stage). -/
def productEmitBodyId : String := "EMIT_BODY_V0"
def productHostEmitSsotId : String := "HOST-EMIT-SSOT"
def productHostEmitMultId : String := "HOST-EMIT-MULT"
def runtimeFsMarker : String := "RUNTIME-FS"
def emitBoundaryMarker : String := "EMIT-BOUNDARY"
def emptyProgramFailClosedMarker : String := "EMPTY-PROGRAM-FAIL-CLOSED"
def surfaceMatrixIdMarker : String := "SURFACE-MATRIX"

/-- Surface canary: stage ids + product wire cites + prior HOST-INVENTORY-CLOSE /
    HOST-SELF-APPLY-FS / HOST-COMPILE-PATH / HOST-KERNEL-EMIT / HOST-JOIN-MAP /
    HOST-SELF-HOST / HOST-SURFACE-MATRIX cites. String canaries only. -/
def productPathSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_V0")
    && (hostProductPathId == "HOST-PRODUCT-PATH")
    && (selfHostProductPathId == "SELF-HOST-PRODUCT-PATH")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/ProductPath.lean")
    && (inventoryPath == "src/systems/host-partial-inventory.md")
    && (inventoryCloseStageCite == "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0")
    && (selfApplyFsStageCite == "SLAKE_SELF_HOST_SELF_APPLY_FS_V0")
    && (compilePathStageCite == "SLAKE_COMPILE_PATH_V1")
    && (kernelEmitStageCite == "SLAKE_SELF_HOST_KERNEL_EMIT_V0")
    && (joinMapStageCite == "SLAKE_JOIN_MAP_V0")
    && (selfHostStageCite == "SLAKE_SELF_HOST_V0")
    && (surfaceMatrixStageCite == "SLAKE_SURFACE_MATRIX_V0")
    && (hostInventoryCloseCite == "HOST-INVENTORY-CLOSE")
    && (hostSelfApplyFsCite == "HOST-SELF-APPLY-FS")
    && (hostCompilePathCite == "HOST-COMPILE-PATH")
    && (hostKernelEmitCite == "HOST-KERNEL-EMIT")
    && (hostJoinMapCite == "HOST-JOIN-MAP")
    && (hostSelfHostCite == "HOST-SELF-HOST")
    && (hostSurfaceMatrixCite == "HOST-SURFACE-MATRIX")
    && (productEmitBodyId == "EMIT_BODY_V0")
    && (productHostEmitSsotId == "HOST-EMIT-SSOT")
    && (productHostEmitMultId == "HOST-EMIT-MULT")
    && (runtimeFsMarker == "RUNTIME-FS")
    && (emitBoundaryMarker == "EMIT-BOUNDARY")
    && (emptyProgramFailClosedMarker == "EMPTY-PROGRAM-FAIL-CLOSED")
    && (surfaceMatrixIdMarker == "SURFACE-MATRIX")

/-- residualFreeClaimed -- MUST decide false (product path is not residual free).
    Greppable: residualFreeClaimed. -/
def residualFreeClaimed : Bool := false

/-- productSelfHostCompleteClaimed -- aligns with SelfApplyFs complete true.
    Greppable: productSelfHostCompleteClaimed. -/
def productSelfHostCompleteClaimed : Bool := true

/-- productPathReady -- freestanding product path bar after inventory close.
    FAIL-CLOSED: inventoryCloseReady && unit/program/emit/join/self-host/matrix
    paths && surface && local residual free false && product complete claimed
    true && SelfApplyFs complete true. llvm unlock is orthogonal (living pin
    may be true after unlock residual).
    Honest scope: freestanding product path readiness only -- local residual
    free false; product complete true on living tip; NOT full LLVM backend;
    NOT PROVABLY re-open; NOT day-one full Idris+Lean surface parity.
    Greppable: productPathReady, HOST-PRODUCT-PATH. -/
def productPathReady : Bool :=
  InventoryClose.inventoryCloseReady
    && freestandingUnitProductPathReady
    && freestandingProgramProductPathReady
    && freestandingEmitProductPathReady
    && freestandingJoinProductPathReady
    && freestandingJoinProgramProductPathReady
    && freestandingSelfHostProductPathReady
    && freestandingSelfHostProgramProductPathReady
    && freestandingMatrixUnitProductPathReady
    && freestandingMatrixProgramProductPathReady
    && productPathSurfaceOk
    && !residualFreeClaimed
    && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete

/-- productPathDoesNotComplete -- product path ready does NOT complete freestanding
    product self-host. Greppable: productPathDoesNotComplete. -/
def productPathDoesNotComplete : Bool :=
  productPathReady && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete

/-- productPathDoesNotMeanResidualFree -- product path ready does NOT claim
    freestanding residual free. Greppable: productPathDoesNotMeanResidualFree. -/
def productPathDoesNotMeanResidualFree : Bool :=
  productPathReady && !residualFreeClaimed

/-- Full product path ok (alias of productPathReady for inventory greps). -/
def productPathOk : Bool := productPathReady

/-! ### HOST-PRODUCT-PATH-CLOSE -- structural product path ladder close
    Greppable: SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0, HOST-PRODUCT-PATH-CLOSE,
    SELF-HOST-PRODUCT-PATH-CLOSE, productPathCloseReady, productPathLadderClosedOk.
    Same module (keep 31); not residual free; not product complete. -/

/-- Greppable primary stage id for structural product path ladder close. -/
def closeStageId : String := "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0"

/-- Greppable host map id (HOST-PRODUCT-PATH-CLOSE). -/
def hostProductPathCloseId : String := "HOST-PRODUCT-PATH-CLOSE"

/-- Greppable short map id (SELF-HOST-PRODUCT-PATH-CLOSE). -/
def selfHostProductPathCloseId : String := "SELF-HOST-PRODUCT-PATH-CLOSE"

/-- Greppable structural ladder closed token (surface cite). -/
def structuralLadderClosedToken : String := "structural product path ladder closed"

/-- Greppable intentional PARTIAL carry token for close surface. -/
def closeIntentionalPartialToken : String := "intentional PARTIAL"

/-- Greppable further-alias-theater honesty token (not residual progress). -/
def furtherAliasTheaterToken : String :=
  "further ProductPath inventoryCloseReady-implied alias theater held"

/-- productPathCloseSurfaceOk -- close stage ids + ladder closed + PARTIAL.
    String canaries only. Greppable: productPathCloseSurfaceOk. -/
def productPathCloseSurfaceOk : Bool :=
  (closeStageId == "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0")
    && (hostProductPathCloseId == "HOST-PRODUCT-PATH-CLOSE")
    && (selfHostProductPathCloseId == "SELF-HOST-PRODUCT-PATH-CLOSE")
    && (structuralLadderClosedToken == "structural product path ladder closed")
    && (closeIntentionalPartialToken == "intentional PARTIAL")
    && (furtherAliasTheaterToken
        == "further ProductPath inventoryCloseReady-implied alias theater held")
    && (hostProductPathId == "HOST-PRODUCT-PATH")
    && (stageId == "SLAKE_SELF_HOST_PRODUCT_PATH_V0")

/-- productPathFurtherAliasTheaterHeld -- honesty canary: further ProductPath
    conjunct-only re-asserts of inventoryCloseReady-implied kernel/parity bars
    alone are NOT residual progress (definitional alias theater held).
    Does NOT claim residual free. Greppable: productPathFurtherAliasTheaterHeld. -/
def productPathFurtherAliasTheaterHeld : Bool :=
  productPathCloseSurfaceOk
    && (furtherAliasTheaterToken
        == "further ProductPath inventoryCloseReady-implied alias theater held")
    && !residualFreeClaimed

/-- productPathLadderClosedOk -- structural freestanding product path ladder
    closed at unit/program/emit/join/self-host/matrix (via productPathReady).
    FAIL-CLOSED: productPathReady && close surface && further alias theater
    honesty && local residual free false && product complete true on living tip.
    llvm unlock orthogonal (living pin may be true after unlock residual).
    Honest scope: structural ladder close only -- local residual free false;
    product complete true; NOT full LLVM backend; NOT PROVABLY re-open.
    Greppable: productPathLadderClosedOk, HOST-PRODUCT-PATH-CLOSE. -/
def productPathLadderClosedOk : Bool :=
  productPathReady
    && productPathCloseSurfaceOk
    && productPathFurtherAliasTheaterHeld
    && !residualFreeClaimed
    && productSelfHostCompleteClaimed
    && SelfApplyFs.freestandingProductSelfHostComplete

/-- productPathCloseReady -- dual greppable alias of productPathLadderClosedOk.
    Greppable: productPathCloseReady. -/
def productPathCloseReady : Bool := productPathLadderClosedOk

/-- productPathCloseDoesNotMeanResidualFree -- ladder close does NOT claim
    freestanding residual free. Greppable: productPathCloseDoesNotMeanResidualFree. -/
def productPathCloseDoesNotMeanResidualFree : Bool :=
  productPathCloseReady && !residualFreeClaimed

/-- Full product path close ok (alias for inventory greps). -/
def productPathCloseOk : Bool := productPathCloseReady

end SystemsLean.ProductPath
