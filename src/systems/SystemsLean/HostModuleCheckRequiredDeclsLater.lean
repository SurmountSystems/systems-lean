/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck required key-decl lists (CompilePathCompose..SelfApply).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.HostModuleCheckFixtures: required key-decl list defs for CompilePathCompose through SelfApplyTheorems.
  Same namespace SystemsLean.HostModuleCheck so names stay unqualified.

  Intentional non-claims:
  - PARTIAL-STRUCTURAL only -- not full elaborator typecheck.
  - Not host residual free. Not full library. Not product free flip.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckRequiredDeclsLater,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, Host library seed expand continue,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckRequiredDeclsLater
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckRequiredDeclsLater;
  lake build SystemsLean.HostModuleCheck.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

namespace SystemsLean.HostModuleCheck

/-- Required CompilePathCompose key decls.
    Greppable: compilePathComposeRequiredDecls, Host library seed expand continue. -/
def compilePathComposeRequiredDecls : List String :=
  ["def:composeFixtureProgramReady",
   "def:composeFixtureComposeReady",
   "def:composeFixtureEmitPathOk",
   "def:composeFixtureCompilePathReady",
   "def:composeFixtureResidualFreeClaimed"]

/-- Required CompilePathPlan key decls.
    Greppable: compilePathPlanRequiredDecls, Host library seed expand continue. -/
def compilePathPlanRequiredDecls : List String :=
  ["def:planFixtureProgramReady",
   "def:planFixtureComposeReady",
   "def:planFixtureEmitPathOk",
   "def:planFixtureCompilePathReady",
   "def:planFixtureResidualFreeClaimed"]

/-- Required CompilePathApply key decls.
    Greppable: compilePathApplyRequiredDecls, Host library seed expand continue. -/
def compilePathApplyRequiredDecls : List String :=
  ["def:applyFixtureProgramReady",
   "def:applyFixtureComposeReady",
   "def:applyFixtureEmitPathOk",
   "def:applyFixtureCompilePathReady",
   "def:applyFixtureResidualFreeClaimed"]

/-- Required CompilePathBody key decls.
    Greppable: compilePathBodyRequiredDecls, Host library seed expand continue. -/
def compilePathBodyRequiredDecls : List String :=
  ["def:bodyFixtureProgramReady",
   "def:bodyFixtureComposeReady",
   "def:bodyFixtureEmitPathOk",
   "def:bodyFixtureCompilePathReady",
   "def:bodyFixtureResidualFreeClaimed"]

/-- Required CompilePathErasure key decls.
    Greppable: compilePathErasureRequiredDecls, Host library seed expand continue. -/
def compilePathErasureRequiredDecls : List String :=
  ["def:erasureFixtureProgramReady",
   "def:erasureFixtureComposeReady",
   "def:erasureFixtureEmitPathOk",
   "def:erasureFixtureCompilePathReady",
   "def:erasureFixtureResidualFreeClaimed"]

/-- Required CompilePathExtract key decls.
    Greppable: compilePathExtractRequiredDecls, Host library seed expand continue. -/
def compilePathExtractRequiredDecls : List String :=
  ["def:multFixtureExtractGateOk",
   "def:programFixtureExtractGateOk",
   "def:extractRuntimeFsGateReady",
   "def:extractRuntimeFsResidualFreeClaimed"]

/-- Required ProductWireWriteTool key decls.
    Greppable: productWireWriteToolRequiredDecls, Host library seed expand continue. -/
def productWireWriteToolRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:productWireFsWriterReady",
   "def:productWireFsWriterFinishedClaimed",
   "def:productWireFsWriterNativeIo"]

/-- Required HostTerm key decls.
    Greppable: hostTermRequiredDecls, Host library seed expand continue. -/
def hostTermRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:isWellFormed",
   "def:hostTermReady",
   "def:multFixtureModule"]

/-- Required LlvmEmitPath key decls.
    Greppable: llvmEmitPathRequiredDecls, Host library seed expand continue. -/
def llvmEmitPathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmEmitPathReady",
   "def:llvmEmitPathFinishedClaimed",
   "def:llvmEmitPathStubLanded"]

/-- Required SubsetFront key decls.
    Greppable: subsetFrontRequiredDecls, Host library seed expand continue. -/
def subsetFrontRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:subsetFrontReady",
   "def:justRecipe",
   "def:goldensRel"]

/-- Required FirstSurface key decls.
    Greppable: firstSurfaceRequiredDecls, Host library seed expand continue. -/
def firstSurfaceRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:firstSurfaceReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required LinearSubsetEmit key decls.
    Greppable: linearSubsetEmitRequiredDecls, Host library seed expand continue. -/
def linearSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:linearSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required TypesSubsetEmit key decls.
    Greppable: typesSubsetEmitRequiredDecls, Host library seed expand continue. -/
def typesSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:typesSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ProgramSubsetEmit key decls.
    Greppable: programSubsetEmitRequiredDecls, Host library seed expand continue. -/
def programSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:programSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required GraphSubsetEmit key decls.
    Greppable: graphSubsetEmitRequiredDecls, Host library seed expand continue. -/
def graphSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:graphSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ComposeSubsetEmit key decls.
    Greppable: composeSubsetEmitRequiredDecls, Host library seed expand continue. -/
def composeSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:composeSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ErasureSubsetEmit key decls.
    Greppable: erasureSubsetEmitRequiredDecls, Host library seed expand continue. -/
def erasureSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:erasureSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ExtractSubsetEmit key decls.
    Greppable: extractSubsetEmitRequiredDecls, Host library seed expand continue. -/
def extractSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:extractSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required MultSubsetEmit key decls.
    Greppable: multSubsetEmitRequiredDecls, Host library seed expand continue. -/
def multSubsetEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:multSubsetEmitReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required MultSubsetRebuild key decls.
    Greppable: multSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def multSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:multSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required LinearSubsetRebuild key decls.
    Greppable: linearSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def linearSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:linearSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required TypesSubsetRebuild key decls.
    Greppable: typesSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def typesSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:typesSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ProgramSubsetRebuild key decls.
    Greppable: programSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def programSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:programSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required GraphSubsetRebuild key decls.
    Greppable: graphSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def graphSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:graphSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ComposeSubsetRebuild key decls.
    Greppable: composeSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def composeSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:composeSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ErasureSubsetRebuild key decls.
    Greppable: erasureSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def erasureSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:erasureSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required ExtractSubsetRebuild key decls.
    Greppable: extractSubsetRebuildRequiredDecls, Host library seed expand continue. -/
def extractSubsetRebuildRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:extractSubsetRebuildReady",
   "def:justRecipe",
   "def:emitHeaderBase"]

/-- Required HostFront key decls.
    Greppable: hostFrontRequiredDecls, Host library seed expand continue. -/
def hostFrontRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:hostFrontReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required LlvmMultText key decls.
    Greppable: llvmMultTextRequiredDecls, Host library seed expand continue. -/
def llvmMultTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmMultTextReady",
   "def:justRecipe",
   "def:surfaceId"]


/-- Required HostFrontTheorems key decls (ns HostFront).
    Greppable: hostFrontTheoremsRequiredDecls, Host library seed expand continue. -/
def hostFrontTheoremsRequiredDecls : List String :=
  ["theorem:hostFrontReady_true",
   "theorem:hostFrontGoodG1_true",
   "theorem:hostFront_claims_false"]

/-- Required HostCheck key decls.
    Greppable: hostCheckRequiredDecls, Host library seed expand continue. -/
def hostCheckRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:hostFragmentCheckReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required HostGraph key decls.
    Greppable: hostGraphRequiredDecls, Host library seed expand continue. -/
def hostGraphRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:hostGraphReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required LlvmLinearText key decls.
    Greppable: llvmLinearTextRequiredDecls, Host library seed expand continue. -/
def llvmLinearTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmLinearTextReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required MultFsWriteTool key decls.
    Greppable: multFsWriteToolRequiredDecls, Host library seed expand continue. -/
def multFsWriteToolRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:multFsWriteToolReady",
   "def:justRecipeWriteTool",
   "def:surfaceId"]

/-- Required FrontMultPackage key decls.
    Greppable: frontMultPackageRequiredDecls, Host library seed expand continue. -/
def frontMultPackageRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:frontMultPackageReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required SubsetPackageJoin key decls.
    Greppable: subsetPackageJoinRequiredDecls, Host library seed expand continue. -/
def subsetPackageJoinRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:subsetPackageJoinReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required HostGraphTheorems key decls (ns HostGraph).
    Greppable: hostGraphTheoremsRequiredDecls, Host library seed expand continue. -/
def hostGraphTheoremsRequiredDecls : List String :=
  ["theorem:hostGraphReady_true",
   "theorem:hostGraphGoodClosure_true",
   "theorem:hostGraph_claims_false"]

/-- Required LlvmTypesText key decls.
    Greppable: llvmTypesTextRequiredDecls, Host library seed expand continue. -/
def llvmTypesTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmTypesTextReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required MultFsDeepen key decls.
    Greppable: multFsDeepenRequiredDecls, Host library seed expand continue. -/
def multFsDeepenRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:multFsDeepenReady",
   "def:justRecipeFsDeepen",
   "def:surfaceId"]

/-- Required HostPackageWrite key decls.
    Greppable: hostPackageWriteRequiredDecls, Host library seed expand continue. -/
def hostPackageWriteRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:hostPackageWriteReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required HostPackageWriteTheorems key decls (ns HostPackageWrite).
    Greppable: hostPackageWriteTheoremsRequiredDecls, Host library seed expand continue. -/
def hostPackageWriteTheoremsRequiredDecls : List String :=
  ["theorem:hostPackageWriteReady_true",
   "theorem:hostPackageWriteFinishedClaimed_true",
   "theorem:hostPackageWrite_claims_false"]

/-- Required LlvmProgramText key decls.
    Greppable: llvmProgramTextRequiredDecls, Host library seed expand continue. -/
def llvmProgramTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmProgramTextReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required LlvmGraphText key decls.
    Greppable: llvmGraphTextRequiredDecls, Host library seed expand continue. -/
def llvmGraphTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmGraphTextReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required LlvmComposeText key decls.
    Greppable: llvmComposeTextRequiredDecls, Host library seed expand continue. -/
def llvmComposeTextRequiredDecls : List String :=
  ["def:stageId",
   "def:hostId",
   "def:llvmComposeTextReady",
   "def:justRecipe",
   "def:surfaceId"]

/-- Required SelfApplyFs key decls (on-disk SelfApplyFs.lean surface).
    Greppable: selfApplyFsRequiredDecls, Host library seed expand continue. -/
def selfApplyFsRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSelfApplyFsId",
   "def:selfHostSelfApplyFsId",
   "def:freestandingSelfApplyReady",
   "def:freestandingProductSelfHostComplete"]

/-- Required SelfApplyFsTheorems key decls (library seed expand continue).
    Namespace SystemsLean.SelfApplyFs (same as parent).
    Greppable: selfApplyFsTheoremsRequiredDecls, Host library seed expand continue. -/
def selfApplyFsTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSelfApplyFsId_eq",
   "theorem:freestandingProductSelfHostComplete_true",
   "theorem:freestandingSelfApplyReady_true",
   "theorem:selfApplyFsDoesNotComplete_false"]

/-- Required InventoryClose key decls (on-disk InventoryClose.lean surface).
    Greppable: inventoryCloseRequiredDecls, Host library seed expand continue. -/
def inventoryCloseRequiredDecls : List String :=
  ["def:stageId",
   "def:hostInventoryCloseId",
   "def:residualFreeClaimed",
   "def:inventoryCloseReady",
   "def:inventoryCloseOk"]

/-- Required ProductPathBars key decls (on-disk ProductPathBars.lean surface).
    Namespace SystemsLean.ProductPath (same as ProductPath).
    Greppable: productPathBarsRequiredDecls, Host library seed expand continue. -/
def productPathBarsRequiredDecls : List String :=
  ["def:freestandingUnitProductPathReady",
   "def:freestandingProgramProductPathReady",
   "def:freestandingEmitProductPathReady",
   "def:freestandingProductPathReady"]

/-- Required InventoryCloseTheorems key decls (library seed expand continue).
    Namespace SystemsLean.InventoryClose (same as parent).
    Greppable: inventoryCloseTheoremsRequiredDecls, Host library seed expand continue. -/
def inventoryCloseTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostInventoryCloseId_eq",
   "theorem:residualFreeClaimed_false",
   "theorem:inventoryCloseReady_true",
   "theorem:inventoryCloseDoesNotMeanResidualFree_true"]

