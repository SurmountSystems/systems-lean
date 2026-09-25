/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live SelfApplyFs.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfApplyFsSource. Not occupancy name 50.
  Not mill 70. This wrap dual-pins SelfApplyFs.lean only.
  Do not edit SelfApplyFs.lean. Do not edit the SelfApplyFsClose wrap.
  Unique needles (trailing newline; taken from SelfApplyFs.lean only):
  Module: SystemsLean.SelfApplyFs
  def stageId : String := "SLAKE_SELF_HOST_SELF_APPLY_FS_V0"
  def hostModulePath : String := "src/systems/SystemsLean/SelfApplyFs.lean"
  def selfApplyFsCloseModuleCite : String := "SystemsLean.SelfApplyFsClose"
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-SELF-APPLY-FS,
  liveSelfApplyFsSource, liveRel, SELF-APPLY-FS,
  HOST-FRONT-LIVE-SELF-APPLY-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSelfApplyFsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveSelfApplyFs

/-- Dual-pinned live SelfApplyFs.lean bytes (must match on-disk file).
    Greppable: liveSelfApplyFsSource, PARSE-LIVE-SELF-APPLY-FS. -/
def liveSelfApplyFsSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- freestanding self-application deepen (SH5 deepen).
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Living tip: freestanding self-apply path + PartialReady chain folds + claim SSoT
  (complete / ownership / perform / stepContractFull). Dual-pin historical bulk
  lives on home modules (dual-pin thin b1-33 closed). Theorems and behavioral
  smoke live in SelfApplyFsTheorems (same namespace; long-file role seam).
  Close-path PartialReady folds B34..complete live in SelfApplyFsClose
  (same namespace; long-file role seam).

  Long greppable inventory (historical stage map):
    doc/dev/research/selfapplyfs-tip-peel-2026-07-31.md

  Spec (readable): SLAKE_SELF_HOST_SELF_APPLY_FS_V0 / HOST-SELF-APPLY-FS /
  SELF-HOST-SELF-APPLY-FS. freestandingSelfApplyReady folds SelfApply +
  freestanding extract/body path + Mult..Emit parity. freestandingProductSelfHostComplete
  MUST decide true (claim B after Full). Living perform/ownership claimed true on tip.

  Prior stage cites (compose surface): SELF-HOST-KERNEL-EMIT,
  SLAKE_SELF_HOST_KERNEL_EMIT_V0, HOST-PARITY-EMIT, SELF-HOST-PARITY-EMIT.

  Full-bar requirement tokens (closed with evidence on tip/homes):
  FULL-BAR-REQ-PERFORM-CLAIMED-WITH-EVIDENCE,
  FULL-BAR-REQ-OWNERSHIP-CLAIMED-WITH-EVIDENCE.

  UNIT_SURFACE host surface.
  Module: SystemsLean.SelfApplyFs
  Not freestanding residual free. Not PROVABLY. Not freestanding product
  self-host complete. Not freestanding emit residual free. Not full LLVM backend.
  Red/green: just systems-host; lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.SelfApply
import SystemsLean.ParityEmit
import SystemsLean.KernelEmit
import SystemsLean.HostCompose
import SystemsLean.EmitBody
import SystemsLean.EmitMult
import SystemsLean.KernelSelfApply
import SystemsLean.ProductOutKernel
import SystemsLean.BootstrapHonesty
import SystemsLean.ProductPathWriterSurface
import SystemsLean.ProductPathWriterPathPlan
import SystemsLean.ProductPathWriterPathExec
import SystemsLean.ProductPathOwnershipInputs
import SystemsLean.ProductPathPerform
import SystemsLean.ProductPathPerformStep
import SystemsLean.ProductPathReadSsot
import SystemsLean.ProductPathComposePlan
import SystemsLean.ProductPathWriteHc
import SystemsLean.Capable
import SystemsLean.CapableStepContract
import SystemsLean.CapableRead
import SystemsLean.CapableCompose
import SystemsLean.CapableWriteHc
import SystemsLean.CapableRegenerate
import SystemsLean.InstallOut
import SystemsLean.CapableFullBar
import SystemsLean.ProductPathOwnershipRegenerate
import SystemsLean.PerformEvidence
import SystemsLean.OfficialPath
import SystemsLean.OfficialPathAlternate

namespace SystemsLean.SelfApplyFs

/-- Greppable primary stage id for freestanding self-apply deepen (SH5). -/
def stageId : String := "SLAKE_SELF_HOST_SELF_APPLY_FS_V0"

/-- Greppable host map id (HOST-SELF-APPLY-FS). -/
def hostSelfApplyFsId : String := "HOST-SELF-APPLY-FS"

/-- Greppable short map id (SELF-HOST-SELF-APPLY-FS). -/
def selfHostSelfApplyFsId : String := "SELF-HOST-SELF-APPLY-FS"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/SelfApplyFs.lean"

/-- Prior SH5 host structural self-apply stage cite. -/
def selfApplyStageCite : String := "SLAKE_SELF_HOST_SELF_APPLY_V0"

