# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveParityLinearTerm parse of live HostModuleCheckParityLinearTerm.lean
# (not Mult fixture). Slice 25 was overwritten by ParityProgramTerm; this
# slice is 28. Slice 26 is KernelEmitTerm. Slice 27 is ParityTypesTerm.
# No bash, no Python.
{
  hostSpecsCompilePath28 = [
    {
      # HOST-FRONT-LIVE-PARITY-LINEAR-TERM: parse live
      # HostModuleCheckParityLinearTerm.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveParityLinearTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityLinearTerm"
        "HOST-FRONT-LIVE-PARITY-LINEAR-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0"
        "PARSE-LIVE-PARITY-LINEAR-TERM"
        "parseLiveParityLinearTermSource"
        "kernelCheckLiveParityLinearTermSource"
        "hostFrontLiveParityLinearTermReady"
        "liveParityLinearTermSource"
        "liveParityLinearTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
        "hostFrontLiveParityLinearTermFullHost"
        "checkParityLinearTermDialect"
        "hostModuleCheckParityLinearTermSurfaceOk"
        "hostModuleCheckGoodParityLinearTermText"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-PARITY-LINEAR-TERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveParityLinearTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityLinearTermMain"
        "HOST-FRONT-LIVE-PARITY-LINEAR-TERM"
        "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_TERM_V0"
        "PARSE-LIVE-PARITY-LINEAR-TERM"
        "parseLiveParityLinearTermSource"
        "kernelCheckLiveParityLinearTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-PARITY-LINEAR-TERM.
      rel = "src/systems/SystemsLean/HostFrontLiveParityLinearTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveParityLinearTermSource"
        "PARSE-LIVE-PARITY-LINEAR-TERM"
        "liveParityLinearTermSource"
        "HOST-FRONT-LIVE-PARITY-LINEAR-TERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK ParityLinearTerm kernel path (live
      # HostModuleCheckParityLinearTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckParityLinearTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckParityLinearTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckParityLinearTerm-only"
        "checkParityLinearTermKernel"
        "hostModuleCheckParityLinearTermKernelOk"
        "hostModuleCheckLiveParityLinearTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveParityLinearTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