/-- Required ProductPath key decls (on-disk ProductPath.lean surface).
    Greppable: productPathRequiredDecls, Host library seed expand continue. -/
def productPathRequiredDecls : List String :=
  ["def:stageId",
   "def:hostProductPathId",
   "def:residualFreeClaimed",
   "def:productPathReady",
   "def:productPathOk"]

/-- Required ProductPathTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ProductPath (same as parent).
    Greppable: productPathTheoremsRequiredDecls, Host library seed expand continue. -/
def productPathTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostProductPathId_eq",
   "theorem:residualFreeClaimed_false",
   "theorem:productPathReady_true",
   "theorem:productPathDoesNotMeanResidualFree_true"]

/-- Required DualResidual key decls (PARTIAL-STRUCTURAL seed; host free
    claimed true; residual-free claimed true).
    Greppable: dualResidualRequiredDecls, Host library seed expand continue. -/
def dualResidualRequiredDecls : List String :=
  ["def:stageId",
   "def:hostDualResidualId",
   "def:hostElaboratorResidualRemains",
   "def:hostElaboratorResidualFreeClaimed",
   "def:residualFreeClaimed",
   "def:dualResidualReady"]

/-- Required DualResidualTheorems key decls (library seed expand continue).
    Namespace SystemsLean.DualResidual (same as parent).
    Greppable: dualResidualTheoremsRequiredDecls, Host library seed expand continue. -/
def dualResidualTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostElaboratorResidualRemains_false",
   "theorem:dualResidualReady_true",
   "theorem:dualResidualDoesNotForgeHostFree_true",
   "theorem:dualResidualOk_eq_ready"]

/-- Required ProbeWire key decls (library seed expand continue).
    Greppable: probeWireRequiredDecls, Host library seed expand continue. -/
def probeWireRequiredDecls : List String :=
  ["def:stageId",
   "def:hostProbeWireId",
   "def:behavioralProbeIsSmokeDebt",
   "def:residualFreeClaimed",
   "def:probeWireReady"]

/-- Required SelfHostBody key decls (library seed expand continue).
    Greppable: selfHostBodyRequiredDecls, Host library seed expand continue. -/
def selfHostBodyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSelfHostBodyId",
   "def:residualFreeClaimed",
   "def:selfHostBodyReady",
   "def:selfHostBodyOk"]

/-- Required ProbeWireTheorems key decls (library seed expand continue).
    Namespace SystemsLean.ProbeWire.
    Greppable: probeWireTheoremsRequiredDecls, Host library seed expand continue. -/
def probeWireTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostProbeWireId_eq",
   "theorem:behavioralProbeIsSmokeDebt_true",
   "theorem:residualFreeClaimed_false",
   "theorem:probeWireReady_true"]

/-- Required SelfHostBodyTheorems key decls (library seed expand continue).
    Namespace SystemsLean.SelfHostBody.
    Greppable: selfHostBodyTheoremsRequiredDecls, Host library seed expand continue. -/
def selfHostBodyTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSelfHostBodyId_eq",
   "theorem:residualFreeClaimed_false",
   "theorem:selfHostBodyReady_true",
   "theorem:selfHostBodyDoesNotMeanResidualFree_true"]

/-- Required SpecProof key decls (library seed expand continue).
    Greppable: specProofRequiredDecls, Host library seed expand continue. -/
def specProofRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSpecProofId",
   "def:specSurfaceStated",
   "def:proofCompleteClaimed",
   "def:specProofReady"]

/-- Required SpecProofTheorems key decls (library seed expand continue).
    Namespace SystemsLean.SpecProof.
    Greppable: specProofTheoremsRequiredDecls, Host library seed expand continue. -/
def specProofTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSpecProofId_eq",
   "theorem:specSurfaceStated_true",
   "theorem:proofCompleteClaimed_true",
   "theorem:specProofReady_true"]

/-- Required EmitPlan product key decls (Kind-surface second band:
    structure Plan + plan/count surface under FOUNDATION-KIND-SURFACE).
    Greppable: emitPlanRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface second band. -/
def emitPlanRequiredDecls : List String :=
  ["structure:Plan",
   "def:Plan.failClosed",
   "def:planFromCompose",
   "def:fromCompose",
   "def:isReady",
   "def:planOk",
   "def:isRuntimeMult",
   "def:countRuntimeNodes",
   "def:countErasedNodes"]

