/-
  SYSTEMS_LEAN_HOST partial -- freestanding product path theorems + smoke.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Long-file peel from SystemsLean.ProductPath: PRODUCT-PATH-THEOREM /
  HOST-PRODUCT-PATH-THEOREM and PRODUCT-PATH-SMOKE / PRODUCT-PATH-CLOSE-SMOKE
  live here; surface cites, productPathReady, ladder close defs stay in
  ProductPath. Same namespace SystemsLean.ProductPath so theorem names stay
  unqualified under that namespace.

  Spec (readable):
  - productPathReady_true / productPathCloseReady_true / residualFreeClaimed_false
  - productPathFurtherAliasTheaterHeld_true / productPathDoesNotMeanResidualFree_true
  - stageId_eq / hostProductPathId_eq
  - PRODUCT-PATH-SMOKE / HOST-PRODUCT-PATH-SMOKE path bar + ready canaries
  - PRODUCT-PATH-CLOSE-SMOKE / HOST-PRODUCT-PATH-CLOSE-SMOKE ladder close canaries

  These ProductPath theorems do NOT set SpecProof.proofCompleteClaimed true.
  residualFreeClaimed stays false; further alias theater held (not residual progress).

  Intentional non-claims:
  - Partial ProductPath theorems only -- NOT SpecProof.proofCompleteClaimed.
  - Path readiness + structural ladder close honesty only -- NOT residual free.
  - NOT freestanding product self-host complete as a new claim (complete already
    true on SelfApplyFs; these theorems do not forge free / llvm / PROVABLY).
  - NOT PROVABLY. NOT llvm unlock. NOT day-one full Idris+Lean surface parity.

  Greppable: SYSTEMS_LEAN_HOST, PRODUCT-PATH-THEOREM, HOST-PRODUCT-PATH-THEOREM,
  PRODUCT-PATH-SMOKE, HOST-PRODUCT-PATH-SMOKE, PRODUCT-PATH-CLOSE-SMOKE,
  HOST-PRODUCT-PATH-CLOSE-SMOKE, productPathReady_true, productPathCloseReady_true,
  residualFreeClaimed_false, productPathFurtherAliasTheaterHeld_true,
  productPathDoesNotMeanResidualFree_true, stageId_eq, hostProductPathId_eq,
  ProductPathTheorems, UNIT_SURFACE host surface.
  Module: SystemsLean.ProductPathTheorems
  Red/green: just systems-host; lake build SystemsLean.ProductPath.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
-/

import SystemsLean.InventoryClose
import SystemsLean.CompilePath
import SystemsLean.KernelEmit
import SystemsLean.KernelProgram
import SystemsLean.HostCompose
import SystemsLean.IrProgram
import SystemsLean.JoinMap
import SystemsLean.SelfHost
import SystemsLean.SurfaceMatrix
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.ProductPath

namespace SystemsLean.ProductPath

/-! ### PRODUCT-PATH-THEOREM / HOST-PRODUCT-PATH-THEOREM (readable statements, then proofs)

  Real Lean theorems (not only `example` Bool canaries). Scope is freestanding
  product path readiness, structural ladder close, and honesty non-claims only.
  residualFreeClaimed stays false; further alias theater held. Does not complete
  SpecProof; does not claim residual free / product complete / PROVABLY / llvm unlock.
  Does not invent new ProductPath alias conjuncts.
-/

set_option maxRecDepth 16384

/-- Primary stage id is greppable SLAKE_SELF_HOST_PRODUCT_PATH_V0.
    Greppable: stageId_eq, PRODUCT-PATH-THEOREM, HOST-PRODUCT-PATH-THEOREM. -/
theorem stageId_eq : stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_V0" := rfl

/-- Host map id is greppable HOST-PRODUCT-PATH.
    Greppable: hostProductPathId_eq, PRODUCT-PATH-THEOREM. -/
theorem hostProductPathId_eq : hostProductPathId = "HOST-PRODUCT-PATH" := rfl

