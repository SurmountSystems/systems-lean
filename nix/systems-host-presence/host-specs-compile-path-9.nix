# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportSeeds parse of live HostImportGraphSeeds.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath9 = [
    {
      # HOST-FRONT-LIVE-IMPORT-SEEDS: parse live HostImportGraphSeeds.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportSeeds.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportSeeds"
        "HOST-FRONT-LIVE-IMPORT-SEEDS"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0"
        "PARSE-LIVE-IMPORT-SEEDS"
        "parseLiveImportSeedsSource"
        "kernelCheckLiveImportSeedsSource"
        "hostFrontLiveImportSeedsReady"
        "liveImportSeedsSource"
        "liveImportSeedsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-SEEDS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportSeedsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportSeedsMain"
        "HOST-FRONT-LIVE-IMPORT-SEEDS"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_SEEDS_V0"
        "PARSE-LIVE-IMPORT-SEEDS"
        "parseLiveImportSeedsSource"
        "kernelCheckLiveImportSeedsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-SEEDS.
      rel = "src/systems/SystemsLean/HostFrontLiveImportSeedsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportSeedsSource"
        "PARSE-LIVE-IMPORT-SEEDS"
        "liveImportSeedsSource"
        "HOST-FRONT-LIVE-IMPORT-SEEDS"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportSeeds kernel path (live HostImportGraphSeeds.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportSeedsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportSeedsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphSeeds-only"
        "checkImportSeedsKernel"
        "hostModuleCheckImportSeedsKernelOk"
        "hostModuleCheckLiveImportSeedsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportSeeds"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
