/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph seeds, honesty, reject reasons.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains. DualResidual free claimed elsewhere.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, SLAKE_HOST_IMPORT_GRAPH_V0,
  HostImportGraphSeeds, hostImportGraphSeedModules, hostImportGraphFinishedClaimed,
  hostImportGraphHostFreeClaimed, stillUsesLake, reasonMissingImport.
  Module: SystemsLean.HostImportGraphSeeds
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphSeeds; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
namespace SystemsLean.HostImportGraph
/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_IMPORT_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-IMPORT-GRAPH"

/-- Short surface name. -/
def surfaceId : String := "HOST-IMPORT-GRAPH"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-IMPORT-GRAPH"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-import-graph"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-import-graph"

/-- just recipe for without-Lake measured real Mult import graph (prebuilt).
    Greppable: justRecipeWithoutLake, host-import-graph-without-lake,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-import-graph-without-lake"

/-- Relative path of prebuilt binary under src/systems
    (bootstrap once: lake build slake-host-import-graph).
    Greppable: prebuiltHostImportGraphRel, slake-host-import-graph. -/
def prebuiltHostImportGraphRel : String :=
  ".lake/build/bin/slake-host-import-graph"

/-- Design note path cite (not a filesystem read).
    Greppable: designNotePath, full-host-elaborator-design-2026-08-03. -/
def designNotePath : String :=
  "doc/dev/research/full-host-elaborator-design-2026-08-03.md"

/-- Residual Name this surface implements (plain English).
    Greppable: residualName, Real Mult import graph. -/
def residualName : String := "Real Mult import graph"

/-! ### Seed set (real SystemsLean Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds; not dialect goldens)

  A4 started Mult+MultTheorems. A6 Host module set expand grew Mult..Compose.
  Host real module seed expand adds Erasure + ErasureTheorems + Extract +
  ExtractTheorems. Host library seed expand continue (A12) adds CompilePath +
  KernelMult + KernelLinear + KernelTypes + KernelProgram. Same living Name
  continues (A13) with Kernel *Theorems. Same living Name continues (A14) with
  JoinMap + JoinMapTheorems + SelfHost + SelfHostTheorems. Same living Name
  continues (A15) with SurfaceMatrix + SurfaceMatrixTheorems. Same living Name
  continues (A16) with Emit Mult..Compose scaffolds. Same living Name continues
  (A17) with Emit Plan/Apply/Body scaffolds. Same living Name continues
  (A18) with Emit Erasure/Extract/Banner scaffolds. Same living Name continues
  (A19) with KernelSelfApply + KernelSelfApplyTheorems. Same living Name continues
  (A20) with EmitMult + EmitPlan + EmitApply + EmitBody product modules.
  Same living Name continues (A21) with KernelEmit + KernelEmitTheorems.
  Same living Name continues (A22) with ParityMult + ParityMultTheorems.
  Same living Name continues (A23) with ParityLinear + ParityLinearTheorems.
  Same living Name continues (A24) with ParityTypes + ParityTypesTheorems.
  Same living Name continues (A25) with ParityProgram + ParityProgramTheorems.
  Same living Name continues (A26) with ParityEmit + ParityEmitTheorems.
  Same living Name continues (A27) with SelfApply + SelfApplyTheorems.
  Same living Name continues (A28) with EmitLinear + EmitTypes + EmitProgram +
  EmitGraph + EmitCompose product shells (Mult..Compose remaining emit products).
  Same living Name continues (A29) with EmitErasure + EmitExtract + EmitBanner
  product shells (remaining emit product shells after Mult..Compose).
  Same living Name continues (A30) with ProductOutKernel + ProductOutKernelTheorems
  + BootstrapHonesty + BootstrapHonestyTheorems (SelfApplyFs leaf foundation;
  ProductOutKernel/BootstrapHonesty are direct SelfApplyFs imports with no package
  imports; theorems companions import parents only).
  Same living Name continues (A31) with ProductPathWriterSurface +
  ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan +
  ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec +
  ProductPathWriterPathExecTheorems (SelfApplyFs ProductPath writer pure leaves
  B5-B7; no package imports; theorems companions import parents only).
  Same living Name continues (A32) with ProductPathOwnershipInputs +
  ProductPathOwnershipInputsTheorems + ProductPathPerform +
  ProductPathPerformTheorems + ProductPathPerformStep +
  ProductPathPerformStepTheorems (SelfApplyFs ProductPath pure leaves B8-B10;
  no package imports; theorems companions import parents only).
  Same living Name continues (A33) with ProductPathReadSsot +
  ProductPathReadSsotTheorems + ProductPathComposePlan +
  ProductPathComposePlanTheorems + Capable + CapableTheorems
  (SelfApplyFs ProductPath/Capable pure leaves B11-B12 + Capable gap;
  no package imports; theorems companions import parents only).
  Same living Name continues (A34) with CapableStepContract +
  CapableStepContractTheorems + InstallOut + InstallOutTheorems +
  OfficialPath + OfficialPathTheorems + PerformEvidence +
  PerformEvidenceTheorems (SelfApplyFs CapableStepContract/InstallOut/
  OfficialPath/PerformEvidence pure leaves; no package imports; theorems
  companions import parents only).
  Same living Name continues (A35) with CapableRead + CapableReadTheorems +
  CapableCompose + CapableComposeTheorems + CapableFullBar +
  CapableFullBarTheorems (SelfApplyFs remaining pure Capable* leaves; no
  package imports; theorems companions import parents only).
  Same living Name continues (A36) with DualEqWriteCapableGap +
  DualEqWriteCapableGapTheorems + DualEqWriteClosePath +
  DualEqWriteClosePathTheorems + DualEqWriteParity + DualEqWriteParityTheorems
  (SelfApplyFs DualEqWrite pure leaves; no package imports; theorems
  companions import parents only; skip DualEqWriteApi multi-import stack).
  Same living Name continues (A37) with OfficialRetire + OfficialRetireTheorems +
  OwnershipClaimed + OwnershipClaimedTheorems + PerformClaimed +
  PerformClaimedTheorems + StepContractFull + StepContractFullTheorems
  (SelfApplyFs claim-tip pure leaves; no package imports; theorems
  companions import parents only).
  Same living Name continues (A38) with SelfHostComplete +
  SelfHostCompleteTheorems + OfficialPathAlternate +
  OfficialPathAlternateTheorems + ProductPathOwnershipRegenerate +
  ProductPathOwnershipRegenerateTheorems (SelfApplyFs remaining pure leaves;
  no package imports; theorems companions import parents only).
  Same living Name continues (A39) with CapableWriteHcLoad + DualEqWriteLoad +
  CapableWriteHc + DualEqWriteApi + LlvmHold + LlvmHoldTheorems
  (SelfApplyFs multi-import progress band; Load modules before WriteHc/Api;
  LlvmHold before LlvmHoldTheorems; honest package imports from on-disk).
  Same living Name continues (A40) with CapableRegenerate +
  CapableRegenerateTheorems (multi-import CapableRead/Compose/WriteHc/InstallOut;
  theorems parent only; honest package imports from on-disk).
  Same living Name continues (A41) with FreestandingEmitLoad +
  FreestandingEmitLoadScaffold + LakeRetireInventory + HostPackageRoots
  (emit load ladder pure leaf + scaffold parent + two pure inventory leaves;
  honest package imports from on-disk).
  Same living Name continues (A42) with FreestandingEmit +
  ProductPathWriteHc + ProductPathWriteHcTheorems
  (FreestandingEmit multi-import Load+Scaffold+emit product stack;
  ProductPathWriteHc imports FreestandingEmit; theorems parent only;
  honest package imports from on-disk).
  Same living Name continues (A43) with CompilePathMult..CompilePathExtract
  (unit multi-import CompilePath+Emit* surfaces; Extract depends Mult+Program;
  honest package imports from on-disk).
  Same living Name continues (A44) with ProductWireWriteTool + HostTerm +
  LlvmEmitPath + SubsetFront (preferred seed-closed multi/pure leaves;
  honest package imports from on-disk).
  Same living Name continues (A45) with FirstSurface + Linear/Types/Program/
  Graph/Compose/Erasure/Extract SubsetEmit (unit SubsetEmit band + FirstSurface;
  honest package imports from on-disk).
  Same living Name continues (A46) with MultSubsetEmit + MultSubsetRebuild +
  Linear/Types/Program/Graph/Compose/Erasure/Extract SubsetRebuild + HostFront +
  LlvmMultText (preferred seed-closed after unit SubsetEmit parents;
  honest package imports from on-disk).
  Same living Name continues (A47) with HostFrontTheorems + HostCheck + HostGraph +
  LlvmLinearText + MultFsWriteTool + FrontMultPackage + SubsetPackageJoin
  (preferred seed-closed after HostFront/LlvmMultText/unit SubsetRebuild parents;
  SelfApplyFs seeded modules=192; honest package imports from on-disk).
  Same living Name continues (A48) with HostGraphTheorems + LlvmTypesText +
  MultFsDeepen + HostPackageWrite (preferred seed-closed after HostGraph /
  LlvmLinearText / MultFsWriteTool / unit SubsetEmit parents; SelfApplyFs
  deferred; honest package imports from on-disk).
  Same living Name continues (A51) with SelfApplyFs after LlvmGraphText + LlvmComposeText
  (preferred seed-closed after HostPackageWrite / LlvmTypesText parents;
  SelfApplyFs seeded modules=192; honest package imports from on-disk).
  Same living Name continues (A52) with SelfApplyFsTheorems + InventoryClose +
  ProductPathBars after SelfApplyFs (preferred seed-closed after SelfApplyFs /
  LlvmHold parents; modules=195; honest package imports from on-disk).
  Same living Name continues (A53) with InventoryCloseTheorems + ProductPath
  after ProductPathBars (preferred seed-closed InventoryCloseTheorems parent
  edges + ProductPath after InventoryClose+ProductPathBars; modules=197;
  honest package imports from on-disk).
  Same living Name continues (A54) with ProductPathTheorems + DualResidual
  after ProductPath (preferred seed-closed ProductPathTheorems parent ProductPath;
  DualResidual PARTIAL-STRUCTURAL only with hostElaboratorResidualFreeClaimed
  false; modules=199; honest package imports from on-disk).
  Same living Name continues (A55) with DualResidualTheorems + ProbeWire +
  SelfHostBody + ProbeWireTheorems + SelfHostBodyTheorems + SpecProof +
  SpecProofTheorems after DualResidual (preferred seed-closed DualResidualTheorems
  parent DualResidual then remaining product library; DualResidual free claimed
  stays false; modules=206 full product library PARTIAL-STRUCTURAL; honest
  package imports from on-disk).
