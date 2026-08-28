/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph later RealMod fixtures + good/bad seeds.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphModsLater,
  selfHostCompleteMod, selfApplyFsMod, specProofTheoremsMod,
  hostImportGraphGoodMultSeed, hostImportGraphGoodExpandSeed,
  hostImportGraphBadMissing, hostImportGraphBadCycle.
  Module: SystemsLean.HostImportGraphModsLater
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphModsLater; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphMods
namespace SystemsLean.HostImportGraph
/-- SelfHostComplete leaf (SelfApplyFs remaining pure leaf).
    Greppable: selfHostCompleteMod. -/
def selfHostCompleteMod : RealMod :=
  { name := "SystemsLean.SelfHostComplete", imports := [] }

/-- SelfHostCompleteTheorems (imports SelfHostComplete only).
    Greppable: selfHostCompleteTheoremsMod. -/
def selfHostCompleteTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfHostCompleteTheorems"
    imports := ["SystemsLean.SelfHostComplete"] }

/-- OfficialPathAlternate leaf (SelfApplyFs remaining pure leaf).
    Greppable: officialPathAlternateMod. -/
def officialPathAlternateMod : RealMod :=
  { name := "SystemsLean.OfficialPathAlternate", imports := [] }

/-- OfficialPathAlternateTheorems (imports OfficialPathAlternate only).
    Greppable: officialPathAlternateTheoremsMod. -/
def officialPathAlternateTheoremsMod : RealMod :=
  { name := "SystemsLean.OfficialPathAlternateTheorems"
    imports := ["SystemsLean.OfficialPathAlternate"] }

/-- ProductPathOwnershipRegenerate leaf (SelfApplyFs remaining pure leaf).
    Greppable: productPathOwnershipRegenerateMod. -/
def productPathOwnershipRegenerateMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipRegenerate", imports := [] }

/-- ProductPathOwnershipRegenerateTheorems (imports ProductPathOwnershipRegenerate only).
    Greppable: productPathOwnershipRegenerateTheoremsMod. -/
def productPathOwnershipRegenerateTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipRegenerateTheorems"
    imports := ["SystemsLean.ProductPathOwnershipRegenerate"] }

/-- Shared emit product stack imports (on-disk CapableWriteHcLoad / DualEqWriteLoad).
    Greppable: emitProductStackImports. -/
def emitProductStackImports : List String :=
  ["SystemsLean.EmitBanner", "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
   "SystemsLean.EmitErasure", "SystemsLean.EmitExtract",
   "SystemsLean.EmitExtractScaffold", "SystemsLean.EmitTypes",
   "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgram",
   "SystemsLean.EmitProgramScaffold", "SystemsLean.EmitGraph",
   "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitCompose",
   "SystemsLean.EmitComposeScaffold", "SystemsLean.EmitPlan",
   "SystemsLean.EmitPlanScaffold", "SystemsLean.EmitApply",
   "SystemsLean.EmitApplyScaffold", "SystemsLean.EmitBody",
   "SystemsLean.EmitBodyScaffold"]

/-- CapableWriteHcLoad multi-import (emit product stack; all currently seeded).
    Greppable: capableWriteHcLoadMod. -/
def capableWriteHcLoadMod : RealMod :=
  { name := "SystemsLean.CapableWriteHcLoad"
    imports := emitProductStackImports }

/-- DualEqWriteLoad multi-import (same emit product stack as on disk).
    Greppable: dualEqWriteLoadMod. -/
def dualEqWriteLoadMod : RealMod :=
  { name := "SystemsLean.DualEqWriteLoad"
    imports := emitProductStackImports }

/-- CapableWriteHc multi-import (CapableWriteHcLoad + emit stack).
    Greppable: capableWriteHcMod. -/
def capableWriteHcMod : RealMod :=
  { name := "SystemsLean.CapableWriteHc"
    imports := "SystemsLean.CapableWriteHcLoad" :: emitProductStackImports }

/-- DualEqWriteApi multi-import (DualEqWriteLoad + emit stack).
    Greppable: dualEqWriteApiMod. -/
def dualEqWriteApiMod : RealMod :=
  { name := "SystemsLean.DualEqWriteApi"
    imports := "SystemsLean.DualEqWriteLoad" :: emitProductStackImports }

/-- LlvmHold (imports SelfApply only). Greppable: llvmHoldMod. -/
def llvmHoldMod : RealMod :=
  { name := "SystemsLean.LlvmHold"
    imports := ["SystemsLean.SelfApply"] }

/-- LlvmHoldTheorems (imports SelfApply + LlvmHold as on disk).
    Greppable: llvmHoldTheoremsMod. -/
def llvmHoldTheoremsMod : RealMod :=
  { name := "SystemsLean.LlvmHoldTheorems"
    imports := ["SystemsLean.SelfApply", "SystemsLean.LlvmHold"] }

/-- CapableRegenerate multi-import (CapableRead/Compose/WriteHc/InstallOut on disk).
    Greppable: capableRegenerateMod. -/
def capableRegenerateMod : RealMod :=
  { name := "SystemsLean.CapableRegenerate"
    imports := ["SystemsLean.CapableRead", "SystemsLean.CapableCompose",
                "SystemsLean.CapableWriteHc", "SystemsLean.InstallOut"] }

/-- CapableRegenerateTheorems (imports CapableRegenerate parent only).
    Greppable: capableRegenerateTheoremsMod. -/
def capableRegenerateTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableRegenerateTheorems"
    imports := ["SystemsLean.CapableRegenerate"] }

/-- FreestandingEmitLoad pure leaf (no package-local imports on disk).
    Greppable: freestandingEmitLoadMod. -/
