/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckPackageElab.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageElabSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckPackageElab.lean.
  It is not HostModuleCheck and not HostFront.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveHostModuleCheckPackageElabSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEELAB, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageElabSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageElab

/-- Dual-pinned live HostModuleCheckPackageElab.lean bytes
    (must match the on-disk file).
    Greppable: liveHostModuleCheckPackageElabSource,
    HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEELAB. -/
def liveHostModuleCheckPackageElabSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 inventory dual-ok bands.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: package-scope inventory dialects for Mult..Extract
  foundation (first band), MultLinearTypes PROOF package (second band), and
  Kernel/Emit/Parity FOUNDATION-KIND-SURFACE package (third band). Multi-module
  package environment judgment dialect lives in HostModuleCheckPackageEnv
  (MultLinearTypesProgramGraphComposeEnv-only; FullHost meet H2).
  Same namespace SystemsLean.HostModuleCheck.

  Package L4 first band: MultExtractFoundation inventory + TERM.
  Package L4 PROOF band: MultLinearTypesProof inventory + PROOF.
  Package L4 Kernel band: KernelEmitParity inventory + kind-surface.
  Shared: packageInventoryHas + checkDepthPackageElaborateBar for PackageEnv.

  Dual-ok honesty: DualOk pins are named claims; gate truth is *Ok folds.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12 on full seed library.
  - Not FullHostElaborateRemains re-true. Not mathlib.
  - Unit TERM Mult..Extract + PROOF Mult/Linear/Types dual-ok unchanged.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckPackageElab,
  PACKAGE-ELABORATE, MultExtractFoundation-only, MultLinearTypesProof-only,
  KernelEmitParity-only, PACKAGE-BAND-INCOMPLETE, checkPackageFoundationDialect,
  checkPackageProofDialect, checkPackageKernelDialect,
  packageElaborateFirstBand, packageElaborateProofBand,
  packageElaborateKernelBand,
  hostModuleCheckPackageElaborateFirstBandDualOk,
  hostModuleCheckPackageElaborateFirstBandOk,
  hostModuleCheckPackageElaborateProofBandDualOk,
  hostModuleCheckPackageElaborateProofBandOk,
  hostModuleCheckPackageElaborateKernelBandDualOk,
  hostModuleCheckPackageElaborateKernelBandOk,
  hostModuleCheckGoodPackageFoundationText,
  hostModuleCheckBadPackageMissingExtractText,
  hostModuleCheckBadPackageNotReadyText,
  hostModuleCheckGoodPackageProofText,
  hostModuleCheckBadPackageMissingTypesProofText,
  hostModuleCheckBadPackageProofNotReadyText,
  hostModuleCheckGoodPackageKernelText,
  hostModuleCheckBadPackageMissingParityEmitText,
  hostModuleCheckBadPackageKernelNotReadyText,
  packageInventoryHas, checkDepthPackageElaborateBar,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageElab
  Red/green: lake build SystemsLean.HostModuleCheckPackageElab;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSeeds
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckMultTerm
import SystemsLean.HostModuleCheckLinearTerm
import SystemsLean.HostModuleCheckTypesTerm
import SystemsLean.HostModuleCheckIrProgramTerm
import SystemsLean.HostModuleCheckIrGraphTerm
import SystemsLean.HostModuleCheckHostComposeTerm
import SystemsLean.HostModuleCheckErasureTerm
import SystemsLean.HostModuleCheckExtractTerm
import SystemsLean.HostModuleCheckMultProof
import SystemsLean.HostModuleCheckLinearProof
import SystemsLean.HostModuleCheckTypesProof

namespace SystemsLean.HostModuleCheck

/-! ### Package elaborate L4 first-band dual-ok pins -/

/-- Named package elaborate depth bar (judgments design L4).
    Greppable: checkDepthPackageElaborateBar, PACKAGE-ELABORATE. -/
