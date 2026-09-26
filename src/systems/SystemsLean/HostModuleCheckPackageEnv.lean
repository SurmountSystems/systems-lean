/-
  SYSTEMS_LEAN_HOST partial -- Package elaborate L4 multi-module env band.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: Mult..EmitBody + Kernel Mult/Linear/Types/Program/Emit
  + Parity Mult..Emit + Emit*Scaffold + KernelSelfApply + ProductOutKernel package
  environment judgment dialect (FullHost meet H2 U2 seed expand). Soft J2 import
  predicates and section require helpers live in HostModuleCheckPackageEnvImports.
  Later S-level dialect tails S30..S46 live in HostModuleCheckPackageEnvDialectTail.
  Term imports from Mult through ProductOutKernel live in
  HostModuleCheckPackageEnvCoreTerms. Term imports from CompilePath through
  HostCheck live in HostModuleCheckPackageEnvLaterTerms.
  Fixture texts live in
  HostModuleCheckPackageEnvFixtures (+ FixturesU2 for PE28..PE38). Evidence
  folds live in HostModuleCheckPackageEnvEvidence. Inventory PACKAGE-ELABORATE
  bands live in HostModuleCheckPackageElab. Same namespace SystemsLean.HostModuleCheck.

  Package L4 Mult..ParityEmit + U2 Emit*Scaffold + KernelSelfApply +
  ProductOutKernel env band (supersedes Mult..ParityEmit Env-only):
  - Depth bar PACKAGE-ELABORATE; scope
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only.
  - Multi-module fixture: prior Mult..ParityEmit + EmitMultScaffold +
    EmitLinearScaffold + EmitTypesScaffold + EmitProgramScaffold +
    EmitGraphScaffold + EmitComposeScaffold + EmitErasureScaffold +
    EmitExtractScaffold + EmitBannerScaffold + KernelSelfApply +
    ProductOutKernel sections.
  - J5 soft: prior unit term dialects + Emit*Scaffold + KernelSelfApply +
    ProductOutKernel unit term dialects at package scope.
  - J2 soft: prior import chain + Kernel Mult/Linear/Types/Program import
    CompilePath (scaffold); KernelEmit imports KernelProgram; ParityMult
    imports KernelMult (and Mult+EmitMult resolve); ParityLinear imports
    KernelLinear (and ParityMult resolve); ParityTypes imports KernelTypes
    (and ParityLinear resolve); ParityProgram imports KernelProgram (and
    ParityTypes resolve); ParityEmit imports KernelEmit (and ParityProgram
    + EmitMult resolve); every import resolves to a present
    ===module Name=== section.
  - E-bad PE1 Mult / PE4 Types / PE5 IrProgram / PE6 IrGraph / PE7 HostCompose /
    PE8 Erasure / PE9 Extract / PE10 EmitPlan / PE11 EmitApply / PE12 EmitBody /
    PE13 KernelMult / PE14 KernelLinear / PE15 KernelTypes / PE16 KernelProgram /
    PE17 KernelEmit / PE18 ParityMult stageId / PE19 ParityMult ready /
    PE20 ParityLinear stageId / PE21 ParityLinear ready /
    PE22 ParityTypes stageId / PE23 ParityTypes ready /
    PE24 ParityProgram stageId / PE25 ParityProgram ready /
    PE26 ParityEmit stageId / PE27 ParityEmit ready ILL-TYPED-TERM;
    PE28..PE38 U2 Emit*Scaffold + KernelSelfApply + ProductOutKernel stageId
    ILL-TYPED-TERM;
    PE39..PE44 S5/S6 maps + leftover SpecProof + DualResidual leftover ILL-TYPED-TERM;
    PE45..PE52 CompilePath Mult..Extract residual-free ILL-TYPED-TERM;
    PE53..PE55 CompilePath Plan / Apply / Body residual-free ILL-TYPED-TERM;
    PE56 FirstSurface residual-free ILL-TYPED-TERM;
    PE57 LinearSubsetEmit residual-free ILL-TYPED-TERM;
    PE58 TypesSubsetEmit residual-free ILL-TYPED-TERM;
    PE59 ProgramSubsetEmit residual-free ILL-TYPED-TERM;
    PE60 GraphSubsetEmit residual-free ILL-TYPED-TERM;
    PE61 ComposeSubsetEmit residual-free ILL-TYPED-TERM;
    PE62 ErasureSubsetEmit residual-free ILL-TYPED-TERM;
    PE63 ExtractSubsetEmit residual-free ILL-TYPED-TERM;
    PE64 MultSubsetEmit residual-free ILL-TYPED-TERM;
    PE65 MultSubsetRebuild residual-free ILL-TYPED-TERM;
    PE66 LinearSubsetRebuild residual-free ILL-TYPED-TERM;
    PE67 TypesSubsetRebuild residual-free ILL-TYPED-TERM;
    PE68 ProgramSubsetRebuild residual-free ILL-TYPED-TERM;
    PE69 GraphSubsetRebuild residual-free ILL-TYPED-TERM;
    PE70 ComposeSubsetRebuild residual-free ILL-TYPED-TERM;
    PE71 ErasureSubsetRebuild residual-free ILL-TYPED-TERM;
    PE72 ExtractSubsetRebuild residual-free ILL-TYPED-TERM;
    PE73 HostFront residual-free ILL-TYPED-TERM;
    PE74 LLVM Mult text residual-free ILL-TYPED-TERM;
    PE75 Host fragment check residual-free ILL-TYPED-TERM;
    PE76 Host fragment graph residual-free ILL-TYPED-TERM;
    PE77 LLVM Linear text residual-free ILL-TYPED-TERM;
    PE78 Mult package writer tool residual-free ILL-TYPED-TERM;
    PE79 FrontMultPackage residual-free ILL-TYPED-TERM;
    PE80 SubsetPackageJoin residual-free ILL-TYPED-TERM;
    PE81 LLVM Types text residual-free ILL-TYPED-TERM;
    PE82 MultFsDeepen residual-free ILL-TYPED-TERM;
    PE83 HostPackageWrite residual-free ILL-TYPED-TERM;
    PE84 LLVM Program text residual-free ILL-TYPED-TERM;
    PE85 LLVM Graph text residual-free ILL-TYPED-TERM;
    PE2 unresolved import / PE3 packageEnvReady false PACKAGE-ENV-INCOMPLETE;
    L0 package tokens alone still accept.
  - Gate hostModuleCheckPackageElaborateEnvOk (not bare dualOk; evidence module).

  Dual-ok honesty: DualOk pins are named claims; gate truth is *Ok folds.

  Intentional non-claims:
  - Not package L4 complete. Not seed-wide J1-J12 on full seed library.
  - Not FullHostElaborateRemains re-true. Not mathlib.
  - Unit TERM Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Emit + U2
    Emit*Scaffold + KernelSelfApply + ProductOutKernel dual-ok unchanged.
  - Mult/Linear/Types PROOF dual-ok unchanged.
  - Not freestanding residual free. Not PROVABLY. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckPackageEnv,
  PACKAGE-ELABORATE,
  MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
  PACKAGE-ENV-INCOMPLETE, checkPackageEnvDialect, packageElaborateEnvBand,
  hostModuleCheckPackageElaborateEnvDualOk,
  hostModuleCheckPackageEnvDialectOk,
  hostModuleCheckGoodPackageEnvText,
  hostModuleCheckGoodPackageEnvS5Text,
  hostModuleCheckGoodPackageEnvU2Text,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckPackageEnv
  Red/green: lake build SystemsLean.HostModuleCheckPackageEnv;
  lake build SystemsLean.HostModuleCheckPackageEnvEvidence;
  just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckPackageEnvImports
