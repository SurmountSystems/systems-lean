# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCompilePath). Joined by parent. Sub-1-KLOC.
# Dest-missing red until barrel import. Named SlakeTypecheckErasureTheorems driver.
# Erasure is a prefix of ErasureTheorems. Unique needles with trailing newline.
# Do not edit slice 37 (SlakeTypecheckErasure dests without trailing newline).
# Do not edit slice 45 (SlakeTypecheckTypesTheorems dests).
# No bash, no Python.
{
  hostSpecsCompilePath46 = [
    {
      # HOST-SLAKE-TYPECHECK-ERASURE-THEOREMS named driver; Ready is
      # HostFrontLiveErasureTheorems parse plus kernelCheck of live
      # ErasureTheorems.lean, not := true.
      # Unique needles with trailing newline; Erasure is a prefix of ErasureTheorems.
      rel = "src/systems/SystemsLean/SlakeTypecheckErasureTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SystemsLean.SlakeTypecheckErasureTheorems\n"
        "SLAKE_TYPECHECK_ERASURE_THEOREMS_V0"
        "HOST-SLAKE-TYPECHECK-ERASURE-THEOREMS"
        "slake-typecheck-erasuretheorems"
        "slakeTypecheckErasureTheoremsReady"
        "kernelCheckLiveErasureTheoremsSource"
        "PARSE-LIVE-ERASURE-THEOREMS"
        "slakeTypecheckErasureTheoremsDoesNotUseLake"
        "slakeTypecheckErasureTheoremsFullHost"
        "slakeTypecheckErasureTheoremsOwnsPackageTypecheck"
        "Not FullHost"
        "slakeOwnsPackageTypecheck stays false"
        "Mill stays 69 of 69"
        "Not Lake-gone"
        "SKELETON"
      ];
    }
    {
      # Barrel dest for named Slake typecheck ErasureTheorems driver.
      # Missing-token red until SystemsLean.lean imports this module.
      # Trailing newline: Erasure is a prefix of ErasureTheorems.
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.SlakeTypecheckErasureTheorems\n"
      ];
    }
  ];
}
