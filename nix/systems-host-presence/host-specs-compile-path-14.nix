# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportWalkLater parse of live HostImportGraphWalkLater.lean
# (not Mult fixture). No bash, no Python.
{
  hostSpecsCompilePath14 = [
    {
      # HOST-FRONT-LIVE-IMPORT-WALK-LATER: parse live HostImportGraphWalkLater.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalkLater"
        "HOST-FRONT-LIVE-IMPORT-WALK-LATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0"
        "PARSE-LIVE-IMPORT-WALK-LATER"
        "parseLiveImportWalkLaterSource"
        "kernelCheckLiveImportWalkLaterSource"
        "hostFrontLiveImportWalkLaterReady"
        "liveImportWalkLaterSource"
        "liveImportWalkLaterRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "liveParseSkippedIoEdgeWalk"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-WALK-LATER. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalkLaterMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalkLaterMain"
        "HOST-FRONT-LIVE-IMPORT-WALK-LATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_LATER_V0"
        "PARSE-LIVE-IMPORT-WALK-LATER"
        "parseLiveImportWalkLaterSource"
        "kernelCheckLiveImportWalkLaterSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-WALK-LATER.
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalkLaterSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalkLaterSource"
        "PARSE-LIVE-IMPORT-WALK-LATER"
        "liveImportWalkLaterSource"
        "HOST-FRONT-LIVE-IMPORT-WALK-LATER"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportWalkLater kernel path (live
      # HostImportGraphWalkLater.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportWalkLaterKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportWalkLaterKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphWalkLater-only"
        "checkImportWalkLaterKernel"
        "hostModuleCheckImportWalkLaterKernelOk"
        "hostModuleCheckLiveImportWalkLaterParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportWalkLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
