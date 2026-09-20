# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveMultTheorems parse of live MultTheorems.lean
# (not Mult fixture, not HostFrontLiveMult).
# No bash, no Python.
{
  hostSpecsCompilePath30 = [
    {
      # HOST-FRONT-LIVE-MULT-THEOREMS: parse live
      # MultTheorems.lean (not HostTerm.multFixtureModule, not
      # Mult.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveMultTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveMultTheorems"
        "HOST-FRONT-LIVE-MULT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0"
        "PARSE-LIVE-MULT-THEOREMS"
        "parseLiveMultTheoremsSource"
        "kernelCheckLiveMultTheoremsSource"
        "hostFrontLiveMultTheoremsReady"
        "liveMultTheoremsSource"
        "liveMultTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-MULT-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveMultTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveMultTheoremsMain"
        "HOST-FRONT-LIVE-MULT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0"
        "PARSE-LIVE-MULT-THEOREMS"
        "parseLiveMultTheoremsSource"
        "kernelCheckLiveMultTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-MULT-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveMultTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveMultTheoremsSource"
        "HOST-FRONT-LIVE-MULT-THEOREMS"
        "PARSE-LIVE-MULT-THEOREMS"
        "liveMultTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK MultTheorems kernel path (live
      # MultTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckMultTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "MultTheorems-only"
        "checkMultTheoremsKernel"
        "hostModuleCheckMultTheoremsKernelOk"
        "hostModuleCheckLiveMultTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveMultTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-MULT-THEOREMS. Missing-token red
      # until SystemsLean.lean imports these modules.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveMultTheorems"
        "import SystemsLean.HostModuleCheckMultTheoremsKernel"
      ];
    }
  ];
}