import SystemsLean.HostModuleCheckPackageEnvDialectTail
import SystemsLean.HostModuleCheckPackageEnvFixtures
import SystemsLean.HostModuleCheckPackageEnvFixturesU2
import SystemsLean.HostModuleCheckPackageEnvFixturesS5
import SystemsLean.HostModuleCheckPackageEnvFixturesLater
import SystemsLean.HostModuleCheckPackageEnvFixturesS30
import SystemsLean.HostModuleCheckPackageEnvFixturesTail
import SystemsLean.HostModuleCheckPackageEnvCoreTerms
import SystemsLean.HostModuleCheckPackageEnvLaterTerms

namespace SystemsLean.HostModuleCheck

/-! ### Package elaborate L4 Mult..ParityEmit + U2 env band (H2 seed) -/

/-- Honesty scope: Mult..EmitBody + Kernel Mult..Emit + Parity Mult..Emit +
    Emit*Scaffold + KernelSelfApply + ProductOutKernel multi-module package
    environment only (not full seed). Supersedes Mult..ParityEmit Env-only.
    Greppable: checkDepthPackageElaborateEnvScope,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
    PACKAGE-ELABORATE. -/
def checkDepthPackageElaborateEnvScope : String :=
  "MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only"

/-- Dual-ok when package env E-good/E-bad rejects work (H2 partial L4).
    Greppable: hostModuleCheckPackageElaborateEnvDualOk, PACKAGE-ELABORATE,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only,
    packageElaborateEnvBand. -/
def hostModuleCheckPackageElaborateEnvDualOk : Bool := true

/-
  Section require helpers live in HostModuleCheckPackageEnvImports
  (long-file split). Later S-level dialect tails S30..S46 live in
  HostModuleCheckPackageEnvDialectTail. Greppable: packageEnvRequireSection,
  checkPackageEnvDialectS30.