/-- residualFreeClaimed stays false (product path is not residual free).
    Greppable: residualFreeClaimed_false, PRODUCT-PATH-THEOREM,
    HOST-PRODUCT-PATH-THEOREM. -/
theorem residualFreeClaimed_false : residualFreeClaimed = false := rfl

/-- Freestanding product path readiness holds (not residual free).
    Greppable: productPathReady_true, HOST-PRODUCT-PATH, PRODUCT-PATH-THEOREM,
    HOST-PRODUCT-PATH-THEOREM. -/
theorem productPathReady_true : productPathReady = true := by decide

/-- Product path ready does NOT claim freestanding residual free.
    Greppable: productPathDoesNotMeanResidualFree_true, PRODUCT-PATH-THEOREM. -/
theorem productPathDoesNotMeanResidualFree_true :
    productPathDoesNotMeanResidualFree = true := by decide

/-- Further ProductPath alias theater honesty canary holds (not residual progress).
    Greppable: productPathFurtherAliasTheaterHeld_true, PRODUCT-PATH-THEOREM,
    HOST-PRODUCT-PATH-THEOREM. -/
theorem productPathFurtherAliasTheaterHeld_true :
    productPathFurtherAliasTheaterHeld = true := by decide

/-- Structural product path ladder close readiness holds (not residual free).
    Greppable: productPathCloseReady_true, HOST-PRODUCT-PATH-CLOSE,
    PRODUCT-PATH-THEOREM, HOST-PRODUCT-PATH-THEOREM. -/
theorem productPathCloseReady_true : productPathCloseReady = true := by decide

/-! ### Product path smoke (behavioral; lake build fails if example fails)
    Greppable: PRODUCT-PATH-SMOKE, HOST-PRODUCT-PATH-SMOKE.
    maxRecDepth raised for inventoryCloseReady / productPathReady unfolds. -/

/-- PRODUCT-PATH-SMOKE / HOST-PRODUCT-PATH-SMOKE: stage / map ids greppable. -/
example : stageId = "SLAKE_SELF_HOST_PRODUCT_PATH_V0" := by decide
example : hostProductPathId = "HOST-PRODUCT-PATH" := by decide
example : selfHostProductPathId = "SELF-HOST-PRODUCT-PATH" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/ProductPath.lean" := by decide
example : inventoryPath = "src/systems/host-partial-inventory.md" := by decide
example : inventoryCloseStageCite = "SLAKE_SELF_HOST_INVENTORY_CLOSE_V0" := by decide
example : selfApplyFsStageCite = "SLAKE_SELF_HOST_SELF_APPLY_FS_V0" := by decide
example : compilePathStageCite = "SLAKE_COMPILE_PATH_V1" := by decide
example : kernelEmitStageCite = "SLAKE_SELF_HOST_KERNEL_EMIT_V0" := by decide
example : joinMapStageCite = "SLAKE_JOIN_MAP_V0" := by decide
example : selfHostStageCite = "SLAKE_SELF_HOST_V0" := by decide
example : surfaceMatrixStageCite = "SLAKE_SURFACE_MATRIX_V0" := by decide
example : hostInventoryCloseCite = "HOST-INVENTORY-CLOSE" := by decide
example : hostSelfApplyFsCite = "HOST-SELF-APPLY-FS" := by decide
example : hostCompilePathCite = "HOST-COMPILE-PATH" := by decide
example : hostKernelEmitCite = "HOST-KERNEL-EMIT" := by decide
example : hostJoinMapCite = "HOST-JOIN-MAP" := by decide
example : hostSelfHostCite = "HOST-SELF-HOST" := by decide
example : hostSurfaceMatrixCite = "HOST-SURFACE-MATRIX" := by decide
example : productEmitBodyId = "EMIT_BODY_V0" := by decide
example : productHostEmitSsotId = "HOST-EMIT-SSOT" := by decide
example : productHostEmitMultId = "HOST-EMIT-MULT" := by decide
example : runtimeFsMarker = "RUNTIME-FS" := by decide
example : emitBoundaryMarker = "EMIT-BOUNDARY" := by decide
example : emptyProgramFailClosedMarker = "EMPTY-PROGRAM-FAIL-CLOSED" := by decide
example : surfaceMatrixIdMarker = "SURFACE-MATRIX" := by decide
example : productPathSurfaceOk = true := by decide

