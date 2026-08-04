# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCompilePath1 = [
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
      # MULT-FS-WRITE-TOOL: P1 Lean-native Mult package writer (no full host-cc C print).
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
        "multFsWriteToolNativeIo"
        "multFsWriteToolPrintsFullHelperC"
        "IO.FS.writeFile"
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
      # MULT-FS-WRITE-TOOL main: Lake exe root for Lean-native Mult package write.
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
      # PRODUCT-WIRE-FS-WRITE-TOOL: P1 Lean-native freestanding product-wire writer.
      rel = "src/systems/SystemsLean/ProductWireWriteTool.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProductWireWriteTool"
        "PRODUCT-WIRE-FS-WRITE-TOOL"
        "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL"
        "SLAKE_PRODUCT_WIRE_FS_WRITE_TOOL_V0"
        "HOST-PRODUCT-WIRE-FS-WRITE-TOOL"
        "productWireFsWriterReady"
        "productWireFsWriterFinishedClaimed"
        "productWireFsWriterNotLakeBuilt"
        "productWireFsWriterKeepsHostLake"
        "productWireFsWriterBinRel"
        "productWireFsWriterCRel"
        "productWireFsWriterEmit"
        "productWireFsWriterCSource"
        "productWireFsWriterNativeIo"
        "productWireFsWriterPrintsFullHelperC"
        "IO.FS.writeFile"
        "slake_product_wire_fs_write_tool.c"
        "slake-product-wire-fs-write-cc"
        "slake-product-wire-fs-write-tool"
        "product-wire-freestanding-write"
        "PRODUCT-WIRE-FS-WRITE-TOOL-SMOKE"
        "PRODUCT-WIRE-FS-WRITE-TOOL-THEOREM"
        "stillUsesLake"
        "dependsOnLake"
        "import SystemsLean.CapableWriteHc"
        "import SystemsLean.InstallOut"
        "freestandingCapableWriteFreestandingHc"
        "freestandingCapableInstallFreestandingOut"
        "UNIT_SURFACE"
        "Not freestanding residual free"
      ];
    }
    {
      # PRODUCT-WIRE-FS-WRITE-TOOL main: Lake exe root for Lean-native WRITE+INSTALL.
      rel = "src/systems/SystemsLean/ProductWireWriteToolMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.ProductWireWriteToolMain"
        "ProductWireWriteToolMain"
        "slake-product-wire-fs-write-tool"
        "PRODUCT-WIRE-FS-WRITE-TOOL"
        "import SystemsLean.ProductWireWriteTool"
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
  ];
}
