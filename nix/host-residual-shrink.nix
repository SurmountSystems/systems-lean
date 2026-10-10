# SPDX-License-Identifier: Unlicense
# host-residual-shrink. Three Lean files must exist. Fixed tokens must
# appear in HostResidualShrink.lean or HostResidualShrinkTermOk.lean.
# Bool and String defs must match. Forge bans reject the opposite Bool.
# Fourteen recipe names must be line-start names in justfile or just/*.just.
# Does not call lake. Does not run a binary. Does not invoke another recipe.
# Fixed strings via nix/string-contains.nix. No whole-file regex.
#   import ./host-residual-shrink.nix { inherit lib; root; }
#   -> { ok, violations, summary, checked }
{ lib, root }:
let
  leanRel = "src/systems/SystemsLean";
  has = import ./string-contains.nix;
  absent = rel: kind: [ "${rel}: ${kind}" ];
  load = rel:
    let path = root + "/${rel}"; exists = builtins.pathExists path;
    in { inherit rel exists; content = if exists then builtins.readFile path else ""; };
  mod = load "${leanRel}/HostResidualShrink.lean";
  term = load "${leanRel}/HostResidualShrinkTermOk.lean";
  dual = load "${leanRel}/DualResidual.lean";
  files = [ mod term dual ];
  allExist = lib.all (f: f.exists) files;
  pairRel = "${mod.rel} or ${term.rel}";
  inPair = pred: pred mod.content || pred term.content;
  compactHead = tail:
    builtins.replaceStrings [ " " "\t" "\n" "\r" ] [ "" "" "" "" ] (builtins.substring 0 64 tail);
  anyTail = name: content: pred:
    let tails = lib.tail (lib.splitString "def ${name}" content);
    in tails != [ ] && lib.any pred tails;
  boolIs = name: value: content:
    anyTail name content (tail: lib.hasPrefix ":Bool:=${value}" (compactHead tail));
  stringIs = name: value: content:
    anyTail name content (tail: lib.hasPrefix ":String:=\"${value}\"" (compactHead tail));
  boolDefined = name: content:
    anyTail name content (tail: lib.hasPrefix ":Bool:=" (compactHead tail));
  nearEmpty = name: content:
    anyTail name content (tail:
      has "\"empty\"" (lib.concatStringsSep "\n" (lib.take 3 (lib.splitString "\n" tail))));
  termStems = [
    "Linear" "Types" "IrProgram" "IrGraph" "HostCompose" "Erasure" "Extract" "EmitPlan" "EmitApply" "EmitBody"
    "KernelMult" "KernelLinear" "KernelTypes" "KernelProgram" "KernelEmit" "ParityMult" "ParityLinear" "ParityTypes" "ParityProgram" "ParityEmit"
    "EmitMultScaffold" "EmitLinearScaffold" "EmitTypesScaffold" "EmitProgramScaffold" "EmitGraphScaffold" "EmitComposeScaffold" "EmitErasureScaffold" "EmitExtractScaffold" "EmitBannerScaffold"
    "KernelSelfApply" "ProductOutKernel" "CompilePath" "JoinMap" "SelfHost" "SurfaceMatrix" "SpecProof" "DualResidual"
    "CompilePathMult" "CompilePathLinear" "CompilePathTypes" "CompilePathProgram" "CompilePathGraph" "CompilePathCompose" "CompilePathErasure" "CompilePathExtract" "CompilePathPlan" "CompilePathApply" "CompilePathBody"
    "FirstSurface" "LinearSubsetEmit" "TypesSubsetEmit" "ProgramSubsetEmit" "GraphSubsetEmit" "ComposeSubsetEmit" "ErasureSubsetEmit" "ExtractSubsetEmit" "MultSubsetEmit"
    "MultSubsetRebuild" "LinearSubsetRebuild" "TypesSubsetRebuild" "ProgramSubsetRebuild" "GraphSubsetRebuild" "ComposeSubsetRebuild" "ErasureSubsetRebuild" "ExtractSubsetRebuild"
  ];
  proofStems = [ "Linear" "Types" "KernelMult" "KernelLinear" "KernelTypes" "KernelProgram" "KernelEmit" ];
  trueNames = [
    "hostResidualShrinkFinishedClaimed" "hostResidualPartialShrinkClaimed" "hostResidualShrinkHostFreeClaimed" "hostResidualShrinkInventoryReseeded"
    "hostPackageWriteMultLinearDualOk" "hostPackageWriteMultLinearTypesDualOk" "hostPackageWriteProgramPackageDualOk" "hostPackageWriteGraphPackageDualOk" "hostPackageWriteComposePackageDualOk"
    "hostPackageRootsLoadDualOk" "hostImportGraphMultSeedDualOk" "hostModuleCheckMultSeedDualOk" "hostImportGraphExpandSeedDualOk" "hostModuleCheckExpandSeedDualOk"
    "hostModuleCheckTheoremCorpusExpandDualOk" "hostModuleCheckDepthDeepenDualOk" "hostModuleCheckTermSurfaceDualOk" "hostModuleCheckProofSurfaceDualOk"
    "hostModuleCheckPackageElaborateFirstBandDualOk" "hostModuleCheckPackageElaborateProofBandDualOk" "hostModuleCheckPackageElaborateKernelBandDualOk" "hostModuleCheckPackageElaborateEnvDualOk"
    "hostFoundationToolsBinLinkWithoutLakeDualOk" "hostDevelopToolsBinLinkWithoutLakeDualOk" "hostFrontWithoutLakeDualOk" "subsetFrontWithoutLakeDualOk"
    "frontMultPackageWithoutLakeDualOk" "multSubsetRebuildWithoutLakeDualOk" "firstSurfaceWithoutLakeDualOk"
  ] ++ map (s: "hostModuleCheck${s}TermSurfaceDualOk") termStems
    ++ map (s: "hostModuleCheck${s}ProofSurfaceDualOk") proofStems;
  falseNames = [
    "hostResidualShrinkHostElaborateRemains" "hostResidualShrinkFullHostElaborateRemains"
    "hostResidualShrinkBootstrapPrebuildRemains"
  ];
  definedNames = [ "hostLibraryBandCompleteDualOk" "hostDevelopToolInventoryClosedDualOk" ];
  stringPins = [
    { name = "measuredHostLibraryProductSeedCount"; value = "206"; }
    { name = "measuredHostLibraryLeftoverProductModules"; value = "empty"; }
  ];
  nearName = "measuredHostToolInventoryDayToDayCandidatesRemain";
  dualBools = [
    { name = "hostElaboratorResidualRemains"; value = "false"; }
    { name = "hostElaboratorResidualFreeClaimed"; value = "true"; }
  ];
  pairBans = [
    { name = "hostResidualShrinkFullHostElaborateRemains"; value = "true"; }
    { name = "hostResidualShrinkHostFreeClaimed"; value = "false"; }
    { name = "hostResidualShrinkHostElaborateRemains"; value = "true"; }
    { name = "hostResidualShrinkLlvmUnlocked"; value = "true"; }
  ];
  dualBans = [
    { name = "hostElaboratorResidualRemains"; value = "true"; }
    { name = "hostElaboratorResidualFreeClaimed"; value = "false"; }
  ];
  tokens = [
    "hostResidualShrinkReady" "hostResidualShrinkFinishedClaimed" "hostResidualPartialShrinkClaimed" "hostDevelopMeasuredPathsLakeFreeEvidence" "hostResidualShrinkHostElaborateRemains" "hostResidualShrinkHostFreeClaimed"
    "hostResidualShrinkKeepsHostResidual" "hostResidualShrinkDoesNotMeanHostFree" "hostResidualShrinkFreeIsNotLakeGone" "justRecipeHostResidualShrink" "host-residual-shrink" "hostResidualShrinkBootstrapPrebuildRemains"
    "hostResidualShrinkFullHostElaborateRemains" "hostResidualShrinkDiagnosticLakeRecipesRemain" "measuredHostFoundationToolsCleanBootstrap" "host-foundation-tools-clean-bootstrap" "measuredHostFoundationToolsInventory" "fragment-check+graph+package-write+package-roots+import-graph+module-check"
    "hostFoundationToolsBinLinkWithoutLakeDualOk" "justRecipeHostFoundationToolsCleanBootstrap" "Foundation tools without Lake bootstrap" "Host tool build expand" "host-develop-tools-clean-bootstrap" "host-front-without-lake"
    "subset-front-without-lake" "front-mult-package-without-lake" "mult-subset-rebuild-without-lake" "first-surface-without-lake" "hostDevelopToolsBinLinkWithoutLakeDualOk" "hostFrontWithoutLakeDualOk"
    "subsetFrontWithoutLakeDualOk" "frontMultPackageWithoutLakeDualOk" "multSubsetRebuildWithoutLakeDualOk" "firstSurfaceWithoutLakeDualOk" "fragment-check+graph+package-write+package-roots+import-graph+module-check+host-front+subset-front+front-mult-package+mult-subset-rebuild+first-surface" "empty"
    "measuredHostLakeFreeFragmentCheck" "measuredHostLakeFreeGraph" "measuredHostLakeFreePackageWrite" "measuredHostLakeFreePackageRoots" "hostPackageRootsLoadDualOk" "measuredHostLakeFreeImportGraph"
    "hostImportGraphMultSeedDualOk" "measuredHostLakeFreeModuleCheck" "hostModuleCheckMultSeedDualOk" "measuredHostRealModuleSeedUnits" "hostImportGraphExpandSeedDualOk" "hostModuleCheckExpandSeedDualOk"
    "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems" "measuredHostPeerFragmentUnits" "measuredHostLakeFreePackageUnits" "hostPackageWriteMultLinearDualOk" "hostPackageWriteMultLinearTypesDualOk" "hostPackageWriteProgramPackageDualOk"
    "hostPackageWriteGraphPackageDualOk" "hostPackageWriteComposePackageDualOk" "hostResidualShrinkInventoryReseeded" "freeDesignNotePath" "Mult+Linear+Types+Program+Graph+Compose" "Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose"
    "host-fragment-check-without-lake" "host-graph-without-lake" "host-package-write-without-lake" "host-package-roots-without-lake" "host-import-graph-without-lake" "host-module-check-without-lake"
    "HOST-PACKAGE-ROOTS" "HOST-IMPORT-GRAPH" "HOST-MODULE-CHECK" "HOST-RESIDUAL-SHRINK" "SLAKE_HOST_RESIDUAL_SHRINK_V0" "HOST-HOST-RESIDUAL-SHRINK"
    "Check depth deepen continue" "FOUNDATION-KIND-SURFACE" "Host library band complete" "*Main lake exe entrypoints" "seed=206+Main=59+harness=141" "TERM-SURFACE"
    "PROOF-SURFACE" "PACKAGE-ELABORATE" "Mult-only" "MultTheorems-only" "MultExtractFoundation-only" "MultLinearTypesProof-only"
    "KernelEmitParity-only" "Develop tool inventory closed" "claim-capable-perform-self-host+llvm-text-writers" "claim-exes+llvm-text-writers+product-wire-Lake-mains"
    "MultTheorems=14+LinearTheorems=12+TypesTheorems=14+IrProgramTheorems=12+IrGraphTheorems=12+HostComposeTheorems=14+ErasureTheorems=14+ExtractTheorems=14+KernelMultTheorems=11+KernelLinearTheorems=12+KernelTypesTheorems=12+KernelProgramTheorems=12+KernelEmitTheorems=12+JoinMapTheorems=8+SelfHostTheorems=8+SurfaceMatrixTheorems=8"
    "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"
    "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems+ProductPathOwnershipInputs+ProductPathOwnershipInputsTheorems+ProductPathPerform+ProductPathPerformTheorems+ProductPathPerformStep+ProductPathPerformStepTheorems+ProductPathReadSsot+ProductPathReadSsotTheorems+ProductPathComposePlan+ProductPathComposePlanTheorems+Capable+CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+PerformEvidenceTheorems+CapableRead+CapableReadTheorems+CapableCompose+CapableComposeTheorems+CapableFullBar+CapableFullBarTheorems+DualEqWriteCapableGap+DualEqWriteCapableGapTheorems+DualEqWriteClosePath+DualEqWriteClosePathTheorems+DualEqWriteParity+DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+StepContractFull+StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+OfficialPathAlternate+OfficialPathAlternateTheorems+ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems+FreestandingEmitLoad+FreestandingEmitLoadScaffold+LakeRetireInventory+HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract+ProductWireWriteTool+HostTerm+LlvmEmitPath+SubsetFront+FirstSurface+LinearSubsetEmit+TypesSubsetEmit+ProgramSubsetEmit+GraphSubsetEmit+ComposeSubsetEmit+ErasureSubsetEmit+ExtractSubsetEmit+MultSubsetEmit+MultSubsetRebuild+LinearSubsetRebuild+TypesSubsetRebuild+ProgramSubsetRebuild+GraphSubsetRebuild+ComposeSubsetRebuild+ErasureSubsetRebuild+ExtractSubsetRebuild+HostFront+LlvmMultText+HostFrontTheorems+HostCheck+HostGraph+LlvmLinearText+MultFsWriteTool+FrontMultPackage+SubsetPackageJoin+HostGraphTheorems+LlvmTypesText+MultFsDeepen+HostPackageWrite+HostPackageWriteTheorems+LlvmProgramText+LlvmGraphText+LlvmComposeText+SelfApplyFs+SelfApplyFsTheorems+InventoryClose+ProductPathBars+InventoryCloseTheorems+ProductPath+ProductPathTheorems+DualResidual+DualResidualTheorems+ProbeWire+SelfHostBody+ProbeWireTheorems+SelfHostBodyTheorems+SpecProof+SpecProofTheorems"
    "HostImportGraph+HostImportGraphSeeds+HostImportGraphModel+HostImportGraphMods+HostImportGraphModsLater+HostImportGraphLoadOk+HostImportGraphLoadOkLater+HostImportGraphTheorems+HostImportGraphWalk+HostImportGraphWalkLater+HostImportGraphDriver+HostModuleCheck+HostModuleCheckFixtures+HostModuleCheckRequiredDecls+HostModuleCheckRequiredDeclsProduct+HostModuleCheckRequiredDeclsLater+HostModuleCheckFixtureTexts+HostModuleCheckFixtureTextsProduct+HostModuleCheckFixtureTextsLater+HostModuleCheckFixtureTextsSelfHost+HostModuleCheckFixtureTextsEmit+HostModuleCheckSurface+HostModuleCheckMultTerm+HostModuleCheckLinearTerm+HostModuleCheckTypesTerm+HostModuleCheckIrProgramTerm+HostModuleCheckIrGraphTerm+HostModuleCheckHostComposeTerm+HostModuleCheckErasureTerm+HostModuleCheckExtractTerm+HostModuleCheckEmitPlanTerm+HostModuleCheckEmitApplyTerm+HostModuleCheckEmitBodyTerm+HostModuleCheckKernelMultTerm+HostModuleCheckKernelLinearTerm+HostModuleCheckKernelTypesTerm+HostModuleCheckKernelProgramTerm+HostModuleCheckKernelEmitTerm+HostModuleCheckParityMultTerm+HostModuleCheckParityLinearTerm+HostModuleCheckParityTypesTerm+HostModuleCheckParityProgramTerm+HostModuleCheckParityEmitTerm+HostModuleCheckEmitMultScaffoldTerm+HostModuleCheckEmitLinearScaffoldTerm+HostModuleCheckEmitTypesScaffoldTerm+HostModuleCheckEmitProgramScaffoldTerm+HostModuleCheckEmitGraphScaffoldTerm+HostModuleCheckEmitComposeScaffoldTerm+HostModuleCheckEmitErasureScaffoldTerm+HostModuleCheckEmitExtractScaffoldTerm+HostModuleCheckEmitBannerScaffoldTerm+HostModuleCheckKernelSelfApplyTerm+HostModuleCheckProductOutKernelTerm+HostModuleCheckCompilePathTerm+HostModuleCheckJoinMapTerm+HostModuleCheckSelfHostTerm+HostModuleCheckSurfaceMatrixTerm+HostModuleCheckSpecProofTerm+HostModuleCheckDualResidualTerm+HostModuleCheckCompilePathMultTerm+HostModuleCheckCompilePathLinearTerm+HostModuleCheckCompilePathTypesTerm+HostModuleCheckCompilePathProgramTerm+HostModuleCheckCompilePathGraphTerm+HostModuleCheckCompilePathComposeTerm+HostModuleCheckCompilePathErasureTerm+HostModuleCheckCompilePathExtractTerm+HostModuleCheckCompilePathPlanTerm+HostModuleCheckCompilePathApplyTerm+HostModuleCheckCompilePathBodyTerm+HostModuleCheckFirstSurfaceTerm+HostModuleCheckLinearSubsetEmitTerm+HostModuleCheckTypesSubsetEmitTerm+HostModuleCheckProgramSubsetEmitTerm+HostModuleCheckGraphSubsetEmitTerm+HostModuleCheckComposeSubsetEmitTerm+HostModuleCheckErasureSubsetEmitTerm+HostModuleCheckExtractSubsetEmitTerm+HostModuleCheckMultSubsetEmitTerm+HostModuleCheckMultSubsetRebuildTerm+HostModuleCheckLinearSubsetRebuildTerm+HostModuleCheckTypesSubsetRebuildTerm+HostModuleCheckProgramSubsetRebuildTerm+HostModuleCheckGraphSubsetRebuildTerm+HostModuleCheckComposeSubsetRebuildTerm+HostModuleCheckErasureSubsetRebuildTerm+HostModuleCheckExtractSubsetRebuildTerm+HostModuleCheckHostFrontTerm+HostModuleCheckLlvmMultTextTerm+HostModuleCheckHostCheckTerm+HostModuleCheckHostGraphTerm+HostModuleCheckLlvmLinearTextTerm+HostModuleCheckMultFsWriteToolTerm+HostModuleCheckFrontMultPackageTerm+HostModuleCheckSubsetPackageJoinTerm+HostModuleCheckLlvmTypesTextTerm+HostModuleCheckMultFsDeepenTerm+HostModuleCheckHostPackageWriteTerm+HostModuleCheckLlvmProgramTextTerm+HostModuleCheckLlvmGraphTextTerm+HostModuleCheckLlvmComposeTextTerm+HostModuleCheckSelfApplyFsTerm+HostModuleCheckInventoryCloseTerm+HostModuleCheckProductPathBarsTerm+HostModuleCheckProductPathTerm+HostModuleCheckProbeWireTerm+HostModuleCheckSelfHostBodyTerm+HostModuleCheckLoadOkCompilePathUnits+HostModuleCheckLoadOkLaterTerm+HostModuleCheckRealModule+HostModuleCheckMultProof+HostModuleCheckLinearProof+HostModuleCheckTypesProof+HostModuleCheckKernelMultProof+HostModuleCheckKernelLinearProof+HostModuleCheckKernelTypesProof+HostModuleCheckKernelProgramProof+HostModuleCheckKernelEmitProof+HostModuleCheckPackageElab+HostModuleCheckPackageEnv+HostModuleCheckPackageEnvFixtures+HostModuleCheckPackageEnvFixturesU2+HostModuleCheckPackageEnvFixturesS5+HostModuleCheckPackageEnvEvidence+HostModuleCheckCheckers+HostModuleCheckCheckersLater+HostModuleCheckAcceptsGoods+HostModuleCheckAcceptsGoodsTerm+HostModuleCheckAcceptsProof+HostModuleCheckAcceptsLater+HostModuleCheckAccepts+HostModuleCheckSeeds+HostModuleCheckLoadOk+HostModuleCheckDriverIO+HostModuleCheckDriver+HostModuleCheckTheorems+HostModuleCheckSmoke+HostResidualShrink+HostResidualShrinkTermOk+HostResidualShrinkTheorems"
  ] ++ map (s: "${s}-only") termStems ++ map (s: "${s}Theorems-only") proofStems;
  recipes = [
    "host-fragment-check-without-lake" "host-graph-without-lake" "host-package-write-without-lake"
    "host-package-roots-without-lake" "host-import-graph-without-lake" "host-module-check-without-lake"
    "host-foundation-tools-clean-bootstrap" "host-develop-tools-clean-bootstrap" "host-front-without-lake"
    "subset-front-without-lake" "front-mult-package-without-lake" "mult-subset-rebuild-without-lake"
    "first-surface-without-lake" "host-residual-shrink"
  ];
  justDir = root + "/just";
  justEnts = if builtins.pathExists justDir then builtins.readDir justDir else { };
  justNames = lib.filter (n: justEnts.${n} == "regular" && lib.hasSuffix ".just" n) (builtins.attrNames justEnts);
  justTexts = map (p: if builtins.pathExists p then builtins.readFile p else "") (
    [ (root + "/justfile") ] ++ map (n: justDir + "/${n}") justNames);
  recipePresent = name:
    lib.any (text: lib.any (line: lib.hasPrefix "${name}:" line) (lib.splitString "\n" text)) justTexts;
  keep = cond: msg: if cond then [ ] else [ msg ];
  when = rows: if allExist then rows else [ ];
  tokenViolations = when (lib.concatMap (tok: keep (inPair (has tok)) (builtins.head (absent pairRel "missing token ${tok}"))) tokens);
  trueViolations = when (lib.concatMap (n: keep (inPair (boolIs n "true")) (builtins.head (absent pairRel "def ${n} is not Bool := true"))) trueNames);
  falseViolations = when (lib.concatMap (n: keep (inPair (boolIs n "false")) (builtins.head (absent pairRel "def ${n} is not Bool := false"))) falseNames);
  stringViolations = when (lib.concatMap (p: keep (inPair (stringIs p.name p.value)) (builtins.head (absent pairRel "def ${p.name} is not String := \"${p.value}\""))) stringPins);
  definedViolations = when (lib.concatMap (n: keep (inPair (boolDefined n)) (builtins.head (absent pairRel "def ${n} is not a Bool :="))) definedNames);
  nearViolations = when (keep (inPair (nearEmpty nearName)) (builtins.head (absent pairRel "def ${nearName} is missing \"empty\" within two lines")));
  dualViolations = when (lib.concatMap (p: keep (boolIs p.name p.value dual.content) (builtins.head (absent dual.rel "def ${p.name} is not Bool := ${p.value}"))) dualBools);
  banViolations = when (
    (lib.concatMap (p: keep (!inPair (boolIs p.name p.value)) (builtins.head (absent pairRel "forge ban def ${p.name} Bool := ${p.value}"))) pairBans)
    ++ (lib.concatMap (p: keep (!boolIs p.name p.value dual.content) (builtins.head (absent dual.rel "forge ban def ${p.name} Bool := ${p.value}"))) dualBans));
  recipeViolations = when (lib.concatMap (name: keep (recipePresent name) "just ${name}: missing recipe name") recipes);
  missing = lib.concatMap (f: if f.exists then [ ] else absent f.rel "missing file") files;
  passedToken = if allExist then lib.filter (tok: inPair (has tok)) tokens else [ ];
  passedTrue = if allExist then lib.filter (n: inPair (boolIs n "true")) trueNames else [ ];
  passedFalse = if allExist then lib.filter (n: inPair (boolIs n "false")) falseNames else [ ];
  passedString = if allExist then lib.filter (p: inPair (stringIs p.name p.value)) stringPins else [ ];
  passedDefined = if allExist then lib.filter (n: inPair (boolDefined n)) definedNames else [ ];
  passedNear = if allExist && inPair (nearEmpty nearName) then [ nearName ] else [ ];
  passedDual = if allExist then lib.filter (p: boolIs p.name p.value dual.content) dualBools else [ ];
  passedRecipe = if allExist then lib.filter recipePresent recipes else [ ];
  checked = builtins.length (passedToken ++ passedTrue ++ passedFalse ++ passedString ++ passedDefined ++ passedNear ++ passedDual ++ passedRecipe);
  expect = builtins.length tokens + builtins.length trueNames + builtins.length falseNames + builtins.length stringPins + builtins.length definedNames + 1 + builtins.length dualBools + builtins.length recipes;
  violations = missing ++ tokenViolations ++ trueViolations ++ falseViolations ++ stringViolations ++ definedViolations ++ nearViolations ++ dualViolations ++ banViolations ++ recipeViolations;
  ok = violations == [ ] && checked == expect;
  summary = if ok then "host-residual-shrink: check passed; count is ${toString expect}" else "host-residual-shrink: check failed; violation count is ${toString (builtins.length violations)}";
in
{ inherit ok violations summary checked; }