def freestandingEmitLoadMod : RealMod :=
  { name := "SystemsLean.FreestandingEmitLoad"
    imports := [] }

/-- FreestandingEmitLoadScaffold (imports FreestandingEmitLoad parent only).
    Greppable: freestandingEmitLoadScaffoldMod. -/
def freestandingEmitLoadScaffoldMod : RealMod :=
  { name := "SystemsLean.FreestandingEmitLoadScaffold"
    imports := ["SystemsLean.FreestandingEmitLoad"] }

/-- LakeRetireInventory pure leaf (no package-local imports on disk).
    Greppable: lakeRetireInventoryMod. -/
def lakeRetireInventoryMod : RealMod :=
  { name := "SystemsLean.LakeRetireInventory"
    imports := [] }

/-- HostPackageRoots pure leaf (no package-local imports on disk).
    Greppable: hostPackageRootsMod. -/
def hostPackageRootsMod : RealMod :=
  { name := "SystemsLean.HostPackageRoots"
    imports := [] }

/-- FreestandingEmit multi-import (Load + LoadScaffold + emit product stack on disk).
    Greppable: freestandingEmitMod. -/
def freestandingEmitMod : RealMod :=
  { name := "SystemsLean.FreestandingEmit"
    imports :=
      ["SystemsLean.FreestandingEmitLoad",
       "SystemsLean.FreestandingEmitLoadScaffold",
       "SystemsLean.EmitBanner",
       "SystemsLean.EmitMult",
       "SystemsLean.EmitLinear",
       "SystemsLean.EmitErasure",
       "SystemsLean.EmitExtract",
       "SystemsLean.EmitExtractScaffold",
       "SystemsLean.EmitTypes",
       "SystemsLean.EmitTypesScaffold",
       "SystemsLean.EmitProgram",
       "SystemsLean.EmitProgramScaffold",
       "SystemsLean.EmitGraph",
       "SystemsLean.EmitGraphScaffold",
       "SystemsLean.EmitCompose",
       "SystemsLean.EmitComposeScaffold",
       "SystemsLean.EmitPlan",
       "SystemsLean.EmitPlanScaffold",
       "SystemsLean.EmitApply",
       "SystemsLean.EmitApplyScaffold",
       "SystemsLean.EmitBody",
       "SystemsLean.EmitBodyScaffold"] }

/-- ProductPathWriteHc (imports FreestandingEmit parent only on disk).
    Greppable: productPathWriteHcMod. -/
def productPathWriteHcMod : RealMod :=
  { name := "SystemsLean.ProductPathWriteHc"
    imports := ["SystemsLean.FreestandingEmit"] }

/-- ProductPathWriteHcTheorems (imports ProductPathWriteHc parent only).
    Greppable: productPathWriteHcTheoremsMod. -/
def productPathWriteHcTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriteHcTheorems"
    imports := ["SystemsLean.ProductPathWriteHc"] }

/-- CompilePathMult multi-import (CompilePath + EmitMult on disk).
    Greppable: compilePathMultMod. -/