/-- Required EmitApply product key decls (Kind-surface second band:
    structure Apply + apply/pack surface under FOUNDATION-KIND-SURFACE).
    Greppable: emitApplyRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface second band. -/
def emitApplyRequiredDecls : List String :=
  ["structure:Apply",
   "def:Apply.failClosed",
   "def:applyCap",
   "def:applyFromCompose",
   "def:fromCompose",
   "def:applyIsValid",
   "def:applyOk",
   "def:packTag",
   "def:multCode",
   "def:tagMult"]

/-- Required EmitBody product key decls (Kind-surface second band:
    structure Body + body/fragment surface under FOUNDATION-KIND-SURFACE).
    Greppable: emitBodyRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface second band. -/
def emitBodyRequiredDecls : List String :=
  ["structure:Body",
   "def:Body.failClosed",
   "def:bodyCap",
   "def:bodyFromCompose",
   "def:fromCompose",
   "def:bodyIsValid",
   "def:bodyOk",
   "def:buildFragment"]

/-- Required KernelEmit product key decls (Kind-surface band expand:
    path-ready + lower compose + product emit ids under FOUNDATION-KIND-SURFACE).
    Greppable: kernelEmitRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:kernelEmitId",
   "def:hostKernelEmitId",
   "def:emitKernelReady",
   "def:emitKernelOk",
   "def:emitPlanPathReady",
   "def:emitApplyPathReady",
   "def:emitBodyPathReady",
   "def:lowerEmitCompose",
   "def:emitSurfaceOk",
   "def:productEmitPlanId",
   "def:productEmitBodyId"]

/-- Required KernelEmitTheorems key decls (Kind-surface band expand corpus).
    Namespace SystemsLean.KernelEmit (same as parent).
    Greppable: kernelEmitTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE. -/
def kernelEmitTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:kernelEmitId_eq",
   "theorem:hostKernelEmitId_eq",
   "theorem:emitKernelReady_true",
   "theorem:emitKernelOk_true",
   "theorem:emitPlanPathReady_true",
   "theorem:emitApplyPathReady_true",
   "theorem:emitBodyPathReady_true",
   "theorem:lowerEmitCompose_isSome",
   "theorem:lowerEmitCompose_plan_counts",
   "theorem:lowerEmitCompose_apply_tags",
   "theorem:lowerEmitCompose_body_fragment"]

/-- Required ParityMult key decls (Kind-surface third band: readiness/path
    surface under FOUNDATION-KIND-SURFACE; no local structure/axiom on disk).
    Greppable: parityMultRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityMultRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityMultId",
   "def:selfHostParityMultId",
   "def:multParityReady",
   "def:multParityOk",
   "def:gradeParityOk",
   "def:paritySurfaceOk",
   "def:ofNatRoundTripOk",
   "def:nameParityOk",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:productProbePath"]

/-- Required ParityMultTheorems key decls (Kind-surface third band corpus).
    Namespace SystemsLean.ParityMult (same as parent).
    Greppable: parityMultTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityMultTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityMultId_eq",
   "theorem:selfHostParityMultId_eq",
   "theorem:multParityReady_true",
   "theorem:multParityOk_true",
   "theorem:multParityOk_eq_ready",
   "theorem:gradeParityOk_true",
   "theorem:ofNatRoundTripOk_true",
   "theorem:isValidTagParityOk_true",
   "theorem:nameParityOk_true"]

/-- Required ParityLinear key decls (Kind-surface third band readiness/path).
    Greppable: parityLinearRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityLinearRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityLinearId",
   "def:selfHostParityLinearId",
   "def:linearParityReady",
   "def:linearParityOk",
   "def:linearContractParityOk",
   "def:multLinearParityReady",
   "def:paritySurfaceOk",
   "def:productApiSurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:productProbePath"]

/-- Required ParityLinearTheorems key decls (Kind-surface third band corpus).
    Namespace SystemsLean.ParityLinear (same as parent).
    Greppable: parityLinearTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityLinearTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityLinearId_eq",
   "theorem:selfHostParityLinearId_eq",
   "theorem:linearParityReady_true",
   "theorem:linearParityOk_true",
   "theorem:linearContractParityOk_true",
   "theorem:multLinearParityReady_true",
   "theorem:productApiSurfaceOk_true"]

