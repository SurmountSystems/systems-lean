# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# HostKernel + HostModuleCheck Mult kernel-check (not leftover isolation-test).
# No bash, no Python.
{
  hostSpecsCompilePath5 = [
    {
      # HOST-KERNEL: Mult-first kernel typecheck of HostTerm modules.
      rel = "src/systems/SystemsLean/HostKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostKernel"
        "HOST-KERNEL"
        "SLAKE_HOST_KERNEL"
        "SLAKE_HOST_KERNEL_V0"
        "KERNEL-CHECK"
        "kernelCheck"
        "kernelCheckMultFixture"
        "kernelRejectIllTypedName"
        "kernelRejectIllTypedIsValid"
        "kernelRejectIllTypedApp"
        "hostKernelReady"
        "import SystemsLean.HostTerm"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "MULT-0"
      ];
    }
    {
      # HOST-MODULE-CHECK Mult kernel path (SystemsLean.Mult via HostKernel).
      rel = "src/systems/SystemsLean/HostModuleCheckMultKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckMultKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "Mult-only"
        "checkMultKernel"
        "refineMultWithKernel"
        "hostModuleCheckMultKernelOk"
        "hostModuleCheckMultKernelDualOk"
        "checkDepthMultKernelBar"
        "HostModuleCheckMultKernel"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFront"
        "PARTIAL-STRUCTURAL"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-FRONT-LIVE-MULT: parse live Mult.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveMult"
        "HOST-FRONT-LIVE-MULT"
        "SLAKE_HOST_FRONT_LIVE_MULT_V0"
        "PARSE-LIVE-MULT"
        "parseLiveMultSource"
        "kernelCheckLiveMultSource"
        "hostFrontLiveMultReady"
        "UNIT_SURFACE"
        "MULT-0"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-TYPES: parse live Types.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveTypes"
        "HOST-FRONT-LIVE-TYPES"
        "SLAKE_HOST_FRONT_LIVE_TYPES_V0"
        "PARSE-LIVE-TYPES"
        "parseLiveTypesSource"
        "kernelCheckLiveTypesSource"
        "hostFrontLiveTypesReady"
        "liveTypesSource"
        "liveTypesRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-TYPES. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveTypesMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveTypesMain"
        "HOST-FRONT-LIVE-TYPES"
        "SLAKE_HOST_FRONT_LIVE_TYPES_V0"
        "PARSE-LIVE-TYPES"
        "parseLiveTypesSource"
        "kernelCheckLiveTypesSource"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK Types kernel path (live Types.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckTypesKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckTypesKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "Types-only"
        "checkTypesKernel"
        "hostModuleCheckTypesKernelOk"
        "hostModuleCheckLiveTypesParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveTypes"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-ERASURE: parse live Erasure.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveErasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveErasure"
        "HOST-FRONT-LIVE-ERASURE"
        "SLAKE_HOST_FRONT_LIVE_ERASURE_V0"
        "PARSE-LIVE-ERASURE"
        "parseLiveErasureSource"
        "kernelCheckLiveErasureSource"
        "hostFrontLiveErasureReady"
        "liveErasureSource"
        "liveErasureRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-ERASURE. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveErasureMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveErasureMain"
        "HOST-FRONT-LIVE-ERASURE"
        "SLAKE_HOST_FRONT_LIVE_ERASURE_V0"
        "PARSE-LIVE-ERASURE"
        "parseLiveErasureSource"
        "kernelCheckLiveErasureSource"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK Erasure kernel path (live Erasure.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckErasureKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckErasureKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "Erasure-only"
        "checkErasureKernel"
        "hostModuleCheckErasureKernelOk"
        "hostModuleCheckLiveErasureParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveErasure"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-EXTRACT: parse live Extract.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveExtract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveExtract"
        "HOST-FRONT-LIVE-EXTRACT"
        "SLAKE_HOST_FRONT_LIVE_EXTRACT_V0"
        "PARSE-LIVE-EXTRACT"
        "parseLiveExtractSource"
        "kernelCheckLiveExtractSource"
        "hostFrontLiveExtractReady"
        "liveExtractSource"
        "liveExtractRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-EXTRACT. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveExtractMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveExtractMain"
        "HOST-FRONT-LIVE-EXTRACT"
        "SLAKE_HOST_FRONT_LIVE_EXTRACT_V0"
        "PARSE-LIVE-EXTRACT"
        "parseLiveExtractSource"
        "kernelCheckLiveExtractSource"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK Extract kernel path (live Extract.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckExtractKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckExtractKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "Extract-only"
        "checkExtractKernel"
        "hostModuleCheckExtractKernelOk"
        "hostModuleCheckLiveExtractParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveExtract"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-HOSTTERM: parse live HostTerm.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveHostTerm.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostTerm"
        "HOST-FRONT-LIVE-HOSTTERM"
        "SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0"
        "PARSE-LIVE-HOSTTERM"
        "parseLiveHostTermSource"
        "kernelCheckLiveHostTermSource"
        "hostFrontLiveHostTermReady"
        "liveHostTermSource"
        "liveHostTermRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-HOSTTERM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveHostTermMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostTermMain"
        "HOST-FRONT-LIVE-HOSTTERM"
        "SLAKE_HOST_FRONT_LIVE_HOSTTERM_V0"
        "PARSE-LIVE-HOSTTERM"
        "parseLiveHostTermSource"
        "kernelCheckLiveHostTermSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-HOSTTERM.
      rel = "src/systems/SystemsLean/HostFrontLiveHostTermSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostTermSource"
        "PARSE-LIVE-HOSTTERM"
        "liveHostTermSource"
        "HOST-FRONT-LIVE-HOSTTERM"
        "UNIT_SURFACE"
        "Not FullHost"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-MODULE-CHECK HostTerm kernel path (live HostTerm.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckHostTermKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckHostTermKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostTerm-only"
        "checkHostTermKernel"
        "hostModuleCheckHostTermKernelOk"
        "hostModuleCheckLiveHostTermParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveHostTerm"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-IR-PROGRAM: parse live IrProgram.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveIrProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveIrProgram"
        "HOST-FRONT-LIVE-IR-PROGRAM"
        "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0"
        "PARSE-LIVE-IR-PROGRAM"
        "parseLiveIrProgramSource"
        "kernelCheckLiveIrProgramSource"
        "hostFrontLiveIrProgramReady"
        "liveIrProgramSource"
        "liveIrProgramRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-IR-PROGRAM. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveIrProgramMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveIrProgramMain"
        "HOST-FRONT-LIVE-IR-PROGRAM"
        "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0"
        "PARSE-LIVE-IR-PROGRAM"
        "parseLiveIrProgramSource"
        "kernelCheckLiveIrProgramSource"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK IrProgram kernel path (live IrProgram.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckIrProgramKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckIrProgramKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "IrProgram-only"
        "checkIrProgramKernel"
        "hostModuleCheckIrProgramKernelOk"
        "hostModuleCheckLiveIrProgramParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveIrProgram"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-GOLDENS: parse live HostFrontGoldens.lean (not HostTerm.multFixtureModule).
      rel = "src/systems/SystemsLean/HostFrontLiveGoldens.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGoldens"
        "HOST-FRONT-LIVE-GOLDENS"
        "SLAKE_HOST_FRONT_LIVE_GOLDENS_V0"
        "PARSE-LIVE-GOLDENS"
        "parseLiveGoldensSource"
        "kernelCheckLiveGoldensSource"
        "hostFrontLiveGoldensReady"
        "liveGoldensSource"
        "liveGoldensRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-GOLDENS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveGoldensMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGoldensMain"
        "HOST-FRONT-LIVE-GOLDENS"
        "SLAKE_HOST_FRONT_LIVE_GOLDENS_V0"
        "PARSE-LIVE-GOLDENS"
        "parseLiveGoldensSource"
        "kernelCheckLiveGoldensSource"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK Goldens kernel path (live HostFrontGoldens.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckGoldensKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckGoldensKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "Goldens-only"
        "checkGoldensKernel"
        "hostModuleCheckGoldensKernelOk"
        "hostModuleCheckLiveGoldensParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveGoldens"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-FRONT-THEOREMS: parse live HostFrontTheorems.lean
      # (not HostTerm.multFixtureModule, not HostFront.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveFrontTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFrontTheorems"
        "HOST-FRONT-LIVE-FRONT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0"
        "PARSE-LIVE-FRONT-THEOREMS"
        "parseLiveFrontTheoremsSource"
        "kernelCheckLiveFrontTheoremsSource"
        "hostFrontLiveFrontTheoremsReady"
        "liveFrontTheoremsSource"
        "liveFrontTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-FRONT-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveFrontTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFrontTheoremsMain"
        "HOST-FRONT-LIVE-FRONT-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0"
        "PARSE-LIVE-FRONT-THEOREMS"
        "parseLiveFrontTheoremsSource"
        "kernelCheckLiveFrontTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-FRONT-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveFrontTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveFrontTheoremsSource"
        "HOST-FRONT-LIVE-FRONT-THEOREMS"
        "PARSE-LIVE-FRONT-THEOREMS"
        "liveFrontTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK FrontTheorems kernel path (live
      # HostFrontTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckFrontTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckFrontTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "FrontTheorems-only"
        "checkFrontTheoremsKernel"
        "hostModuleCheckFrontTheoremsKernelOk"
        "hostModuleCheckLiveFrontTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveFrontTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
    {
      # HOST-FRONT-LIVE-GRAPH-THEOREMS: parse live HostGraphTheorems.lean
      # (not HostTerm.multFixtureModule, not HostGraph.lean live parse).
      rel = "src/systems/SystemsLean/HostFrontLiveGraphTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraphTheorems"
        "HOST-FRONT-LIVE-GRAPH-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0"
        "PARSE-LIVE-GRAPH-THEOREMS"
        "parseLiveGraphTheoremsSource"
        "kernelCheckLiveGraphTheoremsSource"
        "hostFrontLiveGraphTheoremsReady"
        "liveGraphTheoremsSource"
        "liveGraphTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-GRAPH-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveGraphTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraphTheoremsMain"
        "HOST-FRONT-LIVE-GRAPH-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0"
        "PARSE-LIVE-GRAPH-THEOREMS"
        "parseLiveGraphTheoremsSource"
        "kernelCheckLiveGraphTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-GRAPH-THEOREMS.
      rel = "src/systems/SystemsLean/HostFrontLiveGraphTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveGraphTheoremsSource"
        "HOST-FRONT-LIVE-GRAPH-THEOREMS"
        "PARSE-LIVE-GRAPH-THEOREMS"
        "liveGraphTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-MODULE-CHECK GraphTheorems kernel path (live
      # HostGraphTheorems.lean, not Mult fixture).
      rel = "src/systems/SystemsLean/HostModuleCheckGraphTheoremsKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostModuleCheckGraphTheoremsKernel"
        "HOST-MODULE-CHECK"
        "namespace SystemsLean.HostModuleCheck"
        "KERNEL-CHECK"
        "HostGraphTheorems-only"
        "checkGraphTheoremsKernel"
        "hostModuleCheckGraphTheoremsKernelOk"
        "hostModuleCheckLiveGraphTheoremsParseOk"
        "import SystemsLean.HostKernel"
        "import SystemsLean.HostFrontLiveGraphTheorems"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
      ];
    }
  ];
}