def compilePathMultMod : RealMod :=
  { name := "SystemsLean.CompilePathMult"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitMult"] }

/-- CompilePathLinear multi-import (CompilePath + EmitLinear on disk).
    Greppable: compilePathLinearMod. -/
def compilePathLinearMod : RealMod :=
  { name := "SystemsLean.CompilePathLinear"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitLinear"] }

/-- CompilePathTypes multi-import (CompilePath + EmitTypes on disk).
    Greppable: compilePathTypesMod. -/
def compilePathTypesMod : RealMod :=
  { name := "SystemsLean.CompilePathTypes"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitTypes"] }

/-- CompilePathProgram multi-import (CompilePath + EmitProgram on disk).
    Greppable: compilePathProgramMod. -/
def compilePathProgramMod : RealMod :=
  { name := "SystemsLean.CompilePathProgram"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitProgram"] }

/-- CompilePathGraph multi-import (CompilePath + EmitGraph on disk).
    Greppable: compilePathGraphMod. -/
def compilePathGraphMod : RealMod :=
  { name := "SystemsLean.CompilePathGraph"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitGraph"] }

/-- CompilePathCompose multi-import (CompilePath + EmitCompose on disk).
    Greppable: compilePathComposeMod. -/
def compilePathComposeMod : RealMod :=
  { name := "SystemsLean.CompilePathCompose"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitCompose"] }

/-- CompilePathPlan multi-import (CompilePath + EmitPlan + EmitPlanScaffold on disk).
    Greppable: compilePathPlanMod. -/
def compilePathPlanMod : RealMod :=
  { name := "SystemsLean.CompilePathPlan"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitPlan",
                "SystemsLean.EmitPlanScaffold"] }

/-- CompilePathApply multi-import (CompilePath + EmitApply + EmitApplyScaffold on disk).
    Greppable: compilePathApplyMod. -/
def compilePathApplyMod : RealMod :=
  { name := "SystemsLean.CompilePathApply"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitApply",
                "SystemsLean.EmitApplyScaffold"] }

/-- CompilePathBody multi-import (CompilePath + EmitBody + EmitBodyScaffold on disk).
    Greppable: compilePathBodyMod. -/
def compilePathBodyMod : RealMod :=
  { name := "SystemsLean.CompilePathBody"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitBody",
                "SystemsLean.EmitBodyScaffold"] }

/-- CompilePathErasure multi-import (CompilePath + EmitErasure + Erasure on disk).
    Greppable: compilePathErasureMod. -/
def compilePathErasureMod : RealMod :=
  { name := "SystemsLean.CompilePathErasure"
    imports := ["SystemsLean.CompilePath", "SystemsLean.EmitErasure",
                "SystemsLean.Erasure"] }

/-- CompilePathExtract multi-import (CompilePath + CompilePathMult + CompilePathProgram).
    Greppable: compilePathExtractMod. -/
def compilePathExtractMod : RealMod :=
  { name := "SystemsLean.CompilePathExtract"
    imports := ["SystemsLean.CompilePath", "SystemsLean.CompilePathMult",
                "SystemsLean.CompilePathProgram"] }

/-- ProductWireWriteTool multi-import (CapableWriteHc + InstallOut on disk).
    Greppable: productWireWriteToolMod. -/
def productWireWriteToolMod : RealMod :=
  { name := "SystemsLean.ProductWireWriteTool"
    imports := ["SystemsLean.CapableWriteHc", "SystemsLean.InstallOut"] }

/-- HostTerm (imports Mult only). Greppable: hostTermMod. -/
def hostTermMod : RealMod :=
  { name := "SystemsLean.HostTerm"
    imports := ["SystemsLean.Mult"] }

/-- LlvmEmitPath (imports LlvmHold only). Greppable: llvmEmitPathMod. -/
def llvmEmitPathMod : RealMod :=
  { name := "SystemsLean.LlvmEmitPath"
    imports := ["SystemsLean.LlvmHold"] }

/-- SubsetFront multi-import (CompilePath + IrProgram + Types + Mult on disk).
    Greppable: subsetFrontMod. -/
def subsetFrontMod : RealMod :=
  { name := "SystemsLean.SubsetFront"
    imports := ["SystemsLean.CompilePath", "SystemsLean.IrProgram",
                "SystemsLean.Types", "SystemsLean.Mult"] }

/-- FirstSurface (imports CompilePathMult only).
    Greppable: firstSurfaceMod. -/
def firstSurfaceMod : RealMod :=
  { name := "SystemsLean.FirstSurface"
    imports := ["SystemsLean.CompilePathMult"] }

/-- LinearSubsetEmit multi-import (CompilePathLinear+EmitLinear on disk).
    Greppable: linearSubsetEmitMod. -/
def linearSubsetEmitMod : RealMod :=
  { name := "SystemsLean.LinearSubsetEmit"
    imports := ["SystemsLean.CompilePathLinear", "SystemsLean.EmitLinear"] }

/-- TypesSubsetEmit multi-import (CompilePathTypes+EmitTypes on disk).
    Greppable: typesSubsetEmitMod. -/
def typesSubsetEmitMod : RealMod :=
  { name := "SystemsLean.TypesSubsetEmit"
    imports := ["SystemsLean.CompilePathTypes", "SystemsLean.EmitTypes"] }

/-- ProgramSubsetEmit multi-import (CompilePathProgram+EmitProgram on disk).
    Greppable: programSubsetEmitMod. -/
def programSubsetEmitMod : RealMod :=
  { name := "SystemsLean.ProgramSubsetEmit"
    imports := ["SystemsLean.CompilePathProgram", "SystemsLean.EmitProgram"] }

/-- GraphSubsetEmit multi-import (CompilePathGraph+EmitGraph on disk).
    Greppable: graphSubsetEmitMod. -/
def graphSubsetEmitMod : RealMod :=
  { name := "SystemsLean.GraphSubsetEmit"
    imports := ["SystemsLean.CompilePathGraph", "SystemsLean.EmitGraph"] }

/-- ComposeSubsetEmit multi-import (CompilePathCompose+EmitCompose on disk).
    Greppable: composeSubsetEmitMod. -/
def composeSubsetEmitMod : RealMod :=
  { name := "SystemsLean.ComposeSubsetEmit"
    imports := ["SystemsLean.CompilePathCompose", "SystemsLean.EmitCompose"] }

/-- ErasureSubsetEmit multi-import (CompilePathErasure+EmitErasure on disk).
    Greppable: erasureSubsetEmitMod. -/
def erasureSubsetEmitMod : RealMod :=
  { name := "SystemsLean.ErasureSubsetEmit"
    imports := ["SystemsLean.CompilePathErasure", "SystemsLean.EmitErasure"] }

/-- ExtractSubsetEmit multi-import (CompilePathExtract+EmitExtract on disk).
    Greppable: extractSubsetEmitMod. -/
def extractSubsetEmitMod : RealMod :=
  { name := "SystemsLean.ExtractSubsetEmit"
    imports := ["SystemsLean.CompilePathExtract", "SystemsLean.EmitExtract"] }

/-- MultSubsetEmit multi-import (FirstSurface+EmitMult on disk).
    Greppable: multSubsetEmitMod. -/
def multSubsetEmitMod : RealMod :=
  { name := "SystemsLean.MultSubsetEmit"
    imports := ["SystemsLean.FirstSurface", "SystemsLean.EmitMult"] }

/-- MultSubsetRebuild (imports MultSubsetEmit only).
    Greppable: multSubsetRebuildMod. -/
def multSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.MultSubsetRebuild"
    imports := ["SystemsLean.MultSubsetEmit"] }

/-- LinearSubsetRebuild (imports LinearSubsetEmit only).
    Greppable: linearSubsetRebuildMod. -/
def linearSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.LinearSubsetRebuild"
    imports := ["SystemsLean.LinearSubsetEmit"] }

/-- TypesSubsetRebuild (imports TypesSubsetEmit only).
    Greppable: typesSubsetRebuildMod. -/
def typesSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.TypesSubsetRebuild"
    imports := ["SystemsLean.TypesSubsetEmit"] }

/-- ProgramSubsetRebuild (imports ProgramSubsetEmit only).
    Greppable: programSubsetRebuildMod. -/
def programSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.ProgramSubsetRebuild"
    imports := ["SystemsLean.ProgramSubsetEmit"] }

/-- GraphSubsetRebuild (imports GraphSubsetEmit only).
    Greppable: graphSubsetRebuildMod. -/
def graphSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.GraphSubsetRebuild"
    imports := ["SystemsLean.GraphSubsetEmit"] }

/-- ComposeSubsetRebuild (imports ComposeSubsetEmit only).
    Greppable: composeSubsetRebuildMod. -/
def composeSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.ComposeSubsetRebuild"
    imports := ["SystemsLean.ComposeSubsetEmit"] }

/-- ErasureSubsetRebuild (imports ErasureSubsetEmit only).
    Greppable: erasureSubsetRebuildMod. -/
def erasureSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.ErasureSubsetRebuild"
    imports := ["SystemsLean.ErasureSubsetEmit"] }

/-- ExtractSubsetRebuild (imports ExtractSubsetEmit only).
    Greppable: extractSubsetRebuildMod. -/
def extractSubsetRebuildMod : RealMod :=
  { name := "SystemsLean.ExtractSubsetRebuild"
    imports := ["SystemsLean.ExtractSubsetEmit"] }

/-- HostFront multi-import (HostTerm+Mult on disk).
    Greppable: hostFrontMod. -/
def hostFrontMod : RealMod :=
  { name := "SystemsLean.HostFront"
    imports := ["SystemsLean.HostTerm", "SystemsLean.Mult"] }

/-- LlvmMultText multi-import (Mult+LlvmHold+LlvmEmitPath on disk).
    Greppable: llvmMultTextMod. -/
def llvmMultTextMod : RealMod :=
  { name := "SystemsLean.LlvmMultText"
    imports := ["SystemsLean.Mult", "SystemsLean.LlvmHold", "SystemsLean.LlvmEmitPath"] }


/-- HostFrontTheorems (imports HostFront only; same HostFront namespace on disk).
    Greppable: hostFrontTheoremsMod. -/
def hostFrontTheoremsMod : RealMod :=
  { name := "SystemsLean.HostFrontTheorems"
    imports := ["SystemsLean.HostFront"] }

/-- HostCheck (imports HostFront only).
    Greppable: hostCheckMod. -/
def hostCheckMod : RealMod :=
  { name := "SystemsLean.HostCheck"
    imports := ["SystemsLean.HostFront"] }

/-- HostGraph multi-import (HostFront+HostTerm on disk).
    Greppable: hostGraphMod. -/
def hostGraphMod : RealMod :=
  { name := "SystemsLean.HostGraph"
    imports := ["SystemsLean.HostFront", "SystemsLean.HostTerm"] }

/-- LlvmLinearText multi-import (Linear+LlvmHold+LlvmEmitPath+LlvmMultText on disk).
    Greppable: llvmLinearTextMod. -/
def llvmLinearTextMod : RealMod :=
  { name := "SystemsLean.LlvmLinearText"
    imports := ["SystemsLean.Linear", "SystemsLean.LlvmHold",
                "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText"] }

/-- MultFsWriteTool (imports MultSubsetEmit only).
    Greppable: multFsWriteToolMod. -/
def multFsWriteToolMod : RealMod :=
  { name := "SystemsLean.MultFsWriteTool"
    imports := ["SystemsLean.MultSubsetEmit"] }

/-- FrontMultPackage multi-import (SubsetFront+MultSubsetEmit+MultSubsetRebuild).
    Greppable: frontMultPackageMod. -/
def frontMultPackageMod : RealMod :=
  { name := "SystemsLean.FrontMultPackage"
    imports := ["SystemsLean.SubsetFront", "SystemsLean.MultSubsetEmit",
                "SystemsLean.MultSubsetRebuild"] }

/-- SubsetPackageJoin multi-import (unit SubsetRebuild parents on disk).
    Greppable: subsetPackageJoinMod. -/
def subsetPackageJoinMod : RealMod :=
  { name := "SystemsLean.SubsetPackageJoin"
    imports := ["SystemsLean.MultSubsetRebuild", "SystemsLean.LinearSubsetRebuild",
                "SystemsLean.TypesSubsetRebuild", "SystemsLean.ProgramSubsetRebuild",
                "SystemsLean.ExtractSubsetRebuild", "SystemsLean.ErasureSubsetRebuild",
                "SystemsLean.GraphSubsetRebuild", "SystemsLean.ComposeSubsetRebuild"] }

/-- HostGraphTheorems (imports HostGraph only; same HostGraph namespace on disk).
    Greppable: hostGraphTheoremsMod. -/
def hostGraphTheoremsMod : RealMod :=
  { name := "SystemsLean.HostGraphTheorems"
    imports := ["SystemsLean.HostGraph"] }

/-- LlvmTypesText multi-import (Types+Mult+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText).
    Greppable: llvmTypesTextMod. -/
def llvmTypesTextMod : RealMod :=
  { name := "SystemsLean.LlvmTypesText"
    imports := ["SystemsLean.Types", "SystemsLean.Mult", "SystemsLean.LlvmHold",
                "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
                "SystemsLean.LlvmLinearText"] }

/-- MultFsDeepen multi-import (MultSubsetRebuild+EmitMult+MultFsWriteTool on disk).
    Greppable: multFsDeepenMod. -/
def multFsDeepenMod : RealMod :=
  { name := "SystemsLean.MultFsDeepen"
    imports := ["SystemsLean.MultSubsetRebuild", "SystemsLean.EmitMult",
                "SystemsLean.MultFsWriteTool"] }

/-- HostPackageWrite multi-import (HostFront+HostGraph+unit SubsetEmit on disk).
    Greppable: hostPackageWriteMod. -/