/-- Prior SH4 emit / codegen kernel stage cite (compose surface). -/
def emitKernelStageCite : String := "SLAKE_SELF_HOST_KERNEL_EMIT_V0"

/-- Prior freestanding Emit path parity stage cite (Mult..Emit ladder). -/
def parityEmitStageCite : String := "SLAKE_SELF_HOST_PARITY_EMIT_V0"

/-- Greppable freestanding Emit path parity host map cite. -/
def hostParityEmitCite : String := "HOST-PARITY-EMIT"

/-- Greppable freestanding Emit path parity short map cite. -/
def selfHostParityEmitCite : String := "SELF-HOST-PARITY-EMIT"

/-- Product wire cites (frozen; no new EMIT_* C stage). -/
def productEmitBodyId : String := "EMIT_BODY_V0"
def productHostEmitSsotId : String := "HOST-EMIT-SSOT"
def productHostEmitMultId : String := "HOST-EMIT-MULT"
def runtimeFsMarker : String := "RUNTIME-FS"
def emitBoundaryMarker : String := "EMIT-BOUNDARY"

/-- Surface -/
def selfApplyFsSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_SELF_APPLY_FS_V0")
    && (hostSelfApplyFsId == "HOST-SELF-APPLY-FS")
    && (selfHostSelfApplyFsId == "SELF-HOST-SELF-APPLY-FS")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/SelfApplyFs.lean")
    && (selfApplyStageCite == "SLAKE_SELF_HOST_SELF_APPLY_V0")
    && (emitKernelStageCite == "SLAKE_SELF_HOST_KERNEL_EMIT_V0")
    && (parityEmitStageCite == "SLAKE_SELF_HOST_PARITY_EMIT_V0")
    && (hostParityEmitCite == "HOST-PARITY-EMIT")
    && (selfHostParityEmitCite == "SELF-HOST-PARITY-EMIT")
    && (productEmitBodyId == "EMIT_BODY_V0")
    && (productHostEmitSsotId == "HOST-EMIT-SSOT")
    && (productHostEmitMultId == "HOST-EMIT-MULT")
    && (runtimeFsMarker == "RUNTIME-FS")
    && (emitBoundaryMarker == "EMIT-BOUNDARY")

/-- freestandingExtractPathReady Greppable: freestandingExtractPathReady, extractOkFs, RUNTIME-FS. -/
def freestandingExtractPathReady : Bool :=
  let emptyOk := HostCompose.extractOkFs HostCompose.empty
  let unmintedFails := !HostCompose.extractOkFs KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      emptyOk && unmintedFails && HostCompose.extractOkFs hc

/-- freestandingBodyPathReady Greppable: freestandingBodyPathReady, bodyOk, HOST-EMIT-SSOT, EMIT_BODY_V0. -/
def freestandingBodyPathReady : Bool :=
  let emptyOk :=
    EmitBody.bodyOk HostCompose.empty
      && (let b := EmitBody.bodyFromCompose HostCompose.empty
          b.buf == EmitBody.emptyComposeFragmentSsot
            && EmitBody.bufHasEmitBodyMarker b.buf
            && EmitBody.bufHasRuntimeFsMarker b.buf)
  let unmintedFails := !EmitBody.bodyOk KernelEmit.unmintedEmitCompose
  match KernelEmit.lowerEmitCompose with
  | none => false
  | some hc =>
      let b := EmitBody.bodyFromCompose hc
      emptyOk
        && unmintedFails
        && EmitBody.bodyOk hc
        && EmitBody.bodyIsValid b
        && EmitBody.bufHasRuntimeFsMarker b.buf
        && EmitBody.bufHasEmitBodyMarker b.buf
        && b.buf == KernelEmit.expectedBodyFragment
        && b.runtimeNodes == 2
        && b.erasedNodes == 1
        && b.tagCount == 3
        && EmitMult.emitMultReady

/-- freestandingSelfApplyPathReady Greppable: freestandingSelfApplyPathReady. -/
def freestandingSelfApplyPathReady : Bool :=
  freestandingExtractPathReady && freestandingBodyPathReady

/-- freestandingParityLadderReady Greppable: freestandingParityLadderReady, multLinearTypesProgramEmitParityReady, HOST-PARITY-EMIT. -/
def freestandingParityLadderReady : Bool :=
  ParityEmit.multLinearTypesProgramEmitParityReady

/-- freestandingEmitParityReady Greppable: freestandingEmitParityReady, emitParityReady, HOST-PARITY-EMIT. -/
def freestandingEmitParityReady : Bool :=
  ParityEmit.emitParityReady

/-- freestandingProductSelfHostComplete Greppable: freestandingProductSelfHostComplete. -/
def freestandingProductSelfHostComplete : Bool := true

/-- freestandingSelfApplyReady Greppable: freestandingSelfApplyReady, HOST-SELF-APPLY-FS. -/
def freestandingSelfApplyReady : Bool :=
  SelfApply.selfApplyReady
    && freestandingSelfApplyPathReady
    && freestandingParityLadderReady
    && selfApplyFsSurfaceOk

