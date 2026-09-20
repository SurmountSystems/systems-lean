# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportLoadOkLater parse of live HostImportGraphLoadOkLater.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath11 = [
    {
      # HOST-FRONT-LIVE-IMPORT-LOADOKLATER: parse live
      # HostImportGraphLoadOkLater.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportLoadOkLater.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportLoadOkLater"
        "HOST-FRONT-LIVE-IMPORT-LOADOKLATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0"
        "PARSE-LIVE-IMPORT-LOADOKLATER"
        "parseLiveImportLoadOkLaterSource"
        "kernelCheckLiveImportLoadOkLaterSource"
        "hostFrontLiveImportLoadOkLaterReady"
        "liveImportLoadOkLaterSource"
        "liveImportLoadOkLaterRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-LOADOKLATER. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportLoadOkLaterMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportLoadOkLaterMain"
        "HOST-FRONT-LIVE-IMPORT-LOADOKLATER"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_LOADOKLATER_V0"
        "PARSE-LIVE-IMPORT-LOADOKLATER"
        "parseLiveImportLoadOkLaterSource"
        "kernelCheckLiveImportLoadOkLaterSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-LOADOKLATER.
      rel = "src/systems/SystemsLean/HostFrontLiveImportLoadOkLaterSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportLoadOkLaterSource"
        "PARSE-LIVE-IMPORT-LOADOKLATER"
        "liveImportLoadOkLaterSource"
        "HOST-FRONT-LIVE-IMPORT-LOADOKLATER"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportLoadOkLater kernel path (live
      # HostImportGraphLoadOkLater.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportLoadOkLaterKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportLoadOkLaterKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphLoadOkLater-only"
        "checkImportLoadOkLaterKernel"
        "hostModuleCheckImportLoadOkLaterKernelOk"
        "hostModuleCheckLiveImportLoadOkLaterParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportLoadOkLater"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
