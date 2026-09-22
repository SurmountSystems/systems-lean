# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveLinearUseFailKeep
# parse of live LinearUseFail/Keep.lean plus SlakeTypecheckLinearUseFailKeep driver.
# HostFrontLiveLinearUseFail is a prefix of HostFrontLiveLinearUseFailKeep. Unique
# needles with trailing newline. File-path needles end .lean so
# HostFrontLiveLinearUseFailKeep.lean is not a prefix of Main / Source.
# Do not edit slice 52 (HostFrontLiveLinearUseFailDecide dests).
# Do not edit DualResidual or SpecProof wrap files.
# Not Linear.lean. Not LinearUseFail.lean. Not LinearUseFail/Decide.lean.
# No bash, no Python.
{
  hostSpecsCompilePath53 = [
    {
      # HOST-FRONT-LIVE-LINEAR-USE-FAIL-KEEP: parse live LinearUseFail/Keep.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckCompilePathTerm).
      # Unique needles with trailing newline; HostFrontLiveLinearUseFail is a
      # prefix of HostFrontLiveLinearUseFailKeep.
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailKeep.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailKeep\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-KEEP"
        "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_KEEP_V0"
        "PARSE-LIVE-LINEAR-USE-FAIL-KEEP"
        "parseLiveLinearUseFailKeepSource"
        "kernelCheckLiveLinearUseFailKeepSource"
        "hostFrontLiveLinearUseFailKeepReady"
        "liveLinearUseFailKeepSource"
        "liveLinearUseFailKeepRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-LINEAR-USE-FAIL-KEEP. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailKeepMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailKeepMain\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-KEEP"
        "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_KEEP_V0"
        "PARSE-LIVE-LINEAR-USE-FAIL-KEEP"
        "parseLiveLinearUseFailKeepSource"
        "kernelCheckLiveLinearUseFailKeepSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-LINEAR-USE-FAIL-KEEP (Keep.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailKeepSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailKeepSource\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-KEEP"
        "PARSE-LIVE-LINEAR-USE-FAIL-KEEP"
        "liveLinearUseFailKeepSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-KEEP named driver; Ready is
      # HostFrontLiveLinearUseFailKeep parse plus kernelCheck of live
      # LinearUseFail/Keep.lean, not := true.
      # Unique needles with trailing newline; HostFrontLiveLinearUseFail is a
      # prefix of HostFrontLiveLinearUseFailKeep.
      rel = "src/systems/SystemsLean/SlakeTypecheckLinearUseFailKeep.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckLinearUseFailKeep\n"
        "SLAKE_TYPECHECK_LINEAR_USE_FAIL_KEEP_V0"
        "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-KEEP"
        "slake-typecheck-linearusefailkeep"
        "slakeTypecheckLinearUseFailKeepReady"
        "kernelCheckLiveLinearUseFailKeepSource"
        "PARSE-LIVE-LINEAR-USE-FAIL-KEEP"
        "slakeTypecheckLinearUseFailKeepDoesNotUseLake"
        "slakeTypecheckLinearUseFailKeepFullHost"
        "slakeTypecheckLinearUseFailKeepOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-LINEAR-USE-FAIL-KEEP plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: HostFrontLiveLinearUseFail is a prefix of
      # HostFrontLiveLinearUseFailKeep.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveLinearUseFailKeep\n"
        "import SystemsLean.SlakeTypecheckLinearUseFailKeep\n"
      ];
    }
  ];
}
