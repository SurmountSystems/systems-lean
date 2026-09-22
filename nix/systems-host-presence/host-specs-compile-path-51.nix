# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until files and barrel imports. Named HostFrontLiveJoinMapTheorems
# parse of live JoinMapTheorems.lean plus SlakeTypecheckJoinMapTheorems driver.
# HostFrontLiveJoinMap is a prefix of HostFrontLiveJoinMapTheorems. Unique needles
# with trailing newline. File-path needles end .lean so
# HostFrontLiveJoinMapTheorems.lean is not a prefix of Main / Source.
# Do not edit slice 49 (HostFrontLiveCompilePath dests).
# Do not edit slice 50 (HostFrontLiveHostKernel dests).
# No bash, no Python.
{
  hostSpecsCompilePath51 = [
    {
      # HOST-FRONT-LIVE-JOIN-MAP-THEOREMS: parse live JoinMapTheorems.lean
      # (not HostTerm.multFixtureModule, not HostModuleCheckCompilePathTerm).
      # Unique needles with trailing newline; HostFrontLiveJoinMap is a prefix
      # of HostFrontLiveJoinMapTheorems.
      rel = "src/systems/SystemsLean/HostFrontLiveJoinMapTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveJoinMapTheorems\n"
        "HOST-FRONT-LIVE-JOIN-MAP-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0"
        "PARSE-LIVE-JOIN-MAP-THEOREMS"
        "parseLiveJoinMapTheoremsSource"
        "kernelCheckLiveJoinMapTheoremsSource"
        "hostFrontLiveJoinMapTheoremsReady"
        "liveJoinMapTheoremsSource"
        "liveJoinMapTheoremsRel"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not FullHost"
        "liveParseDoesNotUseMultFixture"
      ];
    }
    {
      # Thin driver for PARSE-LIVE-JOIN-MAP-THEOREMS. Not mill 70.
      rel = "src/systems/SystemsLean/HostFrontLiveJoinMapTheoremsMain.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveJoinMapTheoremsMain\n"
        "HOST-FRONT-LIVE-JOIN-MAP-THEOREMS"
        "SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0"
        "PARSE-LIVE-JOIN-MAP-THEOREMS"
        "parseLiveJoinMapTheoremsSource"
        "kernelCheckLiveJoinMapTheoremsSource"
        "Not FullHost"
      ];
    }
    {
      # Dual-pin bytes for PARSE-LIVE-JOIN-MAP-THEOREMS (JoinMapTheorems.lean, not Term).
      rel = "src/systems/SystemsLean/HostFrontLiveJoinMapTheoremsSource.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.HostFrontLiveJoinMapTheoremsSource\n"
        "HOST-FRONT-LIVE-JOIN-MAP-THEOREMS"
        "PARSE-LIVE-JOIN-MAP-THEOREMS"
        "liveJoinMapTheoremsSource"
        "UNIT_SURFACE"
        "Not FullHost"
      ];
    }
    {
      # HOST-SLAKE-TYPECHECK-JOIN-MAP-THEOREMS named driver; Ready is
      # HostFrontLiveJoinMapTheorems parse plus kernelCheck of live
      # JoinMapTheorems.lean, not := true.
      # Unique needles with trailing newline; HostFrontLiveJoinMap is a prefix
      # of HostFrontLiveJoinMapTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckJoinMapTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckJoinMapTheorems\n"
        "SLAKE_TYPECHECK_JOIN_MAP_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-JOIN-MAP-THEOREMS"
        "slake-typecheck-joinmaptheorems"
        "slakeTypecheckJoinMapTheoremsReady"
        "kernelCheckLiveJoinMapTheoremsSource"
        "PARSE-LIVE-JOIN-MAP-THEOREMS"
        "slakeTypecheckJoinMapTheoremsDoesNotUseLake"
        "slakeTypecheckJoinMapTheoremsFullHost"
        "slakeTypecheckJoinMapTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for PARSE-LIVE-JOIN-MAP-THEOREMS plus named driver.
      # Missing-token red until SystemsLean.lean imports these modules.
      # Trailing newline: HostFrontLiveJoinMap is a prefix of
      # HostFrontLiveJoinMapTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.HostFrontLiveJoinMapTheorems\n"
        "import SystemsLean.SlakeTypecheckJoinMapTheorems\n"
      ];
    }
  ];
}
