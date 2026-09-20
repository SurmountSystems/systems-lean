# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveCheckers parse of live HostModuleCheckCheckers.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath17 = [
    {
      # HOST-FRONT-LIVE-CHECKERS: parse live HostModuleCheckCheckers.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveCheckers.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckers"
        "HOST-FRONT-LIVE-CHECKERS"
        "SLAKE_HOST_FRONT_LIVE_CHECKERS_V0"
        "PARSE-LIVE-CHECKERS"
        "parseLiveCheckersSource"
        "kernelCheckLiveCheckersSource"
        "hostFrontLiveCheckersReady"
        "liveCheckersSource"
        "liveCheckersRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-CHECKERS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveCheckersMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckersMain"
        "HOST-FRONT-LIVE-CHECKERS"
        "SLAKE_HOST_FRONT_LIVE_CHECKERS_V0"
        "PARSE-LIVE-CHECKERS"
        "parseLiveCheckersSource"
        "kernelCheckLiveCheckersSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-CHECKERS.
      rel = "src/systems/SystemsLean/HostFrontLiveCheckersSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckersSource"
        "PARSE-LIVE-CHECKERS"
        "liveCheckersSource"
        "HOST-FRONT-LIVE-CHECKERS"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK Checkers kernel path (live HostModuleCheckCheckers.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckCheckersKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCheckersKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckCheckers-only"
        "checkCheckersKernel"
        "hostModuleCheckCheckersKernelOk"
        "hostModuleCheckLiveCheckersParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveCheckers"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