-/

/-- Seed module names (Lean dotted). Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply + KernelSelfApplyTheorems
    + Emit product Mult/Plan/Apply/Body + KernelEmit + KernelEmitTheorems
    + ParityMult + ParityMultTheorems + ParityLinear + ParityLinearTheorems
    + ParityTypes + ParityTypesTheorems + ParityProgram + ParityProgramTheorems
    + ParityEmit + ParityEmitTheorems + SelfApply + SelfApplyTheorems
    + EmitLinear + EmitTypes + EmitProgram + EmitGraph + EmitCompose
    + EmitErasure + EmitExtract + EmitBanner
    + ProductOutKernel + ProductOutKernelTheorems
    + BootstrapHonesty + BootstrapHonestyTheorems
    + ProductPathWriterSurface + ProductPathWriterSurfaceTheorems
    + ProductPathWriterPathPlan + ProductPathWriterPathPlanTheorems
    + ProductPathWriterPathExec + ProductPathWriterPathExecTheorems
    + ProductPathOwnershipInputs + ProductPathOwnershipInputsTheorems
    + ProductPathPerform + ProductPathPerformTheorems
    + ProductPathPerformStep + ProductPathPerformStepTheorems
    + ProductPathReadSsot + ProductPathReadSsotTheorems
    + ProductPathComposePlan + ProductPathComposePlanTheorems
    + Capable + CapableTheorems
    + CapableStepContract + CapableStepContractTheorems
    + InstallOut + InstallOutTheorems
    + OfficialPath + OfficialPathTheorems
    + PerformEvidence + PerformEvidenceTheorems
    + CapableRead + CapableReadTheorems
    + CapableCompose + CapableComposeTheorems
    + CapableFullBar + CapableFullBarTheorems
    + DualEqWriteCapableGap + DualEqWriteCapableGapTheorems
    + DualEqWriteClosePath + DualEqWriteClosePathTheorems
    + DualEqWriteParity + DualEqWriteParityTheorems
    + OfficialRetire + OfficialRetireTheorems
    + OwnershipClaimed + OwnershipClaimedTheorems
    + PerformClaimed + PerformClaimedTheorems
    + StepContractFull + StepContractFullTheorems
    + SelfHostComplete + SelfHostCompleteTheorems
    + OfficialPathAlternate + OfficialPathAlternateTheorems
    + ProductPathOwnershipRegenerate + ProductPathOwnershipRegenerateTheorems
    + CapableWriteHcLoad + DualEqWriteLoad + CapableWriteHc + DualEqWriteApi
    + LlvmHold + LlvmHoldTheorems
    + CapableRegenerate + CapableRegenerateTheorems
    + FreestandingEmitLoad + FreestandingEmitLoadScaffold
    + LakeRetireInventory + HostPackageRoots + FreestandingEmit + ProductPathWriteHc + ProductPathWriteHcTheorems
    + CompilePathMult + CompilePathLinear + CompilePathTypes + CompilePathProgram
    + CompilePathGraph + CompilePathCompose + CompilePathPlan + CompilePathApply
    + CompilePathBody + CompilePathErasure + CompilePathExtract
    + ProductWireWriteTool + HostTerm + LlvmEmitPath + SubsetFront
    + FirstSurface + LinearSubsetEmit + TypesSubsetEmit + ProgramSubsetEmit
    + GraphSubsetEmit + ComposeSubsetEmit + ErasureSubsetEmit + ExtractSubsetEmit
    + MultSubsetEmit + MultSubsetRebuild + LinearSubsetRebuild + TypesSubsetRebuild
    + ProgramSubsetRebuild + GraphSubsetRebuild + ComposeSubsetRebuild
    + ErasureSubsetRebuild + ExtractSubsetRebuild + HostFront + LlvmMultText + HostFrontTheorems + HostCheck + HostGraph + LlvmLinearText + MultFsWriteTool + FrontMultPackage + SubsetPackageJoin + HostGraphTheorems + LlvmTypesText + MultFsDeepen + HostPackageWrite + HostPackageWriteTheorems + LlvmProgramText + LlvmGraphText + LlvmComposeText + SelfApplyFs + SelfApplyFsTheorems + InventoryClose + ProductPathBars.
    Greppable: hostImportGraphSeedModules,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems. -/
