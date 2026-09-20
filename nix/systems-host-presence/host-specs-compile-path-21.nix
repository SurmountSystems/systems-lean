# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveKernelMultTerm parse of live HostModuleCheckKernelMultTerm.lean
# (not Mult fixture). Skip 16-20 (Fixtures/Checkers/ParityMultTerm/CheckersLater/Surface).
# No bash, no Python.
{
  hostSpecsCompilePath21 = [
    {
      # HOST-FRONT-LIVE-KERNELMULTTERM: parse live HostModuleCheckKernelMultTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMultTerm"
        "HOST-FRONT-LIVE-KERNELMULTTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELMULTTERM_V0"
        "PARSE-LIVE-KERNELMULTTERM"
        "parseLiveKernelMultTermSource"
        "kernelCheckLiveKernelMultTermSource"
        "hostFrontLiveKernelMultTermReady"
        "liveKernelMultTermSource"
        "liveKernelMultTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELMULTTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMultTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMultTermMain"
        "HOST-FRONT-LIVE-KERNELMULTTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELMULTTERM_V0"
        "PARSE-LIVE-KERNELMULTTERM"
        "parseLiveKernelMultTermSource"
        "kernelCheckLiveKernelMultTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELMULTTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMultTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMultTermSource"
        "PARSE-LIVE-KERNELMULTTERM"
        "liveKernelMultTermSource"
        "HOST-FRONT-LIVE-KERNELMULTTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelMultTerm kernel path (live
      # HostModuleCheckKernelMultTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelMultTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelMultTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckKernelMultTerm-only"
        "checkKernelMultTermKernel"
        "hostModuleCheckKernelMultTermKernelOk"
        "hostModuleCheckLiveKernelMultTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveKernelMultTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-KERNELTYPESTERM: parse live HostModuleCheckKernelTypesTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelTypesTerm"
        "HOST-FRONT-LIVE-KERNELTYPESTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELTYPESTERM_V0"
        "PARSE-LIVE-KERNELTYPESTERM"
        "parseLiveKernelTypesTermSource"
        "kernelCheckLiveKernelTypesTermSource"
        "hostFrontLiveKernelTypesTermReady"
        "liveKernelTypesTermSource"
        "liveKernelTypesTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELTYPESTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelTypesTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelTypesTermMain"
        "HOST-FRONT-LIVE-KERNELTYPESTERM"
        "SLAKE_HOST_FRONT_LIVE_KERNELTYPESTERM_V0"
        "PARSE-LIVE-KERNELTYPESTERM"
        "parseLiveKernelTypesTermSource"
        "kernelCheckLiveKernelTypesTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELTYPESTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelTypesTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelTypesTermSource"
        "PARSE-LIVE-KERNELTYPESTERM"
        "liveKernelTypesTermSource"
        "HOST-FRONT-LIVE-KERNELTYPESTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK KernelTypesTerm kernel path (live
      # HostModuleCheckKernelTypesTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckKernelTypesTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckKernelTypesTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckKernelTypesTerm-only"
        "checkKernelTypesTermKernel"
        "hostModuleCheckKernelTypesTermKernelOk"
        "hostModuleCheckLiveKernelTypesTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveKernelTypesTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
