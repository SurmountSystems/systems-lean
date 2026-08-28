/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 later-fold env evidence.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: PE45..PE92 dialect reject / L0 accept later-fold.
  Helper packageEnvDialectRejectsIllTyped plus CompilePath Mult..PE91 twins.
  Same namespace SystemsLean.HostModuleCheck. Evidence keeps PE1..PE44 plus
  combined Ok folds and native_decide theorems.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12. Not FullHostElaborateRemains.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  - Not a new harness TERM companion. Harness stays 134. TERM stays 79.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckPackageEnvEvidenceLater, PACKAGE-ELABORATE,
  packageEnvDialectRejectsIllTyped,
  hostModuleCheckBadPackageEnvIllTypedCompilePathMultDialectReject,
  hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildDialectReject,
  hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildL0Accept,
  hostModuleCheckBadPackageEnvIllTypedHostFrontDialectReject,
  hostModuleCheckBadPackageEnvIllTypedHostFrontL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmMultTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmMultTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedHostCheckDialectReject,
  hostModuleCheckBadPackageEnvIllTypedHostCheckL0Accept,
  hostModuleCheckBadPackageEnvIllTypedHostGraphDialectReject,
  hostModuleCheckBadPackageEnvIllTypedHostGraphL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolDialectReject,
  hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolL0Accept,
  hostModuleCheckBadPackageEnvIllTypedFrontMultPackageDialectReject,
  hostModuleCheckBadPackageEnvIllTypedFrontMultPackageL0Accept,
  hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedMultFsDeepenDialectReject,
  hostModuleCheckBadPackageEnvIllTypedHostPackageWriteDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextDialectReject,
  hostModuleCheckBadPackageEnvIllTypedSelfApplyFsDialectReject,
  hostModuleCheckBadPackageEnvIllTypedInventoryCloseDialectReject,
  hostModuleCheckBadPackageEnvIllTypedProductPathBarsDialectReject,
  hostModuleCheckBadPackageEnvIllTypedProductPathDialectReject,
  hostModuleCheckBadPackageEnvIllTypedProbeWireDialectReject,
  hostModuleCheckBadPackageEnvIllTypedSelfHostBodyDialectReject,
  hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedMultFsDeepenL0Accept,
  hostModuleCheckBadPackageEnvIllTypedHostPackageWriteL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextL0Accept,
  hostModuleCheckBadPackageEnvIllTypedSelfApplyFsL0Accept,
  hostModuleCheckBadPackageEnvIllTypedInventoryCloseL0Accept,
  hostModuleCheckBadPackageEnvIllTypedProductPathBarsL0Accept,
  hostModuleCheckBadPackageEnvIllTypedProductPathL0Accept,
  hostModuleCheckBadPackageEnvIllTypedProbeWireL0Accept,
  hostModuleCheckBadPackageEnvIllTypedSelfHostBodyL0Accept,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnvEvidenceLater
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnvEvidenceLater;
  lake build SystemsLean.HostModuleCheckPackageEnvEvidence;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnv
import SystemsLean.HostModuleCheckLlvmProgramTextTerm
import SystemsLean.HostModuleCheckLlvmGraphTextTerm
import SystemsLean.HostModuleCheckLlvmComposeTextTerm
import SystemsLean.HostModuleCheckSelfApplyFsTerm
import SystemsLean.HostModuleCheckInventoryCloseTerm
import SystemsLean.HostModuleCheckProductPathBarsTerm
import SystemsLean.HostModuleCheckProductPathTerm
import SystemsLean.HostModuleCheckProbeWireTerm
import SystemsLean.HostModuleCheckSelfHostBodyTerm

namespace SystemsLean.HostModuleCheck

/-! ### Later-fold PE45..PE92 dialect rejects (CompilePath Mult through SelfHostBody leftover) -/

/-- True when package dialect rejects as ILL-TYPED-TERM (later-fold helper).
    Greppable: packageEnvDialectRejectsIllTyped. -/
def packageEnvDialectRejectsIllTyped (content : String) : Bool :=
  match checkPackageEnvDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