def hostImportGraphSeedModules : List String :=
  ["SystemsLean.Mult",
   "SystemsLean.MultTheorems",
   "SystemsLean.Linear",
   "SystemsLean.LinearTheorems",
   "SystemsLean.Types",
   "SystemsLean.TypesTheorems",
   "SystemsLean.IrProgram",
   "SystemsLean.IrProgramTheorems",
   "SystemsLean.IrGraph",
   "SystemsLean.IrGraphTheorems",
   "SystemsLean.HostCompose",
   "SystemsLean.HostComposeTheorems",
   "SystemsLean.Erasure",
   "SystemsLean.ErasureTheorems",
   "SystemsLean.Extract",
   "SystemsLean.ExtractTheorems",
   "SystemsLean.CompilePath",
   "SystemsLean.KernelMult",
   "SystemsLean.KernelLinear",
   "SystemsLean.KernelTypes",
   "SystemsLean.KernelProgram",
   "SystemsLean.KernelMultTheorems",
   "SystemsLean.KernelLinearTheorems",
   "SystemsLean.KernelTypesTheorems",
   "SystemsLean.KernelProgramTheorems",
   "SystemsLean.JoinMap",
   "SystemsLean.JoinMapTheorems",
   "SystemsLean.SelfHost",
   "SystemsLean.SelfHostTheorems",
   "SystemsLean.SurfaceMatrix",
   "SystemsLean.SurfaceMatrixTheorems",
   "SystemsLean.EmitMultScaffold",
   "SystemsLean.EmitLinearScaffold",
   "SystemsLean.EmitTypesScaffold",
   "SystemsLean.EmitProgramScaffold",
   "SystemsLean.EmitGraphScaffold",
   "SystemsLean.EmitComposeScaffold",
   "SystemsLean.EmitPlanScaffold",
   "SystemsLean.EmitApplyScaffold",
   "SystemsLean.EmitBodyScaffold",
   "SystemsLean.EmitErasureScaffold",
   "SystemsLean.EmitExtractScaffold",
   "SystemsLean.EmitBannerScaffold",
   "SystemsLean.KernelSelfApply",
   "SystemsLean.KernelSelfApplyTheorems",
   "SystemsLean.EmitMult",
   "SystemsLean.EmitPlan",
   "SystemsLean.EmitApply",
   "SystemsLean.EmitBody",
   "SystemsLean.KernelEmit",
   "SystemsLean.KernelEmitTheorems",
   "SystemsLean.ParityMult",
   "SystemsLean.ParityMultTheorems",
   "SystemsLean.ParityLinear",
   "SystemsLean.ParityLinearTheorems",
   "SystemsLean.ParityTypes",
   "SystemsLean.ParityTypesTheorems",
   "SystemsLean.ParityProgram",
   "SystemsLean.ParityProgramTheorems",
   "SystemsLean.ParityEmit",
   "SystemsLean.ParityEmitTheorems",
   "SystemsLean.SelfApply",
   "SystemsLean.SelfApplyTheorems",
   "SystemsLean.EmitLinear",
   "SystemsLean.EmitTypes",
   "SystemsLean.EmitProgram",
   "SystemsLean.EmitGraph",
   "SystemsLean.EmitCompose",
   "SystemsLean.EmitErasure",
   "SystemsLean.EmitExtract",
   "SystemsLean.EmitBanner",
   "SystemsLean.ProductOutKernel",
   "SystemsLean.ProductOutKernelTheorems",
   "SystemsLean.BootstrapHonesty",
   "SystemsLean.BootstrapHonestyTheorems",
   "SystemsLean.ProductPathWriterSurface",
   "SystemsLean.ProductPathWriterSurfaceTheorems",
   "SystemsLean.ProductPathWriterPathPlan",
   "SystemsLean.ProductPathWriterPathPlanTheorems",
   "SystemsLean.ProductPathWriterPathExec",
   "SystemsLean.ProductPathWriterPathExecTheorems",
   "SystemsLean.ProductPathOwnershipInputs",
   "SystemsLean.ProductPathOwnershipInputsTheorems",
   "SystemsLean.ProductPathPerform",
   "SystemsLean.ProductPathPerformTheorems",
   "SystemsLean.ProductPathPerformStep",
   "SystemsLean.ProductPathPerformStepTheorems",
   "SystemsLean.ProductPathReadSsot",
   "SystemsLean.ProductPathReadSsotTheorems",
   "SystemsLean.ProductPathComposePlan",
   "SystemsLean.ProductPathComposePlanTheorems",
   "SystemsLean.Capable",
   "SystemsLean.CapableTheorems",
   "SystemsLean.CapableStepContract",
   "SystemsLean.CapableStepContractTheorems",
   "SystemsLean.InstallOut",
   "SystemsLean.InstallOutTheorems",
   "SystemsLean.OfficialPath",
   "SystemsLean.OfficialPathTheorems",
   "SystemsLean.PerformEvidence",
   "SystemsLean.PerformEvidenceTheorems",
   "SystemsLean.CapableRead",
   "SystemsLean.CapableReadTheorems",
   "SystemsLean.CapableCompose",
   "SystemsLean.CapableComposeTheorems",
   "SystemsLean.CapableFullBar",
   "SystemsLean.CapableFullBarTheorems",
   "SystemsLean.DualEqWriteCapableGap",
   "SystemsLean.DualEqWriteCapableGapTheorems",
   "SystemsLean.DualEqWriteClosePath",
   "SystemsLean.DualEqWriteClosePathTheorems",
   "SystemsLean.DualEqWriteParity",
   "SystemsLean.DualEqWriteParityTheorems",
   "SystemsLean.OfficialRetire",
   "SystemsLean.OfficialRetireTheorems",
   "SystemsLean.OwnershipClaimed",
   "SystemsLean.OwnershipClaimedTheorems",
   "SystemsLean.PerformClaimed",
   "SystemsLean.PerformClaimedTheorems",
   "SystemsLean.StepContractFull",
   "SystemsLean.StepContractFullTheorems",
   "SystemsLean.SelfHostComplete",
   "SystemsLean.SelfHostCompleteTheorems",
   "SystemsLean.OfficialPathAlternate",
   "SystemsLean.OfficialPathAlternateTheorems",
   "SystemsLean.ProductPathOwnershipRegenerate",
   "SystemsLean.ProductPathOwnershipRegenerateTheorems",
   "SystemsLean.CapableWriteHcLoad",
   "SystemsLean.DualEqWriteLoad",
   "SystemsLean.CapableWriteHc",
   "SystemsLean.DualEqWriteApi",
   "SystemsLean.LlvmHold",
   "SystemsLean.LlvmHoldTheorems",
   "SystemsLean.CapableRegenerate",
   "SystemsLean.CapableRegenerateTheorems",
   "SystemsLean.FreestandingEmitLoad",
   "SystemsLean.FreestandingEmitLoadScaffold",
   "SystemsLean.LakeRetireInventory",
   "SystemsLean.HostPackageRoots",
   "SystemsLean.FreestandingEmit",
   "SystemsLean.ProductPathWriteHc",
   "SystemsLean.ProductPathWriteHcTheorems",
   "SystemsLean.CompilePathMult",
   "SystemsLean.CompilePathLinear",
   "SystemsLean.CompilePathTypes",
   "SystemsLean.CompilePathProgram",
   "SystemsLean.CompilePathGraph",
   "SystemsLean.CompilePathCompose",
   "SystemsLean.CompilePathPlan",
   "SystemsLean.CompilePathApply",
   "SystemsLean.CompilePathBody",
   "SystemsLean.CompilePathErasure",
   "SystemsLean.CompilePathExtract",
   "SystemsLean.ProductWireWriteTool",
   "SystemsLean.HostTerm",
   "SystemsLean.LlvmEmitPath",
   "SystemsLean.SubsetFront",
   "SystemsLean.FirstSurface",
   "SystemsLean.LinearSubsetEmit",
   "SystemsLean.TypesSubsetEmit",
   "SystemsLean.ProgramSubsetEmit",
   "SystemsLean.GraphSubsetEmit",
   "SystemsLean.ComposeSubsetEmit",
   "SystemsLean.ErasureSubsetEmit",
   "SystemsLean.ExtractSubsetEmit",
   "SystemsLean.MultSubsetEmit",
   "SystemsLean.MultSubsetRebuild",
   "SystemsLean.LinearSubsetRebuild",
   "SystemsLean.TypesSubsetRebuild",
   "SystemsLean.ProgramSubsetRebuild",
   "SystemsLean.GraphSubsetRebuild",
   "SystemsLean.ComposeSubsetRebuild",
   "SystemsLean.ErasureSubsetRebuild",
   "SystemsLean.ExtractSubsetRebuild",
   "SystemsLean.HostFront",
   "SystemsLean.LlvmMultText",
   "SystemsLean.HostFrontTheorems",
   "SystemsLean.HostCheck",
   "SystemsLean.HostGraph",
   "SystemsLean.LlvmLinearText",
   "SystemsLean.MultFsWriteTool",
   "SystemsLean.FrontMultPackage",
   "SystemsLean.SubsetPackageJoin",
   "SystemsLean.HostGraphTheorems",
   "SystemsLean.LlvmTypesText",
   "SystemsLean.MultFsDeepen",
   "SystemsLean.HostPackageWrite",
   "SystemsLean.HostPackageWriteTheorems",
   "SystemsLean.LlvmProgramText",
   "SystemsLean.LlvmGraphText",
   "SystemsLean.LlvmComposeText",
   "SystemsLean.SelfApplyFs",
   "SystemsLean.SelfApplyFsTheorems",
   "SystemsLean.InventoryClose",
   "SystemsLean.ProductPathBars",
   "SystemsLean.InventoryCloseTheorems",
   "SystemsLean.ProductPath",
   "SystemsLean.ProductPathTheorems",
   "SystemsLean.DualResidual",
   "SystemsLean.DualResidualTheorems",
   "SystemsLean.ProbeWire",
   "SystemsLean.SelfHostBody",
   "SystemsLean.ProbeWireTheorems",
   "SystemsLean.SelfHostBodyTheorems",
   "SystemsLean.SpecProof",
   "SystemsLean.SpecProofTheorems"]
