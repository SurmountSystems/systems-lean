# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveCheckersLater parse of live HostModuleCheckCheckersLater.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath19 = [
    {
      # HOST-FRONT-LIVE-CHECKERS-LATER: parse live
      # HostModuleCheckCheckersLater.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveCheckersLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckersLater"
        "HOST-FRONT-LIVE-CHECKERS-LATER"
        "SLAKE_HOST_FRONT_LIVE_CHECKERS_LATER_V0"
        "PARSE-LIVE-CHECKERS-LATER"
        "parseLiveCheckersLaterSource"
        "kernelCheckLiveCheckersLaterSource"
        "hostFrontLiveCheckersLaterReady"
        "liveCheckersLaterSource"
        "liveCheckersLaterRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-CHECKERS-LATER. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveCheckersLaterMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckersLaterMain"
        "HOST-FRONT-LIVE-CHECKERS-LATER"
        "SLAKE_HOST_FRONT_LIVE_CHECKERS_LATER_V0"
        "PARSE-LIVE-CHECKERS-LATER"
        "parseLiveCheckersLaterSource"
        "kernelCheckLiveCheckersLaterSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-CHECKERS-LATER.
      rel = "src/systems/SystemsLean/HostFrontLiveCheckersLaterSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCheckersLaterSource"
        "PARSE-LIVE-CHECKERS-LATER"
        "liveCheckersLaterSource"
        "HOST-FRONT-LIVE-CHECKERS-LATER"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK CheckersLater kernel path (live
      # HostModuleCheckCheckersLater.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckCheckersLaterKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckCheckersLaterKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckCheckersLater-only"
        "checkCheckersLaterKernel"
        "hostModuleCheckCheckersLaterKernelOk"
        "hostModuleCheckLiveCheckersLaterParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveCheckersLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
