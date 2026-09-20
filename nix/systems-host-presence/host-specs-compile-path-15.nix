# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportWalk parse of live HostImportGraphWalk.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath15 = [
    {
      # HOST-FRONT-LIVE-IMPORT-WALK: parse live HostImportGraphWalk.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalk.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalk"
        "HOST-FRONT-LIVE-IMPORT-WALK"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0"
        "PARSE-LIVE-IMPORT-WALK"
        "parseLiveImportWalkSource"
        "kernelCheckLiveImportWalkSource"
        "hostFrontLiveImportWalkReady"
        "liveImportWalkSource"
        "liveImportWalkRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "liveParseSkippedIoWalk"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-WALK. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalkMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalkMain"
        "HOST-FRONT-LIVE-IMPORT-WALK"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_WALK_V0"
        "PARSE-LIVE-IMPORT-WALK"
        "parseLiveImportWalkSource"
        "kernelCheckLiveImportWalkSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-WALK.
      rel = "src/systems/SystemsLean/HostFrontLiveImportWalkSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportWalkSource"
        "PARSE-LIVE-IMPORT-WALK"
        "liveImportWalkSource"
        "HOST-FRONT-LIVE-IMPORT-WALK"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportWalk kernel path (live HostImportGraphWalk.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportWalkKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportWalkKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphWalk-only"
        "checkImportWalkKernel"
        "hostModuleCheckImportWalkKernelOk"
        "hostModuleCheckLiveImportWalkParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportWalk"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
