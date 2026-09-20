# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportModsLater parse of live HostImportGraphModsLater.lean
# (not Mult fixture). No bash, no Python.
{
  hostSpecsCompilePath10 = [
    {
      # HOST-FRONT-LIVE-IMPORT-MODS-LATER: parse live
      # HostImportGraphModsLater.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportModsLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModsLater"
        "HOST-FRONT-LIVE-IMPORT-MODS-LATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0"
        "PARSE-LIVE-IMPORT-MODS-LATER"
        "parseLiveImportModsLaterSource"
        "kernelCheckLiveImportModsLaterSource"
        "hostFrontLiveImportModsLaterReady"
        "liveImportModsLaterSource"
        "liveImportModsLaterRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-MODS-LATER. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModsLaterMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModsLaterMain"
        "HOST-FRONT-LIVE-IMPORT-MODS-LATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_LATER_V0"
        "PARSE-LIVE-IMPORT-MODS-LATER"
        "parseLiveImportModsLaterSource"
        "kernelCheckLiveImportModsLaterSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-MODS-LATER.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModsLaterSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModsLaterSource"
        "PARSE-LIVE-IMPORT-MODS-LATER"
        "liveImportModsLaterSource"
        "HOST-FRONT-LIVE-IMPORT-MODS-LATER"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportModsLater kernel path (live
      # HostImportGraphModsLater.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportModsLaterKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportModsLaterKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphModsLater-only"
        "checkImportModsLaterKernel"
        "hostModuleCheckImportModsLaterKernelOk"
        "hostModuleCheckLiveImportModsLaterParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportModsLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