/-- Dialect rejects PE45 ill-typed CompilePathMult body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathMultDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathMultDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathMultText

/-- Dialect rejects PE46 ill-typed CompilePathLinear body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathLinearDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathLinearDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathLinearText

/-- Dialect rejects PE47 ill-typed CompilePathTypes body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathTypesDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathTypesDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathTypesText

/-- Dialect rejects PE48 ill-typed CompilePathProgram body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathProgramDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathProgramDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathProgramText

/-- Dialect rejects PE49 ill-typed CompilePathGraph body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathGraphDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathGraphDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathGraphText

/-- Dialect rejects PE50 ill-typed CompilePathCompose body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathComposeDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathComposeDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathComposeText

/-- Dialect rejects PE51 ill-typed CompilePathErasure body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathErasureDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathErasureDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText

/-- Dialect rejects PE52 ill-typed CompilePathExtract body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathExtractDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathExtractDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText

/-- Dialect rejects PE53 ill-typed CompilePathPlan body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathPlanDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathPlanDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText

/-- Dialect rejects PE54 ill-typed CompilePathApply body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathApplyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathApplyDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText

/-- Dialect rejects PE55 ill-typed CompilePathBody body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathBodyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathBodyDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText

/-- Dialect rejects PE56 ill-typed FirstSurface body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFirstSurfaceDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedFirstSurfaceDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText

/-- Dialect rejects PE57 ill-typed LinearSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText

/-- Dialect rejects PE58 ill-typed TypesSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText

/-- Dialect rejects PE59 ill-typed ProgramSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText

/-- Dialect rejects PE60 ill-typed GraphSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText

/-- Dialect rejects PE61 ill-typed ComposeSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText

/-- Dialect rejects PE62 ill-typed ErasureSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText

/-- Dialect rejects PE63 ill-typed ExtractSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText

/-- Dialect rejects PE64 ill-typed MultSubsetEmit body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitText

/-- Dialect rejects PE65 ill-typed MultSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildText

/-- Dialect rejects PE66 ill-typed LinearSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildText

/-- Dialect rejects PE67 ill-typed TypesSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildText

/-- Dialect rejects PE68 ill-typed ProgramSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText

/-- Dialect rejects PE69 ill-typed GraphSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText

/-- Dialect rejects PE70 ill-typed ComposeSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText

/-- Dialect rejects PE71 ill-typed ErasureSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText

/-- Dialect rejects PE72 ill-typed ExtractSubsetRebuild body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText

/-- Dialect rejects PE73 ill-typed HostFront body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostFrontDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedHostFrontDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedHostFrontText

/-- Dialect rejects PE74 ill-typed LLVM Mult text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmMultTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmMultTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText

/-- Dialect rejects PE75 ill-typed Host fragment check body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostCheckDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedHostCheckDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedHostCheckText

/-- Dialect rejects PE76 ill-typed Host fragment graph body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostGraphDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedHostGraphDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedHostGraphText

/-- Dialect rejects PE77 ill-typed LLVM Linear text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText

/-- Dialect rejects PE78 ill-typed Mult package writer tool body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText

/-- Dialect rejects PE79 ill-typed FrontMultPackage body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFrontMultPackageDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedFrontMultPackageDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText

/-- Dialect rejects PE80 ill-typed SubsetPackageJoin body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText

/-- Dialect rejects PE81 ill-typed LLVM Types text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText

/-- Dialect rejects PE82 ill-typed MultFsDeepen body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultFsDeepenDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedMultFsDeepenDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedMultFsDeepenText

/-- Dialect rejects PE83 ill-typed HostPackageWrite body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostPackageWriteDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedHostPackageWriteDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedHostPackageWriteText

/-- Dialect rejects PE84 ill-typed LLVM Program text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextText

/-- Dialect rejects PE85 ill-typed LLVM Graph text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextText

/-- Dialect rejects PE86 ill-typed LLVM Compose text body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextText

/-- Dialect rejects PE87 ill-typed SelfApply leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfApplyFsDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSelfApplyFsDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedSelfApplyFsText

/-- Dialect rejects PE88 ill-typed InventoryClose leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedInventoryCloseDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedInventoryCloseDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedInventoryCloseText

/-- Dialect rejects PE89 ill-typed ProductPathBars leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductPathBarsDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProductPathBarsDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedProductPathBarsText

/-- Dialect rejects PE90 ill-typed ProductPath leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductPathDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProductPathDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedProductPathText

/-- Dialect rejects PE91 ill-typed ProbeWire leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProbeWireDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedProbeWireDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedProbeWireText

/-- Dialect rejects PE92 ill-typed SelfHostBody leftover body.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfHostBodyDialectReject. -/
def hostModuleCheckBadPackageEnvIllTypedSelfHostBodyDialectReject : Bool :=
  packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedSelfHostBodyText

/-! ### Later-fold PE45..PE92 L0 accepts -/

/-- L0 still accepts PE45.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathMultL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathMultL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathMultText

/-- L0 still accepts PE46.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathLinearL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathLinearL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathLinearText

/-- L0 still accepts PE47.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathTypesL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathTypesL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathTypesText

/-- L0 still accepts PE48.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathProgramL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathProgramL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathProgramText

/-- L0 still accepts PE49.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathGraphL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathGraphL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathGraphText

/-- L0 still accepts PE50.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathComposeL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathComposeL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathComposeText

/-- L0 still accepts PE51.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathErasureL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathErasureL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathErasureText

/-- L0 still accepts PE52.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathExtractL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathExtractL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathExtractText

/-- L0 still accepts PE53.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathPlanL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathPlanL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathPlanText

/-- L0 still accepts PE54.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathApplyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathApplyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathApplyText

/-- L0 still accepts PE55.
    Greppable: hostModuleCheckBadPackageEnvIllTypedCompilePathBodyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedCompilePathBodyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedCompilePathBodyText

/-- L0 still accepts PE56.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFirstSurfaceL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedFirstSurfaceL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedFirstSurfaceText

/-- L0 still accepts PE57.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLinearSubsetEmitText

/-- L0 still accepts PE58.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedTypesSubsetEmitText

/-- L0 still accepts PE59.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProgramSubsetEmitText

/-- L0 still accepts PE60.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedGraphSubsetEmitText

/-- L0 still accepts PE61.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedComposeSubsetEmitText

/-- L0 still accepts PE62.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedErasureSubsetEmitText

/-- L0 still accepts PE63.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedExtractSubsetEmitText

/-- L0 still accepts PE64.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedMultSubsetEmitText

/-- L0 still accepts PE65.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedMultSubsetRebuildText

/-- L0 still accepts PE66.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLinearSubsetRebuildText

/-- L0 still accepts PE67.
    Greppable: hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedTypesSubsetRebuildText

/-- L0 still accepts PE68.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProgramSubsetRebuildText

/-- L0 still accepts PE69.
    Greppable: hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedGraphSubsetRebuildText

/-- L0 still accepts PE70.
    Greppable: hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedComposeSubsetRebuildText

/-- L0 still accepts PE71.
    Greppable: hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedErasureSubsetRebuildText

/-- L0 still accepts PE72.
    Greppable: hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedExtractSubsetRebuildText

/-- L0 still accepts PE73.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostFrontL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedHostFrontL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedHostFrontText

/-- L0 still accepts PE74.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmMultTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmMultTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmMultTextText

/-- L0 still accepts PE75.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostCheckL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedHostCheckL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedHostCheckText

/-- L0 still accepts PE76.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostGraphL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedHostGraphL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedHostGraphText

/-- L0 still accepts PE77.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmLinearTextText

/-- L0 still accepts PE78.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedMultFsWriteToolText

/-- L0 still accepts PE79.
    Greppable: hostModuleCheckBadPackageEnvIllTypedFrontMultPackageL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedFrontMultPackageL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedFrontMultPackageText

/-- L0 still accepts PE80.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSubsetPackageJoinText

/-- L0 still accepts PE81.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmTypesTextText

/-- L0 still accepts PE82.
    Greppable: hostModuleCheckBadPackageEnvIllTypedMultFsDeepenL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedMultFsDeepenL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedMultFsDeepenText

/-- L0 still accepts PE83.
    Greppable: hostModuleCheckBadPackageEnvIllTypedHostPackageWriteL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedHostPackageWriteL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedHostPackageWriteText

/-- L0 still accepts PE84.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmProgramTextText

/-- L0 still accepts PE85.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmGraphTextText

/-- L0 still accepts PE86.
    Greppable: hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedLlvmComposeTextText

/-- L0 still accepts PE87.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfApplyFsL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSelfApplyFsL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSelfApplyFsText

/-- L0 still accepts PE88.
    Greppable: hostModuleCheckBadPackageEnvIllTypedInventoryCloseL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedInventoryCloseL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedInventoryCloseText

/-- L0 still accepts PE89.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductPathBarsL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProductPathBarsL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProductPathBarsText

/-- L0 still accepts PE90.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProductPathL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProductPathL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProductPathText

/-- L0 still accepts PE91.
    Greppable: hostModuleCheckBadPackageEnvIllTypedProbeWireL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedProbeWireL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedProbeWireText

/-- L0 still accepts PE92.
    Greppable: hostModuleCheckBadPackageEnvIllTypedSelfHostBodyL0Accept. -/
def hostModuleCheckBadPackageEnvIllTypedSelfHostBodyL0Accept : Bool :=
  checkPackageEnvL0 hostModuleCheckBadPackageEnvIllTypedSelfHostBodyText

/-! ### Living package-env TERM SurfaceOk fold (split from PackageEnv) -/

/-- Living Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Emit + U2 TERM
    SurfaceOk. Greppable: packageEnvTermSurfaceOk,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only. -/