/-- Required ParityTypes key decls (Kind-surface third band readiness/path).
    Greppable: parityTypesRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityTypesRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityTypesId",
   "def:selfHostParityTypesId",
   "def:typesParityReady",
   "def:typesParityOk",
   "def:typesContractParityOk",
   "def:multLinearTypesParityReady",
   "def:paritySurfaceOk",
   "def:productApiSurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:productProbePath"]

/-- Required ParityTypesTheorems key decls (Kind-surface third band corpus).
    Namespace SystemsLean.ParityTypes (same as parent).
    Greppable: parityTypesTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityTypesTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityTypesId_eq",
   "theorem:selfHostParityTypesId_eq",
   "theorem:typesParityReady_true",
   "theorem:typesParityOk_true",
   "theorem:typesContractParityOk_true",
   "theorem:multLinearTypesParityReady_true",
   "theorem:productApiSurfaceOk_true"]

/-- Required ParityProgram key decls (Kind-surface third band readiness/path).
    Greppable: parityProgramRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityProgramRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityProgramId",
   "def:selfHostParityProgramId",
   "def:programParityReady",
   "def:programParityOk",
   "def:programContractParityOk",
   "def:multLinearTypesProgramParityReady",
   "def:paritySurfaceOk",
   "def:productApiSurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:productProbePath"]

/-- Required ParityProgramTheorems key decls (Kind-surface third band corpus).
    Namespace SystemsLean.ParityProgram (same as parent).
    Greppable: parityProgramTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityProgramTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityProgramId_eq",
   "theorem:selfHostParityProgramId_eq",
   "theorem:programParityReady_true",
   "theorem:programParityOk_true",
   "theorem:programContractParityOk_true",
   "theorem:multLinearTypesProgramParityReady_true",
   "theorem:productApiSurfaceOk_true"]

/-- Required ParityEmit key decls (Kind-surface third band readiness/path).
    Greppable: parityEmitRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityEmitRequiredDecls : List String :=
  ["def:stageId",
   "def:hostParityEmitId",
   "def:selfHostParityEmitId",
   "def:emitParityReady",
   "def:emitParityOk",
   "def:emitContractParityOk",
   "def:multLinearTypesProgramEmitParityReady",
   "def:paritySurfaceOk",
   "def:productApiSurfaceOk",
   "def:acceptancePath",
   "def:hostModulePath",
   "def:productProbePath"]

/-- Required ParityEmitTheorems key decls (Kind-surface third band corpus).
    Namespace SystemsLean.ParityEmit (same as parent).
    Greppable: parityEmitTheoremsRequiredDecls, Check depth deepen continue,
    FOUNDATION-KIND-SURFACE, Kind-surface third band. -/
def parityEmitTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostParityEmitId_eq",
   "theorem:selfHostParityEmitId_eq",
   "theorem:emitParityReady_true",
   "theorem:emitParityOk_true",
   "theorem:emitContractParityOk_true",
   "theorem:multLinearTypesProgramEmitParityReady_true",
   "theorem:productApiSurfaceOk_true"]

/-- Required SelfApply key decls (on-disk SelfApply.lean defs).
    Greppable: selfApplyRequiredDecls, Host library seed expand continue. -/
def selfApplyRequiredDecls : List String :=
  ["def:stageId",
   "def:hostSelfApplyId",
   "def:selfHostSelfApplyId",
   "def:selfApplySurfaceOk",
   "def:kernelRebuildsKernel",
   "def:selfApplyReady",
   "def:acceptancePath",
   "def:hostModulePath"]

/-- Required SelfApplyTheorems key decls (library seed expand continue).
    Namespace SystemsLean.SelfApply (same as parent).
    Greppable: selfApplyTheoremsRequiredDecls, Host library seed expand continue. -/
def selfApplyTheoremsRequiredDecls : List String :=
  ["theorem:stageId_eq",
   "theorem:hostSelfApplyId_eq",
   "theorem:selfApplySurfaceOk_true",
   "theorem:kernelRebuildsKernel_true",
   "theorem:selfApplyReady_true"]

end SystemsLean.HostModuleCheck