def checkDepthPackageElaborateBar : String := "PACKAGE-ELABORATE"

/-- Honesty scope: Mult..Extract foundation package band only (not full seed).
    Greppable: checkDepthPackageElaborateScope, MultExtractFoundation-only,
    PACKAGE-ELABORATE. -/
def checkDepthPackageElaborateScope : String := "MultExtractFoundation-only"

/-- Dual-ok when package first-band E-good/E-bad rejects work (partial L4).
    Greppable: hostModuleCheckPackageElaborateFirstBandDualOk, PACKAGE-ELABORATE,
    MultExtractFoundation-only, packageElaborateFirstBand. -/
def hostModuleCheckPackageElaborateFirstBandDualOk : Bool := true

/-- Package-band incomplete reject reason (package-scope; not ILL-TYPED-TERM).
    Greppable: reasonPackageBandIncomplete, PACKAGE-BAND-INCOMPLETE. -/
def reasonPackageBandIncomplete : String := "PACKAGE-BAND-INCOMPLETE"

/-! ### Package foundation inventory dialect (first band) -/

/-- True when content contains needle as a substring.
    Greppable: packageInventoryHas, PACKAGE-ELABORATE. -/
def packageInventoryHas (content needle : String) : Bool :=
  (content.splitOn needle).length > 1

/-- Required foundation unit lines (Mult..Extract TERM dual-ok markers).
    Greppable: packageFoundationUnitMarkers, MultExtractFoundation-only. -/
def packageFoundationUnitMarkers : List String :=
  [ "unit Mult TERM-SURFACE dualOk"
  , "unit Linear TERM-SURFACE dualOk"
  , "unit Types TERM-SURFACE dualOk"
  , "unit IrProgram TERM-SURFACE dualOk"
  , "unit IrGraph TERM-SURFACE dualOk"
  , "unit HostCompose TERM-SURFACE dualOk"
  , "unit Erasure TERM-SURFACE dualOk"
  , "unit Extract TERM-SURFACE dualOk"
  ]

/-- All foundation unit markers present.
    Greppable: packageFoundationUnitsOk, MultExtractFoundation-only. -/
def packageFoundationUnitsOk (content : String) : Bool :=
  packageFoundationUnitMarkers.all (fun m => packageInventoryHas content m)

/-- Package foundation inventory dialect: complete Mult..Extract package band.
    Returns none when ok; some reasonPackageBandIncomplete when incomplete.
    Greppable: checkPackageFoundationDialect, PACKAGE-ELABORATE,
    PACKAGE-BAND-INCOMPLETE. -/
def checkPackageFoundationDialect (content : String) : Option String :=
  if !packageInventoryHas content "packageBand: Mult..Extract-foundation" then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageElaborateBar: PACKAGE-ELABORATE" then
    some reasonPackageBandIncomplete
  else if !packageFoundationUnitsOk content then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageFirstBandReady: true" then
    some reasonPackageBandIncomplete
  else
    none

/-- L0 package token floor: packageBand + PACKAGE-ELABORATE present only.
    Incomplete unit lists still pass (gap E-bad must reject).
    Greppable: checkPackageFoundationL0, PACKAGE-ELABORATE. -/
def checkPackageFoundationL0 (content : String) : Bool :=
  packageInventoryHas content "packageBand:"
    && packageInventoryHas content "PACKAGE-ELABORATE"

/-! ### Fixtures (E-good / E-bad) first band -/

/-- E-good: complete Mult..Extract foundation package inventory.
    Greppable: hostModuleCheckGoodPackageFoundationText, PACKAGE-ELABORATE. -/
def hostModuleCheckGoodPackageFoundationText : String :=
  "packageBand: Mult..Extract-foundation\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit Mult TERM-SURFACE dualOk\n" ++
  "unit Linear TERM-SURFACE dualOk\n" ++
  "unit Types TERM-SURFACE dualOk\n" ++
  "unit IrProgram TERM-SURFACE dualOk\n" ++
  "unit IrGraph TERM-SURFACE dualOk\n" ++
  "unit HostCompose TERM-SURFACE dualOk\n" ++
  "unit Erasure TERM-SURFACE dualOk\n" ++
  "unit Extract TERM-SURFACE dualOk\n" ++
  "packageFirstBandReady: true\n"

