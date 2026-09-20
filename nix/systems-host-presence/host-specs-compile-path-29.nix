# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveEmitBodyTerm parse of live HostModuleCheckEmitBodyTerm.lean
# (not Mult fixture). Slice 25 is ParityProgramTerm/Linear. Slice 26 is
# KernelEmitTerm. Slice 27 is ParityTypesTerm. Slice 28 is ParityLinearTerm.
# This slice is 29 (EmitBodyTerm). Do not steal 25-28 dest rows.
# No bash, no Python.
{
  hostSpecsCompilePath29 = [
    {
      # HOST-FRONT-LIVE-EMITBODYTERM: parse live HostModuleCheckEmitBodyTerm.lean
      # (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveEmitBodyTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveEmitBodyTerm"
        "HOST-FRONT-LIVE-EMITBODYTERM"
        "SLAKE_HOST_FRONT_LIVE_EMITBODYTERM_V0"
        "PARSE-LIVE-EMITBODYTERM"
        "parseLiveEmitBodyTermSource"
        "kernelCheckLiveEmitBodyTermSource"
        "hostFrontLiveEmitBodyTermReady"
        "liveEmitBodyTermSource"
        "liveEmitBodyTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-EMITBODYTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveEmitBodyTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveEmitBodyTermMain"
        "HOST-FRONT-LIVE-EMITBODYTERM"
        "SLAKE_HOST_FRONT_LIVE_EMITBODYTERM_V0"
        "PARSE-LIVE-EMITBODYTERM"
        "parseLiveEmitBodyTermSource"
        "kernelCheckLiveEmitBodyTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-EMITBODYTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveEmitBodyTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveEmitBodyTermSource"
        "PARSE-LIVE-EMITBODYTERM"
        "liveEmitBodyTermSource"
        "HOST-FRONT-LIVE-EMITBODYTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK EmitBodyTerm kernel path (live
      # HostModuleCheckEmitBodyTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckEmitBodyTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckEmitBodyTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostModuleCheckEmitBodyTerm-only"
        "checkKernelEmitBodyTermKernel"
        "hostModuleCheckEmitBodyTermKernelOk"
        "hostModuleCheckLiveEmitBodyTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveEmitBodyTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
