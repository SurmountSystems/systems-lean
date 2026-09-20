# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostFrontLiveIrProgramTheorems parse of live IrProgramTheorems.lean
# (not IrProgram fixture, not HostFrontLiveIrProgram).
# No bash, no Python.
{
  hostSpecsCompilePath34 = [
    {
      # HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS: parse live
      # IrProgramTheorems.lean (not HostTerm.multFixtureModule, not
      # IrProgram.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveIrProgramTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveIrProgramTheorems"
        "HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0"
        "PARSE-LIVE-IR-PROGRAM-THEOREMS"
        "parseLiveIrProgramTheoremsSource"
        "kernelCheckLiveIrProgramTheoremsSource"
        "hostFrontLiveIrProgramTheoremsReady"
        "liveIrProgramTheoremsSource"
        "liveIrProgramTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IR-PROGRAM-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveIrProgramTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveIrProgramTheoremsMain"
        "HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0"
        "PARSE-LIVE-IR-PROGRAM-THEOREMS"
        "parseLiveIrProgramTheoremsSource"
        "kernelCheckLiveIrProgramTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-IR-PROGRAM-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveIrProgramTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveIrProgramTheoremsSource"
        "HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS"
        "PARSE-LIVE-IR-PROGRAM-THEOREMS"
        "liveIrProgramTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK IrProgramTheorems kernel path (live
      # IrProgramTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckIrProgramTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckIrProgramTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "IrProgramTheorems-only"
        "checkIrProgramTheoremsKernel"
        "hostModuleCheckIrProgramTheoremsKernelOk"
        "hostModuleCheckLiveIrProgramTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveIrProgramTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-IR-PROGRAM-THEOREMS. Missing-token red
      # until SystemsLean.lean imports these modules.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveIrProgramTheorems"
        "import SystemsLean.HostModuleCheckIrProgramTheoremsKernel"
      ];
    }
  ];
}
