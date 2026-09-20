# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveKernelProgramTerm parse of live HostModuleCheckKernelProgramTerm.lean
# (not Mult fixture). Skip 16-22 (Fixtures/Checkers/ParityMultTerm/CheckersLater/Surface).
# No bash, no Python.
{
  hostSpecsCompilePath23 = [
    {
      # HOST-FRONT-LIVE-KERNELPROGRAMTERM: parse live HostModuleCheckKernelProgramTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelProgramTerm"
        "HOST-FRONT-LIVE-KERNELPROGRAMTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELPROGRAMTERM_V0"
        "PARSE-LIVE-KERNELPROGRAMTERM"
        "parseLiveKernelProgramTermSource"
        "kernelCheckLiveKernelProgramTermSource"
        "hostFrontLiveKernelProgramTermReady"
        "liveKernelProgramTermSource"
        "liveKernelProgramTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELPROGRAMTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelProgramTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelProgramTermMain"
        "HOST-FRONT-LIVE-KERNELPROGRAMTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELPROGRAMTERM_V0"
        "PARSE-LIVE-KERNELPROGRAMTERM"
        "parseLiveKernelProgramTermSource"
        "kernelCheckLiveKernelProgramTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELPROGRAMTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelProgramTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelProgramTermSource"
        "PARSE-LIVE-KERNELPROGRAMTERM"
        "liveKernelProgramTermSource"
        "HOST-FRONT-LIVE-KERNELPROGRAMTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelProgramTerm kernel path (live
      # HostModuleCheckKernelProgramTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelProgramTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelProgramTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckKernelProgramTerm-only"
        "checkKernelProgramTermKernel"
        "hostModuleCheckKernelProgramTermKernelOk"
        "hostModuleCheckLiveKernelProgramTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveKernelProgramTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