/-- E-bad PB1: missing Extract unit line (L0 still accepts package tokens).
    Greppable: hostModuleCheckBadPackageMissingExtractText, PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingExtractText : String :=
  "packageBand: Mult..Extract-foundation\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit Mult TERM-SURFACE dualOk\n" ++
  "unit Linear TERM-SURFACE dualOk\n" ++
  "unit Types TERM-SURFACE dualOk\n" ++
  "unit IrProgram TERM-SURFACE dualOk\n" ++
  "unit IrGraph TERM-SURFACE dualOk\n" ++
  "unit HostCompose TERM-SURFACE dualOk\n" ++
  "unit Erasure TERM-SURFACE dualOk\n" ++
  "packageFirstBandReady: true\n"

/-- E-bad PB2: packageFirstBandReady false (L0 still accepts package tokens).
    Greppable: hostModuleCheckBadPackageNotReadyText, PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageNotReadyText : String :=
  "packageBand: Mult..Extract-foundation\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit Mult TERM-SURFACE dualOk\n" ++
  "unit Linear TERM-SURFACE dualOk\n" ++
  "unit Types TERM-SURFACE dualOk\n" ++
  "unit IrProgram TERM-SURFACE dualOk\n" ++
  "unit IrGraph TERM-SURFACE dualOk\n" ++
  "unit HostCompose TERM-SURFACE dualOk\n" ++
  "unit Erasure TERM-SURFACE dualOk\n" ++
  "unit Extract TERM-SURFACE dualOk\n" ++
  "packageFirstBandReady: false\n"

/-! ### Dual-pin evidence folds (first band) -/

/-- Living Mult..Extract TERM SurfaceOk conjunction (package-scope evidence).
    Greppable: packageFoundationTermSurfaceOk, MultExtractFoundation-only. -/
def packageFoundationTermSurfaceOk : Bool :=
  hostModuleCheckMultTermSurfaceOk
    && hostModuleCheckLinearTermSurfaceOk
    && hostModuleCheckTypesTermSurfaceOk
    && hostModuleCheckIrProgramTermSurfaceOk
    && hostModuleCheckIrGraphTermSurfaceOk
    && hostModuleCheckHostComposeTermSurfaceOk
    && hostModuleCheckErasureTermSurfaceOk
    && hostModuleCheckExtractTermSurfaceOk

/-- Dialect-only good path.
    Greppable: hostModuleCheckPackageFoundationDialectOk, PACKAGE-ELABORATE. -/
def hostModuleCheckPackageFoundationDialectOk : Bool :=
  (checkPackageFoundationDialect
    hostModuleCheckGoodPackageFoundationText).isNone

/-- Dialect rejects PB1 missing Extract.
    Greppable: hostModuleCheckBadPackageMissingExtractDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingExtractDialectReject : Bool :=
  match checkPackageFoundationDialect
      hostModuleCheckBadPackageMissingExtractText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- Dialect rejects PB2 not ready.
    Greppable: hostModuleCheckBadPackageNotReadyDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageNotReadyDialectReject : Bool :=
  match checkPackageFoundationDialect hostModuleCheckBadPackageNotReadyText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- L0 still accepts PB1.
    Greppable: hostModuleCheckBadPackageMissingExtractL0Accept, PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageMissingExtractL0Accept : Bool :=
  checkPackageFoundationL0 hostModuleCheckBadPackageMissingExtractText

/-- L0 still accepts PB2.
    Greppable: hostModuleCheckBadPackageNotReadyL0Accept, PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageNotReadyL0Accept : Bool :=
  checkPackageFoundationL0 hostModuleCheckBadPackageNotReadyText

