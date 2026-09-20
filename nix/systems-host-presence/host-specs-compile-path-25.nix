# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveParityProgramTerm parse of live HostModuleCheckParityProgramTerm.lean
# (not Mult fixture).
# No bash, no Python.
{
  hostSpecsCompilePath25 = [
    {
      # HOST-FRONT-LIVE-PARITY-PROGRAM-TERM: parse live
      # HostModuleCheckParityProgramTerm.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveParityProgramTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityProgramTerm"
        "HOST-FRONT-LIVE-PARITY-PROGRAM-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0"
        "PARSE-LIVE-PARITY-PROGRAM-TERM"
        "parseLiveParityProgramTermSource"
        "kernelCheckLiveParityProgramTermSource"
        "hostFrontLiveParityProgramTermReady"
        "liveParityProgramTermSource"
        "liveParityProgramTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "hostFrontLiveParityProgramTermFullHost"
        "checkParityProgramTermDialect"
        "hostModuleCheckParityProgramTermSurfaceOk"
        "hostModuleCheckGoodParityProgramTermText"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PARITY-PROGRAM-TERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveParityProgramTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityProgramTermMain"
        "HOST-FRONT-LIVE-PARITY-PROGRAM-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_TERM_V0"
        "PARSE-LIVE-PARITY-PROGRAM-TERM"
        "parseLiveParityProgramTermSource"
        "kernelCheckLiveParityProgramTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PARITY-PROGRAM-TERM.
      rel = "src/systems/SystemsLean/HostFrontLiveParityProgramTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityProgramTermSource"
        "PARSE-LIVE-PARITY-PROGRAM-TERM"
        "liveParityProgramTermSource"
        "HOST-FRONT-LIVE-PARITY-PROGRAM-TERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityProgramTerm kernel path (live
      # HostModuleCheckParityProgramTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckParityProgramTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityProgramTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckParityProgramTerm-only"
        "checkParityProgramTermKernel"
        "hostModuleCheckParityProgramTermKernelOk"
        "hostModuleCheckLiveParityProgramTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveParityProgramTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
