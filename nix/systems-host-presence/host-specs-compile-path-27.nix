# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveParityTypesTerm parse of live HostModuleCheckParityTypesTerm.lean
# (not Mult fixture). Slice 25 is ParityLinearTerm (other writer). Slice 26 is
# KernelEmitTerm. This slice is 27.
# No bash, no Python.
{
  hostSpecsCompilePath27 = [
    {
      # HOST-FRONT-LIVE-PARITY-TYPES-TERM: parse live
      # HostModuleCheckParityTypesTerm.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveParityTypesTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityTypesTerm"
        "HOST-FRONT-LIVE-PARITY-TYPES-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_TERM_V0"
        "PARSE-LIVE-PARITY-TYPES-TERM"
        "parseLiveParityTypesTermSource"
        "kernelCheckLiveParityTypesTermSource"
        "hostFrontLiveParityTypesTermReady"
        "liveParityTypesTermSource"
        "liveParityTypesTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "hostFrontLiveParityTypesTermFullHost"
        "checkParityTypesTermDialect"
        "hostModuleCheckParityTypesTermSurfaceOk"
        "hostModuleCheckGoodParityTypesTermText"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PARITY-TYPES-TERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveParityTypesTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityTypesTermMain"
        "HOST-FRONT-LIVE-PARITY-TYPES-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_TERM_V0"
        "PARSE-LIVE-PARITY-TYPES-TERM"
        "parseLiveParityTypesTermSource"
        "kernelCheckLiveParityTypesTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PARITY-TYPES-TERM.
      rel = "src/systems/SystemsLean/HostFrontLiveParityTypesTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityTypesTermSource"
        "PARSE-LIVE-PARITY-TYPES-TERM"
        "liveParityTypesTermSource"
        "HOST-FRONT-LIVE-PARITY-TYPES-TERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityTypesTerm kernel path (live
      # HostModuleCheckParityTypesTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckParityTypesTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityTypesTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckParityTypesTerm-only"
        "checkParityTypesTermKernel"
        "hostModuleCheckParityTypesTermKernelOk"
        "hostModuleCheckLiveParityTypesTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveParityTypesTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