/-- Combined package L4 first-band dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckPackageElaborateFirstBandOk, PACKAGE-ELABORATE,
    MultExtractFoundation-only, packageElaborateFirstBand. -/
def hostModuleCheckPackageElaborateFirstBandOk : Bool :=
  hostModuleCheckPackageElaborateFirstBandDualOk
    && (checkDepthPackageElaborateBar == "PACKAGE-ELABORATE")
    && (checkDepthPackageElaborateScope == "MultExtractFoundation-only")
    && packageFoundationTermSurfaceOk
    && hostModuleCheckPackageFoundationDialectOk
    && hostModuleCheckBadPackageMissingExtractDialectReject
    && hostModuleCheckBadPackageNotReadyDialectReject
    && hostModuleCheckBadPackageMissingExtractL0Accept
    && hostModuleCheckBadPackageNotReadyL0Accept

/-- Compact theorems live here so HostModuleCheckTheorems stays Sub-1-KLOC.
    Greppable: hostModuleCheckPackageElaborateFirstBandOk_true, PACKAGE-ELABORATE. -/
theorem hostModuleCheckPackageElaborateFirstBandOk_true :
    hostModuleCheckPackageElaborateFirstBandOk = true := by native_decide

theorem hostModuleCheck_package_elaborate_first_band_ids_eq :
    checkDepthPackageElaborateBar = "PACKAGE-ELABORATE"
      && checkDepthPackageElaborateScope = "MultExtractFoundation-only"
      && hostModuleCheckPackageElaborateFirstBandDualOk = true := rfl

/-! ### Package elaborate L4 PROOF band dual-ok pins -/

/-- Honesty scope: MultTheorems+LinearTheorems+TypesTheorems PROOF package band.
    Greppable: checkDepthPackageElaborateProofScope, MultLinearTypesProof-only,
    PACKAGE-ELABORATE. -/
def checkDepthPackageElaborateProofScope : String := "MultLinearTypesProof-only"

/-- Dual-ok when package PROOF-band E-good/E-bad rejects work (partial L4).
    Greppable: hostModuleCheckPackageElaborateProofBandDualOk, PACKAGE-ELABORATE,
    MultLinearTypesProof-only, packageElaborateProofBand. -/
def hostModuleCheckPackageElaborateProofBandDualOk : Bool := true

/-! ### Package proof inventory dialect (PROOF band) -/

/-- Required PROOF unit lines (Mult/Linear/Types Theorems dual-ok markers).
    Greppable: packageProofUnitMarkers, MultLinearTypesProof-only. -/
def packageProofUnitMarkers : List String :=
  [ "unit MultTheorems PROOF-SURFACE dualOk"
  , "unit LinearTheorems PROOF-SURFACE dualOk"
  , "unit TypesTheorems PROOF-SURFACE dualOk"
  ]

/-- All PROOF unit markers present.
    Greppable: packageProofUnitsOk, MultLinearTypesProof-only. -/
def packageProofUnitsOk (content : String) : Bool :=
  packageProofUnitMarkers.all (fun m => packageInventoryHas content m)

/-- Package proof inventory dialect: MultLinearTypes PROOF package band.
    Returns none when ok; some reasonPackageBandIncomplete when incomplete.
    Greppable: checkPackageProofDialect, PACKAGE-ELABORATE,
    PACKAGE-BAND-INCOMPLETE, MultLinearTypesProof-only. -/
def checkPackageProofDialect (content : String) : Option String :=
  if !packageInventoryHas content "packageBand: MultLinearTypes-proof" then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageElaborateBar: PACKAGE-ELABORATE" then
    some reasonPackageBandIncomplete
  else if !packageProofUnitsOk content then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageProofBandReady: true" then
    some reasonPackageBandIncomplete
  else
    none

/-- L0 package token floor for proof fixtures (same package tokens as foundation).
    Incomplete unit lists still pass (gap E-bad must reject).
    Greppable: checkPackageProofL0, PACKAGE-ELABORATE. -/
