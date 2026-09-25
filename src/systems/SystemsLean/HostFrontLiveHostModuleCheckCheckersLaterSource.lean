/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckCheckersLater.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckCheckersLaterSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckCheckersLater.lean only. One part.
  Do not steal HostFrontLiveHostModuleCheckCheckers (liveRel is
  HostModuleCheckCheckers.lean).
  Do not steal HostFrontLiveHostModuleCheckCheckersKernel (liveRel is
  HostModuleCheckCheckersKernel.lean).
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCHECKERSLATER,
  liveHostModuleCheckCheckersLaterSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCHECKERSLATER,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckCheckersLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckCheckersLater

/-- Dual-pinned live HostModuleCheckCheckersLater.lean bytes.
    One part. Not split. 541 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckCheckersLaterSource,
    PARSE-LIVE-HOSTMODULECHECKCHECKERSLATER. -/
def liveHostModuleCheckCheckersLaterSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck per-seed check*Surface later band.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split: checkFreestandingEmitSurface through checkSelfApplyTheoremsSurface.
  checkRealModule dispatcher lives in SystemsLean.HostModuleCheckRealModule.
  Same namespace SystemsLean.HostModuleCheck.

  Intentional non-claims: PARTIAL-STRUCTURAL only; not residual free / PROVABLY / llvm.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckCheckersLater,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckCheckersLater
  Red/green: just systems-host; lake build SystemsLean.HostModuleCheckCheckersLater.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Module must stay ASCII.
-/

import SystemsLean.HostModuleCheckFixtures
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckCheckers
namespace SystemsLean.HostModuleCheck
/-- Check FreestandingEmit multi-import surface (sample FreestandingEmitLoad).
    Greppable: checkFreestandingEmitSurface. -/
def checkFreestandingEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf freestandingEmitExpectedNamespace
    freestandingEmitRequiredDecls (some "SystemsLean.FreestandingEmitLoad")
/-- Check ProductPathWriteHc surface (imports FreestandingEmit).
    Greppable: checkProductPathWriteHcSurface. -/
def checkProductPathWriteHcSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriteHcExpectedNamespace
    productPathWriteHcRequiredDecls (some "SystemsLean.FreestandingEmit")
/-- Check ProductPathWriteHcTheorems surface (parent ns ProductPathWriteHc).
    Greppable: checkProductPathWriteHcTheoremsSurface. -/
def checkProductPathWriteHcTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriteHcExpectedNamespace
    productPathWriteHcTheoremsRequiredDecls (some "SystemsLean.ProductPathWriteHc")
/-- Check CompilePathMult multi-import surface (ns CompilePath; sample CompilePath).
    Greppable: checkCompilePathMultSurface. -/
def checkCompilePathMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathMultRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathLinear surface.
    Greppable: checkCompilePathLinearSurface. -/
def checkCompilePathLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathLinearRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathTypes surface.
    Greppable: checkCompilePathTypesSurface. -/
def checkCompilePathTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathTypesRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathProgram surface.
    Greppable: checkCompilePathProgramSurface. -/
def checkCompilePathProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathProgramRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathGraph surface.
    Greppable: checkCompilePathGraphSurface. -/
def checkCompilePathGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathGraphRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathCompose surface.
    Greppable: checkCompilePathComposeSurface. -/
def checkCompilePathComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathComposeRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathPlan surface.
    Greppable: checkCompilePathPlanSurface. -/
def checkCompilePathPlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathPlanRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathApply surface.
    Greppable: checkCompilePathApplySurface. -/
def checkCompilePathApplySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathApplyRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathBody surface.
    Greppable: checkCompilePathBodySurface. -/
def checkCompilePathBodySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathBodyRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathErasure surface.
    Greppable: checkCompilePathErasureSurface. -/
def checkCompilePathErasureSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathErasureRequiredDecls (some "SystemsLean.CompilePath")

/-- Check CompilePathExtract surface (sample CompilePathMult).
    Greppable: checkCompilePathExtractSurface. -/
def checkCompilePathExtractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace
    compilePathExtractRequiredDecls (some "SystemsLean.CompilePathMult")

/-- Check ProductWireWriteTool multi-import (sample CapableWriteHc).
    Greppable: checkProductWireWriteToolSurface. -/
def checkProductWireWriteToolSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productWireWriteToolExpectedNamespace
    productWireWriteToolRequiredDecls (some "SystemsLean.CapableWriteHc")

/-- Check HostTerm surface (imports Mult).
    Greppable: checkHostTermSurface. -/
def checkHostTermSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostTermExpectedNamespace
    hostTermRequiredDecls (some "SystemsLean.Mult")