/-- PRODUCT-PATH-SMOKE: residual-free / complete / unlock claims stay false. -/
example : residualFreeClaimed = false := by decide
example : productSelfHostCompleteClaimed = true := by decide
example : SelfApplyFs.freestandingProductSelfHostComplete = true := by decide
example : LlvmHold.llvmUnlocked = false := by decide
example : LlvmHold.provablyUnlocked = false := by decide

/-- PRODUCT-PATH-SMOKE: freestanding unit product path (empty / unminted / emit). -/
example : freestandingUnitProductPathReady = true := by decide
example : CompilePath.unitCompileReady HostCompose.empty = true := by decide
example : HostCompose.extractOkFs HostCompose.empty = true := by decide
example :
    CompilePath.unitCompileReady KernelEmit.unmintedEmitCompose = false := by decide
example :
    HostCompose.extractOkFs KernelEmit.unmintedEmitCompose = false := by decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc =>
         CompilePath.unitCompileReady hc && HostCompose.extractOkFs hc
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding program product path (empty fail / lowered). -/
example : freestandingProgramProductPathReady = true := by decide
example : CompilePath.programCompileReady IrProgram.empty = false := by decide
example :
    (match KernelProgram.lowerProgramKernel with
     | some p =>
         CompilePath.programCompileReady p && IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding emit product path (reuse KernelEmit + FS body). -/
example : freestandingEmitProductPathReady = true := by decide
example : KernelEmit.emitPlanPathReady = true := by decide
example : KernelEmit.emitApplyPathReady = true := by decide
example : KernelEmit.emitBodyPathReady = true := by decide
example : KernelEmit.emitKernelReady = true := by decide
example : SelfApplyFs.freestandingBodyPathReady = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding join *unit* product path (empty / unminted / emit). -/
example : freestandingJoinProductPathReady = true := by decide
example : freestandingJoinUnitProductPathReady = true := by decide
example : freestandingJoinUnitProductPathReady = freestandingJoinProductPathReady :=
  by decide
example : JoinMap.joinUnitCompileReady HostCompose.empty = true := by decide
example :
    JoinMap.joinUnitCompileReady KernelEmit.unmintedEmitCompose = false := by decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc => JoinMap.joinUnitCompileReady hc
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding join *program* product path
    (EMPTY-PROGRAM-FAIL-CLOSED + lowered kernel joinProgramCompileReady). -/
example : freestandingJoinProgramProductPathReady = true := by decide
example : JoinMap.joinProgramCompileReady IrProgram.empty = false := by decide
example :
    (match KernelProgram.lowerProgramKernel with
     | some p =>
         JoinMap.joinProgramCompileReady p && IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding self-host *direction* *unit* product path
    (HOST-SELF-HOST selfHostUnitReady empty / unminted / lowerEmitCompose).
    Dual alias freestandingSelfHostUnitProductPathReady.
    Does NOT claim freestanding product self-host complete. -/
example : freestandingSelfHostProductPathReady = true := by decide
example : freestandingSelfHostUnitProductPathReady = true := by decide
example :
    freestandingSelfHostUnitProductPathReady
      = freestandingSelfHostProductPathReady := by decide
example : SelfHost.selfHostUnitReady HostCompose.empty = true := by decide
example :
    SelfHost.selfHostUnitReady KernelEmit.unmintedEmitCompose = false := by decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc => SelfHost.selfHostUnitReady hc
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding self-host *direction* *program* product path
    (EMPTY-PROGRAM-FAIL-CLOSED + lowered kernel selfHostProgramReady).
    Does NOT claim freestanding product self-host complete. -/
example : freestandingSelfHostProgramProductPathReady = true := by decide
example : SelfHost.selfHostProgramReady IrProgram.empty = false := by decide
example :
    (match KernelProgram.lowerProgramKernel with
     | some p =>
         SelfHost.selfHostProgramReady p && IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding surface-matrix *unit* product path
    (HOST-SURFACE-MATRIX matrixUnitReady empty / unminted / lowerEmitCompose).
    Open rows stay open; not day-one full Idris+Lean parity. -/
example : freestandingMatrixUnitProductPathReady = true := by decide
example : SurfaceMatrix.matrixUnitReady HostCompose.empty = true := by decide
example :
    SurfaceMatrix.matrixUnitReady KernelEmit.unmintedEmitCompose = false := by
  decide
example :
    (match KernelEmit.lowerEmitCompose with
     | some hc => SurfaceMatrix.matrixUnitReady hc
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: freestanding surface-matrix *program* product path
    (EMPTY-PROGRAM-FAIL-CLOSED + lowered kernel matrixProgramReady).
    Open rows stay open; not day-one full Idris+Lean parity. -/
example : freestandingMatrixProgramProductPathReady = true := by decide
example : SurfaceMatrix.matrixProgramReady IrProgram.empty = false := by decide
example :
    (match KernelProgram.lowerProgramKernel with
     | some p =>
         SurfaceMatrix.matrixProgramReady p && IrProgram.isWellTyped p
     | none => false) = true := by decide

/-- PRODUCT-PATH-SMOKE: joint path + inventory close prior ready. -/
example : freestandingProductPathReady = true := by decide
example : InventoryClose.inventoryCloseReady = true := by decide

/-- PRODUCT-PATH-SMOKE / HOST-PRODUCT-PATH-SMOKE: product path ready decides true
    (not residual free; not product complete; not llvm unlock). -/
example : productPathReady = true := by decide
example : productPathDoesNotComplete = true := by decide
example : productPathDoesNotMeanResidualFree = true := by decide
example : productPathOk = true := by decide

/-! ### Product path close smoke (structural ladder close)
    Greppable: PRODUCT-PATH-CLOSE-SMOKE, HOST-PRODUCT-PATH-CLOSE-SMOKE. -/

/-- PRODUCT-PATH-CLOSE-SMOKE / HOST-PRODUCT-PATH-CLOSE-SMOKE: close stage ids. -/
example : closeStageId = "SLAKE_SELF_HOST_PRODUCT_PATH_CLOSE_V0" := by decide
example : hostProductPathCloseId = "HOST-PRODUCT-PATH-CLOSE" := by decide
example : selfHostProductPathCloseId = "SELF-HOST-PRODUCT-PATH-CLOSE" := by decide
example :
    structuralLadderClosedToken = "structural product path ladder closed" := by decide
example : closeIntentionalPartialToken = "intentional PARTIAL" := by decide
example :
    furtherAliasTheaterToken
      = "further ProductPath inventoryCloseReady-implied alias theater held" :=
  by decide
example : productPathCloseSurfaceOk = true := by decide
example : productPathFurtherAliasTheaterHeld = true := by decide

/-- PRODUCT-PATH-CLOSE-SMOKE: residual free / complete / unlock stay false. -/
example : residualFreeClaimed = false := by decide
example : productSelfHostCompleteClaimed = true := by decide
example : SelfApplyFs.freestandingProductSelfHostComplete = true := by decide
example : LlvmHold.llvmUnlocked = false := by decide
example : LlvmHold.provablyUnlocked = false := by decide

/-- PRODUCT-PATH-CLOSE-SMOKE / HOST-PRODUCT-PATH-CLOSE-SMOKE: ladder closed.
    Structural product path ladder closed -- not residual free; not complete. -/
example : productPathLadderClosedOk = true := by decide
example : productPathCloseReady = true := by decide
example : productPathCloseReady = productPathLadderClosedOk := by decide
example : productPathCloseDoesNotMeanResidualFree = true := by decide
example : productPathCloseOk = true := by decide

end SystemsLean.ProductPath
