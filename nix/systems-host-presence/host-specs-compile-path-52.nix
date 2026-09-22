# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveLinearUseFailDecide
# parse of live LinearUseFail/Decide.lean plus SlakeTypecheckLinearUseFailDecide driver.
# HostFrontLiveLinearUseFail is a prefix of HostFrontLiveLinearUseFailDecide. Unique
# needles with trailing newline. File-path needles end .lean so
# HostFrontLiveLinearUseFailDecide.lean is not a prefix of Main / Source.
# Do not edit slice 51 (HostFrontLiveJoinMapTheorems dests).
# Do not edit DualResidual or SpecProof wrap files.
# No bash, no Python.
{
  hostSpecsCompilePath52 = [
    {
      # HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE: parse live LinearUseFail/Decide.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckCompilePathTerm).
      # Unique needles with trailing newline; HostFrontLiveLinearUseFail is a
      # prefix of HostFrontLiveLinearUseFailDecide.
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailDecide.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailDecide\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE"
        "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_DECIDE_V0"
        "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE"
        "parseLiveLinearUseFailDecideSource"
        "kernelCheckLiveLinearUseFailDecideSource"
        "hostFrontLiveLinearUseFailDecideReady"
        "liveLinearUseFailDecideSource"
        "liveLinearUseFailDecideRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-LINEAR-USE-FAIL-DECIDE. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailDecideMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailDecideMain\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE"
        "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_DECIDE_V0"
        "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE"
        "parseLiveLinearUseFailDecideSource"
        "kernelCheckLiveLinearUseFailDecideSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-LINEAR-USE-FAIL-DECIDE (Decide.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveLinearUseFailDecideSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveLinearUseFailDecideSource\n"
        "HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE"
        "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE"
        "liveLinearUseFailDecideSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-DECIDE named driver; Ready is
      # HostFrontLiveLinearUseFailDecide parse plus kernelCheck of live
      # LinearUseFail/Decide.lean, not := true.
      # Unique needles with trailing newline; HostFrontLiveLinearUseFail is a
      # prefix of HostFrontLiveLinearUseFailDecide.
      rel = "src/systems/SystemsLean/SlakeTypecheckLinearUseFailDecide.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckLinearUseFailDecide\n"
        "SLAKE_TYPECHECK_LINEAR_USE_FAIL_DECIDE_V0"
        "HOST-SLAKE-TYPECHECK-LINEAR-USE-FAIL-DECIDE"
        "slake-typecheck-linearusefaildecide"
        "slakeTypecheckLinearUseFailDecideReady"
        "kernelCheckLiveLinearUseFailDecideSource"
        "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE"
        "slakeTypecheckLinearUseFailDecideDoesNotUseLake"
        "slakeTypecheckLinearUseFailDecideFullHost"
        "slakeTypecheckLinearUseFailDecideOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-LINEAR-USE-FAIL-DECIDE plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: HostFrontLiveLinearUseFail is a prefix of
      # HostFrontLiveLinearUseFailDecide.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveLinearUseFailDecide\n"
        "import SystemsLean.SlakeTypecheckLinearUseFailDecide\n"
      ];
    }
  ];
}