/-- Seed paths relative to repo root.
    Greppable: hostImportGraphSeedRelPaths. -/
def hostImportGraphSeedRelPaths : List String :=
  ["src/systems/SystemsLean/Mult.lean",
   "src/systems/SystemsLean/MultTheorems.lean",
   "src/systems/SystemsLean/Linear.lean",
   "src/systems/SystemsLean/LinearTheorems.lean",
   "src/systems/SystemsLean/Types.lean",
   "src/systems/SystemsLean/TypesTheorems.lean",
   "src/systems/SystemsLean/IrProgram.lean",
   "src/systems/SystemsLean/IrProgramTheorems.lean",
   "src/systems/SystemsLean/IrGraph.lean",
   "src/systems/SystemsLean/IrGraphTheorems.lean",
   "src/systems/SystemsLean/HostCompose.lean",
   "src/systems/SystemsLean/HostComposeTheorems.lean",
   "src/systems/SystemsLean/Erasure.lean",
   "src/systems/SystemsLean/ErasureTheorems.lean",
   "src/systems/SystemsLean/Extract.lean",
   "src/systems/SystemsLean/ExtractTheorems.lean",
   "src/systems/SystemsLean/CompilePath.lean",
   "src/systems/SystemsLean/KernelMult.lean",
   "src/systems/SystemsLean/KernelLinear.lean",
   "src/systems/SystemsLean/KernelTypes.lean",
   "src/systems/SystemsLean/KernelProgram.lean",
   "src/systems/SystemsLean/KernelMultTheorems.lean",
   "src/systems/SystemsLean/KernelLinearTheorems.lean",
   "src/systems/SystemsLean/KernelTypesTheorems.lean",
   "src/systems/SystemsLean/KernelProgramTheorems.lean",
   "src/systems/SystemsLean/JoinMap.lean",
   "src/systems/SystemsLean/JoinMapTheorems.lean",
   "src/systems/SystemsLean/SelfHost.lean",
   "src/systems/SystemsLean/SelfHostTheorems.lean",
   "src/systems/SystemsLean/SurfaceMatrix.lean",
   "src/systems/SystemsLean/SurfaceMatrixTheorems.lean",
   "src/systems/SystemsLean/EmitMultScaffold.lean",
   "src/systems/SystemsLean/EmitLinearScaffold.lean",
   "src/systems/SystemsLean/EmitTypesScaffold.lean",
   "src/systems/SystemsLean/EmitProgramScaffold.lean",
   "src/systems/SystemsLean/EmitGraphScaffold.lean",
   "src/systems/SystemsLean/EmitComposeScaffold.lean",
   "src/systems/SystemsLean/EmitPlanScaffold.lean",
   "src/systems/SystemsLean/EmitApplyScaffold.lean",
   "src/systems/SystemsLean/EmitBodyScaffold.lean",
   "src/systems/SystemsLean/EmitErasureScaffold.lean",
   "src/systems/SystemsLean/EmitExtractScaffold.lean",
   "src/systems/SystemsLean/EmitBannerScaffold.lean",
   "src/systems/SystemsLean/KernelSelfApply.lean",
   "src/systems/SystemsLean/KernelSelfApplyTheorems.lean",
   "src/systems/SystemsLean/EmitMult.lean",
   "src/systems/SystemsLean/EmitPlan.lean",
   "src/systems/SystemsLean/EmitApply.lean",
   "src/systems/SystemsLean/EmitBody.lean",
   "src/systems/SystemsLean/KernelEmit.lean",
   "src/systems/SystemsLean/KernelEmitTheorems.lean",
   "src/systems/SystemsLean/ParityMult.lean",
   "src/systems/SystemsLean/ParityMultTheorems.lean",
   "src/systems/SystemsLean/ParityLinear.lean",
   "src/systems/SystemsLean/ParityLinearTheorems.lean",
   "src/systems/SystemsLean/ParityTypes.lean",
   "src/systems/SystemsLean/ParityTypesTheorems.lean",
   "src/systems/SystemsLean/ParityProgram.lean",
   "src/systems/SystemsLean/ParityProgramTheorems.lean",
   "src/systems/SystemsLean/ParityEmit.lean",
   "src/systems/SystemsLean/ParityEmitTheorems.lean",
   "src/systems/SystemsLean/SelfApply.lean",
   "src/systems/SystemsLean/SelfApplyTheorems.lean",
   "src/systems/SystemsLean/EmitLinear.lean",
   "src/systems/SystemsLean/EmitTypes.lean",
   "src/systems/SystemsLean/EmitProgram.lean",
   "src/systems/SystemsLean/EmitGraph.lean",
   "src/systems/SystemsLean/EmitCompose.lean",
   "src/systems/SystemsLean/EmitErasure.lean",
   "src/systems/SystemsLean/EmitExtract.lean",
   "src/systems/SystemsLean/EmitBanner.lean",
   "src/systems/SystemsLean/ProductOutKernel.lean",
   "src/systems/SystemsLean/ProductOutKernelTheorems.lean",
   "src/systems/SystemsLean/BootstrapHonesty.lean",
   "src/systems/SystemsLean/BootstrapHonestyTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterSurface.lean",
   "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterPathPlan.lean",
   "src/systems/SystemsLean/ProductPathWriterPathPlanTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterPathExec.lean",
   "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean",
   "src/systems/SystemsLean/ProductPathOwnershipInputs.lean",
   "src/systems/SystemsLean/ProductPathOwnershipInputsTheorems.lean",
   "src/systems/SystemsLean/ProductPathPerform.lean",
   "src/systems/SystemsLean/ProductPathPerformTheorems.lean",
   "src/systems/SystemsLean/ProductPathPerformStep.lean",
   "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean",
   "src/systems/SystemsLean/ProductPathReadSsot.lean",
   "src/systems/SystemsLean/ProductPathReadSsotTheorems.lean",
   "src/systems/SystemsLean/ProductPathComposePlan.lean",
   "src/systems/SystemsLean/ProductPathComposePlanTheorems.lean",
   "src/systems/SystemsLean/Capable.lean",
   "src/systems/SystemsLean/CapableTheorems.lean",
   "src/systems/SystemsLean/CapableStepContract.lean",
   "src/systems/SystemsLean/CapableStepContractTheorems.lean",
   "src/systems/SystemsLean/InstallOut.lean",
   "src/systems/SystemsLean/InstallOutTheorems.lean",
   "src/systems/SystemsLean/OfficialPath.lean",
   "src/systems/SystemsLean/OfficialPathTheorems.lean",
   "src/systems/SystemsLean/PerformEvidence.lean",
   "src/systems/SystemsLean/PerformEvidenceTheorems.lean",
   "src/systems/SystemsLean/CapableRead.lean",
   "src/systems/SystemsLean/CapableReadTheorems.lean",
   "src/systems/SystemsLean/CapableCompose.lean",
   "src/systems/SystemsLean/CapableComposeTheorems.lean",
   "src/systems/SystemsLean/CapableFullBar.lean",
   "src/systems/SystemsLean/CapableFullBarTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteCapableGap.lean",
   "src/systems/SystemsLean/DualEqWriteCapableGapTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteClosePath.lean",
   "src/systems/SystemsLean/DualEqWriteClosePathTheorems.lean",
   "src/systems/SystemsLean/DualEqWriteParity.lean",
   "src/systems/SystemsLean/DualEqWriteParityTheorems.lean",
   "src/systems/SystemsLean/OfficialRetire.lean",
   "src/systems/SystemsLean/OfficialRetireTheorems.lean",
   "src/systems/SystemsLean/OwnershipClaimed.lean",
   "src/systems/SystemsLean/OwnershipClaimedTheorems.lean",
   "src/systems/SystemsLean/PerformClaimed.lean",
   "src/systems/SystemsLean/PerformClaimedTheorems.lean",
   "src/systems/SystemsLean/StepContractFull.lean",
   "src/systems/SystemsLean/StepContractFullTheorems.lean",
   "src/systems/SystemsLean/SelfHostComplete.lean",
   "src/systems/SystemsLean/SelfHostCompleteTheorems.lean",
   "src/systems/SystemsLean/OfficialPathAlternate.lean",
   "src/systems/SystemsLean/OfficialPathAlternateTheorems.lean",
   "src/systems/SystemsLean/ProductPathOwnershipRegenerate.lean",
   "src/systems/SystemsLean/ProductPathOwnershipRegenerateTheorems.lean",
   "src/systems/SystemsLean/CapableWriteHcLoad.lean",
   "src/systems/SystemsLean/DualEqWriteLoad.lean",
   "src/systems/SystemsLean/CapableWriteHc.lean",
   "src/systems/SystemsLean/DualEqWriteApi.lean",
   "src/systems/SystemsLean/LlvmHold.lean",
   "src/systems/SystemsLean/LlvmHoldTheorems.lean",
   "src/systems/SystemsLean/CapableRegenerate.lean",
   "src/systems/SystemsLean/CapableRegenerateTheorems.lean",
   "src/systems/SystemsLean/FreestandingEmitLoad.lean",
   "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean",
   "src/systems/SystemsLean/LakeRetireInventory.lean",
   "src/systems/SystemsLean/HostPackageRoots.lean",
   "src/systems/SystemsLean/FreestandingEmit.lean",
   "src/systems/SystemsLean/ProductPathWriteHc.lean",
   "src/systems/SystemsLean/ProductPathWriteHcTheorems.lean",
   "src/systems/SystemsLean/CompilePathMult.lean",
   "src/systems/SystemsLean/CompilePathLinear.lean",
   "src/systems/SystemsLean/CompilePathTypes.lean",
   "src/systems/SystemsLean/CompilePathProgram.lean",
   "src/systems/SystemsLean/CompilePathGraph.lean",
   "src/systems/SystemsLean/CompilePathCompose.lean",
   "src/systems/SystemsLean/CompilePathPlan.lean",
   "src/systems/SystemsLean/CompilePathApply.lean",
   "src/systems/SystemsLean/CompilePathBody.lean",
   "src/systems/SystemsLean/CompilePathErasure.lean",
   "src/systems/SystemsLean/CompilePathExtract.lean",
   "src/systems/SystemsLean/ProductWireWriteTool.lean",
   "src/systems/SystemsLean/HostTerm.lean",
   "src/systems/SystemsLean/LlvmEmitPath.lean",
   "src/systems/SystemsLean/SubsetFront.lean",
   "src/systems/SystemsLean/FirstSurface.lean",
   "src/systems/SystemsLean/LinearSubsetEmit.lean",
   "src/systems/SystemsLean/TypesSubsetEmit.lean",
   "src/systems/SystemsLean/ProgramSubsetEmit.lean",
   "src/systems/SystemsLean/GraphSubsetEmit.lean",
   "src/systems/SystemsLean/ComposeSubsetEmit.lean",
   "src/systems/SystemsLean/ErasureSubsetEmit.lean",
   "src/systems/SystemsLean/ExtractSubsetEmit.lean",
   "src/systems/SystemsLean/MultSubsetEmit.lean",
   "src/systems/SystemsLean/MultSubsetRebuild.lean",
   "src/systems/SystemsLean/LinearSubsetRebuild.lean",
   "src/systems/SystemsLean/TypesSubsetRebuild.lean",
   "src/systems/SystemsLean/ProgramSubsetRebuild.lean",
   "src/systems/SystemsLean/GraphSubsetRebuild.lean",
   "src/systems/SystemsLean/ComposeSubsetRebuild.lean",
   "src/systems/SystemsLean/ErasureSubsetRebuild.lean",
   "src/systems/SystemsLean/ExtractSubsetRebuild.lean",
   "src/systems/SystemsLean/HostFront.lean",
   "src/systems/SystemsLean/LlvmMultText.lean",
   "src/systems/SystemsLean/HostFrontTheorems.lean",
   "src/systems/SystemsLean/HostCheck.lean",
   "src/systems/SystemsLean/HostGraph.lean",
   "src/systems/SystemsLean/LlvmLinearText.lean",
   "src/systems/SystemsLean/MultFsWriteTool.lean",
   "src/systems/SystemsLean/FrontMultPackage.lean",
   "src/systems/SystemsLean/SubsetPackageJoin.lean",
   "src/systems/SystemsLean/HostGraphTheorems.lean",
   "src/systems/SystemsLean/LlvmTypesText.lean",
   "src/systems/SystemsLean/MultFsDeepen.lean",
   "src/systems/SystemsLean/HostPackageWrite.lean",
   "src/systems/SystemsLean/HostPackageWriteTheorems.lean",
   "src/systems/SystemsLean/LlvmProgramText.lean",
   "src/systems/SystemsLean/LlvmGraphText.lean",
   "src/systems/SystemsLean/LlvmComposeText.lean",
   "src/systems/SystemsLean/SelfApplyFs.lean",
   "src/systems/SystemsLean/SelfApplyFsTheorems.lean",
   "src/systems/SystemsLean/InventoryClose.lean",
   "src/systems/SystemsLean/ProductPathBars.lean",
   "src/systems/SystemsLean/InventoryCloseTheorems.lean",
   "src/systems/SystemsLean/ProductPath.lean",
   "src/systems/SystemsLean/ProductPathTheorems.lean",
   "src/systems/SystemsLean/DualResidual.lean",
   "src/systems/SystemsLean/DualResidualTheorems.lean",
   "src/systems/SystemsLean/ProbeWire.lean",
   "src/systems/SystemsLean/SelfHostBody.lean",
   "src/systems/SystemsLean/ProbeWireTheorems.lean",
   "src/systems/SystemsLean/SelfHostBodyTheorems.lean",
   "src/systems/SystemsLean/SpecProof.lean",
   "src/systems/SystemsLean/SpecProofTheorems.lean"]
