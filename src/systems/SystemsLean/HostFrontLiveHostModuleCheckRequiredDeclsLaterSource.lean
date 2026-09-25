/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live
  HostModuleCheckRequiredDeclsLater.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckRequiredDeclsLaterSource.
  Not occupancy name 50. Not mill 70.
  This wrap is HostModuleCheckRequiredDeclsLater.lean, first half.
  It is not HostModuleCheck and not HostFront.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  Greppable: SYSTEMS_LEAN_HOST,
  liveHostModuleCheckRequiredDeclsLaterSource0,
  HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSLATER, liveRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  FullBackend stays false in the wrap.
  FullHostElaborateRemains stays false.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater

/-- Dual-pinned live HostModuleCheckRequiredDeclsLater.lean bytes, first half.
    Concatenate liveHostModuleCheckRequiredDeclsLaterSource0 then
    liveHostModuleCheckRequiredDeclsLaterSource1 before parse.
    Greppable: liveHostModuleCheckRequiredDeclsLaterSource0,
    HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSLATER. -/
def liveHostModuleCheckRequiredDeclsLaterSource0 : String := r#"/-
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
"#

end SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsLater
