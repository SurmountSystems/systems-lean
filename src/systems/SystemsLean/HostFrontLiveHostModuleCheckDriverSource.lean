/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckDriver.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckDriverSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckDriver.lean only, first half.
  Do not steal a neighbor checker.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKDRIVER,
  liveHostModuleCheckDriverSource0, HOST-FRONT-LIVE-HOSTMODULECHECKDRIVER,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckDriverSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckDriver

/-- Dual-pinned live HostModuleCheckDriver.lean bytes, first half.
    Concatenate liveHostModuleCheckDriverSource0 then
    liveHostModuleCheckDriverSource1 before parse.
    Greppable: liveHostModuleCheckDriverSource0,
    PARSE-LIVE-HOSTMODULECHECKDRIVER. -/
def liveHostModuleCheckDriverSource0 : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck driver IO (runModuleCheck / main).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Same namespace SystemsLean.HostModuleCheck. PARTIAL-STRUCTURAL only.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckDriver, HostModuleCheckDriverIO,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckDriver
  Red/green: lake build SystemsLean.HostModuleCheckDriver; just systems-host.
  Module must stay ASCII. Not freestanding residual free. Not freestanding emit. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSeeds
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule
import SystemsLean.HostModuleCheckMultKernel
import SystemsLean.HostModuleCheckAccepts
import SystemsLean.HostModuleCheckAcceptsGoods
import SystemsLean.HostModuleCheckAcceptsProof
import SystemsLean.HostModuleCheckPackageElab
import SystemsLean.HostModuleCheckPackageEnv
import SystemsLean.HostModuleCheckPackageEnvEvidence
import SystemsLean.HostModuleCheckLoadOk
import SystemsLean.HostModuleCheckDriverIO
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckEmitApplyTerm
import SystemsLean.HostModuleCheckEmitBodyTerm
import SystemsLean.HostModuleCheckKernelMultTerm
import SystemsLean.HostModuleCheckKernelLinearTerm
import SystemsLean.HostModuleCheckKernelTypesTerm
import SystemsLean.HostModuleCheckKernelProgramTerm
import SystemsLean.HostModuleCheckKernelEmitTerm
import SystemsLean.HostModuleCheckParityMultTerm
import SystemsLean.HostModuleCheckParityLinearTerm
import SystemsLean.HostModuleCheckParityTypesTerm
import SystemsLean.HostModuleCheckParityProgramTerm
import SystemsLean.HostModuleCheckParityEmitTerm

namespace SystemsLean.HostModuleCheck

set_option maxRecDepth 16384
set_option maxHeartbeats 800000

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Run measured Mult..Compose+Erasure/Extract host module check.
    Dual evidence: pins + walk.
    Greppable: runModuleCheck, loadMultModuleCheck, HOST-MODULE-CHECK,
    HOST-MODULE-CHECK-WITHOUT-LAKE, Host real module seed expand. -/