def checkPackageProofL0 (content : String) : Bool :=
  packageInventoryHas content "packageBand:"
    && packageInventoryHas content "PACKAGE-ELABORATE"

/-! ### Fixtures (E-good / E-bad) PROOF band -/

/-- E-good: complete MultLinearTypes PROOF package inventory.
    Greppable: hostModuleCheckGoodPackageProofText, PACKAGE-ELABORATE,
    MultLinearTypesProof-only. -/
def hostModuleCheckGoodPackageProofText : String :=
  "packageBand: MultLinearTypes-proof\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit MultTheorems PROOF-SURFACE dualOk\n" ++
  "unit LinearTheorems PROOF-SURFACE dualOk\n" ++
  "unit TypesTheorems PROOF-SURFACE dualOk\n" ++
  "packageProofBandReady: true\n"

/-- E-bad PP1: missing TypesTheorems unit line (L0 still accepts package tokens).
    Greppable: hostModuleCheckBadPackageMissingTypesProofText,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingTypesProofText : String :=
  "packageBand: MultLinearTypes-proof\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit MultTheorems PROOF-SURFACE dualOk\n" ++
  "unit LinearTheorems PROOF-SURFACE dualOk\n" ++
  "packageProofBandReady: true\n"

/-- E-bad PP2: packageProofBandReady false (L0 still accepts package tokens).
    Greppable: hostModuleCheckBadPackageProofNotReadyText,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageProofNotReadyText : String :=
  "packageBand: MultLinearTypes-proof\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit MultTheorems PROOF-SURFACE dualOk\n" ++
  "unit LinearTheorems PROOF-SURFACE dualOk\n" ++
  "unit TypesTheorems PROOF-SURFACE dualOk\n" ++
  "packageProofBandReady: false\n"

/-! ### Dual-pin evidence folds (PROOF band) -/

/-- Living Mult/Linear/Types PROOF SurfaceOk conjunction (package-scope evidence).
    Greppable: packageProofSurfaceOk, MultLinearTypesProof-only. -/
def packageProofSurfaceOk : Bool :=
  hostModuleCheckMultProofSurfaceOk
    && hostModuleCheckLinearProofSurfaceOk
    && hostModuleCheckTypesProofSurfaceOk

/-- Dialect-only good path for PROOF package.
    Greppable: hostModuleCheckPackageProofDialectOk, PACKAGE-ELABORATE. -/
def hostModuleCheckPackageProofDialectOk : Bool :=
  (checkPackageProofDialect hostModuleCheckGoodPackageProofText).isNone

/-- Dialect rejects PP1 missing TypesTheorems.
    Greppable: hostModuleCheckBadPackageMissingTypesProofDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingTypesProofDialectReject : Bool :=
  match checkPackageProofDialect
      hostModuleCheckBadPackageMissingTypesProofText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- Dialect rejects PP2 not ready.
    Greppable: hostModuleCheckBadPackageProofNotReadyDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageProofNotReadyDialectReject : Bool :=
  match checkPackageProofDialect hostModuleCheckBadPackageProofNotReadyText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- L0 still accepts PP1.
    Greppable: hostModuleCheckBadPackageMissingTypesProofL0Accept,
    PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageMissingTypesProofL0Accept : Bool :=
  checkPackageProofL0 hostModuleCheckBadPackageMissingTypesProofText

/-- L0 still accepts PP2.
    Greppable: hostModuleCheckBadPackageProofNotReadyL0Accept, PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageProofNotReadyL0Accept : Bool :=
  checkPackageProofL0 hostModuleCheckBadPackageProofNotReadyText

/-- Combined package L4 PROOF-band dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckPackageElaborateProofBandOk, PACKAGE-ELABORATE,
    MultLinearTypesProof-only, packageElaborateProofBand. -/
