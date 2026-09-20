# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLivePackageWrite parse of live HostPackageWrite.lean (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath6 = [
    {
      # HOST-FRONT-LIVE-PACKAGEWRITE: parse live HostPackageWrite.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLivePackageWrite.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWrite"
        "HOST-FRONT-LIVE-PACKAGEWRITE"
        "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0"
        "PARSE-LIVE-PACKAGEWRITE"
        "parseLivePackageWriteSource"
        "kernelCheckLivePackageWriteSource"
        "hostFrontLivePackageWriteReady"
        "livePackageWriteSource"
        "livePackageWriteRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PACKAGEWRITE. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLivePackageWriteMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWriteMain"
        "HOST-FRONT-LIVE-PACKAGEWRITE"
        "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_V0"
        "PARSE-LIVE-PACKAGEWRITE"
        "parseLivePackageWriteSource"
        "kernelCheckLivePackageWriteSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PACKAGEWRITE.
      rel = "src/systems/SystemsLean/HostFrontLivePackageWriteSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLivePackageWriteSource"
        "PARSE-LIVE-PACKAGEWRITE"
        "livePackageWriteSource"
        "HOST-FRONT-LIVE-PACKAGEWRITE"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK PackageWrite kernel path (live HostPackageWrite.lean,
      # not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckPackageWriteKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckPackageWriteKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "PackageWrite-only"
        "checkPackageWriteKernel"
        "hostModuleCheckPackageWriteKernelOk"
        "hostModuleCheckLivePackageWriteParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLivePackageWrite"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