-/

/-- S29 tail after S28: Host fragment check unit TERM (PE75), then S30.
    Soft J2 Mult-only (packageBodyImportsMult). Soft J5 checkHostCheckTermDialect.
    Mult-first host fragment checker, same class as HostFront. Not emit, not
    rebuild / self-apply, not LLVM Mult text. No CompilePathHostCheck. No
    emit-module farm. Living ready is hostFragmentCheckReady, not hostCheckReady.
    Greppable: checkPackageEnvDialectS29. -/
def checkPackageEnvDialectS29 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.HostCheck"
      packageBodyImportsMult checkHostCheckTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS30 content

/-- S28 tail after S27: LLVM Mult text unit TERM (PE74), then S29.
    Soft J2 Mult-only (packageBodyImportsMult). Soft J5 checkLlvmMultTextTermDialect.
    LLVM IR Mult text writer, not HostFront, not emit, not rebuild / self-apply.
    No CompilePathLlvmMultText. No emit-module farm. No new LLVM Mult import helper.
    Greppable: checkPackageEnvDialectS28. -/
def checkPackageEnvDialectS28 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.LlvmMultText"
      packageBodyImportsMult checkLlvmMultTextTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS29 content

/-- S27 tail after S26: HostFront unit TERM (PE73), then S28.
    Soft J2 Mult-only (packageBodyImportsMult). Soft J5 checkHostFrontTermDialect.
    Mult-first host fragment front-end, not emit, not rebuild / self-apply.
    No CompilePathHostFront. No emit-module farm.
    Greppable: checkPackageEnvDialectS27. -/
def checkPackageEnvDialectS27 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.HostFront"
      packageBodyImportsMult checkHostFrontTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS28 content

/-- S26 tail after S25: ExtractSubsetRebuild unit TERM (PE72), then S27.
    Soft J2 CompilePathExtract-only. Soft J5 checkExtractSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS26. -/
def checkPackageEnvDialectS26 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ExtractSubsetRebuild"
      packageBodyImportsCompilePathExtract checkExtractSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS27 content

/-- S25 tail after S24: ErasureSubsetRebuild unit TERM (PE71), then S26.
    Soft J2 CompilePathErasure-only. Soft J5 checkErasureSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS25. -/
def checkPackageEnvDialectS25 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ErasureSubsetRebuild"
      packageBodyImportsCompilePathErasure checkErasureSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS26 content

/-- S24 tail after S23: ComposeSubsetRebuild unit TERM (PE70), then S25.
    Soft J2 CompilePathCompose-only. Soft J5 checkComposeSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS24. -/
def checkPackageEnvDialectS24 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ComposeSubsetRebuild"
      packageBodyImportsCompilePathCompose checkComposeSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS25 content

/-- S23 tail after S22: GraphSubsetRebuild unit TERM (PE69), then S24.
    Soft J2 CompilePathGraph-only. Soft J5 checkGraphSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS23. -/
def checkPackageEnvDialectS23 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.GraphSubsetRebuild"
      packageBodyImportsCompilePathGraph checkGraphSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS24 content

/-- S22 tail after S21: ProgramSubsetRebuild unit TERM (PE68), then S23.
    Soft J2 CompilePathProgram-only. Soft J5 checkProgramSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS22. -/
def checkPackageEnvDialectS22 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ProgramSubsetRebuild"
      packageBodyImportsCompilePathProgram checkProgramSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS23 content

/-- S21 tail after S20: TypesSubsetRebuild unit TERM (PE67), then S22.
    Soft J2 CompilePathTypes-only. Soft J5 checkTypesSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS21. -/
def checkPackageEnvDialectS21 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.TypesSubsetRebuild"
      packageBodyImportsCompilePathTypes checkTypesSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS22 content

/-- S20 tail after S19: LinearSubsetRebuild unit TERM (PE66), then S21.
    Soft J2 CompilePathLinear-only. Soft J5 checkLinearSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS20. -/
def checkPackageEnvDialectS20 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.LinearSubsetRebuild"
      packageBodyImportsCompilePathLinear checkLinearSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS21 content

/-- S19 tail after S18: MultSubsetRebuild unit TERM (PE65), then S20.
    Soft J2 CompilePathMult-only. Soft J5 checkMultSubsetRebuildTermDialect.
    Rebuild / self-apply, not emit. No emit-module farm.
    Greppable: checkPackageEnvDialectS19. -/
def checkPackageEnvDialectS19 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.MultSubsetRebuild"
      packageBodyImportsCompilePathMult checkMultSubsetRebuildTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS20 content

/-- S18 tail after S17: MultSubsetEmit unit TERM (PE64), then S19.
    Soft J2 CompilePathMult-only. Soft J5 checkMultSubsetEmitTermDialect.
    Greppable: checkPackageEnvDialectS18. -/