def hostModuleCheckPackageElaborateProofBandOk : Bool :=
  hostModuleCheckPackageElaborateProofBandDualOk
    && (checkDepthPackageElaborateBar == "PACKAGE-ELABORATE")
    && (checkDepthPackageElaborateProofScope == "MultLinearTypesProof-only")
    && packageProofSurfaceOk
    && hostModuleCheckPackageProofDialectOk
    && hostModuleCheckBadPackageMissingTypesProofDialectReject
    && hostModuleCheckBadPackageProofNotReadyDialectReject
    && hostModuleCheckBadPackageMissingTypesProofL0Accept
    && hostModuleCheckBadPackageProofNotReadyL0Accept

/-- Compact theorems for PROOF band (Sub-1-KLOC HostModuleCheckTheorems).
    Greppable: hostModuleCheckPackageElaborateProofBandOk_true, PACKAGE-ELABORATE. -/
theorem hostModuleCheckPackageElaborateProofBandOk_true :
    hostModuleCheckPackageElaborateProofBandOk = true := by native_decide

theorem hostModuleCheck_package_elaborate_proof_band_ids_eq :
    checkDepthPackageElaborateBar = "PACKAGE-ELABORATE"
      && checkDepthPackageElaborateProofScope = "MultLinearTypesProof-only"
      && hostModuleCheckPackageElaborateProofBandDualOk = true := rfl

/-! ### Package elaborate L4 Kernel/Emit/Parity band dual-ok pins -/

/-- Honesty scope: Kernel Mult..Emit + EmitPlan/Apply/Body + Parity Mult..Emit
    FOUNDATION-KIND-SURFACE package band only (not full seed).
    Greppable: checkDepthPackageElaborateKernelScope, KernelEmitParity-only,
    PACKAGE-ELABORATE. -/
def checkDepthPackageElaborateKernelScope : String := "KernelEmitParity-only"

/-- Dual-ok when package Kernel-band E-good/E-bad rejects work (partial L4).
    Greppable: hostModuleCheckPackageElaborateKernelBandDualOk, PACKAGE-ELABORATE,
    KernelEmitParity-only, packageElaborateKernelBand. -/
def hostModuleCheckPackageElaborateKernelBandDualOk : Bool := true

/-! ### Package Kernel/Emit/Parity inventory dialect (kind-surface band) -/

/-- Required Kernel/Emit/Parity unit lines (FOUNDATION-KIND-SURFACE dual-ok).
    Greppable: packageKernelEmitParityUnitMarkers, KernelEmitParity-only. -/
def packageKernelEmitParityUnitMarkers : List String :=
  [ "unit KernelMult FOUNDATION-KIND-SURFACE dualOk"
  , "unit KernelLinear FOUNDATION-KIND-SURFACE dualOk"
  , "unit KernelTypes FOUNDATION-KIND-SURFACE dualOk"
  , "unit KernelProgram FOUNDATION-KIND-SURFACE dualOk"
  , "unit KernelEmit FOUNDATION-KIND-SURFACE dualOk"
  , "unit EmitPlan FOUNDATION-KIND-SURFACE dualOk"
  , "unit EmitApply FOUNDATION-KIND-SURFACE dualOk"
  , "unit EmitBody FOUNDATION-KIND-SURFACE dualOk"
  , "unit ParityMult FOUNDATION-KIND-SURFACE dualOk"
  , "unit ParityLinear FOUNDATION-KIND-SURFACE dualOk"
  , "unit ParityTypes FOUNDATION-KIND-SURFACE dualOk"
  , "unit ParityProgram FOUNDATION-KIND-SURFACE dualOk"
  , "unit ParityEmit FOUNDATION-KIND-SURFACE dualOk"
  ]

/-- All Kernel/Emit/Parity unit markers present.
    Greppable: packageKernelEmitParityUnitsOk, KernelEmitParity-only. -/