def runModuleCheck (root : System.FilePath) : IO Unit := do
  let seedLabel := hostModuleCheckSeedUnitsLabel
  IO.println s!"== {stageId}: real Mult..Compose+Erasure/Extract module check =="
  IO.println s!"  surface={surfaceId} host={hostId} residual={residualName}"
  IO.println s!"  expand={hostModuleCheckExpandSliceName} depth={checkDepthPartial}"
  IO.println s!"  deepen={checkDepthDeepenSliceName} bar={checkDepthDeepenBar} band={checkDepthDeepenBand}"
  IO.println s!"  termSurface={checkDepthTermSurfaceBar} scope={checkDepthTermSurfaceScope} dualOk={hostModuleCheckTermSurfaceDualOk}"
  IO.println s!"  linearTermSurface={checkDepthLinearTermSurfaceBar} scope={checkDepthLinearTermSurfaceScope} dualOk={hostModuleCheckLinearTermSurfaceDualOk}"
  IO.println s!"  typesTermSurface={checkDepthTypesTermSurfaceBar} scope={checkDepthTypesTermSurfaceScope} dualOk={hostModuleCheckTypesTermSurfaceDualOk}"
  IO.println s!"  irProgramTermSurface={checkDepthIrProgramTermSurfaceBar} scope={checkDepthIrProgramTermSurfaceScope} dualOk={hostModuleCheckIrProgramTermSurfaceDualOk}"
  IO.println s!"  irGraphTermSurface={checkDepthIrGraphTermSurfaceBar} scope={checkDepthIrGraphTermSurfaceScope} dualOk={hostModuleCheckIrGraphTermSurfaceDualOk}"
  IO.println s!"  hostComposeTermSurface={checkDepthHostComposeTermSurfaceBar} scope={checkDepthHostComposeTermSurfaceScope} dualOk={hostModuleCheckHostComposeTermSurfaceDualOk}"
  IO.println s!"  erasureTermSurface={checkDepthErasureTermSurfaceBar} scope={checkDepthErasureTermSurfaceScope} dualOk={hostModuleCheckErasureTermSurfaceDualOk}"
  IO.println s!"  extractTermSurface={checkDepthExtractTermSurfaceBar} scope={checkDepthExtractTermSurfaceScope} dualOk={hostModuleCheckExtractTermSurfaceDualOk}"
  IO.println s!"  emitPlan/Apply/Body dualOk p={hostModuleCheckEmitPlanTermSurfaceDualOk} a={hostModuleCheckEmitApplyTermSurfaceDualOk} b={hostModuleCheckEmitBodyTermSurfaceDualOk}"
  IO.println s!"  kernelMult/Linear dualOk m={hostModuleCheckKernelMultTermSurfaceDualOk} l={hostModuleCheckKernelLinearTermSurfaceDualOk}"
  IO.println s!"  kernelTypes/Program/Emit dualOk t={hostModuleCheckKernelTypesTermSurfaceDualOk} p={hostModuleCheckKernelProgramTermSurfaceDualOk} e={hostModuleCheckKernelEmitTermSurfaceDualOk}"
  IO.println s!"  proofSurface={checkDepthProofSurfaceBar} scope={checkDepthProofSurfaceScope} dualOk={hostModuleCheckProofSurfaceDualOk}"
  IO.println s!"  linearProofSurface={checkDepthLinearProofSurfaceBar} scope={checkDepthLinearProofSurfaceScope} dualOk={hostModuleCheckLinearProofSurfaceDualOk}"
  IO.println s!"  typesProofSurface={checkDepthTypesProofSurfaceBar} scope={checkDepthTypesProofSurfaceScope} dualOk={hostModuleCheckTypesProofSurfaceDualOk}"
  IO.println s!"  kernelMultProofSurface={checkDepthKernelMultProofSurfaceBar} scope={checkDepthKernelMultProofSurfaceScope} dualOk={hostModuleCheckKernelMultProofSurfaceDualOk}"
  IO.println s!"  kernelLinearProofSurface={checkDepthKernelLinearProofSurfaceBar} scope={checkDepthKernelLinearProofSurfaceScope} dualOk={hostModuleCheckKernelLinearProofSurfaceDualOk}"
  IO.println s!"  kernelTypesProofSurface={checkDepthKernelTypesProofSurfaceBar} scope={checkDepthKernelTypesProofSurfaceScope} dualOk={hostModuleCheckKernelTypesProofSurfaceDualOk}"
  IO.println s!"  kernelProgramProofSurface={checkDepthKernelProgramProofSurfaceBar} scope={checkDepthKernelProgramProofSurfaceScope} dualOk={hostModuleCheckKernelProgramProofSurfaceDualOk}"
  IO.println s!"  kernelEmitProofSurface={checkDepthKernelEmitProofSurfaceBar} scope={checkDepthKernelEmitProofSurfaceScope} dualOk={hostModuleCheckKernelEmitProofSurfaceDualOk}"
  IO.println s!"  packageElaborate={checkDepthPackageElaborateBar} scope={checkDepthPackageElaborateScope} dualOk={hostModuleCheckPackageElaborateFirstBandDualOk}"
  IO.println s!"  packageProof={checkDepthPackageElaborateBar} scope={checkDepthPackageElaborateProofScope} dualOk={hostModuleCheckPackageElaborateProofBandDualOk}"
  IO.println s!"  packageKernel={checkDepthPackageElaborateBar} scope={checkDepthPackageElaborateKernelScope} dualOk={hostModuleCheckPackageElaborateKernelBandDualOk}"
  IO.println s!"  packageEnv={checkDepthPackageElaborateBar} scope={checkDepthPackageElaborateEnvScope} dualOk={hostModuleCheckPackageElaborateEnvDualOk}"
  IO.println s!"  seed={seedLabel}"
  IO.println s!"  structuralReady={hostModuleCheckReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostModuleCheckHostElaboratorResidualRemains} withoutLake={hostModuleCheckWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostModuleCheckWithoutLakeReady} keepsHostLake={hostModuleCheckWithoutLakeKeepsHostLake}"
  unless hostModuleCheckReady do
    IO.eprintln s!"error: {stageId} hostModuleCheckReady false"
    throw (IO.userError "hostModuleCheckReady false")
  unless hostModuleCheckFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostModuleCheckFinishedClaimed false"
    throw (IO.userError "hostModuleCheckFinishedClaimed false")
  unless hostModuleCheckWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostModuleCheckWithoutLakeFinished false"
    throw (IO.userError "hostModuleCheckWithoutLakeFinished false")
  unless hostModuleCheckWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostModuleCheckWithoutLakeReady false"
    throw (IO.userError "hostModuleCheckWithoutLakeReady false")
  -- Fail-closed structural smoke (no disk).
  unless hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing inductive"
    throw (IO.userError "bad missing inductive not fail-closed")
  unless hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace do
    IO.eprintln s!"error: {stageId} expected {reasonMissingNamespace} on bad missing namespace"
    throw (IO.userError "bad missing namespace not fail-closed")
  unless hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule do
    IO.eprintln s!"error: {stageId} expected {reasonEmptyModule} on bad empty"
    throw (IO.userError "bad empty not fail-closed")
  unless hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing theorem"
    throw (IO.userError "bad missing theorem not fail-closed")
  unless hostModuleCheckBadMissingAxiom.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing axiom"
    throw (IO.userError "bad missing axiom not fail-closed")
  unless hostModuleCheckBadMissingStructure.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing structure"
    throw (IO.userError "bad missing structure not fail-closed")
  unless hostModuleCheckBadMissingProgramStructure.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing Program structure"
    throw (IO.userError "bad missing Program structure not fail-closed")
  unless hostModuleCheckBadMissingErasedStructure.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing Erased structure"
    throw (IO.userError "bad missing Erased structure not fail-closed")
  unless hostModuleCheckBadMissingKernelReady.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing Kernel readiness"
    throw (IO.userError "bad missing Kernel readiness not fail-closed")
  unless hostModuleCheckBadMissingPlanStructure.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing Plan structure"
    throw (IO.userError "bad missing Plan structure not fail-closed")
  unless hostModuleCheckBadMissingParityReady.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing Parity readiness"
    throw (IO.userError "bad missing Parity readiness not fail-closed")
  -- Mult..Types L2 term-surface dual-pins (SurfaceOk + E-bad fold, not bare dualOk).
  unless hostModuleCheckGoodMultTerm.isAccept do
    IO.eprintln s!"error: {stageId} Mult L2 good term fixture must accept"
    throw (IO.userError "Mult L2 good term")
  unless hostModuleCheckBadMultNameReturnType.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Mult T2 name return type"
    throw (IO.userError "Mult T2 not fail-closed")
  unless hostModuleCheckBadMultIsValidApp.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Mult T3 multIsValid app"
    throw (IO.userError "Mult T3 not fail-closed")
  unless hostModuleCheckBadMultIsValidArm.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Mult T5 isValid arm"
    throw (IO.userError "Mult T5 not fail-closed")
  unless hostModuleCheckMultTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckMultTermSurfaceOk false"
    throw (IO.userError "Mult term-surface dual-pin")
  unless hostModuleCheckMultKernelOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckMultKernelOk false"
    throw (IO.userError "Mult kernel-check dual-pin")
  unless hostModuleCheckGoodLinearTerm.isAccept do
    IO.eprintln s!"error: {stageId} Linear L2 good term fixture must accept"
    throw (IO.userError "Linear L2 good term")
  unless hostModuleCheckBadLinearShareNatReturnType.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Linear LT1 shareNat return"
    throw (IO.userError "Linear LT1 not fail-closed")
  unless hostModuleCheckBadLinearPolyIdBody.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Linear LT2 polyId body"
    throw (IO.userError "Linear LT2 not fail-closed")
  unless hostModuleCheckBadLinearMult0ClassId.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Linear LT3 mult0ClassId"
    throw (IO.userError "Linear LT3 not fail-closed")
  unless hostModuleCheckBadLinearRoundTripBody.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Linear LT4 roundTrip body"
    throw (IO.userError "Linear LT4 not fail-closed")
  unless hostModuleCheckLinearTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckLinearTermSurfaceOk false"
    throw (IO.userError "Linear term-surface dual-pin")
  unless hostModuleCheckGoodTypesTerm.isAccept do
    IO.eprintln s!"error: {stageId} Types L2 good term fixture must accept"
    throw (IO.userError "Types L2 good term")
  unless hostModuleCheckBadTypesNameArm.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Types TT1 name arm"
    throw (IO.userError "Types TT1 not fail-closed")
  unless hostModuleCheckBadTypesExpectedMultArm.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Types TT2 expectedMult"
    throw (IO.userError "Types TT2 not fail-closed")
  unless hostModuleCheckBadTypesKindMultOkBody.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Types TT3 kindMultOk"
    throw (IO.userError "Types TT3 not fail-closed")
  unless hostModuleCheckBadTypesOfKindTagArm.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Types TT4 ofKindTag"
    throw (IO.userError "Types TT4 not fail-closed")
  unless hostModuleCheckTypesTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckTypesTermSurfaceOk false"
    throw (IO.userError "Types term-surface dual-pin")
  unless hostModuleCheckGoodIrProgramTerm.isAccept do
    IO.eprintln s!"error: {stageId} IrProgram L2 good term fixture must accept"
    throw (IO.userError "IrProgram L2 good term")
  unless hostModuleCheckBadIrProgramCap.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrProgram PT1 programCap"
    throw (IO.userError "IrProgram PT1 not fail-closed")
  unless hostModuleCheckBadIrProgramCheckFailClosed.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrProgram PT2 checkFailClosed"
    throw (IO.userError "IrProgram PT2 not fail-closed")
  unless hostModuleCheckBadIrProgramIsWellTyped.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrProgram PT3 isWellTyped"
    throw (IO.userError "IrProgram PT3 not fail-closed")
  unless hostModuleCheckBadIrProgramPush.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrProgram PT4 push"
    throw (IO.userError "IrProgram PT4 not fail-closed")
  unless hostModuleCheckIrProgramTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckIrProgramTermSurfaceOk false"
    throw (IO.userError "IrProgram term-surface dual-pin")
  unless hostModuleCheckGoodIrGraphTerm.isAccept do
    IO.eprintln s!"error: {stageId} IrGraph L2 good term fixture must accept"
    throw (IO.userError "IrGraph L2 good term")
  unless hostModuleCheckBadIrGraphEdgeMax.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrGraph GT1 edgeMax"
    throw (IO.userError "IrGraph GT1 not fail-closed")
  unless hostModuleCheckBadIrGraphCheckFailClosed.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrGraph GT2 checkFailClosed"
    throw (IO.userError "IrGraph GT2 not fail-closed")
  unless hostModuleCheckBadIrGraphIsWellTyped.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrGraph GT3 isWellTyped"
    throw (IO.userError "IrGraph GT3 not fail-closed")
  unless hostModuleCheckBadIrGraphPushNode.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on IrGraph GT4 pushNode"
    throw (IO.userError "IrGraph GT4 not fail-closed")
  unless hostModuleCheckIrGraphTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckIrGraphTermSurfaceOk false"
    throw (IO.userError "IrGraph term-surface dual-pin")
  unless hostModuleCheckGoodHostComposeTerm.isAccept do
    IO.eprintln s!"error: {stageId} HostCompose L2 good term fixture must accept"
    throw (IO.userError "HostCompose L2 good term")
  unless hostModuleCheckBadHostComposeEmpty.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on HostCompose GT1 empty"
    throw (IO.userError "HostCompose GT1 not fail-closed")
  unless hostModuleCheckBadHostComposeCheckFailClosed.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on HostCompose GT2 checkFailClosed"
    throw (IO.userError "HostCompose GT2 not fail-closed")
  unless hostModuleCheckBadHostComposeMint.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on HostCompose GT3 mint"
    throw (IO.userError "HostCompose GT3 not fail-closed")
  unless hostModuleCheckBadHostComposePushHostNode.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on HostCompose GT4 pushHostNode"
    throw (IO.userError "HostCompose GT4 not fail-closed")
  unless hostModuleCheckHostComposeTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckHostComposeTermSurfaceOk false"
    throw (IO.userError "HostCompose term-surface dual-pin")
  unless hostModuleCheckGoodErasureTerm.isAccept do
    IO.eprintln s!"error: {stageId} Erasure L2 good term fixture must accept"
    throw (IO.userError "Erasure L2 good term")
  unless hostModuleCheckBadErasureCheckFailClosed.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Erasure ET1 checkFailClosed"
    throw (IO.userError "Erasure ET1 not fail-closed")
  unless hostModuleCheckBadErasureIsErasureGrade.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Erasure ET2 isErasureGrade"
    throw (IO.userError "Erasure ET2 not fail-closed")
  unless hostModuleCheckBadErasureMarkForGrade.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Erasure ET3 markForGrade"
    throw (IO.userError "Erasure ET3 not fail-closed")
  unless hostModuleCheckBadErasureIsRuntimeAbsent.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Erasure ET4 isRuntimeAbsent"
    throw (IO.userError "Erasure ET4 not fail-closed")
  unless hostModuleCheckErasureTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckErasureTermSurfaceOk false"
    throw (IO.userError "Erasure term-surface dual-pin")
  -- Extract L2 term-surface (XT1..XT4 + E-good); gate SurfaceOk not bare dualOk.
  unless hostModuleCheckGoodExtractTerm.isAccept do
    IO.eprintln s!"error: {stageId} Extract L2 good term fixture must accept"
    throw (IO.userError "Extract L2 good term")
  unless hostModuleCheckBadExtractCheckFailClosed.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Extract XT1 checkFailClosed"
    throw (IO.userError "Extract XT1 not fail-closed")
  unless hostModuleCheckBadExtractIsFreestandingGoal.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Extract XT2 isFreestandingGoal"
    throw (IO.userError "Extract XT2 not fail-closed")
  unless hostModuleCheckBadExtractExtractOk.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Extract XT3 extractOk"
    throw (IO.userError "Extract XT3 not fail-closed")
  unless hostModuleCheckBadExtractIsValidRuntimeTag.isRejectWith reasonIllTypedTerm do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedTerm} on Extract XT4 isValidRuntimeTag"
    throw (IO.userError "Extract XT4 not fail-closed")
  unless hostModuleCheckExtractTermSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckExtractTermSurfaceOk false"
    throw (IO.userError "Extract term-surface dual-pin")
  -- Compact Emit* + Kernel* L2 smokes (Sub-1-KLOC fold; includes KernelProgram).
  unless hostModuleCheckEmitKernelTermSmokeAllOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckEmitKernelTermSmokeAllOk false"
    throw (IO.userError "Emit/Kernel term-surface dual-pin")
  -- ParityMult L2 smoke (LoadOk fold; Driver explicit dual-pin).
  unless hostModuleCheckParityMultTermSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckParityMultTermSmokeOk false"
    throw (IO.userError "ParityMult term-surface dual-pin")
  -- ParityLinear L2 smoke (LoadOk fold; Driver explicit dual-pin).
  unless hostModuleCheckParityLinearTermSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckParityLinearTermSmokeOk false"
    throw (IO.userError "ParityLinear term-surface dual-pin")
  -- ParityTypes L2 smoke (LoadOk fold; Driver explicit dual-pin).
  unless hostModuleCheckParityTypesTermSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckParityTypesTermSmokeOk false"
    throw (IO.userError "ParityTypes term-surface dual-pin")
  -- ParityProgram L2 smoke (LoadOk fold; Driver explicit dual-pin).
  unless hostModuleCheckParityProgramTermSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckParityProgramTermSmokeOk false"
    throw (IO.userError "ParityProgram term-surface dual-pin")
  -- ParityEmit L2 smoke (LoadOk fold; Driver explicit dual-pin).
  unless hostModuleCheckParityEmitTermSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckParityEmitTermSmokeOk false"
    throw (IO.userError "ParityEmit term-surface dual-pin")
  unless hostModuleCheckGoodMultTheoremsProof.isAccept do
    IO.eprintln s!"error: {stageId} MultTheorems L3 good proof fixture must accept"
    throw (IO.userError "MultTheorems L3 good proof")
  unless hostModuleCheckBadMultThmWrongStmt.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on MultTheorems P1 wrong statement"
    throw (IO.userError "MultTheorems P1 not fail-closed")
  unless hostModuleCheckBadMultThmSorry.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on MultTheorems P2 by sorry"
    throw (IO.userError "MultTheorems P2 not fail-closed")
  unless hostModuleCheckMultProofSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckMultProofSurfaceOk false"
    throw (IO.userError "MultTheorems proof-surface dual-pin")
  unless hostModuleCheckGoodLinearTheoremsProof.isAccept do
    IO.eprintln s!"error: {stageId} LinearTheorems L3 good proof fixture must accept"
    throw (IO.userError "LinearTheorems L3 good proof")
  unless hostModuleCheckBadLinearThmWrongStmt.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on LinearTheorems P1 wrong statement"
    throw (IO.userError "LinearTheorems P1 not fail-closed")
  unless hostModuleCheckBadLinearThmSorry.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on LinearTheorems P2 by sorry"
    throw (IO.userError "LinearTheorems P2 not fail-closed")
  unless hostModuleCheckLinearProofSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckLinearProofSurfaceOk false"
    throw (IO.userError "LinearTheorems proof-surface dual-pin")
  unless hostModuleCheckGoodTypesTheoremsProof.isAccept do
    IO.eprintln s!"error: {stageId} TypesTheorems L3 good proof fixture must accept"
    throw (IO.userError "TypesTheorems L3 good proof")
  unless hostModuleCheckBadTypesThmWrongStmt.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on TypesTheorems P1 wrong statement"
    throw (IO.userError "TypesTheorems P1 not fail-closed")
  unless hostModuleCheckBadTypesThmSorry.isRejectWith reasonIllTypedProof do
    IO.eprintln s!"error: {stageId} expected {reasonIllTypedProof} on TypesTheorems P2 by sorry"
    throw (IO.userError "TypesTheorems P2 not fail-closed")
  unless hostModuleCheckTypesProofSurfaceOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckTypesProofSurfaceOk false"
    throw (IO.userError "TypesTheorems proof-surface dual-pin")
  unless hostModuleCheckKernelMultProofSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckKernelMultProofSmokeOk false"
    throw (IO.userError "KernelMultTheorems proof-surface dual-pin")
  unless hostModuleCheckKernelLinearProofSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckKernelLinearProofSmokeOk false"
    throw (IO.userError "KernelLinearTheorems proof-surface dual-pin")
  unless hostModuleCheckKernelTypesProofSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckKernelTypesProofSmokeOk false"
    throw (IO.userError "KernelTypesTheorems proof-surface dual-pin")
  unless hostModuleCheckKernelProgramProofSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckKernelProgramProofSmokeOk false"
    throw (IO.userError "KernelProgramTheorems proof-surface dual-pin")
  unless hostModuleCheckKernelEmitProofSmokeOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckKernelEmitProofSmokeOk false"
    throw (IO.userError "KernelEmitTheorems proof-surface dual-pin")
  -- Package L4 first + PROOF + Kernel + MultLinear env (M4): E-bad gates, not bare dualOk.
  unless hostModuleCheckPackageElaborateFirstBandOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckPackageElaborateFirstBandOk false"
    throw (IO.userError "package elaborate first-band dual-pin")
  unless hostModuleCheckPackageElaborateProofBandOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckPackageElaborateProofBandOk false"
    throw (IO.userError "package elaborate PROOF-band dual-pin")
  unless hostModuleCheckPackageElaborateKernelBandOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckPackageElaborateKernelBandOk false"
    throw (IO.userError "package elaborate Kernel-band dual-pin")
  unless hostModuleCheckPackageElaborateEnvOk do
    IO.eprintln s!"error: {stageId} hostModuleCheckPackageElaborateEnvOk false"
    throw (IO.userError "package elaborate MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMult-env dual-pin")
  unless hostModuleCheckGoodLinear.isAccept do
    IO.eprintln s!"error: {stageId} Linear good fixture must accept"
    throw (IO.userError "Linear good")
  unless hostModuleCheckGoodTypes.isAccept do
    IO.eprintln s!"error: {stageId} Types good fixture must accept"
    throw (IO.userError "Types good")
  unless hostModuleCheckGoodIrProgram.isAccept do
    IO.eprintln s!"error: {stageId} IrProgram good fixture must accept"
    throw (IO.userError "IrProgram good")
  unless hostModuleCheckGoodIrGraph.isAccept do
    IO.eprintln s!"error: {stageId} IrGraph good fixture must accept"
    throw (IO.userError "IrGraph good")
  unless hostModuleCheckGoodHostCompose.isAccept do
    IO.eprintln s!"error: {stageId} HostCompose good fixture must accept"
    throw (IO.userError "HostCompose good")
  unless hostModuleCheckGoodErasure.isAccept do
    IO.eprintln s!"error: {stageId} Erasure good fixture must accept"
    throw (IO.userError "Erasure good")
  unless hostModuleCheckGoodExtract.isAccept do
    IO.eprintln s!"error: {stageId} Extract good fixture must accept"
    throw (IO.userError "Extract good")
  unless hostModuleCheckGoodCompilePath.isAccept do
    IO.eprintln s!"error: {stageId} CompilePath good fixture must accept"
    throw (IO.userError "CompilePath good")
  unless hostModuleCheckGoodKernelMult.isAccept do
    IO.eprintln s!"error: {stageId} KernelMult good fixture must accept"
    throw (IO.userError "KernelMult good")
  unless hostModuleCheckGoodKernelLinear.isAccept do
    IO.eprintln s!"error: {stageId} KernelLinear good fixture must accept"
    throw (IO.userError "KernelLinear good")
  unless hostModuleCheckGoodKernelTypes.isAccept do
    IO.eprintln s!"error: {stageId} KernelTypes good fixture must accept"
    throw (IO.userError "KernelTypes good")
  unless hostModuleCheckGoodKernelProgram.isAccept do
    IO.eprintln s!"error: {stageId} KernelProgram good fixture must accept"
    throw (IO.userError "KernelProgram good")
  unless hostModuleCheckGoodKernelMultTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelMultTheorems good fixture must accept"
    throw (IO.userError "KernelMultTheorems good")
  unless hostModuleCheckGoodKernelLinearTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelLinearTheorems good fixture must accept"
    throw (IO.userError "KernelLinearTheorems good")
  unless hostModuleCheckGoodKernelTypesTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelTypesTheorems good fixture must accept"
    throw (IO.userError "KernelTypesTheorems good")
  unless hostModuleCheckGoodKernelProgramTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelProgramTheorems good fixture must accept"
    throw (IO.userError "KernelProgramTheorems good")
  unless hostModuleCheckGoodJoinMap.isAccept do
    IO.eprintln s!"error: {stageId} JoinMap good fixture must accept"
    throw (IO.userError "JoinMap good")
  unless hostModuleCheckGoodJoinMapTheorems.isAccept do
    IO.eprintln s!"error: {stageId} JoinMapTheorems good fixture must accept"
    throw (IO.userError "JoinMapTheorems good")
  unless hostModuleCheckGoodSelfHost.isAccept do
    IO.eprintln s!"error: {stageId} SelfHost good fixture must accept"
    throw (IO.userError "SelfHost good")
  unless hostModuleCheckGoodSelfHostTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostTheorems good fixture must accept"
    throw (IO.userError "SelfHostTheorems good")
  unless hostModuleCheckGoodSurfaceMatrix.isAccept do
    IO.eprintln s!"error: {stageId} SurfaceMatrix good fixture must accept"
    throw (IO.userError "SurfaceMatrix good")
  unless hostModuleCheckGoodSurfaceMatrixTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SurfaceMatrixTheorems good fixture must accept"
    throw (IO.userError "SurfaceMatrixTheorems good")
  unless hostModuleCheckGoodEmitMultScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitMultScaffold good fixture must accept"
    throw (IO.userError "EmitMultScaffold good")
  unless hostModuleCheckGoodEmitLinearScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitLinearScaffold good fixture must accept"
    throw (IO.userError "EmitLinearScaffold good")
  unless hostModuleCheckGoodEmitTypesScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitTypesScaffold good fixture must accept"
    throw (IO.userError "EmitTypesScaffold good")
  unless hostModuleCheckGoodEmitProgramScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitProgramScaffold good fixture must accept"
    throw (IO.userError "EmitProgramScaffold good")
  unless hostModuleCheckGoodEmitGraphScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitGraphScaffold good fixture must accept"
    throw (IO.userError "EmitGraphScaffold good")
  unless hostModuleCheckGoodEmitComposeScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitComposeScaffold good fixture must accept"
    throw (IO.userError "EmitComposeScaffold good")
  unless hostModuleCheckGoodEmitPlanScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitPlanScaffold good fixture must accept"
    throw (IO.userError "EmitPlanScaffold good")
  unless hostModuleCheckGoodEmitApplyScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitApplyScaffold good fixture must accept"
    throw (IO.userError "EmitApplyScaffold good")
  unless hostModuleCheckGoodEmitBodyScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitBodyScaffold good fixture must accept"
    throw (IO.userError "EmitBodyScaffold good")
  unless hostModuleCheckGoodEmitErasureScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitErasureScaffold good fixture must accept"
    throw (IO.userError "EmitErasureScaffold good")
  unless hostModuleCheckGoodEmitExtractScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitExtractScaffold good fixture must accept"
    throw (IO.userError "EmitExtractScaffold good")
  unless hostModuleCheckGoodEmitBannerScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitBannerScaffold good fixture must accept"
    throw (IO.userError "EmitBannerScaffold good")
  unless hostModuleCheckGoodKernelSelfApply.isAccept do
    IO.eprintln s!"error: {stageId} KernelSelfApply good fixture must accept"
    throw (IO.userError "KernelSelfApply good")
  unless hostModuleCheckGoodKernelSelfApplyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelSelfApplyTheorems good fixture must accept"
    throw (IO.userError "KernelSelfApplyTheorems good")
  unless hostModuleCheckGoodEmitMult.isAccept do
    IO.eprintln s!"error: {stageId} EmitMult good fixture must accept"
    throw (IO.userError "EmitMult good")
  unless hostModuleCheckGoodEmitPlan.isAccept do
    IO.eprintln s!"error: {stageId} EmitPlan good fixture must accept"
    throw (IO.userError "EmitPlan good")
  unless hostModuleCheckGoodEmitApply.isAccept do
    IO.eprintln s!"error: {stageId} EmitApply good fixture must accept"
    throw (IO.userError "EmitApply good")
  unless hostModuleCheckGoodEmitBody.isAccept do
    IO.eprintln s!"error: {stageId} EmitBody good fixture must accept"
    throw (IO.userError "EmitBody good")
  unless hostModuleCheckGoodKernelEmit.isAccept do
    IO.eprintln s!"error: {stageId} KernelEmit good fixture must accept"
    throw (IO.userError "KernelEmit good")
  unless hostModuleCheckGoodKernelEmitTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelEmitTheorems good fixture must accept"
    throw (IO.userError "KernelEmitTheorems good")
  unless hostModuleCheckGoodParityMult.isAccept do
"#

end SystemsLean.HostFrontLiveHostModuleCheckDriver
