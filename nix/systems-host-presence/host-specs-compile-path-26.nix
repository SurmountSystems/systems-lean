# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveKernelEmitTerm parse of live HostModuleCheckKernelEmitTerm.lean
# (not Mult fixture). Skip 16-25 (Fixtures/Checkers/ParityMultTerm/CheckersLater/Surface).
# No bash, no Python.
{
  hostSpecsCompilePath26 = [
    {
      # HOST-FRONT-LIVE-KERNELEMITTERM: parse live HostModuleCheckKernelEmitTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelEmitTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelEmitTerm"
        "HOST-FRONT-LIVE-KERNELEMITTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0"
        "PARSE-LIVE-KERNELEMITTERM"
        "parseLiveKernelEmitTermSource"
        "kernelCheckLiveKernelEmitTermSource"
        "hostFrontLiveKernelEmitTermReady"
        "liveKernelEmitTermSource"
        "liveKernelEmitTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELEMITTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelEmitTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelEmitTermMain"
        "HOST-FRONT-LIVE-KERNELEMITTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELEMITTERM_V0"
        "PARSE-LIVE-KERNELEMITTERM"
        "parseLiveKernelEmitTermSource"
        "kernelCheckLiveKernelEmitTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELEMITTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelEmitTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelEmitTermSource"
        "PARSE-LIVE-KERNELEMITTERM"
        "liveKernelEmitTermSource"
        "HOST-FRONT-LIVE-KERNELEMITTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelEmitTerm kernel path (live
      # HostModuleCheckKernelEmitTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelEmitTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelEmitTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckKernelEmitTerm-only"
        "checkKernelEmitTermKernel"
        "hostModuleCheckKernelEmitTermKernelOk"
        "hostModuleCheckLiveKernelEmitTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveKernelEmitTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
