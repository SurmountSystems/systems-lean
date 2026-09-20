# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLivePackageWriteTheorems parse of live HostPackageWriteTheorems.lean
# (not Mult fixture, not HostFrontLivePackageWrite).
# No bash, no Python.
{
  hostSpecsCompilePath8 = [
    {
      # HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS: parse live
      # HostPackageWriteTheorems.lean (not HostTerm.multFixtureModule, not
      # HostPackageWrite.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLivePackageWriteTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWriteTheorems"
        "HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0"
        "PARSE-LIVE-PACKAGEWRITE-THEOREMS"
        "parseLivePackageWriteTheoremsSource"
        "kernelCheckLivePackageWriteTheoremsSource"
        "hostFrontLivePackageWriteTheoremsReady"
        "livePackageWriteTheoremsSource"
        "livePackageWriteTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PACKAGEWRITE-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLivePackageWriteTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWriteTheoremsMain"
        "HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0"
        "PARSE-LIVE-PACKAGEWRITE-THEOREMS"
        "parseLivePackageWriteTheoremsSource"
        "kernelCheckLivePackageWriteTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PACKAGEWRITE-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLivePackageWriteTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWriteTheoremsSource"
        "HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS"
        "PARSE-LIVE-PACKAGEWRITE-THEOREMS"
        "livePackageWriteTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK PackageWriteTheorems kernel path (live
      # HostPackageWriteTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageWriteTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageWriteTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostPackageWriteTheorems-only"
        "checkPackageWriteTheoremsKernel"
        "hostModuleCheckPackageWriteTheoremsKernelOk"
        "hostModuleCheckLivePackageWriteTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLivePackageWriteTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
