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
        "multSubsetRebuild_claims_false"
        "theorem multSubsetRebuildReady_true"
        "slake-mult-subset-rebuild"
        "just mult-subset-rebuild"
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