def checkPackageEnvDialectS18 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.MultSubsetEmit"
      packageBodyImportsCompilePathMult checkMultSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS19 content

/-- S17 tail after S16: ExtractSubsetEmit unit TERM (PE63), then S18.
    Soft J2 CompilePathExtract-only. Soft J5 checkExtractSubsetEmitTermDialect.
    Greppable: checkPackageEnvDialectS17. -/
def checkPackageEnvDialectS17 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ExtractSubsetEmit"
      packageBodyImportsCompilePathExtract checkExtractSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS18 content

/-- S16 tail after S15: ErasureSubsetEmit unit TERM (PE62), then S17.
    Soft J2 CompilePathErasure-only. Soft J5 checkErasureSubsetEmitTermDialect.
    Greppable: checkPackageEnvDialectS16. -/
def checkPackageEnvDialectS16 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ErasureSubsetEmit"
      packageBodyImportsCompilePathErasure checkErasureSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS17 content

/-- S15 tail after S14: ComposeSubsetEmit unit TERM (PE61), then S16.
    Soft J2 CompilePathCompose-only. Soft J5 checkComposeSubsetEmitTermDialect.
    Greppable: checkPackageEnvDialectS15. -/
def checkPackageEnvDialectS15 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ComposeSubsetEmit"
      packageBodyImportsCompilePathCompose checkComposeSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS16 content

/-- S14 tail after S13: GraphSubsetEmit unit TERM (PE60), then S15.
    Soft J2 CompilePathGraph-only. Soft J5 checkGraphSubsetEmitTermDialect.
    Greppable: checkPackageEnvDialectS14. -/
def checkPackageEnvDialectS14 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.GraphSubsetEmit"
      packageBodyImportsCompilePathGraph checkGraphSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS15 content

/-- S13 tail after S12: ProgramSubsetEmit unit TERM (PE59), then S14.
    Greppable: checkPackageEnvDialectS13. -/
def checkPackageEnvDialectS13 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.ProgramSubsetEmit"
      packageBodyImportsCompilePathProgram checkProgramSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS14 content

/-- S12 tail after S11: TypesSubsetEmit unit TERM (PE58), then S13.
    Greppable: checkPackageEnvDialectS12. -/
def checkPackageEnvDialectS12 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.TypesSubsetEmit"
      packageBodyImportsCompilePathTypes checkTypesSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS13 content

/-- S11 tail after S10: LinearSubsetEmit unit TERM (PE57), then S12.
    Greppable: checkPackageEnvDialectS11. -/
def checkPackageEnvDialectS11 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.LinearSubsetEmit"
      packageBodyImportsCompilePathLinear checkLinearSubsetEmitTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS12 content

/-- S10 tail after S9: FirstSurface unit TERM (PE56), then S11.
    Greppable: checkPackageEnvDialectS10. -/
def checkPackageEnvDialectS10 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.FirstSurface"
      packageBodyImportsCompilePathMult checkFirstSurfaceTermDialect with
  | some r => some r
  | none => checkPackageEnvDialectS11 content

/-- S9 tail after S8: CompilePath Plan / Apply / Body unit TERM (PE53..PE55), then S10.
    Greppable: checkPackageEnvDialectS9. -/
def checkPackageEnvDialectS9 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.CompilePathPlan"
      packageBodyImportsCompilePath checkCompilePathPlanTermDialect with
  | some r => some r
  | none =>
    match packageEnvRequireSection content "SystemsLean.CompilePathApply"
        packageBodyImportsCompilePath checkCompilePathApplyTermDialect with
    | some r => some r
    | none =>
      match packageEnvRequireSection content "SystemsLean.CompilePathBody"
          packageBodyImportsCompilePath checkCompilePathBodyTermDialect with
      | some r => some r
      | none => checkPackageEnvDialectS10 content

/-- S8 tail after S6: CompilePath Mult..Extract unit TERM (PE45..PE52), then S9.
    Greppable: checkPackageEnvDialectS8. -/
def checkPackageEnvDialectS8 (content : String) : Option String :=
  match packageEnvRequireSection content "SystemsLean.CompilePathMult"
      packageBodyImportsCompilePath checkCompilePathMultTermDialect with
  | some r => some r
  | none =>
    match packageEnvRequireSection content "SystemsLean.CompilePathLinear"
        packageBodyImportsCompilePath checkCompilePathLinearTermDialect with
    | some r => some r
    | none =>
      match packageEnvRequireSection content "SystemsLean.CompilePathTypes"
          packageBodyImportsCompilePath checkCompilePathTypesTermDialect with
      | some r => some r
      | none =>
        match packageEnvRequireSection content "SystemsLean.CompilePathProgram"
            packageBodyImportsCompilePath checkCompilePathProgramTermDialect with
        | some r => some r
        | none =>
          match packageEnvRequireSection content "SystemsLean.CompilePathGraph"
              packageBodyImportsCompilePath checkCompilePathGraphTermDialect with
          | some r => some r
          | none =>
            match packageEnvRequireSection content "SystemsLean.CompilePathCompose"
                packageBodyImportsCompilePath checkCompilePathComposeTermDialect with
            | some r => some r
            | none =>
              match packageEnvRequireSection content
                  "SystemsLean.CompilePathErasure"
                  packageBodyImportsCompilePath
                  checkCompilePathErasureTermDialect with
              | some r => some r
              | none =>
                match packageEnvRequireSection content
                    "SystemsLean.CompilePathExtract"
                    packageBodyImportsCompilePathMult
                    checkCompilePathExtractTermDialect with
                | some r => some r
                | none => checkPackageEnvDialectS9 content

