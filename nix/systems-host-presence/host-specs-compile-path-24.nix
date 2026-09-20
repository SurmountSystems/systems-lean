# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveKernelLinearTerm parse of live HostModuleCheckKernelLinearTerm.lean
# (not Mult fixture). Skip 16-23 (Fixtures/Checkers/ParityMultTerm/CheckersLater/Surface/KernelMultTerm).
# No bash, no Python.
{
  hostSpecsCompilePath24 = [
    {
      # HOST-FRONT-LIVE-KERNELLINEARTERM: parse live HostModuleCheckKernelLinearTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelLinearTerm"
        "HOST-FRONT-LIVE-KERNELLINEARTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELLINEARTERM_V0"
        "PARSE-LIVE-KERNELLINEARTERM"
        "parseLiveKernelLinearTermSource"
        "kernelCheckLiveKernelLinearTermSource"
        "hostFrontLiveKernelLinearTermReady"
        "liveKernelLinearTermSource"
        "liveKernelLinearTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELLINEARTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelLinearTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelLinearTermMain"
        "HOST-FRONT-LIVE-KERNELLINEARTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELLINEARTERM_V0"
        "PARSE-LIVE-KERNELLINEARTERM"
        "parseLiveKernelLinearTermSource"
        "kernelCheckLiveKernelLinearTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELLINEARTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelLinearTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelLinearTermSource"
        "PARSE-LIVE-KERNELLINEARTERM"
        "liveKernelLinearTermSource"
        "HOST-FRONT-LIVE-KERNELLINEARTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelLinearTerm kernel path (live
      # HostModuleCheckKernelLinearTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelLinearTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelLinearTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckKernelLinearTerm-only"
        "checkKernelLinearTermKernel"
        "hostModuleCheckKernelLinearTermKernelOk"
        "hostModuleCheckLiveKernelLinearTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveKernelLinearTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
