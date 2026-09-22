# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveCompilePath
# parse of live CompilePath.lean plus SlakeTypecheckCompilePath driver.
# CompilePath is a prefix of CompilePathTerm / CompilePathMult. Unique needles
# with trailing newline. File-path needles end .lean so
# HostFrontLiveCompilePath.lean is not a prefix of Main / Source.
# Do not edit slice 48 (HostFrontLiveKernelMult dests).
# No bash, no Python.
{
  hostSpecsCompilePath49 = [
    {
      # HOST-FRONT-LIVE-COMPILEPATH: parse live CompilePath.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckCompilePathTerm).
      # Unique needles with trailing newline; CompilePath is a prefix of CompilePathTerm.
      rel = "src/systems/SystemsLean/HostFrontLiveCompilePath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCompilePath\n"
        "HOST-FRONT-LIVE-COMPILEPATH"
        "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0"
        "PARSE-LIVE-COMPILEPATH"
        "parseLiveCompilePathSource"
        "kernelCheckLiveCompilePathSource"
        "hostFrontLiveCompilePathReady"
        "liveCompilePathSource"
        "liveCompilePathRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-COMPILEPATH. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveCompilePathMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCompilePathMain\n"
        "HOST-FRONT-LIVE-COMPILEPATH"
        "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0"
        "PARSE-LIVE-COMPILEPATH"
        "parseLiveCompilePathSource"
        "kernelCheckLiveCompilePathSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-COMPILEPATH (CompilePath.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveCompilePathSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveCompilePathSource\n"
        "HOST-FRONT-LIVE-COMPILEPATH"
        "PARSE-LIVE-COMPILEPATH"
        "liveCompilePathSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-COMPILEPATH named driver; Ready is
      # HostFrontLiveCompilePath parse plus kernelCheck of live
      # CompilePath.lean, not := true.
      # Unique needles with trailing newline; CompilePath is a prefix of CompilePathTerm.
      rel = "src/systems/SystemsLean/SlakeTypecheckCompilePath.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckCompilePath\n"
        "SLAKE_TYPECHECK_COMPILEPATH_V0"
        "HOST-SLAKE-TYPECHECK-COMPILEPATH"
        "slake-typecheck-compilepath"
        "slakeTypecheckCompilePathReady"
        "kernelCheckLiveCompilePathSource"
        "PARSE-LIVE-COMPILEPATH"
        "slakeTypecheckCompilePathDoesNotUseLake"
        "slakeTypecheckCompilePathFullHost"
        "slakeTypecheckCompilePathOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-COMPILEPATH plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: CompilePath is a prefix of CompilePathTerm.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveCompilePath\n"
        "import SystemsLean.SlakeTypecheckCompilePath\n"
      ];
    }
  ];
}