/-- selfApplyFsDoesNotComplete Greppable: selfApplyFsDoesNotComplete. -/
def selfApplyFsDoesNotComplete : Bool :=
  false  -- complete claimed true; deepen does not deny complete

/-! ### B2 product kernel self-application (SELF-HOST-KERNEL-SELF-APPLY) -/

/-- productKernelSelfApplyPartialReady Greppable: productKernelSelfApplyPartialReady, SELF-HOST-KERNEL-SELF-APPLY, product kernel self-application, KernelSelfApply. -/
def productKernelSelfApplyPartialReady : Bool :=
  freestandingSelfApplyReady
    && KernelSelfApply.productKernelSelfApplyPartialReady

/-! ### B3 product Out kernel evidence (SELF-HOST-PRODUCT-OUT) -/

/-- productOutKernelEvidencePartialReady Greppable: productOutKernelEvidencePartialReady, SELF-HOST-PRODUCT-OUT, product Out kernel evidence, ProductOutKernel. -/
def productOutKernelEvidencePartialReady : Bool :=
  productKernelSelfApplyPartialReady
    && ProductOutKernel.productOutKernelEvidencePartialReady

/-! ### B4 Lake bootstrap honesty (SELF-HOST-PRODUCT-PATH-BOOTSTRAP) -/

/-- productPathHostLakeBootstrapRemains Greppable: productPathHostLakeBootstrapRemains, product path Lake bootstrap. -/
def productPathHostLakeBootstrapRemains : Bool := true

/-- productPathHostLakeBootstrapPartialReady
    Greppable: productPathHostLakeBootstrapPartialReady, SELF-HOST-PRODUCT-PATH-BOOTSTRAP, product path Lake bootstrap, BootstrapHonesty. -/
def productPathHostLakeBootstrapPartialReady : Bool :=
  productOutKernelEvidencePartialReady
    && BootstrapHonesty.productPathHostLakeBootstrapPartialReady

/-! ### B5 writer surface (SELF-HOST-PRODUCT-WRITER-SURFACE) -/

/-- productWriterSurfacePartialReady Greppable: productWriterSurfacePartialReady, SELF-HOST-PRODUCT-WRITER-SURFACE, product writer surface, ProductPathWriterSurface. -/
def productWriterSurfacePartialReady : Bool :=
  productPathHostLakeBootstrapPartialReady
    && ProductPathWriterSurface.productWriterSurfacePartialReady

/-! ### B6 writer path plan (SELF-HOST-PRODUCT-WRITER-PATH-PLAN) -/

/-- productWriterPathPlanPartialReady Greppable: productWriterPathPlanPartialReady, SELF-HOST-PRODUCT-WRITER-PATH-PLAN, product writer path plan, ProductPathWriterPathPlan. -/
def productWriterPathPlanPartialReady : Bool :=
  productWriterSurfacePartialReady
    && ProductPathWriterPathPlan.productWriterPathPlanPartialReady
    && productPathHostLakeBootstrapRemains

/-! ### B7 writer path exec (SELF-HOST-PRODUCT-WRITER-PATH-EXEC) -/

/-- productWriterPathExecutionPartialReady
    Greppable: productWriterPathExecutionPartialReady, SELF-HOST-PRODUCT-WRITER-PATH-EXEC, product writer path execution, ProductPathWriterPathExec. -/
def productWriterPathExecutionPartialReady : Bool :=
  productWriterPathPlanPartialReady
    && ProductPathWriterPathExec.productWriterPathExecutionPartialReady
    && productPathHostLakeBootstrapRemains

/-! ### B8 ownership inputs (SELF-HOST-PRODUCT-PATH-OWNERSHIP) -/

/-- productPathFreestandingOwnershipClaimed Greppable: productPathFreestandingOwnershipClaimed, SELF-HOST-PRODUCT-PATH-OWNERSHIP. -/
def productPathFreestandingOwnershipClaimed : Bool := true

/-- productPathOwnershipInputsPartialReady Greppable: productPathOwnershipInputsPartialReady, SELF-HOST-PRODUCT-PATH-OWNERSHIP, product path ownership inputs. -/
def productPathOwnershipInputsPartialReady : Bool :=
  productWriterPathExecutionPartialReady
    && ProductPathOwnershipInputs.productPathOwnershipInputsPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed

/-! ### B9 perform gap (SELF-HOST-PRODUCT-PATH-PERFORM) -/

/-- productPathFreestandingPerformClaimed Greppable: productPathFreestandingPerformClaimed, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathFreestandingPerformClaimed : Bool := true

/-- productPathPerformDependsOnLake false after M6 product-path Lake pins flip.
    Greppable: productPathPerformDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformDependsOnLake : Bool := false

/-- productPathPerformPartialReady Greppable: productPathPerformPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformPartialReady : Bool :=
  productPathOwnershipInputsPartialReady
    && ProductPathPerform.productPathPerformPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake

/-! ### B10 STEP perform (SELF-HOST-PRODUCT-PATH-PERFORM-STEP) -/

/-- productPathPerformInstallLakeFreeEntrypointClaimed
    Greppable: productPathPerformInstallLakeFreeEntrypointClaimed, SELF-HOST-PRODUCT-PATH-PERFORM-STEP, install-freestanding-c-out, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformInstallLakeFreeEntrypointClaimed : Bool := true

/-- productPathPerformStepPartialReady
    Greppable: productPathPerformStepPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-STEP, product path perform step, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformStepPartialReady : Bool :=
  productPathPerformPartialReady
    && ProductPathPerformStep.productPathPerformStepPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathPerformInstallLakeFreeEntrypointClaimed

/-! ### B11 READ perform (SELF-HOST-PRODUCT-PATH-PERFORM-READ) -/

/-- productPathPerformReadDependsOnLake Greppable: productPathPerformReadDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-READ, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformReadDependsOnLake : Bool := true

/-- productPathPerformReadEntrypointClaimed Greppable: productPathPerformReadEntrypointClaimed, SELF-HOST-PRODUCT-PATH-PERFORM-READ, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformReadEntrypointClaimed : Bool := true

/-- productPathPerformReadPartialReady
    Greppable: productPathPerformReadPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-READ, product path perform read, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformReadPartialReady : Bool :=
  productPathPerformStepPartialReady
    && ProductPathReadSsot.productPathPerformReadPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathPerformReadDependsOnLake
    && productPathPerformReadEntrypointClaimed

/-! ### B12 COMPOSE perform (SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE) -/

/-- productPathPerformComposeDependsOnLake
    Greppable: productPathPerformComposeDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, Keep in sync with ProductPathComposePlan (pure Nix scans both literals), SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformComposeDependsOnLake : Bool := true

/-- productPathPerformComposeEntrypointClaimed
    Greppable: productPathPerformComposeEntrypointClaimed, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, compose-product-plan, Keep in sync with ProductPathComposePlan, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformComposeEntrypointClaimed : Bool := true

/-- productPathPerformComposePartialReady
    Greppable: productPathPerformComposePartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-COMPOSE, product path perform compose, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformComposePartialReady : Bool :=
  productPathPerformReadPartialReady
    && ProductPathComposePlan.productPathPerformComposePartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathPerformComposeDependsOnLake
    && productPathPerformComposeEntrypointClaimed

/-! ### B13 WRITE-HC perform (SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC) -/

/-- productPathPerformWriteHcDependsOnLake
    Greppable: productPathPerformWriteHcDependsOnLake, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, Keep in sync with ProductPathWriteHc (pure Nix scans both literals), SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformWriteHcDependsOnLake : Bool := true

/-- productPathPerformWriteHcEntrypointClaimed
    Greppable: productPathPerformWriteHcEntrypointClaimed, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, write-freestanding-hc, Keep in sync with ProductPathWriteHc, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathPerformWriteHcEntrypointClaimed : Bool := true

/-- productPathPerformWriteHcPartialReady
    Greppable: productPathPerformWriteHcPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-WRITE-HC, product path perform write, SELF-HOST-PRODUCT-PATH-PERFORM, product path perform. -/
def productPathPerformWriteHcPartialReady : Bool :=
  productPathPerformComposePartialReady
    && ProductPathWriteHc.productPathPerformWriteHcPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathPerformWriteHcDependsOnLake
    && productPathPerformWriteHcEntrypointClaimed

/-! ### B14 freestanding-capable gap (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP) -/

/-- productPathFreestandingCapableInstallOnly Greppable: productPathFreestandingCapableInstallOnly, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP. -/
def productPathFreestandingCapableInstallOnly : Bool := true

/-- productPathFreestandingCapableRead Greppable: productPathFreestandingCapableRead. -/
def productPathFreestandingCapableRead : Bool := true

/-- productPathFreestandingCapableCompose Greppable: productPathFreestandingCapableCompose. -/
def productPathFreestandingCapableCompose : Bool := true

/-- productPathFreestandingCapableWriteHc Greppable: productPathFreestandingCapableWriteHc. -/
def productPathFreestandingCapableWriteHc : Bool := true

/-- productPathFreestandingCapableFullPerform Greppable: productPathFreestandingCapableFullPerform. -/
def productPathFreestandingCapableFullPerform : Bool := false

/-- productPathFreestandingCapablePartialReady
    Greppable: productPathFreestandingCapablePartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-GAP, product path freestanding capable gap. -/
def productPathFreestandingCapablePartialReady : Bool :=
  productPathPerformWriteHcPartialReady
    && Capable.productPathFreestandingCapablePartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathFreestandingCapableInstallOnly
    && productPathFreestandingCapableRead
    && !productPathFreestandingCapableFullPerform

/-! ### B15 freestanding-capable step contract Greppable: SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/

/-- productPathFreestandingCapableStepContractAuthorityNotEmit
    Greppable: productPathFreestandingCapableStepContractAuthorityNotEmit, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT. -/