/-- Expand slice Name (living). Greppable: hostImportGraphExpandSliceName,
    Host library seed expand continue. Prior: Host real module seed expand. -/
def hostImportGraphExpandSliceName : String := "Host library seed expand continue"

/-- Compact seed-unit inventory string (HostResidualShrink dual cite).
    Greppable: hostImportGraphSeedUnitsLabel,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems. -/
def hostImportGraphSeedUnitsLabel : String :=
  "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems"

/-- Library dir relative to repo root (path join for seed files). -/
def hostImportGraphLibraryDirRel : String := "src/systems/SystemsLean"

/-- Host elaborator residual still remains (full elaborate still Lake).
    Greppable: hostImportGraphHostElaboratorResidualRemains. -/
def hostImportGraphHostElaboratorResidualRemains : Bool := true

/-- Local honesty: host develop surface still uses Lake bootstrap for this bin.
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostImportGraphStillUsesLake : Bool := stillUsesLake
def hostImportGraphDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostImportGraphResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostImportGraphProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostImportGraphProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostImportGraphLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostImportGraphProvablyUnlocked : Bool := false

/-- Local honesty: does not claim host free. -/
def hostImportGraphHostFreeClaimed : Bool := false

/-- Local finished pin (real Mult import graph surface closed).
    Greppable: hostImportGraphFinishedClaimed. -/
def hostImportGraphFinishedClaimed : Bool := true

/-- Without-Lake measured step finished pin.
    Greppable: hostImportGraphWithoutLakeFinished,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def hostImportGraphWithoutLakeFinished : Bool := true

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonMissingImport : String := "MISSING-IMPORT"
def reasonImportCycle : String := "IMPORT-CYCLE"
def reasonEmptyGraph : String := "EMPTY-GRAPH"
def reasonDupModule : String := "DUP-MODULE"
def reasonMissingFile : String := "MISSING-FILE"
def reasonSeedMismatch : String := "SEED-MISMATCH"
end SystemsLean.HostImportGraph
