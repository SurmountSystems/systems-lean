# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveFixtures parse of live HostModuleCheckFixtures.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath22 = [
    {
      # HOST-FRONT-LIVE-FIXTURES: parse live HostModuleCheckFixtures.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveFixtures.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFixtures"
        "HOST-FRONT-LIVE-FIXTURES"
        "SLAKE_HOST_FRONT_LIVE_FIXTURES_V0"
        "PARSE-LIVE-FIXTURES"
        "parseLiveFixturesSource"
        "kernelCheckLiveFixturesSource"
        "hostFrontLiveFixturesReady"
        "liveFixturesSource"
        "liveFixturesRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-FIXTURES. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveFixturesMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFixturesMain"
        "HOST-FRONT-LIVE-FIXTURES"
        "SLAKE_HOST_FRONT_LIVE_FIXTURES_V0"
        "PARSE-LIVE-FIXTURES"
        "parseLiveFixturesSource"
        "kernelCheckLiveFixturesSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-FIXTURES.
      rel = "src/systems/SystemsLean/HostFrontLiveFixturesSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFixturesSource"
        "PARSE-LIVE-FIXTURES"
        "liveFixturesSource"
        "HOST-FRONT-LIVE-FIXTURES"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Fixtures kernel path (live HostModuleCheckFixtures.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckFixturesKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFixturesKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckFixtures-only"
        "checkFixturesKernel"
        "hostModuleCheckFixturesKernelOk"
        "hostModuleCheckLiveFixturesParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveFixtures"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