def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true

/-- productPathFreestandingCapableStepContractReadSatisfied Greppable: productPathFreestandingCapableStepContractReadSatisfied, freestandingCapableReadDualSsot. -/
def productPathFreestandingCapableStepContractReadSatisfied : Bool := true

/-- productPathFreestandingCapableStepContractComposeSatisfied Greppable: productPathFreestandingCapableStepContractComposeSatisfied, freestandingCapableComposePlanApplyBody. -/
def productPathFreestandingCapableStepContractComposeSatisfied : Bool := true

/-- productPathFreestandingCapableStepContractWriteHcSatisfied Greppable: productPathFreestandingCapableStepContractWriteHcSatisfied, freestandingCapableWriteFreestandingHc. -/
def productPathFreestandingCapableStepContractWriteHcSatisfied : Bool := true

/-- productPathFreestandingCapableStepContractFullSatisfied Greppable: productPathFreestandingCapableStepContractFullSatisfied. -/
def productPathFreestandingCapableStepContractFullSatisfied : Bool := false

/-- stepContractFull Greppable: stepContractFull. -/
def stepContractFull : Bool := true

/-- productPathFreestandingCapableStepContractPartialReady
    Greppable: productPathFreestandingCapableStepContractPartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT, product path freestanding capable step contract, freestanding-capable-step-contract, slake-freestanding-capable-step-contract, FREESTANDING-CAPABLE-STEP-CONTRACT-READ, FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE, FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC, CapableStepContract. -/
def productPathFreestandingCapableStepContractPartialReady : Bool :=
  productPathFreestandingCapablePartialReady
    && CapableStepContract.productPathFreestandingCapableStepContractPartialReady
    && productPathHostLakeBootstrapRemains
    && productPathFreestandingOwnershipClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && productPathFreestandingCapableStepContractAuthorityNotEmit
    && productPathFreestandingCapableStepContractReadSatisfied
    && productPathFreestandingCapableStepContractComposeSatisfied
    && productPathFreestandingCapableStepContractWriteHcSatisfied
    && !productPathFreestandingCapableStepContractFullSatisfied

/-! ### B16 freestanding-capable READ (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ) Greppable: freestanding-capable-read-lake-free, freestandingCapableReadDualSsot. -/

/-- Entrypoint Greppable: productPathFreestandingCapableReadEntrypointClaimed. -/
def productPathFreestandingCapableReadEntrypointClaimed : Bool := true

/-- Product Greppable: productPathFreestandingCapableReadAuthorityNotEmit. -/
def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true

/-- Lake Greppable: productPathFreestandingCapableReadDependsOnLake, freestanding-capable-read-lake-free. -/
def productPathFreestandingCapableReadDependsOnLake : Bool := true

/-- productPathFreestandingCapableReadPartialReady
    Greppable: productPathFreestandingCapableReadPartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-READ, product path freestanding capable read, freestandingCapableReadDualSsot, freestanding-capable-read, slake-freestanding-capable-read, freestanding-capable-read-lake-free, CapableRead. -/
def productPathFreestandingCapableReadPartialReady : Bool :=
  productPathFreestandingCapableStepContractPartialReady
    && CapableRead.productPathFreestandingCapableReadPartialReady
    && productPathFreestandingCapableReadEntrypointClaimed
    && productPathFreestandingCapableReadAuthorityNotEmit
    && productPathFreestandingCapableReadDependsOnLake
    && productPathFreestandingCapableStepContractReadSatisfied
    && productPathFreestandingCapableRead
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B17 freestanding-capable COMPOSE (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE) Greppable: freestanding-capable-compose-lake-free, freestandingCapableComposePlanApplyBody. -/

/-- Entrypoint Greppable: productPathFreestandingCapableComposeEntrypointClaimed. -/
def productPathFreestandingCapableComposeEntrypointClaimed : Bool := true

/-- Product Greppable: productPathFreestandingCapableComposeAuthorityNotEmit. -/
def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true

/-- Lake Greppable: productPathFreestandingCapableComposeDependsOnLake. -/
def productPathFreestandingCapableComposeDependsOnLake : Bool := true

/-- productPathFreestandingCapableComposePartialReady
    Greppable: productPathFreestandingCapableComposePartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE, product path freestanding capable compose, freestandingCapableComposePlanApplyBody, freestanding-capable-compose, slake-freestanding-capable-compose, freestanding-capable-compose-lake-free, CapableCompose. -/
def productPathFreestandingCapableComposePartialReady : Bool :=
  productPathFreestandingCapableReadPartialReady
    && CapableCompose.productPathFreestandingCapableComposePartialReady
    && productPathFreestandingCapableComposeEntrypointClaimed
    && productPathFreestandingCapableComposeAuthorityNotEmit
    && productPathFreestandingCapableComposeDependsOnLake
    && productPathFreestandingCapableStepContractComposeSatisfied
    && productPathFreestandingCapableCompose
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B18 freestanding-capable WRITE-HC (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC) Greppable: freestanding-capable-write-hc-lake-free, freestandingCapableWriteFreestandingHc. -/