/-- S6 tail after S5: leftover SpecProof + DualResidual TERM (PE43 / PE44),
    then S8. SpecProof Soft J2 is packageBodyImportsProbeWire (first import
    SystemsLean.ProbeWire). Soft J5 stays checkSpecProofTermDialect. DualResidual
    Soft J2 stays packageBodyImportsProductPath. Do not reuse
    packageBodyImportsSpecProof or packageBodyImportsSurfaceMatrix. Do not add
    S47. ProbeWire leftover stays S45.
    Greppable: checkPackageEnvDialectS6. -/
def checkPackageEnvDialectS6 (content : String) : Option String :=
  match extractPackageModuleBody content "SystemsLean.SpecProof" with
  | none => some reasonPackageEnvIncomplete
  | some spBody =>
    match packageEnvSectionOk content spBody packageBodyImportsProbeWire
        checkSpecProofTermDialect with
    | some r => some r
    | none =>
      match extractPackageModuleBody content "SystemsLean.DualResidual" with
      | none => some reasonPackageEnvIncomplete
      | some drBody =>
        match packageEnvSectionOk content drBody packageBodyImportsProductPath
            checkDualResidualTermDialect with
        | some r => some r
        | none => checkPackageEnvDialectS8 content

/-- S5 tail after U2: CompilePath TERM + JoinMap + SelfHost + SurfaceMatrix,
    then S6 SpecProof + DualResidual.
    Greppable: checkPackageEnvDialectS5. -/
def checkPackageEnvDialectS5 (content : String) : Option String :=
  match extractPackageModuleBody content "SystemsLean.CompilePath" with
  | none => some reasonPackageEnvIncomplete
  | some cpBody =>
    match packageEnvSectionOk content cpBody packageBodyImportsMult
        checkCompilePathTermDialect with
    | some r => some r
    | none =>
      match extractPackageModuleBody content "SystemsLean.JoinMap" with
      | none => some reasonPackageEnvIncomplete
      | some jmBody =>
        match packageEnvSectionOk content jmBody packageBodyImportsCompilePath
            checkJoinMapTermDialect with
        | some r => some r
        | none =>
          match extractPackageModuleBody content "SystemsLean.SelfHost" with
          | none => some reasonPackageEnvIncomplete
          | some shBody =>
            match packageEnvSectionOk content shBody packageBodyImportsJoinMap
                checkSelfHostTermDialect with
            | some r => some r
            | none =>
              match extractPackageModuleBody content "SystemsLean.SurfaceMatrix" with
              | none => some reasonPackageEnvIncomplete
              | some smBody =>
                match packageEnvSectionOk content smBody packageBodyImportsSelfHost
                    checkSurfaceMatrixTermDialect with
                | some r => some r
                | none => checkPackageEnvDialectS6 content

/-- U2 tail after Mult..ParityEmit: Emit*Scaffold + KernelSelfApply + ProductOutKernel,
    then S5 CompilePathJoinMapSelfHostSurfaceMatrix.
    Greppable: checkPackageEnvDialectU2. -/
def checkPackageEnvDialectU2 (content : String) : Option String :=
  match extractPackageModuleBody content "SystemsLean.EmitMultScaffold" with
  | none => some reasonPackageEnvIncomplete
  | some emsBody =>
    match packageEnvSectionOk content emsBody packageBodyImportsMult
        checkEmitMultScaffoldTermDialect with
    | some r => some r
    | none =>
      match extractPackageModuleBody content "SystemsLean.EmitLinearScaffold" with
      | none => some reasonPackageEnvIncomplete
      | some elsBody =>
        match packageEnvSectionOk content elsBody packageBodyImportsOptional
            checkEmitLinearScaffoldTermDialect with
        | some r => some r
        | none =>
          match extractPackageModuleBody content "SystemsLean.EmitTypesScaffold" with
          | none => some reasonPackageEnvIncomplete
          | some etsBody =>
            match packageEnvSectionOk content etsBody packageBodyImportsOptional
                checkEmitTypesScaffoldTermDialect with
            | some r => some r
            | none =>
              match extractPackageModuleBody content
                  "SystemsLean.EmitProgramScaffold" with
              | none => some reasonPackageEnvIncomplete
              | some epsBody =>
                match packageEnvSectionOk content epsBody packageBodyImportsOptional
                    checkEmitProgramScaffoldTermDialect with
                | some r => some r
                | none =>
                  match extractPackageModuleBody content
                      "SystemsLean.EmitGraphScaffold" with
                  | none => some reasonPackageEnvIncomplete
                  | some egsBody =>
                    match packageEnvSectionOk content egsBody
                        packageBodyImportsOptional checkEmitGraphScaffoldTermDialect with
                    | some r => some r
                    | none =>
                      match extractPackageModuleBody content
                          "SystemsLean.EmitComposeScaffold" with
                      | none => some reasonPackageEnvIncomplete
                      | some ecsBody =>
                        match packageEnvSectionOk content ecsBody
                            packageBodyImportsOptional
                            checkEmitComposeScaffoldTermDialect with
                        | some r => some r
                        | none =>
                          match extractPackageModuleBody content
                              "SystemsLean.EmitErasureScaffold" with
                          | none => some reasonPackageEnvIncomplete
                          | some eesBody =>
                            match packageEnvSectionOk content eesBody
                                packageBodyImportsOptional
                                checkEmitErasureScaffoldTermDialect with
                            | some r => some r
                            | none =>
                              match extractPackageModuleBody content
                                  "SystemsLean.EmitExtractScaffold" with
                              | none => some reasonPackageEnvIncomplete
                              | some exsBody =>
                                match packageEnvSectionOk content exsBody
                                    packageBodyImportsOptional
                                    checkEmitExtractScaffoldTermDialect with
                                | some r => some r
                                | none =>
                                  match extractPackageModuleBody content
                                      "SystemsLean.EmitBannerScaffold" with
                                  | none => some reasonPackageEnvIncomplete
                                  | some ebsBody =>
                                    match packageEnvSectionOk content ebsBody
                                        packageBodyImportsOptional
                                        checkEmitBannerScaffoldTermDialect with
                                    | some r => some r
                                    | none =>
                                      match extractPackageModuleBody content
                                          "SystemsLean.KernelSelfApply" with
                                      | none => some reasonPackageEnvIncomplete
                                      | some ksaBody =>
                                        match packageEnvSectionOk content ksaBody
                                            packageBodyImportsOptional
                                            checkKernelSelfApplyTermDialect with
                                        | some r => some r
                                        | none =>
                                          match extractPackageModuleBody content
                                              "SystemsLean.ProductOutKernel" with
                                          | none => some reasonPackageEnvIncomplete
                                          | some pokBody =>
                                            match packageEnvSectionOk content pokBody
                                                packageBodyImportsOptional
                                                checkProductOutKernelTermDialect with
                                            | some r => some r
                                            | none => checkPackageEnvDialectS5 content

/-- Package Mult..ParityEmit + U2 env dialect (beyond inventory). Returns none
    when ok; some PACKAGE-ENV-INCOMPLETE or ILL-TYPED-TERM. Greppable:
    checkPackageEnvDialect, PACKAGE-ELABORATE, PACKAGE-ENV-INCOMPLETE,
    MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrixEnv-only. -/
def checkPackageEnvDialect (content : String) : Option String :=
  if !packageInventoryHas content
      "packageBand: MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyKernelMultLinearTypesProgramEmitParityMultParityLinearParityTypesParityProgramParityEmitEmitMultScaffoldEmitLinearScaffoldEmitTypesScaffoldEmitProgramScaffoldEmitGraphScaffoldEmitComposeScaffoldEmitErasureScaffoldEmitExtractScaffoldEmitBannerScaffoldKernelSelfApplyProductOutKernelCompilePathJoinMapSelfHostSurfaceMatrix-env" then
    some reasonPackageEnvIncomplete
  else if !packageInventoryHas content "packageElaborateBar: PACKAGE-ELABORATE" then
    some reasonPackageEnvIncomplete
  else if !packageInventoryHas content "packageEnvReady: true" then
    some reasonPackageEnvIncomplete
  else if !packageInventoryHas content (packageModuleOpenMark "SystemsLean.CompilePath") then
    some reasonPackageEnvIncomplete
  else if !packageInventoryHas content (packageModuleOpenMark "SystemsLean.EmitMult") then
    some reasonPackageEnvIncomplete
  else
    match extractPackageModuleBody content "SystemsLean.Mult" with
    | none => some reasonPackageEnvIncomplete
    | some multBody =>
      match checkMultTermDialect multBody with
      | some _ => some reasonIllTypedTerm
      | none =>
        match extractPackageModuleBody content "SystemsLean.Linear" with
        | none => some reasonPackageEnvIncomplete
        | some linearBody =>
          match packageEnvSectionOk content linearBody packageBodyImportsMult
              checkLinearTermDialect with
          | some r => some r
          | none =>
            match extractPackageModuleBody content "SystemsLean.Types" with
            | none => some reasonPackageEnvIncomplete
            | some typesBody =>
              match packageEnvSectionOk content typesBody packageBodyImportsMult
                  checkTypesTermDialect with
              | some r => some r
              | none =>
                match extractPackageModuleBody content "SystemsLean.IrProgram" with
                | none => some reasonPackageEnvIncomplete
                | some programBody =>
                  match packageEnvSectionOk content programBody packageBodyImportsTypes
                      checkIrProgramTermDialect with
                  | some r => some r
                  | none =>
                    match extractPackageModuleBody content "SystemsLean.IrGraph" with
                    | none => some reasonPackageEnvIncomplete
                    | some graphBody =>
                      match packageEnvSectionOk content graphBody
                          packageBodyImportsProgram checkIrGraphTermDialect with
                      | some r => some r
                      | none =>
                        match extractPackageModuleBody content "SystemsLean.HostCompose" with
                        | none => some reasonPackageEnvIncomplete
                        | some composeBody =>
                          match packageEnvSectionOk content composeBody
                              packageBodyImportsGraph checkHostComposeTermDialect with
                          | some r => some r
                          | none =>
                            match extractPackageModuleBody content "SystemsLean.Erasure" with
                            | none => some reasonPackageEnvIncomplete
                            | some erasureBody =>
                              match packageEnvSectionOk content erasureBody
                                  packageBodyImportsMult checkErasureTermDialect with
                              | some r => some r
                              | none =>
                                match extractPackageModuleBody content "SystemsLean.Extract" with
                                | none => some reasonPackageEnvIncomplete
                                | some extractBody =>
                                  match packageEnvSectionOk content extractBody
                                      packageBodyImportsErasure checkExtractTermDialect with
                                  | some r => some r
                                  | none =>
                                    match extractPackageModuleBody content "SystemsLean.EmitPlan" with
                                    | none => some reasonPackageEnvIncomplete
                                    | some emitPlanBody =>
                                      match packageEnvSectionOk content emitPlanBody
                                          packageBodyImportsHostCompose
                                          checkEmitPlanTermDialect with
                                      | some r => some r
                                      | none =>
                                        match extractPackageModuleBody content
                                            "SystemsLean.EmitApply" with
                                        | none => some reasonPackageEnvIncomplete
                                        | some emitApplyBody =>
                                          match packageEnvSectionOk content emitApplyBody
                                              packageBodyImportsHostCompose
                                              checkEmitApplyTermDialect with
                                          | some r => some r
                                          | none =>
                                            match extractPackageModuleBody content
                                                "SystemsLean.EmitBody" with
                                            | none => some reasonPackageEnvIncomplete
                                            | some emitBodyBody =>
                                              match packageEnvSectionOk content emitBodyBody
                                                  packageBodyImportsHostCompose
                                                  checkEmitBodyTermDialect with
                                              | some r => some r
                                              | none =>
                                                match extractPackageModuleBody content
                                                    "SystemsLean.KernelMult" with
                                                | none => some reasonPackageEnvIncomplete
                                                | some kmBody =>
                                                  match packageEnvSectionOk content kmBody
                                                      packageBodyImportsCompilePath
                                                      checkKernelMultTermDialect with
                                                  | some r => some r
                                                  | none =>
                                                    match extractPackageModuleBody content
                                                        "SystemsLean.KernelLinear" with
                                                    | none => some reasonPackageEnvIncomplete
                                                    | some klBody =>
                                                      match packageEnvSectionOk content klBody
                                                          packageBodyImportsCompilePath
                                                          checkKernelLinearTermDialect with
                                                      | some r => some r
                                                      | none =>
                                                        match extractPackageModuleBody content
                                                            "SystemsLean.KernelTypes" with
                                                        | none => some reasonPackageEnvIncomplete
                                                        | some ktBody =>
                                                          match packageEnvSectionOk content ktBody
                                                              packageBodyImportsCompilePath
                                                              checkKernelTypesTermDialect with
                                                          | some r => some r
                                                          | none =>
                                                            match extractPackageModuleBody content
                                                                "SystemsLean.KernelProgram" with
                                                            | none => some reasonPackageEnvIncomplete
                                                            | some kpBody =>
                                                              match packageEnvSectionOk content
                                                                  kpBody
                                                                  packageBodyImportsCompilePath
                                                                  checkKernelProgramTermDialect with
                                                              | some r => some r
                                                              | none =>
                                                                match extractPackageModuleBody content
                                                                    "SystemsLean.KernelEmit" with
                                                                | none =>
                                                                  some reasonPackageEnvIncomplete
                                                                | some keBody =>
                                                                  match packageEnvSectionOk content
                                                                      keBody
                                                                      packageBodyImportsKernelProgram
                                                                      checkKernelEmitTermDialect with
                                                                  | some r => some r
                                                                  | none =>
                                                                    match extractPackageModuleBody
                                                                        content
                                                                        "SystemsLean.ParityMult" with
                                                                    | none =>
                                                                      some reasonPackageEnvIncomplete
                                                                    | some pmBody =>
                                                                      match packageEnvSectionOk
                                                                          content pmBody
                                                                          packageBodyImportsKernelMult
                                                                          checkParityMultTermDialect with
                                                                      | some r => some r
                                                                      | none =>
                                                                        match
                                                                            extractPackageModuleBody
                                                                              content
                                                                              "SystemsLean.ParityLinear" with
                                                                        | none =>
                                                                          some
                                                                            reasonPackageEnvIncomplete
                                                                        | some plBody =>
                                                                          match
                                                                              packageEnvSectionOk
                                                                                content plBody
                                                                                packageBodyImportsKernelLinear
                                                                                checkParityLinearTermDialect with
                                                                          | some r => some r
                                                                          | none =>
                                                                            match
                                                                                extractPackageModuleBody
                                                                                  content
                                                                                  "SystemsLean.ParityTypes" with
                                                                            | none =>
                                                                              some
                                                                                reasonPackageEnvIncomplete
                                                                            | some ptBody =>
                                                                              match
                                                                                  packageEnvSectionOk
                                                                                    content ptBody
                                                                                    packageBodyImportsKernelTypes
                                                                                    checkParityTypesTermDialect with
                                                                              | some r => some r
                                                                              | none =>
                                                                                match
                                                                                    extractPackageModuleBody
                                                                                      content
                                                                                      "SystemsLean.ParityProgram" with
                                                                                | none =>
                                                                                  some
                                                                                    reasonPackageEnvIncomplete
                                                                                | some ppBody =>
                                                                                  match
                                                                                      packageEnvSectionOk
                                                                                        content
                                                                                        ppBody
                                                                                        packageBodyImportsKernelProgram
                                                                                        checkParityProgramTermDialect with
                                                                                  | some r => some r
                                                                                  | none =>
                                                                                    match
                                                                                        extractPackageModuleBody
                                                                                          content
                                                                                          "SystemsLean.ParityEmit" with
                                                                                    | none =>
                                                                                      some
                                                                                        reasonPackageEnvIncomplete
                                                                                    | some peBody =>
                                                                                      match
                                                                                          packageEnvSectionOk
                                                                                            content
                                                                                            peBody
                                                                                            packageBodyImportsKernelEmit
                                                                                            checkParityEmitTermDialect with
                                                                                      | some r =>
                                                                                        some r
                                                                                      | none =>
                                                                                        checkPackageEnvDialectU2
                                                                                          content

/-- L0 package token floor for env fixtures (packageBand + PACKAGE-ELABORATE only).
    Ill-typed Mult..ParityEmit / U2 / unresolved import still pass.
    Greppable: checkPackageEnvL0, PACKAGE-ELABORATE. -/
def checkPackageEnvL0 (content : String) : Bool :=
  packageInventoryHas content "packageBand:"
    && packageInventoryHas content "PACKAGE-ELABORATE"

/-! ### Dual-pin surface + dialect good (evidence folds in PackageEnvEvidence) -/

/-
  TERM SurfaceOk fold lives in HostModuleCheckPackageEnvEvidenceLater
  (long-file split). Greppable: packageEnvTermSurfaceOk.
-/

/-
  S30..S35 fixture texts live in HostModuleCheckPackageEnvFixturesS30; S36..S46 live in HostModuleCheckPackageEnvFixturesTail
  (Sub-1-KLOC). Dialect tails S30..S46 live in HostModuleCheckPackageEnvDialectTail.
  Greppable: hostModuleCheckGoodPackageEnvS5Text.
-/

/-- Dialect-only good path for Mult..ParityEmit + U2 + S5 + S6 + S8 + S9 + S10
    + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 + S21 + S22 + S23
    + S24 + S25 + S26 + S27 + S28 + S29 + S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 + S41 + S42 + S43 + S44 + S45 + S46 package env. S5
    E-good cite hostModuleCheckGoodPackageEnvS5Text (FixturesS5). Greppable:
    hostModuleCheckPackageEnvDialectOk, PACKAGE-ELABORATE,
    hostModuleCheckGoodPackageEnvS46Text. -/
def hostModuleCheckPackageEnvDialectOk : Bool :=
  (checkPackageEnvDialect hostModuleCheckGoodPackageEnvS46Text).isNone


end SystemsLean.HostModuleCheck
