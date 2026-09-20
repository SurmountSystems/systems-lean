# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveImportModel parse of live HostImportGraphModel.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath12 = [
    {
      # HOST-FRONT-LIVE-IMPORT-MODEL: parse live HostImportGraphModel.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveImportModel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModel"
        "HOST-FRONT-LIVE-IMPORT-MODEL"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0"
        "PARSE-LIVE-IMPORT-MODEL"
        "parseLiveImportModelSource"
        "kernelCheckLiveImportModelSource"
        "hostFrontLiveImportModelReady"
        "liveImportModelSource"
        "liveImportModelRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IMPORT-MODEL. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModelMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModelMain"
        "HOST-FRONT-LIVE-IMPORT-MODEL"
        "SLAKE_HOST_FRONT_LIVE_IMPORT_MODEL_V0"
        "PARSE-LIVE-IMPORT-MODEL"
        "parseLiveImportModelSource"
        "kernelCheckLiveImportModelSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IMPORT-MODEL.
      rel = "src/systems/SystemsLean/HostFrontLiveImportModelSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveImportModelSource"
        "PARSE-LIVE-IMPORT-MODEL"
        "liveImportModelSource"
        "HOST-FRONT-LIVE-IMPORT-MODEL"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ImportModel kernel path (live HostImportGraphModel.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckImportModelKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckImportModelKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostImportGraphModel-only"
        "checkImportModelKernel"
        "hostModuleCheckImportModelKernelOk"
        "hostModuleCheckLiveImportModelParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveImportModel"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