def hostPackageWriteMod : RealMod :=
  { name := "SystemsLean.HostPackageWrite"
    imports := ["SystemsLean.HostFront", "SystemsLean.HostGraph",
                "SystemsLean.MultSubsetEmit", "SystemsLean.LinearSubsetEmit",
                "SystemsLean.TypesSubsetEmit", "SystemsLean.ProgramSubsetEmit",
                "SystemsLean.GraphSubsetEmit", "SystemsLean.ComposeSubsetEmit"] }

/-- HostPackageWriteTheorems (imports HostPackageWrite; ns HostPackageWrite on disk).
    Greppable: hostPackageWriteTheoremsMod. -/
def hostPackageWriteTheoremsMod : RealMod :=
  { name := "SystemsLean.HostPackageWriteTheorems"
    imports := ["SystemsLean.HostPackageWrite"] }

/-- LlvmProgramText multi-import (IrProgram+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText).
    Greppable: llvmProgramTextMod. -/
def llvmProgramTextMod : RealMod :=
  { name := "SystemsLean.LlvmProgramText"
    imports := ["SystemsLean.IrProgram", "SystemsLean.LlvmHold",
                "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
                "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText"] }

/-- LlvmGraphText multi-import (IrGraph+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText+LlvmProgramText).
    Greppable: llvmGraphTextMod. -/
def llvmGraphTextMod : RealMod :=
  { name := "SystemsLean.LlvmGraphText"
    imports := ["SystemsLean.IrGraph", "SystemsLean.LlvmHold",
                "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
                "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText",
                "SystemsLean.LlvmProgramText"] }

/-- LlvmComposeText multi-import (HostCompose+IrProgram+IrGraph+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText+LlvmProgramText+LlvmGraphText).
    Greppable: llvmComposeTextMod. -/
def llvmComposeTextMod : RealMod :=
  { name := "SystemsLean.LlvmComposeText"
    imports := ["SystemsLean.HostCompose", "SystemsLean.IrProgram",
                "SystemsLean.IrGraph", "SystemsLean.LlvmHold",
                "SystemsLean.LlvmEmitPath", "SystemsLean.LlvmMultText",
                "SystemsLean.LlvmLinearText", "SystemsLean.LlvmTypesText",
                "SystemsLean.LlvmProgramText", "SystemsLean.LlvmGraphText"] }


/-- SelfApplyFs multi-import (full honest on-disk package imports; 39 edges).
    Greppable: selfApplyFsMod. -/
def selfApplyFsMod : RealMod :=
  { name := "SystemsLean.SelfApplyFs"
    imports := ["SystemsLean.SelfApply",
                "SystemsLean.ParityEmit",
                "SystemsLean.KernelEmit",
                "SystemsLean.HostCompose",
                "SystemsLean.EmitBody",
                "SystemsLean.EmitMult",
                "SystemsLean.KernelSelfApply",
                "SystemsLean.ProductOutKernel",
                "SystemsLean.BootstrapHonesty",
                "SystemsLean.ProductPathWriterSurface",
                "SystemsLean.ProductPathWriterPathPlan",
                "SystemsLean.ProductPathWriterPathExec",
                "SystemsLean.ProductPathOwnershipInputs",
                "SystemsLean.ProductPathPerform",
                "SystemsLean.ProductPathPerformStep",
                "SystemsLean.ProductPathReadSsot",
                "SystemsLean.ProductPathComposePlan",
                "SystemsLean.ProductPathWriteHc",
                "SystemsLean.Capable",
                "SystemsLean.CapableStepContract",
                "SystemsLean.CapableRead",
                "SystemsLean.CapableCompose",
                "SystemsLean.CapableWriteHc",
                "SystemsLean.CapableRegenerate",
                "SystemsLean.InstallOut",
                "SystemsLean.CapableFullBar",
                "SystemsLean.ProductPathOwnershipRegenerate",
                "SystemsLean.PerformEvidence",
                "SystemsLean.OfficialPath",
                "SystemsLean.OfficialPathAlternate",
                "SystemsLean.DualEqWriteParity",
                "SystemsLean.DualEqWriteClosePath",
                "SystemsLean.DualEqWriteApi",
                "SystemsLean.DualEqWriteCapableGap",
                "SystemsLean.OfficialRetire",
                "SystemsLean.PerformClaimed",
                "SystemsLean.OwnershipClaimed",
                "SystemsLean.StepContractFull",
                "SystemsLean.SelfHostComplete"] }

/-- SelfApplyFsTheorems companion (parent SelfApplyFs only; same namespace SelfApplyFs).
    Greppable: selfApplyFsTheoremsMod. -/
def selfApplyFsTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfApplyFsTheorems"
    imports := ["SystemsLean.SelfApplyFs"] }

/-- InventoryClose multi-import (SelfApplyFs + LlvmHold on disk).
    Greppable: inventoryCloseMod. -/
def inventoryCloseMod : RealMod :=
  { name := "SystemsLean.InventoryClose"
    imports := ["SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"] }

/-- ProductPathBars multi-import (CompilePath+KernelEmit+KernelProgram+HostCompose+
    IrProgram+JoinMap+SelfHost+SurfaceMatrix+SelfApplyFs on disk).
    Greppable: productPathBarsMod. -/
def productPathBarsMod : RealMod :=
  { name := "SystemsLean.ProductPathBars"
    imports := ["SystemsLean.CompilePath", "SystemsLean.KernelEmit",
                "SystemsLean.KernelProgram", "SystemsLean.HostCompose",
                "SystemsLean.IrProgram", "SystemsLean.JoinMap",
                "SystemsLean.SelfHost", "SystemsLean.SurfaceMatrix",
                "SystemsLean.SelfApplyFs"] }