/-- Check LlvmEmitPath surface (imports LlvmHold).
    Greppable: checkLlvmEmitPathSurface. -/
def checkLlvmEmitPathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmEmitPathExpectedNamespace
    llvmEmitPathRequiredDecls (some "SystemsLean.LlvmHold")

/-- Check SubsetFront multi-import (sample CompilePath).
    Greppable: checkSubsetFrontSurface. -/
def checkSubsetFrontSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf subsetFrontExpectedNamespace
    subsetFrontRequiredDecls (some "SystemsLean.CompilePath")

/-- Check FirstSurface surface (sample CompilePathMult).
    Greppable: checkFirstSurfaceSurface. -/
def checkFirstSurfaceSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf firstSurfaceExpectedNamespace
    firstSurfaceRequiredDecls (some "SystemsLean.CompilePathMult")

/-- Check LinearSubsetEmit surface (sample CompilePathLinear).
    Greppable: checkLinearSubsetEmitSurface. -/
def checkLinearSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearSubsetEmitExpectedNamespace
    linearSubsetEmitRequiredDecls (some "SystemsLean.CompilePathLinear")

/-- Check TypesSubsetEmit surface (sample CompilePathTypes).
    Greppable: checkTypesSubsetEmitSurface. -/
def checkTypesSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesSubsetEmitExpectedNamespace
    typesSubsetEmitRequiredDecls (some "SystemsLean.CompilePathTypes")

/-- Check ProgramSubsetEmit surface (sample CompilePathProgram).
    Greppable: checkProgramSubsetEmitSurface. -/
def checkProgramSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf programSubsetEmitExpectedNamespace
    programSubsetEmitRequiredDecls (some "SystemsLean.CompilePathProgram")

/-- Check GraphSubsetEmit surface (sample CompilePathGraph).
    Greppable: checkGraphSubsetEmitSurface. -/
def checkGraphSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf graphSubsetEmitExpectedNamespace
    graphSubsetEmitRequiredDecls (some "SystemsLean.CompilePathGraph")

/-- Check ComposeSubsetEmit surface (sample CompilePathCompose).
    Greppable: checkComposeSubsetEmitSurface. -/
def checkComposeSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf composeSubsetEmitExpectedNamespace
    composeSubsetEmitRequiredDecls (some "SystemsLean.CompilePathCompose")

/-- Check ErasureSubsetEmit surface (sample CompilePathErasure).
    Greppable: checkErasureSubsetEmitSurface. -/
def checkErasureSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureSubsetEmitExpectedNamespace
    erasureSubsetEmitRequiredDecls (some "SystemsLean.CompilePathErasure")

/-- Check ExtractSubsetEmit surface (sample CompilePathExtract).
    Greppable: checkExtractSubsetEmitSurface. -/
def checkExtractSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractSubsetEmitExpectedNamespace
    extractSubsetEmitRequiredDecls (some "SystemsLean.CompilePathExtract")

/-- Check MultSubsetEmit surface (sample FirstSurface).
    Greppable: checkMultSubsetEmitSurface. -/
def checkMultSubsetEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multSubsetEmitExpectedNamespace
    multSubsetEmitRequiredDecls (some "SystemsLean.FirstSurface")

/-- Check MultSubsetRebuild surface (imports MultSubsetEmit).
    Greppable: checkMultSubsetRebuildSurface. -/
def checkMultSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multSubsetRebuildExpectedNamespace
    multSubsetRebuildRequiredDecls (some "SystemsLean.MultSubsetEmit")

/-- Check LinearSubsetRebuild surface (imports LinearSubsetEmit).
    Greppable: checkLinearSubsetRebuildSurface. -/
def checkLinearSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearSubsetRebuildExpectedNamespace
    linearSubsetRebuildRequiredDecls (some "SystemsLean.LinearSubsetEmit")

/-- Check TypesSubsetRebuild surface (imports TypesSubsetEmit).
    Greppable: checkTypesSubsetRebuildSurface. -/
def checkTypesSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesSubsetRebuildExpectedNamespace
    typesSubsetRebuildRequiredDecls (some "SystemsLean.TypesSubsetEmit")

/-- Check ProgramSubsetRebuild surface (imports ProgramSubsetEmit).
    Greppable: checkProgramSubsetRebuildSurface. -/
def checkProgramSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf programSubsetRebuildExpectedNamespace
    programSubsetRebuildRequiredDecls (some "SystemsLean.ProgramSubsetEmit")

/-- Check GraphSubsetRebuild surface (imports GraphSubsetEmit).
    Greppable: checkGraphSubsetRebuildSurface. -/
def checkGraphSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf graphSubsetRebuildExpectedNamespace
    graphSubsetRebuildRequiredDecls (some "SystemsLean.GraphSubsetEmit")

/-- Check ComposeSubsetRebuild surface (imports ComposeSubsetEmit).
    Greppable: checkComposeSubsetRebuildSurface. -/
def checkComposeSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf composeSubsetRebuildExpectedNamespace
    composeSubsetRebuildRequiredDecls (some "SystemsLean.ComposeSubsetEmit")

/-- Check ErasureSubsetRebuild surface (imports ErasureSubsetEmit).
    Greppable: checkErasureSubsetRebuildSurface. -/
def checkErasureSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureSubsetRebuildExpectedNamespace
    erasureSubsetRebuildRequiredDecls (some "SystemsLean.ErasureSubsetEmit")

/-- Check ExtractSubsetRebuild surface (imports ExtractSubsetEmit).
    Greppable: checkExtractSubsetRebuildSurface. -/
def checkExtractSubsetRebuildSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractSubsetRebuildExpectedNamespace
    extractSubsetRebuildRequiredDecls (some "SystemsLean.ExtractSubsetEmit")

/-- Check HostFront surface (sample HostTerm).
    Greppable: checkHostFrontSurface. -/
def checkHostFrontSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostFrontExpectedNamespace
    hostFrontRequiredDecls (some "SystemsLean.HostTerm")

/-- Check LlvmMultText surface (sample Mult).
    Greppable: checkLlvmMultTextSurface. -/
def checkLlvmMultTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmMultTextExpectedNamespace
    llvmMultTextRequiredDecls (some "SystemsLean.Mult")

/-- Check HostFrontTheorems surface (imports HostFront; ns HostFront).
    Greppable: checkHostFrontTheoremsSurface. -/
def checkHostFrontTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostFrontTheoremsExpectedNamespace
    hostFrontTheoremsRequiredDecls (some "SystemsLean.HostFront")

/-- Check HostCheck surface (imports HostFront).
    Greppable: checkHostCheckSurface. -/
def checkHostCheckSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostCheckExpectedNamespace
    hostCheckRequiredDecls (some "SystemsLean.HostFront")

/-- Check HostGraph surface (sample HostFront).
    Greppable: checkHostGraphSurface. -/
def checkHostGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostGraphExpectedNamespace
    hostGraphRequiredDecls (some "SystemsLean.HostFront")

/-- Check LlvmLinearText surface (sample Linear).
    Greppable: checkLlvmLinearTextSurface. -/
def checkLlvmLinearTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmLinearTextExpectedNamespace
    llvmLinearTextRequiredDecls (some "SystemsLean.Linear")

/-- Check MultFsWriteTool surface (imports MultSubsetEmit).
    Greppable: checkMultFsWriteToolSurface. -/
def checkMultFsWriteToolSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multFsWriteToolExpectedNamespace
    multFsWriteToolRequiredDecls (some "SystemsLean.MultSubsetEmit")

/-- Check FrontMultPackage surface (sample SubsetFront).
    Greppable: checkFrontMultPackageSurface. -/
def checkFrontMultPackageSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf frontMultPackageExpectedNamespace
    frontMultPackageRequiredDecls (some "SystemsLean.SubsetFront")

/-- Check SubsetPackageJoin surface (sample MultSubsetRebuild).
    Greppable: checkSubsetPackageJoinSurface. -/
def checkSubsetPackageJoinSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf subsetPackageJoinExpectedNamespace
    subsetPackageJoinRequiredDecls (some "SystemsLean.MultSubsetRebuild")

/-- Check HostGraphTheorems surface (imports HostGraph; ns HostGraph).
    Greppable: checkHostGraphTheoremsSurface. -/
def checkHostGraphTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostGraphTheoremsExpectedNamespace
    hostGraphTheoremsRequiredDecls (some "SystemsLean.HostGraph")

/-- Check LlvmTypesText surface (sample Types).
    Greppable: checkLlvmTypesTextSurface. -/
def checkLlvmTypesTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmTypesTextExpectedNamespace
    llvmTypesTextRequiredDecls (some "SystemsLean.Types")

/-- Check MultFsDeepen surface (sample MultSubsetRebuild).
    Greppable: checkMultFsDeepenSurface. -/
def checkMultFsDeepenSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multFsDeepenExpectedNamespace
    multFsDeepenRequiredDecls (some "SystemsLean.MultSubsetRebuild")

/-- Check HostPackageWrite surface (sample HostFront).
    Greppable: checkHostPackageWriteSurface. -/
def checkHostPackageWriteSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostPackageWriteExpectedNamespace
    hostPackageWriteRequiredDecls (some "SystemsLean.HostFront")