def packageEnvTermSurfaceOk : Bool :=
  hostModuleCheckMultTermSurfaceOk
    && hostModuleCheckLinearTermSurfaceOk
    && hostModuleCheckTypesTermSurfaceOk
    && hostModuleCheckIrProgramTermSurfaceOk
    && hostModuleCheckIrGraphTermSurfaceOk
    && hostModuleCheckHostComposeTermSurfaceOk
    && hostModuleCheckErasureTermSurfaceOk
    && hostModuleCheckExtractTermSurfaceOk
    && hostModuleCheckEmitPlanTermSurfaceOk
    && hostModuleCheckEmitApplyTermSurfaceOk
    && hostModuleCheckEmitBodyTermSurfaceOk
    && hostModuleCheckKernelMultTermSurfaceOk
    && hostModuleCheckKernelLinearTermSurfaceOk
    && hostModuleCheckKernelTypesTermSurfaceOk
    && hostModuleCheckKernelProgramTermSurfaceOk
    && hostModuleCheckKernelEmitTermSurfaceOk
    && hostModuleCheckParityMultTermSurfaceOk
    && hostModuleCheckParityLinearTermSurfaceOk
    && hostModuleCheckParityTypesTermSurfaceOk
    && hostModuleCheckParityProgramTermSurfaceOk
    && hostModuleCheckParityEmitTermSurfaceOk
    && hostModuleCheckEmitMultScaffoldTermSurfaceOk
    && hostModuleCheckEmitLinearScaffoldTermSurfaceOk
    && hostModuleCheckEmitTypesScaffoldTermSurfaceOk
    && hostModuleCheckEmitProgramScaffoldTermSurfaceOk
    && hostModuleCheckEmitGraphScaffoldTermSurfaceOk
    && hostModuleCheckEmitComposeScaffoldTermSurfaceOk
    && hostModuleCheckEmitErasureScaffoldTermSurfaceOk
    && hostModuleCheckEmitExtractScaffoldTermSurfaceOk
    && hostModuleCheckEmitBannerScaffoldTermSurfaceOk
    && hostModuleCheckKernelSelfApplyTermSurfaceOk
    && hostModuleCheckProductOutKernelTermSurfaceOk
    && hostModuleCheckCompilePathTermSurfaceOk
    && hostModuleCheckJoinMapTermSurfaceOk
    && hostModuleCheckSelfHostTermSurfaceOk
    && hostModuleCheckSurfaceMatrixTermSurfaceOk
    && hostModuleCheckSpecProofTermSurfaceOk
    && hostModuleCheckDualResidualTermSurfaceOk
    && hostModuleCheckCompilePathMultTermSurfaceOk
    && hostModuleCheckCompilePathLinearTermSurfaceOk
    && hostModuleCheckCompilePathTypesTermSurfaceOk
    && hostModuleCheckCompilePathProgramTermSurfaceOk
    && hostModuleCheckCompilePathGraphTermSurfaceOk
    && hostModuleCheckCompilePathComposeTermSurfaceOk
    && hostModuleCheckCompilePathErasureTermSurfaceOk
    && hostModuleCheckCompilePathExtractTermSurfaceOk
    && hostModuleCheckCompilePathPlanTermSurfaceOk
    && hostModuleCheckCompilePathApplyTermSurfaceOk
    && hostModuleCheckCompilePathBodyTermSurfaceOk
    && hostModuleCheckFirstSurfaceTermSurfaceOk
    && hostModuleCheckLinearSubsetEmitTermSurfaceOk
    && hostModuleCheckTypesSubsetEmitTermSurfaceOk
    && hostModuleCheckProgramSubsetEmitTermSurfaceOk
    && hostModuleCheckGraphSubsetEmitTermSurfaceOk
    && hostModuleCheckComposeSubsetEmitTermSurfaceOk
    && hostModuleCheckErasureSubsetEmitTermSurfaceOk
    && hostModuleCheckExtractSubsetEmitTermSurfaceOk
    && hostModuleCheckMultSubsetEmitTermSurfaceOk
    && hostModuleCheckMultSubsetRebuildTermSurfaceOk
    && hostModuleCheckLinearSubsetRebuildTermSurfaceOk
    && hostModuleCheckTypesSubsetRebuildTermSurfaceOk
    && hostModuleCheckProgramSubsetRebuildTermSurfaceOk
    && hostModuleCheckGraphSubsetRebuildTermSurfaceOk
    && hostModuleCheckComposeSubsetRebuildTermSurfaceOk
    && hostModuleCheckErasureSubsetRebuildTermSurfaceOk
    && hostModuleCheckExtractSubsetRebuildTermSurfaceOk
    && hostModuleCheckHostFrontTermSurfaceOk
    && hostModuleCheckLlvmMultTextTermSurfaceOk
    && hostModuleCheckHostCheckTermSurfaceOk
    && hostModuleCheckHostGraphTermSurfaceOk
    && hostModuleCheckLlvmLinearTextTermSurfaceOk
    && hostModuleCheckMultFsWriteToolTermSurfaceOk
    && hostModuleCheckFrontMultPackageTermSurfaceOk
    && hostModuleCheckSubsetPackageJoinTermSurfaceOk
    && hostModuleCheckLlvmTypesTextTermSurfaceOk
    && hostModuleCheckMultFsDeepenTermSurfaceOk
    && hostModuleCheckHostPackageWriteTermSurfaceOk
    && hostModuleCheckLlvmProgramTextTermSurfaceOk
    && hostModuleCheckLlvmGraphTextTermSurfaceOk
    && hostModuleCheckLlvmComposeTextTermSurfaceOk
    && hostModuleCheckSelfApplyFsTermSurfaceOk
    && hostModuleCheckInventoryCloseTermSurfaceOk
    && hostModuleCheckProductPathBarsTermSurfaceOk
    && hostModuleCheckProductPathTermSurfaceOk
    && hostModuleCheckProbeWireTermSurfaceOk
    && hostModuleCheckSelfHostBodyTermSurfaceOk

end SystemsLean.HostModuleCheck