/-- Entrypoint Greppable: productPathFreestandingCapableWriteHcEntrypointClaimed. -/
def productPathFreestandingCapableWriteHcEntrypointClaimed : Bool := true

/-- Product Greppable: productPathFreestandingCapableWriteHcAuthorityNotEmit. -/
def productPathFreestandingCapableWriteHcAuthorityNotEmit : Bool := true

/-- Lake Greppable: productPathFreestandingCapableWriteHcDependsOnLake. -/
def productPathFreestandingCapableWriteHcDependsOnLake : Bool := true

/-- productPathFreestandingCapableWriteHcPartialReady
    Greppable: productPathFreestandingCapableWriteHcPartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-WRITE-HC, product path freestanding capable write, freestandingCapableWriteFreestandingHc, freestanding-capable-write-hc, slake-freestanding-capable-write-hc, freestanding-capable-write-hc-lake-free, CapableWriteHc. -/
def productPathFreestandingCapableWriteHcPartialReady : Bool :=
  productPathFreestandingCapableComposePartialReady
    && CapableWriteHc.productPathFreestandingCapableWriteHcPartialReady
    && productPathFreestandingCapableWriteHcEntrypointClaimed
    && productPathFreestandingCapableWriteHcAuthorityNotEmit
    && productPathFreestandingCapableWriteHcDependsOnLake
    && productPathFreestandingCapableStepContractWriteHcSatisfied
    && productPathFreestandingCapableWriteHc
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B19 freestanding-capable ordered regenerate (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE) Greppable: freestandingCapableOrderedRegenerate. -/

/-- Entrypoint Greppable: productPathFreestandingCapableRegenerateEntrypointClaimed. -/
def productPathFreestandingCapableRegenerateEntrypointClaimed : Bool := true

/-- Product Greppable: productPathFreestandingCapableRegenerateAuthorityNotEmit. -/
def productPathFreestandingCapableRegenerateAuthorityNotEmit : Bool := true

/-- Lake Greppable: productPathFreestandingCapableRegenerateDependsOnLake. -/
def productPathFreestandingCapableRegenerateDependsOnLake : Bool := true

/-- Install Greppable: productPathFreestandingCapableRegenerateInstallOutOpen. -/
def productPathFreestandingCapableRegenerateInstallOutOpen : Bool := false

/-- productPathFreestandingCapableRegeneratePartialReady
    Greppable: productPathFreestandingCapableRegeneratePartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-REGENERATE, product path freestanding capable regenerate, freestandingCapableOrderedRegenerate, freestanding-capable-regenerate, slake-freestanding-capable-regenerate, FREESTANDING-CAPABLE-ORDERED-REGENERATE-PIPELINE, CapableRegenerate. -/
def productPathFreestandingCapableRegeneratePartialReady : Bool :=
  productPathFreestandingCapableWriteHcPartialReady
    && CapableRegenerate.productPathFreestandingCapableRegeneratePartialReady
    && productPathFreestandingCapableRegenerateEntrypointClaimed
    && productPathFreestandingCapableRegenerateAuthorityNotEmit
    && productPathFreestandingCapableRegenerateDependsOnLake
    && !productPathFreestandingCapableRegenerateInstallOutOpen
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B20 freestanding-capable Install Out (SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT) Greppable: freestandingCapableInstallFreestandingOut. -/

/-- Entrypoint Greppable: productPathFreestandingCapableInstallOutEntrypointClaimed. -/
def productPathFreestandingCapableInstallOutEntrypointClaimed : Bool := true

/-- Product Greppable: productPathFreestandingCapableInstallOutAuthorityNotEmit. -/
def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true

/-- Lake Greppable: productPathFreestandingCapableInstallOutDependsOnLake. -/
def productPathFreestandingCapableInstallOutDependsOnLake : Bool := true

/-- productPathFreestandingCapableInstallOutPartialReady
    Greppable: productPathFreestandingCapableInstallOutPartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT, product path freestanding capable install out, freestandingCapableInstallFreestandingOut, freestanding-capable-install-out, slake-freestanding-capable-install-out, FREESTANDING-CAPABLE-INSTALL-OUT, InstallOut. -/
def productPathFreestandingCapableInstallOutPartialReady : Bool :=
  productPathFreestandingCapableRegeneratePartialReady
    && InstallOut.productPathFreestandingCapableInstallOutPartialReady
    && productPathFreestandingCapableInstallOutEntrypointClaimed
    && productPathFreestandingCapableInstallOutAuthorityNotEmit
    && productPathFreestandingCapableInstallOutDependsOnLake
    && !productPathFreestandingCapableRegenerateInstallOutOpen
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B21 freestanding-capable Full bar / ownership-gap measure Greppable: SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR. -/

/-- Step Greppable: productPathFreestandingCapableFullBarStepContractsClosed. -/
def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true

/-- Install Greppable: productPathFreestandingCapableFullBarInstallOutClosed. -/
def productPathFreestandingCapableFullBarInstallOutClosed : Bool := true

/-- Ordered Greppable: productPathFreestandingCapableFullBarOrderedPipelineJoined. -/
def productPathFreestandingCapableFullBarOrderedPipelineJoined : Bool := true

/-- Ownership Greppable: productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake. -/
def productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake : Bool := true

/-- B14 Greppable: productPathFreestandingCapableFullBarCapableLakeFree. -/
def productPathFreestandingCapableFullBarCapableLakeFree : Bool := true

/-- Full-bar Greppable: productPathFreestandingCapableFullBarDependsOnLake. -/
def productPathFreestandingCapableFullBarDependsOnLake : Bool := true

/-- productPathFreestandingCapableFullBarPartialReady
    Greppable: productPathFreestandingCapableFullBarPartialReady, SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-FULL-BAR, product path freestanding capable full bar, freestanding-capable-full-bar, slake-freestanding-capable-full-bar, CapableFullBar. -/
def productPathFreestandingCapableFullBarPartialReady : Bool :=
  productPathFreestandingCapableInstallOutPartialReady
    && CapableFullBar.productPathFreestandingCapableFullBarPartialReady
    && productPathFreestandingCapableFullBarStepContractsClosed
    && productPathFreestandingCapableFullBarInstallOutClosed
    && productPathFreestandingCapableFullBarOrderedPipelineJoined
    && productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake
    && productPathFreestandingCapableFullBarCapableLakeFree
    && productPathFreestandingCapableFullBarDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B22 product path ownership regenerate substrate Greppable: SELF-HOST-PRODUCT-PATH-OWNERSHIP, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE. -/

/-- Install Greppable: productPathOwnershipRegenerateInstallLakeFree. -/
def productPathOwnershipRegenerateInstallLakeFree : Bool := true

/-- READ Greppable: productPathOwnershipRegenerateReadLakeFree. -/
def productPathOwnershipRegenerateReadLakeFree : Bool := true

/-- COMPOSE Greppable: productPathOwnershipRegenerateComposeLakeFree. -/
def productPathOwnershipRegenerateComposeLakeFree : Bool := true

/-- WRITE-HC Greppable: productPathOwnershipRegenerateWriteHcLakeFree. -/
def productPathOwnershipRegenerateWriteHcLakeFree : Bool := true

/-- B29 Greppable: productPathOwnershipRegenerateLakeFreeJoinClaimed. -/
def productPathOwnershipRegenerateLakeFreeJoinClaimed : Bool := true

/-- B30 Greppable: productPathOwnershipRegenerateProductPathAuthorityClaimed. -/
def productPathOwnershipRegenerateProductPathAuthorityClaimed : Bool := true

/-- Full Greppable: productPathOwnershipRegenerateWithoutLake. -/
def productPathOwnershipRegenerateWithoutLake : Bool := true

/-- Overall Greppable: productPathOwnershipRegenerateDependsOnLake. -/
def productPathOwnershipRegenerateDependsOnLake : Bool := true

/-- Lake-free Greppable: productPathOwnershipRegenerateInstallPathClaimed. -/
def productPathOwnershipRegenerateInstallPathClaimed : Bool := true

/-- Lake-free Greppable: productPathOwnershipRegenerateReadPathClaimed. -/
def productPathOwnershipRegenerateReadPathClaimed : Bool := true

/-- Lake-free Greppable: productPathOwnershipRegenerateComposePathClaimed. -/
def productPathOwnershipRegenerateComposePathClaimed : Bool := true

/-- Lake-free Greppable: productPathOwnershipRegenerateWriteHcPathClaimed. -/
def productPathOwnershipRegenerateWriteHcPathClaimed : Bool := true

/-- productPathOwnershipRegeneratePartialReady
    Greppable: productPathOwnershipRegeneratePartialReady, SELF-HOST-PRODUCT-PATH-OWNERSHIP-REGENERATE, product path ownership regenerate, ProductPathOwnershipRegenerate, SELF-HOST-PRODUCT-PATH-OWNERSHIP. -/
def productPathOwnershipRegeneratePartialReady : Bool :=
  productPathFreestandingCapableFullBarPartialReady
    && ProductPathOwnershipRegenerate.productPathOwnershipRegeneratePartialReady
    && productPathOwnershipRegenerateInstallLakeFree
    && productPathOwnershipRegenerateInstallPathClaimed
    && productPathOwnershipRegenerateReadLakeFree
    && productPathOwnershipRegenerateReadPathClaimed
    && productPathOwnershipRegenerateComposeLakeFree
    && productPathOwnershipRegenerateComposePathClaimed
    && productPathOwnershipRegenerateWriteHcLakeFree
    && productPathOwnershipRegenerateWriteHcPathClaimed
    && productPathOwnershipRegenerateLakeFreeJoinClaimed
    && productPathOwnershipRegenerateProductPathAuthorityClaimed
    && productPathOwnershipRegenerateWithoutLake
    && productPathOwnershipRegenerateDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingPerformClaimed
    && productPathFreestandingOwnershipClaimed

