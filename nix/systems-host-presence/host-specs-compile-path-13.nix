# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportMods parse of live HostImportGraphMods.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath13 = [
    {
      # HOST-FRONT-LIVE-IMPORT-MODS: parse live HostImportGraphMods.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportMods.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportMods"
        "HOST-FRONT-LIVE-IMPORT-MODS"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0"
        "PARSE-LIVE-IMPORT-MODS"
        "parseLiveImportModsSource"
        "kernelCheckLiveImportModsSource"
        "hostFrontLiveImportModsReady"
        "liveImportModsSource"
        "liveImportModsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-MODS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModsMain"
        "HOST-FRONT-LIVE-IMPORT-MODS"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODS_V0"
        "PARSE-LIVE-IMPORT-MODS"
        "parseLiveImportModsSource"
        "kernelCheckLiveImportModsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-MODS.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModsSource"
        "PARSE-LIVE-IMPORT-MODS"
        "liveImportModsSource"
        "HOST-FRONT-LIVE-IMPORT-MODS"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportMods kernel path (live HostImportGraphMods.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportModsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportModsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphMods-only"
        "checkImportModsKernel"
        "hostModuleCheckImportModsKernelOk"
        "hostModuleCheckLiveImportModsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportMods"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
