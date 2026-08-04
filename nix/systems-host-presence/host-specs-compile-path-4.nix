# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCompilePath4 = [
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