def packageKernelEmitParityUnitsOk (content : String) : Bool :=
  packageKernelEmitParityUnitMarkers.all (fun m => packageInventoryHas content m)

/-- Package Kernel/Emit/Parity inventory dialect.
    Returns none when ok; some reasonPackageBandIncomplete when incomplete.
    Greppable: checkPackageKernelDialect, PACKAGE-ELABORATE,
    PACKAGE-BAND-INCOMPLETE, KernelEmitParity-only. -/
def checkPackageKernelDialect (content : String) : Option String :=
  if !packageInventoryHas content "packageBand: KernelEmitParity-kind" then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageElaborateBar: PACKAGE-ELABORATE" then
    some reasonPackageBandIncomplete
  else if !packageKernelEmitParityUnitsOk content then
    some reasonPackageBandIncomplete
  else if !packageInventoryHas content "packageKernelEmitParityBandReady: true" then
    some reasonPackageBandIncomplete
  else
    none

/-- L0 package token floor for Kernel fixtures (same package tokens as other bands).
    Incomplete unit lists still pass (gap E-bad must reject).
    Greppable: checkPackageKernelL0, PACKAGE-ELABORATE. -/
def checkPackageKernelL0 (content : String) : Bool :=
  packageInventoryHas content "packageBand:"
    && packageInventoryHas content "PACKAGE-ELABORATE"

/-! ### Fixtures (E-good / E-bad) Kernel/Emit/Parity band -/

/-- E-good: complete Kernel/Emit/Parity FOUNDATION-KIND-SURFACE package inventory.
    Greppable: hostModuleCheckGoodPackageKernelText, PACKAGE-ELABORATE,
    KernelEmitParity-only. -/
def hostModuleCheckGoodPackageKernelText : String :=
  "packageBand: KernelEmitParity-kind\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit KernelMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelEmit FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitPlan FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitApply FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitBody FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityEmit FOUNDATION-KIND-SURFACE dualOk\n" ++
  "packageKernelEmitParityBandReady: true\n"

/-- E-bad PK1: missing ParityEmit unit line (L0 still accepts package tokens).
    Greppable: hostModuleCheckBadPackageMissingParityEmitText,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingParityEmitText : String :=
  "packageBand: KernelEmitParity-kind\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit KernelMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelEmit FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitPlan FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitApply FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitBody FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "packageKernelEmitParityBandReady: true\n"

/-- E-bad PK2: packageKernelEmitParityBandReady false (L0 still accepts).
    Greppable: hostModuleCheckBadPackageKernelNotReadyText,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageKernelNotReadyText : String :=
  "packageBand: KernelEmitParity-kind\n" ++
  "packageElaborateBar: PACKAGE-ELABORATE\n" ++
  "unit KernelMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit KernelEmit FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitPlan FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitApply FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit EmitBody FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityMult FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityLinear FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityTypes FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityProgram FOUNDATION-KIND-SURFACE dualOk\n" ++
  "unit ParityEmit FOUNDATION-KIND-SURFACE dualOk\n" ++
  "packageKernelEmitParityBandReady: false\n"

/-! ### Dual-pin evidence folds (Kernel/Emit/Parity band) -/

/-- Living FOUNDATION-KIND-SURFACE deepen band includes Kernel/Emit/Parity units.
    Greppable: packageKernelEmitParityKindSurfaceOk, KernelEmitParity-only,
    FOUNDATION-KIND-SURFACE. -/