/-- InventoryCloseTheorems multi-import (SelfApplyFs+LlvmHold+InventoryClose on disk;
    same namespace InventoryClose).
    Greppable: inventoryCloseTheoremsMod. -/
def inventoryCloseTheoremsMod : RealMod :=
  { name := "SystemsLean.InventoryCloseTheorems"
    imports := ["SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
                "SystemsLean.InventoryClose"] }

/-- ProductPath multi-import (InventoryClose+SelfApplyFs+LlvmHold+ProductPathBars on disk).
    Greppable: productPathMod. -/
def productPathMod : RealMod :=
  { name := "SystemsLean.ProductPath"
    imports := ["SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold", "SystemsLean.ProductPathBars"] }

/-- ProductPathTheorems multi-import (parent ProductPath + path/unit deps on disk;
    same namespace ProductPath).
    Greppable: productPathTheoremsMod. -/
def productPathTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathTheorems"
    imports := ["SystemsLean.InventoryClose", "SystemsLean.CompilePath",
                "SystemsLean.KernelEmit", "SystemsLean.KernelProgram",
                "SystemsLean.HostCompose", "SystemsLean.IrProgram",
                "SystemsLean.JoinMap", "SystemsLean.SelfHost",
                "SystemsLean.SurfaceMatrix", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold", "SystemsLean.ProductPath"] }

/-- DualResidual multi-import (ProductPath+InventoryClose+SelfApplyFs+LlvmHold on disk).
    PARTIAL-STRUCTURAL seed only; hostElaboratorResidualFreeClaimed stays false.
    Greppable: dualResidualMod. -/
def dualResidualMod : RealMod :=
  { name := "SystemsLean.DualResidual"
    imports := ["SystemsLean.ProductPath", "SystemsLean.InventoryClose",
                "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"] }

/-- DualResidualTheorems multi-import (parent DualResidual + path deps on disk;
    same namespace DualResidual).
    Greppable: dualResidualTheoremsMod. -/
def dualResidualTheoremsMod : RealMod :=
  { name := "SystemsLean.DualResidualTheorems"
    imports := ["SystemsLean.ProductPath", "SystemsLean.InventoryClose",
                "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
                "SystemsLean.DualResidual"] }

/-- ProbeWire multi-import (DualResidual+ProductPath+InventoryClose+SelfApplyFs+LlvmHold).
    Greppable: probeWireMod. -/
def probeWireMod : RealMod :=
  { name := "SystemsLean.ProbeWire"
    imports := ["SystemsLean.DualResidual", "SystemsLean.ProductPath",
                "SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold"] }

/-- SelfHostBody multi-import (Emit stack + SelfApplyFs + LlvmHold + DualResidual).
    Greppable: selfHostBodyMod. -/
def selfHostBodyMod : RealMod :=
  { name := "SystemsLean.SelfHostBody"
    imports := ["SystemsLean.EmitMult", "SystemsLean.EmitLinear",
                "SystemsLean.EmitErasure", "SystemsLean.EmitExtract",
                "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
                "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
                "SystemsLean.EmitComposeScaffold", "SystemsLean.EmitPlan",
                "SystemsLean.EmitPlanScaffold", "SystemsLean.EmitApply",
                "SystemsLean.EmitApplyScaffold", "SystemsLean.EmitBody",
                "SystemsLean.EmitBodyScaffold", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold", "SystemsLean.DualResidual"] }

/-- ProbeWireTheorems multi-import (parent ProbeWire + deps).
    Greppable: probeWireTheoremsMod. -/
def probeWireTheoremsMod : RealMod :=
  { name := "SystemsLean.ProbeWireTheorems"
    imports := ["SystemsLean.DualResidual", "SystemsLean.ProductPath",
                "SystemsLean.InventoryClose", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold", "SystemsLean.ProbeWire"] }

/-- SelfHostBodyTheorems multi-import (parent SelfHostBody + deps).
    Greppable: selfHostBodyTheoremsMod. -/
def selfHostBodyTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfHostBodyTheorems"
    imports := ["SystemsLean.EmitMult", "SystemsLean.EmitLinear",
                "SystemsLean.EmitErasure", "SystemsLean.EmitExtract",
                "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
                "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
                "SystemsLean.EmitPlan", "SystemsLean.EmitApply",
                "SystemsLean.EmitBody", "SystemsLean.SelfApplyFs",
                "SystemsLean.LlvmHold", "SystemsLean.DualResidual",
                "SystemsLean.SelfHostBody"] }

/-- SpecProof multi-import (ProbeWire+DualResidual+ProductPath+InventoryClose+SelfApplyFs+LlvmHold).
    Greppable: specProofMod. -/
def specProofMod : RealMod :=
  { name := "SystemsLean.SpecProof"
    imports := ["SystemsLean.ProbeWire", "SystemsLean.DualResidual",
                "SystemsLean.ProductPath", "SystemsLean.InventoryClose",
                "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold"] }

/-- SpecProofTheorems multi-import (parent SpecProof + deps).
    Greppable: specProofTheoremsMod. -/
def specProofTheoremsMod : RealMod :=
  { name := "SystemsLean.SpecProofTheorems"
    imports := ["SystemsLean.ProbeWire", "SystemsLean.DualResidual",
                "SystemsLean.ProductPath", "SystemsLean.InventoryClose",
                "SystemsLean.SelfApplyFs", "SystemsLean.LlvmHold",
                "SystemsLean.SpecProof"] }

/-- Good Mult-only subset (A4 regression). Greppable: hostImportGraphGoodMultSeed. -/
def hostImportGraphGoodMultSeed : ImportGraphResult :=
  resolveImportGraph [multLeafMod, multTheoremsMod]

/-- Good expand seed (Mult..Compose + Erasure/Extract + CompilePath/Kernel +
    Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply +
    KernelSelfApplyTheorems + EmitMult + EmitPlan + EmitApply + EmitBody +
    KernelEmit + KernelEmitTheorems + ParityMult + ParityMultTheorems +
    ParityLinear + ParityLinearTheorems + ParityTypes + ParityTypesTheorems +
    ParityProgram + ParityProgramTheorems + ParityEmit + ParityEmitTheorems +
    SelfApply + SelfApplyTheorems + EmitLinear + EmitTypes + EmitProgram +
    EmitGraph + EmitCompose + EmitErasure + EmitExtract + EmitBanner +
    ProductOutKernel + ProductOutKernelTheorems + BootstrapHonesty +
    BootstrapHonestyTheorems + ProductPathWriterSurface +
    ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan +
    ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec +
    ProductPathWriterPathExecTheorems + ProductPathOwnershipInputs +
    ProductPathOwnershipInputsTheorems + ProductPathPerform +
    ProductPathPerformTheorems + ProductPathPerformStep +
    ProductPathPerformStepTheorems + ProductPathReadSsot +
    ProductPathReadSsotTheorems + ProductPathComposePlan +
    ProductPathComposePlanTheorems + Capable + CapableTheorems +
    CapableStepContract + CapableStepContractTheorems + InstallOut +
    InstallOutTheorems + OfficialPath + OfficialPathTheorems +
    PerformEvidence + PerformEvidenceTheorems + CapableRead +
    CapableReadTheorems + CapableCompose + CapableComposeTheorems +
    CapableFullBar + CapableFullBarTheorems + DualEqWriteCapableGap +
    DualEqWriteCapableGapTheorems + DualEqWriteClosePath +
    DualEqWriteClosePathTheorems + DualEqWriteParity + DualEqWriteParityTheorems +
    OfficialRetire + OfficialRetireTheorems + OwnershipClaimed +
    OwnershipClaimedTheorems + PerformClaimed + PerformClaimedTheorems +
    StepContractFull + StepContractFullTheorems + SelfHostComplete +
    SelfHostCompleteTheorems + OfficialPathAlternate +
    OfficialPathAlternateTheorems + ProductPathOwnershipRegenerate +
    ProductPathOwnershipRegenerateTheorems + CapableWriteHcLoad +
    DualEqWriteLoad + CapableWriteHc + DualEqWriteApi + LlvmHold +
    LlvmHoldTheorems + CapableRegenerate + CapableRegenerateTheorems +
    FreestandingEmitLoad + FreestandingEmitLoadScaffold +
    LakeRetireInventory + HostPackageRoots + FreestandingEmit +
    ProductPathWriteHc + ProductPathWriteHcTheorems +
    CompilePathMult + CompilePathLinear + CompilePathTypes +
    CompilePathProgram + CompilePathGraph + CompilePathCompose +
    CompilePathPlan + CompilePathApply + CompilePathBody +
    CompilePathErasure + CompilePathExtract +
    ProductWireWriteTool + HostTerm + LlvmEmitPath + SubsetFront +
    FirstSurface + LinearSubsetEmit + TypesSubsetEmit + ProgramSubsetEmit +
    GraphSubsetEmit + ComposeSubsetEmit + ErasureSubsetEmit + ExtractSubsetEmit +
    MultSubsetEmit + MultSubsetRebuild + LinearSubsetRebuild + TypesSubsetRebuild +
    ProgramSubsetRebuild + GraphSubsetRebuild + ComposeSubsetRebuild +
    ErasureSubsetRebuild + ExtractSubsetRebuild + HostFront + LlvmMultText + HostFrontTheorems + HostCheck + HostGraph + LlvmLinearText + MultFsWriteTool + FrontMultPackage + SubsetPackageJoin + HostGraphTheorems + LlvmTypesText + MultFsDeepen + HostPackageWrite + HostPackageWriteTheorems + LlvmProgramText + LlvmGraphText + LlvmComposeText + SelfApplyFs + SelfApplyFsTheorems + InventoryClose + ProductPathBars + InventoryCloseTheorems + ProductPath + ProductPathTheorems + DualResidual + DualResidualTheorems + ProbeWire + SelfHostBody + ProbeWireTheorems + SelfHostBodyTheorems + SpecProof + SpecProofTheorems).
    Greppable: hostImportGraphGoodExpandSeed. -/
def hostImportGraphGoodExpandSeed : ImportGraphResult :=
  resolveImportGraph
    [multLeafMod, multTheoremsMod, linearLeafMod, linearTheoremsMod,
     typesMod, typesTheoremsMod, irProgramMod, irProgramTheoremsMod,
     irGraphMod, irGraphTheoremsMod, hostComposeMod, hostComposeTheoremsMod,
     erasureMod, erasureTheoremsMod, extractMod, extractTheoremsMod,
     compilePathMod, kernelMultMod, kernelLinearMod, kernelTypesMod,
     kernelProgramMod, kernelMultTheoremsMod, kernelLinearTheoremsMod,
     kernelTypesTheoremsMod, kernelProgramTheoremsMod, joinMapMod,
     joinMapTheoremsMod, selfHostMod, selfHostTheoremsMod, surfaceMatrixMod,
     surfaceMatrixTheoremsMod, emitMultScaffoldMod, emitLinearScaffoldMod,
     emitTypesScaffoldMod, emitProgramScaffoldMod, emitGraphScaffoldMod,
     emitComposeScaffoldMod, emitPlanScaffoldMod, emitApplyScaffoldMod,
     emitBodyScaffoldMod, emitErasureScaffoldMod, emitExtractScaffoldMod,
     emitBannerScaffoldMod, kernelSelfApplyMod, kernelSelfApplyTheoremsMod,
     emitMultMod, emitPlanMod, emitApplyMod, emitBodyMod, kernelEmitMod,
     kernelEmitTheoremsMod, parityMultMod, parityMultTheoremsMod,
     parityLinearMod, parityLinearTheoremsMod, parityTypesMod,
     parityTypesTheoremsMod, parityProgramMod, parityProgramTheoremsMod,
     parityEmitMod, parityEmitTheoremsMod, selfApplyMod, selfApplyTheoremsMod,
     emitLinearMod, emitTypesMod, emitProgramMod, emitGraphMod, emitComposeMod,
     emitErasureMod, emitExtractMod, emitBannerMod, productOutKernelMod,
     productOutKernelTheoremsMod, bootstrapHonestyMod,
     bootstrapHonestyTheoremsMod, productPathWriterSurfaceMod,
     productPathWriterSurfaceTheoremsMod, productPathWriterPathPlanMod,
     productPathWriterPathPlanTheoremsMod, productPathWriterPathExecMod,
     productPathWriterPathExecTheoremsMod, productPathOwnershipInputsMod,
     productPathOwnershipInputsTheoremsMod, productPathPerformMod,
     productPathPerformTheoremsMod, productPathPerformStepMod,
     productPathPerformStepTheoremsMod, productPathReadSsotMod,
     productPathReadSsotTheoremsMod, productPathComposePlanMod,
     productPathComposePlanTheoremsMod, capableMod, capableTheoremsMod, capableStepContractMod, capableStepContractTheoremsMod, installOutMod, installOutTheoremsMod, officialPathMod, officialPathTheoremsMod, performEvidenceMod, performEvidenceTheoremsMod, capableReadMod, capableReadTheoremsMod, capableComposeMod, capableComposeTheoremsMod, capableFullBarMod, capableFullBarTheoremsMod, dualEqWriteCapableGapMod, dualEqWriteCapableGapTheoremsMod, dualEqWriteClosePathMod, dualEqWriteClosePathTheoremsMod, dualEqWriteParityMod, dualEqWriteParityTheoremsMod, officialRetireMod, officialRetireTheoremsMod, ownershipClaimedMod, ownershipClaimedTheoremsMod, performClaimedMod, performClaimedTheoremsMod, stepContractFullMod, stepContractFullTheoremsMod, selfHostCompleteMod, selfHostCompleteTheoremsMod, officialPathAlternateMod, officialPathAlternateTheoremsMod, productPathOwnershipRegenerateMod, productPathOwnershipRegenerateTheoremsMod, capableWriteHcLoadMod, dualEqWriteLoadMod, capableWriteHcMod, dualEqWriteApiMod, llvmHoldMod, llvmHoldTheoremsMod, capableRegenerateMod, capableRegenerateTheoremsMod, freestandingEmitLoadMod, freestandingEmitLoadScaffoldMod, lakeRetireInventoryMod, hostPackageRootsMod, freestandingEmitMod, productPathWriteHcMod, productPathWriteHcTheoremsMod, compilePathMultMod, compilePathLinearMod, compilePathTypesMod, compilePathProgramMod, compilePathGraphMod, compilePathComposeMod, compilePathPlanMod, compilePathApplyMod, compilePathBodyMod, compilePathErasureMod, compilePathExtractMod, productWireWriteToolMod, hostTermMod, llvmEmitPathMod, subsetFrontMod, firstSurfaceMod, linearSubsetEmitMod, typesSubsetEmitMod, programSubsetEmitMod, graphSubsetEmitMod, composeSubsetEmitMod, erasureSubsetEmitMod, extractSubsetEmitMod, multSubsetEmitMod, multSubsetRebuildMod, linearSubsetRebuildMod, typesSubsetRebuildMod, programSubsetRebuildMod, graphSubsetRebuildMod, composeSubsetRebuildMod, erasureSubsetRebuildMod, extractSubsetRebuildMod, hostFrontMod, llvmMultTextMod, hostFrontTheoremsMod, hostCheckMod, hostGraphMod, llvmLinearTextMod, multFsWriteToolMod, frontMultPackageMod, subsetPackageJoinMod, hostGraphTheoremsMod, llvmTypesTextMod, multFsDeepenMod, hostPackageWriteMod, hostPackageWriteTheoremsMod, llvmProgramTextMod, llvmGraphTextMod, llvmComposeTextMod, selfApplyFsMod,
     selfApplyFsTheoremsMod, inventoryCloseMod, productPathBarsMod,
     inventoryCloseTheoremsMod, productPathMod, productPathTheoremsMod,
     dualResidualMod, dualResidualTheoremsMod, probeWireMod, selfHostBodyMod,
     probeWireTheoremsMod, selfHostBodyTheoremsMod, specProofMod,
     specProofTheoremsMod]

/-- Bad: MultTheorems without Mult present. Greppable: hostImportGraphBadMissing. -/
def hostImportGraphBadMissing : ImportGraphResult :=
  resolveImportGraph [multTheoremsMod]

/-- Bad: two-module cycle. Greppable: hostImportGraphBadCycle. -/
def hostImportGraphBadCycle : ImportGraphResult :=
  resolveImportGraph
    [ { name := "SystemsLean.A", imports := ["SystemsLean.B"] },
      { name := "SystemsLean.B", imports := ["SystemsLean.A"] } ]
end SystemsLean.HostImportGraph
