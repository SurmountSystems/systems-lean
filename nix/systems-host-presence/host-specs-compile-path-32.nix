# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveErasureTheorems parse of live ErasureTheorems.lean
# (not Erasure fixture, not HostFrontLiveErasure).
# No bash, no Python.
{
  hostSpecsCompilePath32 = [
    {
      # HOST-FRONT-LIVE-ERASURE-THEOREMS: parse live
      # ErasureTheorems.lean (not HostTerm.multFixtureModule, not
      # Erasure.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveErasureTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveErasureTheorems"
        "HOST-FRONT-LIVE-ERASURE-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0"
        "PARSE-LIVE-ERASURE-THEOREMS"
        "parseLiveErasureTheoremsSource"
        "kernelCheckLiveErasureTheoremsSource"
        "hostFrontLiveErasureTheoremsReady"
        "liveErasureTheoremsSource"
        "liveErasureTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-ERASURE-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveErasureTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveErasureTheoremsMain"
        "HOST-FRONT-LIVE-ERASURE-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0"
        "PARSE-LIVE-ERASURE-THEOREMS"
        "parseLiveErasureTheoremsSource"
        "kernelCheckLiveErasureTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-ERASURE-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveErasureTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveErasureTheoremsSource"
        "HOST-FRONT-LIVE-ERASURE-THEOREMS"
        "PARSE-LIVE-ERASURE-THEOREMS"
        "liveErasureTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK ErasureTheorems kernel path (live
      # ErasureTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckErasureTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckErasureTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "ErasureTheorems-only"
        "checkErasureTheoremsKernel"
        "hostModuleCheckErasureTheoremsKernelOk"
        "hostModuleCheckLiveErasureTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveErasureTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-ERASURE-THEOREMS. Missing-token red
      # until SystemsLean.lean imports these modules.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveErasureTheorems"
        "import SystemsLean.HostModuleCheckErasureTheoremsKernel"
      ];
    }
  ];
}