def packageKernelEmitParityKindSurfaceOk : Bool :=
  (checkDepthDeepenBar == "FOUNDATION-KIND-SURFACE")
    && packageInventoryHas checkDepthDeepenBand "KernelMult"
    && packageInventoryHas checkDepthDeepenBand "KernelLinear"
    && packageInventoryHas checkDepthDeepenBand "KernelTypes"
    && packageInventoryHas checkDepthDeepenBand "KernelProgram"
    && packageInventoryHas checkDepthDeepenBand "KernelEmit"
    && packageInventoryHas checkDepthDeepenBand "EmitPlan"
    && packageInventoryHas checkDepthDeepenBand "EmitApply"
    && packageInventoryHas checkDepthDeepenBand "EmitBody"
    && packageInventoryHas checkDepthDeepenBand "ParityMult"
    && packageInventoryHas checkDepthDeepenBand "ParityLinear"
    && packageInventoryHas checkDepthDeepenBand "ParityTypes"
    && packageInventoryHas checkDepthDeepenBand "ParityProgram"
    && packageInventoryHas checkDepthDeepenBand "ParityEmit"

/-- Dialect-only good path for Kernel/Emit/Parity package.
    Greppable: hostModuleCheckPackageKernelDialectOk, PACKAGE-ELABORATE. -/
def hostModuleCheckPackageKernelDialectOk : Bool :=
  (checkPackageKernelDialect hostModuleCheckGoodPackageKernelText).isNone

/-- Dialect rejects PK1 missing ParityEmit.
    Greppable: hostModuleCheckBadPackageMissingParityEmitDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageMissingParityEmitDialectReject : Bool :=
  match checkPackageKernelDialect
      hostModuleCheckBadPackageMissingParityEmitText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- Dialect rejects PK2 not ready.
    Greppable: hostModuleCheckBadPackageKernelNotReadyDialectReject,
    PACKAGE-BAND-INCOMPLETE. -/
def hostModuleCheckBadPackageKernelNotReadyDialectReject : Bool :=
  match checkPackageKernelDialect hostModuleCheckBadPackageKernelNotReadyText with
  | some r => r == reasonPackageBandIncomplete
  | none => false

/-- L0 still accepts PK1.
    Greppable: hostModuleCheckBadPackageMissingParityEmitL0Accept,
    PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageMissingParityEmitL0Accept : Bool :=
  checkPackageKernelL0 hostModuleCheckBadPackageMissingParityEmitText

/-- L0 still accepts PK2.
    Greppable: hostModuleCheckBadPackageKernelNotReadyL0Accept, PACKAGE-ELABORATE. -/
def hostModuleCheckBadPackageKernelNotReadyL0Accept : Bool :=
  checkPackageKernelL0 hostModuleCheckBadPackageKernelNotReadyText

/-- Combined package L4 Kernel-band dual-pin gate (not bare dualOk alone).
    Greppable: hostModuleCheckPackageElaborateKernelBandOk, PACKAGE-ELABORATE,
    KernelEmitParity-only, packageElaborateKernelBand. -/
def hostModuleCheckPackageElaborateKernelBandOk : Bool :=
  hostModuleCheckPackageElaborateKernelBandDualOk
    && (checkDepthPackageElaborateBar == "PACKAGE-ELABORATE")
    && (checkDepthPackageElaborateKernelScope == "KernelEmitParity-only")
    && packageKernelEmitParityKindSurfaceOk
    && hostModuleCheckPackageKernelDialectOk
    && hostModuleCheckBadPackageMissingParityEmitDialectReject
    && hostModuleCheckBadPackageKernelNotReadyDialectReject
    && hostModuleCheckBadPackageMissingParityEmitL0Accept
    && hostModuleCheckBadPackageKernelNotReadyL0Accept

/-- Compact theorems for Kernel band (Sub-1-KLOC HostModuleCheckTheorems).
    Greppable: hostModuleCheckPackageElaborateKernelBandOk_true, PACKAGE-ELABORATE. -/
theorem hostModuleCheckPackageElaborateKernelBandOk_true :
    hostModuleCheckPackageElaborateKernelBandOk = true := by native_decide

theorem hostModuleCheck_package_elaborate_kernel_band_ids_eq :
    checkDepthPackageElaborateBar = "PACKAGE-ELABORATE"
      && checkDepthPackageElaborateKernelScope = "KernelEmitParity-only"
      && hostModuleCheckPackageElaborateKernelBandDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckPackageElab
