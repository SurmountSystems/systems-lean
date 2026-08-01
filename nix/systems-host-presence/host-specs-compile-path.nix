# SPDX-License-Identifier: Unlicense
# CompilePath host token specs (HOST-COMPILE-PATH readiness wall).
# Cold slice (not dual-pin tip). Imported by ./specs.nix thin join. No bash.
{
hostSpecsCompilePath = [
    {
      # HOST-COMPILE-PATH (P3): host-informed compile-path readiness (V1).
      rel = "src/systems/SystemsLean/CompilePath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_COMPILE_PATH_V1"
        "HOST-COMPILE-PATH"
        "COMPILE-PATH"
        "compileReady"
        "unitCompileReady"
        "programCompileReady"
        "gradeSurfaceOk"
        "SystemsLean.CompilePath"
        "COMPILE-PATH-SMOKE"
        "example"
        "RUNTIME-FS"
        "EMIT-BOUNDARY"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "FAIL-CLOSED"
        "HOST-COMPOSE"
        "COMPILE-PATH-THEOREM"
        "HOST-COMPILE-PATH-THEOREM"
        "compileReady_empty_true"
        "unitCompileReady_empty_true"
        "programCompileReady_empty_false"
        "programCompileReady_eq_isWellTyped"
        "gradeSurfaceOk_true"
        "empty_host_ok_ne_empty_program_ok"
        "stageId_eq"
        "hostCompilePathId_eq"
        "extractFsOk_eq"
        "compileReady_eq_extractFsOk"
        "unitCompileReady_eq"
        "extractClaimOk_classic_empty_false"
        "extractClaimOk_edge_empty_false"
        "extractClaimOk_fs_empty_true"
        "verdictOf_empty_ok"
        "programCompileReady_single_value"
        "compileReady_mult1_unminted_false"
        "unitCompileReady_mult1_minted_true"
        # Mult/Linear/Types/Program/Extract + Graph/Compose/Erasure/Plan/Apply/Body: peels (entries below).
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem compileReady_empty_true"
        "theorem programCompileReady_empty_false"
        "theorem empty_host_ok_ne_empty_program_ok"
        "theorem stageId_eq"
        "theorem hostCompilePathId_eq"
        "theorem extractFsOk_eq"
        "theorem compileReady_eq_extractFsOk"
        "theorem unitCompileReady_eq"
        "theorem extractClaimOk_classic_empty_false"
        "theorem extractClaimOk_edge_empty_false"
        "theorem extractClaimOk_fs_empty_true"
        "theorem verdictOf_empty_ok"
        "theorem programCompileReady_single_value"
        "theorem compileReady_mult1_unminted_false"
        "theorem unitCompileReady_mult1_minted_true"
        # fixture theorems: peel homes
      ];
      anyGroups = [
        [
          "verdictOf"
          "checkHost"
        ]
      ];
    }
    {
      # COMPILE-PATH-MULT: Mult unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathMult"
        "COMPILE-PATH-MULT"
        "MULT-FIXTURE"
        "HOST-EMIT-MULT"
        "multFixtureCompilePathReady"
        "multFixtureProgramReady"
        "multFixtureComposeReady"
        "multFixtureEmitPathOk"
        "lowerMultFixtureProgram"
        "lowerMultFixtureCompose"
        "COMPILE-PATH-MULT-SMOKE"
        "COMPILE-PATH-MULT-THEOREM"
        "multFixtureCompilePathReady_true"
        "multFixtureDoesNotMeanResidualFree_true"
        "multFixture_claims_false"
        "theorem multFixtureCompilePathReady_true"
        "theorem multFixtureDoesNotMeanResidualFree_true"
        "theorem multFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitMult"
      ];
    }
    {
      # FIRST-SURFACE: bootstrap S1 Mult unit first compiler surface.
      rel = "src/systems/SystemsLean/FirstSurface.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.FirstSurface"
        "FIRST-SURFACE"
        "SLAKE_FIRST_SURFACE"
        "SLAKE_FIRST_SURFACE_MULT"
        "HOST-FIRST-SURFACE"
        "firstSurfaceReady"
        "firstSurfaceUnitReady"
        "firstSurfaceEmitMultOk"
        "firstSurfaceMultInputReady"
        "multFixtureCompilePathReady"
        "stillUsesLake"
        "dependsOnLake"
        "FIRST-SURFACE-SMOKE"
        "FIRST-SURFACE-THEOREM"
        "firstSurfaceReady_true"
        "firstSurfaceDoesNotRetireLake_true"
        "firstSurfaceDoesNotMeanResidualFree_true"
        "firstSurface_claims_false"
        "theorem firstSurfaceReady_true"
        "slake-first-surface"
        "just first-surface"
        "import SystemsLean.CompilePathMult"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "MULT-0"
      ];
    }
    {
      # Thin Lake main for slake-first-surface (SKELETON).
      rel = "src/systems/SystemsLean/FirstSurfaceMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.FirstSurfaceMain"
        "slake-first-surface"
        "FirstSurfaceMain"
        "SKELETON"
        "import SystemsLean.FirstSurface"
      ];
    }
    {
      # MULT-SUBSET-EMIT: bootstrap S2 Mult subset freestanding emit.
      rel = "src/systems/SystemsLean/MultSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultSubsetEmit"
        "MULT-SUBSET-EMIT"
        "SLAKE_MULT_SUBSET_EMIT"
        "SLAKE_MULT_SUBSET_EMIT_V0"
        "HOST-MULT-SUBSET-EMIT"
        "multSubsetEmitReady"
        "multSubsetEmitInputId"
        "multSubsetEmitWroteExpected"
        "multSubsetEmitInputReady"
        "multSubsetEmitMultDialectOk"
        "multSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "MULT-SUBSET-EMIT-SMOKE"
        "MULT-SUBSET-EMIT-THEOREM"
        "multSubsetEmitReady_true"
        "multSubsetEmitWroteExpected_true"
        "multSubsetEmitDoesNotRetireLake_true"
        "multSubsetEmitDoesNotMeanResidualFree_true"
        "multSubsetEmit_claims_false"
        "theorem multSubsetEmitReady_true"
        "slake-mult-subset-emit"
        "just mult-subset-emit"
        "slake_mult_subset.h"
        "slake_mult_subset.c"
        "SLAKE_FIRST_SURFACE_MULT"
        "HOST-EMIT-MULT"
        "import SystemsLean.FirstSurface"
        "import SystemsLean.EmitMult"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "MULT-0"
      ];
    }
    {
      # Thin Lake main for slake-mult-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/MultSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultSubsetEmitMain"
        "slake-mult-subset-emit"
        "MultSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.MultSubsetEmit"
      ];
    }
    {
      # MULT-SUBSET-REBUILD: bootstrap S3 Mult subset self-application measure.
      rel = "src/systems/SystemsLean/MultSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultSubsetRebuild"
        "MULT-SUBSET-REBUILD"
        "SLAKE_MULT_SUBSET_REBUILD"
        "SLAKE_MULT_SUBSET_REBUILD_V0"
        "HOST-MULT-SUBSET-REBUILD"
        "multSubsetRebuildReady"
        "multSubsetRebuildInputReady"
        "multSubsetRebuildSelfApplyOk"
        "multSubsetRebuildWroteExpected"
        "multSubsetRebuildPackagePinOk"
        "multSubsetRebuildWithoutLakeFinishedClaimed"
        "justRecipeWithoutLake"
        "prebuiltMultRebuildRel"
        "multSubsetRebuildWithoutLakeKeepsHostLake"
        "MULT-WITHOUT-LAKE"
        "stillUsesLake"
        "dependsOnLake"
        "MULT-SUBSET-REBUILD-SMOKE"
        "MULT-SUBSET-REBUILD-THEOREM"
        "multSubsetRebuildReady_true"
        "multSubsetRebuildSelfApplyOk_true"
        "multSubsetRebuildWroteExpected_true"
        "multSubsetRebuildDoesNotRetireLake_true"
        "multSubsetRebuildDoesNotMeanResidualFree_true"
        "multSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "multSubsetRebuildWithoutLakeKeepsHostLake_true"
        "multSubsetRebuild_claims_false"
        "theorem multSubsetRebuildReady_true"
        "slake-mult-subset-rebuild"
        "just mult-subset-rebuild"
        "just mult-subset-rebuild-without-lake"
        "slake_mult_subset.h"
        "slake_mult_subset.c"
        "SLAKE_MULT_SUBSET_EMIT_V0"
        "multSubsetEmitReady"
        "multSubsetEmitWroteExpected"
        "import SystemsLean.MultSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "MULT-0"
      ];
    }
    {
      # Thin Lake main for slake-mult-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/MultSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultSubsetRebuildMain"
        "slake-mult-subset-rebuild"
        "MultSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.MultSubsetRebuild"
      ];
    }
    {
      # MULT-FS-DEEPEN: M2 Name B Mult freestanding deepen + package write full.
      rel = "src/systems/SystemsLean/MultFsDeepen.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultFsDeepen"
        "MULT-FS-DEEPEN"
        "MULT-FS-WRITE"
        "MULT-FS-WRITE-TOOL"
        "SLAKE_MULT_FS_DEEPEN"
        "SLAKE_MULT_FS_DEEPEN_V0"
        "HOST-MULT-FS-DEEPEN"
        "multFsDeepenReady"
        "freestandingDeepenPartial"
        "freestandingDriverComplete"
        "multFsDeepenDriverReady"
        "multFsDeepenCompleteImpliesPartial"
        "multFsDeepenDialectShared"
        "multFsDeepenPackageSurfaceOk"
        "multFsDeepenWithoutLakeFinishedOk"
        "multFsDeepenNotPrebuiltOnly"
        "multFsDeepenKeepsHostLake"
        "multFsWrite"
        "multFsWritePathReady"
        "multFsWriteNotRebuildDriver"
        "multFsWritePathStructuralReady"
        "multFsWritePathDoesNotMeanDriverComplete"
        "multFsDeepenDriverCompleteMeansReady"
        "multFsDeepenDoesNotMeanDriverComplete"
        "justRecipeFsDeepen"
        "justRecipeFsWrite"
        "lakeExeFsWrite"
        "prebuiltFsWriteRel"
        "freestandingWriteToolBinRel"
        "freestandingWriteToolCRel"
        "freestandingWriteToolNotLakeBuilt"
        "multFsWriteToolReady"
        "just mult-subset-freestanding-deepen"
        "mult-subset-freestanding-deepen"
        "mult-subset-freestanding-write"
        "slake-mult-fs-write"
        "slake-mult-fs-write-cc"
        "slake_mult_fs_write_tool.c"
        "stillUsesLake"
        "dependsOnLake"
        "MULT-FS-DEEPEN-SMOKE"
        "MULT-FS-DEEPEN-THEOREM"
        "multFsDeepenReady_true"
        "multFsDeepenDriverReady_true"
        "multFsWritePathReady_true"
        "multFsWriteNotRebuildDriver_true"
        "multFsWritePathStructuralReady_true"
        "multFsWritePathDoesNotMeanDriverComplete_true"
        "multFsDeepenDriverCompleteMeansReady_true"
        "multFsDeepenCompleteImpliesPartial_true"
        "multFsDeepenDoesNotRetireLake_true"
        "multFsDeepenDoesNotMeanDriverComplete_true"
        "multFsWriteDoesNotRetireLake_true"
        "multFsDeepenDoesNotMeanResidualFree_true"
        "multFsDeepenKeepsHostLake_true"
        "multFsDeepen_claims_false"
        "theorem multFsDeepenReady_true"
        "surface dual-check"
        "HOST-EMIT-MULT"
        "emitMultReady"
        "MULT-WITHOUT-LAKE"
        "multSubsetRebuildWithoutLakeFinishedClaimed"
        "slake_mult_subset.h"
        "slake_mult_subset.c"
        "slake_freestanding.h"
        "slake_freestanding.c"
        "host_emit_mult.ssot.txt"
        "import SystemsLean.MultSubsetRebuild"
        "import SystemsLean.EmitMult"
        "import SystemsLean.MultFsWriteTool"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "MULT-0"
      ];
    }
    {
      # MULT-FS-WRITE main: Lake exe root for Mult freestanding package write helper.
      rel = "src/systems/SystemsLean/MultFsWriteMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultFsWriteMain"
        "MultFsWriteMain"
        "slake-mult-fs-write"
        "MULT-FS-WRITE"
        "MULT-FS-DEEPEN"
        "import SystemsLean.MultFsDeepen"
      ];
    }
    {
      # MULT-FS-WRITE-TOOL: Path A Lean-generated Mult package writer C.
      rel = "src/systems/SystemsLean/MultFsWriteTool.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultFsWriteTool"
        "MULT-FS-WRITE-TOOL"
        "SLAKE_MULT_FS_WRITE_TOOL"
        "SLAKE_MULT_FS_WRITE_TOOL_V0"
        "HOST-MULT-FS-WRITE-TOOL"
        "multFsWriteToolReady"
        "freestandingWriteToolBinRel"
        "freestandingWriteToolCRel"
        "freestandingWriteToolNotLakeBuilt"
        "multFsWriteToolCSource"
        "multFsWriteToolEmit"
        "slake_mult_fs_write_tool.c"
        "slake-mult-fs-write-cc"
        "slake-mult-fs-write-tool"
        "MULT-FS-WRITE"
        "MULT-FS-WRITE-TOOL-SMOKE"
        "MULT-FS-WRITE-TOOL-THEOREM"
        "stillUsesLake"
        "dependsOnLake"
        "import SystemsLean.MultSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
      ];
    }
    {
      # MULT-FS-WRITE-TOOL main: Lake exe root for Mult write tool C emit.
      rel = "src/systems/SystemsLean/MultFsWriteToolMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.MultFsWriteToolMain"
        "MultFsWriteToolMain"
        "slake-mult-fs-write-tool"
        "MULT-FS-WRITE-TOOL"
        "MULT-FS-WRITE"
        "import SystemsLean.MultFsWriteTool"
      ];
    }
    {
      # LINEAR-SUBSET-EMIT: ideal ladder M1 Linear subset freestanding emit.
      rel = "src/systems/SystemsLean/LinearSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LinearSubsetEmit"
        "LINEAR-SUBSET-EMIT"
        "SLAKE_LINEAR_SUBSET_EMIT"
        "SLAKE_LINEAR_SUBSET_EMIT_V0"
        "HOST-LINEAR-SUBSET-EMIT"
        "linearSubsetEmitReady"
        "linearSubsetEmitInputId"
        "linearSubsetEmitWroteExpected"
        "linearSubsetEmitInputReady"
        "linearSubsetEmitLinearDialectOk"
        "linearSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "LINEAR-SUBSET-EMIT-SMOKE"
        "LINEAR-SUBSET-EMIT-THEOREM"
        "linearSubsetEmitReady_true"
        "linearSubsetEmitWroteExpected_true"
        "linearSubsetEmitDoesNotRetireLake_true"
        "linearSubsetEmitDoesNotMeanResidualFree_true"
        "linearSubsetEmit_claims_false"
        "theorem linearSubsetEmitReady_true"
        "slake-linear-subset-emit"
        "just linear-subset-emit"
        "slake_linear_subset.h"
        "slake_linear_subset.c"
        "SLAKE_LINEAR_SUBSET_LINEAR"
        "HOST-EMIT-LINEAR"
        "import SystemsLean.CompilePathLinear"
        "import SystemsLean.EmitLinear"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "LINEAR-EXACT-ONCE"
      ];
    }
    {
      # Thin Lake main for slake-linear-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/LinearSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LinearSubsetEmitMain"
        "slake-linear-subset-emit"
        "LinearSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.LinearSubsetEmit"
      ];
    }
    {
      # LINEAR-SUBSET-REBUILD: M1 Linear subset self-application measure.
      rel = "src/systems/SystemsLean/LinearSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LinearSubsetRebuild"
        "LINEAR-SUBSET-REBUILD"
        "SLAKE_LINEAR_SUBSET_REBUILD"
        "SLAKE_LINEAR_SUBSET_REBUILD_V0"
        "HOST-LINEAR-SUBSET-REBUILD"
        "linearSubsetRebuildReady"
        "linearSubsetRebuildInputReady"
        "linearSubsetRebuildSelfApplyOk"
        "linearSubsetRebuildWroteExpected"
        "linearSubsetRebuildPackagePinOk"
        "linearSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "LINEAR-SUBSET-REBUILD-SMOKE"
        "LINEAR-SUBSET-REBUILD-THEOREM"
        "linearSubsetRebuildReady_true"
        "linearSubsetRebuildSelfApplyOk_true"
        "linearSubsetRebuildWroteExpected_true"
        "linearSubsetRebuildDoesNotRetireLake_true"
        "linearSubsetRebuildDoesNotMeanResidualFree_true"
        "linearSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "linearSubsetRebuild_claims_false"
        "theorem linearSubsetRebuildReady_true"
        "slake-linear-subset-rebuild"
        "just linear-subset-rebuild"
        "slake_linear_subset.h"
        "slake_linear_subset.c"
        "SLAKE_LINEAR_SUBSET_EMIT_V0"
        "linearSubsetEmitReady"
        "linearSubsetEmitWroteExpected"
        "import SystemsLean.LinearSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "LINEAR-EXACT-ONCE"
      ];
    }
    {
      # Thin Lake main for slake-linear-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/LinearSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.LinearSubsetRebuildMain"
        "slake-linear-subset-rebuild"
        "LinearSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.LinearSubsetRebuild"
      ];
    }
    {
      # TYPES-SUBSET-EMIT: ideal ladder M1 Types subset freestanding emit.
      rel = "src/systems/SystemsLean/TypesSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.TypesSubsetEmit"
        "TYPES-SUBSET-EMIT"
        "SLAKE_TYPES_SUBSET_EMIT"
        "SLAKE_TYPES_SUBSET_EMIT_V0"
        "HOST-TYPES-SUBSET-EMIT"
        "typesSubsetEmitReady"
        "typesSubsetEmitInputId"
        "typesSubsetEmitWroteExpected"
        "typesSubsetEmitInputReady"
        "typesSubsetEmitTypesDialectOk"
        "typesSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "TYPES-SUBSET-EMIT-SMOKE"
        "TYPES-SUBSET-EMIT-THEOREM"
        "typesSubsetEmitReady_true"
        "typesSubsetEmitWroteExpected_true"
        "typesSubsetEmitDoesNotRetireLake_true"
        "typesSubsetEmitDoesNotMeanResidualFree_true"
        "typesSubsetEmit_claims_false"
        "theorem typesSubsetEmitReady_true"
        "slake-types-subset-emit"
        "just types-subset-emit"
        "slake_types_subset.h"
        "slake_types_subset.c"
        "SLAKE_TYPES_SUBSET_TYPES"
        "HOST-EMIT-TYPES"
        "import SystemsLean.CompilePathTypes"
        "import SystemsLean.EmitTypes"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "TYPED_IR_V0"
      ];
    }
    {
      # Thin Lake main for slake-types-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/TypesSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.TypesSubsetEmitMain"
        "slake-types-subset-emit"
        "TypesSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.TypesSubsetEmit"
      ];
    }
    {
      # TYPES-SUBSET-REBUILD: M1 Types subset self-application measure.
      rel = "src/systems/SystemsLean/TypesSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.TypesSubsetRebuild"
        "TYPES-SUBSET-REBUILD"
        "SLAKE_TYPES_SUBSET_REBUILD"
        "SLAKE_TYPES_SUBSET_REBUILD_V0"
        "HOST-TYPES-SUBSET-REBUILD"
        "typesSubsetRebuildReady"
        "typesSubsetRebuildInputReady"
        "typesSubsetRebuildSelfApplyOk"
        "typesSubsetRebuildWroteExpected"
        "typesSubsetRebuildPackagePinOk"
        "typesSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "TYPES-SUBSET-REBUILD-SMOKE"
        "TYPES-SUBSET-REBUILD-THEOREM"
        "typesSubsetRebuildReady_true"
        "typesSubsetRebuildSelfApplyOk_true"
        "typesSubsetRebuildWroteExpected_true"
        "typesSubsetRebuildDoesNotRetireLake_true"
        "typesSubsetRebuildDoesNotMeanResidualFree_true"
        "typesSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "typesSubsetRebuild_claims_false"
        "theorem typesSubsetRebuildReady_true"
        "slake-types-subset-rebuild"
        "just types-subset-rebuild"
        "slake_types_subset.h"
        "slake_types_subset.c"
        "SLAKE_TYPES_SUBSET_EMIT_V0"
        "typesSubsetEmitReady"
        "typesSubsetEmitWroteExpected"
        "import SystemsLean.TypesSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "TYPED_IR_V0"
      ];
    }
    {
      # Thin Lake main for slake-types-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/TypesSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.TypesSubsetRebuildMain"
        "slake-types-subset-rebuild"
        "TypesSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.TypesSubsetRebuild"
      ];
    }
    {
      # PROGRAM-SUBSET-EMIT: ideal ladder M1 Program subset freestanding emit.
      rel = "src/systems/SystemsLean/ProgramSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProgramSubsetEmit"
        "PROGRAM-SUBSET-EMIT"
        "SLAKE_PROGRAM_SUBSET_EMIT"
        "SLAKE_PROGRAM_SUBSET_EMIT_V0"
        "HOST-PROGRAM-SUBSET-EMIT"
        "programSubsetEmitReady"
        "programSubsetEmitInputId"
        "programSubsetEmitWroteExpected"
        "programSubsetEmitInputReady"
        "programSubsetEmitProgramDialectOk"
        "programSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "PROGRAM-SUBSET-EMIT-SMOKE"
        "PROGRAM-SUBSET-EMIT-THEOREM"
        "programSubsetEmitReady_true"
        "programSubsetEmitWroteExpected_true"
        "programSubsetEmitDoesNotRetireLake_true"
        "programSubsetEmitDoesNotMeanResidualFree_true"
        "programSubsetEmit_claims_false"
        "theorem programSubsetEmitReady_true"
        "slake-program-subset-emit"
        "just program-subset-emit"
        "slake_program_subset.h"
        "slake_program_subset.c"
        "SLAKE_PROGRAM_SUBSET_PROGRAM"
        "HOST-EMIT-PROGRAM"
        "import SystemsLean.CompilePathProgram"
        "import SystemsLean.EmitProgram"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "IR_PROGRAM_V0"
      ];
    }
    {
      # Thin Lake main for slake-program-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/ProgramSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProgramSubsetEmitMain"
        "slake-program-subset-emit"
        "ProgramSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.ProgramSubsetEmit"
      ];
    }
    {
      # PROGRAM-SUBSET-REBUILD: M1 Program subset self-application measure.
      rel = "src/systems/SystemsLean/ProgramSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProgramSubsetRebuild"
        "PROGRAM-SUBSET-REBUILD"
        "SLAKE_PROGRAM_SUBSET_REBUILD"
        "SLAKE_PROGRAM_SUBSET_REBUILD_V0"
        "HOST-PROGRAM-SUBSET-REBUILD"
        "programSubsetRebuildReady"
        "programSubsetRebuildInputReady"
        "programSubsetRebuildSelfApplyOk"
        "programSubsetRebuildWroteExpected"
        "programSubsetRebuildPackagePinOk"
        "programSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "PROGRAM-SUBSET-REBUILD-SMOKE"
        "PROGRAM-SUBSET-REBUILD-THEOREM"
        "programSubsetRebuildReady_true"
        "programSubsetRebuildSelfApplyOk_true"
        "programSubsetRebuildWroteExpected_true"
        "programSubsetRebuildDoesNotRetireLake_true"
        "programSubsetRebuildDoesNotMeanResidualFree_true"
        "programSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "programSubsetRebuild_claims_false"
        "theorem programSubsetRebuildReady_true"
        "slake-program-subset-rebuild"
        "just program-subset-rebuild"
        "slake_program_subset.h"
        "slake_program_subset.c"
        "SLAKE_PROGRAM_SUBSET_EMIT_V0"
        "programSubsetEmitReady"
        "programSubsetEmitWroteExpected"
        "import SystemsLean.ProgramSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "IR_PROGRAM_V0"
      ];
    }
    {
      # Thin Lake main for slake-program-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/ProgramSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProgramSubsetRebuildMain"
        "slake-program-subset-rebuild"
        "ProgramSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.ProgramSubsetRebuild"
      ];
    }
    {
      # EXTRACT-SUBSET-EMIT: ideal ladder M1 Extract subset freestanding emit.
      rel = "src/systems/SystemsLean/ExtractSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ExtractSubsetEmit"
        "EXTRACT-SUBSET-EMIT"
        "SLAKE_EXTRACT_SUBSET_EMIT"
        "SLAKE_EXTRACT_SUBSET_EMIT_V0"
        "HOST-EXTRACT-SUBSET-EMIT"
        "extractSubsetEmitReady"
        "extractSubsetEmitInputId"
        "extractSubsetEmitWroteExpected"
        "extractSubsetEmitInputReady"
        "extractSubsetEmitExtractDialectOk"
        "extractSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "EXTRACT-SUBSET-EMIT-SMOKE"
        "EXTRACT-SUBSET-EMIT-THEOREM"
        "extractSubsetEmitReady_true"
        "extractSubsetEmitWroteExpected_true"
        "extractSubsetEmitDoesNotRetireLake_true"
        "extractSubsetEmitDoesNotMeanResidualFree_true"
        "extractSubsetEmit_claims_false"
        "theorem extractSubsetEmitReady_true"
        "slake-extract-subset-emit"
        "just extract-subset-emit"
        "slake_extract_subset.h"
        "slake_extract_subset.c"
        "SLAKE_EXTRACT_SUBSET_EXTRACT"
        "HOST-EMIT-EXTRACT"
        "import SystemsLean.CompilePathExtract"
        "import SystemsLean.EmitExtract"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "FAIL_CLOSED_CHECKER_V1"
        "extractRuntimeFsGateReady"
        "COMPILE-PATH-EXTRACT"
      ];
    }
    {
      # Thin Lake main for slake-extract-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/ExtractSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ExtractSubsetEmitMain"
        "slake-extract-subset-emit"
        "ExtractSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.ExtractSubsetEmit"
      ];
    }
    {
      # EXTRACT-SUBSET-REBUILD: M1 Extract subset rebuild / self-application.
      rel = "src/systems/SystemsLean/ExtractSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ExtractSubsetRebuild"
        "EXTRACT-SUBSET-REBUILD"
        "SLAKE_EXTRACT_SUBSET_REBUILD"
        "SLAKE_EXTRACT_SUBSET_REBUILD_V0"
        "HOST-EXTRACT-SUBSET-REBUILD"
        "extractSubsetRebuildReady"
        "extractSubsetRebuildInputReady"
        "extractSubsetRebuildSelfApplyOk"
        "extractSubsetRebuildWroteExpected"
        "extractSubsetRebuildPackagePinOk"
        "extractSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "EXTRACT-SUBSET-REBUILD-SMOKE"
        "EXTRACT-SUBSET-REBUILD-THEOREM"
        "extractSubsetRebuildReady_true"
        "extractSubsetRebuildSelfApplyOk_true"
        "extractSubsetRebuildWroteExpected_true"
        "extractSubsetRebuildDoesNotRetireLake_true"
        "extractSubsetRebuildDoesNotMeanResidualFree_true"
        "extractSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "extractSubsetRebuild_claims_false"
        "theorem extractSubsetRebuildReady_true"
        "slake-extract-subset-rebuild"
        "just extract-subset-rebuild"
        "slake_extract_subset.h"
        "slake_extract_subset.c"
        "SLAKE_EXTRACT_SUBSET_EMIT_V0"
        "extractSubsetEmitReady"
        "extractSubsetEmitWroteExpected"
        "import SystemsLean.ExtractSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "FAIL_CLOSED_CHECKER_V1"
      ];
    }
    {
      # Thin Lake main for slake-extract-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/ExtractSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ExtractSubsetRebuildMain"
        "slake-extract-subset-rebuild"
        "ExtractSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.ExtractSubsetRebuild"
      ];
    }
    {
      # ERASURE-SUBSET-EMIT: ideal ladder M1 Erasure subset freestanding emit.
      rel = "src/systems/SystemsLean/ErasureSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ErasureSubsetEmit"
        "ERASURE-SUBSET-EMIT"
        "SLAKE_ERASURE_SUBSET_EMIT"
        "SLAKE_ERASURE_SUBSET_EMIT_V0"
        "HOST-ERASURE-SUBSET-EMIT"
        "erasureSubsetEmitReady"
        "erasureSubsetEmitInputId"
        "erasureSubsetEmitWroteExpected"
        "erasureSubsetEmitInputReady"
        "erasureSubsetEmitErasureDialectOk"
        "erasureSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "ERASURE-SUBSET-EMIT-SMOKE"
        "ERASURE-SUBSET-EMIT-THEOREM"
        "erasureSubsetEmitReady_true"
        "erasureSubsetEmitWroteExpected_true"
        "erasureSubsetEmitDoesNotRetireLake_true"
        "erasureSubsetEmitDoesNotMeanResidualFree_true"
        "erasureSubsetEmit_claims_false"
        "theorem erasureSubsetEmitReady_true"
        "slake-erasure-subset-emit"
        "just erasure-subset-emit"
        "slake_erasure_subset.h"
        "slake_erasure_subset.c"
        "SLAKE_ERASURE_SUBSET_ERASURE"
        "HOST-EMIT-ERASURE"
        "import SystemsLean.CompilePathErasure"
        "import SystemsLean.EmitErasure"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "erasureFixtureCompilePathReady"
        "COMPILE-PATH-ERASURE"
      ];
    }
    {
      # Thin Lake main for slake-erasure-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/ErasureSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ErasureSubsetEmitMain"
        "slake-erasure-subset-emit"
        "ErasureSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.ErasureSubsetEmit"
      ];
    }
    {
      # ERASURE-SUBSET-REBUILD: M1 Erasure subset rebuild / self-application.
      rel = "src/systems/SystemsLean/ErasureSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ErasureSubsetRebuild"
        "ERASURE-SUBSET-REBUILD"
        "SLAKE_ERASURE_SUBSET_REBUILD"
        "SLAKE_ERASURE_SUBSET_REBUILD_V0"
        "HOST-ERASURE-SUBSET-REBUILD"
        "erasureSubsetRebuildReady"
        "erasureSubsetRebuildInputReady"
        "erasureSubsetRebuildSelfApplyOk"
        "erasureSubsetRebuildWroteExpected"
        "erasureSubsetRebuildPackagePinOk"
        "erasureSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "ERASURE-SUBSET-REBUILD-SMOKE"
        "ERASURE-SUBSET-REBUILD-THEOREM"
        "erasureSubsetRebuildReady_true"
        "erasureSubsetRebuildSelfApplyOk_true"
        "erasureSubsetRebuildWroteExpected_true"
        "erasureSubsetRebuildDoesNotRetireLake_true"
        "erasureSubsetRebuildDoesNotMeanResidualFree_true"
        "erasureSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "erasureSubsetRebuild_claims_false"
        "theorem erasureSubsetRebuildReady_true"
        "slake-erasure-subset-rebuild"
        "just erasure-subset-rebuild"
        "slake_erasure_subset.h"
        "slake_erasure_subset.c"
        "SLAKE_ERASURE_SUBSET_EMIT_V0"
        "erasureSubsetEmitReady"
        "erasureSubsetEmitWroteExpected"
        "import SystemsLean.ErasureSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "HOST-EMIT-ERASURE"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
      ];
    }
    {
      # Thin Lake main for slake-erasure-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/ErasureSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ErasureSubsetRebuildMain"
        "slake-erasure-subset-rebuild"
        "ErasureSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.ErasureSubsetRebuild"
      ];
    }
    {
      # GRAPH-SUBSET-EMIT: ideal ladder M1 Graph subset freestanding emit.
      rel = "src/systems/SystemsLean/GraphSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.GraphSubsetEmit"
        "GRAPH-SUBSET-EMIT"
        "SLAKE_GRAPH_SUBSET_EMIT"
        "SLAKE_GRAPH_SUBSET_EMIT_V0"
        "HOST-GRAPH-SUBSET-EMIT"
        "graphSubsetEmitReady"
        "graphSubsetEmitInputId"
        "graphSubsetEmitWroteExpected"
        "graphSubsetEmitInputReady"
        "graphSubsetEmitGraphDialectOk"
        "graphSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "GRAPH-SUBSET-EMIT-SMOKE"
        "GRAPH-SUBSET-EMIT-THEOREM"
        "graphSubsetEmitReady_true"
        "graphSubsetEmitWroteExpected_true"
        "graphSubsetEmitDoesNotRetireLake_true"
        "graphSubsetEmitDoesNotMeanResidualFree_true"
        "graphSubsetEmit_claims_false"
        "theorem graphSubsetEmitReady_true"
        "slake-graph-subset-emit"
        "just graph-subset-emit"
        "slake_graph_subset.h"
        "slake_graph_subset.c"
        "SLAKE_GRAPH_SUBSET_GRAPH"
        "HOST-EMIT-GRAPH"
        "import SystemsLean.CompilePathGraph"
        "import SystemsLean.EmitGraph"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "IR_GRAPH_EDGES_V0"
        "SLAKE_IR_EDGE_MAX"
        "graphFixtureCompilePathReady"
        "COMPILE-PATH-GRAPH"
      ];
    }
    {
      # Thin Lake main for slake-graph-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/GraphSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.GraphSubsetEmitMain"
        "slake-graph-subset-emit"
        "GraphSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.GraphSubsetEmit"
      ];
    }
    {
      # GRAPH-SUBSET-REBUILD: M1 Graph subset rebuild / self-application.
      rel = "src/systems/SystemsLean/GraphSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.GraphSubsetRebuild"
        "GRAPH-SUBSET-REBUILD"
        "SLAKE_GRAPH_SUBSET_REBUILD"
        "SLAKE_GRAPH_SUBSET_REBUILD_V0"
        "HOST-GRAPH-SUBSET-REBUILD"
        "graphSubsetRebuildReady"
        "graphSubsetRebuildInputReady"
        "graphSubsetRebuildSelfApplyOk"
        "graphSubsetRebuildWroteExpected"
        "graphSubsetRebuildPackagePinOk"
        "graphSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "GRAPH-SUBSET-REBUILD-SMOKE"
        "GRAPH-SUBSET-REBUILD-THEOREM"
        "graphSubsetRebuildReady_true"
        "graphSubsetRebuildSelfApplyOk_true"
        "graphSubsetRebuildWroteExpected_true"
        "graphSubsetRebuildDoesNotRetireLake_true"
        "graphSubsetRebuildDoesNotMeanResidualFree_true"
        "graphSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "graphSubsetRebuild_claims_false"
        "theorem graphSubsetRebuildReady_true"
        "slake-graph-subset-rebuild"
        "just graph-subset-rebuild"
        "slake_graph_subset.h"
        "slake_graph_subset.c"
        "SLAKE_GRAPH_SUBSET_EMIT_V0"
        "graphSubsetEmitReady"
        "graphSubsetEmitWroteExpected"
        "import SystemsLean.GraphSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "HOST-EMIT-GRAPH"
        "IR_GRAPH_EDGES_V0"
        "SLAKE_IR_EDGE_MAX"
      ];
    }
    {
      # Thin Lake main for slake-graph-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/GraphSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.GraphSubsetRebuildMain"
        "slake-graph-subset-rebuild"
        "GraphSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.GraphSubsetRebuild"
      ];
    }
    {
      # COMPOSE-SUBSET-EMIT: ideal ladder M1 Compose subset freestanding emit.
      rel = "src/systems/SystemsLean/ComposeSubsetEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ComposeSubsetEmit"
        "COMPOSE-SUBSET-EMIT"
        "SLAKE_COMPOSE_SUBSET_EMIT"
        "SLAKE_COMPOSE_SUBSET_EMIT_V0"
        "HOST-COMPOSE-SUBSET-EMIT"
        "composeSubsetEmitReady"
        "composeSubsetEmitInputId"
        "composeSubsetEmitWroteExpected"
        "composeSubsetEmitInputReady"
        "composeSubsetEmitComposeDialectOk"
        "composeSubsetEmitPackageOk"
        "stillUsesLake"
        "dependsOnLake"
        "COMPOSE-SUBSET-EMIT-SMOKE"
        "COMPOSE-SUBSET-EMIT-THEOREM"
        "composeSubsetEmitReady_true"
        "composeSubsetEmitWroteExpected_true"
        "composeSubsetEmitDoesNotRetireLake_true"
        "composeSubsetEmitDoesNotMeanResidualFree_true"
        "composeSubsetEmit_claims_false"
        "theorem composeSubsetEmitReady_true"
        "slake-compose-subset-emit"
        "just compose-subset-emit"
        "slake_compose_subset.h"
        "slake_compose_subset.c"
        "SLAKE_COMPOSE_SUBSET_COMPOSE"
        "HOST-EMIT-COMPOSE"
        "import SystemsLean.CompilePathCompose"
        "import SystemsLean.EmitCompose"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "HOST_COMPOSE_V0"
        "IR_GRAPH_EDGES_V0"
        "composeFixtureCompilePathReady"
        "COMPILE-PATH-COMPOSE"
      ];
    }
    {
      # Thin Lake main for slake-compose-subset-emit (SKELETON).
      rel = "src/systems/SystemsLean/ComposeSubsetEmitMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ComposeSubsetEmitMain"
        "slake-compose-subset-emit"
        "ComposeSubsetEmitMain"
        "SKELETON"
        "import SystemsLean.ComposeSubsetEmit"
      ];
    }
    {
      # COMPOSE-SUBSET-REBUILD: M1 Compose subset rebuild / self-application.
      rel = "src/systems/SystemsLean/ComposeSubsetRebuild.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ComposeSubsetRebuild"
        "COMPOSE-SUBSET-REBUILD"
        "SLAKE_COMPOSE_SUBSET_REBUILD"
        "SLAKE_COMPOSE_SUBSET_REBUILD_V0"
        "HOST-COMPOSE-SUBSET-REBUILD"
        "composeSubsetRebuildReady"
        "composeSubsetRebuildInputReady"
        "composeSubsetRebuildSelfApplyOk"
        "composeSubsetRebuildWroteExpected"
        "composeSubsetRebuildPackagePinOk"
        "composeSubsetRebuildWithoutLakeFinishedClaimed"
        "stillUsesLake"
        "dependsOnLake"
        "COMPOSE-SUBSET-REBUILD-SMOKE"
        "COMPOSE-SUBSET-REBUILD-THEOREM"
        "composeSubsetRebuildReady_true"
        "composeSubsetRebuildSelfApplyOk_true"
        "composeSubsetRebuildWroteExpected_true"
        "composeSubsetRebuildDoesNotRetireLake_true"
        "composeSubsetRebuildDoesNotMeanResidualFree_true"
        "composeSubsetRebuildDoesNotMeanWithoutLakeFinished_true"
        "composeSubsetRebuild_claims_false"
        "theorem composeSubsetRebuildReady_true"
        "slake-compose-subset-rebuild"
        "just compose-subset-rebuild"
        "slake_compose_subset.h"
        "slake_compose_subset.c"
        "SLAKE_COMPOSE_SUBSET_EMIT_V0"
        "composeSubsetEmitReady"
        "composeSubsetEmitWroteExpected"
        "import SystemsLean.ComposeSubsetEmit"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "HOST-EMIT-COMPOSE"
        "HOST_COMPOSE_V0"
        "IR_GRAPH_EDGES_V0"
      ];
    }
    {
      # Thin Lake main for slake-compose-subset-rebuild (SKELETON).
      rel = "src/systems/SystemsLean/ComposeSubsetRebuildMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ComposeSubsetRebuildMain"
        "slake-compose-subset-rebuild"
        "ComposeSubsetRebuildMain"
        "SKELETON"
        "import SystemsLean.ComposeSubsetRebuild"
      ];
    }
    {
      # COMPILE-PATH-LINEAR: Linear unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathLinear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathLinear"
        "COMPILE-PATH-LINEAR"
        "LINEAR-FIXTURE"
        "HOST-EMIT-LINEAR"
        "linearFixtureCompilePathReady"
        "linearFixtureProgramReady"
        "linearFixtureComposeReady"
        "linearFixtureEmitPathOk"
        "linearFixtureMintConsumeOk"
        "lowerLinearFixtureProgram"
        "lowerLinearFixtureCompose"
        "COMPILE-PATH-LINEAR-SMOKE"
        "COMPILE-PATH-LINEAR-THEOREM"
        "linearFixtureCompilePathReady_true"
        "linearFixtureDoesNotMeanResidualFree_true"
        "linearFixture_claims_false"
        "LINEAR-EXACT-ONCE"
        "ConsumeToken"
        "theorem linearFixtureCompilePathReady_true"
        "theorem linearFixtureDoesNotMeanResidualFree_true"
        "theorem linearFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitLinear"
      ];
    }
    {
      # COMPILE-PATH-TYPES: Types unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathTypes"
        "COMPILE-PATH-TYPES"
        "TYPES-FIXTURE"
        "HOST-EMIT-TYPES"
        "typesFixtureCompilePathReady"
        "typesFixtureProgramReady"
        "typesFixtureComposeReady"
        "typesFixtureEmitPathOk"
        "typesFixtureKindMultOk"
        "lowerTypesFixtureProgram"
        "lowerTypesFixtureCompose"
        "COMPILE-PATH-TYPES-SMOKE"
        "COMPILE-PATH-TYPES-THEOREM"
        "typesFixtureCompilePathReady_true"
        "typesFixtureDoesNotMeanResidualFree_true"
        "typesFixture_claims_false"
        "TYPED_IR_V0"
        "theorem typesFixtureCompilePathReady_true"
        "theorem typesFixtureDoesNotMeanResidualFree_true"
        "theorem typesFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitTypes"
      ];
    }
    {
      # COMPILE-PATH-PROGRAM: Program unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathProgram"
        "COMPILE-PATH-PROGRAM"
        "PROGRAM-FIXTURE"
        "HOST-EMIT-PROGRAM"
        "programFixtureCompilePathReady"
        "programFixtureProgramReady"
        "programFixtureComposeReady"
        "programFixtureEmitPathOk"
        "programFixtureFoldOk"
        "lowerProgramFixtureProgram"
        "lowerProgramFixtureCompose"
        "COMPILE-PATH-PROGRAM-SMOKE"
        "COMPILE-PATH-PROGRAM-THEOREM"
        "programFixtureCompilePathReady_true"
        "programFixtureDoesNotMeanResidualFree_true"
        "programFixture_claims_false"
        "theorem programFixtureCompilePathReady_true"
        "theorem programFixtureDoesNotMeanResidualFree_true"
        "theorem programFixture_claims_false"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitProgram"
      ];
    }
    {
      # COMPILE-PATH-EXTRACT: extract RUNTIME-FS gate (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathExtract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathExtract"
        "COMPILE-PATH-EXTRACT"
        "EXTRACT-RUNTIME-FS"
        "fixtureExtractGateOk"
        "multFixtureExtractGateOk"
        "programFixtureExtractGateOk"
        "multFixtureExtractRawReject"
        "programFixtureExtractRawReject"
        "extractRuntimeFsGateReady"
        "extractRuntimeFsDoesNotMeanResidualFree"
        "COMPILE-PATH-EXTRACT-SMOKE"
        "COMPILE-PATH-EXTRACT-THEOREM"
        "extractRuntimeFsGateReady_true"
        "extractRuntimeFsDoesNotMeanResidualFree_true"
        "extractRuntimeFs_claims_false"
        "multFixtureExtractGateOk_true"
        "programFixtureExtractGateOk_true"
        "extractClaimOk_fs_eq_extractOkFs"
        "theorem multFixtureExtractGateOk_true"
        "theorem programFixtureExtractGateOk_true"
        "theorem extractRuntimeFsGateReady_true"
        "theorem extractRuntimeFsDoesNotMeanResidualFree_true"
        "theorem extractRuntimeFs_claims_false"
        "theorem extractClaimOk_fs_eq_extractOkFs"
        "import SystemsLean.CompilePath"
        "import SystemsLean.CompilePathMult"
        "import SystemsLean.CompilePathProgram"
      ];
    }
    {
      # COMPILE-PATH-GRAPH: Graph unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathGraph"
        "COMPILE-PATH-GRAPH"
        "GRAPH-FIXTURE"
        "HOST-EMIT-GRAPH"
        "graphFixtureCompilePathReady"
        "graphFixtureProgramReady"
        "graphFixtureGraphReady"
        "graphFixtureComposeReady"
        "graphFixtureEmitPathOk"
        "graphFixtureEdgesOk"
        "graphFixtureChainEdgesOk"
        "lowerGraphFixtureProgram"
        "lowerGraphFixtureGraph"
        "lowerGraphFixtureCompose"
        "COMPILE-PATH-GRAPH-SMOKE"
        "COMPILE-PATH-GRAPH-THEOREM"
        "graphFixtureCompilePathReady_true"
        "graphFixtureDoesNotMeanResidualFree_true"
        "graphFixture_claims_false"
        "graphFixtureMintId_eq"
        "IR-GRAPH-EDGES"
        "EMPTY-GRAPH-OK"
        "theorem graphFixtureCompilePathReady_true"
        "theorem graphFixtureDoesNotMeanResidualFree_true"
        "theorem graphFixture_claims_false"
        "theorem graphFixtureGraphReady_true"
        "theorem graphFixtureEdgesOk_true"
        "theorem graphFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitGraph"
      ];
    }
    {
      # COMPILE-PATH-COMPOSE: Compose unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathCompose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathCompose"
        "COMPILE-PATH-COMPOSE"
        "COMPOSE-FIXTURE"
        "HOST-EMIT-COMPOSE"
        "composeFixtureCompilePathReady"
        "composeFixtureProgramReady"
        "composeFixtureComposeReady"
        "composeFixtureEmitPathOk"
        "composeFixtureEdgesOk"
        "composeFixtureChainEdgesOk"
        "composeFixtureMintConsumeOk"
        "lowerComposeFixtureProgram"
        "lowerComposeFixtureCompose"
        "COMPILE-PATH-COMPOSE-SMOKE"
        "COMPILE-PATH-COMPOSE-THEOREM"
        "composeFixtureCompilePathReady_true"
        "composeFixtureDoesNotMeanResidualFree_true"
        "composeFixture_claims_false"
        "composeFixtureMintId_eq"
        "ConsumeToken"
        "LINEAR-EXACT-ONCE"
        "theorem composeFixtureCompilePathReady_true"
        "theorem composeFixtureDoesNotMeanResidualFree_true"
        "theorem composeFixture_claims_false"
        "theorem composeFixtureComposeReady_true"
        "theorem composeFixtureEdgesOk_true"
        "theorem composeFixtureMintConsumeOk_true"
        "theorem composeFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitCompose"
      ];
    }
    {
      # COMPILE-PATH-ERASURE: Erasure unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathErasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathErasure"
        "COMPILE-PATH-ERASURE"
        "ERASURE-FIXTURE"
        "HOST-EMIT-ERASURE"
        "erasureFixtureCompilePathReady"
        "erasureFixtureProgramReady"
        "erasureFixtureComposeReady"
        "erasureFixtureEmitPathOk"
        "erasureFixtureMarkedOk"
        "lowerErasureFixtureProgram"
        "lowerErasureFixtureCompose"
        "COMPILE-PATH-ERASURE-SMOKE"
        "COMPILE-PATH-ERASURE-THEOREM"
        "erasureFixtureCompilePathReady_true"
        "erasureFixtureDoesNotMeanResidualFree_true"
        "erasureFixture_claims_false"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "theorem erasureFixtureCompilePathReady_true"
        "theorem erasureFixtureDoesNotMeanResidualFree_true"
        "theorem erasureFixture_claims_false"
        "theorem erasureFixtureComposeReady_true"
        "theorem erasureFixtureMarkedOk_true"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitErasure"
      ];
    }
    {
      # COMPILE-PATH-PLAN: Plan unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathPlan.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathPlan"
        "COMPILE-PATH-PLAN"
        "PLAN-FIXTURE"
        "HOST-EMIT-PLAN"
        "planFixtureCompilePathReady"
        "planFixtureProgramReady"
        "planFixtureComposeReady"
        "planFixtureEmitPathOk"
        "planFixturePlanOk"
        "lowerPlanFixtureProgram"
        "lowerPlanFixtureCompose"
        "COMPILE-PATH-PLAN-SMOKE"
        "COMPILE-PATH-PLAN-THEOREM"
        "planFixtureCompilePathReady_true"
        "planFixtureDoesNotMeanResidualFree_true"
        "planFixture_claims_false"
        "planFixtureMintId_eq"
        "planFromCompose"
        "planOk"
        "theorem planFixtureCompilePathReady_true"
        "theorem planFixtureDoesNotMeanResidualFree_true"
        "theorem planFixture_claims_false"
        "theorem planFixtureComposeReady_true"
        "theorem planFixturePlanOk_true"
        "theorem planFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitPlan"
      ];
    }
    {
      # COMPILE-PATH-APPLY: Apply unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathApply.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathApply"
        "COMPILE-PATH-APPLY"
        "APPLY-FIXTURE"
        "HOST-EMIT-APPLY"
        "applyFixtureCompilePathReady"
        "applyFixtureProgramReady"
        "applyFixtureComposeReady"
        "applyFixtureEmitPathOk"
        "applyFixtureApplyOk"
        "lowerApplyFixtureProgram"
        "lowerApplyFixtureCompose"
        "COMPILE-PATH-APPLY-SMOKE"
        "COMPILE-PATH-APPLY-THEOREM"
        "applyFixtureCompilePathReady_true"
        "applyFixtureDoesNotMeanResidualFree_true"
        "applyFixture_claims_false"
        "applyFixtureMintId_eq"
        "applyFromCompose"
        "applyOk"
        "theorem applyFixtureCompilePathReady_true"
        "theorem applyFixtureDoesNotMeanResidualFree_true"
        "theorem applyFixture_claims_false"
        "theorem applyFixtureComposeReady_true"
        "theorem applyFixtureApplyOk_true"
        "theorem applyFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitApply"
      ];
    }
    {
      # COMPILE-PATH-BODY: Body unit e2e fixture (peeled from CompilePath.lean).
      rel = "src/systems/SystemsLean/CompilePathBody.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.CompilePathBody"
        "COMPILE-PATH-BODY"
        "BODY-FIXTURE"
        "HOST-EMIT-BODY"
        "bodyFixtureCompilePathReady"
        "bodyFixtureProgramReady"
        "bodyFixtureComposeReady"
        "bodyFixtureEmitPathOk"
        "bodyFixtureBodyOk"
        "lowerBodyFixtureProgram"
        "lowerBodyFixtureCompose"
        "COMPILE-PATH-BODY-SMOKE"
        "COMPILE-PATH-BODY-THEOREM"
        "bodyFixtureCompilePathReady_true"
        "bodyFixtureDoesNotMeanResidualFree_true"
        "bodyFixture_claims_false"
        "bodyFixtureMintId_eq"
        "bodyFromCompose"
        "bodyOk"
        "theorem bodyFixtureCompilePathReady_true"
        "theorem bodyFixtureDoesNotMeanResidualFree_true"
        "theorem bodyFixture_claims_false"
        "theorem bodyFixtureComposeReady_true"
        "theorem bodyFixtureBodyOk_true"
        "theorem bodyFixtureMintId_eq"
        "import SystemsLean.CompilePath"
        "import SystemsLean.EmitBody"
      ];
    }
];
}
