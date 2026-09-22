# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveHostKernel
# parse of live HostKernel.lean plus SlakeTypecheckHostKernel driver.
# HostKernel is a prefix of HostKernelTerm. Unique needles with trailing newline.
# File-path needles end .lean so HostFrontLiveHostKernel.lean is not a prefix
# of Main / Source.
# Do not edit slice 48 (HostFrontLiveKernelMult dests).
# Do not edit slice 49 (HostFrontLiveCompilePath dests).
# No bash, no Python.
{
  hostSpecsCompilePath50 = [
    {
      # HOST-FRONT-LIVE-HOSTKERNEL: parse live HostKernel.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckCompilePathTerm).
      # Unique needles with trailing newline; HostKernel is a prefix of HostKernelTerm.
      rel = "src/systems/SystemsLean/HostFrontLiveHostKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostKernel\n"
        "HOST-FRONT-LIVE-HOSTKERNEL"
        "SLAKE_HOST_FRONT_LIVE_HOSTKERNEL_V0"
        "PARSE-LIVE-HOSTKERNEL"
        "parseLiveHostKernelSource"
        "kernelCheckLiveHostKernelSource"
        "hostFrontLiveHostKernelReady"
        "liveHostKernelSource"
        "liveHostKernelRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-HOSTKERNEL. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveHostKernelMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostKernelMain\n"
        "HOST-FRONT-LIVE-HOSTKERNEL"
        "SLAKE_HOST_FRONT_LIVE_HOSTKERNEL_V0"
        "PARSE-LIVE-HOSTKERNEL"
        "parseLiveHostKernelSource"
        "kernelCheckLiveHostKernelSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-HOSTKERNEL (HostKernel.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveHostKernelSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveHostKernelSource\n"
        "HOST-FRONT-LIVE-HOSTKERNEL"
        "PARSE-LIVE-HOSTKERNEL"
        "liveHostKernelSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-HOSTKERNEL named driver; Ready is
      # HostFrontLiveHostKernel parse plus kernelCheck of live
      # HostKernel.lean, not := true.
      # Unique needles with trailing newline; HostKernel is a prefix of HostKernelTerm.
      rel = "src/systems/SystemsLean/SlakeTypecheckHostKernel.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckHostKernel\n"
        "SLAKE_TYPECHECK_HOSTKERNEL_V0"
        "HOST-SLAKE-TYPECHECK-HOSTKERNEL"
        "slake-typecheck-hostkernel"
        "slakeTypecheckHostKernelReady"
        "kernelCheckLiveHostKernelSource"
        "PARSE-LIVE-HOSTKERNEL"
        "slakeTypecheckHostKernelDoesNotUseLake"
        "slakeTypecheckHostKernelFullHost"
        "slakeTypecheckHostKernelOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-HOSTKERNEL plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: HostKernel is a prefix of HostKernelTerm.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveHostKernel\n"
        "import SystemsLean.SlakeTypecheckHostKernel\n"
      ];
    }
  ];
}
