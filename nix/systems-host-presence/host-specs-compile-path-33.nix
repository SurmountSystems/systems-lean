# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveExtractTheorems parse of live ExtractTheorems.lean
# (not Extract fixture, not HostFrontLiveExtract).
# No bash, no Python.
{
  hostSpecsCompilePath33 = [
    {
      # HOST-FRONT-LIVE-EXTRACT-THEOREMS: parse live
      # ExtractTheorems.lean (not HostTerm.multFixtureModule, not
      # Extract.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveExtractTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveExtractTheorems"
        "HOST-FRONT-LIVE-EXTRACT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0"
        "PARSE-LIVE-EXTRACT-THEOREMS"
        "parseLiveExtractTheoremsSource"
        "kernelCheckLiveExtractTheoremsSource"
        "hostFrontLiveExtractTheoremsReady"
        "liveExtractTheoremsSource"
        "liveExtractTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-EXTRACT-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveExtractTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveExtractTheoremsMain"
        "HOST-FRONT-LIVE-EXTRACT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0"
        "PARSE-LIVE-EXTRACT-THEOREMS"
        "parseLiveExtractTheoremsSource"
        "kernelCheckLiveExtractTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-EXTRACT-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveExtractTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveExtractTheoremsSource"
        "HOST-FRONT-LIVE-EXTRACT-THEOREMS"
        "PARSE-LIVE-EXTRACT-THEOREMS"
        "liveExtractTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK ExtractTheorems kernel path (live
      # ExtractTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckExtractTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckExtractTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "ExtractTheorems-only"
        "checkExtractTheoremsKernel"
        "hostModuleCheckExtractTheoremsKernelOk"
        "hostModuleCheckLiveExtractTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveExtractTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-EXTRACT-THEOREMS. Missing-token red
      # until SystemsLean.lean imports these modules.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveExtractTheorems"
        "import SystemsLean.HostModuleCheckExtractTheoremsKernel"
      ];
    }
  ];
}
