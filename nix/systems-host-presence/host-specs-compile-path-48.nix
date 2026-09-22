# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveKernelMult
# parse of live KernelMult.lean plus SlakeTypecheckKernelMult driver.
# KernelMult is a prefix of KernelMultTerm. Unique needles with trailing newline.
# Do not edit slice 21 (HostFrontLiveKernelMultTerm dests).
# Do not edit slice 37 (SlakeTypecheckKernelMultTerm dests).
# Do not edit slice 47 (SlakeTypecheckIrProgramTheorems dests).
# No bash, no Python.
{
  hostSpecsCompilePath48 = [
    {
      # HOST-FRONT-LIVE-KERNELMULT: parse live KernelMult.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckKernelMultTerm).
      # Unique needles with trailing newline; KernelMult is a prefix of KernelMultTerm.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMult\n"
        "HOST-FRONT-LIVE-KERNELMULT"
        "SLAKE_HOST_FRONT_LIVE_KERNELMULT_V0"
        "PARSE-LIVE-KERNELMULT"
        "parseLiveKernelMultSource"
        "kernelCheckLiveKernelMultSource"
        "hostFrontLiveKernelMultReady"
        "liveKernelMultSource"
        "liveKernelMultRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-KERNELMULT. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMultMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMultMain\n"
        "HOST-FRONT-LIVE-KERNELMULT"
        "SLAKE_HOST_FRONT_LIVE_KERNELMULT_V0"
        "PARSE-LIVE-KERNELMULT"
        "parseLiveKernelMultSource"
        "kernelCheckLiveKernelMultSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-KERNELMULT (KernelMult.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveKernelMultSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveKernelMultSource\n"
        "HOST-FRONT-LIVE-KERNELMULT"
        "PARSE-LIVE-KERNELMULT"
        "liveKernelMultSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-KERNELMULT named driver; Ready is
      # HostFrontLiveKernelMult parse plus kernelCheck of live
      # KernelMult.lean, not := true.
      # Unique needles with trailing newline; KernelMult is a prefix of KernelMultTerm.
      rel = "src/systems/SystemsLean/SlakeTypecheckKernelMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckKernelMult\n"
        "SLAKE_TYPECHECK_KERNELMULT_V0"
        "HOST-SLAKE-TYPECHECK-KERNELMULT"
        "slake-typecheck-kernelmult"
        "slakeTypecheckKernelMultReady"
        "kernelCheckLiveKernelMultSource"
        "PARSE-LIVE-KERNELMULT"
        "slakeTypecheckKernelMultDoesNotUseLake"
        "slakeTypecheckKernelMultFullHost"
        "slakeTypecheckKernelMultOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-KERNELMULT plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: KernelMult is a prefix of KernelMultTerm.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveKernelMult\n"
        "import SystemsLean.SlakeTypecheckKernelMult\n"
      ];
    }
  ];
}