/-! ### B31 freestanding product path perform evidence Greppable: SELF-HOST-PRODUCT-PATH-PERFORM, SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE. -/

/-- B31 Greppable: productPathFreestandingPerformEvidenceClaimed. -/
def productPathFreestandingPerformEvidenceClaimed : Bool := true

/-- productPathFreestandingPerformEvidencePartialReady
    Greppable: productPathFreestandingPerformEvidencePartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE, product path freestanding perform evidence, PerformEvidence, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathFreestandingPerformEvidencePartialReady : Bool :=
  productPathOwnershipRegeneratePartialReady
    && PerformEvidence.productPathFreestandingPerformEvidencePartialReady
    && productPathFreestandingPerformEvidenceClaimed
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingOwnershipClaimed

/-! ### SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH (B32 partial) -/

/-- B32 Greppable: productPathFreestandingPerformOfficialPathGapMeasured. -/
def productPathFreestandingPerformOfficialPathGapMeasured : Bool := true

/-- Official path FreestandingEmit writer retired (living tip after B38). -/
def productPathOfficialPathStillUsesFreestandingEmit : Bool := false

/-- Official product path no longer uses Lake as living driver (M6).
    Host elaborator residual may remain for SystemsLean development. -/
def productPathOfficialPathStillUsesLake : Bool := false

/-- FreestandingEmit retire-required cleared (living tip after B38). -/
def productPathOfficialPathRetireFreestandingEmitRequired : Bool := false

/-- productPathFreestandingPerformOfficialPathPartialReady
    Greppable: productPathFreestandingPerformOfficialPathPartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH, product path freestanding perform official path, OfficialPath, SELF-HOST-PRODUCT-PATH-PERFORM. -/
def productPathFreestandingPerformOfficialPathPartialReady : Bool :=
  productPathFreestandingPerformEvidencePartialReady
    && OfficialPath.productPathFreestandingPerformOfficialPathPartialReady
    && productPathFreestandingPerformOfficialPathGapMeasured
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && !productPathOfficialPathStillUsesFreestandingEmit
    && !productPathOfficialPathStillUsesLake
    && !productPathOfficialPathRetireFreestandingEmitRequired
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingOwnershipClaimed

/-! ### SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE (B33 partial) -/

/-- B33 Greppable: productPathFreestandingPerformOfficialPathAlternateMeasured. -/
def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true

/-- freestanding-capable ordered regenerate exists as alternate non-emit writer. -/
def productPathOfficialPathAlternateWriterPresent : Bool := true

/-- Alternate is wired as official just build (living tip after B38). -/
def productPathOfficialPathAlternateNotOfficial : Bool := false

/-- Dual-equality -/
def productPathOfficialPathDualEqualityBlocksRetirement : Bool := false

/-- productPathFreestandingPerformOfficialPathAlternatePartialReady
    Greppable: productPathFreestandingPerformOfficialPathAlternatePartialReady, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH-ALTERNATE, product path freestanding perform official path alternate, OfficialPathAlternate, SELF-HOST-PRODUCT-PATH-PERFORM, SELF-HOST-PRODUCT-PATH-PERFORM-OFFICIAL-PATH. -/
def productPathFreestandingPerformOfficialPathAlternatePartialReady : Bool :=
  productPathFreestandingPerformOfficialPathPartialReady
    && OfficialPathAlternate.productPathFreestandingPerformOfficialPathAlternatePartialReady
    && productPathFreestandingPerformOfficialPathAlternateMeasured
    && productPathOfficialPathAlternateWriterPresent
    && !productPathOfficialPathAlternateNotOfficial
    && !productPathOfficialPathDualEqualityBlocksRetirement
    && productPathFreestandingPerformClaimed
    && !productPathPerformDependsOnLake
    && !productPathOfficialPathStillUsesFreestandingEmit
    && !productPathOfficialPathStillUsesLake
    && !productPathOfficialPathRetireFreestandingEmitRequired
    && !productPathFreestandingCapableStepContractFullSatisfied
    && productPathFreestandingOwnershipClaimed

/-- Full SH5 freestanding deepen inventory ok. -/
def selfApplyFsOk : Bool := freestandingSelfApplyReady

/-- Theorems/smoke bodies in SelfApplyFsTheorems. Greppable: SELF-APPLY-FS-THEOREM, HOST-SELF-APPLY-FS-THEOREM, SELF-APPLY-FS-SMOKE, HOST-SELF-APPLY-FS-SMOKE, SelfApplyFsTheorems. -/
def selfApplyFsTheoremsModuleCite : String := "SystemsLean.SelfApplyFsTheorems"

/-- Close-path PartialReady folds in SelfApplyFsClose. Greppable: SelfApplyFsClose, SELF-APPLY-FS-CLOSE. -/
def selfApplyFsCloseModuleCite : String := "SystemsLean.SelfApplyFsClose"

end SystemsLean.SelfApplyFs
"#

end SystemsLean.HostFrontLiveSelfApplyFs