/-- Check HostPackageWriteTheorems surface (imports HostPackageWrite; ns HostPackageWrite).
    Greppable: checkHostPackageWriteTheoremsSurface. -/
def checkHostPackageWriteTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostPackageWriteTheoremsExpectedNamespace
    hostPackageWriteTheoremsRequiredDecls (some "SystemsLean.HostPackageWrite")

/-- Check LlvmProgramText surface (sample IrProgram).
    Greppable: checkLlvmProgramTextSurface. -/
def checkLlvmProgramTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmProgramTextExpectedNamespace
    llvmProgramTextRequiredDecls (some "SystemsLean.IrProgram")

/-- Check LlvmGraphText surface (sample IrGraph).
    Greppable: checkLlvmGraphTextSurface. -/
def checkLlvmGraphTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmGraphTextExpectedNamespace
    llvmGraphTextRequiredDecls (some "SystemsLean.IrGraph")

/-- Check LlvmComposeText surface (sample HostCompose).
    Greppable: checkLlvmComposeTextSurface. -/
def checkLlvmComposeTextSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf llvmComposeTextExpectedNamespace
    llvmComposeTextRequiredDecls (some "SystemsLean.HostCompose")

/-- Check SelfApplyFs surface (sample SelfApply; multi-import honesty on HostImportGraph).
    Greppable: checkSelfApplyFsSurface. -/
def checkSelfApplyFsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfApplyFsExpectedNamespace
    selfApplyFsRequiredDecls (some "SystemsLean.SelfApply")

/-- Check SelfApplyFsTheorems surface (imports SelfApplyFs; namespace SelfApplyFs).
    Greppable: checkSelfApplyFsTheoremsSurface. -/
def checkSelfApplyFsTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfApplyFsExpectedNamespace
    selfApplyFsTheoremsRequiredDecls (some "SystemsLean.SelfApplyFs")

/-- Check InventoryClose surface (imports SelfApplyFs sample).
    Greppable: checkInventoryCloseSurface. -/
def checkInventoryCloseSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf inventoryCloseExpectedNamespace
    inventoryCloseRequiredDecls (some "SystemsLean.SelfApplyFs")

/-- Check ProductPathBars surface (imports CompilePath sample; namespace ProductPath).
    Greppable: checkProductPathBarsSurface. -/
def checkProductPathBarsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathBarsExpectedNamespace
    productPathBarsRequiredDecls (some "SystemsLean.CompilePath")

/-- Check InventoryCloseTheorems surface (imports InventoryClose; namespace InventoryClose).
    Greppable: checkInventoryCloseTheoremsSurface. -/
def checkInventoryCloseTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf inventoryCloseExpectedNamespace
    inventoryCloseTheoremsRequiredDecls (some "SystemsLean.InventoryClose")

/-- Check ProductPath surface (imports InventoryClose sample; namespace ProductPath).
    Greppable: checkProductPathSurface. -/
def checkProductPathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathExpectedNamespace
    productPathRequiredDecls (some "SystemsLean.InventoryClose")

/-- Check ProductPathTheorems surface (imports ProductPath; namespace ProductPath).
    Greppable: checkProductPathTheoremsSurface. -/
def checkProductPathTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathExpectedNamespace
    productPathTheoremsRequiredDecls (some "SystemsLean.ProductPath")

/-- Check DualResidual surface (imports ProductPath sample).
    PARTIAL-STRUCTURAL; host free claimed stays false on disk.
    Greppable: checkDualResidualSurface. -/
def checkDualResidualSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf dualResidualExpectedNamespace
    dualResidualRequiredDecls (some "SystemsLean.ProductPath")

/-- Check DualResidualTheorems surface (parent DualResidual; namespace DualResidual).
    Greppable: checkDualResidualTheoremsSurface. -/
def checkDualResidualTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf dualResidualTheoremsExpectedNamespace
    dualResidualTheoremsRequiredDecls (some "SystemsLean.DualResidual")

/-- Check ProbeWire surface (imports DualResidual sample).
    Greppable: checkProbeWireSurface. -/
def checkProbeWireSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf probeWireExpectedNamespace
    probeWireRequiredDecls (some "SystemsLean.DualResidual")

/-- Check SelfHostBody surface (imports EmitMult first-import sample).
    Greppable: checkSelfHostBodySurface. -/
def checkSelfHostBodySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfHostBodyExpectedNamespace
    selfHostBodyRequiredDecls (some "SystemsLean.EmitMult")

/-- Check ProbeWireTheorems surface (parent ProbeWire).
    Greppable: checkProbeWireTheoremsSurface. -/
def checkProbeWireTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf probeWireTheoremsExpectedNamespace
    probeWireTheoremsRequiredDecls (some "SystemsLean.ProbeWire")

/-- Check SelfHostBodyTheorems surface (parent SelfHostBody).
    Greppable: checkSelfHostBodyTheoremsSurface. -/
def checkSelfHostBodyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfHostBodyTheoremsExpectedNamespace
    selfHostBodyTheoremsRequiredDecls (some "SystemsLean.SelfHostBody")

/-- Check SpecProof surface (imports ProbeWire sample).
    Greppable: checkSpecProofSurface. -/
def checkSpecProofSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf specProofExpectedNamespace
    specProofRequiredDecls (some "SystemsLean.ProbeWire")

/-- Check SpecProofTheorems surface (parent SpecProof).
    Greppable: checkSpecProofTheoremsSurface. -/
def checkSpecProofTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf specProofTheoremsExpectedNamespace
    specProofTheoremsRequiredDecls (some "SystemsLean.SpecProof")

/-- Check EmitPlan product surface (imports EmitPlanScaffold).
    Greppable: checkEmitPlanSurface. -/
def checkEmitPlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")

/-- Check EmitApply product surface (imports EmitApplyScaffold).
    Greppable: checkEmitApplySurface. -/
def checkEmitApplySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")

/-- Check EmitBody product surface (imports EmitPlan).
    Greppable: checkEmitBodySurface. -/
def checkEmitBodySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")

/-- Check KernelEmit product surface (imports KernelProgram; multi-import honest
    edges enforced on HostImportGraph).
    Greppable: checkKernelEmitSurface. -/
def checkKernelEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")

/-- Check KernelEmitTheorems surface (parent namespace KernelEmit).
    Greppable: checkKernelEmitTheoremsSurface. -/
def checkKernelEmitTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelEmitExpectedNamespace
    kernelEmitTheoremsRequiredDecls (some "SystemsLean.KernelEmit")

/-- Check ParityMult surface (imports KernelMult; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityMultSurface. -/
def checkParityMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")

/-- Check ParityMultTheorems surface (parent namespace ParityMult).
    Greppable: checkParityMultTheoremsSurface. -/
def checkParityMultTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityMultExpectedNamespace
    parityMultTheoremsRequiredDecls (some "SystemsLean.ParityMult")

/-- Check ParityLinear surface (imports KernelLinear; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityLinearSurface. -/
def checkParityLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")

/-- Check ParityLinearTheorems surface (parent namespace ParityLinear).
    Greppable: checkParityLinearTheoremsSurface. -/
def checkParityLinearTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityLinearExpectedNamespace
    parityLinearTheoremsRequiredDecls (some "SystemsLean.ParityLinear")

/-- Check ParityTypes surface (imports KernelTypes; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityTypesSurface. -/
def checkParityTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")

/-- Check ParityTypesTheorems surface (parent namespace ParityTypes).
    Greppable: checkParityTypesTheoremsSurface. -/
def checkParityTypesTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityTypesExpectedNamespace
    parityTypesTheoremsRequiredDecls (some "SystemsLean.ParityTypes")

/-- Check ParityProgram surface (imports KernelProgram; multi-import honest edges
    for seed expand). Greppable: checkParityProgramSurface. -/
def checkParityProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")

/-- Check ParityProgramTheorems surface (parent namespace ParityProgram).
    Greppable: checkParityProgramTheoremsSurface. -/
def checkParityProgramTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityProgramExpectedNamespace
    parityProgramTheoremsRequiredDecls (some "SystemsLean.ParityProgram")

/-- Check ParityEmit surface (imports KernelEmit; multi-import honest edges
    for seed expand). Greppable: checkParityEmitSurface. -/
def checkParityEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")

/-- Check ParityEmitTheorems surface (parent namespace ParityEmit).
    Greppable: checkParityEmitTheoremsSurface. -/
def checkParityEmitTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityEmitExpectedNamespace
    parityEmitTheoremsRequiredDecls (some "SystemsLean.ParityEmit")

/-- Check SelfApply surface (imports ParityMult; multi-import honest edges
    for seed expand). Greppable: checkSelfApplySurface. -/
def checkSelfApplySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfApplyExpectedNamespace selfApplyRequiredDecls
    (some "SystemsLean.ParityMult")

/-- Check SelfApplyTheorems surface (parent namespace SelfApply).
    Greppable: checkSelfApplyTheoremsSurface. -/
def checkSelfApplyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfApplyExpectedNamespace
    selfApplyTheoremsRequiredDecls (some "SystemsLean.SelfApply")

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckCheckersLater
