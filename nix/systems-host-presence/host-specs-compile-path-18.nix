# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveParityMultTerm parse of live HostModuleCheckParityMultTerm.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath18 = [
    {
      # HOST-FRONT-LIVE-PARITY-MULT-TERM: parse live
      # HostModuleCheckParityMultTerm.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveParityMultTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityMultTerm"
        "HOST-FRONT-LIVE-PARITY-MULT-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_TERM_V0"
        "PARSE-LIVE-PARITY-MULT-TERM"
        "parseLiveParityMultTermSource"
        "kernelCheckLiveParityMultTermSource"
        "hostFrontLiveParityMultTermReady"
        "liveParityMultTermSource"
        "liveParityMultTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "hostFrontLiveParityMultTermFullHost"
        "checkParityMultTermDialect"
        "hostModuleCheckParityMultTermSurfaceOk"
        "hostModuleCheckGoodParityMultTermText"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PARITY-MULT-TERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveParityMultTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityMultTermMain"
        "HOST-FRONT-LIVE-PARITY-MULT-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_TERM_V0"
        "PARSE-LIVE-PARITY-MULT-TERM"
        "parseLiveParityMultTermSource"
        "kernelCheckLiveParityMultTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PARITY-MULT-TERM.
      rel = "src/systems/SystemsLean/HostFrontLiveParityMultTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityMultTermSource"
        "PARSE-LIVE-PARITY-MULT-TERM"
        "liveParityMultTermSource"
        "HOST-FRONT-LIVE-PARITY-MULT-TERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityMultTerm kernel path (live
      # HostModuleCheckParityMultTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckParityMultTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityMultTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckParityMultTerm-only"
        "checkParityMultTermKernel"
        "hostModuleCheckParityMultTermKernelOk"
        "hostModuleCheckLiveParityMultTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveParityMultTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
